ARG VERSION
ARG REQUIREMENTS

FROM python:${VERSION}

ARG REQUIREMENTS

ENV PIP_ROOT_USER_ACTION=ignore

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install --no-cache-dir --upgrade pip && \
    echo "${REQUIREMENTS}" | tr " " "\n" >> /tmp/requirements.txt && \
    pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

RUN mkdir /data

COPY --chmod=0744 ./tester /tester
