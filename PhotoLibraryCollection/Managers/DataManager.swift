//
//  DataManager.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 07.06.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var sectionHeaders: [String] {
        ["Мои альбомы", "Общие альбомы", "Типы медиафайлов", "Другое"]
    }

    var itemsInSections: [[SectionItem]] {
        [
            [
                SectionItem(title: "Недавние", subtitle: "123", image: "1.1", sectionType: .firstSectionType),
                SectionItem(title: "Insagram", subtitle: "231", image: "1.2", sectionType: .firstSectionType),
                SectionItem(title: "WhatsApp", subtitle: "17", image: "1.3", sectionType: .firstSectionType),
                SectionItem(title: "Pinterest", subtitle: "210", image: "1.4", sectionType: .firstSectionType),
                SectionItem(title: "VSCO Cam", subtitle: "140", image: "1.5", sectionType: .firstSectionType),
                SectionItem(title: "Избранное", subtitle: "300", image: "1.6", sectionType: .firstSectionType),
                SectionItem(title: "Мемы", subtitle: "1000", image: "1.7", sectionType: .firstSectionType)
            ],
            
            [
                SectionItem(title: "Поход Карелия", subtitle: "394", image: "2.1", sectionType: .secondSectionType),
                SectionItem(title: "ЕвроТрип", subtitle: "1231", image: "2.2", sectionType: .secondSectionType),
                SectionItem(title: "Что-нибудь еще", subtitle: "417", image: "2.3", sectionType: .secondSectionType),
                SectionItem(title: "Еще что-нибудь", subtitle: "422)", image: "2.4", sectionType: .secondSectionType)
            ],
            [
                SectionItem(title: "Видео", subtitle: "123", image: "video", sectionType: .secondSectionType),
                SectionItem(title: "Селфи", subtitle: "231", image: "person.crop.square", sectionType: .secondSectionType),
                SectionItem(title: "Фото Live Photos", subtitle: "333", image: "livephoto", sectionType: .secondSectionType),
                SectionItem(title: "Портреты", subtitle: "444", image: "cube", sectionType: .secondSectionType),
                SectionItem(title: "Панорамы", subtitle: "555", image: "rectangle", sectionType: .secondSectionType),
                SectionItem(title: "Замедленно", subtitle: "666)", image: "timelapse", sectionType: .secondSectionType),
                SectionItem(title: "Серии", subtitle: "777)", image: "square.stack.3d.down.right", sectionType: .secondSectionType),
                SectionItem(title: "Снимки экрана", subtitle: "888", image: "camera.viewfinder", sectionType: .secondSectionType),
                SectionItem(title: "Записи экрана", subtitle: "1222", image: "record.circle", sectionType: .secondSectionType),
                SectionItem(title: "RAW", subtitle: "11", image: "r.square.on.square", sectionType: .secondSectionType)
            ],
            [
                SectionItem(title: "Импортированные", subtitle: "12312", image: "square.and.arrow.down", sectionType: .fourthSectionType),
                SectionItem(title: "Скрытые", subtitle: "0", image: "eye.slash", sectionType: .fourthSectionType),
                SectionItem(title: "Недавно удаленные", subtitle: "12233", image: "trash", sectionType: .fourthSectionType),
            ]
        ]
    }
    
    private init() {}
}
