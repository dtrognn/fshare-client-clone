//
//  SpashViewController.swift
//  graduation-thesis
//
//  Created by Vu Duc Trong on 25/03/2023.
//

import UIKit

class HomeViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.performSegue(withIdentifier: "\(Self.self)", sender: nil)
        }
    }
}
