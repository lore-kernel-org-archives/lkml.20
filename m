Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5C373BF1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973028; cv=none; b=E9Rrwr4h9F9TSKtgvlydixuQNDEXTYPt/W/MQtkpCJekHLYJACxhdiQuEuCD+5n0H/+nDO9tHJeho8ldNV1LDN2DW9IvA7oh5eUNLy/bilPmYE6G0lF8SQXO9Q/ohKfcwCx58ISxFfFioO9r05gUPa7xShKqFHyue7GHwNSUKAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973028; c=relaxed/simple;
	bh=WAHX2GBC9Tl4uiXn/PB68SewyOP/Yv4d+eFtpTkTkQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDWBevYmKfcbBSX7seHEYhvrGfSKj+WWlAN3Ica2JItbMPvH1JgbpLNJDFYURPZ9/gXrZmev3QQu8sTyo+TZg7qqMLqfzt3VyVlTEuq2dwqagG9lH5RlLR5r5DMfFFyWphqEZJtvPLusHf0DrePbbKgFDjdMSx+qFfiruyZWECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WXWMOWkk; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WXWMOWkk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3F0CCC79AB4;
	Mon, 21 Sep 2026 06:44:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DCD560339;
	Mon, 21 Sep 2026 06:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5ACB103290D2;
	Mon, 21 Sep 2026 08:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G3CXY5sXzErm4ETVA9DK40FALkkAZZmu/Y00Q190h1k=;
	b=WXWMOWkkfA09msAId432nB1RlE/fH054n+heLfeMmztBuepzKmeub4uIZVsIuJGwFfsvqJ
	TJgSYj150qTQ6vorPPMuibgMEnfLGKeezztp6deGIbq7kgDYIUEJnkKL6ME1kyvA7iBbyz
	mHbfQO5vnDC93VsoY6Na95gT8Ymn6lu/socnkOe81Yec1D+Lns9KjKQ0pHQNi6jilh0Ptn
	O3+7cWXv6r7ul8Ig3ngB+edK1I4AU+jF1ZKqlRkx+6zBlAYPAe4xMXGVbdHuAO7Zwkl4m7
	WFxPRAOPiBDbF+Dl1G60cT2WzytTF0THgQ5PzgwB/CXLnGvEG6dfWQXDeDxMtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:34 +0200
Subject: [PATCH v3 03/25] mtd: spi-nor: winbond: W25Q32xW-Q/N: Fill locking
 information
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-3-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The SFDP table does not advertize the locking capabilities of the
device, flag the missing capabilities.

This feature is identical across the various datasheets exposing the
same ID, however I could only test it on the JW-Q variant.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
5a6402283d548e191d2a6189a536a4878bda9e6191556aae9abf21063170f189  spi_read
5a6402283d548e191d2a6189a536a4878bda9e6191556aae9abf21063170f189  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff | unlocked | 64
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
5a6402283d548e191d2a6189a536a4878bda9e6191556aae9abf21063170f189  spi_read
5a6402283d548e191d2a6189a536a4878bda9e6191556aae9abf21063170f189  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
5a6402283d548e191d2a6189a536a4878bda9e6191556aae9abf21063170f189  spi_read
5a6402283d548e191d2a6189a536a4878bda9e6191556aae9abf21063170f189  spi_read2
5a6402283d548e191d2a6189a536a4878bda9e6191556aae9abf21063170f189  spi_test
c9029efcf9476adb19a5b2cf7ddb26dcce2bd5210be7dea90c4134e0a8cd6f9e  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff |   locked | 64
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=4194304
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=64
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 4063232 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff | unlocked | 62
 003e0000-003fffff |   locked | 2
+ flash_lock -u /dev/mtd0 4063232 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff | unlocked | 63
 003f0000-003fffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-003fffff | unlocked | 62
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-003fffff | unlocked | 63
+ all_but_one=63
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 63
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-003fffff |   locked | 63
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-003fffff |   locked | 62
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 63
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff |   locked | 63
 003f0000-003fffff | unlocked | 1
+ flash_lock -u /dev/mtd0 4063232 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff |   locked | 62
 003e0000-003fffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 5ce29987a13c..fe541c6fd939 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -326,7 +326,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x16),
 		.name = "w25q32dw",
 		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {

-- 
2.55.0

