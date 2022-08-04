FROM python:3.9

RUN apt update \
 && apt install -y git \
 && apt install -y --no-install-recommends ffmpeg

RUN pip install yt-dlp

RUN wget `curl -s https://api.github.com/repos/bugy/script-server/releases/latest | grep browser_download_url | cut -d '"' -f 4` \
  && unzip script-server.zip -d app

WORKDIR app
RUN pip install -r requirements.txt

EXPOSE 5000
CMD [ "python3", "launcher.py" ]

