//
//  ContentView.swift
//  GraphicsGettingStarted
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //example1
        //example2
        //example3
        //example4
        //example5
        //example6
        //example7
        example8
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private var example1: some View {
        VStack {
            Text("DevTechie")
            Rectangle()
                .fill(Color.blue)
                .padding()
            Circle()
                .fill(Color.orange)
                .padding()
            Capsule()
                .stroke(Color.green, lineWidth: 10)
                .padding()
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, dash: [CGFloat(10)]))
                .padding()
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 10, dash: [CGFloat(2), CGFloat(5), CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(1)))
                .padding()
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.orange)
                .overlay(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.blue, lineWidth: 5)
                )
                .padding()
        }
    }
    
    private var example2: some View {
        Path { path in
            path.move(to: CGPoint(x:20, y: 20))
            path.addLine(to: CGPoint(x: 20, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.closeSubpath()
        }
    }
    
    private var example3: some View {
        Triangle()
            .fill(Color.orange)
            .frame(width: 200, height: 400)
    }
    
    private var example4: some View {
        MyCustomShape()
            .fill(Color.blue)
    }
    
    // MARK: - Gradients
    private var colors = Gradient(colors: [Color.blue, Color.orange, Color.yellow, Color.green, Color.purple, Color.pink])
    private var example5: some View {
        Circle()
            .fill(RadialGradient(gradient: colors, center: .center, startRadius: 5, endRadius: 200))
    }
    
    private var example6: some View {
        Circle()
            .fill(AngularGradient(gradient: colors, center: .center))
    }
    
    private var example7: some View {
        MyCustomShape()
            .fill(LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing))
            .shadow(color: .white, radius: 10, x: 1, y: 1)
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .ignoresSafeArea()
    }
    
    @State private var waterCounter = 0
    private var example8: some View {
        VStack {
            Text("Water consumption: \(waterCounter) glass.")
            Button(action: {
                waterCounter += 1
            }) {
                DropShape()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .topLeading, endPoint: .bottom))
                    .frame(width: 200, height: 200)
                    .overlay(
                        VStack {
                            Spacer()
                            Text("+1 glass")
                                .foregroundColor(.white)
                                .padding(.bottom)
                        }
                    )
            }
        }
    }
}

struct DropShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: 0), control: CGPoint(x: 0, y: rect.maxY))
        }
    }
}

struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x:rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
