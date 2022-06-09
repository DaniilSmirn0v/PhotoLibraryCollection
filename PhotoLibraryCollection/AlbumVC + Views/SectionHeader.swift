//
//  SectionHeader.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 08.06.2022.
//

import UIKit
class SectionHeader: UICollectionReusableView {
    
    static let identifire = "SectionHeader"
    
    //MARK: - Views
    
    lazy var lineSeparator: UIView = {
        let lineSeparator = UIView()
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.backgroundColor = .systemGray4
        return lineSeparator
    }()
    
    lazy var label: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: 22, weight: .bold)
        lable.textColor = .white
        return lable
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Все", for: .normal)
        button.tintColor = .systemBlue
        return button
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
        addSubview(lineSeparator)
        addSubview(label)
        addSubview(button)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            lineSeparator.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            lineSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            lineSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineSeparator.heightAnchor.constraint(equalToConstant: 2),
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -28),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
