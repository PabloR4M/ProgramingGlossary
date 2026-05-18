import SwiftUI

// MARK: - Vista Principal
struct ContentView: View {
    @State private var conceptoSeleccionado: Concepto? = nil
    @State private var mostrarDetalle = false
    
    let columnas = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                
                // MARK: TOOLBAR
                VStack(spacing: 0) {
                    
                    Group{
                        //MARK: BARRA PRINCIPAL
                        HStack {
                            // Botón Swift
                            Button { } label: {
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
                            
                            // Botón Lupa (
                            Button { } label: {
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
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        
                        
                        HStack(spacing: 10) {
                            Spacer()
                            FiltroChip(icono: "heart", texto: "Favorites")
                            FiltroChip(icono: "clock.arrow.circlepath", texto: "History")
                            FiltroChip(icono: "person.badge.plus", texto: "Nuevo")
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 10)
                        
                        
                    }
                    .background(Color.naranja.ignoresSafeArea(edges: .top))
                    
                    
                    // MARK: BANNER
                    HStack {
                        Color.naranja
                            .frame(height: 180)
                            .overlay(
                                VStack {
                                    Image(systemName: "photo")
                                        .font(.system(size: 40))
                                        .foregroundColor(.white.opacity(0.4))
                                    Text("Reemplaza con tu imagen de banner")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                            )
                    }
                    .padding(.top, 5)
                }
                
                // MARK: - 2. CONTENIDO SCROLLABLE
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        // Conceptos Header
                        HStack {
                            Text("Conceptos")
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                            Button {
                                // Acción "ver todos"
                            } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        
                        // Grid de conceptos
                        LazyVGrid(columns: columnas, spacing: 24) {
                            ForEach(GlosarioData.conceptos) { concepto in
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
                
                // MARK: FOOTER
                FooterImageView()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .sheet(item: $conceptoSeleccionado) { concepto in
            DefinicionView(concepto: concepto)
        }
    }
}

// MARK: - Banner
struct HeaderBannerView: View {
    var body: some View {
        
    }
}


// Estilos de las pills
struct FiltroChip: View {
    let icono: String
    let texto: String
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icono)
                .font(.system(size: 13))
            Text(texto)
                .font(.system(size: 14, weight: .medium))
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        
        .background(Color.white.opacity(0.20))
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}

// MARK: - Card de conceptos
struct ConceptoCardView: View {
    let concepto: Concepto
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(Color.naranja.opacity(0.15))
                    .frame(width: 72, height: 72)
                
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
            
            Text(concepto.nombre)
                .font(.system(size: 12, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity)
    }
}


// MARK: - Footer
struct FooterImageView: View {
    var body: some View {
        ZStack {
            Color.naranja
            .frame(height: 40)
            .padding(.bottom, -40)
        }
    }
}


#Preview {
    ContentView()
}
