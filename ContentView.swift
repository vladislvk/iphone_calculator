import SwiftUI

struct ContentView: View {
    @State private var displayText:String = ""
    
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
                        Button(action: {
                            buttonAction(index: index)
                        }) {
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
    
    
    func buttonAction(index: Int) {
        let buttonText = textForIndex(index)
        
        switch buttonText {
        case "AC":
            displayText = "0"
        case "+/-":
            if let value = Double(displayText) {
                displayText = String(-value)
            }
        case "%":
            if let value = Double(displayText) {
                displayText = String(value / 100)
            }
        case "/", "x", "-", "+":
            displayText += " \(buttonText) "
        case "=":
            displayText = evaluateExpression(displayText)
        default:
            if displayText == "0" && buttonText != "." {
                displayText = buttonText
            } else {
                displayText += buttonText
            }
        }
    }
    func evaluateExpression(_ expression: String) -> String {
            let exp = NSExpression(format: expression.replacingOccurrences(of: "x", with: "*"))
            if let result = exp.expressionValue(with: nil, context: nil) as? Double {
                return String(result)
            }
            return "Error"
        }
}

#Preview {
    ContentView()
}

