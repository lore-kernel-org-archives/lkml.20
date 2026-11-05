Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898775;
	b=yzTyB0FyKm6UaJLFSIOdUKBPvMySpewnZ1B9kp/uhYysJo7VeD2z/LtA7g8P3txlCVFh
	 X2x8qsLluxc7O+/k7tPVNXs/qYiiy7raoFL0V9pvojXzYxNQh8++urv7NshnsY7cHWJ2Y
	 N02S++OQpNt6sD7U3GfQi1LeeGN6qCKXCwSXns3TpWYPQvDGVHfBc4d9Fz4AfriTOdHNC
	 aYy8YFrdIh6osWG4lsx16vHog3RHaDzdkadEzqIrTJU7hTlyFisVOf8YcKr7MhZS7U4TX
	 4nFDltPq7fDi/geEJI/ALYDK8dScTDBjXAXRVSVuk47JpHYrYTNq0VWIxR+Jpd3wfsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898775;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=3+Md6IS5qsGquLQY5PzCkVhG7iMrdpAy4cpRkavqmhk=;
	b=0FrTQ+CrpGuvzMq62BDiY1LzgW53DcHz9RaXZWX/G2sFm7R8sDC5gdHAO2JOFj8IO1yF
	 HIiGW565p2mArzZ39evvGGqWJJ5DLBKv8EkYF1DaJ/vGA2HA/tZI1ajKGTnnrL3quU1Gp
	 AHGfq7gU2RKqlVEZDK4CeUg+r7u65+TtiKDA6I88GwsR8Wtw9jglSpFO3LZscinOl0ilN
	 xmreWzvcs5lbTd3C09THhT5UbNmeYzzc8gArhYbeZKZ/UOLZSX37H2FLSXEZae00gVlfq
	 xnqq7oO9BVcSsEWj+R3oaNdyHtYqcjjp21CHy4JTlLLtFBxzbzfXwut2cAkr+VQvt2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qKk3HxH0;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D14606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D14606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qKk3HxH0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BEC0F1A0C24;
	Thu,  5 Nov 2026 17:12:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 813085FF43;
	Thu,  5 Nov 2026 17:12:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B639D10329258;
	Thu,  5 Nov 2026 18:12:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898769; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3+Md6IS5qsGquLQY5PzCkVhG7iMrdpAy4cpRkavqmhk=;
	b=qKk3HxH09x1pQmKLG+wolNzp5jIkLcU1OiTumONkT/QdWFKInuy9NY/5/zWzCr3y1Fn4i7
	cN5gtGgw5t6H3yPk08PmHKPF5hLz047oc2Lq9KKGDUzjP/nkNhaZAJ4D8k4go3AjYzNG0H
	B7v9kGvelImPEikBMrw1DmViLDs4I8mnUWzAkvUPBdEaQJxWdx2C3uixe6bZ8dy8SWFzt8
	tzG04ciK51dAx0N7q30KFyviB5m5QOEX2kXY9uLMgiegIBMN/PhSjPrWUOrFaLjhGqvbQR
	YeV0pDw5u+gLyFAdPfq/lU9UY9CRDgqaXUDWthl687/XzX1RO3nZvoat+dlu0Q==
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
Subject: [PATCH 00/12] mtd: Remove #ifdef guards for PM related
Date: Thu,  5 Nov 2026 18:11:46 +0100
Message-ID: <20261105171158.399247-1-paul.cercueil@bootlin.com>
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

This patchset updates the MTD core / NAND core as well as several driver
to get rid of the #ifdef CONFIG_PM guards.

Instead, the code that depends on PM or runtime PM will be
garbage-collected by the compiler automatically if this config option is
not set.

The rationale behind this change is that in general conditionally
compiled code is a bad choice, as code behind a rarely-used config can
get broken without anybody noticing.

Cheers,
-Paul

Paul Cercueil (12):
  mtd: Remove #ifdef guards for PM related functions
  mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
  mtd: spear_smi: Remove #ifdef guards for PM related functions
  mtd: physmap: Remove #ifdef guards for PM related functions
  mtd: maps: pxa2xx: Remove #ifdef guards for PM related functions
  mtd: nand: mtk: Remove #ifdef guards for PM related functions
  mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
  mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
  mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
  mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
  mtd: rawnand: r852: Remove #ifdef guards for PM related functions
  mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions

 drivers/mtd/devices/spear_smi.c     |  6 ++----
 drivers/mtd/maps/physmap-core.c     |  6 +-----
 drivers/mtd/maps/pxa2xx-flash.c     |  6 +-----
 drivers/mtd/mtdcore.c               | 10 ++--------
 drivers/mtd/nand/ecc-mtk.c          |  8 ++------
 drivers/mtd/nand/raw/fsmc_nand.c    |  6 ++----
 drivers/mtd/nand/raw/hisi504_nand.c |  7 +++----
 drivers/mtd/nand/raw/mtk_nand.c     |  8 ++------
 drivers/mtd/nand/raw/omap_elm.c     |  6 ++----
 drivers/mtd/nand/raw/r852.c         |  6 ++----
 drivers/mtd/nand/raw/txx9ndfmc.c    |  6 +-----
 drivers/mtd/nand/raw/vf610_nfc.c    |  6 ++----
 12 files changed, 22 insertions(+), 59 deletions(-)

Cc: Stefan Agner <stefan@agner.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Maxim Levitsky <maximlevitsky@gmail.com>

-- 
2.47.3

