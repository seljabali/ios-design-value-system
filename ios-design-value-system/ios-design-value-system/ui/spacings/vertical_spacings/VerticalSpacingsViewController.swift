import Foundation
import UIKit
import SnapKit

class VerticalSpacingsViewController : BaseViewController {
    private let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Strings.VerticalSpacings
        initializeViews()
        setConstraints()
    }
    
    private func initializeViews() {
        view.backgroundColor = .white
        tableView.apply {
            $0.delegate = self
            $0.dataSource = self
            $0.removeEmptyCellDividerLines()
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = Dimens.HorizontalTableViewCellHeight.cgFloat
            $0.alwaysBounceHorizontal = true
            $0.register(VerticalViewCell.self, forCellReuseIdentifier: VerticalViewCell.IDENTIFIER)
            view.addSubview($0)
        }
    }

    private func setConstraints() {
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(HorizontalSpacings.m)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(HorizontalSpacings.m)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-HorizontalSpacings.m)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-VerticalSpacings.m)
        }
    }
}

extension VerticalSpacingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        Dimens.HorizontalTableViewCellHeight.cgFloat
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        VerticalSpacingItems.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfColumnsInSection section: Int) -> Int {
        VerticalSpacingItems.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VerticalViewCell.IDENTIFIER) as! VerticalViewCell
        let position = indexPath.row
        cell.setVerticalSpacingItem(VerticalSpacingItems.allCases[position])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}


extension VerticalSpacingsViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return VerticalSpacingItems.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.backgroundColor = model[collectionView.tag][indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}
