# Telegram-Crystal 
 Библиотека для взаимодействия с telegram.org из под Crystal

## Установка
Добавьте данные строчки в `shards.yml` Вашего проекта:
```crystal
dependencies:
  telegram:
    github: serjdev/telegram-crystal  
```

## Использование

Первым делом добавляем `require` и инициализируем класс
```crystal
require "telegram"

telegram = Telegram::Client.new(
  token: "Ваш токен"
)
```

## Отправка сообщения

Для отправки сообщения существует отдельный метод `send`:
```crystal
telegram.send("Test message", chat_id) # chat_id - ид чата
```
Можно также указать дополнительные поля для `sendMessage`:
```crystal
telegram.send("Test message", chat_id, add_fields: {
  "disable_notification" => "1"
})
```

# Благодарность
Библиотека написана на основе ```De-Os/vk-crystal```
