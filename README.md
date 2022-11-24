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
setState() berfungsi untuk memberikan tanda pada framework bahwa terdapat perubahan pada state sehingga perlu adanya pemanggilan build lagi agar memberikan tampilan sesuai dengan perubahan yang dilakukan.
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
Saat tombol - dipencet akan dipanggil fungsi decrementCounter yang berfungsi untuk mendecrement counter sekaligus menjalankan setState() agar memberikan tampilan sesuai dengan perubahan. Saat akan melakukan perubahan pada _counter, terdapat conditional sehingga jika _counter bernilai 0 _counter tidak akan di decrement.
5. Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.<br>
Di dalam method build, terdapat variabel text yang akan mempunyai value string "GANJIL" jika _counter bernilai ganjil.
Terdapat juga variabel textColor yang berisikan color berwarna biru jika _counter bernilai ganjil.
Variabel text dan textColor tersebut dimasukkan kedalam widget Text agar bisa ditampilkan.
6. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.<br>
Variabel text di method build akan di set dengan value string "GENAP" dan variabel textColor akan di set dengan value color red.
Lalu, variabel text dan textColor dimasukkan ke widget Text agar bisa ditampilkan.
7. Angka 0 dianggap sebagai angka genap<br>
Value variabel text awalnya akan selalu bernilai string "GENAP" dan textColor akan bernilai color red. Kedua variabel akan berubah value jika _counter modulo 2 hasilnya sama dengan 1 sehingga untuk kasus value _counter sama dengan 0 sudah terhandle.


# Tugas 8
## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement
Navigator.push = push route baru ke top of stack <br>
Navigator.pushReplacement = mengganti top of stack dengan route baru

## Sebutkan widget apa saja yang kamu pakai di proyek kali
1. Text: untuk menampilkan tulisan
2. Row: untuk mengatur layout widget di dalamnya berdasarkan barisan
3. Padding: untuk memberikan padding pada childnya
4. Drawer: untuk membuat drawer pilihan halaman
5. Column: untuk mengatur layour widget di dalamnya berdasarkan kolom
6. TextFormField: untuk membuat text field
7. TextButton: untuk membuat button dengan text
8. ButtonStyle: untuk memberikan styling pada button
9. FormBudgetPage: untuk membuat tampilan form budget
10. ShowDataPage: untuk membuat tampilan data budget

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed)
1. onPressed
2. onTap
3. onSaved
4. onChanged

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Navigator mengubah page dengan sistem stack. Navigator mempush route baru ke top of stack agar menampilkan page baru. Navigator mempop top of stack agar kembali ke halaman awal.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menambahkan drawer/hamburger menu pada app yang telah dibuat sebelumnya.<br>
Saya membuat drawer yang berisikan tiga ListTile yang berfungsi untuk pindah ke page lain. Drawer tersebut saya masukkan di main.dart, form.dart, dan show_data.dart
2. Menambahkan tiga tombol navigasi pada drawer/hamburger. <br>
Saya menggunakan ListTile sebagai tombol untuk navigasi ke halaman lain. ListTile pertama dengan title counter_7 untuk mengarah ke page counter. ListTile kedua dengan title Tambah Budget untuk mengarah ke page Form Budget. ListTile ketiga dengan title Data Budget untuk mengarah ke page Data Budget. ListTile menavigasi ke page lain dengan menggunakan Navigator.pushReplacement.
3. Menambahkan halaman form<br>
Sayan membuat satu file baru bernama form.dart agar dapat menampilkan form budget. Saya menambahkan dua elemen input berupa text field dengan widget TextFormField. Satu textfield berguna untuk mengambil input bertipe String untuk judul dari budget. Satunya lagi berguna untuk mengambil input bertipe String digit untuk nominal budget. Kemudian String digit dikonversikan menjadi int untuk disimpan. Saya juga menambahkan elemen dropdown dengan menggunakan widget Dropdown untuk menambahkan pilihan pemasukan dan pengeluaran. Widget Dropdown memiliki atribut hide sehingga saat value dari dropdown bernilai null, dropdown akan menampilkan value dari hide. Saya juga menambahkan satu button dengan widget TextButton untuk menyimpan hasil dari input user ke listData
4. Menambahkan halaman data budget<br>
Saya membuat satu file baru bernama show_data.dart untuk menampilkan hasil inputan user di Form Budget. Saya menggunakan list.generate untuk menghasilkan widget-widget card di mana card tersebut akan berfungsi untuk menampilkan data di dalam listData. listData pada index 0 berisi judul, index 1 berisi nominal, index 2 berisi jenis pemasukan atau pengeluaran.

