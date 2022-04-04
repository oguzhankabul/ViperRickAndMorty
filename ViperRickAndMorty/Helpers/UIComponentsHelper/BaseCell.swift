//
//  BaseCell.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import UIKit

typealias BaseCell = BaseTableViewCell & ReusableView

public protocol Reuse: AnyObject {
    static var reuseIdentifier: String { get }
}

open class BaseTableViewCell: UITableViewCell, Reuse {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupLayout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
        setupLayout()
    }
    
    open func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    open func setupLayout() {}
}
