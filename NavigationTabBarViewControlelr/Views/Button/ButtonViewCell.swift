//
//  ButtonViewCell.swift
//  NavigationTabBarViewControlelr
//
//  Created by 薮木翔大 on 2022/11/11.
//

import Foundation
import UIKit

class ButtonViewCell:UICollectionViewCell{
    static let identifier = "ButtonViewCell"
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override var isSelected: Bool{
        didSet{
            backgroundColor = isSelected ? .link : .white
            label.textColor = isSelected ? .white : .darkGray
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title:String){
        label.text = title
        print(title)
        contentView.addSubview(label)
        label.constraints(top: contentView.safeAreaLayoutGuide.topAnchor, paddingTop: 0,
                          left: contentView.leftAnchor, paddingLeft: 0,
                          right: contentView.rightAnchor, paddingRight: 0,
                          bottom: contentView.bottomAnchor, paddingBottom: 0)
    }
    
}
