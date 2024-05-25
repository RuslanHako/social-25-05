document.addEventListener("DOMContentLoaded", function () {
    // Получаем кнопку "Загрузить музыку" и модальное окно
    let uploadButton = document.getElementById("uploadButton");
    let modal = document.getElementById("myModal");
    // При клике на кнопку "Загрузить музыку" показываем модальное окно
    uploadButton.onclick = function () {
        modal.style.display = "block";
    }
    // Получаем кнопку закрытия модального окна
    let closeButton = document.getElementsByClassName("close")[0];
    // При клике на кнопку закрытия скрываем модальное окно
    closeButton.onclick = function () {
        modal.style.display = "none";
    }
    // При клике вне модального окна также скрываем его
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    // Получаем все аудио элементы на странице
    let audioElements = document.querySelectorAll('audio');
    // Проходимся по каждому аудио элементу
    audioElements.forEach(function (audioElement, index) {
        // Добавляем обработчик события 'ended' для каждого аудио элемента
        audioElement.addEventListener('ended', function () {
            // Находим следующий аудио элемент
            let nextAudioElement = audioElements[index + 1];
            // Если следующий аудио элемент существует, запускаем его 
            воспроизведение
            if (nextAudioElement) {
                nextAudioElement.play();
            }
        });
    });

});
