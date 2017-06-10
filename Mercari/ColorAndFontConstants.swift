//
//  ColorAndFontConstants.swift
//  Mercari
//
//  Created by Ekta Agrawal on 6/8/17.
//  Copyright © 2017 Mercari. All rights reserved.
//

import UIKit

//These Constants are used to setup the colors and fonts through out the app. you can specify the font color and text color for each view and name it accordingly
struct ColorAndFontConstants
{
    struct MainScreenColors {
        static let priceTitleColor = UIColor.white
        static let nameTitleColor = UIColor.black
        static let viewBackgroundColor = UIColor.black
        static let priceBackgroundColor = UIColor.darkGray
    }
    
    struct MainScreenFont {

        static let priceTitleFont = UIFont.systemFont(ofSize: 10.0)
        static let nameTitleFont = UIFont.systemFont(ofSize: 13.0)
    }
    
}
