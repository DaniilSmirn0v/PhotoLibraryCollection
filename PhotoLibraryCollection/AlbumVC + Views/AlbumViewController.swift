//
//  AlbumViewController.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 06.06.2022.
//

import UIKit

class AlbumViewController: UIViewController {
    
    //MARK: - Data
    let sectionsHeaders = SectionItem.sectionHeaders
    let itemsInSections = SectionItem.itemsInSections
    
    //MARK: - Views
    
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.register(HorizontalCell.self, forCellWithReuseIdentifier: HorizontalCell.identifire)
        collectionView.register(VerticalCell.self, forCellWithReuseIdentifier: VerticalCell.identifire)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifire)
        
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var navigationButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
//        button.title = "Settings"
        button.image = UIImage(systemName: "plus")
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupView() {
        overrideUserInterfaceStyle = .dark
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = navigationButton
        navigationItem.title = "Альбомы"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    //MARK: - Private methods
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {(sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection in
            let sectionLayoutKind = SectionItem.SectionsType.allCases[sectionIndex]
            let columns = sectionLayoutKind.columnCount
            
            switch sectionLayoutKind {
            case .firstSectionType:
                return self.createFirstSectionType(columns: columns)
            case .secondSectionType:
                return self.createSecondSectionType(columns: columns)
            case .thirdSectionType:
                return self.createThirdSectionType(columns: columns)
            case .fourthSectionType:
                return self.createThirdSectionType(columns: columns)
            }
        }
        return layout
    }
    
    private func createFirstSectionType(columns: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.7))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: columns)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = -15
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createSecondSectionType(columns: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: columns)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = -15
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createThirdSectionType(columns: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
        
        let section = NSCollectionLayoutSection(group: group)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

//MARK: - UICollectionViewDataSource
extension AlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SectionItem.getItemsIn(section: section).count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifire, for: indexPath) as? SectionHeader else {return SectionHeader()}
        headerView.frame.size.height = 55
        
        let sectionType = SectionItem.SectionsType.allCases[indexPath.section]
        
        switch sectionType {
        case .firstSectionType:
            headerView.label.text = SectionItem.sectionHeaders[indexPath.section]
            headerView.button.isHidden = false
        case .secondSectionType:
            headerView.label.text = SectionItem.sectionHeaders[indexPath.section]
            headerView.button.isHidden = false
        case .thirdSectionType:
            headerView.label.text = SectionItem.sectionHeaders[indexPath.section]
            headerView.button.isHidden = true
        case .fourthSectionType:
            headerView.label.text = SectionItem.sectionHeaders[indexPath.section]
            headerView.button.isHidden = true
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = itemsInSections[indexPath.section]
        let sectionItems = section[indexPath.item]
        let sectionType = SectionItem.SectionsType.allCases[indexPath.section]
        
        switch sectionType {
        case .firstSectionType:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCell.identifire, for: indexPath) as? HorizontalCell else { return UICollectionViewCell() }
            cell.titleLabel.text = sectionItems.title
            cell.secondaryTextLabel.text = sectionItems.subtitle
            cell.imageView.image = UIImage(named: sectionItems.image)
            return cell
        case .secondSectionType:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCell.identifire, for: indexPath) as? HorizontalCell else { return UICollectionViewCell() }
            cell.titleLabel.text = sectionItems.title
            cell.secondaryTextLabel.text = sectionItems.subtitle
            cell.imageView.image = UIImage(named: sectionItems.image)
            return cell
        case .thirdSectionType:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCell.identifire, for: indexPath) as? VerticalCell else {return UICollectionViewCell()}
            cell.iconView.image = UIImage(systemName: sectionItems.image)
            cell.textLabel.text = sectionItems.title
            cell.subTextLabel.text = sectionItems.subtitle
            cell.lineSeparator.isHidden = indexPath.item == 9 ? true : false
            return cell
        case .fourthSectionType:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCell.identifire, for: indexPath) as? VerticalCell else {return UICollectionViewCell()}
            cell.iconView.image = UIImage(systemName: sectionItems.image)
            cell.textLabel.text = sectionItems.title
            cell.subTextLabel.text = sectionItems.subtitle
            cell.lineSeparator.isHidden = indexPath.item == 2 ? true : false
            
            return cell
        }
    }
}

