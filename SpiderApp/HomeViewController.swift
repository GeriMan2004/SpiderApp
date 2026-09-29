//
//  HomeViewController.swift
//  SpiderApp
//
//  Created by Gerard Pérez i Carbò on 29/09/2026.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var greetingLabel: UILabel!

    var email: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Welcome,\n\(email)"
        print("Home viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Home viewWillAppear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Home viewDidDisappear")
    }

    deinit {
        print("Home deinit")
    }
}
