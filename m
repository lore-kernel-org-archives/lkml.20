Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F3E4A2627
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343351; cv=none; b=cSnmknuqjbkAN7riKbX0zrOPgl0hKeloMbl2IlKYdGKywgXONBdpyuAck15m+khThsvhiRVf+ED+oKIDBPK+XApbypyN9ax/flX21fSIj6sgQYhyCm4EXUHV6/Ss+fwzVh8Qz7fys5+v/1j3NuYa+yALxSoX1xg8scLMg4Tyl+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343351; c=relaxed/simple;
	bh=P+GjcTLKO76fZOnl2Km+cOqizEfTXAmLuXOwvS4gQa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FL5zT8Nk6mXkte983FBgjbOWcqUSwr2C06WqsxRUKRnNOn9iBXrfFDWTx3d6rSYYcuCUa7/OOIASLXmr5AeTETgM36VHg+Ktr88DrVvVA73PLXyBwK0mNLVHFEpDex1Km84M5hGb3hJ3J391O76R5FNL0ha10XQM3aFuYoclfaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ny6LvokO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ny6LvokO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BD317C653F2;
	Fri, 25 Sep 2026 13:36:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E01C66073B;
	Fri, 25 Sep 2026 13:35:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D415103293B8;
	Fri, 25 Sep 2026 15:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1EJjIk661tikGJLhJppgEVPju+d+qJSsQCa/QerB5sk=;
	b=ny6LvokOTTzcILNazPwpbeNmw2xP3dG5bx+iKYLFy2S7VHg45a7UFIz9Dw+0ynvgHvaQSv
	EcSH7rgGCkxFYFYtcMqKgl2M5NQ8qshp0fCBAq1sBEwe2gq8QSuaN3dledvxWODzIxhxRG
	g/z3Tf+04TlnRnFywsGIdwtqgCkcODQdqwC04wl41+hiRQxA6Cgp9zg4pKVbaUH+RQ3Q/u
	mWB4j5wJf+Ei/SFzqjzDhW64Zk8PkicUxEGGAcB1FeITUsAYWii4USRLp5LBzpmtLIT2Qn
	0r1gasqQGhMtLI+74vRVJPxUj0GonOA3+e+Du6ulL0UKPuY4nNGL4gYqvXM47g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Hui-Ping Chen <hpchen0nvt@gmail.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20260915164537.2496540-1-lgs201920130244@gmail.com>
References: <20260915164537.2496540-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: nuvoton: fix clock cleanup on probe
 failure
Message-Id: <179034334209.1124555.2976716142691961983.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 16 Sep 2026 00:45:37 +0800, Guangshuo Li wrote:
> ma35_nand_probe() gets and enables the NAND clock with
> devm_clk_get_enabled(), but the ma35_nand_chips_init() failure path
> also calls clk_disable() before returning.
> 
> devm_clk_get_enabled() registers a managed cleanup that calls
> clk_disable_unprepare() on probe failure and driver removal. Calling
> clk_disable() explicitly first drops the clock enable count, so the
> managed cleanup attempts to disable the clock again and triggers the
> clock framework warning for an already disabled clock.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: nuvoton: fix clock cleanup on probe failure
      commit: 8a485a40f45a19c5fcafb5cbee7387c2762af7c4

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

