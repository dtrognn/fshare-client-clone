//
//  BaseViewController.swift
//  graduation-thesis
//
//  Created by Vu Duc Trong on 25/03/2023.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Self.self, #function)
        configSubViews()
    }

    func configSubViews() {
        print(Self.self, #function)
    }

    func shoudClose() -> Bool {
        return true
    }

    @IBAction func touchUpInsideCloseButton(_ sedner: UIButton?) {
        DispatchQueue.main.async {
            guard self.shoudClose() else { return }
            if let nav = self.navigationController {
                nav.self.popViewController(animated: true)
            } else {
                self.dismiss(animated: true) { [weak self] in
                    self?.viewDidDisappear(true)
                }
            }
        }
    }

    func showAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach {
            alert.addAction($0)
        }
        present(alert, animated: true)
    }
}
