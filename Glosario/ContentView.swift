import SwiftUI
import AVFoundation

// MARK: - Vista Principal
struct ContentView: View {
    @State private var conceptoSeleccionado: Concepto? = nil
    @State private var mostrarDetalle = false
    
    // MARK: estados para la búsqueda
    @State private var textoBusqueda: String = ""
    @State private var mostrarBuscador: Bool = false
    
    // MARK: Estado para el reproductor de audio
    @State private var audioPlayer: AVAudioPlayer?
    
    let columnas = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: busqueda
    var conceptosFiltrados: [Concepto] {
        if textoBusqueda.isEmpty {
            return GlosarioData.conceptos
        } else {
            return GlosarioData.conceptos.filter { concepto in
                concepto.nombre.lowercased().contains(textoBusqueda.lowercased())
            }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                
                // MARK: HEADER COMPLETO
                VStack(spacing: 0) {
                    HStack {
                        // Botón Playground (Ahora reproduce o detiene el audio)
                        Button {
                            alternarSonido()
                        } label: {
                            Image(systemName: "swift")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .frame(width: 44, height: 44)
                                .background(Color.clear)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 2)
                                )
                        }
                        Spacer()
                        
                        // Texto "SWIFT"
                        Text("SWIFT")
                            .font(.system(size: 26, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .kerning(4)
                        Spacer()
                        
                        // Botón de Busqueda
                        Button {
                            // Animación
                            withAnimation(.easeInOut) {
                                mostrarBuscador.toggle()
                                if !mostrarBuscador {
                                    textoBusqueda = ""
                                }
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .frame(width: 44, height: 44)
                                .background(Color.clear)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 2)
                                )
                        }
                    }
                    .padding(.horizontal, 35)
                    .padding(.vertical, 12)
                    .background(Color.naranja.ignoresSafeArea(edges: .top))
                    
                    
                    // MARK: BARRA DE BUSQUEDA
                    VStack(spacing: 0) {
                        if mostrarBuscador {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                
                                TextField("Buscar concepto...", text: $textoBusqueda)
                                    .foregroundColor(.primary)
                                    .autocorrectionDisabled()
                                
                                if !textoBusqueda.isEmpty {
                                    Button {
                                        textoBusqueda = ""
                                    } label: {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                        // si no se ve la barra de busqueda
                        else {
                            Color.white
                                .frame(height: 5)
                        }
                    }
                    .background(Color.white)
                    .clipped()
                    
                    
                    // MARK: BANNER
                    HStack {
                        Image("swift")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .background(Color.naranja)
                    }
                }
                
                // MARK: CONCEPTOS
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        // Conceptos Header
                        HStack {
                            Text("Conceptos")
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        
                        // Validar si hay resultados
                        if conceptosFiltrados.isEmpty {
                            Text("No se encontraron conceptos que coincidan con tu búsqueda.")
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.top, 40)
                                .frame(maxWidth: .infinity)
                        } else {
                            // Grid de conceptos
                            LazyVGrid(columns: columnas, spacing: 24) {
                                ForEach(conceptosFiltrados) { concepto in
                                    ConceptoCardView(concepto: concepto)
                                        .onTapGesture {
                                            conceptoSeleccionado = concepto
                                            mostrarDetalle = true
                                        }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 32)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                // MARK: FOOTER
                Color.naranja
                    .frame(height: 40)
                    .padding(.bottom, -40)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .sheet(item: $conceptoSeleccionado) { concepto in
            DefinicionView(concepto: concepto)
        }
    }
    
    // MARK: - Sonido
    private func alternarSonido() {
        // i está sonando
        if let player = audioPlayer, player.isPlaying {
            player.stop()
            player.currentTime = 0
            return
        }
        
        // Si no está sonando
        if let ruta = Bundle.main.path(forResource: "everest", ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ruta))
                
                // volumen
                audioPlayer?.volume = 0.5
                
                audioPlayer?.play()
            } catch {
                print("Error al reproducir el sonido: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - Card de conceptos
struct ConceptoCardView: View {
    let concepto: Concepto
    
    var body: some View {
        VStack(spacing: 8) {
            
            // MARK: Ícono de la Card
            Group {
                if concepto.esAsset {
                    Image(concepto.imagenNombre)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                } else {
                    Image(systemName: concepto.imagenNombre)
                        .font(.system(size: 28))
                        .foregroundColor(.naranja)
                }
            }
            .frame(width: 72, height: 72)
            .background(
                Circle()
                    .fill(Color.naranja.opacity(0.15))
            )
            
            // Texto de la Card
            Text(concepto.nombre)
                .font(.system(size: 12, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
