Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925403;
	b=3xnb3asybrAmlMzxd6V8kyjxcGBsrNqCwNVjsxBnGa4KlyO7SGdNy/DUsEpaMe47zK31
	 ijvrhMc35Ry92/PlfhqZNx5ezVbTi3sZUAfwwexul6H+s6gksIzCHNK7GBBtHgb5bATAW
	 QLo01dLe8g2iQlpaidO4fmruVxNl3ulwBxhNKkyE8bdVue2+CI2sYfMe6JaUgR/wPHI2h
	 URRQgF5ehMkSzTRqnBN6jUOKOwAjuA4SnXYQKBiLat815anoLZWLj1YEQPp8OYnrhXftS
	 Z26MvsW1Up2dTjkB2lsDGK9QFXK3cfAeCF6eATzt4GOVP8na2WDfZpy/SXsykdmtxCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925403;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=6WQMx50c6/HUXnMlaTSPMugwkj2McUSU1kPMIyMEHsw=;
	b=l8K+vR1mxo6I7AWkMM6sfgcNXxOuEic0toOkVDJ7VwQW6B9xXcUhwOVXLGHXs2ccIOgu
	 5Y1Bfe5ODK2m/AB+oiaCxBYv7NfaQrpKrMqxaQp/oUPlzSSnGIbdSqgOVOit7WOGHGsw2
	 GMnRbB0oF+h3o6tiu6lPc7E69ccsQIwVZbP9mBXUKbT2/fFaS+uFq+p0gjqwPT2y8HtaE
	 guBkEVEAszaQo7V/kYqbPc6ZvoIYOKKgVPXE5tW6ZULc7iW7MaUCuALpJGYOxwdfma/hN
	 Lk+XW4tPWbugVezCMgQsixNlZ2MqJ/Joannqzir8XQLE0XvKi0yanuKLLApAD5r8ahg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i4rxdppC;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C8E606A897
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C8E606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i4rxdppC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E21FEC79A9B;
	Tue, 17 Nov 2026 14:23:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D30B5FD6A;
	Tue, 17 Nov 2026 14:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3333111BC0041;
	Tue, 17 Nov 2026 15:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6WQMx50c6/HUXnMlaTSPMugwkj2McUSU1kPMIyMEHsw=;
	b=i4rxdppCKk1vAV1bBDPISu2sjhV/O07pkl3hWlxjoWPLCOJxe2H3awTDdtMHSzYR1sR72m
	6tnMAHr6C6gOyeelGfpnJSRe6/mgeU2KYHIKgBn47b6ymsa2fPMZK8qXehQWZJUes830Sj
	2ULJEn+uqisojbvAhQXBbLDOhtluiKYyOCHfeXO6Oydd8n21mN7G5lTOw/1vXbGWJphBYk
	PJmNCdInFgHIQ/4so57R+7cMitL7aPvr/KFKNtD+YZI4MF28GL6MjjhMs2QwFkx/8C1hsL
	eq5SMKM+hiD+6r2vHLBAnbJqRLdSh0N/Q/y6sEtoZoi1YhAHojuqy6vv062vcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: han.xu@nxp.com, Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: richard@nod.at, daniel.baluta@nxp.com, vigneshr@ti.com, 
 imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105095935.159650-1-stefan.ghetu@nxp.com>
References: <20261105095935.159650-1-stefan.ghetu@nxp.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix unintentional integer overflow
Message-Id: <179492539910.2259780.13383890149441799128.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:19 +0100
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

On Thu, 05 Nov 2026 11:59:35 +0200, Stefan Ghetu wrote:
> Cast block to loff_t before shifting, so that the shift is done in
> 64-bit arithmetic and the potential integer overflow is avoided.
> Reported by Coverity.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: gpmi: Fix unintentional integer overflow
      commit: 3b955aa675345cf494a67f95f0cf91eff33c1866

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

