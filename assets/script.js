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
	// Create message box if it doesn't exist
	let messageBox = document.getElementById('messageBox');
	if (!messageBox) {
		messageBox = document.createElement('div');
		messageBox.id = 'messageBox';
		messageBox.className = `message-box ${type}`;
		document.body.appendChild(messageBox);
	}

	// Set message content and styling
	messageBox.textContent = msg;
	messageBox.className = `message-box ${type}`;
	messageBox.style.display = 'block';
	messageBox.style.opacity = '1';

	// Automatically hide the message after 3 seconds
	setTimeout(() => {
		messageBox.style.opacity = '0';
		setTimeout(() => {
			messageBox.style.display = 'none';
		}, 300);
	}, 3000);
}


// Initialize file list on page load
document.addEventListener('DOMContentLoaded', () => {
	fetchFiles();
	
	// Setup delete button handlers
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
			fetchFiles(); // Refresh file list after deletion
		});
	});

	// Setup upload button handler
	document.getElementById('uploadButton').addEventListener('click', async e => {
		e.preventDefault();
		const form = document.getElementById('uploadForm');
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
		fetchFiles(); // Refresh file list after upload
	});
});
