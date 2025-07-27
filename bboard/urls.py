from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import index, by_rubric, ShowProfilePageView, CreateProfilePageView
from .views import BbCreateView
from .views import MyRegisterFormView
from .views import LoginFormView
from .views import  bb_detail
from django.contrib.auth import views as authViews

urlpatterns = [
                  path('add/', BbCreateView.as_view(), name='add'),
                  path('<int:rubric_id>/', by_rubric, name='by_rubric'),
                  path('', index, name='index'),
                  path('accounts/register/', MyRegisterFormView.as_view(), name="register"),
                  path('accounts/register/login/', LoginFormView.as_view(), name="login"),
                  path('exit/', authViews.LogoutView.as_view(), name='exit'),
                  path('user_profile/<int:pk>/', ShowProfilePageView.as_view(), name='profile'),
                  path('create_profile_page/', CreateProfilePageView.as_view(), name='create_user_profile'),
                  path('bb_detail/<int:pk>/', bb_detail, name = 'bb_detail')
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
