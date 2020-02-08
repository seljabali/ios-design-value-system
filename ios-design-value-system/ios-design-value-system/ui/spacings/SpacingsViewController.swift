import Foundation
import UIKit
import SnapKit

class SpacingsViewController: BaseViewController {
    private let verticalSpacingPageItem = LandingPageItemView()
    private let horizontalSpacingsPageItem = LandingPageItemView()
    private let paddingsPageItem = LandingPageItemView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Strings.Spacings
        initializeViews()
        setConstraints()
    }

    private func initializeViews() {
        self.view.backgroundColor = .white
        verticalSpacingPageItem.apply {
            $0.bind(withTitle: Strings.VerticalSpacings, withImage: UIImage(named: Images.VerticalSpacing)!)
            $0.setOnTapListener(target: self, action: #selector(onVerticalSpacingsPageItemTapped))
            view.addSubview($0)
        }
        horizontalSpacingsPageItem.apply {
            $0.bind(withTitle: Strings.HorizontalSpacings, withImage: UIImage(named: Images.HorizontalSpacing)!)
            $0.setOnTapListener(target: self, action: #selector(onHorizontalSpacingsPageItemTapped))
            view.addSubview($0)
        }
//        paddingsPageItem.apply {
//            $0.setTitle(Strings.Paddings)
//            $0.setOnTapListener(target: self, action: #selector(onPaddingsSpacingsPageItemTapped))
//            view.addSubview($0)
//        }
    }

    private func setConstraints() {
        verticalSpacingPageItem.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(HorizontalSpacings.m)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(HorizontalSpacings.m)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        horizontalSpacingsPageItem.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(HorizontalSpacings.m)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-HorizontalSpacings.m)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
//        paddingsPageItem.snp.makeConstraints { (make) -> Void in
//            make.top.equalTo(verticalSpacingPageItem.safeAreaLayoutGuide.snp.bottom).offset(HorizontalSpacings.m)
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(HorizontalSpacings.m)
//            make.right.equalTo(view.safeAreaLayoutGuide.snp.centerX)
//        }
    }
    
    @objc private func onVerticalSpacingsPageItemTapped() {
        pushViewController(VerticalSpacingsViewController())
    }
    
    @objc private func onHorizontalSpacingsPageItemTapped() {
        pushViewController(HorizontalSpacingsViewController())
    }
    
    @objc private func onPaddingsSpacingsPageItemTapped() {
        pushViewController(PaddingsSpacingsViewController())
    }
}
