Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805596;
	b=1L84iP5JAsh5ff4vSJy2e/HXF2Xub9j1Obx93P8F86SsKU1BHCYD+LuOVBGSwI93crIo
	 v+h1rsRyL/5VisiiqyyfpJ3JUWa7x8Q7JWtrkuPxTQjh2n9yOGT7OvCLBEixQbl4AGUjl
	 eH3wc6uvvuTTRxi6Cp/z7vsVM4V7tkaY8htrgsDfzhCi0dFyUSX1kCY3Om0CAs7KvsxWT
	 70A4i2d8glGdJ4w0rwV2Nd7cULjuZN6QgAaBQa8qIYnq4XZUoTDDpezCsSwERQXfDaYSn
	 WCCCmlqePmjSNnafdrIbitXtkiUd+rwp/i4Zt9ruykbS0FpeiQ66Rc9qUclDQi9Tz+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805596;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=kkdyMP4SKS1JVf6/+csyql5Th5btPnXDMEmXeFc2r4A=;
	b=t6ab2ua0InKueKXuO7D91TXYzJe+4PZ0UJl1Yrcq+h/GNyP09HH0v9nWDstHzsHOv0FD
	 FaYlEVqeKgS26PZJv/w9mkp7OyPdLnYtVaIG967B8euij77/rc3rPQyIuU0A5zQPdN0aq
	 5qLmtIc1hEurAnroYRJ6+VLMOC2m/bF/Q+Brxy4FYHBkWEHUL7cpxmIhG3fBTpn08iAz3
	 1TGFlX8YE4wn4aOUOyQp7YylFptoraeMHYW1xOlvsp4gQtCPrYTo2/MFHr1nr5KeGgJdY
	 gKFDcmy0nCe4l1FSsKzy/b+Sxv+W4ju+X5M3szE7IMWSe+W2o/i3hXpDcb6fXKpChEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ktTG2+iX;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9A606D819
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E9A606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ktTG2+iX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0169C8F475;
	Wed,  4 Nov 2026 15:20:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB3D660770;
	Wed,  4 Nov 2026 15:19:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59759103291D2;
	Wed,  4 Nov 2026 16:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kkdyMP4SKS1JVf6/+csyql5Th5btPnXDMEmXeFc2r4A=;
	b=ktTG2+iXZiY9Mon3B69k8zvtF4HZIh8HzQQDZiFhKOIlKcr3UzRsB3+Pqfz48ubgD27c/c
	M/fUJc9O1DW/YOqZNVfTAzix4enH5GC8H9PqIaxFsNgedbegEH0uyjdXof31MvjjcTqDNX
	NgjssTjdsVTO2QHlJfcz9oMywFO3YYNyx+dlJCUUyRse+0rdFr1fmlL5Ln+4Ay07L6qn3W
	SEenIYGF1CkNTDrmSzYuNLAvvePVIE10Jkmub+TsUJBNqUYYABwytXJmMP8okgNPdfMSrJ
	GWnCNKUnDGCB2SvFVDi+X1h4ebmu8M0GB5/K6NlNyjTT4YqAbkNW6A99sxatFw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 07/14] net: pse-pd: do not tie a shared power
 domain to its creator's devres
From: Kory Maincent <kory.maincent@bootlin.com>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Kyle Swenson <kyle.swenson@est.tech>, Ross Cawston <ross@r-sc.ca>, 
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103220217.1131971-8-github@szelinsky.de>
References: <20261103220217.1131971-1-github@szelinsky.de>
 <20261103220217.1131971-8-github@szelinsky.de>
Date: Wed, 04 Nov 2026 16:19:34 +0100
Message-Id: <179380557478.1333589.6060800004280605045.b4-review@b4>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 03 Nov 2026 23:02:10 +0100, Carlo Szelinsky <github@szelinsky.de> wrote:
> A power domain is shared by all controllers on the same supply and
> counted with a kref, but it is devm memory of the controller that
> created it. When that controller unbinds while another one still uses
> the domain, devres frees it anyway, and the other controller and the
> global map keep pointing at freed memory. The same happens when
> pse_register_pw_ds() fails part way: the domains it already set up stay
> in the map, and devres frees them.
> 
> [...]

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

