Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925415;
	b=RqL1eYtI3o0cXc972ZUc2IWOfJfp67+4AjcfBnyLnFmsiyff4dZfLqlxaj61mOMwNreO
	 86H9oDu2yIluPW5rPLKRsLkBzPmtUTZCYP1QG3UayVUVfYOLKyy5d8QjTX3l+yCH9H4hH
	 mw+QD1N2EO1qxW0zooFieYQJP1FwkNZJ546lkV4RXWCHDjDLTlNDMcS6EH5a6nMSwMaBI
	 wb17H+YcIakUSKEkQklGvD3nS0YC7TORRbgqaPvDcEG5vcRcMLXoOfncgCKK9izHAkUrD
	 L3qxO6eaDU27mOzPN7skFb0/5wPdeUQwcR6cHN6iiKQ4FdlixfhNkAlVoufM0RttlxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925415;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=lJElfTzwAuOZ5+pRGg7Cx4QSnvdl7mrqMyhfsezJNBU=;
	b=u3sh7aihG8ZLA/TjeRoMUOcDAIXTS4XRK9CTZYi6PCmVjJEO+4LgAeLYTfDHfx2swNbp
	 cWvB8ygiAJHa5w+spG9DD+sgWEuWunwqSt70H/rEiAeWTdNaHoLBV+c7ywlUYFc19O/YJ
	 5M5ASYbTOKxaNH6y2TwM+P2X0twdJMKaG3+qtvqtPgNgyVCRq71kdcFk95pMdHVRVvZy0
	 OV3vMVGsahZ97/QE8tzKqVedn1pEveCDXttEFuK0rToMSCgissyDFwUyKugnq47B0hGlg
	 45avLmhMysHuu3vPW8VeO1bvKPvJzCxkL41WW4c8jQRSm/LOxrQ05lXH/EqnT8FQRFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ToonxK7K;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC81606A885
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC81606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ToonxK7K
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BD2981A167E;
	Tue, 17 Nov 2026 14:23:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9413B5FD6A;
	Tue, 17 Nov 2026 14:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E9BE11BC0036;
	Tue, 17 Nov 2026 15:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lJElfTzwAuOZ5+pRGg7Cx4QSnvdl7mrqMyhfsezJNBU=;
	b=ToonxK7KN9snZt9NszwLPT7+JjcVmc9Brh0eQqmZOKZmxqQ1VpC2eUyJY2l9WvTLEUqtEj
	G2yJPcQHSt3fX+O1pTy65Ws8GHHezYQELRC4kD0eTY8oTnZjE7e98IbIk4WV7S+ogvuxpJ
	NqtH8jdyvhl1+noDhWU78VrGRd45FJRnM3S+jJbPSPyicnO5noM981XCHT+WL99IPOMilZ
	a7L7vjxDfANw13VYawn134NZKRCxH1WUqyR76Gj/zrVXiWshC9USg7XTcPNzKhaxO6rOFe
	pM3SfzSplFqAGGCiGWpV+62GZsFwP/eBsdwWc95H2HjLzfzvfAJKdf54hdvE6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
References: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
Subject: Re: [PATCH 0/2] mtd: spinand: add GD5F4GM7UExxG and XT26G04C
Message-Id: <179492540842.2259780.12341849740874264628.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:28 +0100
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
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 16 Nov 2026 16:28:45 +0100, Angelo Compagnucci wrote:
> This series adds two 4Gbit 3.3V SPI NAND parts:
> 
> - GigaDevice GD5F4GM7UExxG
> - XTX XT26G04C
> 
> Both have 4096 byte pages, 256 byte OOB and 8-bit on-die ECC. The
> GigaDevice part reuses existing code. The XTX part needs a new ECC
> status function.
> 
> [...]

Applied to nand/next, thanks!

[1/2] mtd: spinand: gigadevice: add support for GD5F4GM7UExxG
      commit: 3c8f7e833f0c6373bee90b897ce0697e2e697dcb
[2/2] mtd: spinand: xtx: add support for XT26G04C
      commit: 2c6220ff6e7cbb287120a047e1da9509d66c4915

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

