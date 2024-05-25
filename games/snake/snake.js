//Переменные для поля
var blockSize = 25;
var rows = 20;
var cols = 30;
var board;
var context;
//Переменные для координат головы змейки
var snakeX;
var snakeY;
//Переменные для координат еды
var foodX;
var foodY;
//Функция для отрисовки поля на странице
window.onload = function () {
    board = document.getElementById("board");
    board.height = rows * blockSize;
    board.width = cols * blockSize;
    //Задаём возможность рисовать на поле
    context = board.getContext("2d");
    //Каждые 100 миллисекунд будет перерисовываться поле(Нужно для движения змейки)
    setInterval(update, 100);
}
function update() {
    //Задаём фон полю
    context.fillStyle = "black";
    //Так как работаем с ячейками, нужно задать диапазон закрашивания
    context.fillRect(0, 0, board.width, board.height);
    //Задаём заливку яблоку
    context.fillStyle = "red";
    context.fillRect(foodX, foodY, blockSize, blockSize);
    //Задаём заливку змейке
    context.fillStyle = "lime";
    context.fillRect(snakeX, snakeY, blockSize, blockSize);
}
window.onload = function () {
    board = document.getElementById("board");
    board.height = rows * blockSize;
    board.width = cols * blockSize;
    context = board.getContext("2d");
    //Вызов функций для появления змейки и яблока на поле
    placeFood();
    placeSnake();
    setInterval(update, 100);
}
//Генерация случайных координат для яблока
function placeFood() {
    foodX = Math.floor(Math.random() * cols) * blockSize;
    foodY = Math.floor(Math.random() * rows) * blockSize;
}
//Генерация случайных координат для змейки
function placeSnake() {
    snakeX = Math.floor(Math.random() * cols) * blockSize;
    snakeY = Math.floor(Math.random() * rows) * blockSize;
}
window.onload = function () {
    board = document.getElementById("board");
    board.height = rows * blockSize;
    board.width = cols * blockSize;
    context = board.getContext("2d");
    placeFood();
    placeSnake();
    //Прослушивание нажатий клавиш
    document.addEventListener("keyup", changeDirection);
    setInterval(update, 100);
}
//Функция для изменения направления змейки
function changeDirection(event) {
}
var snakeX;
var snakeY;
//Переменные для хранения направления движения
var vX = 0;
var vY = 0;
var foodX;
var foodY;
function changeDirection(event) {
    //Если нажата клавиша «W» и змейка не движется вниз
    if (event.code == "KeyW" && vY != 1) {
        //Не двигаемся по оси Х
        vX = 0;
        //Движемся по оси Y вверх
        vY = -1;
    }
    //Если нажата клавиша «S» и змейка не движется вверх
    else if (event.code == "KeyS" && vY != -1) {
        //Не двигаемся по оси Х
        vX = 0;
        //Движемся по оси Y вниз
        vY = 1;
    }
    //Если нажата клавиша «A» и змейка не движется вправо
    else if (event.code == "KeyA" && vX != 1) {
        //Движемся по оси Х влево
        vX = -1;
        //Не двигаемся по оси Y
        vY = 0;
    }
    //Если нажата клавиша «D» и змейка не движется влево
    else if (event.code == "KeyD" && vX != -1) {
        //Движемся по оси Х вправо
        vX = 1;
        //Не двигаемся по оси Y
        vY = 0;
    }
}

