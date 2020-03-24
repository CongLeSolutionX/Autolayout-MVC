//
//  SwippingController.swift
//  autolayout_lbta
//
//  Created by Cong Le on 3/22/20.
//  Copyright © 2020 Lets Build That App. All rights reserved.
//
import UIKit
// swiftlint:enable all

class SwippingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    // MARK: Properties
    let pages = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and game!", bodyText: "Are you ready for loads and loads fun? Dont wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subcribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we annouce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "Dont hesitage! Join now and invite your friends to come to see us!"),
        Page(imageName: "bear_first", headerText: "Join us today in our fun and game!", bodyText: "Are you ready for loads and loads fun? Dont wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subcribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we annouce them on our website. Make sure to also give us any feedback you have."),
        
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "")
    ]
    //var pageViewModels = [PageViewModel]()
    let cellId = "cellId"
    // MARK: UI Element Properties
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        // go back previous page
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    // handle the touch action
    @objc private func handlePrev () {
        print("Go back to the previous page!")
        
        let prevIndex = max(pageControl.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: prevIndex, section: 0 )
        pageControl.currentPage = prevIndex // update the index
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false   // enable autolayout
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.setTitleColor(.mainPink, for: .normal) // using cutomized UIColor
        // go to the next page
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    // handle the touch action
    @objc private func handleNext() {
        print("Trying to advace to next!")
        
        let nextIndex = max(pageControl.currentPage + 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex // update the index
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .lighterPink // using cutomized UIColor
        return pc
    }()
    // MARK: App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageView()
        setupBottomControls()
    }
    // MARK: Functions
    fileprivate func setupPageView() {
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPagingEnabled = true
    }
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        bottomControlsStackView.distribution = .fillEqually // display all the views
        //bottomControlsStackView.axis = .vertical // stack vertically all the views
        view.addSubview(bottomControlsStackView)
        // the constraints
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
}
