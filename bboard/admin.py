from django.contrib import admin
from django.utils.safestring import mark_safe

from .models import Bb
from .models import Rubric
from .models import Profile


class BbAdmin(admin.ModelAdmin):
    list_display = ('title', 'content', 'price', 'published', 'rubric')
    readonly_fields = ("main_image_preview",)
    list_display_links = ('title', 'content')
    search_fields = ('title', 'content',)

    def main_image_preview(self, obj):
        return mark_safe(f'<img src="{obj.image.url}" height=200px/>')

admin.site.register(Bb, BbAdmin)
admin.site.register(Rubric)
admin.site.register(Profile)
# Register your models here.
