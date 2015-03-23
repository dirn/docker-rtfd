FROM python:2.7

# Set up SSH
RUN mkdir -p /root/.ssh
ADD files/id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

# Install Read the Docs
RUN mkdir /www && cd /www && git clone https://github.com/rtfd/readthedocs.org.git
RUN cd /www/readthedocs.org && pip install -r pip_requirements.txt
RUN pip install --upgrade psycopg2

# Configure Read the Docs
ADD files/local_settings.py /www/readthedocs.org/readthedocs/settings/local_settings.py
WORKDIR /www/readthedocs.org/readthedocs

# Install supervisord
RUN pip install supervisor
ADD files/supervisord.conf /etc/supervisord.conf
