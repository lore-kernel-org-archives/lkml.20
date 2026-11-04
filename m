Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805599;
	b=grqFsWQ1thdLTp5AeBykCB0NJmXSVHrfXtOcF+p4pirkB9YJAejeQ71Ul5Zy/mhi8zH0
	 i4IcYBZ7uu/rlTWZRutyHtSM0bgE0lX+OJIBoT3eAZLGxHl1IZQxIcq1KCszGRqHStE86
	 Ok77GcQMdDqIPqoeEfUNgDQvWgadkpD2j3nRz8nIFrh3dcLqQWL5hMt9tj262c5BN4rN5
	 pkXv7P8WozQmvrlCHHbwZKYx73fFclCmvWz5SIoEzcljZbZjm174nmqRfVaQwZvvQQNTg
	 S89xYN+kphk/yq4hISYJyWtYa+zWWo0L3OASXw69xhJ/oR/Y+EFTP25VJrnW6bJoqmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805599;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=1vYsnOf0pcSBEhv+qYUPA7uTPXegSNz6pmF1iuHj2Ig=;
	b=Kkdc/IA39IIhXRvPb6MQ/S388yDKZo86VCDok5VtWw1bjTapj5QaYyrGOlz3BxfZTHnJ
	 vD++dyTaNfX9bmI40REMYJjrxsPyy9ZIRs95E3aCfXfaCMyghG+Jhq8FNvDTXUXpDemu8
	 A56ljTQ31l5InsZKmOmRXcB79dxL1xDvxN082fRKTt3Sn85hZCbK5ezvNqkMMgD59HLF7
	 F3wunVNdP6SExP76PqfdNjYUo5KLvRJYUL+XmMy1NxSkl0Jz3fuPLpTWpm1lrE9L+CLT3
	 Y8FjUTGkYGjAP2K9unjwG+BUbcAZs1z3++ryEiUOE9Izlo2ePETrVQymC0RpLznTMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RI8n1doZ;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B466082BD7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B466082BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RI8n1doZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 44638C8F472;
	Wed,  4 Nov 2026 15:21:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FD3460770;
	Wed,  4 Nov 2026 15:19:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA8DE103291D1;
	Wed,  4 Nov 2026 16:19:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1vYsnOf0pcSBEhv+qYUPA7uTPXegSNz6pmF1iuHj2Ig=;
	b=RI8n1doZ24e5lp563mCYI2FwK6ME6AAO2Q+tWCrxV0h5W4iqc6uhNqICWo+niO5NERQVGV
	gSszIk4D/XVVCErrLdr7ZCBGQhJv8yHlvAWfEcaxl5Vx2WVZqjAnSAgRmuZbbvlEFv/EZ/
	KEySkQjkpDWCcDOA5eHWBDkHWMin5r3P5FF06Snl8Z7UIjlqkWF6auMwabhkeM9eBAXHvt
	rtT6e+P3Ievm8MbsBVC9eCLtaysvr53zOh0IqKVqzz9p1q/PfNsJF5AoYd8yABD6BgTnfu
	LQg7AoD1KXXVgQCC5jF1iyyyGZ7z4vMdYauOzbCWbEdzLIDHQeHvywZm6RebyQ==
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
Subject: Re: [PATCH net v3 08/14] net: pse-pd: stop async event sources
 before freeing PI data in unregister
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
In-Reply-To: <20261103220217.1131971-9-github@szelinsky.de>
References: <20261103220217.1131971-1-github@szelinsky.de>
 <20261103220217.1131971-9-github@szelinsky.de>
Date: Wed, 04 Nov 2026 16:19:34 +0100
Message-Id: <179380557479.1333589.2203505623273885498.b4-review@b4>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 03 Nov 2026 23:02:11 +0100, Carlo Szelinsky <github@szelinsky.de> wrote:
> pse_controller_unregister() flushes the power domains and frees the PI
> array before it disables the IRQ, while pse_isr() uses both. No in-tree
> driver hits this: tps23881, the only user of devm_pse_irq_helper(),
> requests its IRQ after it registers the controller, so devres frees
> the IRQ before unregister runs. A driver that keeps its IRQ across
> unregister would read freed memory.
> 
> [...]

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

