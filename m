Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5F1517BBF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542374; cv=none; b=Mzt8Eo9yFb9TUDGl2dsoZuk5otIbNFFK/OdrHsL4IXMf/dpyl0gvRo6LOYIR1At6ScPUxwN+FmIGgkbTukD95Nc4dZLD3Bxh7sXX2NDioCp4CNOXtXWgCF2mH2VRjYftEZtx8xB2PsQjNDh2fKD2mKshk3OYijk9fePCsq0n9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542374; c=relaxed/simple;
	bh=Ns94b6Odq6/WDR5WYn4vLqx/m5PXORA39WlQ/lb2fOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqtF8ByPN8qXogLurqStGjnMq4ba3x2q0NWf6LWi6qr574p3BA0JAXInemLwyak1bJLQLhQ/ekguykFP5GOqQR1uPEe8ZMQLBFyPeAYvWe70NDrgR/ZwnLq1aMB15YfyplUHW0nkOae6JJ7uEIRPOlzcl8rWIUEUZXYA2/Uc/F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g44qHaVY; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g44qHaVY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 31E321A199B;
	Fri,  4 Sep 2026 17:19:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 062776057F;
	Fri,  4 Sep 2026 17:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F30BA11C7A0C2;
	Fri,  4 Sep 2026 19:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lKRhbRJg+gr+AbEi6Q5TLmP9Z6+0vw/SP2ZGFlS+B0E=;
	b=g44qHaVYaH1l3TjR5BTcEaeggGjqzCY1usOOsqSyIQjvu0dYFwJJrej1+7XXH1trbrTDe1
	Dz/Z9GlJp/5uLsldkHVE1sPhXPtS73HI/AfnpgBZq4XCj/cRPraWLyvP+TQBh8nY1xsrwT
	6j+MGXaaJLcwV6XW1pEDHAOzsl5/c1z6WS+3PSBq8dXj49MpYnOtjtSO6JI5iKXvi6dUGo
	sOFw88PXbUjHCf2w2r1BUaeBGjerpA6pQ5oU9mS6TXBNcQcaj8acuElbnGA+RCkSehI79+
	L793kMBy/4YQFsUnzH4tij/WGZLeH6wd7Yl2O9kB9tU59QbTFJRIddNbCq2gPA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:05 +0200
Subject: [PATCH v6 12/26] mtd: spi-nor: winbond: W25Q64JV-M: Add quad page
 program capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-12-bdb282f42a47@bootlin.com>
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

The benefit is massive @25MHz, but the chip does not implement the 4BAIT
table to advertize this capability, so enable it manually:.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 558 KiB/s
page write speed is 553 KiB/s
2 page write speed is 555 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 3047 KiB/s
page write speed is 2909 KiB/s
2 page write speed is 2976 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 70 17 00 00 00
size		8.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET | NO_WP

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
 c7 (8.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-007fffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff | unlocked | 64
$ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
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

$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
$ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
d79c3f7b40646d437eff15309c5250e8ee203f805b9d13d8ad8a7019f0dd69f8  spi_read
d79c3f7b40646d437eff15309c5250e8ee203f805b9d13d8ad8a7019f0dd69f8  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
d79c3f7b40646d437eff15309c5250e8ee203f805b9d13d8ad8a7019f0dd69f8  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 484a2d87a4b3..48b0bb643b15 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -314,8 +314,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x17),
 		.name = "w25q64jvm",
 		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q128JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x18),

-- 
2.54.0

