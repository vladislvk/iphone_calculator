import SwiftUI

struct ContentView: View {
    @State private var displayText:String = "test"
    
    struct GridItemData: Identifiable {
        let id: Int
        let value: Int
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let colors: [Color] = [
        Color(UIColor.systemGray2), Color(UIColor.systemGray2), Color(UIColor.systemGray2), .orange,
        Color(red: 0.33, green: 0.33, blue: 0.33), Color(red: 0.33, green: 0.33, blue: 0.33), Color(red: 0.33, green: 0.33, blue: 0.33), .orange,
        Color(red: 0.33, green: 0.33, blue: 0.33), Color(red: 0.33, green: 0.33, blue: 0.33), Color(red: 0.33, green: 0.33, blue: 0.33), .orange,
        Color(red: 0.33, green: 0.33, blue: 0.33), Color(red: 0.33, green: 0.33, blue: 0.33), Color(red: 0.33, green: 0.33, blue: 0.33), .orange,
        Color(red: 0.33, green: 0.33, blue: 0.33), Color(red: 0.33, green: 0.33, blue: 0.33), Color(red: 0.33, green: 0.33, blue: 0.33), .orange,
    ]
    
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
    
    func textForIndex(_ index: Int) -> String {
        switch index {
        case 0:
            return "AC"
        case 1:
            return "+/-"
        case 2:
            return "%"
        case 3:
            return "/"
        case 4:
            return "7"
        case 5:
            return "8"
        case 6:
            return "9"
        case 7:
            return "x"
        case 8:
            return "4"
        case 9:
            return "5"
        case 10:
            return "6"
        case 11:
            return "-"
        case 12:
            return "1"
        case 13:
            return "2"
        case 14:
            return "3"
        case 15:
            return "+"
        case 16:
            return "0"
        case 17:
            return "0"
        case 18:
            return "."
        case 19:
            return "="
        default:
            return ""
        }
    }
    
    func buttonAction(_ index:Int){
        
    }
}

#Preview {
    ContentView()
}

