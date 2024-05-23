import SwiftUI

struct BottomView: View {
    var body: some View {
        
        ScrollView {
            VStack() {
                ChatMessageView(title: "რა დაუწუნა ბარბარემ ნიკის?", description: "ნიკის ამაზე ჯერ განცხადება არ გაუკეთებია, ფანები ელოდებიან რომ რომელიმე მალე სიჩუმეს გაფანტავს.")
                Divider().background(Color.gray)
                
                ChatMessageView(title: "რა ზომის ფეხი აქვს ვასოს?", description: "ამჟამინდელი მონაცემებით მას დიდი ფეხი აქვს.")
                Divider().background(Color.gray)
                
                ChatMessageView(title: "რა სიმაღლისაა ანჟელა ew?", description: "ანჟელა ew არის მაღალი და ძალიან წარმატებული.")
                Divider().background(Color.gray)
                
                ChatMessageView(title: "რატომ გაებუტა ბარბარეს ჭეპეტე?", description: "ისინი 2 დღე არ ესაუბრებოდნენ ერთმანეთს.")
                Divider().background(Color.gray)
                
                ChatMessageView(title: "MVC vs MVVM", description: "რა განსხვავებაა MVC და MVVM შორის.")
                Divider().background(Color.gray)
                
                ChatMessageView(title: "ნეტავ რამდენი ხანი უნდა გაგრძელდეს ეს?", description: "დეველოპერები ძალიან გახარებულები არიან, თუმცა არავინ იცის რამდენიხანს გასტანს ეს Honeymoon phase")
            }
        }
    }
}

struct ChatMessageView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 40, height: 40)
                    Image(systemName: "doc.text")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(description)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.leading, 1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 15)
    }
}
#Preview {
    BottomView()
        .background(Color("Background"))
}
