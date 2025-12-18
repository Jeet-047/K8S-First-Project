# Use a lightweight base image
FROM python:3.10-slim

# Set the environment variables to prevent python from warning .pyc files and buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy only the required files to the working directory
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port where the app runs
EXPOSE 5000

# Command to run the application
CMD [ "python", "app.py" ]