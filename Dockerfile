# Use a specific Ubuntu image
FROM ubuntu:20.04

# Update the package list and install software-properties-common
RUN apt-get update && apt-get install -y software-properties-common

# Add the GNU Radio PPA and install GNU Radio
RUN add-apt-repository ppa:gnuradio/gnuradio-releases -y && \
    apt-get update && \
    apt-get install -y gnuradio

# Set a non-root user to run the application
RUN groupadd -r gnu-radio-users && useradd -m -r -g gnu-radio-users gnu-radio-user
USER gnu-radio-user

# Set the command to run when the container starts
CMD ["gnuradio-companion"]