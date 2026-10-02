Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45067316905
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943698; cv=none; b=f3ngCico8abpQpMbR8+Qkf+EOoAD9eDEgy4AS0bdlXDnYliPuVmMpTAyGKoGeTVclhT0Q4L/mgbZB0mf6Wqb4aOBrIUUaTwEWC13+/N3z27aE/eR5bAJ2SgxmjTbOVyRfQZQ6lAJ5xvPrOTIWP6yn35VhmVqhw9CMGQ3dRdTomE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943698; c=relaxed/simple;
	bh=Ye/olaNfpFnKr4vSDib3UWBYOV/+WuPET0kyx9wl9K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DTDN4tIJF74rSaYpr+TCjIXjGPx9DIygQC9aK+QF2ObGReMA9E1H7PV5yEU+LnUguC+6JUzIYALfXUPoED/RUY9eHlp1tVeY36v/mOjrhCCb/kO6CegQLEuYAXjeB6eFDT9s3TvPQUMcxHB6uMKLqRva0lSjZrpOEOvBke+LJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T+wVkA72; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T+wVkA72"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 998A01A10E3;
	Fri,  2 Oct 2026 12:21:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DC06603DC;
	Fri,  2 Oct 2026 12:21:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FE59103281E6;
	Fri,  2 Oct 2026 14:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0yk1JOJZFoVMiBC15xlQjxajHbRrIJKa+K6axnf23aY=;
	b=T+wVkA72I5GbOceICvrba5oseecfJq+7FXlmLhT8jtKNCUiWMbTVA7fiaQyCPq6NYJ2tXH
	/PUg6TWy+RPBFCKx3G5LVf51XF0/ZPaX/9ufuHLDN68U/7+gHg2jBkDeXKUv8AHRCrWEyj
	LwRg5qVzFTdD2o7WrmkPqqoj5k89Nn5N7bHF6w4RxsRZnl9SCvWQQ/OL21U53hxr1PEUuP
	qs4aBkYjrWTkY5H68ogTobTh0rDZfWiUdYiHjqX254PuntNLnboi0esIO5QuBnCRDti+7S
	IdM2PBXi2iXjdFBkUMMctoaQGZ8s8suT9v6QPCKvCauVzzwao+bSKLuRoMC7wA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:14 +0200
Subject: [PATCH 01/15] mtd: spi-nor: Only switch to ODTR if the chip has a
 callback for it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-1-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Every manufacturer has its own way of entering ODTR mode. This is
typically implemented by the nor->params->set_octal_dtr()
callback. Without this callback the core cannot switch to ODTR. If it
actually does, the chip will stay in SDR mode and none of the subsequent
operations will succeed.

As of today, any chip not listed in any manufacturer/fixups table will
get parsed through SFDP and operated based on the best compromise the
core can find. A chip advertizing ODTR support in its SFDP content, will
therefore be operated in ODTR mode, leading to a 100% failure rate in
operating the chip out of the box.

Make sure ODTR page reads and page programs are not enabled for chips
without a ->set_octal_dtr() callback. If they support it, they will
anyway work in octal mode, but with an SDR bus interface.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

I faced this problem while operating a Winbond W35T01NW SPI NOR chip
which supports ODTR and properly advertizes it in its SFDP data. However
it was not expected that it would not be usable at all without a vendor
fixup. This commit allows to use all the features available through SFDP
without the IDs being listed. Basic SPI NOR tests then passed and speed
was obviously better than when constraining the I/O lines in DT:

Before:
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-8S
  opcode	0x7c
  mode cycles	0
  dummy cycles	8
 1S-8S-8S
  opcode	0xcc
  mode cycles	0
  dummy cycles	16
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	22

After:
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-8S
  opcode	0x7c
  mode cycles	0
  dummy cycles	8
 1S-8S-8S
  opcode	0xcc
  mode cycles	0
  dummy cycles	16

+ flash_speed /dev/mtd0 -dc10
not NAND flash, assume page size is 512 bytes.
scanning for bad eraseblocks
scanned 10 eraseblocks, 0 are bad
testing eraseblock write speed
eraseblock write speed is 802 KiB/s
testing eraseblock read speed
eraseblock read speed is 20000 KiB/s
testing page write speed
page write speed is 796 KiB/s
testing page read speed
page read speed is 9696 KiB/s
testing 2 page write speed
2 page write speed is 799 KiB/s
testing 2 page read speed
2 page read speed is 13333 KiB/s
Testing erase speed
erase speed is 445 KiB/s
---
 drivers/mtd/spi-nor/core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e2b6efafdd8d..9c61ff4b93c3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2991,15 +2991,21 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	if (!nor->params->set_octal_dtr)
-		return 0;
-
 	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
 	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
 		return 0;
 
-	if (!(nor->params->flags & SNOR_F_IO_MODE_EN_VOLATILE))
-		return 0;
+	if (enable &&
+	    (!nor->params->set_octal_dtr ||
+	     !(nor->params->flags & SNOR_F_IO_MODE_EN_VOLATILE))) {
+		struct spi_nor_hwcaps hwcaps = { .mask = SNOR_HWCAPS_ALL };
+
+		dev_err(nor->dev, "Cannot enter octal DTR mode\n");
+		hwcaps.mask &= ~(SNOR_HWCAPS_READ_8_8_8_DTR |
+				 SNOR_HWCAPS_PP_8_8_8_DTR);
+
+		return spi_nor_setup(nor, &hwcaps);
+	}
 
 	ret = nor->params->set_octal_dtr(nor, enable);
 	if (ret)

-- 
2.55.0

