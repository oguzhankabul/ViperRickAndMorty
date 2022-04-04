//
//  DashboardCell.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import UIKit

class DashboardCell: BaseCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return titleLabel
    }()
    
    public override func setupViews() {
        super.setupViews()
        contentView.addSubviews([image,
                                 titleLabel])
        contentView.clipsToBounds = true
    }
    
    override func setupLayout() {
        super.setupLayout()
        image.anchor(top: topAnchor,
                     bottom: bottomAnchor,
                     leading: leadingAnchor,
                     trailing: nil,
                     paddingTop: 5,
                     paddingBottom: 5,
                     paddingLeft: 5,
                     paddingRight: 0,
                     width: 65,
                     height: 75)
        
        titleLabel.anchor(top: nil,
                          bottom: nil,
                          leading: image.trailingAnchor,
                          trailing: trailingAnchor,
                          paddingTop: 0,
                          paddingBottom: 0,
                          paddingLeft: 5,
                          paddingRight: 5,
                          width: 0,
                          height: 0)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

