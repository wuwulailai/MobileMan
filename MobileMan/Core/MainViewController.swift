//
//  MainViewController.swift
//  MobileMan
//
//  Created by wubaolai on 2019/7/24.
//  Copyright © 2019 wubaolai. All rights reserved.
//

import UIKit
import NetworkTool

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        queryArticle()
    }
    
}

func queryArticle() {
    RequestManager.fetch(ArticleRequest()) { (result) in
        switch result {
        case .success(let model):
            if let error = model.error {
                if !error {
                    if let articles = model.results {
                        for article in articles {
                            print(article)
                        }
                    } else {
                        print("Empty content")
                    }
                } else {
                    print("Server internal error")
                }
            } else {
                print("Parse error")
            }
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}

extension MainViewController {
    //  普通队列
    func simpleSQueues() {
        let queue = DispatchQueue(label: "com.mobileman.test")
      
        // 同步队列执行
        queue.sync {
            for i in 0 ..< 10 {
                print("\(Thread.current) 同步队列执行 - - ", i)
            }
        }
        
        // 同步主队列执行
        for j in 0 ..< 10 {
            print("\(Thread.current) 同步主队列执行 - - ", j)
        }
    }
    
    // 串行队列＋异步任务
    // 异步任务不会阻塞当前线程，会另开线程执行
    func simpleAsQueues() {
        let queue = DispatchQueue(label: "com.syc.nd")
        
        // 异步队列执行
        queue.async {
            for i in 0..<10 {
                print("\(Thread.current) 异步队列执行 -- \(i)")
            }
        }
        
        // 同步主队列执行
        for j in 0..<10 {
            print("\(Thread.current) 同步主队列执行 -- \(j)")
        }
    }

    // 同个队列同等级 串行输出 对比
    func qosConcurrentQueues() {
        let queue = DispatchQueue.init(label: "com.nd.syc", qos: DispatchQoS.unspecified)
        
        queue.async {
            for i in 0..<10 {
                print("\(i)")
            }
        }
        
        queue.async {
            for k in 100..<110 {
                print("\(k)")
            }
        }
    }
    
    // 同个队列同等级 并行输出 对比
    func qosConcurrentQueues1() {
        let queue = DispatchQueue.init(label: "com.nd.syc", qos: DispatchQoS.utility, attributes: .concurrent)
        
        queue.async {
            for i in 0..<10 {
                print("\(Thread.current) \(i)")
            }
        }
        
        queue.async {
            for k in 100..<110 {
                print("\(Thread.current) \(k)")
            }
        }
    }
    
    // Qos不同等级异步任务对比
    func qosQueues1() {
        let queue1 = DispatchQueue.init(label: "com.syc.nd1", qos: DispatchQoS.userInteractive)
        let queue2 = DispatchQueue.init(label: "com.syc.nd2", qos: DispatchQoS.utility)
        queue2.async {
            for k in 0..<10 {
                print("queue2异步任务执行 -- \(k)")
            }
        }
        queue1.async {
            for i in 0..<10 {
                print("queue1异步任务执行 -- \(i)")
            }
        }
        
        for j in 0..<10 {
            print("同步主队列执行 -- \(j)")
        }
    }
    
    
}
