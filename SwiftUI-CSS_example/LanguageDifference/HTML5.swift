//
//  HTML5.swift
//  SwiftUI-CSS_example
//
//  Created by liang on 2019/8/11.
//  Copyright © 2019 liang. All rights reserved.
//

import SwiftUI

struct HTML5: View {
    var body: some View {
        VStack {
            Image("image-html5")
                .resizable()
            .scaledToFit()
                .frame(width:100, height:100)
            .cornerRadius(10)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))

            
            Text("HTML5")
                .font(.headline)
                .foregroundColor(Color(red: 0x33/0xff, green: 0x33/0xff, blue: 0x33/0xff))
                .padding(.bottom, 10)
            
            Text("HTML 5 (formerly and commonly spelled HTML5[a]) is a software solution stack that defines the properties and behaviors of web page content by implementing a markup based pattern to it.")
                .font(.footnote)
                .padding(.horizontal, 10)
                .foregroundColor(NormalDescColor)
                .lineSpacing(2)
            .frame(minHeight: 100, maxHeight: .infinity)
            
            HStack {
                Text("Code Sample:")
                .font(.caption)
                
                Spacer()
            }.padding([.horizontal], 10)
            
            HStack {
                Text("""
<p>At Mozilla, we’re a global community of</p>

    <ul>
        <li>technologists</li>
        <li>thinkers</li>
        <li>builders</li>
    </ul>

<p>working together ... </p>
""")
                    .foregroundColor(SourceCodeColor)
                    .font(Font.system(size: 12))
                
                Spacer()
            }
            .padding(10)
            .background(Color.init(red: 0xee/0xff, green: 0xee/0xff, blue: 0xee/0xff))

            VStack {
                Divider()
                HStack() {
                    Text("Developed by:")
                        .font(Font.system(size: 14))
                    
                    Button(action: {
                        
                    }) {
                        Text("WHATWG")
                           .font(Font.system(size: 12))
                    }
                    
                    Spacer()
                }.padding([.top], 5)
                HStack() {
                    Text("Initial release:")
                        .font(Font.system(size: 14))
                    
                    Text("28 October 2014")
                    .font(Font.system(size: 12))
                    .foregroundColor(NormalDescColor)
                    
                    Spacer()
                }.padding([.top], 5)
            }.padding(EdgeInsets(top: 2, leading: 10, bottom: 10, trailing: 10))

        }
    }
}

#if DEBUG
struct HTML5_Previews: PreviewProvider {
    static var previews: some View {
        HTML5()
    }
}
#endif
