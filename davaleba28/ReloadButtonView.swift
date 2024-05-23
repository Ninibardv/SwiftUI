import SwiftUI

struct ReloadButtonView: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
            }) {
                Image("arrow 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
            }
        }
    }
}
#Preview {
    ReloadButtonView()
}
