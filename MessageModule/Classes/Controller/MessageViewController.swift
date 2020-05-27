//
//  MessageViewController.swift
//  MessageModule
//
//  Created by chenweiqiang on 2020/5/23.
//

import UIKit

open class MessageViewController: UIViewController {

    public var dataArray: [String]!
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "消息"
        self.view.backgroundColor = .white
        
        dataArray = ["消息1","消息2"]
        setUpUI()
        // Do any additional setup after loading the view.
    }
    

    func setUpUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(view).offset(-7)
        }
    }
    
    private lazy var tableView: UITableView = {
        
        let table = UITableView()
        table.rowHeight = 50
        table.estimatedSectionHeaderHeight = 0
        table.delegate = self
        table.dataSource = self
        table.registerCell(ofType: MessageCell.self)
        table.tableFooterView = UIView()
        table.backgroundColor = DefaultBgColor
        table.separatorColor = LineColor
        //table.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return table
    }()
    

}
extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.cell(ofType: MessageCell.self)
        cell.nameLabel.text = dataArray[indexPath.row]
//        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: SCREEN_WIDTH)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}
