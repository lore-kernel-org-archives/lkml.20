Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805607;
	b=KwAuprNMhZN1z4sPXz09bdB7F2eSYpkweNCuTg9eGTXpwJhH8TSpVJ1Tiqn97rlPTcF3
	 wDHdpDk1s/g48ehMPdEpZ/OWlkvrocB0FI+JkSRjb0pCdmrPVfnDmwbZXZ11//1zdnqUH
	 /UCC9GP89b27qR2H0Al/PW9JjQsGTCs/NiBQVrrZdcPX00k4eVbNK4cmZNMjHpbHTAyGz
	 uPAW9Ms6MPAsow59hYK90xr/kGe6lt0UslKuoCkz0rMJEvr4/dst2kZDnwgNNPoMndJlG
	 BUZVrIWQBQnWK+WLU1WyolDdtCZMkQjom3qVXzSekAizrL35Tp9KooRWxHRZTla+ZXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805607;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=GgM4EgkVv+1x6Punl4v9ucm9MZswVB97/k8FiaLVyi4=;
	b=QXtdY8xSFdEDwfF7T6FM1PCMaqSMKOJ034o1mwmLZGcU6eCZJ330nnAzHUEG04LWmOHg
	 ePY2k3S0xeNiRk1/mbhPTNVZSZoFYAVQMJYEPqlF4GLMxqd6wGrYfx80158sdqT9axx74
	 tLhmQqgQRqOehYOHbfWpoGE1Azo7sMgXO2NBcRFuIl9zdNibRtg4Ajb/NVgHT62PuzgzW
	 p9qllxkyzB8FmqpGv2mZW8Bve8kgecX4ZBVD085j1KoyEA6991ucaP/Nuc7xnZTaS6W3N
	 sU6NRV4s9qm5GVsoZVjYSS5dMvEwKGPNfIjfNOJAsnsOGS9Q3IVR6eNX7tJJYi9oPzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="V/Jvi2dQ";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4094608363B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4094608363B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=V/Jvi2dQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D63B1A145D;
	Wed,  4 Nov 2026 15:20:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F74E60770;
	Wed,  4 Nov 2026 15:20:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E610710329206;
	Wed,  4 Nov 2026 16:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GgM4EgkVv+1x6Punl4v9ucm9MZswVB97/k8FiaLVyi4=;
	b=V/Jvi2dQJyKD1n0dM64eS1cfjwExl9L1PeLjlrHs0EOYxZ1UqsCnVb39Luu62/vU9yPzMc
	/aDERCvsreWczQjLBFwhx0mgWEaWdxNLWza5Qs9V5B7xdKtSxFh+jcdHrX1vPfOtTkG096
	Jgc5I2bkqE3NALQa9MvYbs+ZjRUr9SI7jGGcWlGvfHwiJWDw9GOxCVsbqZgxx2sjeNAtZQ
	a4MTAncrH1WBvFs3NuFVxHobudc2xphVVzg6iem35uKn7OhMrQRlgd2NkONOP7MQDdOnpT
	lvTDuO+4bmTkD7qd38BPzC24x6BJnp9lj9ay1B6phz0qsfwi26ZpaORTZfX4kA==
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
Subject: Re: [PATCH net v3 12/14] net: pse-pd: use each PI's own supply
 handle for the power budget
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
In-Reply-To: <20261103220217.1131971-13-github@szelinsky.de>
References: <20261103220217.1131971-1-github@szelinsky.de>
 <20261103220217.1131971-13-github@szelinsky.de>
Date: Wed, 04 Nov 2026 16:19:34 +0100
Message-Id: <179380557482.1333589.5626232974220759600.b4-review@b4>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 03 Nov 2026 23:02:15 +0100, Carlo Szelinsky <github@szelinsky.de> wrote:
> A power domain shared by several controllers holds one supply handle.
> Its consumer device is a PI regulator of the controller that created
> the domain. When that controller unbinds, devres frees the regulator,
> but the other controllers still use the domain and its handle, which
> now points at a freed device. Reading the regulator summary in debugfs
> then reads freed memory.
> 
> [...]

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

