from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import index, by_rubric
from .views import BbCreateView, profile
from .views import MyRegisterFormView
from .views import LoginFormView
from django.contrib.auth import views as authViews

urlpatterns = [
    path('add/', BbCreateView.as_view(), name='add'),
    path('<int:rubric_id>/', by_rubric, name='by_rubric'),
    path('', index, name='index'),
    path('accounts/register/', MyRegisterFormView.as_view(), name="register"),
    path('accounts/register/login/', LoginFormView.as_view(), name="login"),
    path('exit/', authViews.LogoutView.as_view(), name='exit'),
    path('profile/', profile, name='users-profile'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
