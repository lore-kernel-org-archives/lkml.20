Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794099449;
	b=Z7RxcHbqtbBezc6j4mOLn5sHIbeCCHbgWKubAIOKReuINc5C9DNrYnMGkntBzzfIsbzX
	 V0ml1JHt9Y/Rrq9txLFpTeIPUSQ/Xa2q9fMjHONrx6pQAz4lKHQkrTU9R2TZeILSjXoYW
	 0LZzmT5pdTc9OMZ68HrRFmekpa67BlnuUEDgZzT9iV35m3DK+iWmnYBnjwkyDI8CUU41R
	 0z7a3lgUhbCqep2GGJeFXoY+yIgGr8J0jK4z10CqMdDqULmRMZh7wb68WvtSuoM5omR5F
	 kTfTFXUeK7FuT1kaL1pezLUIe4NAniqJts5q6EDwZVrXr3GaXCO7OQp21LVzCuvIvTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794099449;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=JFV6FRFGFzrW/Jb5MYHwW55jLaxvQFKJ8HKecXYgAmI=;
	b=3wT7PhQnEwHknzpY4/FIfDuR31mxkBKWOi+nLXjBXbMS/B+8B9QPLCiBHaXqEGpx7DqJ
	 +XkXJjUR3fGiM08GSafSTmUH+cksaYV6JFxtyaB2F/44thp86tIPClKzbZ//jrSQEpaMm
	 lsPJXhcOJr/nwqjqY8k1/43xlQN1NtewBQi802p+TetTEHrgc7TeAAP3ArCoyXxGuJgBy
	 yOSEFbAe9k3c+2uWdASKrwvjTQca4bPNzAVXZ/p36r+H70rnrxjTCTcIbET+M3+WYcP+k
	 vQ5mn0wkQEfomyx2oFv/D6ibGKY+hZpvmNLTf4NLkbZz4qHtFNJ0H6OjIF02SUzCIhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=lriz+nWi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LTTXCPth;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59E606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF59E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=lriz+nWi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LTTXCPth
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D54107A011B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:57:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 07 Nov 2026 19:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1794099447; x=1794185847; bh=JFV6FRFGFzrW/Jb5MYHwW
	55jLaxvQFKJ8HKecXYgAmI=; b=lriz+nWiUVqGH5wl8rjpU4q/fxBDShKqXw1Gz
	bSjlxzIbihcKYJFCrdnUcnyB/+FEFmIponl7wls8htUuv4kMhYuZb4eMHM2KFtcN
	POSPqxrj4qvUlCGN1VMXlgNSxExGH/td6B2j7nNe/7qP5RRzQlx6QgdyhInnXUHV
	ThbzxxuxLsntTK8GRZLFGt9eDKKUoTHa5IpRQYO04AB8fp00SWY1hlJQIse2RIRh
	+6LF6IhT6EVqOjXVd2N8UO4M5LHDfN8HUIV9hzsUu5tLqTk8P3VMmsN4yHdjkD0w
	N0DOGDGqANreL5DSQTVTciCzF4FPuAcSYe7XCzvYYyxvqlkPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794099447; x=
	1794185847; bh=JFV6FRFGFzrW/Jb5MYHwW55jLaxvQFKJ8HKecXYgAmI=; b=L
	TTXCPthPypySAOZw7vnY0pJ0KFREGlXQ3gqWzQ21H5od26bF85kzdM6Gb+JfhgMN
	F9M/6BE1xSMUXFm6FXsv8hrYEUdpDsdQ1bwVxJiElY0+U+l2ucaeeb+8YPpAOZ0+
	/pdkYtNyM4ubAmleQCxiws5j1P2/g3+6169ivE3689ORadD3qiKkDd0EqmIf64tm
	NhJV1iBxKKU2nNCbEM+tlQeJGk7R9pI6KYO2VRMG+Y0Of4IuFzwl+AuL2ecppDq5
	1foXDVHZrSrXt2fsRogsFY+gbSlGczKho01ze9HgyqeUSVFWJkrvOlzG3YG/sUW0
	c4aCj07DQfNmTBAaSlPjg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794099447; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:XMIoXgdw96DDIxtP9ER3++CMhgs6tt1tV1ZxONEIunUqHOe
	i6Ttj92Fju87imn3WDLsiSDvSrnJVB6zKEiHDiyRbbSijuM9pp1wO4cO9q3FG0y3
	WnyTADnA8P0wORbYmEa+58oeC2PJungKj3ktZEv8uGGfY0dF3cO0Xgkv0dIJuVgD
	FO+vAQENbffr1K/jI89WlFXvWSEW38swp4ozPzGn+mE3Icm2YgnnLQTMkTzyI7Zd
	0zabKkSeQPir7v/zKO+BJuUhLcDKBgJz2fYrcN9toRIXHtREavbc+oVrUEVs0a1R
	+FS96HXfrAniyae8ZhuplNyJC3FnUGGLAU9u11g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	mail-followup-to,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:zNStppknJdRETK+n4fcvn1eHW8MGaTYLhTJESOw+pKw=:wh/H2joZFlwy0rexRO4U9D9slTIWbwPJFpXGotbrdD8=;
