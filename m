Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C7E471273
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542366; cv=none; b=Y74ATeSmjE4NPpsMBnOlBcFCyECUOAf8U/0zP9lisuSKzpPGCAyZxpcXrDabdeXWVAh6p3S77tfxiDmwBe56itlV9pjkzNQBpQdP74w2mguHVanI0rg+HexvDyZTscfvlN7ld3+Vs14p/2u9qgSX+I1m7Rqjr71hnbff1PZYtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542366; c=relaxed/simple;
	bh=IcfJ2mtUnpG3xSaLW9GzzGyYn3ba0fOERFwQ31pGyOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv9r1ekOlYlTA97eXW/hXWUcsGMyETe3y5JDuwzaAMmxGYgj885WUAlTRaL49dlAyQ8WQHHBM0iaVNw4sJBHy1g+o9VreYUPaz8ZtRLIOnZNH6PiDVcoYkp/c2AYlmcs5o2demui3ExM80ZGuRyqPZrLMN8btvi1raCZ/QjJ6hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oO6wqG+O; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oO6wqG+O"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 986424E41514;
	Fri,  4 Sep 2026 17:19:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66C8A6057F;
	Fri,  4 Sep 2026 17:19:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B20BF11C79AE2;
	Fri,  4 Sep 2026 19:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542361; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=50UwMA2XWptlL2jHfcWAHUQHf2r0cSy636rR4blSvw0=;
	b=oO6wqG+OcSPgSlIYjUal1la23IKqsEZYxTbnTSmjIE991+T0LE7m0Cw5xNxgpqalL3V3OC
	nilctXWOlzGXXHw/N5tgy4VSYoz9geHXncTdGQnc+vSm9AaHsli4DNHmJACSPI/hFtYamu
	UG+C2DxXVhe7laftuuhlGh/zmGR4RjvNdGK6mbRcatNrvRsXwk8nvP+iJumhp1Q1RT2r3X
	Ajao3L0E2QH3YFSGsQhL0EhNrAp7jGVMHKo+6rlCzKoX9nHfiq50gCo6ycv4HwBm0nCvz0
	OV3LWjKB4GrF3GDwZx1MoTdUz+boP8L6oJxMrD0AoKyTP10dxw1GuJ2O6U5Otw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:59 +0200
Subject: [PATCH v6 06/26] mtd: spi-nor: winbond: Properly document the chip
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-6-bdb282f42a47@bootlin.com>
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

While the .name entry is a legacy field, is highly imprecise, and even
wrong sometimes due to ID reuse, it is part of the sysfs ABI, we cannot
remove it for existing chips. However, we can double the entry with the
now usual comment with the newly instated naming scheme to indicate what
chips are covered by each entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
I've been focusing on several chip families, but not all of them. I do
not have enough information about the oldest chips at the moment to
cleanup *all* IDs, but I am nevertheless trying to make a major cleaning
step here.
---
 drivers/mtd/spi-nor/winbond.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ace9e620bfa6..1fd05a3f743d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -218,16 +218,19 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q32JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x16),
 		.name = "w25q32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
 		.name = "w25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x18),
 		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",
@@ -236,18 +239,20 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q128_fixups,
 	}, {
+		/* W25Q256JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
 		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q256_fixups,
 	}, {
+		/* W25Q512JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x20),
 		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		/* W25Q01JV */
+		/* W25Q01JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x21),
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
@@ -285,52 +290,60 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128FW-G/Q, W25Q128JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x18),
 		.name = "w25q128fw",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x19),
 		.name = "w25q256jw",
 		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q512NW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x20),
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NW-Q */
+		/* W25Q01NW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_rdcr_fixup,
 	}, {
+		/* W25Q16JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x15),
 		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
 		.name = "w25q32jv",
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),
 		.name = "w25q64jvm",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q128JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.name = "w25q128jv",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
 	}, {
@@ -343,6 +356,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x16),
 		.name = "w25q32jwm",
 		.size = SZ_4M,
@@ -350,24 +364,28 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
+		/* W25Q64JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x17),
 		.name = "w25q64jwm",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x18),
 		.name = "w25q128jwm",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q512NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),

-- 
2.54.0

