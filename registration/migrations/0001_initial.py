# Generated by Django 4.2.2 on 2025-01-18 11:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('management', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='student',
            fields=[
                ('ad_no', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50)),
                ('dob', models.DateField()),
                ('sslc', models.CharField(max_length=20)),
                ('yo_add', models.IntegerField()),
                ('dept', models.CharField(max_length=50)),
                ('course', models.CharField(max_length=50)),
                ('prog', models.CharField(max_length=50)),
                ('photo', models.ImageField(default='NULL', upload_to='img')),
                ('area_int', models.CharField(max_length=200)),
                ('skill', models.CharField(max_length=200)),
                ('stud_ph', models.CharField(max_length=20)),
                ('password', models.CharField(default='NULL', max_length=20)),
                ('tech_mem', models.BooleanField(default=False)),
                ('aadhar', models.CharField(max_length=15)),
                ('hsc', models.CharField(max_length=15)),
                ('send', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='query',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('d_title', models.CharField(max_length=50)),
                ('d_descr', models.CharField(max_length=1000)),
                ('d_ss', models.FileField(default='NULL', upload_to='screenshort')),
                ('d_replay', models.CharField(default='NOT RESPONDED', max_length=750)),
                ('ad_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registration.student')),
                ('d_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='management.job')),
            ],
        ),
        migrations.CreateModel(
            name='placements',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ad_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registration.student')),
                ('d_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='management.job')),
            ],
        ),
        migrations.CreateModel(
            name='jobs_applied',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('ad_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registration.student')),
                ('d_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='management.job')),
            ],
        ),
        migrations.CreateModel(
            name='events_applied',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('ad_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registration.student')),
                ('e_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='management.event')),
            ],
        ),
        migrations.CreateModel(
            name='contact',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('adr', models.CharField(max_length=200)),
                ('st', models.CharField(max_length=20)),
                ('dist', models.CharField(max_length=20)),
                ('pin', models.IntegerField()),
                ('email', models.EmailField(max_length=254)),
                ('f_name', models.CharField(max_length=50)),
                ('m_name', models.CharField(max_length=50)),
                ('gua_ph', models.CharField(max_length=20)),
                ('ad_no', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='registration.student')),
            ],
        ),
    ]
