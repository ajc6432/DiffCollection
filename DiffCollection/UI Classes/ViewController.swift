import UIKit

struct CollectionSection: Hashable {
    var id: Int
    var title: String
}

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    let sections = [CollectionSection(id: 0, title: "Friends"), CollectionSection(id: 1, title: "Family"), CollectionSection(id: 2, title: "CoWorkers")]

    var diffableDataSource: UICollectionViewDiffableDataSource<CollectionSection, Contact>! = nil
    var contactList = DataHelper.getContacts()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Contacts"

        collectionView.registerHeader(withID: SectionHeader.reuseID)

        collectionView.delegate = self
        collectionView.dataSource = diffableDataSource
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground

        setupDataSource()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.contact = sender as? Contact
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 24)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contact = diffableDataSource.snapshot().itemIdentifiers[indexPath.item]
        performSegue(withIdentifier: "detail", sender: contact)
    }
}

extension ViewController {
    func setupDataSource() {
        diffableDataSource = UICollectionViewDiffableDataSource<CollectionSection, Contact>(collectionView: collectionView) { collectionView, indexPath, contact in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NameCell",
                                                                for: indexPath) as? NameCell else {
                                                                    return UICollectionViewCell()
            }
            cell.nameLabel?.text = contact.name
            return cell
        }

        diffableDataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseID,
                                                                                      for: indexPath) as? SectionHeader else {
                return nil
            }

            sectionHeader.letterLabel.text = self?.sections[indexPath.section].title ?? ""
            return sectionHeader
        }

        updateDataSource(withData: DataHelper.getContacts())
    }
}

extension ViewController {
    func updateDataSource(withData list: ContactList, animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<CollectionSection, Contact>()
        snapshot.appendSections(sections)

        snapshot.appendItems(list.friends, toSection: sections[0])
        snapshot.appendItems(list.family, toSection: sections[1])
        snapshot.appendItems(list.coworkers, toSection: sections[2])

        diffableDataSource.apply(snapshot, animatingDifferences: animate)
    }
}
