# MedimozSDK

MedimozSDK es una libreria que te permite trackear tus videos en Swift.

## Installation

### [CocoaPods](https://cocoapods.org)

Cargar lo siguiente en su archivo Pod

```bash
pod 'MedimozSdk', '~> 1.0'
```

Luego de esto, corre en tu terminal el siguiente comando `pod install` (Debes estar en la carpeta raíz del proyecto).
En cada archivo que desees usar MedimozSdk, no olvides importar el framework con `import MedimozSdk`.

## Usage

### MedimozSdk

MedimozSdk es una librería simple de utilizar, ya que puede ser utilizada en cualquier archivo que herede una opción de ViewController.

Para este caso, si deseas trackear un video cargado con AVPlayer de Swift, basta solamente realizar lo siguiente:

```Swift
let playerViewController = MedimozAVController()

player = AVPlayer(url: urlVideo!)
playerViewController.player = player

self.present(playerViewController, animated: true, completion: {
            playerViewController.player?.play()
            //ID proporcionado por Medimoz
            playerViewController.siteId = 1
            //Url Proporcionada por Medimoz
            playerViewController.urlPiwik = "https://tuurlpiwikodasboard.com/piwik.php"
            playerViewController.listeInit()
})

```

## Contribución

Los Pull requests son bienvenidos. Para cambios mayores, porfavor abre una incidencia primero para discutir qué es lo que deseas modificar o mejorar.

Por favor asegurate de generar los test necesarios para la cobertura del proyecto

## License

[MIT](https://choosealicense.com/licenses/mit/)
