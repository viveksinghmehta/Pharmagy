//
//  HomeController.swift
//  Pharmagy
//
//  Created by Vivek Singh Mehta on 12/09/21.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var officeCollectionView: UICollectionView!
    @IBOutlet weak var timeTableView: UITableView!
    
    private let collectionIdentifier: String = "office"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        collectionViewInit()
    }
    
    private func collectionViewInit() {
        officeCollectionView.register(UINib(nibName: "OfficeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionIdentifier)
        officeCollectionView.delegate = self
        officeCollectionView.dataSource = self
        officeCollectionView.reloadData()
    }
    
    private func updateUI() {
        searchView.layer.cornerRadius = (((view.bounds.size.height * 0.25) * 0.25) * 0.5)
        searchView.clipsToBounds = true
        countLabel.layer.cornerRadius = 21 * 0.5
        countLabel.clipsToBounds = true
        todayView.layer.cornerRadius = 8
        todayView.clipsToBounds = true
    }

}

extension HomeController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath) as? OfficeCollectionViewCell else { return UICollectionViewCell() }
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        let office = NSMutableAttributedString(string: "Office No. 248", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white,  NSAttributedString.Key.font: UIFont(name: "SourceSansPro-Black", size: 14.0)!])
        
        let patients = NSMutableAttributedString(string: " / 3 patients", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white,  NSAttributedString.Key.font: UIFont(name: "SourceSansPro-Regular", size: 14.0)!])
        let officeString = NSMutableAttributedString()
        officeString.append(office)
        officeString.append(patients)
        cell.officeLabel.attributedText = officeString
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width * 0.8, height: collectionView.bounds.size.height)
    }
    
    
}
