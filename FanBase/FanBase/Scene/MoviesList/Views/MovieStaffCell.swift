import UIKit

protocol MovieStaffCellDelegate: AnyObject {
    func movieStaffCell(_ cell: MovieStaffCell, didSelect actor: Actor)
}

class MovieStaffCell: UITableViewCell {

    static let identifier = "MovieStaffCell"

    @IBOutlet weak var collectionView: UICollectionView!

    weak var delegate: MovieStaffCellDelegate?

    var model: Movie? {
        didSet {
            update()
        }
    }

    private var staff: [Actor] {
        model?.staff ?? []
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func update() {
        collectionView.reloadData()
    }
}

extension MovieStaffCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        staff.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = makeActorCell(collectionView: collectionView, indexPath: indexPath) else {
            fatalError()
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let actor = model?.staff[indexPath.row] {
            delegate?.movieStaffCell(self, didSelect: actor)
        }
    }
}


// MARK: - Helpers

private extension MovieStaffCell {
    func makeActorCell(collectionView: UICollectionView, indexPath: IndexPath) -> ActorCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCell.identifier, for: indexPath) as? ActorCell else {
            return nil
        }

        cell.model = staff[indexPath.item]
        return cell
    }
}
