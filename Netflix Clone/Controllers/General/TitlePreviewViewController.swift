//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 26/10/2022.
//

import UIKit
import WebKit

//Could add more data that is stored in Title model later
class TitlePreviewViewController: UIViewController {
    
    private var titleInUse: Title = Title(id: 0, media_type: nil, original_name: nil, original_title: nil, poster_path: nil, overview: nil, vote_count: 0, release_date: nil, vote_average: 0)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.tintColor = .white
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        downloadButton.addTarget(self, action: #selector(downloadTitlePreviewed), for: .touchUpInside)
        configureConstraints()
    }
    
    func configureConstraints() {
        let webViewContraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let titleLabelContraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let overviewLabelContraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let downloadButtonContraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            downloadButton.widthAnchor.constraint(equalToConstant: 140),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(webViewContraints)
        NSLayoutConstraint.activate(titleLabelContraints)
        NSLayoutConstraint.activate(overviewLabelContraints)
        NSLayoutConstraint.activate(downloadButtonContraints)
    }

    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    @objc private func downloadTitlePreviewed() {
        if titleInUse.original_title != nil {   // Could add a conditional to look for duplicates as well
            DataPersistenceManager.shared.downloadTitleWith(model: titleInUse) { result in
                switch result {
                case .success():
                    NotificationCenter.default.post(name: NSNotification.Name("Downloaded"), object: nil)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            print("Invalid Download Attempt")
        }
    }
    
    func setTitleInUse(with selectedTitle: Title){
        titleInUse = selectedTitle
    }
    
}
