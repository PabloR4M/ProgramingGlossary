import SwiftUI

// MARK: - Modelo de Dato
struct Concepto: Identifiable {
    let id = UUID()
    let nombre: String
    let descripcion: String
    let imagenNombre: String
    let categoria: String
    let esAsset: Bool
}

// MARK: - Color compartido
extension Color {
    static let naranja = Color(red: 0.95, green: 0.52, blue: 0.10)
}

// MARK: - Conceptos
struct GlosarioData {
    static let conceptos: [Concepto] = [
        Concepto(
            nombre: "Comentario",
            descripcion: "Son como notas que te dejas a ti mismo o a otros programadores que leen el código.\n\nSon ignorados por el codigo, así que sirven para explicar como funciona x cosa o si falta agregar algo, o poner separadores o para hacer que x parte del código no se ejecute sin eliminarla del código por completo.",
            imagenNombre: "message.fill",
            categoria: "Sintaxis",
            esAsset: false
        ),
        Concepto(
            nombre: "Error",
            descripcion: "Cuando el programa intenta hacer algo y falla el código se detiene y te avisa que algo salió mal.\n\nPuede ser por un error de sintaxis, un loop infinito, que dos funciones choquen, o cosas así",
            imagenNombre: "exclamationmark.triangle.fill",
            categoria: "Manejo de Errores",
            esAsset: false
        ),
        Concepto(
            nombre: "Playground",
            descripcion: "Es como un scratch pero para Swift, es un IDE de entrada para el lenguaje Swift que te facilita mucho la programación y aprender el lenguaje de una manera más amigable.",
            imagenNombre: "swift",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "Barra Lateral de Resultados",
            descripcion: "Es como un debugger en tiempo real, que ayuda para códigos donde ocupes cálculos, está ejecutando el código en tiempo real y te da los resultados de las variables. Entonces si en x estás calculando una raíz, te muestra el resultado y así puedes comprobar que no haya errores o detectarlos antes de complicar todo el ciego.",
            imagenNombre: "sidebar.right",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "Asignación",
            descripcion: "Es la acción de dar o cambiar el valor a una variable, o dárselo a una constante.",
            imagenNombre: "equal",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Variable",
            descripcion: "Es un espacio de memoria al cual se le puede asignar un valor y posteriormente cambiar ese valor múltiples veces, ese espacio y valor asignado están relacionados a un nombre/Identificador, por el cual se puede llamar a la variable.",
            imagenNombre: "square.and.pencil",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Constante",
            descripcion: "Es un espacio de memoria al cual se le puede asignar un valoe pero posteriormente no se puede cambiar ese valor, ese espacio y valor asignado están relacionados a un nombre/Identificador , por el cual se puede llamar a la constante.",
            imagenNombre: "lock.fill",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Declaración",
            descripcion: "Es la acción de asignarle un nombre/Identificador a un espacio de memoria, y definir que tipo de valor va a contener ese espacio de memoria. Puede contener valores tipo int, char, string, bool, etc...",
            imagenNombre: "text.badge.plus",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Identificador",
            descripcion: "Es el nombre que se le va a asignar a un espacio de memoria, espacio que puede ser una variable o constante.",
            imagenNombre: "tag.fill",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Carácter",
            descripcion: "Es una sola letra, número o signo",
            imagenNombre: "a.circle",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Carácter de escape",
            descripcion: "Es un símbolo especial (usualmente la barra invertida \\) que pones adentro de un texto para decirle al código que el siguiente carácter no es texto normal, sino que tiene un propósito visual distinto.",
            imagenNombre: "b.circle",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Secuencia de escape",
            descripcion: "Es la combinación de ese carácter especial con otra letra para lograr un efecto dentro de tu texto.\n\nPor ejemplo, usar '\\n' para decirle al texto que haga un salto al siguiente renglón, o '\\\"' para poder poner comillas adentro de tu texto sin que el programa crea que ahí termina la cadena.",
            imagenNombre: "arrow.turn.down.left",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Cadena",
            descripcion: "Es texto normal. Son un montón de caracteres enganchados uno tras otro, formando palabras o frases.",
            imagenNombre: "text.alignleft",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Interpolación de Cadenas",
            descripcion: "Sirve para mezclar variables en medio de un texto.\n\n'Felicidades [Nombre]'\ny el programa rellena el espacio [Nombre] con la variable que tenga ese identificador.",
            imagenNombre: "link",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Unicode",
            descripcion: "Es un formato universal y estándar para los caracteres en el código, que son básicamente los símbolos emojis e idiomas que entiende el programa sin romperse o mostrar cosas raras en pantalla.",
            imagenNombre: "globe",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Consola",
            descripcion: "Es una pantalla que permite ejecutar comandos en un sistema operativo, ya sea para ejecutar un programa, o simplemente hacer cambios como moverse entre carpetas, mover, abrir o eliminar archivos.",
            imagenNombre: "terminal.fill",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "Depuración",
            descripcion: "Se usa en dado caso que un programa falle y tú no sepas por qué, sirve para ejecutar el programa poco a poco y ver hasta donde el código puede ejecutarse sin fallar, y así darte cuenta de dónde es que sucede el fallo exactamente.",
            imagenNombre: "ladybug.fill",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "Registro",
            descripcion: "Es como un diario de lo que está haciendo un programa en tiempo real. Si algo se rompe, se puede leer ese diario para saber qué estaba haciendo la app justo antes de fallar.",
            imagenNombre: "doc.text.fill",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "Print",
            descripcion: "Es un comando que permite mostrar un mensaje en la consola o pantalla, ya sea para avisar de un error, ver el valor de una variable o simplemente una confirmación.",
            imagenNombre: "printer.fill",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Simulador",
            descripcion: "Se usa para aplicaciones que no están pensadas para una computadora, significa que al querer probar que esa app funcione tenemos que ejecutarla en el teléfono o dispositivo para el que fue pensada, lo cual implica conectar el dispositivo, subir el código, compilarla, instalarla y ahora sí probar. Para evitar eso, se puede creer un entorno virtual que 'finja' ser el dispositivo, para ejecutar el código en la misma computadora sin conectar y subir el código al dispositivo meta.",
            imagenNombre: "iphone",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "Inspector de Atributos",
            descripcion: "Es como un panel de personalización en donde le puedes cambiar el color, el tamaño o el tipo de letra a los botones y textos usando puros clics, sin escribir código.",
            imagenNombre: "slider.horizontal.3",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "StoryBoard",
            descripcion: "Un lienzo enorme donde se diseñan las pantallas de una app como si fuera un mapa conceptual, uniendo todo con flechitas para ver cómo navega el usuario, o simplemente para tener una idea general de la aop.",
            imagenNombre: "rectangle.split.3x3.fill",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "Abstracción",
            descripcion: "Es simplificar el flujo de trabajo de una app o programa a secciones específicas que den a entender lo que hace x sección sin necesidad de darle mucha importancia al 'como' lo hace\n\nPuede hacerse segmentando el codigo en secciones mediante comentarios o bien en Funciones, que solo con leer el identificador de la función entiendas lo que hace sin saber específicamente cómo.",
            imagenNombre: "cube.fill",
            categoria: "Arquitectura",
            esAsset: false
        ),
        Concepto(
            nombre: "Función",
            descripcion: "Sirve para ejecutar una serie de comandos en orden con solo ejecutar un comando, este comando sería el Identificador de la Funcion.\n\nAunque es útil para abstracciones, su principal uso es para partes repetitivas de un código y no tener que estar copiando y pegando una y otra vez el mismo código, en su lugar, se crea una función y cada que se necesite esa sección de código, solo se llama a la función",
            imagenNombre: "function",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Algoritmo",
            descripcion: "Son los pasos lógicos y ordenados que se planean para resolver un problema antes de pasarlos a código.",
            imagenNombre: "list.number",
            categoria: "Lógica",
            esAsset: false
        ),
        Concepto(
            nombre: "API",
            descripcion: "Es una forma de conectar dos aplicaciones mediante un traductor, que vendría a ser la API.\n\nActualmente ya existen tantos programas que no hay necesidad de reinventar la rueda, en su lugar se crea una API que pueda aprovechar las funciones de aplicaciones externas en la nuestra.",
            imagenNombre: "network",
            categoria: "Arquitectura",
            esAsset: false
        ),
        Concepto(
            nombre: "Inmutable",
            descripcion: "Algo que se inicializa de una forma y se queda así para siempre. Su estado no puede ser alterado después de ser creado, lo que te da mucha seguridad de que no va a cambiar por accidente.",
            imagenNombre: "lock.fill",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Mutable",
            descripcion: "Algo flexible, que puede cambiar de valor, forma o estado según lo vaya necesitando el programa.",
            imagenNombre: "lock.open.fill",
            categoria: "Fundamentos",
            esAsset: false
        )
    ]
}
