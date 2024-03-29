# chromedriver-update

## Скрипт для автоматического обновления Chromedriver на платформе

Этот скрипт автоматизирует процесс обновления Chromedriver на платформе. Он загружает последнюю версию Chromedriver из сети и устанавливает её в указанный каталог.

### Установка

Вы можете обновить Chromedriver, используя этот скрипт, двумя способами:

1. **Автоматическая установка**: Выполните следующую команду в вашем терминале PowerShell (или Terminal, но не CMD):

    ```powershell
    irm https://raw.githubusercontent.com/vyragosa/chromedriver-update/main/script.ps1 | iex
    ```

2. **Ручная установка**:

    - Склонируйте или загрузите этот репозиторий.
    - Запустите файл `script.ps1` вручную в вашем терминале PowerShell, либо откройте папку с файлом `script.ps1` через проводник Windows, затем щелкните правой кнопкой мыши по файлу и выберите "Выполнить с помощью PowerShell".

### Использование

После установки скрипт автоматически обновит Chromedriver до последней версии, совместимой с вашей системой. Вы также можете настроить каталог установки при необходимости.

## Откуда загружается Chromedriver?

Скрипт автоматически загружает последнюю версию Chromedriver с [официального репозитория GoogleChromeLabs](https://googlechromelabs.github.io/chrome-for-testing/). Это гарантирует получение актуальной версии Chromedriver, совместимой с последней версией Chrome.
