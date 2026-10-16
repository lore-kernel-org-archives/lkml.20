Received: from r9214.ps.combzmail.jp (r9214.ps.combzmail.jp [160.16.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E849F383C95
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.66.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131673; cv=none; b=W+aoa0MCn0xWPozDUotZ9YYNdfZBOZLCc2O0S/JMGkLQSSK8MA+BCIfoa35m8h8+u3IyBdiaLj4wUGWKY6vczbUDGFr76DL3+CFlcb1EreQ9R2v4/M3hQwz8F4PxNZM0MsF7+7rAkYk0CQC7UjqyxeN08hOMIAynNKbJ1b6chHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131673; c=relaxed/simple;
	bh=ebyI7XDSk1Lx0tbMrXAePp63eNec9TltndH6dU+gpCA=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=qn0RezISa6jleLgp9EWz/z8s1qGoW1GML4y8/jriWWJoR1zI7S06nWnXHSQCDSBskP+bczj9ZwYVfcjDp3op+tkPhCwmeV938YCdVSpDaM8flGXAbTGsqNz6bwhF7ZVkhqN5RM/iArK5XsYyiz7tiAjJ0mduOIryqrH5occTg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chatgpt-event.work; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=160.16.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chatgpt-event.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9214.ps.combzmail.jp (Postfix, from userid 99)
	id 8642DC2676; Fri, 16 Oct 2026 15:20:43 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9214.ps.combzmail.jp 8642DC2676
To: linux-kernel@vger.kernel.org
From: AI =?ISO-2022-JP?B?GyRCJSghPCU4JSclcyVIIUMlJCVZJXMlSDt2TDM2SRsoQg==?= <info@chatgpt-event.work>
X-Ip: 6886691193787598
X-Ip-source: k85gj70348dnsa1qu0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?MRskQkZ8JEdESSQkJEQkLxsoQiBDbA==?=
 =?ISO-2022-JP?B?YXVkZSBDb2RlGyRCJHIzWCRWRn5MZzlWOkIbKEI=?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 031q
X-uId: 6764315443486066694582431032
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20261016062104.8642DC2676@r9214.ps.combzmail.jp>
Date: Fri, 16 Oct 2026 15:20:43 +0900 (JST)

お世話になります。

生成AIで「調べる」「文章をつくる」までは、
すでに多くの企業が取り組まれています。
しかし今は、AIが実際の業務そのものを動かす段階に入りました。

今回のセミナーでは、実際の画面をお見せしながら
以下を０から解説します。
・AIエージェントとClaude Codeの基本
・AIでWebサイトをつくる（作成から、公開後の自動更新まで）
・AIで帳簿を作成する（品番検索・過去の見積書を参照）
・実務での活用事例（サイトの自動更新、AIでのお問い合わせ対応）

━━━━━━━━━━━━━━━━━━━━━━
　　1日で追いつく Claude Codeを学ぶ入門講座
　　― 調べる、作るだけでは終わらない。AIが「実務」を動かす60分。

　日 時：2026年10月23日(金)14:00-15:00
　　　 　2026年10月28日(水)14:00-15:00
　　　　 2026年11月11日(水)14:00-15:00
　会 場：オンライン開催（お申し込みの方に視聴用URLをお送りします）
　費 用：無料

　▼お申込みはこちら
　https://chatgpt-event.work/ai-seminar1001/
━━━━━━━━━━━━━━━━━━━━━━

事前知識は不要です。エンジニアの方でなくても、
経営者・ご担当者がイメージしやすい言葉でお話しします。

前半ではAIエージェントとClaude Codeの基本を、
後半は実際の画面を使った実演と活用事例をご紹介しますので、
自社の業務のどこに使えるのかをそのままお持ち帰りいただけます。

ぜひこの機会にご参加ください。

＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
■ AIエージェント事務局
東京都中央区銀座七丁目１３番６号
TEL :0120-889-859
Mail:info@chatgpt-event.work
-----------------------------------------------------------------------------　
　メール案内の停止をご希望の方は
　下記アドレスよりお手続きをお願いいたします。
　https://chatgpt-event.work/mail/
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
