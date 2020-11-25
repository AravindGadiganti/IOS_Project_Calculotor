//
//  RoundButton.swift
//  IOS_Final_Project_Calculator
//
//  Created by Aravind Gadiganti on 21/11/20.
//  Copyright © 2020 Aravind Gadiganti. All rights reserved.
//

import UIKit
@IBDesignable
    class RoundButton:UIButton{
@IBInspectable var roundButton:Bool = false {
    didSet {
        if roundButton {
        layer.cornerRadius = frame.height / 2
    }
    }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
    }
}
}

