import SwiftUI

struct DeliveryDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("მიტანის დეტალები")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            Image("Map")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            HStack(spacing: 10) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(Color(hex: "F9B1E1"))
                    .font(.system(size: 35))
                VStack(alignment: .leading) {
                    Text("ილია ჭავჭავაძის, 23")
                        .font(.headline)
                    Text("მესამე კორპუსი, მეორე სართული, N23")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 10)
            
            HStack(spacing: 10) {
                Image(systemName: "gift.circle.fill")
                    .foregroundColor(Color(hex: "F9B1E1"))
                    .font(.system(size: 35))
                VStack(alignment: .leading) {
                    Text("სხვისთვის ყიდულობთ?")
                        .font(.headline)
                    Text("დაამატეთ დეტალები კურიერისთვის")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("მიტანის დრო: ")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                + Text("რაც შეიძლება მალე\n45-50 წუთი")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.all, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(hex: "282828"))
            .cornerRadius(10)
            
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

struct DeliveryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailsView()
    }
}