function update() {
    context.fillStyle = "black";
    context.fillRect(0, 0, board.width, board.height);
    context.fillStyle = "red";
    context.fillRect(foodX, foodY, blockSize, blockSize);
    context.fillStyle = "lime";
    //Изменяем координаты змейки
    snakeX += vX * blockSize;
    snakeY += vY * blockSize;
    context.fillRect(snakeX, snakeY, blockSize, blockSize);
}
function update() {
    context.fillStyle = "black";
    context.fillRect(0, 0, board.width, board.height);
    context.fillStyle = "red";
    context.fillRect(foodX, foodY, blockSize, blockSize);
    //поедание яблока (Если координаты головы и яблока совпадают)
    if (snakeX == foodX && snakeY == foodY) {
        placeFood();
    }
    context.fillStyle = "lime";
    snakeX += vX * blockSize;
    snakeY += vY * blockSize;
    context.fillRect(snakeX, snakeY, blockSize, blockSize);
}
var snakeX;
var snakeY;
var vX = 0;
var vY = 0;
//Массив для хранения ячеек змейки
var snakeBody = [];
var foodX;
var foodY;
function update() {
    context.fillStyle = "black";
    context.fillRect(0, 0, board.width, board.height);
    context.fillStyle = "red";
    context.fillRect(foodX, foodY, blockSize, blockSize);
    if (snakeX == foodX && snakeY == foodY) {
        //Добавление ячейки в массив
        snakeBody.push([foodX, foodY]);
        placeFood();
    }
    //Изменение координат ячеек змейки для движения их за головой
    for (let i = snakeBody.length - 1; i > 0; i--) {
        snakeBody[i] = snakeBody[i - 1];
    }
    //Если есть ячейки тела, то голова помещается на первое место в массиве
    if (snakeBody.length) {
        snakeBody[0] = [snakeX, snakeY];
    }
    context.fillStyle = "lime";
    snakeX += vX * blockSize;

    snakeY += vY * blockSize;
    context.fillRect(snakeX, snakeY, blockSize, blockSize);
    //Задаём цвет ячейка змейки
    for (let i = 0; i < snakeBody.length; i++) {
        context.fillRect(snakeBody[i][0], snakeBody[i][1], blockSize, blockSize);
    }
}
var foodX;
var foodY;
//Переменная счётчика
var score = 0;
if (snakeX == foodX && snakeY == foodY) {
    snakeBody.push([foodX, foodY]);
    //Увеличение счётчика
    score += 1;
    placeFood();
}

for (let i = snakeBody.length - 1; i > 0; i--) {
    snakeBody[i] = snakeBody[i - 1];
}
if (snakeBody.length) {
    snakeBody[0] = [snakeX, snakeY];
}
// //Отрисовка счётчика на поле
// context.fillStyle = "lightblue";
// context.font = "20px sans-serif";
// context.fillText(score, 10, 25);
// context.fillStyle = "lime";
// snakeX += vX * blockSize;
// snakeY += vY * blockSize;
// context.fillRect(snakeX, snakeY, blockSize, blockSize);
// for (let i = 0; i < snakeBody.length; i++) {
//     context.fillRect(snakeBody[i][0], snakeBody[i][1], blockSize, blockSize);
// }
// var foodX;
// var foodY;
// var score = 0;
// //Переменная для завершения игры
// var gameOver = false;
// function update() {
//     //Если игра завершена, то вызываем функцию для перезапуска
//     if (gameOver) {
//         resetGame();
//     }
//     context.fillStyle = "black";
//     context.fillRect(0, 0, board.width, board.height);
//     context.fillStyle = "red";
//     context.fillRect(foodX, foodY, blockSize, blockSize);
//     if (snakeX == foodX && snakeY == foodY) {
//         snakeBody.push([foodX, foodY]);
//         score += 1;
//         placeFood();
//     }
//     for (let i = snakeBody.length - 1; i > 0; i--) {
//         snakeBody[i] = snakeBody[i - 1];
//     }
//     if (snakeBody.length) {
//         snakeBody[0] = [snakeX, snakeY];
//     }
//     context.fillStyle = "lightblue";
//     context.font = "20px sans-serif";
//     context.fillText(score, 10, 25);
//     context.fillStyle = "lime";
//     snakeX += velocityX * blockSize;
//     snakeY += velocityY * blockSize;
//     context.fillRect(snakeX, snakeY, blockSize, blockSize);
//     for (let i = 0; i < snakeBody.length; i++) {
//         context.fillRect(snakeBody[i][0], snakeBody[i][1], blockSize, blockSize);
//     }
//     //Если змейка коснулась границ экрана
//     if (snakeX < 0 || snakeX > cols * blockSize - 25 || snakeY < 0 || snakeY >
//         rows * blockSize - 25) {
//         gameOver = true;
//         alert("Игра окончена! Ваш счёт: " + String(score) + "\nНажмите 'ОК' для перезапуска игры");
//    }
//     //Если змейка съела себя (Сравниваем координаты головы со всеми ячейками тела змейки)
//     for (let i = 0; i < snakeBody.length; i++) {
//         if (snakeX == snakeBody[i][0] && snakeY == snakeBody[i][1]) {
//             gameOver = true;
//             alert("Игра окончена! Ваш счёт: " + String(score) + "\nНажмите 'ОК' дляперезапуска игры");
//     }
//     }
// }
// function resetGame() {
//     //Обнуление всех переменных и вызов функция для случайного появления змейки и 
//     яблока
//     gameOver = false;
//     placeSnake();
//     placeFood();
//     vX = 0;
//     vY = 0;
//     snakeBody = [];
//     score = 0;
// }