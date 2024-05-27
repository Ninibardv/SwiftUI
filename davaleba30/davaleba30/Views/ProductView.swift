import SwiftUI

struct ProductView: View {
    let product: Product
    let addAction: () -> Void
    let subtractAction: () -> Void
    let deleteAction: () -> Void
    
    var body: some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .padding(5)
                .cornerRadius(30)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(product.name)")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("\(product.price, specifier: "%.2f") ლარი")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "F9B1E1"))
            }
            Spacer()
            HStack(spacing: 7) {
                Button(action: subtractAction) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(Color(hex: "F9B1E1"))
                }
                Text("\(product.quantity)")
                    .frame(width: 25, height: 25)
                    .background(Color.white)
                    .foregroundColor(Color(hex: "282828"))
                    .cornerRadius(12.5)
                Button(action: addAction) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color(hex: "F9B1E1"))
                }
            }
            Button(action: deleteAction) {
                Image(systemName: "trash.fill")
                    .foregroundColor(Color(hex: "F9B1E1"))
            }
            .padding(.leading, 10)
        }
        .padding()
        .background(Color(hex: "282828"))
        .cornerRadius(25)
        .padding(.horizontal)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(
            product: Product(id: 1, name: "Milk Chocolate", price: 2.99, quantity: 1, imageName: "MilkChocolate"),
            addAction: {},
            subtractAction: {},
            deleteAction: {}
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

