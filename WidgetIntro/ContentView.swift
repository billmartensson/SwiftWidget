//
//  ContentView.swift
//  WidgetIntro
//
//  Created by Bill Martensson on 2020-11-19.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            InfoboxView()
            
            Button(action: {
                WidgetCenter.shared.reloadAllTimelines()
            }) {
                Text("Ladda om widget")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