# Tugas 9
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Iya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Hal tersebut tidak lebih baik daripada membuat model sebelumnya karena terdapat kekurangan di mana kita akan lebih sulit untuk menentukan objek dari instance apa yang dipakai dalam data tersebut. 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. MyWatchListPage: menampilkan page mywatchlist
2. DetailPage: menampilkan detail dari suatu watchlist
3. Text: untuk menampilkan text.
4. TextButton: untuk membuat button dengan text
5. Column: membuat kolom untuk children.
6. ListTile: semacam container yang dapat berisikan widget lain, contohnya Text.
7. Container: membuat container.
8. RoundedRectangleBorder: membuat border berbentuk rounded rectangle.
9. FutureBuilder: widget yang akan menampilkan tampilan sesuai snapshot terbaru.

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
1. Mengambil data json dengan mengakses web dengan suatu url. Pengambilan data menggunakan method http.get. Response web disimpan yang nantinya pada response tersebut akan diambil data json.
2. Mengakses data yang ada pada response lalu mengubahnya menjadi objek dengan method json.decode.
3. Mengubah objek-objek menjadi instance dari suatu model.
4. Instance dari suatu model tersebut akan digunakan untuk ditampilkan.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menambahkan tombol navigasi pada drawer/hamburger untuk ke halaman mywatchlist<br>
Saya menambahkan satu widget ListTile baru untuk ke halaman mywatchlist. Saat ListTile itu dipencet, page akan berganti ke page mywatchlist.

2. Membuat satu file dart yang berisi model mywatchlist<br>
Saya membuat satu file dart baru bernama my_watch_list.dart yang berisi model untuk mywatchlist. Saya membuat model tersebut dari quicktype dan memodifikasi kode dari quicktype tersebut. Modifikasi yang dilakukan ada pada tipe data pada atribut yang dimiliki model.

3. Menambahkan halaman mywatchlist yang berisi semua watch list yang ada pada endpoint JSON di Django yang telah kamu deploy ke Heroku sebelumnya (Tugas 3). Pada bagian ini, kamu cukup menampilkan judul dari setiap mywatchlist yang ada.<br>
Saya membuat file mywatchlist.dart yang berisi class MyWatchListPage yang merupakan subclass Stateful Widget. MyWatchListPage akan menampilkan judul-judul yang ada pada mywatchlist. Judul ditampilkan dengan menggunakan widget ListTile.

4. Membuat navigasi dari setiap judul watch list ke halaman detail<br>
Judul watch list ditampilkan dengan menggunakan ListTile. Saat ListTile dipencet, akan dijalankan suatu function yang akan mengganti ke halaman detail dengan membuat suatu widget DetailPage baru yang akan menerima parameter data watchlist yang akan dilihat detailnya.

5. Menambahkan halaman detail untuk setiap mywatchlist yang ada pada daftar tersebut. Halaman ini menampilkan judul, release date, rating, review, dan status (sudah ditonton/belum).<br>
Saya membuat satu file dart baru bernama detail.dart yang berisikan class DetailPage yang merupakan subclass dari StatelessWidget. DetailPage akan menampilkan data-data yang dimiliki dari suatu watchlist. Saat dibuat, DetailPage akan meminta data yang akan ditampilkan detailnya lewat parameter.

6. Menambahkan tombol untuk kembali ke daftar mywatchlist<br>
Saya menambahkan tombol dengan widget TextButton untuk kembali dari detail ke mywatchlist. Saat tombol di pencet, akan dijalankan function yang akan mengganti halaman ke halaman mywatchlist.

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
