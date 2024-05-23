import SwiftUI

struct MusicView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundColor(Color.orange)
            
            VStack(alignment: .leading) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 30, height: 30)
                        Image(systemName: "mic.fill")
                            .foregroundColor(.white)
                    }
                    Text("მუსიკა")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .padding(.leading, 5)
                }
                .padding(.top, 10)
                
                Spacer()
                
                Text("We love rappers and composure")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                HStack {
                    Spacer()
                    Image("music")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .padding(.bottom, 5)
                }
                .padding(.top, 0)
            }
            .padding(12)
        }
        .cornerRadius(18.0)
        .frame(width: 175, height: 230)
    }
}
#Preview {
    MusicView()
}
