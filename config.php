<?php
$host = 'localhost';
$db = 'file_storage';
$user = 'root';
$pass = 'mysql'; // Пароль MySQL в AMPPS

try {
    $conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>
