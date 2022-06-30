import UIKit

class ActorCell: UICollectionViewCell {

    static let identifier = "ActorCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    var model: Actor? {
        didSet {
            update()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func update() {
        nameLabel.text = model?.name
        photoImageView.image = UIImage(named: model?.imagePath ?? "")
    }
}
