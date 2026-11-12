Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.16.62.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527194;
	b=uMCOu9229xsbmyzMzTEuQ0iI6tLswimqX/vauVUXxS4k4oUMhocJKQaeCH8ZXKG35D9n
	 UFilk2PWzXUiZ4b/ORSk6oX23ajLdynlT9TWLkDLNP6M8c0GNFWq3qRtdboJWlPBXYKxI
	 Dd+70vpwC5ilpu0hqXSD/WNOQGRwqek4Z7yG1jZgXY5dcuc2KlxYLswnoHCstNb7u39Cw
	 YtnXmdIE1X4pn8vR6j2V9IL+NDzxZ4nf6Hf2Nkwk60ILeJQue8GWs+kOufleQz2RBE7jc
	 qtYBCaZbfOT8aI5feZ1f0p8zGqrX2NZsybVCeE5oHG/rx0cGmWZmw0lFcULCt3ZOtzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527194;
	h=DMARC-Filter:Received:DKIM-Filter:To:From:X-Ip:X-Ip-source:
	 Precedence:List-Unsubscribe:List-Unsubscribe-Post:Subject:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-MagazineId:
	 X-uId:X-Sender:X-Url:Message-Id:Date;
	bh=NOfNgTyd0uEr6RzFm0WGakXbVq4eVhUqaBjZ/gzkpPY=;
	b=EP5dIXOp9yznU8xqkpY/eVbKvfymxQasrsVQ2wCfGApVyouMjCaxa+ezQog7fIEGxGkd
	 BuIwA6M3iID+ukGXwYVoxlcKWX29kXl+/m/ijlY1u8vNLKHU4gXXrM97FhS7s1Z+/2tFd
	 jBwWTwyS5/JSkR3uci5hn9Qs3QXwPhYV0dHbpDDyzYyxHLZI/+AtfQx63wzOjWL1YYI5b
	 H5WxHakLAz3B3O1sHfgNYBslejSw5FgL55+zM7F+RoD94yCMXbj1+8x5Dekv59hFQ6l5b
	 11rikt0jWNOgWicXXzZMvhjdtOzJQs1H9puZHW/yPV8dX/dWw8vRrdX1IvPGRVtXeUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=knowledgelink-corp.jp;
	spf=pass smtp.mailfrom=magerr.combzmail.jp;
	arc=none smtp.remote-ip=160.16.62.121
Received: from r9205.ps.combzmail.jp (r9205.ps.combzmail.jp [160.16.62.121])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A0606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledgelink-corp.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9205.ps.combzmail.jp (Postfix, from userid 99)
	id CE9E4C49CC; Fri, 13 Nov 2026 08:46:08 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9205.ps.combzmail.jp CE9E4C49CC
To: linux-kernel@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCP0BFRCFDMGxITDxSQ0RLIT9NJUolbCVDJTglaiVzJS8bKEI=?= <info@knowledgelink-corp.jp>
X-Ip: 5483041303158552
X-Ip-source: k85gj72848dnsad1u0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCPFJEOSROMnE8UiROIVYlKCE8JTkhVyEiGyhC?=
 =?ISO-2022-JP?B?GyRCJCQkRDwtJGEkXiQ5JCshKSFaN1AxRDxUOEJEaiU7GyhC?=
 =?ISO-2022-JP?B?GyRCJV8lSiE8IVsbKEI=?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 28d1
X-uId: 6764325137486067654956401009
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20261112234625.CE9E4C49CC@r9205.ps.combzmail.jp>
Date: Fri, 13 Nov 2026 08:46:08 +0900 (JST)

　
　ルールを決めたら、社員は辞めるどころか
　「迷わなく」なった。
　
　これまでに4,800社以上への支援から分かった
　
　“凡人”を常勝集団に変える
　ルールのつくり方を
　
　次の朝礼から実践できる形で
　分かりやすく丁寧にお伝えします。

┏… Overview …………………………………………┓
　
　「あいつが辞めたら、うちは回るのか？」
　
　　エースに頼らず“凡人”を
　　常勝集団に変えるルールのつくり方

　　　　　　　　―――
　　日　時　11月24日（火）13:00-15:00
　
　　会　場　Zoom無料開催／定員100名
　　事務局　ナレッジリンクセミナー窓口
　
　　詳細はこちら
　　https://knowledge-co.jp/rule/

┗……………………………………………………………┛
　
　
　多くの社長とお話しする中で
　このようなお悩みをよく伺います。
　
　　・エースが辞めたら、売上が大きく落ちる
　　・朝礼に遅れてくる社員がいても、誰も何も言わない
　　・同じミスに、毎回説教。その後、自己嫌悪になる

　研修も、クレドも、評価制度も試した。
　それでも改善は続かず「結局は人次第なのか」と感じている。
　
　
　そんなお悩みを解決し、成果を生み出す会社に一変させる
　本質をついた、ルールづくりをお伝えします。

　
― セミナーで得られること ―

　・ルールを増やすと社員は辞めるのか？への答え
　・「姿勢のルール」の決め方
　・「完全結果」の指示に書き換える方法
　・エラー時に上司がかける「一言」
　
　
　いずれも、翌日の朝礼から試していただける内容です。
　
　自社の組織に希望を持つための気づきを得られる
　内容となっておりますので、ぜひご視聴ください。　
　
　
_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

　一般社団法人ナレッジリンク
　東京都千代田区神田小川町1-8-3
　セミナー窓口：03-5256-7638

……………………………………………………………………
　メール案内が不要な方にはご迷惑をお掛けしまして
　大変申し訳ございません。
　お手数ですが下記URLより手続きをお願い致します。
　
　配信の解除依頼はこちら
　https://fc-knowledgelink-corp.jp/mail/

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
