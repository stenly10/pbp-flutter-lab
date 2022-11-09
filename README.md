# counter_7

# Tugas 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak dapat mengalami pengubahan state, contohnya adalah Icon dan Text.<br>
Stateful widget adalah widget yang dapat mengalami pengubahan state, contohnya adalah TextField dan CheckBox.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. Text: untuk membuat tulisan
2. TextStyle: untuk memberikan style pada tulisan
3. FloatingActionButton: untuk memberikan suatu button yang floating di layar
4. Icon: untuk memberikan tampilan icon pada suatu widget
5. Positioned: untuk mengatur posisi suatu widget
6. Row: sebagai tempat dari widget-widget
7. MyHomePage: untuk membuat sebuah home page
8. MyApp: untuk membuat app

## Apa fungsi dari setState()? Jelaskan  variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() berfungsi untuk merebuild widget agar memberikan tampilan yang sesuai dengan perubahan yang telah dilakukan.
Variabel yang dapat terdampak adalah semua jenis variabel yang dapat mengalami perubahan value.
Pada tugas 7, variabel yang berubah adalah _counter

## Jelaskan perbedaan antara const dengan final.
const dan final memiliki fungsi yang sama, yaitu membuat suatu variabel tidak dapat mengalami perubahan value.
Namun, pembuatan suatu variabel memiliki sifat tidak dapat mengalami perubahan value dilakukan oleh const saat compile time.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat sebuah program Flutter baru dengan nama counter_7<br>
Saya membuat program Flutter baru dengan menjalankan command "flutter create counter_7" di command prompt.
2. Mengubah tampilan program menjadi seperti berikut.<br>
Saya memanfaatkan text yang sebelumnya sudah ada secara default untuk menampilkan tulisan GANJIL atau GENAP dan text yang menampilkan isi _counter yang juga sudah ada secara default.
Saya membuat widget Row untuk menjadi tempat dari floating action button.
Saya menambahkan floating action button baru yang memiliki icon (-) dan berfungsi untuk decrement _counter.
3. Mengimplementasikan logika pada tombol +<br>
Tombol + sudah secara default mengincrement isi dari _counter dan hal itu saya manfaatkan.
4. Mengimplementasikan logika pada tombol -<br>
Saat tombol - dipencet akan dipanggil fungsi decrementCounter yang berfungsi untuk mendecrement counter sekaligus merebuild widget agar memberikan tampilan sesuai dengan perubahan.
5. Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.<br>
Di dalam method build, terdapat variabel text yang akan mempunyai value string "GANJIL" jika _counter bernilai ganjil.
Terdapat juga variabel textColor yang berisikan color berwarna biru jika _counter bernilai ganjil.
Variabel text dan textColor tersebut dimasukkan kedalam widget Text agar bisa ditampilkan.
6. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.<br>
Variabel text di method build akan di set dengan value string "GENAP" dan variabel textColor akan di set dengan value color red.
Lalu, variabel text dan textColor dimasukkan ke widget Text agar bisa ditampilkan.
7. Angka 0 dianggap sebagai angka genap<br>
Value variabel text awalnya akan selalu bernilai string "GENAP" dan textColor akan bernilai color red. Kedua variabel akan berubah value jika _counter modulo 2 hasilnya sama dengan 1 sehingga untuk kasus value _counter sama dengan 0 sudah terhandle.




A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
