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
    var lineWidth:Double = 1.0
}
struct ContentView: View {
    
    //MARK: - BODY
    var body: some View {
        VStack {
            if #available(macOS 12.0, *) {
                Canvas { context, size in
                    
                }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local))
            } else {
                // Fallback on earlier versions
            }
        }.frame(minWidth: 400, minHeight: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
