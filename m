Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3BE314A60
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912845; cv=none; b=r2EIPXzZn2RVfWRLI+yMgx1WHIdgvGHSqtgeYLGvcgr3Hwf6v1FwCblVRFpASm1V4qKB1PL+OlDwWvmQ8iPpeXlX+ncdkP/TTlETW2cWMOXNrAuMujxJP5OnOdbVfomWE935PsJxbjs0zY6/9rO555qFWGU6VjtS1bIzvsmtI+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912845; c=relaxed/simple;
	bh=0x8ci7/kbx8ZK4Bc8+8K6rRHUSeRkoF8OqlVUMmDzCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H//sViuUYNMyuUoLGj2tRkHldpFobSUCeVfe2a8m5DNZdoUsoIgT6OfhqhNZGfP2eVTBb8vSKx55BFJ6SfTVz97ggIUEnW2dQWArmg+xihVkTqVKMMspGB4OXDPdyp0ngSjrz6tRPOx6JDPmBqMyf1BUdNQ3/1m9B/3ZHOs0QWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ULSpmnD7; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ULSpmnD7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5EC7B1A07C4;
	Sun, 20 Sep 2026 14:00:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D3416033F;
	Sun, 20 Sep 2026 14:00:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C35F81032906C;
	Sun, 20 Sep 2026 16:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912834; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pdnTDoTdkYsMkfPFjhQtytxCxnMytcCCGSTn7ukjBN4=;
	b=ULSpmnD7TwZz/g+xBW3mtupH0JfrJw57jKKmOU5hxMTCFzu00Ki07Ss7eqJGNGBgC/SRy0
	M3/4DqXIfx5+RGKYooIMBMRsbo8/qI05W031MWJfiJLFC1Kuuw7/DqTgR2pp2ve4SBhM/7
	Uu9KwLUxrK6slwe+DlEI9pVpcouwTvzIiU4XQchLXW2wQDhhbgzGQ6Ckt+Cq1S0pnhCg8q
	tzy87l4a5SdJgUA6eg4CZbHFcgXCUaHUZ1d9uZZ5SycgUWIRSR14qDb4JxgIqQjhJUWrcs
	pCYfvJHg+wbZll5tNhFTCw9UXGHKA1Bq4GOzI2AmnPtlVrph9j+aj//b+XJ4RQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:13 +0200
Subject: [PATCH v2 04/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking
 information
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-4-ab9c9688d071@bootlin.com>
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
Len: 0x800000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_read
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff | unlocked | 64
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x800000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_read
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_read
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_read2
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_test
896f1008afff470b95ada9696d79308125a86a6e72fe6f0106b1df93a874aca4  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff |   locked | 64
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=8388608
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=64
+ ss=131072
+ bps=2
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 8126464 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007bffff | unlocked | 62
 007c0000-007fffff |   locked | 2
+ flash_lock -u /dev/mtd0 8126464 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007dffff | unlocked | 63
 007e0000-007fffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff |   locked | 2
 00040000-007fffff | unlocked | 62
+ flash_lock -u /dev/mtd0 131072 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 1
 00020000-007fffff | unlocked | 63
+ all_but_one=126
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 131072 126
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 1
 00020000-007fffff |   locked | 63
+ flash_lock -u /dev/mtd0 131072 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff | unlocked | 2
 00040000-007fffff |   locked | 62
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 126
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007dffff |   locked | 63
 007e0000-007fffff | unlocked | 1
+ flash_lock -u /dev/mtd0 8126464 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007bffff |   locked | 62
 007c0000-007fffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fe541c6fd939..7097948e7dba 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -334,7 +334,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x17),
 		.name = "w25q64dw",
 		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q128FW-G/Q, W25Q128JW-Q/N */

-- 
2.54.0

