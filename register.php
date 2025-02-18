<?php
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $stmt = $conn->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
    $stmt->execute([$username, $email, $password]);

    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Страница Регистрации</title>
    <link rel="stylesheet" href="assets/styles.css">
</head>

<body>
    <video class="video-background" autoplay loop muted>
        <source src="assets/video/vecteezy_abstract-gradient-fluid-animation-background_27222497.mp4" type="video/mp4">
        Ваш браузер не поддерживает видео.
    </video>
    <div class="container">
        <h1>Страница Регистрации</h1>
        <form action="register.php" method="POST">
            <input type="text" name="username" placeholder="Логин" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Пароль" required>
            <button type="submit">Зарегистрироваться</button>
        </form>
    </div>
</body>

</html>