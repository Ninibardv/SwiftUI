import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            HeaderView()
        
            ScrollView {
                ForEach(viewModel.products) { product in
                    ProductView(product: product,
                                addAction: { viewModel.addProductQuantity(product) },
                                subtractAction: { viewModel.subtractProductQuantity(product) },
                                deleteAction: { viewModel.deleteProduct(product) })
                }
                
                DeliveryDetailsView()
            }
            
            FooterView(totalAmount: viewModel.totalAmount, totalQuantity: viewModel.totalQuantity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


