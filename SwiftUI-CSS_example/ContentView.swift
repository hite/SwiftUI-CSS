//
//  ContentView.swift
//  SwiftUI-CSS_example
//
//  Created by liang on 2019/8/10.
//  Copyright © 2019 liang. All rights reserved.
//

import SwiftUI

let languageLogo_clsName = CSSStyle([
    .width(100),
    .height(100),
    .cornerRadius(100)
])

// color
let NormalDescColor = Color(red: 0x77/0xff, green: 0x77/0xff, blue: 0x77/0xff)
let PrimaryLabelColor = Color(red: 0x33/0xff, green: 0x33/0xff, blue: 0x33/0xff)

let SourceCodeColor = Color.blue

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            Text("The history of languages")
                .setStyle([
                    .font(.title),
                    .height(40)
                ])
            HTML5()
            
            Swift()
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
