FROM rocker/plumber
COPY . /app
EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('/app/plumber.R'); pr$run(host='0.0.0.0', port=8000)"] 