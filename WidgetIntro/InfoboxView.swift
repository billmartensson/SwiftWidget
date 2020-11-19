//
//  InfoboxView.swift
//  WidgetIntro
//
//  Created by Bill Martensson on 2020-11-19.
//

import SwiftUI

struct InfoboxView: View {
    var body: some View {
        VStack {
            Text("INFO")
        }
        .frame(width: 100.0, height: 100.0)
        .background(Color.green)
        .cornerRadius(20)
        
    }
}

struct InfoboxView_Previews: PreviewProvider {
    static var previews: some View {
        InfoboxView()
            .previewLayout(.sizeThatFits)
    }
}
