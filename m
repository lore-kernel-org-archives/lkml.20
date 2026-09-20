Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857A644F54C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912870; cv=none; b=kTJhaX6Cj77WaSg2l4xPaOCbabM+HIMf0YDawlCSirfytST55LLz4qwbwzyAF4EZ/h7cPNpnIYbu54mUF8SGsVANXFzxWOrekHyXYuM32x7NQ4d5L87pLAlqEohSGSpnZs9WvLhFRDCuxIgihAH29zV1jxpMd4P67mxn7keBWTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912870; c=relaxed/simple;
	bh=xo2gVc1KcjT1Unypq7Ohf1M9IjFAYlPnniRq8iFBvlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHkUs3uClMMMz2CElitZO2+48Wi1y+7GnoZeaThQrolV65n8ubtRzUaAGi337ztNQwTijtEZv/ukN4z1bnw76dMkDO0SH8748CzEliCuKS49InHQr+FtBbUHKDA8lSTMzqD69O5ZTCKIolb3oDytDkqXGUoUYDCPkSgHTIluezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EhEMT0SN; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EhEMT0SN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 501C8C5CD44;
	Sun, 20 Sep 2026 14:01:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99A396033F;
	Sun, 20 Sep 2026 14:01:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBCB110329080;
	Sun, 20 Sep 2026 16:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912864; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MRC9qvTqZrpWIonRs8TglZmtXqsVP7f9eMt/Za9gR1o=;
	b=EhEMT0SNWs7NeaSqiYWM0WDevfoDaNSw6eht2UUjUs9S9Eu5FzDECUfWlSbkf46ETckJxD
	xGJ9NWet2y9AkG14HMH/Hzuusu+enlah4cCQn1Z/UuTLfxRIqPrR7xL8nP8YlmQre7H6CU
	6Uoa5BOiHxGSkbsEV5d/pBway7iK820YMcPxNUaPG/B9MhOwkBN5Fju1dWBX3AZdjvZpGE
	ffb7hQlGMEm4j/eM0rrahGYn0SbTUqow2WJWvXekOUH4wepOXl4UXHO47AguTOYktpWXml
	Xfn3X6UDy2Wk0K7RPJ5k6mcEiikH6K6cBM0ngvX+cvcfA5HCRuPyublyjtnidQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:22 +0200
Subject: [PATCH v2 13/25] mtd: spi-nor: winbond: W25Q32JW-M: Add quad page
 program capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-13-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The benefit is not massive @25MHz, yet it is a supported feature
of the chip which is already handled by a flag, so let's enable it and
earn a few % of write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 416 KiB/s
page write speed is 413 KiB/s
2 page write speed is 415 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 424 KiB/s
page write speed is 421 KiB/s
2 page write speed is 423 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x03
  mode cycles	0
  dummy cycles	0
 1S-1S-2S
  opcode	0x3b
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbb
  mode cycles	2
  dummy cycles	2
 1S-1S-4S
  opcode	0x6b
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	0

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02
 1S-1S-4S
  opcode	0x32
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 80 16 00 00 00
size		4.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xeb
  dummy cycles	6
 erase		0xd8
 program	0x32
 8D extension	none

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-003fffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff | unlocked | 64
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
d5d5966e19c29fcd8007cf50d715943db3d8468d3f93a71a43d2c026c1cbfb00  spi_read
d5d5966e19c29fcd8007cf50d715943db3d8468d3f93a71a43d2c026c1cbfb00  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
d5d5966e19c29fcd8007cf50d715943db3d8468d3f93a71a43d2c026c1cbfb00  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index a4ac11785d25..98a1e063e7fe 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -420,7 +420,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x16),
 		.name = "w25q32jwm",
 		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {

-- 
2.54.0

