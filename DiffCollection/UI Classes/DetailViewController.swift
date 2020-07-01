import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!

    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = contact?.name
    }
}
