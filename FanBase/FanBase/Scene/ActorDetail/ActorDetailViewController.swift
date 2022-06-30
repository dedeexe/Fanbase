//
//  ActorDetailViewController.swift
//  FanBase
//
//  Created by dede.exe on 30/06/22.
//

import UIKit

class ActorDetailViewController: UIViewController {

    var actor: Actor? = .robertoUrbina

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = UIImage(named: actor?.imagePath ?? "")
        nameLabel.text = actor?.name
        descriptionLabel.text = actor?.description
    }
    
}
