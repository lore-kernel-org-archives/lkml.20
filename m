Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9251356D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542397; cv=none; b=K68AY5lqfi+UcKUw/IDfJQvv7n6vjM5ux8JEm5nY+SBgDuLCYzMIrWQZar99ufXzFElx7XJJ7cN87IrDvkkoREL2E85r7Nl+qgjcyZZIi+nIx1+/hM3CtDAU6zpfT3y+A9UEZxoaXtvcND4HiiqV3I5XSn+Jiy0XOZyP+6gtagc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542397; c=relaxed/simple;
	bh=SGfrdHxRqArStv2rvRX5yUn6uyvaEQiGw7LJsWxgkcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mK/ScdfV1D27lTnJFmoczA9s5JVBCZb9/Z1LrP6TtQjNz1tZi1pNU24raNx69FeWe/nIh1+gehix0t5pl9o4do252ayIw8e9jcP9uj3kxroioQ3cTErGeVNVrz1U4MA29EAOK/+QvQ+n2WWcG/K6GgYbASSPmtG1H5DEq+G9iSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aL0O9QQz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aL0O9QQz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2183B1A19B2;
	Fri,  4 Sep 2026 17:19:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAB086057F;
	Fri,  4 Sep 2026 17:19:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44B7911C79C68;
	Fri,  4 Sep 2026 19:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Lq1oF6KvN3o6KyABQZtGHFyblhr1uPysODE9IBEw114=;
	b=aL0O9QQzZ7uNQ3HB2/MTRGXxBmPXVSLWEE76DHWrTksJ2dwlPaNm+LnXsKm1B9kFXzDQym
	1E9+nNJs64+o2niWX3Gy3HkvGTvNZJsvBD5SwPDXzdNAVg1ud76+qObFMydXrt9NENAOxR
	ZJfXKvuP4Wthf5Oly/t1QnHvgtLNHvGgDYHrsCoAhT2YKwjPEJUloPv6TEg/kmz2KP5xnn
	jSknlfRfsBYQVCFlzsLlWSZNxyJfJo5mQ2bJiBLbHytEQI6Y+0a2MF3aArsAHkTd76XV0H
	uf5mpXa1eFO3qjioTEco2rYdtRY0g9H+ReBcmAksJYRvX4FUD4s28PqBC2q/4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:17 +0200
Subject: [PATCH v6 24/26] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill
 locking information
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-24-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I do not have any W25Q256JV-Q/N/M nor any W25Q16JV-M chips in hand, but
all the other chips from this family have the same locking pattern, so
we can reasonably expect that these chips follow the exact same rules.

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 0c854c975eb6..90fe9617d784 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -226,7 +226,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.flags = SPI_NOR_QUAD_PP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &w25q256_fixups,
 	}, {
 		/* W25Q512JV-Q/N */
@@ -306,7 +307,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
@@ -332,7 +333,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
-		.flags = SPI_NOR_QUAD_PP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),

-- 
2.54.0

