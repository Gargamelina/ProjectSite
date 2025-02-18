<?php
session_start();
require 'config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

$userId = $_SESSION['user_id'];
$username = $_SESSION['username'];

// Получаем список файлов
$stmt = $conn->prepare("SELECT * FROM files");
$stmt->execute();
$files = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <title>Доска с файлами</title>
    <link rel="stylesheet" href="assets/styles.css">
</head>

<body>

    <video class="video-background" autoplay loop muted>
        <source src="assets/video/1118458_4k_Pattern_1920x1080.mp4" type="video/mp4">
        Ваш браузер не поддерживает видео.
    </video>
    <div class="container">
        <h1>Добро пожаловать, <?php echo htmlspecialchars($username); ?></h1>
        <a href="logout.php" class="btn btn-login">Выйти</a>
        <h2>Выгрузить Файлы</h2>
        <form id="uploadForm" enctype="multipart/form-data">
            <input type="file" name="file">
            <button type="button" id="uploadButton">Выгрузить</button>
        </form>
        <h2>Ваши Файлы</h2>
        <div class="file-list">
            <?php foreach ($files as $file): ?>
                <div class="file-item">
                    <?php
                    $filePath = "uploads/" . htmlspecialchars($file['filename']);
                    $fileExt = pathinfo($filePath, PATHINFO_EXTENSION);
                    if (in_array($fileExt, ['jpg', 'jpeg', 'png', 'gif', 'jfif'])):
                        ?>
                        <img src="<?php echo $filePath; ?>" alt="<?php echo htmlspecialchars($file['filename']); ?>">
                    <?php elseif (in_array($fileExt, ['mp4', 'webm'])): ?>
                        <video controls>
                            <source src="<?php echo $filePath; ?>" type="video/<?php echo $fileExt; ?>">
                            Ваш браузер не поддерживает видео.
                        </video>
                    <?php elseif (in_array($fileExt, ['pdf'])): ?>
                        <embed src="<?php echo $filePath; ?>" type="application/pdf" width="100%" height="150px">
                    <?php else: ?>
                        <p><?php echo htmlspecialchars($file['filename']); ?></p>
                    <?php endif; ?>
                    <p><?php echo htmlspecialchars($file['filename']); ?></p>
                    <p>Загружено пользователем: <?php echo htmlspecialchars($file['uploader']); ?></p>
                    <a href="<?php echo $filePath; ?>" download>Загрузить</a>
                    <form action="delete.php" method="post" style="display: inline;">
                        <input type="hidden" name="file_id" value="<?php echo htmlspecialchars($file['id']); ?>">
                        <button type="submit" class="btn btn-delete">Удалить</button>
                    </form>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Modal Structure -->
    <div id="messageModal" class="modal">
        <div class="modal-content">
    <div id="messageModal" class="modal">
        <div class="modal-content">
            <p id="modalMessage"></p>
        </div>
    </div>


    <script src="assets/script.js"></script>
</body>

</html>
