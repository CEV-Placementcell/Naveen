from django.db import models


# Create your models here.
class Card(models.Model):
    image = models.ImageField(upload_to='cards/')

    class Meta:
        db_table = 'card'  # The table name will be 'card'

    def __str__(self):
        return f"Card {self.id}"

    
class GalleryImage(models.Model):
    image = models.ImageField(upload_to='gallery/')

    class Meta:
        db_table = 'gallery'

    def __str__(self):
        return f"Card {self.id}"

class Drive(models.Model):
    year = models.CharField(max_length=10)
    attended = models.IntegerField()
    placed = models.IntegerField()
    companies = models.IntegerField()

    def __str__(self):
        return f"Drive {self.year}"

    class Meta:
        db_table = 'drive'  # Specifies the table name as 'drive'
        verbose_name = 'Drive'
        verbose_name_plural = 'Drives'


class DriveDetails(models.Model):
    year = models.IntegerField()
    cmpname = models.CharField(max_length=255)
    date = models.DateField()
    attended = models.IntegerField()
    placed = models.IntegerField()

    class Meta:
        db_table = 'drivedetails'

    def __str__(self):
        return f"{self.cmpname} - {self.year}"
