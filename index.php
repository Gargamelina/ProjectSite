<?php
// Подключение к базе данных
require 'config.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$userId = $_SESSION['user_id'];
$username = $_SESSION['username'];

// Получение списка файлов
$stmt = $conn->prepare("SELECT id, filename, uploader FROM files");
$stmt->execute();
$files = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Главная страница</title>
    <link rel="stylesheet" href="assets/styles.css">
</head>
<body>
    <div class="container">

        <div class="banner">
            <h1>Добро пожаловать!</h1>
            <p>Этот сайт позволяет вам обмениваться файлами с другими пользователями.</p>
        </div>
        
        <div class="description">
            <p>Здесь вы можете загружать, скачивать и управлять своими файлами. Присоединяйтесь к нам и начните обмен файлами прямо сейчас!</p>
        </div>
        
        <div class="buttons">
            <a href="login.php" class="btn btn-login">Войти</a>
            <a href="register.php" class="btn btn-register">Зарегистрироваться</a>
        </div>
    </div>
</body>
</html>