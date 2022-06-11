//
//  SearchViewController.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 06.06.2022.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private

private extension SearchViewController {
    
    func setupView() {
        view.backgroundColor = .white
        title = "Поиск"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

