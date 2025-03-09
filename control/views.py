from django.shortcuts import render,redirect
from django.contrib import messages
from registration.models import *
from management.models import *
from django.http import HttpResponseRedirect, HttpResponse
from django.http import FileResponse
from django.urls import reverse
import datetime , csv
from .models import Card
from .models import GalleryImage
from django import forms
from django.shortcuts import render, redirect, get_object_or_404
from django.core.files.storage import FileSystemStorage
from registration.models import placements
from control.models import *
from django.http import JsonResponse




def adminlogin(request):
    if request.method=="POST":
            user_name= request.POST['Username']
            pass_word= request.POST['Password']
            if (user_name=="placementcev" and pass_word=="cgpc@2025"):
                request.session['admin']=user_name
                return redirect('admininter')
            else:
                messages.info(request,"Invalid Username or password")
                return redirect('adminlogin')
    return render(request,'admlog.html')

def adminlogout(request):
    if 'admin' in request.session:
        request.session.flush()
    return redirect(adminlogin)

def admininter(request):
    if 'admin' in request.session:
        tot_drive=job.objects.all().count()
        tot_stud=student.objects.all().count()
        tot_pending=job.objects.filter(poster='NULL').count()
        placement=placements.objects.all().count()

        return render(request,'admininter.html',{"tot_drive":tot_drive,"tot_stud":tot_stud,"tot_pending":tot_pending,"placement":placement})
    return redirect(adminlogin)


def addrive(request):
    if 'admin' in request.session:
        jobs=job.objects.order_by("-d_no").all()
        return render(request,'addrive.html',{"jobs":jobs})
    return redirect(adminlogin)

# Handle form submission to update or create a Drive record
def admdrive(request, id=None):
    if 'admin' in request.session:
        if request.method == "POST":
            placement_year = request.POST.get("placement_year")
            students_attended = request.POST.get("students_attended")
            students_placed = request.POST.get("students_placed")
            students_companies = request.POST.get("students_companies")
            
            # Check if a Drive record with the selected year already exists
            existing_drive = Drive.objects.filter(year=placement_year).first()
            
            if existing_drive:
                # If the record exists, update it
                existing_drive.attended = students_attended
                existing_drive.placed = students_placed
                existing_drive.companies = students_companies
                existing_drive.save()  # Update the existing record
            else:
                # If no record exists, create a new one
                Drive.objects.create(
                    year=placement_year,
                    attended=students_attended,
                    placed=students_placed,
                    companies=students_companies
                )
        
        # Fetch all placement records to display in the table
        placements = Drive.objects.all()
        return render(request, "admdrive.html", {"placements": placements})
    
    return redirect("adminlogin")  # Redirect if not logged in as admin


def delete_placement(request, id):
    if 'admin' in request.session:
        placement = get_object_or_404(Drive, id=id)
        placement.delete()  # Delete the placement record
        return redirect('admdrive')  # Redirect to the placements page after deletion

    return redirect('adminlogin')  # Redirect if not authenticated

def get_placement_details(request, year):
    try:
        # Fetch the drive entry for the selected year
        drive = Drive.objects.get(year=year)

        # Return the attended and placed data as JSON
        return JsonResponse({
            'attended': drive.attended,
            'placed': drive.placed,
            'companies': drive.companies
        })
    except Drive.DoesNotExist:
        # Return default values if no data found for the selected year
        return JsonResponse({
            'attended': 0,
            'placed': 0,
            'companies': 0
        })
    


# Handle form submission to create a new DriveDetails record (No update of existing records)
def details_list(request):
    if 'admin' in request.session:
        if request.method == "POST":
            year = request.POST.get("year")
            cmpname = request.POST.get("cmpname")
            date = request.POST.get("date")
            attended = request.POST.get("attended")
            placed = request.POST.get("placed")

            # Only create a new entry, do not update existing data
            DriveDetails.objects.create(
                year=year,
                cmpname=cmpname,
                date=date,
                attended=attended,
                placed=placed
            )

        # Fetch all records to display in the table
        details = DriveDetails.objects.all()
        return render(request, "admdriveadd.html", {"details": details})

    return redirect("adminlogin")  # Redirect if not logged in as admin

