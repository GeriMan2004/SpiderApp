//
//  SpiderCharacter.swift
//  SpiderApp
//
//  Created by Gerard Pérez i Carbò on 06/10/2026.
//

import UIKit

struct SpiderCharacter: Hashable, Identifiable {

    let id: Int
    let name: String
    let identity: String
    let universe: String
    let imageName: String?

    var image: UIImage? {
        imageName.flatMap { UIImage(named: $0) }
    }

    static let placeholderImage = UIImage(systemName: "person.crop.circle.fill")
}

extension SpiderCharacter {

    static let samples: [SpiderCharacter] = [
        SpiderCharacter(id: 1, name: "Spider-Man", identity: "Peter Parker", universe: "Earth-616", imageName: "peter-parker"),
        SpiderCharacter(id: 2, name: "Spider-Man", identity: "Miles Morales", universe: "Earth-1610", imageName: "miles-morales"),
        SpiderCharacter(id: 3, name: "Spider-Woman", identity: "Gwen Stacy", universe: "Earth-65", imageName: "gwen-stacy"),
        SpiderCharacter(id: 4, name: "Spider-Man 2099", identity: "Miguel O'Hara", universe: "Earth-928", imageName: "miguel-ohara"),
        SpiderCharacter(id: 5, name: "Spider-Man", identity: "Peter B. Parker", universe: "Earth-616B", imageName: "peter-b-parker"),
        SpiderCharacter(id: 6, name: "Spider-Ham", identity: "Peter Porker", universe: "Earth-8311", imageName: "spider-ham"),
        SpiderCharacter(id: 7, name: "SP//dr", identity: "Peni Parker", universe: "Earth-14512", imageName: "peni-parker"),
        SpiderCharacter(id: 8, name: "Spider-Man Noir", identity: "Peter Parker", universe: "Earth-90214", imageName: "spider-noir"),
        SpiderCharacter(id: 9, name: "Spider-Man India", identity: "Pavitr Prabhakar", universe: "Earth-50101", imageName: "pavitr-prabhakar"),
        SpiderCharacter(id: 10, name: "Spider-Punk", identity: "Hobart \"Hobie\" Brown", universe: "Earth-138", imageName: "spider-punk"),
        SpiderCharacter(id: 11, name: "Spider-Woman", identity: "Jessica Drew", universe: "Earth-616", imageName: "jessica-drew"),
        SpiderCharacter(id: 12, name: "Scarlet Spider", identity: "Ben Reilly", universe: "Earth-616", imageName: "ben-reilly"),
        SpiderCharacter(id: 13, name: "Silk", identity: "Cindy Moon", universe: "Earth-616", imageName: "silk"),
        SpiderCharacter(id: 14, name: "Spider-Girl", identity: "Anya Corazon", universe: "Earth-616", imageName: "anya-corazon"),
        SpiderCharacter(id: 15, name: "The Amazing, Spectacular, Sensational and Superior Spider-Man of Every Universe", identity: "Peter Parker (variant with a very long name to test self-sizing rows)", universe: "Earth-Unknown", imageName: nil)
    ]
}
