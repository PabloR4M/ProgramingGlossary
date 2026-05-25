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
                    .fill(Color.white.opacity(0.6))
                    .frame(width: 40, height: 4)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
                
                // MARK: Header del sheet
                HStack(alignment: .top, spacing: 16) {
                    
                    // Ícono del concepto
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
                    .frame(width: 90, height: 90)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(color: .black.opacity(0.1), radius: 8, y: 4)
                    )
                    
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
                
                // MARK: Contenido de la descripción
                VStack(alignment: .leading, spacing: 0) {
                    Text(concepto.descripcion)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .lineSpacing(5)
                        .padding(30)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                
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
