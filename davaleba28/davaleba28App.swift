import SwiftUI

@main
struct davaleba28App: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack {
                    ContentView()
                    BottomView()
                }
                ReloadButtonView()
                    .padding(.top, 693)
                    .padding(.leading, 315)
                    .padding(.trailing, 10)
            }
        }
    }
}

