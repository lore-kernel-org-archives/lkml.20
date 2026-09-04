Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BE2513563
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542368; cv=none; b=VVwaohX6dVOIc6G9dWYIuVG7+DZ3f4aCUSphPCX0V8AmDxb17tgG0tLyv8DvKnmBn5qDStiCOMeEmr9GmlMyAL4Vk0q9jfN/6gsX3GNaQ2uHBnWZrCAQ0QKvcWPdh+wKCp9R3+0+BEYFUrcCJ3EbKaJT2/uElD14JDLDrKAnz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542368; c=relaxed/simple;
	bh=O6sxQeqkcc5Hig7F6jlFzVznCcktRqCwKqs2m/ZrdHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JH6jYMJrXUkLNvjgMjAMq2xUtzXvlZSedDDkpj1DT09m0LqE46czIu/PTYe8ue0gB9DxWCASs5H7g8du6VPWob3/oIpAnqC55xTxJtwQjewV/GfTHo2e1JaWaQTXx/8ty78tcuDY++LC3n/HJWZSZ8Kqg4G06nzYCDXTftSdgoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HkYLXm8y; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HkYLXm8y"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 916BF4E41515;
	Fri,  4 Sep 2026 17:19:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65D726057F;
	Fri,  4 Sep 2026 17:19:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6634711C79B54;
	Fri,  4 Sep 2026 19:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h++eu2vjZqNONpuZ4tGo2gcJmY8zYQb+9a7394fOBxM=;
	b=HkYLXm8ylmq/xpxTFDEBH8339nWD3PV16P1KLxgb4M0RHSGpjyac7wHnw80LmqQ7WfWPqf
	+1EU0kxHHhJ4g7/OBXLgH3K8oC+qpt3Bf2lqoynCgY5Og2ngf4A/Wf1xCiJZj38QWanp16
	HBd+Z7W8mU5x7h0WYDyU2AqGFyWlfy4uNLVQBGWUEmeM0HdW0tSMhSQ7+vDIWy7wMCaHwt
	x+fJqnHv9bM2Qvfw+hwzokSjcoDXY+LN3BquRsiG2079EjWig8On/1DmpjYTJQU5qbzmXR
	GWwQHLAYoNHFMmakwbvGKeSUazfx5ZT4O2VWT5v1VkDFiSVxuiEiZEi88S/U+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:01 +0200
Subject: [PATCH v6 08/26] mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad
 page program capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-8-bdb282f42a47@bootlin.com>
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
$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 560 KiB/s
page write speed is 540 KiB/s
2 page write speed is 550 KiB/s

After:
eraseblock write speed is 578 KiB/s
page write speed is 557 KiB/s
2 page write speed is 567 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook is added to make sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
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
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
83e7d587bce3b2031c82939839cc1fbcf62b8939b35882d176f207b0722d0dba  spi_read
83e7d587bce3b2031c82939839cc1fbcf62b8939b35882d176f207b0722d0dba  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
83e7d587bce3b2031c82939839cc1fbcf62b8939b35882d176f207b0722d0dba  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index acd3c38ca2f4..0d7f74fa7cd9 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -203,6 +203,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
@@ -504,6 +505,22 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 	if (nor->id[1] > 0x30)
 		nor->params->flags &= ~SNOR_F_NO_READ_CR;
 
+	/*
+	 * Winbond has reused many IDs, up to four times at this
+	 * stage. In general, most of the chips with SFDP support are
+	 * correctly described by the ID table, but the non-SFDP chips,
+	 * however, are known to not feature as many capabilities. Make
+	 * sure we filter out those capabilities to keep backward
+	 * compatibility with these devices manufactured until ~2016.
+	 */
+	if (!nor->sfdp) {
+		struct spi_nor_flash_parameter *p = nor->params;
+
+		/* SPI_NOR_QUAD_PP was unsupported */
+		p->hwcaps.mask &= ~SNOR_HWCAPS_PP_1_1_4;
+		spi_nor_set_pp_settings(&p->page_programs[SNOR_CMD_PP_1_1_4], 0, 0);
+	}
+
 	return 0;
 }
 

-- 
2.54.0

