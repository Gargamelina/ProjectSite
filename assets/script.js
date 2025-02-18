document.addEventListener('DOMContentLoaded', () => {
	fetchFiles();
	document.querySelectorAll('.btn-delete').forEach(button => {
		button.addEventListener('click', async e => {
			e.preventDefault();
			const form = button.closest('form');
			const formData = new FormData(form);
			const response = await fetch('delete.php', {
				method: 'POST',
				body: formData,
			});
			const result = await response.json();
			showMessage(
				result.error || result.success,
				result.error ? 'error' : 'success'
			);
		});
	});

	// Add event listener for the upload button
	document.getElementById('uploadButton').addEventListener('click', async e => {
		e.preventDefault();
		const form = document.getElementById('uploadForm'); // Assuming there's a form with this ID
		const formData = new FormData(form);
		const response = await fetch('upload.php', {
			method: 'POST',
			body: formData,
		});
		const result = await response.json();
		showMessage(
			result.error || result.success,
			result.error ? 'error' : 'success'
		);
		fetchFiles(); // Refresh the file list after upload
	});
});

async function fetchFiles() {
	const response = await fetch('fetch_files.php');
	const files = await response.json();
	const fileList = document.getElementById('fileList');
	fileList.innerHTML = '';
	files.forEach(file => {
		const fileItem = document.createElement('div');
		fileItem.className = 'file-item';

		let previewContent = '';
		const fileExt = file.filename.split('.').pop().toLowerCase();
		if (['jpg', 'jpeg', 'png', 'gif'].includes(fileExt)) {
			previewContent = `<img src="uploads/${encodeURIComponent(
				file.filename
			)}" alt="${
				file.filename
			}" style="max-width: 100%; max-height: 150px; border-radius: 8px; margin-bottom: 10px; object-fit: cover;">`;
		} else if (['mp4', 'webm'].includes(fileExt)) {
			previewContent = `<video controls style="max-width: 100%; max-height: 150px; border-radius: 8px; margin-bottom: 10px; object-fit: cover;">
                                <source src="uploads/${encodeURIComponent(
																	file.filename
																)}" type="video/${fileExt}">
                                Ваш браузер не поддерживает видео.
                            </video>`;
		} else if (fileExt === 'pdf') {
			previewContent = `<embed src="uploads/${encodeURIComponent(
				file.filename
			)}" type="application/pdf" width="100%" height="150px" style="border-radius: 8px; margin-bottom: 10px;">`;
		} else {
			previewContent = `<p>${file.filename}</p>`;
		}

		fileItem.innerHTML = `
            ${previewContent}
            <p>${file.filename}</p>
            <p>Загружено пользователем: ${file.uploader}</p>
            <a href="uploads/${encodeURIComponent(
							file.filename
						)}" download>Загрузить</a>
            <form action="delete.php" method="post" style="display: inline;">
                <input type="hidden" name="file_id" value="${file.id}">
                <button type="submit" class="btn btn-delete">Удалить</button>
            </form>
        `;
		fileList.appendChild(fileItem);
	});
}

function showMessage(msg, type) {
	const modal = document.getElementById('messageModal');
	const modalMessage = document.getElementById('modalMessage');
	const closeButton = document.querySelector('.close-button');

	modalMessage.textContent = msg.includes('success')
		? 'Success: ' + msg
		: 'Error: ' + msg.includes('error')
		? 'Error: ' + msg
		: msg;

	modal.style.display = 'block';

	// Remove close button functionality
	// Automatically hide the modal after 2 seconds
	setTimeout(() => {
		modal.style.display = 'none';
		location.reload(); // Refresh the page to update the file list
	}, 500);

	// Remove window click functionality to close the modal
}

document
	.getElementById('openUploadModal')
	.addEventListener('click', function () {
		document.getElementById('uploadModal').style.display = 'block';
	});

document.querySelector('.close-button').addEventListener('click', function () {
	document.getElementById('uploadModal').style.display = 'none';
});
