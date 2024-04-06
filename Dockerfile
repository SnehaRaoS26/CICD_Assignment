FROM python:3.9

WORKDIR /cicd_assignment
#RUN apt-get update && apt-get install -y ca-certificates
#RUN curl http://browserconfig.target.com/tgt-certs/tgt-ca-bundle.crt -o /usr/local/share/ca-certificates/tgt-ca-bundle.crt
#ENV REQUESTS_CA_BUNDLE '/usr/local/share/ca-certificates/tgt-ca-bundle.crt'
COPY train.py data/train.csv test.py data/test.csv /cicd_assignment/
RUN pip3 install numpy pandas scikit-learn

#COPY train.py /cicd_assignment/
#COPY test.py /cicd_assignment/
#COPY model.pkl /cicd_assignment/

RUN python train.py

CMD ["python", "test.py"]