//
//  CharacterDetailViewController.swift
//  SpiderApp
//
//  Created by Gerard Pérez i Carbò on 06/10/2026.
//

import UIKit

final class CharacterDetailViewController: UIViewController {

    @IBOutlet private weak var avatarView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var identityLabel: UILabel!
    @IBOutlet private weak var universeLabel: UILabel!

    var character: SpiderCharacter?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Detail viewDidLoad")

        view.backgroundColor = UIColor(named: "LoginBackground")
        setUpStyle()

        guard let character else { return }

        title = character.name
        avatarView.image = character.image ?? SpiderCharacter.placeholderImage
        nameLabel.text = character.name
        identityLabel.text = "Identity: \(character.identity)"
        universeLabel.text = "Universe: \(character.universe)"
    }

    private func setUpStyle() {
        avatarView.contentMode = .scaleAspectFit
        avatarView.tintColor = UIColor(named: "TextSecondary")

        let styles: [(UILabel, UIFont.TextStyle, String)] = [
            (nameLabel, .largeTitle, "TextPrimary"),
            (identityLabel, .title3, "TextPrimary"),
            (universeLabel, .body, "TextSecondary")
        ]

        for (label, textStyle, colorName) in styles {
            label.font = .preferredFont(forTextStyle: textStyle)
            label.textColor = UIColor(named: colorName)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.adjustsFontForContentSizeCategory = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Detail viewWillAppear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Detail viewDidDisappear")
    }

    deinit {
        print("Detail deinit")
    }
}
