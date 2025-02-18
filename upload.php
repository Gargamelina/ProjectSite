<?php
session_start();
require 'config.php';
if (!isset($_SESSION['user_id'])) {
    http_response_code(403);
    echo json_encode(["error" => "Не авторизован"]);
    exit();
}
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['file'])) {
    $userId = $_SESSION['user_id'];
    $username = $_SESSION['username']; // Имя пользователя из сессии
    $uploadDir = 'uploads/';
    $fileName = basename($_FILES['file']['name']);
    $fileSize = $_FILES['file']['size'];
    $fileTmpName = $_FILES['file']['tmp_name'];
    $fileType = mime_content_type($fileTmpName);
    $allowedFileTypes = [ // Разрешённые форматы
        'image/jpeg',
        'image/png',
        'image/heic',
        'image/gif',
        'image/jfif',
        'application/pdf',
        'text/plain',
        'application/zip',
        'video/mp4',
        'audio/mpeg',
        'audio/mp3',

    ];
    $maxFileSize = 300 * 1024 * 1024; // 300 МБ
    if (!in_array($fileType, $allowedFileTypes)) {
        echo json_encode(["error" => "Данный формат файлов не поддерживается."]);
        exit();
    }
    if ($fileSize > $maxFileSize) {
        echo json_encode(["error" => "Размер файла превышает лимит 300 МБ."]);
        exit();
    }
    $targetFilePath = $uploadDir . $fileName;
    if (file_exists($targetFilePath)) {
        echo json_encode(["error" => "Файл с таким именем уже существует."]);
        exit();
    }
    if (move_uploaded_file($fileTmpName, $targetFilePath)) {
        // Сохраняем информацию о файле в базе данных
        $stmt = $conn->prepare("INSERT INTO files (user_id, filename, uploader) VALUES (?, ?, ?)");
        $stmt->execute([$userId, $fileName, $username]);
        echo json_encode(["success" => "Файл успешно выгружен."]);
    } else {
        echo json_encode(["error" => "Ошибка выгрузки файла."]);
    }
} else {
    echo json_encode(["error" => "No file uploaded."]);
}
?>