# Handle deletion of a DriveDetails record
def delete_details(request, id):
    if 'admin' in request.session:
        details = get_object_or_404(DriveDetails, id=id)
        details.delete()  # Delete the record
        return redirect('details_list')  # Redirect after deletion

    return redirect('adminlogin')  # Redirect if not authenticated

# Fetch placement details based on the selected year
def get_details(request, year):
    # Fetch details for the selected year
    details = DriveDetails.objects.filter(year=year).first()

    if details:
        return JsonResponse({
            "cmpname": details.cmpname,
            "date": details.date.strftime("%Y-%m-%d"),
            "attended": details.attended,
            "placed": details.placed,
        })
    else:
        return JsonResponse({})  # Return an empty JSON object if no data is found



def moreinfo(request,id):
    if 'admin' in request.session:
      info=job.objects.get(d_no=id)
      return render(request,'moreinfo.html',{"info":info})
    return redirect(adminlogin)

def adminposterview(request,dno):
    if 'admin' in request.session:
        livedrives=job.objects.get(d_no=dno)
        if livedrives.poster == "NULL":
            messages.info(request,"No Poster Uploaded")
            return redirect('moreinfo',dno)
        else:
            posterpath=livedrives.poster.path
            return FileResponse(open(posterpath,'rb'))



# View to handle placing the student
def placed(request, ad_no, d_no):
    if request.method == 'POST':
        # Get the student and job instances based on ad_no and d_no
        student_instance = get_object_or_404(student, ad_no=ad_no)
        job_instance = get_object_or_404(job, d_no=d_no)

        # Create a new record in the 'placements' table (registration.placements model)
        new_placement = placements(ad_no=student_instance, d_no=job_instance)
        new_placement.save()

        # Optionally, update the student's placement status
        student_instance.placement_done = True
        student_instance.save()

        # Show a success message
        messages.success(request, f"{student_instance.name} has been successfully placed in {job_instance.c_name}.")

        # Redirect back to the same page (referring URL)
        return redirect(request.META.get('HTTP_REFERER'))  # This will redirect to the current page

    return render(request, 'error.html')  # Handle if method is not POST    

def drivecontentadm(request):
   
        if request.method=="POST":
            d_no = request.POST['drivenumber']
            j_pos = request.POST['jobposition']
            c_name = request.POST['companyname']
            l_date = request.POST['lastdate']
            j_dis = request.POST['jobdescription']
            req_s = request.POST['requiredskill']
            qual = request.POST['qualification']
            sal = request.POST['salary']
            link = request.POST['link']
            program=request.POST['program']

            j = job(d_no=d_no,j_pos=j_pos,c_name=c_name,l_date=l_date,
            j_dis=j_dis,req_s=req_s,qual=qual,sal=sal,link=link,program=program)

            j.save()

        jobs = job.objects.order_by("-d_no").all()
        try:
            driveno=int(jobs[0].d_no)+1
        except IndexError:
            driveno=1
        return render(request,'drive-contentadm.html',{'jobs':jobs,'driveno':driveno})

def delete_drive(request, drive_id):
    if 'ad_no' in request.session:  # Ensure admin is logged in
        drive = get_object_or_404(job, d_no=drive_id)  # Fetch job object
        drive.delete()
        messages.success(request, "Drive deleted successfully!")
        return redirect('drivecontentadm')  # Redirect to drivecontent page

    return redirect('adminlogin')  # Redirect to login if session not found    

def drivelistexcel(request):
    jobs = job.objects.order_by("-d_no").all()
    
    response = HttpResponse(
        content_type="text/csv",
        headers={"Content-Disposition": 'attachment; filename="drive_list.csv"'},
    )
    
    writer = csv.writer(response)
    writer.writerow(["Drive Number", "Company Name", "Job Position", "Salary", "Last Date"])
    
    for j in jobs:
        writer.writerow([j.d_no, j.c_name, j.j_pos, j.sal, j.l_date])
    
    return response

