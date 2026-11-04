Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784384;
	b=tLls5fQlptmw4vBtgndfg+P1Dy2NAWu0Z8IOyEkQlia9panDac1YEp+x5lAsocbTWQHy
	 BBenJegsNCKcgCQYc9VgRKw0ms+y1nf7DLHNnFI5c+O6obDqEE/1gCiFO3iaqZLXA4Yx2
	 AYeXo2s+cb93SQtlbomw2GbJ/8+6kyASNCRb/R9YEMhX9mREDErUjMz/jjw7zjG0X5PUw
	 xTG1VHEfBlwRgb2zHB95ZrE6qtq5Qhi4/5nFmmCLxL1bNFK0nYb/gJxd5Smw+jJn6tWfA
	 xN4dkEOijUjVYEnaAKlch9q5vHKJRhtPKKQfv6h00rr1MCwef59VMRfrUZKo4ggUoBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784384;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=4pw2w5TX2D1rqXpzVEo3CKWGtWhwTLpbdQMFSbOSiU0=;
	b=PZdH/wEGLjh4o5Tl7piBjb7FNGA6qdK0FuidgBpXXSGrjnCMi/s4z4bdeFKLacGgnetP
	 VKIm3A8MfqHP/v8D/uvPuHVVG3z4KqLCyZqzP5cwdtdhrCKcdJ02EZcsLebPuveERJbil
	 I+BLPVuLt5fvcC2+FDG+pD/aqRig/pVyB5zAq9VqV6F+i4MpVZAJYEKf3wSZzE6JP149r
	 sM1vcmEw0MqFvCHjd0u+a3Sjxh8x1LLplMvuSIjFzqyx89JLN2cSo6LKrfHZVPltpYomS
	 r65V1kQZhfAyYQ2sjpB1md/XcU49Zecf7XyuDo6Q6GnNDP8hwZBfepnGEku1gDutUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QxeH4739;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F12A606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F12A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QxeH4739
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A77261A1452;
	Wed,  4 Nov 2026 09:26:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7209560770;
	Wed,  4 Nov 2026 09:26:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AE2B1032912A;
	Wed,  4 Nov 2026 10:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793784378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4pw2w5TX2D1rqXpzVEo3CKWGtWhwTLpbdQMFSbOSiU0=;
	b=QxeH4739fwoLhz0ukYQzV6AsMjONbp5QSomsJ41SMZ1kGtMIhp0IkZD2VMRKg0s4BQx7mC
	VVTLpP2Og3F8/hZ8ws3JQPAN0rEbD9e04H94QwE8ZZLvxuvqSj/95XVG87xULXJW6trTnK
	lbDpP5+rZu/S4b9Y0SWU+44qKu5esBVtDfSmUDFngdjUqFWnYD+/rRBl3r7Rzd/h9Ua7iX
	UqMU1y0H/p42JuTGo2GR6oj5TtGqa9BadHKfIjsAuLZ5JPBIxb6rbtMSXe3g+kjbAO7WRW
	4aGIRrEXwnttIVKDiPd1tamr6KCG6PYJgHpEVHxlUXFQikUfxOmZRDxyr5eUxA==
Message-ID: <4244dde8-9efe-415e-bbf5-7b95f36ad379@bootlin.com>
Date: Wed, 4 Nov 2026 10:26:08 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2
 ioctl
To: James Clark <jjc@jclark.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104052504.1886335-1-jjc@jclark.com>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261104052504.1886335-1-jjc@jclark.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/4/26 06:25, James Clark wrote:
> Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
> ptp_clock_info") modified the PTP core to validate the supported flags
> of external timestamp requests, rather than relying on each driver to
> check them.
> 
> stmmac_enable() and dwmac1000_ptp_enable() ignore the flags, and
> neither stmmac_ptp_clock_ops nor dwmac1000_ptp_clock_ops was given any
> .supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
> PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for
> this driver with -EOPNOTSUPP, where before that commit the same
> requests succeeded. Only the PTP_EXTTS_REQUEST ioctl still works.
> 
> Tests on an NXP i.MX 8M Plus (FRDM-IMX8MPLUS, GMAC 5.10a) show that the
> auxiliary snapshot inputs timestamp just the rising edge. The reference
> manuals for the STM32MP13 (GMAC 4.20a) and the Cyclone V HPS (GMAC
> 3.70a, which uses dwmac1000_ptp_clock_ops) say the same.
> 
> Encode this in .supported_extts_flags. A PTP_EXTTS_REQUEST2 for the
> rising edge then succeeds, and one for the falling edge or for both
> edges fails with -EOPNOTSUPP.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

