// Объявляем переменные для хранения выбранного пользователя и состояния видимости списка стикеров
let selectedUserId = null;
let stickerListVisible = false;

// Функция для переключения видимости списка стикеров
function toggleStickerList() {
    const stickerList = document.getElementById('sticker-list');
    stickerList.classList.toggle('show');
}

// Добавляем обработчик события click для кнопки со стикерами
/* document.addEventListener('DOMContentLoaded', () => {
    const stickerButton = document.getElementById('sticker-button');
    stickerButton.addEventListener('click', toggleStickerList);
}) */

// Функция для вставки стикера в поле ввода сообщения
function insertSticker(sticker) {
    const messageInput = document.getElementById('message');
    messageInput.value += sticker;
    messageInput.focus();
}

// Функция для получения списка пользователей
function getUsers() {
    // Отправляем AJAX-запрос на сервер для получения списка пользователей
    fetch('getUsers.php')
        .then((response) => response.json())
        .then(users => {
            const userList = document.getElementById('all-users');
            userList.innerHTML = '';

            // Добавляем каждого пользователя в список пользователей
            users.forEach(user => {
                const listItem = document.createElement('li');
                listItem.textContent = user.username;
                listItem.onclick = () => {
                    // При выборе пользователя обновляем ID выбранного пользователя и загружаем его сообщения
                    selectedUserId = user.id;
                    loadMessages(selectedUserId);
                    // Убираем стиль выбранного у всех пользователей
                    document.querySelectorAll('#all-users li').forEach(item => {
                        item.classList.remove('selected');
                    })

                    // Добавляем стиль выбранного пользователю
                    listItem.classList.add('selected');
                };
                userList.appendChild(listItem);
            });
        })
}

// При загрузке страницы выполняем функцию для получения списка пользователей
document.addEventListener('DOMContentLoaded', () => {
    getUsers();
});

// Функция для загрузки сообщений пользователя
function loadMessages(receiverUserId) {
    const chatMessages = document.getElementById('chat-messages');
    chatMessages.innerHTML = '';
    // Отправляем AJAX-запрос на сервер для получения сообщений
    // fech() принимает два параметра
    // 1. адрес, по которому нужно сделать запрос
    // 2. объект конфигурации, в котором можно настроить метод запроса, тело запроса, заголовки и многое другое
    // Функция fetch() - возвращает Promise 
    fetch('getMessages.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `receiver_id=${receiverUserId}`, // Отправляем ID получателя
    })
        // Ответ от сервера попадет в параметр функции, которая находится в очереди метода then (response)
        // В переменной response содержится сложный объект класса Response
        .then((response) => {
            // response.text() - возвращает промис с текстом
            return response.text()
        })
        .then((messagesText) => {
            // Разбиваем текст на строки и отображаем каждую строку как сообщение
            const messagesArray = messagesText.split('\n');
            // Метод split разбивает строки в массив по указанному разделителю
            // \n - перевод строки
            for (const messageText of messagesArray) {
                // Перебираем массив messagesArray константой messageText
                const messageElement = document.createElement('div'); // Создаем div (пока в памяти)
                messageElement.textContent = messageText; //Добавляем в наш созданный div текст из массива
                chatMessages.appendChild(messageElement); //Добавляем созданный div в блок chatMessages
            }
        })
        // Если возникает ошибка то выполняется код из catch
        .catch(error => {
            console.error('Error loading messages:', error);
        });
}

// Функция для отправки сообщения
function sendMessage() {
    const messageInput = document.getElementById('message');
    // Проверяем, выбран ли получатель сообщения
    if (!selectedUserId) {
        alert('Для начала переписки выберите пользователя из списка.');
        return;
    }
    // метод value - содержимое поля.
    const messageText = messageInput.value;
    // Отправляем AJAX-запрос на сервер для отправки сообщения
    fetch('sendMessage.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body:
            `receiver_id=${selectedUserId}&message=${encodeURIComponent(messageText)}`,
    })
        .then(response => response.text())
        .then(responseText => {
            console.log('Response from sendMessage.php:', responseText);
            loadMessages(selectedUserId);
        })
        .catch(error => {
            console.error('Error sending message:', error);
        });
    // Очищаем поле ввода сообщения после отправки
    messageInput.value = '';
}