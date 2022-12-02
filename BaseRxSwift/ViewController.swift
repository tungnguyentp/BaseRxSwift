//
//  ViewController.swift
//  BaseRxSwift
//
//  Created by IMAC on 3/28/20.
//  Copyright © 2020 IMAC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        APIClient.getLocation(page: 1, paginate: 5, key: "").asObservable().subscribe(onNext: { (citis) in
            print(citis.datas)
            }).disposed(by: disposeBag)

            //
    }


}
