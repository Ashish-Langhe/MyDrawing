//
//  ContentView.swift
//  Shared
//
//  Created by user208584 on 12/14/21.
//

import SwiftUI

struct Line {
    
    //MARK: - PROPERTIES
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth:Double = 3.0
}
struct ContentView: View {
    
    @State private var currentLine = Line()
    @State private var lines:[Line] = []
    @State private var selectedColor:Color = .red
    @State private var thickness:Double = 0.0
    //MARK: - BODY
    var body: some View {
        VStack {
            if #available(macOS 12.0, *) {
                Canvas { context, size in
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                    }
                }
                
                    .frame(minWidth:400, minHeight: 400)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged ({ value in
                        let newPoint = value.location
                    currentLine.points.append(newPoint)
                    lines.append(currentLine)
                    })
                    .onEnded({ value in
                   //  self.lines.append(currentLine)
                    self.currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
                    })
                )
            } else {
                // Fallback on earlier versions
            }
            Spacer()
            HStack {
                
                Slider(value: $thickness, in: 1...20) {
                    Text("Thickness")
                }.frame(maxWidth:200)
                    .onChange(of: thickness) { newThickness in
                        currentLine.lineWidth = newThickness
                    }
                Divider()
                ColorPickerView(selectedColor: $selectedColor)
                    .onChange(of: selectedColor) { newColor in
                        currentLine.color = newColor
                }
            }
            .frame(maxHeight:40)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
