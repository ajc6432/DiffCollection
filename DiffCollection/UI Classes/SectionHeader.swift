import UIKit

class SectionHeader: UICollectionReusableView {
    @IBOutlet weak var letterLabel: UILabel!

    static var reuseID: String {
        return String(describing: self)
    }
}
