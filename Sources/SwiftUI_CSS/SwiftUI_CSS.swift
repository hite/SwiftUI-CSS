//
//  CSSStyle.swift
//  SwiftUI_CSS
//
//  Created by liang on 2019/8/6.
//  Copyright © 2019 liang. All rights reserved.
//


import SwiftUI
import Foundation

// https://mecid.github.io/2019/08/07/viewmodifiers-in-swiftui/
extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}

public enum CSSProperty {
    case font(Font)
    case foregroundColor(Color)
    case backgroundColor(Color)
    case lineLimit(Int)
    case lineSpacing(CGFloat)
    
    case padding(CGFloat)
    case paddingHorizontal(CGFloat)
    case paddingVertical(CGFloat)
    case paddingEdges(Edge.Set, CGFloat)
    // TLBT = top + leading + bottom + trailing .It differs from css-style definition that is top, right, bottom, left
    case paddingTLBT(CGFloat, CGFloat, CGFloat, CGFloat)
    
    case opacity(Double)
    case shadow(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat)
    case border(color: Color, width: CGFloat)
    case cornerRadius(_ radius: CGFloat)
    // frame cluster
    case frameAlignment(Alignment)
    case width(CGFloat)
    case height(CGFloat)
    case frame(width: CGFloat?, height: CGFloat?, alignment: Alignment)
    case flexWidth(min: CGFloat?, max: CGFloat?)
    case flexHeight(min: CGFloat?, max: CGFloat?)

    case position(x: CGFloat, y: CGFloat)
    case offset(x: CGFloat, y: CGFloat)
    case clipped(antialiased: Bool)
    
}

extension CSSProperty {
    
}

public struct CSSStyle {
    
    fileprivate var properties: [CSSProperty]
    
    public init(_ properties: [CSSProperty]) {
        self.properties = properties
    }
    
    func applyStyle(content: AnyView) -> AnyView {
        return properties.reduce(content) { (newContent: AnyView, style: CSSProperty) -> AnyView in
            switch style {
                
            case .font(let font):
                return self.applyFont(content: newContent, font: font)
            case .foregroundColor(let color):
                return self.applyForegroundColor(content: newContent, color: color)
            case .backgroundColor(let bgColor):
                return self.applyBackgroundColor(content: newContent, color: bgColor)
            case .lineLimit(let limit):
                return self.applyLineLimit(content: newContent, limit: limit)
            case .lineSpacing(let spacing):
                return self.applyLineSpacing(content: newContent, spacing: spacing)
            case .padding(let padding):
                return self.applyPaddingByEdge(content: newContent, directions: [.all], padding: padding)
            case .paddingHorizontal(let padding):
                return self.applyPaddingByEdge(content: newContent, directions: [.horizontal], padding: padding)
            case let .paddingEdges(edges, padding):
                return self.applyPaddingByEdge(content: newContent, directions: edges, padding: padding)
            case .paddingVertical(let padding):
                return self.applyPaddingByEdge(content: newContent, directions: [.vertical], padding: padding)
            case let .paddingTLBT(top, leading, bottom, trailing):
                return self.applyPaddingAll(content: newContent, inset: .init(top: top, leading: leading, bottom: bottom, trailing: trailing))
            case .opacity(let opacity):
                return self.applyOpacity(content: newContent, opacity: opacity)
            case let .shadow(color, radius, x, y):
                return self.applyShadow(content: newContent, color: color, radius: radius, x: x, y: y)
            case let .border(color, width):
                return self.applyBorder(content: newContent, color: color, width: width)
            case let .cornerRadius(width):
                return self.applyCornerRadius(content: newContent, radius: width)
            case .frameAlignment(let align):
                return self.applyFrameAlignment(content: newContent, align: align)
            case .width(let width):
                return self.applyWidth(content: newContent, width: width)
            case .height(let height):
                return self.applyHeight(content: newContent, height: height)
            case let .frame(width, height, alignment):
                return self.applyFrame(content: newContent, width: width, height: height, alignment: alignment)
            case let .flexWidth(minWidth, maxWidth):// the disadv
                return self.applyFlexWidth(content: newContent, minWidth: minWidth, idealWidth: nil, maxWidth: maxWidth)
            case let .flexHeight(minHeight, maxHeight):
                return self.applyFlexHeight(content: newContent, minHeight: minHeight, idealHeight: nil, maxHeight: maxHeight)
            case let .position(x, y):
                return self.applyPosition(content: newContent, x: x, y: y)
            case let .offset(x, y):
                return self.applyOffset(content: newContent, x: x, y: y)
            case .clipped(let antialiased):
                return self.applyClipped(content: newContent, antialiased: antialiased)
            }
        }
    }
    
