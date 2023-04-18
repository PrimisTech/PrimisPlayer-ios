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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self

        // Loading a local HTML
        if let localFileUrl = Bundle.main.url(forResource: "WebViewPageExample", withExtension: "html") {
            webView.loadFileURL(localFileUrl, allowingReadAccessTo: localFileUrl)
        }
    }
    
    deinit {
        player?.remove()
        player = nil
    }
    
    func createPrimisPlayer() {
        if player == nil {
            player = PrimisPlayer()
            player?.configure([
                .placementId: "113298",
                .containerView: webView,
                .debugLogActive: true ])
            player?.add(to: self)
        }
    }
}

// MARK: - WebView delegates
extension WebViewSampleViewController: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.createPrimisPlayer()
    }
}

