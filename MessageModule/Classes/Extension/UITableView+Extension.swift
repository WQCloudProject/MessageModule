//
//  UITableView+Extension.swift
//  MessageModule
//
//  Created by chenweiqiang on 2020/5/24.
//

import Foundation
protocol Reusable {
    static var reuserIdentifier: String { get }
}

extension Reusable {
    static var reuserIdentifier : String {
        return String(describing: self)
    }
}


extension UIViewController: Reusable {}
extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
extension UICollectionViewCell: Reusable {}
extension UICollectionReusableView: Reusable {}

extension UITableView {
    
    func cell<T: UITableViewCell>(ofType cellType: T.Type = T.self, reuserIdentifier: String = T.reuserIdentifier) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuserIdentifier) as? T else {
            fatalError()
        }
        return cell
    }
    
    func headerFooter<T: UITableViewHeaderFooterView>(ofType viewType: T.Type, reuserIdentifier: String = T.reuserIdentifier) -> T {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuserIdentifier) as? T else {
            fatalError()
        }
        return view
    }
    
    func registerCell<T :UITableViewCell>(ofType cell : T.Type) {
        register(cell, forCellReuseIdentifier: T.reuserIdentifier)
    }
    
    func deleteLastRowSeparator(indexPath: IndexPath, cell: UITableViewCell) {
        //去掉最后一行分割线
        if indexPath.row == self.numberOfRows(inSection: indexPath.section) - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: SCREEN_WIDTH)
        }else {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        }
    }
    func getHeaderView(section: Int) -> UIView {
        //获取headerView，plain样式的table滚动时headerView不悬浮
        let tag = 1009 + section
        let header = self.viewWithTag(tag)
        if header == nil {
            let rect = self.rectForHeader(inSection: section)
            let view = UIView(frame: rect)
            view.tag = tag // 将View打上标签，避免刷洗tableView时重复添加
            self.addSubview(view)
        }
        return UIView()
    }
}

extension UICollectionView {
    
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HoverCollectionViewCell", for: indexPath)
//    return cell
    
    func cell<T: UICollectionViewCell>(ofType cellType: T.Type = T.self, reuserIdentifier: String = T.reuserIdentifier, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuserIdentifier, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
    
    func registerCell<T :UICollectionViewCell>(ofType cell : T.Type) {
        register(cell, forCellWithReuseIdentifier: T.reuserIdentifier)
    }
}
