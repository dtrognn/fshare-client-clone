//
//  UIView+Style.swift
//  graduation-thesis
//
//  Created by Vu Duc Trong on 22/03/2023.
//

import UIKit

extension UIView {
    func border(width: CGFloat = 1, color: UIColor = .gray) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

extension UIView {
    func roundCorners(with radius: CGFloat = 20) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
