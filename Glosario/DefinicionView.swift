import SwiftUI

// MARK: - Vista de Detalle (Sheet)
struct DefinicionView: View {
    let concepto: Concepto
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                // MARK: Drag indicator
                Capsule()
                    .fill(Color(.systemGray4))
                    .frame(width: 40, height: 4)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
                
                // MARK: Header del sheet (naranja)
                ZStack(alignment: .topLeading) {
                    Color.naranja
                        .ignoresSafeArea(edges: .top)
                    
                    HStack(alignment: .top, spacing: 16) {
                        // Ícono del concepto
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .frame(width: 90, height: 90)
                                .shadow(color: .black.opacity(0.1), radius: 8, y: 4)
                            
                            VStack(spacing: 4) {
                                if concepto.esAsset {
                                    Image(concepto.imagenNombre)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                } else {
                                    Image(systemName: concepto.imagenNombre)
                                        .font(.system(size: 34))
                                        .foregroundColor(.naranja)
                                }
                                Text(concepto.nombre.uppercased())
                                    .font(.system(size: 9, weight: .bold))
                                    .foregroundColor(.secondary)
                                Text(concepto.categoria)
                                    .font(.system(size: 8))
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        // Título
                        VStack(alignment: .leading, spacing: 4) {
                            Text("¿Qué es")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            Text("\(concepto.nombre)?")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text(concepto.categoria)
                                .font(.system(size: 13))
                                .foregroundColor(.white.opacity(0.75))
                                .padding(.top, 2)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                }
                .frame(minHeight: 140)
                
                // MARK: Contenido de la descripción
                ZStack {
                    Color.naranja.opacity(0.82)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(concepto.descripcion)
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .lineSpacing(5)
                            .padding(24)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // MARK: Paginación (placeholder)
                HStack(spacing: 6) {
                    ForEach(0..<4, id: \.self) { index in
                        Circle()
                            .fill(index == 0 ? Color.white : Color.white.opacity(0.4))
                            .frame(width: 7, height: 7)
                    }
                }
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color.naranja.opacity(0.82))
                
            }
        }
        .background(Color.naranja.opacity(0.82))
        .presentationDetents([.large, .fraction(0.75)])
        .presentationDragIndicator(.hidden)
    }
}

#Preview {
    DefinicionView(concepto: GlosarioData.conceptos[1])
}
