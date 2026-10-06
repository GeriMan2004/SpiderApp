//
//  HomeViewController.swift
//  SpiderApp
//
//  Created by Gerard Pérez i Carbò on 29/09/2026.
//

import UIKit

final class HomeViewController: UIViewController {

    nonisolated enum Section: Hashable, Sendable {
        case characters
    }

    @IBOutlet private weak var tableView: UITableView!

    var email: String = ""

    private let characters = SpiderCharacter.samples
    private lazy var charactersByID = Dictionary(
        uniqueKeysWithValues: characters.map { ($0.id, $0) }
    )

    private var dataSource: UITableViewDiffableDataSource<Section, SpiderCharacter.ID>!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home viewDidLoad")

        title = "Characters"
        navigationItem.prompt = email

        configureTableView()
        applySnapshot()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.backgroundColor = UIColor(named: "LoginBackground")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 88

        dataSource = UITableViewDiffableDataSource(tableView: tableView) { [weak self] tableView, indexPath, id in
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: CharacterRowCell.reuseIdentifier,
                    for: indexPath) as? CharacterRowCell,
                let character = self?.charactersByID[id]
            else {
                return UITableViewCell()
            }

            cell.configure(with: character)
            return cell
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SpiderCharacter.ID>()
        snapshot.appendSections([.characters])
        snapshot.appendItems(characters.map(\.id))
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showCharacter",
            let detail = segue.destination as? CharacterDetailViewController,
            let character = sender as? SpiderCharacter
        else {
            return
        }

        detail.character = character
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

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let id = dataSource.itemIdentifier(for: indexPath),
            let character = charactersByID[id]
        else {
            return
        }

        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showCharacter", sender: character)
    }
}
