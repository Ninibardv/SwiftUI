import SwiftUI

class ViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(id: 1, name: "Milka - რძის შოკოლადი", price: 2.99, quantity: 1, imageName: "MilkChocolate"),
        Product(id: 2, name: "Milka - შავი შოკოლადი", price: 3.99, quantity: 1, imageName: "DarkChocolate"),
        Product(id: 3, name: "Milka - თეთრი შოკოლადი", price: 3.99, quantity: 1, imageName: "WhiteChocolate")
    ]
    
    var totalAmount: Double {
        return products.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var totalQuantity: Int {
        return products.reduce(0) { $0 + $1.quantity }
    }
    
    func addProductQuantity(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity += 1
        }
    }
    
    func subtractProductQuantity(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            if products[index].quantity > 1 {
                products[index].quantity -= 1
            }
        }
    }
    
    func deleteProduct(_ product: Product) {
        products.removeAll { $0.id == product.id }
    }
}

struct Product: Identifiable {
    let id: Int
    let name: String
    let price: Double
    var quantity: Int
    let imageName: String
}


