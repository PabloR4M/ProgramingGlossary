import SwiftUI

// MARK: - Modelo de Dato
struct Concepto: Identifiable {
    let id = UUID()
    let nombre: String
    let descripcion: String
    let imagenNombre: String   // SF Symbol o nombre de asset
    let categoria: String
    let esAsset: Bool          // true = Image(nombre), false = SF Symbol
}

// MARK: - Color compartido
extension Color {
    static let naranja = Color(red: 0.95, green: 0.52, blue: 0.10)
}

// MARK: - Datos de la App (agrega aquí nuevos conceptos)
struct GlosarioData {
    static let conceptos: [Concepto] = [
        Concepto(
            nombre: "Comentario",
            descripcion: "Un comentario en Swift es texto que el compilador ignora completamente. Se usan para documentar el código, explicar lógica compleja o deshabilitar líneas temporalmente.\n\nSintaxis de una línea: // esto es un comentario\n\nSintaxis multilínea:\n/* Este es un\ncomentario multilínea */",
            imagenNombre: "message.fill",
            categoria: "Sintaxis",
            esAsset: false
        ),
        Concepto(
            nombre: "Error",
            descripcion: "Un error en Swift es una condición inesperada que interrumpe el flujo normal de ejecución. Swift utiliza el protocolo Error para representar errores y las palabras clave throw, try y catch para manejarlos de manera segura.\n\nEjemplo:\nenum MiError: Error {\n  case invalido\n  case noEncontrado\n}",
            imagenNombre: "exclamationmark.triangle.fill",
            categoria: "Manejo de Errores",
            esAsset: false
        ),
        Concepto(
            nombre: "Playground",
            descripcion: "Un Playground es un entorno interactivo de Xcode donde puedes escribir código Swift y ver los resultados inmediatamente, sin necesidad de compilar un proyecto completo.\n\nIdeal para experimentar con nuevas APIs, probar algoritmos o aprender Swift de forma interactiva.",
            imagenNombre: "swift",
            categoria: "Herramientas",
            esAsset: false
        ),
        Concepto(
            nombre: "Variable",
            descripcion: "Una variable en Swift es un espacio de memoria con nombre que almacena un valor que puede cambiar durante la ejecución.\n\nSe declara con var:\nvar nombre = \"Swift\"\nnombre = \"iOS\"\n\nA diferencia de let, su valor puede modificarse después de ser asignado.",
            imagenNombre: "square.and.pencil",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Constante",
            descripcion: "Una constante en Swift almacena un valor que no cambia durante la vida del programa. Se declara con let.\n\nEjemplo:\nlet pi = 3.14159\nlet appName = \"MiApp\"\n\nSwift recomienda usar let por defecto y cambiar a var solo cuando sea necesario.",
            imagenNombre: "lock.fill",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Función",
            descripcion: "Una función es un bloque de código reutilizable que realiza una tarea específica. En Swift se declaran con la palabra clave func.\n\nEjemplo:\nfunc saludar(nombre: String) -> String {\n  return \"Hola, \\(nombre)!\"\n}\n\nPueden recibir parámetros y devolver valores.",
            imagenNombre: "function",
            categoria: "Fundamentos",
            esAsset: false
        ),
        Concepto(
            nombre: "Struct",
            descripcion: "Un Struct (estructura) es un tipo de dato por valor en Swift. Al asignarlo o pasarlo a una función, se crea una copia independiente.\n\nEjemplo:\nstruct Punto {\n  var x: Double\n  var y: Double\n}\n\nLos structs son preferidos sobre clases cuando no se necesita herencia.",
            imagenNombre: "square.stack.3d.up.fill",
            categoria: "Tipos de Dato",
            esAsset: false
        ),
        Concepto(
            nombre: "Clase",
            descripcion: "Una Class (clase) es un tipo de dato por referencia. Múltiples variables pueden apuntar al mismo objeto en memoria.\n\nEjemplo:\nclass Vehiculo {\n  var velocidad: Int = 0\n  func acelerar() {\n    velocidad += 10\n  }\n}\n\nSoporta herencia, a diferencia de los structs.",
            imagenNombre: "cube.fill",
            categoria: "Tipos de Dato",
            esAsset: false
        ),
        Concepto(
            nombre: "Opcional",
            descripcion: "Un Opcional (Optional) representa un valor que puede existir o ser nil. Es una de las características más importantes de Swift para manejar la ausencia de valor de forma segura.\n\nDeclaración:\nvar nombre: String? = nil\n\nDes-envoltura segura:\nif let n = nombre { print(n) }",
            imagenNombre: "questionmark.circle.fill",
            categoria: "Fundamentos",
            esAsset: false
        ),
    ]
}
