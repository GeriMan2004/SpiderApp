//
//  CharacterRowCell.swift
//  SpiderApp
//
//  Created by Gerard Pérez i Carbò on 06/10/2026.
//

import UIKit

final class CharacterRowCell: UITableViewCell {

    static let reuseIdentifier = String(describing: CharacterRowCell.self)

    @IBOutlet private weak var avatarView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor(named: "FieldBackground")

        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = 8
        avatarView.tintColor = UIColor(named: "TextSecondary")

        nameLabel.font = .preferredFont(forTextStyle: .headline)
        nameLabel.textColor = UIColor(named: "TextPrimary")
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontForContentSizeCategory = true

        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = UIColor(named: "TextSecondary")
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontForContentSizeCategory = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        avatarView.image = SpiderCharacter.placeholderImage
        nameLabel.text = nil
        subtitleLabel.text = nil
        accessoryType = .none
    }

    func configure(with character: SpiderCharacter) {
        avatarView.image = character.image ?? SpiderCharacter.placeholderImage
        nameLabel.text = character.name
        subtitleLabel.text = "\(character.identity) · \(character.universe)"
        accessoryType = .disclosureIndicator
    }
}
