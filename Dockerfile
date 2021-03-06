FROM python:3.6-alpine
ENV CONNECTION_URL="srv+mongodb://localhost:27017"
ENV APP_ROOT=/opt/api-test
RUN mkdir -p ${APP_ROOT}
ADD mongoapi.py ${APP_ROOT}
ADD requirements.txt ${APP_ROOT}
RUN pip install -r ${APP_ROOT}/requirements.txt
USER 10001
WORKDIR ${APP_ROOT}
EXPOSE 5000
CMD ["python", "mongoapi.py"]
