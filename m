Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F91514776
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542371; cv=none; b=QGeXIs1ioK4FUc0Tjpljqcqez3KSGWKk2qFsLyCYGa1lM38EH0/420tyMFSaTNHJMdmTgfjy4dgdR601kdnod8UpAmdvPuiSoeq1Ha0FXXvsnyv8FIJfwjV/VJ0JY+pXbECA9kMdyy25Fk6+lWJWd/WnaszLDOjeosG5jSzhS78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542371; c=relaxed/simple;
	bh=XbDmdcZkXtTE6EVDLGnnwBdIMcfawbxhQ53PAJVxhVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fN2CRMdYaqYCcS8uJVT2kI+qI/Bd2xo3kfb1eTZbFxrH0Cc6D46W1vfUDtZouNwysFQsCcgb50OofikMbWdjyZ8TktqHI7VwP3DGnglM++4oQh+WcQkl7e8c2VGfsuqlqd0A5NYExdYX59VXd0YY8T0TiSwAIjVaZHsWIJ0tSVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b9ZDdTGC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b9ZDdTGC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A24C4E41516;
	Fri,  4 Sep 2026 17:19:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18B406057F;
	Fri,  4 Sep 2026 17:19:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5340911C79BD3;
	Fri,  4 Sep 2026 19:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542367; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p+B8HG5wob0Ubn94ag6aB6Wy12VKO3+Q4akZR43R+tw=;
	b=b9ZDdTGCRy/K4Eh7kW61WkFcqfHYaQXEGM02/Ta+/5a1HTl+nyq60GChR/Qc6oxj+V5OaO
	H1nspBuDgFESLRExcBKHrF3988WlfclpJR1FTZ6Nx0TSiD4lMjfIictoxSydfOyBsDvnI3
	by5uFkUpzvd63C75AZlEdAGz6Uo9XTRMQWXN1ernBxbe32DxAMi9lja70nzAABjHsx7fbb
	m+BjyaRrkEZjsdSXysxu6GzphtpYbHPrOrrpMRvDnUYN9Dg/WM89/a2fG5OA87IcCgDULh
	GW5miM08MvMLQ5REUzI51xn74a86SHnbZ34aiA8UfyNXP/QlU48RwccSGLB8fw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:03 +0200
Subject: [PATCH v6 10/26] mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad
 page program capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-10-bdb282f42a47@bootlin.com>
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

The benefit is not massive @25MHz, yet this feature is not advertized
because these chips do not implement the 4BAIT table. Flag the quad page
program capability manually and earn a few % of write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 536 KiB/s
page write speed is 532 KiB/s
2 page write speed is 532 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 552 KiB/s
page write speed is 547 KiB/s
2 page write speed is 549 KiB/s

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
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_read
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 2b0ec584f38f..78a4254357e6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -217,7 +217,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q128_fixups,
 	}, {

-- 
2.54.0

