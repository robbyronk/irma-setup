FROM golang:1.14 as irmago

RUN git clone https://github.com/privacybydesign/irmago \
    && cd irmago \
    && go install ./irma \
    && cd ../ \
    && rm -rf irmago

WORKDIR /irma

COPY . .

RUN irma server -u http://0.0.0.0:8088/ -vvvvv

EXPOSE 8088