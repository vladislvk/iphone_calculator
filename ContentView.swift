import SwiftUI

struct ContentView: View {
    @State private var displayText:String = "test"
    
    struct GridItemData: Identifiable {
        let id: Int
        let value: Int
    }
    
    var body: some View {
        ZStack {
            VStack {
                TextField("", text: $displayText)
                    .font(.largeTitle)
                    .padding(.top, 150)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.trailing)
                    .font(.title)
                    .fontWeight(.heavy)
                    .disabled(true)
                Spacer()
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(0..<20) { index in
                        Button(action: {}) {
                            Circle()
                                .fill(colors[index % colors.count])
                                .frame(height: 100)
                                .overlay(
                                    Text(textForIndex(index))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.title)
                                )
                        }
                    }
                }
            }
        }
        .background(Color.black)
    }
    
    
    func buttonAction(_ index:Int){
        
    }
}

#Preview {
    ContentView()
}

