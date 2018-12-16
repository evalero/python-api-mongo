FROM python:3.6
ENV CONNECTION_URL="srv+mongodb://localhost:27017"
ENV APP_ROOT=/opt/api-test
RUN mkdir -p ${APP_ROOT}
ADD uid_entrypoint.sh ${APP_ROOT}
ADD mongoapi.py ${APP_ROOT}
ADD requirements.txt ${APP_ROOT}
RUN pip install -r ${APP_ROOT}/requirements.txt &&\
    apt install -y chmod coreutils &&\
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT}
USER 1001
WORKDIR ${APP_ROOT}
ENTRYPOINT ["uid_entrypoint.sh"]
EXPOSE 5000
CMD ["python", "mongoapi.py"]
