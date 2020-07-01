import UIKit

extension UICollectionView {
    func registerHeader(withID reuseID: String) {
        self.register(UINib(nibName: reuseID, bundle: Bundle.main),
        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
        withReuseIdentifier: reuseID)
    }

    func registerCell(withID reuseID: String) {
        self.register(UINib(nibName: reuseID, bundle: Bundle.main), forCellWithReuseIdentifier: reuseID)
    }
}
