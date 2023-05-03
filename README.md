# wamp

這是一個 [XAMPP](https://www.apachefriends.org/zh_tw/index.html) 的簡易替代方案，殺雞不用瑞士刀。

> 幾乎所有的設定檔皆為預設值，稍加調整安全性後亦可做為正式環境部屬。

## 為什麼需要這個

一般來說架設 Aapche + MySQL + PHP 的開發環境我們會選擇使用 [XAMPP](https://www.apachefriends.org/zh_tw/index.html) ，因為他非常快速、方便、簡易且跨平台使用，安裝的門檻和成本非常低，通常 XAMPP 預設包含了以下內容：

> Apache, MariaDB, PHP, phpMyAdmin, OpenSSL, XAMPP Control Panel, Webalizer, Mercury Mail Transport System, FileZilla FTP Server, Tomcat, Perl

你應該已經發現 XAMPP 其實並不簡單，甚至非常臃腫，隨之而來的問題是 `「你真的用得到這些東西嗎？」` 有些東西甚至從來就沒有被打開過。

然而從事網頁開發的真實情形是你會遇到多項專案，而且專案經常是使用不同的 PHP 版本（過去開發的專案沒有更新必要），不巧的是 XAMPP 雖然提供非常多不同版本的 PHP 安裝包但它卻不支持同時安裝。

所以這個代碼庫主要解決 XAMPP 的兩個問題

1. 安裝多餘開發工具
2. 無法同時運行多版本PHP

## 使用前你需要了解的知識點

- 設定 Apache 虛擬主機 & SSL 證書
- 理解 Hosts 系統檔的功能
- 安裝 Windows 服務
- 設定環境變數

## 有什麼在這裡面

- Apache
    - httpd-2.4.57-win64-VS17
    - mod_fcgid-2.3.10-win64-VS17
- MySQL
    - mariadb-10.11.2-winx64
- PHP
    - php-7.3.20-nts-Win32-VC15-x64
    - php-7.4.33-nts-Win32-vc15-x64
    - php-8.2.5-nts-Win32-vs16-x64
- Mailpit
    - mailpit-v1.6.5-windows-amd64
- mkcert
    - mkcert-v1.4.4-windows-amd64

## 安裝方法

1. 下載此代碼庫的壓縮檔並解壓到到 `c:\wamp`

2. `安裝 Apache 服務` & `啟動 Apache 服務`

    ```
    httpd\bin\httpd -k install
    sc start Apache2.4
    ```

3. 安裝 SSL

    ```
    mkcert-v1.4.4-windows-amd64.exe -install
    mkcert-v1.4.4-windows-amd64.exe -key-file ../server.key -cert-file ../server.crt localhost 127.0.0.1 ::1
    ```

4. 初始化 MariaDB & 安裝 MySQL 服務 & 啟動 MySQL 服務

    ```
    mysql\bin\mysql_install_db
    mysql\bin\mysqld" --install
    sc start MySQL
    ```

5. 新增 `c:\wamp\php` 至 `PATH` 環境變數中

## 資料參考

- [【Windows】安裝 Apache Web Server(含多版本PHP並存)](https://ithelp.ithome.com.tw/articles/10284851)
