Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B4A371D1F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346567; cv=none; b=n/B631Ot6h9h5Qx/axnR5ajfDP8a4cYOdlgkMoOBPnZjp95Ck8XfoIdULx7se8PvUeZD4pUjJLFesinqUYSyDJ5J2T/MPGH5Fgv9F7ZI0mYgNmG/C234rx1LQsaj7TTSqRvtY56aoBWCQ4YllNEmyoyTp2AU3e+5aqXfPkYHYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346567; c=relaxed/simple;
	bh=Ne8FJ2CatbJH/dyIAgBMDDx3/PJJFm2/X+ZxgZdhnvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SZkDGN9PCfwo+c8h+k3X7N7jeKcSE2zrrNCMGkBJo7rzGknLtLX03omADC+FFYBTxPA7LkUqf5WcowqeZkQR+wDEC0izD6TSmDXqz1SZf0jo0ThmRdMuAmQHJ4oJbteGLo7T3DmKnXkV3hgKovNrUVaczsjWNvCPGZaFL0DQxv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ha7iA+5F; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ha7iA+5F"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3388EC653FA;
	Fri, 25 Sep 2026 14:30:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ED656073B;
	Fri, 25 Sep 2026 14:29:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03A47102F1E10;
	Fri, 25 Sep 2026 16:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346563; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IBVKpGo9SdYMDRKnYktj3GgwhPWfwfIQopIZhYXTq0s=;
	b=ha7iA+5FB5czU/gl00bimvtAFfEzrKpIeSIDT8GGcAMZ2Pwpp5C3Loxf4YOpQgauA0Ayf+
	cp5YugBOr2B9uI30L+QhCbQ0TtUoVWMSZmJpIYryj6NaVo5bBKnXuOdnFjDEcTWwyqtwwn
	bEC46Iz6E5e13Ig5lAUZZnsc2kLDGCCfrdGjVeUA0Aw9LW2sH81GoiMIpkrNNm913Gr+CB
	FaKWRw8iyg9TGky6ys6JH09ZT6rv66Uhy7UUXYCu6Q/zd6Hl39PUbt3pUiq3y8MjFFF5fs
	cjaD+0+B4tZVxKRQn0Aql0UZaq9XUcqnEHOsjCK4/5Ux11dxYxNiaiZ5odKrgw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Stephen Bancroft <stevereaver@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260923092626.873202-1-stevereaver@gmail.com>
References: <20260921021459.283023-1-stevereaver@gmail.com>
 <20260923092626.873202-1-stevereaver@gmail.com>
Subject: Re: [PATCH v4] mtd: maps: add INT0800 firmware-flash map driver
Message-Id: <179034656183.1166139.3557202983918719250.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:21 +0200
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

On Wed, 23 Sep 2026 19:26:24 +1000, Stephen Bancroft wrote:
> Add a read-only mapping driver that binds the ACPI INT0800 "Intel
> 82802 firmware hub" device and exposes the system firmware flash as an
> MTD ROM device.
> 
> On x86 machines the boot flash is decoded into the physical address
> space below 4 GB, so a plain ioremap() of the declared resource window
> is sufficient for reads - no SPI or LPC controller access is needed.
> The window may be larger than the real flash; undecoded holes read as
> 0xff.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: maps: add INT0800 firmware-flash map driver
      commit: c4f64a86a28d218f3b16cd7b18691993aa60db60

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