def eventcontentadm(request):
    
    if request.method == "POST":
            e_id = request.POST['eventid']
            e_name = request.POST['eventname']
            topic = request.POST['topic']
            dep = request.POST['department']
            company = request.POST['company']
            date = request.POST['date']
            date_to = request.POST['date_to']
            time = request.POST['time']
            l_date = request.POST['lastdate']
            venue = request.POST['Venue']
            fee = request.POST['Fee']

            e = event(
                e_id=e_id,
                e_name=e_name,
                topic=topic,
                dep=dep,
                company=company,
                date=date,
                date_to=date_to,
                time=time,
                l_date=l_date,
                venue=venue,
                fee=fee
            )
            e.save()
    
    events = event.objects.order_by("-e_id").all()
    try:
        eno=int(events[0].e_id)+1
    except IndexError:
        eno=1
    return render(request,'event-contentadm.html',{'events':events,"eno":eno})
  
def delete_event(request, event_id):
    event_obj = get_object_or_404(event, e_id=event_id)  # Avoid conflict
    event_obj.delete()
    messages.success(request, "Event deleted successfully!")
    return redirect('/eventcontentadm')



def posteruploadadm(request):
    if request.method == "POST":
        try:
            d_no = request.POST['d_no']
            poster = request.FILES['poster']

            # Fetch the job and update the poster if valid
            jobs = job.objects.get(d_no=d_no, poster='NULL')
            jobs.poster = poster
            jobs.save()
        except job.DoesNotExist:
            messages.info(request, "Invalid drive number or poster already uploaded")

    # Retrieve all jobs where a poster has been uploaded
    posteruploaded = job.objects.order_by("-d_no").exclude(poster='NULL')

    # Render the admin poster upload template
    return render(request, 'postersuploadadm.html', {"posteruploaded": posteruploaded})


def totalplacements(request):
    if 'admin' in request.session:
      placement=placements.objects.all()
      info=job.objects.order_by("-d_no").exclude(poster='NULL')
      details = []
      for j in info:
          row = {
              "d_no" : j.d_no,
              "l_date" : j.l_date,
              "c_name" : j.c_name
          }
          count = 0
          for aj in placement:
              if aj.d_no_id == j.d_no:
                  count+=1
          row['count'] = count
          details.append(row)
      return render(request,'adminplacements.html',{"placement":placement,"info":info,"details":details})
    return redirect(adminlogin)


def placedreport(request,dno):
    if 'admin' in request.session:
        stud=student.objects.order_by("dept").all()
        jobs=job.objects.get(d_no=dno)
        placed=placements.objects.filter(d_no=dno)
        return render(request,'ApplicantReport.html',{"stud":stud,"jobs":jobs,"placed":placed})
    return redirect(adminlogin)

# excel download function
def placedexcelview(request,dno):
    stud=student.objects.order_by("dept").all()
    jobs=job.objects.get(d_no=dno)
    placed=placements.objects.filter(d_no=dno)
    response= HttpResponse(
            content_type="text/csv",
            headers={"content-Disposition": 'attachment; filename="placedstudents.csv"'},
        )

    writer = csv.writer(response)
    writer.writerow(["Placed Students Drive No"+str(dno)+" Company "+str(jobs.c_name)])
    writer.writerow(["Register Number","Name","Department","Program","Number","E-mail"])
    for s in stud:
        for p in  placed:
            if s.ad_no == p.ad_no_id:
                writer.writerow([s.ad_no,s.name,s.dept,s.prog,s.stud_ph,s.contact.email])

    return response

def regstudents(request):
    if 'admin' in request.session:
      stud=student.objects.order_by("dept").all()
      return render(request,'adminregstudents.html',{"stud":stud})
    return redirect(adminlogin)

def regstudentsexcelview(request):
    stud=student.objects.order_by("dept").all()
    response= HttpResponse(
            content_type="text/csv",
            headers={"content-Disposition": 'attachment; filename="registredstudents.csv"'},
        )

    writer = csv.writer(response)
    writer.writerow(["Regitered Students"])
    writer.writerow(["Register Number","Name","Department","Program","Phone Number","E-mail"])
    for s in stud:
        writer.writerow([s.ad_no,s.name,s.dept,s.prog,s.stud_ph,s.contact.email])

    return response

def studinfo(request,id):
    stud=student.objects.get(ad_no=id)
    email=contact.objects.get(ad_no=id)
    jobinfo=job.objects.all()
    appliedjob=placements.objects.filter(ad_no=id)
    return render(request,'adminregstudapplicantprofile.html',{"stud":stud,"email":email,"jobinfo":jobinfo,"appliedjob":appliedjob})



