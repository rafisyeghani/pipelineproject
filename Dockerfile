# Menggunakan image PHP dengan Apache
FROM php:8.2-apache

# Menyalin seluruh file dari folder "htdocs/pengaduan-masyarakat-cc" ke dalam container
COPY ./htdocs/pengaduan-masyarakat-cc /var/www/html

# Menginstal ekstensi PHP yang mungkin diperlukan
RUN docker-php-ext-install pdo pdo_mysql

# Mengatur izin folder untuk keperluan web server
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Membuka port 80 untuk mengakses aplikasi
EXPOSE 8092

# Menjalankan perintah Apache di foreground
CMD ["apache2-foreground"]
