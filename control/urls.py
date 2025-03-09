from django.urls import path
from .import views
urlpatterns = [
     path('admininter',views.admininter,name='admininter'),
     path('adminlogin',views.adminlogin,name='adminlogin'),
     path('adminlogout',views.adminlogout,name='adminlogout'),
     path('addrive',views.addrive,name='addrive'),
     path('drivecontentadm',views.drivecontentadm,name='drivecontentadm'),
     path('eventcontentadm',views.eventcontentadm,name='eventcontentadm'),
     path('posteruploadadm',views.posteruploadadm,name='posteruploadadm'),
     path('moreinfo/<str:id>',views.moreinfo,name='moreinfo'),
     path('adminposterview/<str:dno>',views.adminposterview,name='adminposterview'),
     path('studinfo/<str:id>',views.studinfo,name='studinfo'),
     path('totalplacements',views.totalplacements,name='totalplacements'),
     path('placedreport/<str:dno>',views.placedreport,name='placedreport'),
     path('regstudents',views.regstudents,name='regstudents'),
     path('pendingtask',views.pendingtask,name='pendingtask'),
     path('ongoingdrive',views.ongoingdrive,name='ongoingdrive'),
     path('ongoingreport/<str:dno>',views.ongoingreport,name='ongoingreport'),
     path('excelview/<str:dno>',views.excelview,name='excelview'),
     path('regstudentsexcelview',views.regstudentsexcelview,name='regstudentsexcelview'),
     path('placedexcelview/<str:dno>',views.placedexcelview,name='placedexcelview'),
     path('techteam',views.techteam,name='techteam'),
     path('selectech/<str:id>',views.selectech,name='selectech'),
     path('deletetech/<str:id>',views.deletetech,name='deletetech'),
     path('adminnotification',views.adminnotification,name='adminnotification'),
     path('notificationdeleteadmin/<str:id>',views.notificationdeleteadmin,name='notificationdeleteadmin'),
     path('admdrive',views.admdrive,name='admdrive'),
     path('admdrive/delete/<int:id>/', views.delete_placement, name='delete_placement'),
     path('get-placement-details/<int:year>/', views.get_placement_details, name='get_placement_details'),
     path('eventslist',views.eventslist,name='eventslist'),
     path('drivelistexcel/', views.drivelistexcel, name='drivelistexcel'),
     path('eventreport/<str:eid>',views.eventreport,name='eventreport'),
     path('eventexcelview/<str:eid>',views.eventexcelview,name='eventexcelview'),
     path('admcard/', views.admcard_view, name='admcard'),
     path('admcard/delete/<int:image_id>/', views.admcard_delete_image, name='delete_image'),
     path('admgallery/', views.admgallery_view, name='admgallery'),
     path('admgallery/upload/', views.admgallery_upload_image, name='upload_gallery_image'),
     path('admgallery/delete/<int:image_id>/', views.admgallery_delete_image, name='delete_gallery_image'),
     path('placed/<str:ad_no>/<int:d_no>/', views.placed, name='placed'),
     path('delete_event/<int:event_id>/', views.delete_event, name='delete_event'),
     path('delete-drive/<int:drive_id>/', views.delete_drive, name='delete_drive'),
     path('save-selection/<int:dno>/', views.save_selection, name='save_selection'),
     path('details/', views.details_list, name='details_list'),
     path('details/delete/<int:id>/', views.delete_details, name='delete_details'),
     path('get-details/<int:year>/', views.get_details, name='get_details'),
     path('eventlistexcel/', views.eventlistexcel, name='eventlistexcel'),

      



]

 