def pendingtask(request):
    if 'admin' in request.session:
       return render(request,'adminpendingtask.html')
    return redirect(adminlogin)

def ongoingdrive(request):
    if 'admin' in request.session:
      jobs=job.objects.order_by("-d_no").exclude(poster='NULL')
      stud=student.objects.all()
      tot_applicant=jobs_applied.objects.all()
      details = []
      for j in jobs:
          row = {
              "d_no" : j.d_no,
              "l_date" : j.l_date,
              "c_name" : j.c_name
          }
          count = 0
          for aj in tot_applicant:
              if aj.d_no_id == j.d_no:
                  count+=1
          row['count'] = count
          details.append(row)
      return render(request,'adminongoingdrives.html',{"jobs":jobs,"stud":stud,"tot_applicant":tot_applicant,"details":details})
    return redirect(adminlogin)

def ongoingreport(request, dno):
    if 'admin' in request.session:
        stud = student.objects.all()
        jobs = job.objects.get(d_no=dno)
        applied = jobs_applied.objects.filter(d_no=dno)

        # Fetch students who are already placed in this drive
        placed_students = placements.objects.filter(d_no=dno).values_list('ad_no_id', flat=True)

        return render(request, 'ongoingreport.html', {
            "stud": stud,
            "jobs": jobs,
            "applied": applied,
            "placed_students": list(placed_students),  # Convert QuerySet to a list
        })

    return redirect('adminlogin')

def save_selection(request, dno):
    if 'admin' in request.session:
        if request.method == "POST":
            selected_students = request.POST.getlist('selected_students')  # Get checked student IDs

            # Delete all existing placements for this drive
            placements.objects.filter(d_no_id=dno).delete()

            # Insert only the selected students into placements
            for student_id in selected_students:
                placements.objects.create(ad_no_id=student_id, d_no_id=dno)

        return redirect('ongoingreport', dno=dno)  # Redirect back to the report

    return redirect('adminlogin')

def excelview(request,dno):
    stud=student.objects.all()
    jobs=job.objects.get(d_no=dno)
    applied=jobs_applied.objects.filter(d_no=dno)
    response= HttpResponse(
            content_type="text/csv",
            headers={"content-Disposition": 'attachment; filename="ongoing.csv"'},
        )

    writer = csv.writer(response)
    writer.writerow(["Drive number :"+str(jobs.d_no)])
    writer.writerow(["Register Number","Name","Department","Number","E-mail"])
    for a in applied:
        for s in stud:
            if s.ad_no == a.ad_no_id:
                writer.writerow([s.ad_no,s.name,s.dept,s.stud_ph,s.contact.email])

    return response




def techteam(request):
    if 'admin' in request.session:
       stud=student.objects.order_by("dept").filter(tech_mem=False)
       tech=student.objects.filter(tech_mem=True)
       return render(request,'Admintechteam.html',{'stud':stud,'tech':tech})
    return redirect(adminlogin)

def selectech(request,id):
    stud=student.objects.get(ad_no=id)
    stud.tech_mem=True
    stud.save()
    return  HttpResponseRedirect(reverse('techteam'))

def deletetech(request,id):
    stud=student.objects.get(ad_no=id)
    stud.tech_mem=False
    stud.save()
    return  HttpResponseRedirect(reverse('techteam'))


def adminnotification(request):
    if 'admin' in request.session:
        if request.method=="POST":
           date = datetime.date.today()
           notify = request.POST['notification']
           last_date = request.POST['last_date']

           n= notification(date=date,notify=notify,last_date=last_date)
           n.save()

        note = notification.objects.order_by("-date").all()
        return render(request,'admintechnotification.html',{"note":note})
    return redirect(adminlogin)

def notificationdeleteadmin(request,id):
    if 'admin' in request.session:
        n = notification.objects.get(id=id)
        n.delete()
        return HttpResponseRedirect(reverse('adminnotification'))
    return redirect(adminlogin)
    
    

