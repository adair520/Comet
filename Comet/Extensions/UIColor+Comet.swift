//
//  UIColor+Comet.swift
//  Comet
//
//  Created by Harley on 2016/11/8.
//
//

import UIKit

public extension UIColor {

    /**
     *  使用16进制字符串创建颜色
     *
     *  @param hexString 16进制字符串，可以是 0XFFFFFF/#FFFFFF/FFFFFF 三种格式之一
     *
     *  @return 返回创建的UIColor对象
     */
    public convenience init?(hex: String, alpha: CGFloat = 1) {
        
        let characterSet = CharacterSet.whitespacesAndNewlines
        var string = hex.trimmingCharacters(in: characterSet).uppercased()
        
        if string.characters.count < 6 {
            return nil
        }

        if string.hasPrefix("0X") {
            let ns = string as NSString
            string = ns.substring(from: 2)
        }
        if string.hasPrefix("#") {
            let ns = string as NSString
            string = ns.substring(from: 1)
        }
        
        if string.characters.count != 6 {
            return nil
        }

        let colorString = string as NSString
        var range = NSMakeRange(0, 2)
        
        let rString = colorString .substring(with: range)
        
        range.location += 2
        let gString = colorString.substring(with: range)
        
        range.location += 2
        let bString = colorString.substring(with: range)
        
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
