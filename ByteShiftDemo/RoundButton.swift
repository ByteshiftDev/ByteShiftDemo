//
//  RoundButton.swift
//  ByteShiftDemo
//
//  Created by Cher Moua on 7/27/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import UIKit


@IBDesignable
class RoundButton: UIButton {
    // Let this property to show up on the Attribute inspector
    @IBInspectable var cornerRadius: CGFloat = 0{
        // This is where "what" happens when the property changes
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
