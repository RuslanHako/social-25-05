
    window.addEventListener('load', function () {
        setTimeout(function () {
            var loader = document.querySelector('.loader'); // Находим элементпрелоадера
            loader.style.transition = 'opacity 0.5s ease-in-out'; // Добавляемtransition для плавного исчезновения
            loader.style.opacity = '0'; // Устанавливаем нулевую прозрачность для начала анимации исчезновения
            setTimeout(function () {
                loader.style.display = 'none'; // Скрываем прелоадер после окончания анимации
                loader.style.zIndex = 'auto'; // Установка z-index для прелоадера на автоматический
            }, 300); // 0.5 секунды на анимацию исчезновения
        }, 500); // 3 секунды – длительность анимации прелоадера
    });