def eventslist(request):
    if 'admin' in request.session:
        events=event.objects.all()
        stud=student.objects.all()
        tot_applicant=events_applied.objects.all()
        details = []
        for j in events:
            row = {
                "e_id" : j.e_id,
                "l_date" : j.l_date,
                "e_name" : j.e_name
            }
            count = 0
            for aj in tot_applicant:
                if aj.e_id_id == j.e_id:
                    count+=1
            row['count'] = count
            details.append(row)
        return render(request,'eventongoing.html',{"events":events,"stud":stud,"tot_applicant":tot_applicant,"details":details})
    return redirect(adminlogin)

# View to generate and download event details in Excel
def eventlistexcel(request):
    events = event.objects.order_by("-e_id").all()
    
    response = HttpResponse(
        content_type="text/csv",
        headers={"Content-Disposition": 'attachment; filename="event_list.csv"'},
    )
    
    writer = csv.writer(response)
    writer.writerow(["Drive No", "Event Name", "Topic", "Branch", "Provided By", "Date From", "Date To", "Venue", "Fee"])
    
    for e in events:
        writer.writerow([e.e_id, e.e_name, e.topic, e.dep, e.company, e.date, e.date_to, e.venue, e.fee])
    
    return response

    

def eventreport(request,eid):
    if 'admin' in request.session:
      stud=student.objects.all()
      events=event.objects.get(e_id=eid)
      applied=events_applied.objects.filter(e_id=eid)
      return render(request,'eventreport.html',{"stud":stud,"events":events,"applied":applied})
    return redirect(adminlogin)

def eventexcelview(request,eid):
    stud=student.objects.all()
    events=event.objects.get(e_id=eid)
    applied=events_applied.objects.filter(e_id=eid)
    response= HttpResponse(
            content_type="text/csv",
            headers={"content-Disposition": 'attachment; filename="eventregistration.csv"'},
        )

    writer = csv.writer(response)
    writer.writerow([str(events.e_name)+" Registration"])
    writer.writerow(["Register Number","Name","Department","Program","Number","E-mail"])
    for s in stud:
        for a in  applied:
            if s.ad_no == a.ad_no_id :
                writer.writerow([s.ad_no,s.name,s.dept,s.prog,s.stud_ph,s.contact.email])

    return response

def admgallery_view(request):
    if 'admin' in request.session:
        # Fetch all gallery images
        gallery_images = GalleryImage.objects.all()
        return render(request, 'admgallery.html', {'gallery_images': gallery_images})
    return redirect('adminlogin')

# Admin Gallery Upload Image (Handle Uploads)
def admgallery_upload_image(request):
    if 'admin' in request.session:
        if request.method == 'POST' and request.FILES.get('gallery_image'):
            gallery_image = request.FILES['gallery_image']

            # Create a new GalleryImage instance and save the uploaded image
            image = GalleryImage(image=gallery_image)
            image.save()  # Automatically saves to the folder specified in `upload_to`

            return redirect('admgallery')

        # If the method is not POST, redirect to the gallery page
        return redirect('admgallery')

    return redirect('adminlogin')

# Admin Delete Gallery Image
def admgallery_delete_image(request, image_id):
    if 'admin' in request.session:
        image = get_object_or_404(GalleryImage, id=image_id)
        image.delete()  # Delete the image
        return redirect('admgallery')  # Redirect to the gallery page
    return redirect('adminlogin')  # Redirect to the admin login if not authenticated



class ImageUploadForm(forms.ModelForm):
    class Meta:
        model = GalleryImage
        fields = ['image']


# testimonials control

# Admin Card View


# Admin Card View
def admcard_view(request):
    if 'admin' in request.session:
        if request.method == 'POST' and request.FILES.get('card_image'):
            card_image = request.FILES['card_image']

            # Create a new Card instance and save the uploaded image
            card = Card(image=card_image)
            card.save()  # Automatically saves to the `cards/` folder as per `upload_to`

            return redirect('admcard')

        # Fetch all cards for display
        cards = Card.objects.all()
        return render(request, 'admcard.html', {'cards': cards})

    return redirect('adminlogin')

# Admin Delete Card
def admcard_delete_image(request, image_id):
    if 'admin' in request.session:
        image = get_object_or_404(Card, id=image_id)
        image.delete()  # Delete the image
        return redirect('admcard')  # Redirect to the gallery page
    return redirect('adminlogin')  # Redirect to the admin login if not authenticated

class CardUploadForm(forms.ModelForm):
    class Meta:
        model = Card
        fields = ['image']