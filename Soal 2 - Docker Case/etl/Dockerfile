# Gunakan `python:3.11.4` sebagai base image

#Menggunakan base image Python versi 3.11.4
FROM python:3.11.4

#Mengatur working directory menjadi /etl
WORKDIR /etl

#Menyalin semua file yang ada pada host ke dalam folder /etl
COPY . /etl

#Mengeksekusi perintah untuk menginstall semua library yang terdapat pada file txt
RUN pip install -r requirements.txt

#Mengeksekusi perintah ketika container telah berjalan
CMD ["python", "etl.py"]
