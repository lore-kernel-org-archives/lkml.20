Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01D511225
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542370; cv=none; b=ZBbJW+YX/9K2c3eWLNglQUb8lzEzQc5Z38piDbx0q+UjKUhor5oHd7JjeNdxHvUN6bjUiBE9z1UJdoQZgXx8uSgh+WEOKuw6wY0vgqjPlMeObXs63puuSieep3noaHQyAX/GXbR89/3SZQANzdU9FvAl9H0Qz7d7SexJSwnQ7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542370; c=relaxed/simple;
	bh=h+XhkALS8N7M92sKu5teq4wArU2519mSYSKr3CLUklg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvGlmxChNoV8gshcHc3QIla5yGep3SNFrX7oaEaOt4ugCpchPZpQEA/+2TISRZ9pKvJlv47wPoBtymIJ3GohthJuTQwWr8iKxjQm1L4e00i26QYlGfU/wh6J4s6sNXgDxWTpGN77X5uReCDFADjfbNSHoGFhuyxRHnuk19aepAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AB5vaWEQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AB5vaWEQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD5634E41514;
	Fri,  4 Sep 2026 17:19:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2E5C6057F;
	Fri,  4 Sep 2026 17:19:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E732011C79BC4;
	Fri,  4 Sep 2026 19:19:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ScarNZFjf04mjpXGnoVm2aIVA6Lt716SedQDjdlo7TM=;
	b=AB5vaWEQwzazxWNsrlfjgDgmpj9IbIWiFn/ojX7FVNLwwdwfhOnEKsKCTm+cgWnrPz4g9h
	+V/nfWbECdT5aYdhpIuqS9TFO4IliNUWlSgfz37S5Kyt0W+yBHbyS7OvE8RGzwqCAGbNYx
	/n3BRbxcN5UwayawP0YYleur4c2RO+sfaakXKWpnz8r2ofszwzvXd8OwMZCc6KrXREuOkR
	VXkGFWxSC1z6v3e93DVfDMr4twZjc1b9NZfCdrMWzhjLJuIS38SaAJJwf/DAgHk/+2ifo8
	nYuI771QqNAiFF4DX86NhnApv6gqTVU0IDFq1cH04d01UHWM5OLtsTTX9M8ltg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:02 +0200
Subject: [PATCH v6 09/26] mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad
 page program capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-9-bdb282f42a47@bootlin.com>
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

The benefit is not massive @25MHz, yet it is a supported feature
of the chip which is already handled by a flag, so let's enable it and
earn that little 1% write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 539 KiB/s
page write speed is 535 KiB/s
2 page write speed is 536 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 556 KiB/s
page write speed is 549 KiB/s
2 page write speed is 552 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 40 17 00 00 00
size		8.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_16BIT_SR | SOFT_RESET | NO_WP

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
$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug erase /dev/mtd0 0 2097152
mtd_debug read /dev/mtd0 0 2097152 spi_readErased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
$ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_read
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 0d7f74fa7cd9..2b0ec584f38f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -210,6 +210,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		/* W25Q128JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x18),

-- 
2.54.0

