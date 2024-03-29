from django.forms import ModelForm
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator



from .models import Bb


class BbForm(ModelForm):
    class Meta:
        model = Bb
        fields = ('title', 'content', 'price', 'rubric', 'phone', 'image')


class MyForm(UserCreationForm):
    email = forms.EmailField(max_length=200, help_text='Required', validators=[
        RegexValidator(
            regex=r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b',
            message='Проверьте корректность ввода email',
            code='invalid_email'
        ),

    ])
    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')
