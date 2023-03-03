from django.db import models

class Score(models.Model):
    user_id = models.IntegerField()
    score = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
