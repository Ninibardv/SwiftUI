import SwiftUI

struct NewsView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .foregroundColor(Color.pink)
                
                VStack(alignment: .leading) {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 30, height: 30)
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                        }
                        Text("სიახლე")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(.leading, 5)
                    }
                    Spacer()
                }
                .padding(12)
                
                Image("news")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .offset(x: geometry.size.width - 70, y: geometry.size.height - 70)
            }
            .cornerRadius(18.0)
            .frame(width: 165, height: 110)
        }
        .frame(width: 165, height: 110)
    }
}
#Preview {
    NewsView()
}
