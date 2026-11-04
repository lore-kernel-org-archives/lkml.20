Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805602;
	b=B6MNnifPatYjZF9HLfHZ9vha+ejsyCvvIW8l/7Cla+AFCqq7YZDWNfTjVqNJaJbA3GpE
	 vKGZAyKoV6GCrmbKI/gmN4EPMcNwGZKScRr6TBEoFNyKiyCKe0sRbHqQLLHG6tW157XeK
	 ETv0tpWxMIpU8+bsmAoqPRMkBkHU9Aoatfd1ehrFfweS+NDDH+G6QhateLVIDElfkMgmx
	 3B3lTJfxTjVHhBd3YL/9/ViG4ANf0tWgzg2KSZTzb7dGRJihoaB73B1jgWB9uyH3uxnvq
	 ndXDHY4jLbir7o+fcoij8fG0NvUn3U/Uh2pJ/SotOxRhvvOYpQH8gF3OHdwREtIdxtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805602;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=Z8PzF1d3Tuj+ontXGJda8/L0k9fX6Ie2H/VO+bwMLTE=;
	b=xIepzbw8DAHc607gW7OQIDotMFKW2uaS+wUVO8n9Lz+h7x9F41byLaASUYPejAPDMXBY
	 fL8L6xcH5CJ8MQ+0Erirc7Vx3FUzHwVjUs6n8S3FzhlB2dqM5NouJmtbchEBXNiygVVgx
	 ABtUpMsTQq5mPaBnh6SaSfg96mRbo8MRFaHfT3V2Axe/XgfoLMYr9KS4POeHtSmRwv+9K
	 IP2ALFdlu81DwREVD3ygTcVEmI6FPn7SktFj8AHWSTQ7FQ40GomCNYt6aSO+JfuyGMBwX
	 gXr1IAW23mYq1e/md1U5vj4R06Tjq5rwResNu9FLNkQIsZAiMbVCudrjjbJs/k/A84w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2EWB8QC2;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD56606A7EC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD56606A7EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2EWB8QC2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 089D9C8F470;
	Wed,  4 Nov 2026 15:21:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0495D60770;
	Wed,  4 Nov 2026 15:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB279103291D2;
	Wed,  4 Nov 2026 16:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805598; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z8PzF1d3Tuj+ontXGJda8/L0k9fX6Ie2H/VO+bwMLTE=;
	b=2EWB8QC2IMplIFJovzMVda5gOIoXlyd3kF2rrn/D4Gc5hgIS/re1j4eJRhD4K0Kqrx0dVe
	EQFjCe97NNOOjAgzXPmU7C+TrE8zOadMQ4oVnkxtpmKDra2z58QS+AQOF4khlEGkg26zu5
	rYbJXhnZktpPNAW5SJbTNxfJbHgzvu/iolGIVNi03Z47ho3XfBUzPdCWtMvd60jhcPoakW
	dkYfbIaylzO3rrVx+oJD7H7UoSM4hJSIZxkZal+vDg6rKe8sAYC7+5oMqqjoF6bO3fhKmZ
	+BTsmdqNlUbfBQ0OXvHkNlKxwNXhO3T24/umxqGOdpzX4z+gkGE+gD7QMfUK7Q==
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
Subject: Re: [PATCH net v3 10/14] net: pse-pd: keep the PI data until the
 PI regulators are gone
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
In-Reply-To: <20261103220217.1131971-11-github@szelinsky.de>
References: <20261103220217.1131971-1-github@szelinsky.de>
 <20261103220217.1131971-11-github@szelinsky.de>
Date: Wed, 04 Nov 2026 16:19:34 +0100
Message-Id: <179380557480.1333589.2244096397403709658.b4-review@b4>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 03 Nov 2026 23:02:13 +0100, Carlo Szelinsky <github@szelinsky.de> wrote:
> pse_controller_unregister() frees the PI array, but the PI regulators
> are only unregistered after it, by devres. Until then their ops still
> run, for example on a read of the regulator's sysfs "state" or when a
> consumer enables or disables the PI, and they read the freed array.
> 
> Free the PI array from a devm action that is added before the PI
> regulators, so devres frees it after them. This also frees it when
> registration fails, where it was leaked before.
> 
> [...]

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

