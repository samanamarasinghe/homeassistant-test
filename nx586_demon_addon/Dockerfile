# Use a lightweight Python base image
FROM python:3.11-slim

# Set environment variables
ENV LANG C.UTF-8
ENV HOME /root

# Install required packages
RUN apt-get update && apt-get install -y bash && apt-get clean

# Install the Python package from PyPI
RUN pip install pynx584

# Copy add-on files to the container
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Copy the config
COPY default_nx584_config.ini /app/default_nx584_config.ini

# Run the script when the container starts
CMD [ "/run.sh" ]
