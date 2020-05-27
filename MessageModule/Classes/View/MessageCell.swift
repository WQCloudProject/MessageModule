//
//  MessageCell.swift
//  MessageModule
//
//  Created by chenweiqiang on 2020/5/23.
//

import UIKit
import SnapKit

class MessageCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        ///self.selectionStyle = .none
        contentView.backgroundColor = .white
        
        configureUI()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.addSubview(iconImageView)
        self.addSubview(nameLabel)
        self.addSubview(detailLabel)
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.centerY.equalTo(self)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(widthFit(53))
            make.centerY.equalTo(self)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        detailLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(widthFit(-40))
            make.centerY.equalTo(self)
            make.width.equalTo(120)
            make.height.equalTo(nameLabel)
        }

    }
    
    lazy var iconImageView: UIImageView = {
        
        let imageV = UIImageView()
        imageV.backgroundColor = .brown
        return imageV
        
    }()
    lazy var nameLabel:UILabel = {
        
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.textColor = ColorHex("#222222")
        return lab
        
    }()
    
    lazy var detailLabel:UILabel = {
        
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.textColor = NineColor
        lab.textAlignment = .right
        return lab
        
    }()
    
}
