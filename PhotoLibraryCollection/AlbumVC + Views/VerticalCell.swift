//
//  VerticalCell.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 08.06.2022.
//

import UIKit

class VerticalCell: UICollectionViewCell {
    
    static let identifire = "VerticalCell"
    
    //MARK: - Views
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var subTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right", withConfiguration:  UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?
            .withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var lineSeparator: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .systemGray4
        return line
    }()
    
    //MARK: - Inititalize
    
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
        contentView.addSubview(iconView)
        contentView.addSubview(textLabel)
        contentView.addSubview(subTextLabel)
        contentView.addSubview(button)
        contentView.addSubview(lineSeparator)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 25),
            iconView.heightAnchor.constraint(equalToConstant: 25),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            textLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 15),
            textLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            
            button.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            button.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
            
            subTextLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -10),
            subTextLabel.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
            
            lineSeparator.topAnchor.constraint(equalTo: bottomAnchor),
            lineSeparator.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 15),
            lineSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineSeparator.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
