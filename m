Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134EB5111A8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542378; cv=none; b=MK1aSVpV9peE3ShqSuMp029bUOQWDXEIUEvx018v1xlqm9Xc9DebX0f0+dcPIiscxpDWV4zwMp6L8T6j4JpdmF9Gxn75b4rp1Bas3Oj+Heiljg84LKTEmqRJiGUcxg1b3zE2tEo6lGHDiIpYoKNOk5/g8aQ4jaV4OrxM5WjHh4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542378; c=relaxed/simple;
	bh=/gO6NnpFLxhKTwEc3KGoneh3Y5IZQQXo4DecxaBcMmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9mzlW02O6ieJUVYOzpn1mrxEBkM7WRiH1Fiisq+6LPEz9fV97Fax4mvLkfT5O9n6VyFIkeLERONxUqCPHflGmMqxF3JUf57sEAmlh37Dvl5zZO3cQ7Ka2uTBr/csnZLR9bBvoMYW+OUG7ocHoRoC6nlGL+L1sAfFHKSdkvfFvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iWCrbvE6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iWCrbvE6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 855C74E41515;
	Fri,  4 Sep 2026 17:19:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A29D6057F;
	Fri,  4 Sep 2026 17:19:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A20CD11C79FA6;
	Fri,  4 Sep 2026 19:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KED0MtUcl5GYT48RhBLaFd++nMWLmV85SA49tSVm5h8=;
	b=iWCrbvE6xF0i20BkjWd2ho6xaO6UvN3kXj7BF3jfaL+PmMDL3FrZBfhfUWzn667C3Tls0S
	GeRm0X03aHCpgDCHQF/aaxQlR/FLNf8oUiNRrrMzICwE0niXyXRX1E4KSRtp9f+XwZVaU7
	GZJFOlllxukneCk2XFOe4nOdgGsRbkIAqZ6L86lkdDUSo0u0CbPg5h3RosbfBLyI9dieoa
	iXC/mjUt9h/jcewd9HtZxYD916B+PVb/c3sDlWVvc7O9PerkMEne1E3sprRq0X4GvLoJzQ
	xXeELCUDYyj39CugpPROmfp4tJ8Byk4Wdvt6img4ewv5qEO5CZHUA7HB56B20A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:06 +0200
Subject: [PATCH v6 13/26] mtd: spi-nor: winbond: W25Q128JV-M: Add quad page
 program capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-13-bdb282f42a47@bootlin.com>
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs, add the flag manually:

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 553 KiB/s
page write speed is 548 KiB/s
2 page write speed is 550 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 1628 KiB/s
page write speed is 1600 KiB/s
2 page write speed is 1612 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 48b0bb643b15..f8f103296c82 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -321,8 +321,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.name = "w25q128jv",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),

-- 
2.54.0

