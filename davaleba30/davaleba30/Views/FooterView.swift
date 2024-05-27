import SwiftUI

struct FooterView: View {
    let totalAmount: Double
    let totalQuantity: Int
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("ჯამური რაოდენობა:")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text("\(totalQuantity)")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding([.leading, .trailing, .top], 15)
            
            HStack {
                Text("ჯამური ფასი:")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text("\(totalAmount, specifier: "%.2f") ლარი")
                    .font(.headline)
                    .foregroundColor(.white)
            }
               
            .padding([.leading, .trailing], 15)
            
            Button(action: {
                if let url = URL(string: "https://google.com") {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("გადახდა")
                    .foregroundColor(Color(hex: "282828"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "F9B1E1"))
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing, .bottom], 15)
        }
        .background(Color(hex: "282828"))
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(totalAmount: 36.15, totalQuantity: 3)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

