FROM python:2.7

RUN apt-get -qq update && apt-get -qqy install awscli

# Install dependencies
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Add the cc-index-server code into the image
COPY ./ /opt/webapp/
WORKDIR /opt/webapp

RUN ./install-collections.sh
# Note: to avoid that collections are fetched anew on every image build,
# you may install collections locally on the host in the build directory
# and remove this command

CMD /usr/local/bin/cdx-server
