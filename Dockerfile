FROM python:3.6
ENV CONNECTION_URL="srv+mongodb://localhost:27017"
ENV APP_ROOT=/opt/api-test
RUN mkdir -p ${APP_ROOT}
ADD mongoapi.py ${APP_ROOT}
ADD requirements.txt ${APP_ROOT}
RUN pip install -r ${APP_ROOT}/requirements.txt &&\
#    apt install -y chmod chgrp &&\
    adduser --home ${APP_ROOT} --uid 10001 flask 
#RUN chgrp -R 0 ${APP_ROOT} && \
#    chmod -R g=u ${APP_ROOT}
USER flask
WORKDIR ${APP_ROOT}
EXPOSE 5000
CMD ["python", "mongoapi.py"]
