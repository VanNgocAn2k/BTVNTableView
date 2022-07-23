//
//  ViewController.swift
//  BaiTapTableViewB62
//
//  Created by Văn Tiến Tú on 19/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrSection: [String] = ["A", "B", "C", "D", "G", "H","K"]
    var arrNameRow: Array<Array<String>> = [["An", "Ánh"], ["Bình", "Bảo", "Biên"], ["Cường", "Cảnh"], ["Dung"], ["Giang"], ["Hùng"],["Khánh"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .red
        tableView.register(UINib(nibName: "ScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNameRow[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrSection[section]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScreenTableViewCell
        cell.textLabel?.text = arrNameRow[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteButton = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.arrNameRow[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
        }
        deleteButton.backgroundColor = .red
        let editButton = UIContextualAction(style: .normal, title: "Edit")  { _, _, _ in
        }
        editButton.backgroundColor = .green
        return UISwipeActionsConfiguration(actions: [deleteButton, editButton])
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arrSection
    }
}
