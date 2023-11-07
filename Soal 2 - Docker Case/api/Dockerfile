# Gunakan `python:3.11.4` sebagai base image

#Menggunakan base image Python versi 3.11.4
FROM python:3.11.4

#Mengatur working directory menjadi /api
WORKDIR /api

#Menyalin semua file yang ada pada host ke dalam folder /api
COPY . /api

#Mengeksekusi perintah untuk menginstall semua library yang terdapat pada file txt
RUN pip install -r requirements.txt

#Menginformasikan bahwa port yang akan digunakan adalah port 6000
EXPOSE 6000

#Mendefinisikan environment variable pada container NAME dengan value berupa api
ENV NAME api

#Mengeksekusi perintah ketika container telah berjalan
CMD ["python", "api.py"]

