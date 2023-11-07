#Pengetahuan tentang data
#Dataset ini berisi 32 kolom dengan 10.000 baris. Penjelasan lebih lengkap mengenai analisis dataset ini sudah terdapat pada 
#soal no 1. Isu yang dimiliki dataset ini adalah karena terdapat kesalahan format pada tanggal dan juga banyaknya missing value 
#pada kolom. Namun, berdasarkan data yang ada, kolom-kolom yang kosong tersebut dapat terisi dengan melakukan perhitungan.
#Proses perhitungan ini sudah dilakukan pada soal no 1 sehingga data yang digunakan untuk analisis di SQL ini merupakan
#data yang telah melalui praprocessing data.

#Test Case 1
#Query ini mengambil tabel utama yang berisi data country, channel, dan total pendapatan
#dari tabel bernama ecommerce menggunakan command SELECT yang dikelompokkan berdasarkan 5 negara dengan dengan total transaksi
#terbanyak menggunakan GROUP BY, tetapi tabel ini juga digabungkan dengan suatu tabel sementara yang terlebih dahulu agar 
#5 negara dengan total transaksi terbanyak dapat diketahui terlebih dahulu. Proses ini menggunakan command WITH, yang kemudian
#data diurutkan dari jumlah paling besar dengan menggunakan ORDER BY
WITH Top5Countries AS (
    SELECT
        country,
        SUM(totalTransactionRevenue) AS totalRevenue
    FROM
        mytable
    WHERE
        totalTransactionRevenue IS NOT NULL
    GROUP BY
        country
    ORDER BY
        totalRevenue DESC
    LIMIT 5
)
SELECT
    t.country,
    c.channelGrouping,
    SUM(c.totalTransactionRevenue) AS totalRevenue
FROM
    ecommerce AS c
JOIN
    Top5Countries AS t
ON
    c.country = t.country
GROUP BY
    t.country, c.channelGrouping
ORDER BY
    t.country, totalRevenue DESC;
#Hasil dari query ini menunjukkan bahwa customer yang berasal dari Kanada melakukan kunjungan website terbanyak disusul dengan
#negara Curacao, kebanyakan customer melakukan kunjungan website melalui pencarian website secara langsung pada search engine
#dengan mengetikkan keyword atau dengan menggunakan link referensi yang terdapat pada website lain.


#Test Case 2
#Query ini mengambil nilai rata-rata kolom timeOnSite, sessionQualityDim, pageviews dengan menggunakan command SELECT
#yang kemudian dikelompokkan berdasarkan id pengunjung dengan menggunakan GROUP BY
SELECT 
    fullVisitorId, 
    AVG(timeOnSite), 
    AVG(sessionQualityDim), 
    AVG(pageviews) 
FROM mytable 
GROUP BY fullVisitorId;
#Hasil dari query ini menunjukkan bahwa ada seorang customer yang melakukan kunjungan website selama rata-rata 207 menit
#atau sekitar 4 jam. Selain itu, rata-rata kunjungan halaman website seorang customer terbanyak berjumlah 333 halaman.



#Test Case 3
# a
#Query ini mengambil nilai total pendapatan produk dengan menggunakan command SELECT
#yang kemudian dikelompokkan berdasarkan nama produk dengan menggunakan GROUP BY
SELECT 
    v2ProductName, 
    SUM(productRevenue) 
FROM mytable 
GROUP BY v2ProductName;
#Hasil dari query ini menunjukkan bahwa produk "Waterpoof Gear Bag" memiliki jumlah pendapatan produk terbanyak, yakni sebesar
#1.983.730.000, pada urutan kedua ada produk "Google Canvas Tote Natural/Navy"

# b
#Query ini mengambil nilai total kuantitas item dalam transaksi dengan menggunakan command SELECT
#yang kemudian dikelompokkan berdasarkan nama produk dengan menggunakan GROUP BY dan diurutkan
#berdasarkan nilai tertinggi menggunakan ORDER BY
SELECT 
    v2ProductName, 
    SUM(itemQuantity) as quantity 
FROM mytable 
GROUP BY v2ProductName 
ORDER BY `quantity` DESC
#Hasil dari query ini menunjukkan bahwa produk "Collapsible Shopping Bag" memiliki jumlah item terbanyak yang dibeli oleh customer,
#produk lainnya adalah "1 oz Hand Sanitizer"

#c
#Query ini mengambil nilai total produk yang direfund dalam transaksi dengan menggunakan command SELECT
#yang kemudian dikelompokkan berdasarkan nama produk dengan menggunakan GROUP BY dan diurutkan
#berdasarkan nilai tertinggi menggunakan ORDER BY
SELECT 
    v2ProductName, 
    SUM(productRefundAmount) as total_refund 
FROM mytable 
GROUP BY v2ProductName 
ORDER BY total_refund DESC;
#Hasil dari query ini menunjukkan bahwa produk "Google Leather Perforated Journal" memiliki jumlah refund paling banyak
#yakni sebesar 989.730.000 USD, produk lainnya adalah "Sport Bag"