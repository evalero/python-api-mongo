FROM python:3.6-alpine
ENV CONNECTION_URL=mongodb+srv://localhost:27017
ADD mongoapi.py /
ADD requirements.txt /
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "mongoapi.py"]
