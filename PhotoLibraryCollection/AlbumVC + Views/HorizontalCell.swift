//
//  HorizontalCell.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 06.06.2022.
//

import UIKit

class HorizontalCell: UICollectionViewCell {
    
    static let identifire = "HorizontalCell"
    
    //MARK: - Views
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.layer.cornerRadius = 9
        imageView.backgroundColor = .black
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var secondaryTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .thin)
        label.textColor = .systemGray
        label.textAlignment = .left
        
        return label
    }()
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    //MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(secondaryTextLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -4),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            secondaryTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 3),
            secondaryTextLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            secondaryTextLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
        ])
    }
}
