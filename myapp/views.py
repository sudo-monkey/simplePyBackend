from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Score
from .serializers import ScoreSerializer

class ScoreView(APIView):
    def get(self, request, format=None):
        user_id = request.query_params.get('user_id')

        if user_id:
            # Calculate score using user_id + 1
            result = int(user_id) + 1

            # Save score in the database
            score = Score(user_id=user_id, score=result)
            score.save()

            # Check if the new_column exists in the database
            if hasattr(Score, 'new_column'):
                score.new_column = "test column"
                score.save()

            # Serialize and return score data
            serializer = ScoreSerializer(score)
            return Response(serializer.data)
        else:
            return Response({'error': 'User ID not provided'}, status=status.HTTP_400_BAD_REQUEST)