X-ME-Sender: <xms:98jvamwOnPBujcfDn_0_oAVI_LIb1YvY19n2wmxQyQDnp9dGM26t9Q>
    <xme:98jvaqCvwYOlNW_0BFyksKL3hkgHwefH5MIk_9R0hr6EzcgsnhZAswgWWDrYOpE9p
    JeaDNFpOzkx5xtIP90d8jRBoDlOllGC_2iEAkijByoHULBT3XFg4ARl>
X-ME-Received: <xmr:98jvarYCIy-EV3Tbd3XUXpNVVks4cmhl_q3of-CJcL0T6ata8qsw2q8i9zAQgPnTJknuZAuqPXbEuzt8ymCMP7r-SIGm21U>
X-ME-Proxy-Cause: dmFkZTF9RlUtHqgWxDlfkibMUdMyg8Zug8+T6+v5kdd0GBRpqgmqUGwiGPc7vSeF/zMDEN
    5ZMnGvFBiVAQtpu9spIIFPKa7OoEJHFNLTHFr89fF9SAlEyMF/NC//H661HgNKRdZAn0Sw
    Ziywf/giZi0lF+tg28BHPNEgcgRJX5hqc/4NwxGF7isxk7pkGyCSiQbE5pHPqqVx098i3Y
    Jd/9JEaGsqrpRxQc+2bcVi9YTtTnl9YbUn75QIk9zBCBum5gPLPMpzmzmwD9eNoQJqw2AS
    31n49wWiLsOXBdzhUKHOZzAhekTyP3T+OAxg9FN5FjZZEdvmRYrBsIRGd/tlyDRKxea4q+
    K2Q+CUWY2/1qXiUNl1Pdxq+aTKUh03b0x3BWxrEzYacgZe/nOWHzI8WbFJ6QHfgbfs9qwj
    d5gku1wjaB6EzKO5jyu5kyTORp5BdJr3jV5yjAV6H9tIgfR6XIWmAjWjKrA0n7Jt3A3vGx
    Fs6WYTtpB474rhNIwLG3sWF11IYnnB1VivB2ZZK9J2xS4wjUfDf28tPHJTktmZhgac+Nj/
    MnaWe790xiY28dypzejIfhJtOZbnuZV44pnLxTbQ6rQYJscPNB9E9BusqV1BlqOLnbEZEq
    ZkCSbp24qmaeYYYKuLUqJJwYlXnOOd9KACZXLvwpK83vBbcRkADPk8njG+qA
X-ME-Proxy: <xmx:98jvaqgsseSxffe_xVDLxLipjRiDpnFGnaqml9psOWq5bLqiJSQS5A>
    <xmx:98jval79QdYgmM2O9pqUCi7Ox2DMfFxJY_Sl8VQlJi_YuvLtZXBuRw>
    <xmx:98jvap4Vkv0u9YrKjkx5c51-xnRoLA1pTuptAP0E4COpR555ewxSNQ>
    <xmx:98jvahc2MZazt9KraTcZMSYbBBYC8lQbxpAlsKLCYTTDyfMaBG4H_w>
    <xmx:98jvamt8q7af7-QXUIkcbzpJdkBr8ooeSxMybKnIhOiUsea4iCg5zWiG>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Nov 2026 19:57:26 -0500 (EST)
Date: Sun, 8 Nov 2026 09:57:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: [GIT PULL] firewire fixes for v7.4-rc2
Message-ID: <20261108005723.GA1751953@sakamocchi.jp>
Mail-Followup-To: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull the following fix for a regression introduced in v7.4-rc1.

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-fixes-7.4-rc2

for you to fetch changes up to 4acd5f806bf5569bfa3a45ea6a525936197df10c:

  firewire: ohci: avoid potential deadlock when queueing AT local requests (2026-11-03 12:55:19 +0900)

----------------------------------------------------------------
firewire fixes for v7.4-rc2

- Fix a race in the 1394 OHCI driver, introduced in v7.4-rc1
Queueing an AT local request in interrupt context can race with dequeueing
requests in a workqueue without disabling interrupts, potentially leading
to a deadlock.

----------------------------------------------------------------
Takashi Sakamoto (1):
      firewire: ohci: avoid potential deadlock when queueing AT local requests

 drivers/firewire/ohci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)


Regards

Takashi Sakamoto