    func applyForegroundColor(content: AnyView, color: Color) -> AnyView {
        return content.foregroundColor(color).eraseToAnyView()
    }
    func applyFont(content: AnyView, font: Font?) -> AnyView {
        return content.font(font).eraseToAnyView()
    }
    func applyBackgroundColor(content: AnyView, color: Color) -> AnyView {
        return content.background(color).eraseToAnyView()
    }
    func applyLineLimit(content: AnyView, limit: Int) -> AnyView {
        return content.lineLimit(limit).eraseToAnyView()
    }
    func applyLineSpacing(content: AnyView, spacing: CGFloat) -> AnyView {
        return content.lineSpacing(spacing).eraseToAnyView()
    }
    func applyPaddingByEdge(content: AnyView, directions: Edge.Set, padding: CGFloat) -> AnyView {
        return content.padding(directions, padding).eraseToAnyView()
    }
    func applyPaddingAll(content: AnyView, inset: EdgeInsets) -> AnyView {
        return content.padding(inset).eraseToAnyView()
    }
    func applyOpacity(content: AnyView, opacity: Double) -> AnyView {
        return content.opacity(opacity).eraseToAnyView()
    }
    func applyShadow(content: AnyView, color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) -> AnyView {
        return content.shadow(color: color, radius: radius, x: x, y: y).eraseToAnyView()
    }
    func applyBorder(content: AnyView, color: Color, width: CGFloat) -> AnyView {
        return content.border(color, width: width).eraseToAnyView()
    }
    func applyCornerRadius(content: AnyView, radius: CGFloat) -> AnyView {
        return content.cornerRadius(radius, antialiased: true).eraseToAnyView()
    }
    func applyFrameAlignment(content: AnyView, align: Alignment) -> AnyView {
        return content.frame(alignment: align).eraseToAnyView()
    }
    func applyWidth(content: AnyView, width: CGFloat) -> AnyView {
        return content.frame(width: width).eraseToAnyView()
    }
    func applyHeight(content: AnyView, height: CGFloat) -> AnyView {
        return content.frame(height: height).eraseToAnyView()
    }
    func applyFrame(content: AnyView, width: CGFloat?, height: CGFloat?, alignment: Alignment) -> AnyView {
        return content.frame(width: width, height: height, alignment: alignment).eraseToAnyView()
    }
    func applyFlexWidth(content: AnyView, minWidth: CGFloat?, idealWidth: CGFloat?, maxWidth: CGFloat?) -> AnyView {
        return content.frame(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth).eraseToAnyView()
    }
    func applyFlexHeight(content: AnyView, minHeight: CGFloat?, idealHeight: CGFloat?, maxHeight: CGFloat?) -> AnyView {
        return content.frame(minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight).eraseToAnyView()
    }
    func applyPosition(content: AnyView, x: CGFloat, y: CGFloat) -> AnyView {
        return content.position(x:x, y: y).eraseToAnyView()
    }
    func applyOffset(content: AnyView, x: CGFloat, y: CGFloat) -> AnyView {
        return content.offset(x:x, y: y).eraseToAnyView()
    }
    func applyClipped(content: AnyView, antialiased: Bool) -> AnyView {
        return content.clipped(antialiased: antialiased).eraseToAnyView()
    }
    
}

extension CSSStyle {
    public static func +(left: CSSStyle, right: CSSStyle) -> CSSStyle{
        return CSSStyle(left.properties + right.properties)
    }
}

struct CSSStyleModifier: ViewModifier {
    fileprivate let styleSheet: CSSStyle
    
    func body(content: _ViewModifier_Content<CSSStyleModifier>) -> some View {
        
        return styleSheet.applyStyle(content: content.eraseToAnyView())
    }
}


extension View {

    public func addClassName(_ clsName: CSSStyle) -> some View {
        ModifiedContent(content: self, modifier: CSSStyleModifier(styleSheet: clsName))
    }
    
    public func setStyle(_ properties: [CSSProperty]) -> some View {
        ModifiedContent(content: self, modifier: CSSStyleModifier(styleSheet: CSSStyle(properties)))
    }
    
    func changeClassName(_ clsName: CSSStyle) -> some View {
        // 省略
        return self
    }

}
