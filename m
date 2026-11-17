Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908288;
	b=Kl/dUnyD6DGaJ/DvygKBNI7t6hJU50Hnq2X/7/2E10pO5gqhQ3eZjMvKctWKLn6aXB1c
	 yhCkiIWV4UhNHqF8e0XVBpen8DifvD2X1lZLR45Q2oM7wbpRfQMdo24SDwrNEwNntScN0
	 f6jLPDy21miNQQBuQ1uCq0ye+z0cY/CbwdLrY2jhnoktC6cqvgvDLU2t9GMs++hjE2bzC
	 ZG0+pMMpZoDEMaMRCashUkRgqFruSFmtVYcIJSYSdoYgaLjYt2ULrtXL3CqzijPtmtoOW
	 Mt3m7mJNLTkSjPXvipCnCloMz62+Aosf00wq1RtIuCKZfoGMssta1zTn0bKFSXfWj5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908288;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=tlBoKmorBtcIb4QQ2wVoA2joobZWJYIm4KpVprAp2zE=;
	b=s8W152YC3RV6qlxqhrvk/lneHhQWx465iFhbbqgWUHHJXc4dsm2T2xcZ1gD1yW4cRebs
	 o1QcmE0IuSXHjXqTS/my6Srs0fq7Oze6zhP1bgp/HXPSrhsOUgGr816ePCbmv3E4QRSFR
	 XOhhMux+VJ2i0K4+ONUROSqQzBmv07vAhk/YX5taEIoSOPuz3tNSydJqtp4bfQmYyGpkc
	 d9K/cd/JKwoyIeqqYBJ4B85cUZ2xCdr7NxFHXkmJ2fDfqN4YBbvQ1aqGVo/WGzS0G7S1+
	 rOtOige3VjSYy09aAZLa4MnFdB72rEv2YIN4IFFfHP7rZsSky7CVXZFazHJCGrICkIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="yM/x3CPs";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B7D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yM/x3CPs
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 83134C4EDB9;
	Tue, 17 Nov 2026 09:38:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25FBB5FC81;
	Tue, 17 Nov 2026 09:38:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C408411BC0493;
	Tue, 17 Nov 2026 10:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908284; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=tlBoKmorBtcIb4QQ2wVoA2joobZWJYIm4KpVprAp2zE=;
	b=yM/x3CPsv371lnsTibypMg+dMRNFgQIbfFoDeD2qBsDdboH+kKUZyk7mY5kgvDHH8C5oTI
	n4FDAxEsuHU3so03bQpVcUf7zKewxSD8wups1A/67cAfBFJZNKXhKbeB/wHEClsHq9zDdQ
	u2rk1fhyyoKKShNeiv7FIuwi9yqdEalIqOhHs9pdZM9c57U8AYHyUEZx3Yqu/n0ybxQ/kx
	QxWqG/OiSKDJXe8izCYtt0EIIYhIIEJv5/8x1PfofgPPvv59fpGIWoca81f6dEXSWvLn0P
	BZXOizTJT1HwU3zTq9Ahau3OnzWLrXfQyoJYy7nFGHRKmxM4dDYqqKEgnPxs/g==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Stefan Agner <stefan@agner.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH v2 00/12] mtd: Remove #ifdef guards for PM functions
Date: Tue, 17 Nov 2026 10:37:38 +0100
Message-ID: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This is the v2 of my patchset that updates the MTD core / NAND core as
well as several drivers to get rid of the #ifdef CONFIG_PM guards.

Instead, the code that depends on PM or runtime PM will be
garbage-collected by the compiler automatically if this config option is
not set.

The rationale behind this change is that in general conditionally
compiled code is a bad choice, as code behind a rarely-used config can
get broken without anybody noticing.

In this v2, I removed the pm_ptr() use on shutdown callbacks, as neither
platform_driver.shutdown() nor the mtd_suspend() / mtd_resume() that the
shutdown callbacks call are related to CONFIG_PM.

Changelog:

v2:
- [04/12]: Don't use pm_ptr(), and rewrite commit message
- [05/12]: Don't use pm_ptr(), and rewrite commit message

Cheers,
-Paul

Paul Cercueil (12):
  mtd: Remove #ifdef guards for PM related functions
  mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
  mtd: spear_smi: Remove #ifdef guards for PM related functions
  mtd: physmap: Remove #ifdef guards around shutdown callback
  mtd: maps: pxa2xx: Remove #ifdef guards around shutdown callback
  mtd: nand: mtk: Remove #ifdef guards for PM related functions
  mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
  mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
  mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
  mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
  mtd: rawnand: r852: Remove #ifdef guards for PM related functions
  mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions

 drivers/mtd/devices/spear_smi.c     |  6 ++----
 drivers/mtd/maps/physmap-core.c     |  4 ----
 drivers/mtd/maps/pxa2xx-flash.c     |  4 ----
 drivers/mtd/mtdcore.c               | 10 ++--------
 drivers/mtd/nand/ecc-mtk.c          |  8 ++------
 drivers/mtd/nand/raw/fsmc_nand.c    |  6 ++----
 drivers/mtd/nand/raw/hisi504_nand.c |  7 +++----
 drivers/mtd/nand/raw/mtk_nand.c     |  8 ++------
 drivers/mtd/nand/raw/omap_elm.c     |  6 ++----
 drivers/mtd/nand/raw/r852.c         |  6 ++----
 drivers/mtd/nand/raw/txx9ndfmc.c    |  6 +-----
 drivers/mtd/nand/raw/vf610_nfc.c    |  6 ++----
 12 files changed, 20 insertions(+), 57 deletions(-)

Cc: Stefan Agner <stefan@agner.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Maxim Levitsky <maximlevitsky@gmail.com>

-- 
2.47.3

