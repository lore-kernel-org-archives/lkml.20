Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510566;
	b=UNPMKXntlcELSHvsaZ55VXwZTeaZRjDkUtk8yMq/icLb99IMCl6gcZaIeXGJuGzDIjBq
	 Qe5Jd4C/k43ocJkwcdyyIU91+WxefGGF8IfMfPDiM2WjwrmUxKubBNaLPS6YicSrEWN1i
	 1N/LMwAXkl5nKB67Y1oYloJ8j5E8uOACNPeBjhlKvFoQwlwQYUi8Wb/oBT3T0z+gBbUtn
	 nylX28j5GvIwANB6l1zvV3kaM0CqJxfoOOlOEopb2pluIt0UT1fGCaUvtlUPctNqtKvPq
	 1BxUFxqVl9+jHz3ZHHoDvxaZ3atc4dUGCnO5wm3fNd4H1ylPFrSL7vLT4A8WFacofKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510566;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=LFohBOrLJxnGJCYd3p6qNGOqsmehV4Rsw5Zp+Kdij5U=;
	b=E2ySSzuzfUvnBaT7FnSnwDNG7OeTGuSvn8QNrbDje5NjFwSAcLFoiiM4R1+O6XtjGfWt
	 M262kFEi/W3uHRjZWBYHtn/YhZx6NwPOefXo6kJ6NiD6+gE6a5BJzTxnzXVo4xJyiZPKO
	 GdfVxJ9eM/bxos1tbqGaqUiMyXuFmGgWoY4CfiUDVpZCdyCKiREmDdiJdaV3u+RKCg1Bc
	 Q4weHDQmuyB5VoFraeVZlkfx/PbDYg3RDOoAx+glM5JR9zfbHBstXR+gVFmZ/dMfp+F6O
	 2X8OYd7syqvrFTyXa9usDMC01Npww8p4vskkYayglB5uXbWvy87hMDu6O+e//f8/fGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VpRGFpTL;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC729606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC729606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VpRGFpTL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 453231A123F;
	Tue, 20 Oct 2026 15:36:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D68B60393;
	Tue, 20 Oct 2026 15:36:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10558103289A8;
	Tue, 20 Oct 2026 17:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792510560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LFohBOrLJxnGJCYd3p6qNGOqsmehV4Rsw5Zp+Kdij5U=;
	b=VpRGFpTLBDDiMTl6/NGSODWak25JpEcpjqfB+DUqvNA+YksPPTvVDqqw0N+dtA9sB08vcb
	vMW/GCyrPOP5GCgump/RzvYP7lSGI1qdKf430eAAza0RqQec7tFf695VDwP/z/4Ush3g3N
	VFWUOodkVNDN4b5YYkpmr1TY1Qt5w7Zpoksi2WAN1/7gPYcFVyex/MRgTBgeX6PNN1m7vZ
	DewqcpC1vXJzZmoq216k93sPY1F0Z08KPLex+bn1YlAtgEJvFdM9EOMr8+Bqjev++eTIYA
	JV7PsaDyBd2RiZiNn5cuNC0CgxVeYU44PC3ljOqQngNQqy36QokCKtQ5PhO+6Q==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] Add support for BeagleBone Black RevD
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
Date: Tue, 20 Oct 2026 17:35:52 +0200
Message-Id: <179251055253.74160.3565168560141526355.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello Robert,

> The BeagleBoard.org BeagleBone Black RevD and Industrial (00D0/EID0) are
> redesigns of the BeagleBone Black Rev C3. They feature an IT66122 HDMI
> PHY to replace the EOL NXP TDA19988.
>
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>

Tested on a BBB rev.D, with HDMI output working.

Full series:
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

