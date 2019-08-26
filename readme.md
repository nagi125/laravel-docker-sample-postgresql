## 概要
Laravel5.8の開発用テンプレート

## バージョン
- Nginx1.17
- PHP7.3.*
- Laravel5.8.*
- PostgreSQL11.*

## 初期セットアップ

```
$ cp .env.sample .env
$ docker-compose build
$ dokcer-compose up
$ dokerr-compose exec app composer install
$ docker-compose exec app php artisan key:generate
```

