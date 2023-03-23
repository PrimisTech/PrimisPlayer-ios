//
//  WebViewVC.swift
//  iosSampleApplication
//
//  Created by Roei Rosental on 16/03/2023.
//

import UIKit
import WebKit
import PrimisPlayerSdk

class WebViewSampleViewController: UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    
    private var player: PrimisPlayer?
    
    deinit {
        player?.remove()
        player = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        webView.navigationDelegate = self

        // Loading a local HTML
        if let localFileUrl = Bundle.main.url(forResource: "WebViewPageExample", withExtension: "html") {
            self.webView.loadFileURL(localFileUrl, allowingReadAccessTo: localFileUrl)
        }
        
        // Loading a remote HTML
//        if let remoteFileUrl = URL (string: "www.example.com") {
//            self.webView.load(URLRequest(url: remoteFileUrl))
//        }
    }
    
    func configurePlayer() {
        if player == nil {
            
            player = PrimisPlayer()
            
            player?.configure([
                .placementId: "113298",
                .containerView: webView,
                .flowParentView: self.view,
                .debugLogActive: true
            ])
            
            player?.add(to: self)
        }
    }
}

// MARK: - WebView delegates
extension WebViewSampleViewController: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async { [weak self] in
            self?.configurePlayer()
        }
    }
}

