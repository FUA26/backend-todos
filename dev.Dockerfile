# Menggunakan Node.js LTS (14.x) sebagai base image
FROM node:14

# Menentukan direktori kerja di dalam kontainer
WORKDIR /app

# Menyalin package.json dan prisma
COPY package*.json ./
COPY prisma ./prisma/

# Menginstal dependensi aplikasi
RUN npm install

# Menyalin kode sumber aplikasi ke direktori kerja
COPY . .

# Menentukan variabel lingkungan untuk mode pengembangan
ENV NODE_ENV=development

# Menentukan port yang akan digunakan oleh aplikasi
EXPOSE 3000

# Menjalankan aplikasi dengan fitur hot reload menggunakan perintah npm
CMD ["npm", "run", "start:dev"]
