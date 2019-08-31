#  The missing CSS-like module for SwiftUI
> Check out the [example project using SwiftUI-CSS](https://github.com/hite/SwiftUI-CSS_example)

The SwiftUI is a great UI development framework for the iOS app. After I wrote some to-be-released app with SwiftUI framework, I realized that I need a solution to write more clear, simple, view-style-decoupled code with lots of custom style design.

So here is **SwiftUI-CSS**. With **SwiftUI-CSS**, you can:

## 1. write View-style-decoupled codes
*View-style-decoupled* makes your source code more clear to read, easy to refactor like html with CSS support.

### Without SwifUI-CSS:

The codes to define View Structure blend into style-defined codes.

``` swift
             Image("image-swift")
                 .resizable()
                 .scaledToFit()
                 .frame(width:100, height:100)
                 .cornerRadius(10)
                 .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))

              Text("Swift")
                 .font(.headline)
                 .foregroundColor(Color(red: 0x33/0xff, green: 0x33/0xff, blue: 0x33/0xff))
                 .padding(.bottom, 10)

 
              Text("Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. for iOS, macOS, watchOS, tvOS, Linux, and z/OS. ")
                 .font(.footnote)
                 .padding(.horizontal, 10)
                 .foregroundColor(NormalDescColor)
                 .lineSpacing(2)
                 .frame(minHeight: 100, maxHeight: .infinity)
```
### With SwifUI-CSS:

1. We divide the previous into two parts. The first part is view structures with class name:

``` swift
            Image("image-swift")
                .resizable()
                .scaledToFit()
                .addClassName(languageLogo_clsName)
  
            Text("Swift")
                .addClassName(languageTitle_clsName)
            
     
            Text("Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. for iOS, macOS, watchOS, tvOS, Linux, and z/OS. ")
                .addClassName(languageDesc_clsName)
```

2. The another is style definition:
``` swift
let languageLogo_clsName = CSSStyle([
    .width(100),
    .height(100),
    .cornerRadius(10),
    .paddingTLBT(10, 0, 15,0)
])

let languageTitle_clsName = CSSStyle([
    .font(.headline),
    .foregroundColor(Color(red: 0x33/0xff, green: 0x33/0xff, blue: 0x33/0xff)),
    .paddingEdges([.bottom], 10)
])

let languageDesc_clsName = CSSStyle([
    .font(.footnote),
    .paddingHorizontal(10),
    .foregroundColor(NormalDescColor),
    .lineSpacing(2),
    .flexHeight(min: 50, max: .infinity)
])
```
## 2. use module system for reuse or create a custom desing system.
*module system* help to reuse some common style design across the whole app which can save you to write same codes everywhere or avoid to make some mistakes.

### Without SwifUI-CSS:
If you change the style of Text("28 October 2014"), you must change the style of Text("Objective-C,[7] Rust, Haskell, Ruby, Python, C#, CLU,[8] D[9]") too.
```swift
// in html5.swift
                HStack() {
                    Text("Initial release:")
                        .font(Font.system(size: 14))
                    
                    Text("28 October 2014")
                    .font(Font.system(size: 12))
                    .foregroundColor(NormalDescColor)

                }
// in swift.swift
                HStack(alignment: .top) {
                    Text("Influenced by:")
                        .font(Font.system(size: 14))
                    
                    Text("Objective-C,[7] Rust, Haskell, Ruby, Python, C#, CLU,[8] D[9]")
                    .font(Font.system(size: 12))
                    .foregroundColor(NormalDescColor)

                }
```
### With SwiftUI-CSS
You can change the definition of wikiDesc_clsName once for all.
``` switfui
let wikiDesc_clsName = CSSStyle([
    .font(Font.system(size: 12)),
    .foregroundColor(NormalDescColor)
])

// in html5.swift
                HStack() {
                    Text("Initial release:")
                        .font(Font.system(size: 14))
                    
                    Text("28 October 2014")
                    .addClassName(wikiDesc_clsName)

                }
// in swift.swift
                HStack(alignment: .top) {
                    Text("Influenced by:")
                        .font(Font.system(size: 14))
                    
                    Text("Objective-C,[7] Rust, Haskell, Ruby, Python, C#, CLU,[8] D[9]")
                    .addClassName(wikiDesc_clsName)

                }
```

## the other benefits of using SwiftUI-CSS
1. more easy to change a lot of styles when state change.
``` switfui
// without swiftui-css
if festival == 'Christmas' {
     Text("Welcome everyone!")
     .font(.largeTitle)
     .foreground(.white)
     .background(.red)
} else {
        Text("Welcome everyone!")
     .font(.title)
     .foreground(.darkGray)
     .background(.white)
}

// with
Text("Welcome everyone!")
.addClassName(fesitval == 'Christmas' ? chrismas_clsName: normal_clsName)
```
2. Maybe a reachable way to convert html+css codes  to swiftui source
3. write less code, clear to tell parameters meanings. For example. 
> `.frame(minHeight: 50, maxheight: .infinity` to `.flexHeight(min: 50, max: .infinity)`
> `.padding(EdgeInset(top:10, leading: 15, bottom:0, trailing: 20)` to `.paddingTLBT(10,15,0,20)`
4. (to be continued)



