//
//  ReusableView.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
