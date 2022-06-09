//
//  PhotoLibrary.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 07.06.2022.
//

import Foundation

struct SectionItem {
    let title: String?
    let subtitle: String?
    let image: String
    let sectionType: SectionsType
    
    enum SectionsType: Int, CaseIterable {
        case firstSectionType
        case secondSectionType
        case thirdSectionType
        case fourthSectionType
        
        var columnCount: Int {
            switch self {
            case .firstSectionType:
                return 2
            case .secondSectionType:
                return 1
            case .thirdSectionType:
                return 1
            case .fourthSectionType:
                return 1
            }
        }
    }
    
    static let sectionHeaders = DataManager.shared.sectionHeaders
    static let itemsInSections = DataManager.shared.itemsInSections
    static func getItemsIn(section: Int) -> [SectionItem] {
        let sectionData = DataManager.shared.itemsInSections[section]
        return sectionData
    }
}
