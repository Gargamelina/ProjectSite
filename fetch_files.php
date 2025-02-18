<?php
echo ("aaaaaaaa");
session_start();
require 'config.php';
if (!isset($_SESSION['user_id'])) {
    http_response_code(403);
    echo json_encode([]);
    exit();
}
$userId = $_SESSION['user_id'];
$stmt = $conn->prepare("SELECT * FROM files WHERE user_id = ?");
$stmt->execute([$userId]);
$files = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($files);
?>