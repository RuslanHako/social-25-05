<input class="menu-icon" type="checkbox" id="menu-icon" name="menu-icon" />
<label for="menu-icon"></label>
<nav class="nav">
    <ul class="pt-5">
        <li><a href="http://localhost/Social/">Главная</a></li>
        <!-- Добавляем PHP-код для определения ссылки на страницу "Личный 
кабинет" -->
        <?php
        if (isset($_SESSION['id'])) {
            echo '<li><a 
href="http://localhost/Social/profile/accaunt.php">Личный кабинет</a></li>';
        } else {
            echo '<li><a href="http://localhost/Social/auth.php">Личный
кабинет</a></li>';
        }
        if (isset($_SESSION['id'])) {
            echo '<li><a 
href="http://localhost/Social/chat/chat.php">Чат</a></li>';
        } else {
            echo '<li><a 
href="http://localhost/Social/auth.php">Чат</a></li>';
        }
        ?>
        <li><a href="http://localhost/Social/posts/posts.php">Новости</a></li>
        <?php
        if (isset($_SESSION['id'])) {
            echo '<li><a 
href="http://localhost/Social/shop/shop.php">Магазин</a></li>';
        } else {
            echo '<li><a 
href="http://localhost/Social/auth.php">Магазин</a></li>';
        }
        ?>
        <li><a href="http://localhost/Social/games/games.php">Игры</a></li>
        <li><a href="http://localhost/Social/video/all_videos.php">Видео</a></li>
        <li><a href="http://localhost/Social/music/music_list.php">Музыка</a></li>
    </ul>
</nav>

</ul>
</nav>
</ul>
</nav>