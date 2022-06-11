//
//  ForUsViewController.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 06.06.2022.
//

import UIKit

class ForUsViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private

private extension ForUsViewController {
    
    func setupView() {
        view.backgroundColor = .white
        title = "Для Вас"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
