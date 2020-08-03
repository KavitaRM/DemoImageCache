//
//  CustomCell.swift
//  DemoImageCache
//
//  Created by Kavita Malagavi on Aug-3-2020.
//  Copyright © 2020 Kavita Malagavi. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let descriprionLabel = UILabel()
    var titleLabel = UILabel()
    
    let rowImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var model: RowValues? {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {
        titleLabel.text = model?.title
        descriprionLabel.text = model?.description
        
        setupRowImage()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(rowImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriprionLabel)
        
        configureTitleLabel()
        configureDescriptionLabel()
        
        setupImageConstraints()
        setupTitleLabelConstraints()
        setupDescriprionLabelConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
    }
    
    func configureDescriptionLabel() {
        descriprionLabel.numberOfLines = 0
        descriprionLabel.font = UIFont(name: "Avenir-Book", size: 12)
        descriprionLabel.textColor = UIColor.darkGray
    }
    
    func setupRowImage() {
        if let thumbnailImageUrl = model?.imageUrl {
            rowImage.loadImageUsingUrlString(urlString: thumbnailImageUrl)
        } else {
            rowImage.image = UIImage(named: "placeholder")
        }
    }
    
    func setupImageConstraints() {
        rowImage.translatesAutoresizingMaskIntoConstraints = false
        rowImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rowImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        rowImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rowImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTitleLabelConstraints() {
        let marginGuide = contentView.layoutMarginsGuide
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: rowImage.leadingAnchor, constant: 75).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    }
    
    func setupDescriprionLabelConstraints() {
        let marginGuide = contentView.layoutMarginsGuide
        descriprionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriprionLabel.leadingAnchor.constraint(equalTo: rowImage.leadingAnchor, constant: 75).isActive = true
        descriprionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        descriprionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriprionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    }
    
}
