import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            HStack(spacing: 5) {
                Image("Shikolad")
                    .resizable()
                    .frame(width: 60, height: 70)
                Text("შიკოლადები")
                    .font(.largeTitle)
                    .bold()
            }
            Spacer()
        }
        .padding()
        .background(Color(hex: "F9B1E1"))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

