import UIKit

class MoviesListViewController: UIViewController {

    let detailSegueIdentifier = "detail"
    let model: Movies = Movies()

    var movies: [Movie] {
        model.movies
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let viewController = segue.destination as? ActorDetailViewController,
            let actor = sender as? Actor
        else {
            return
        }

        viewController.actor = actor
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = createStaffCell(tableView: tableView, indexPath: indexPath) else {
            return createErrorCell()
        }

        return cell
    }

    //MARK: - DataSource Helper

    private func createErrorCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        var content = cell.defaultContentConfiguration()
        content.text = "No content found"
        cell.contentConfiguration = content
        return cell
    }

    private func createStaffCell(tableView: UITableView, indexPath: IndexPath) -> MovieStaffCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieStaffCell.identifier, for: indexPath) as? MovieStaffCell else {
            return nil
        }

        cell.delegate = self
        cell.model = movies[indexPath.section]
        return cell
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        movies[section].title
    }
}

extension MoviesListViewController: MovieStaffCellDelegate {
    func movieStaffCell(_ cell: MovieStaffCell, didSelect actor: Actor) {
        performSegue(withIdentifier: detailSegueIdentifier, sender: actor)
    }
}

