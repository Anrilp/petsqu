<?php
session_start();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
    <link rel="stylesheet" href="admin/assets/css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <style>
        .header {
            min-height: 100vh;
            width: 100%;
            background-image: linear-gradient(270deg, rgba(0, 0, 0, 0.33) 0%, rgba(0, 0, 0, 0.15) 48.96%, rgba(0, 0, 0, 0.32) 100%), url(foto/kucing.jpg);
            backdrop-filter: blur(4px);
            background-position: center;
            background-size: cover;
            position: relative;
            margin-top: -19px;
        }

        .text-box {
            width: 90%;
            color: #fff;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .text-box h1 {
            font-size: 62px;
        }

        .text-box p {
            margin: 10px 0 40px;
            font-size: 14px;
            color: #fff;
        }

        .hero-btn {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            border: 1px solid #fff;
            padding: 12px 34px;
            font-size: 13px;
            background: transparent;
            position: relative;
            cursor: pointer;
        }

        .hero-btn:hover {
            border: 1px solid #f44336;
            background: #f44336;
            transition: 1s;
        }

        .konten h1 {
            text-align: center;
        }

        .konten img {
            width: 100%;
            height: auto;
        }
    </style>
    <!-- Navbar -->
    <?php include 'navbar.php'; ?>

    <!-- Heaader -->
    <section class="header">
        <div class="text-box">
            <h1>Selamat Datang Di PetsQu</h1>
            <p>Setiap formula dirancang untuk memberikan nutrisi yang disesuaikan dengan kebutuhan kesehatan kucing Anda terlepas dari ras, usia, atau gaya hidupnya.
            </p>
            <a href="produk.php" class="hero-btn">Pesan Sekarang</a>
        </div>
    </section>

    <!-- Footer -->
    <?php
    include 'footer.php'
    ?>
</body>

</html>