from rest_framework import serializers
from .models import Score

class ScoreSerializer(serializers.ModelSerializer):
    new_column = serializers.CharField(read_only=True, required=False)

    class Meta:
        model = Score
        fields = ('user_id', 'score', 'created_at','new_column')

    def to_representation(self, instance):
        print(instance)
        representation = super().to_representation(instance)
        if hasattr(instance, 'new_column'):
            representation['new_column'] = instance.new_column
        return representation