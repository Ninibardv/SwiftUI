import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("swiftunia davalebuka")
            .foregroundColor(.white)
            .font(.system(size: 34))
            .padding(.bottom, -7)
        HStack {
            MusicView()
            VStack(spacing: 10) {
                ChatView()
                NewsView()
            }
        }
        .padding()
    }
}
#Preview {
    ContentView()
        .background(Color("Background"))
}
