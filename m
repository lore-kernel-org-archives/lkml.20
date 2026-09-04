Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489D51C338
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542396; cv=none; b=iYsxIqyfNkxRUkgNZd3cKT1sPBUtAbQlBWf+c4ZivFo9WUVVRc997hyXfF1eQtnjL5tF49g1yhcYP+u99IDLysLsLQNXGlf0FSqgPwmuv2xaZUjtAVtCeLPjs0fl7bnqGRqfgmV5h7E722ahv5SitPn1P+vh4AtKJOPJGajaQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542396; c=relaxed/simple;
	bh=rT1nk2I17avyY73LG+fR2iBTPzu7Tz4SLzV5aM4Qt8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E8j8k8+lTnpbdvwFTx+EvMoyR+qx3+5mY8zZtzrtiVNcD117Inamm1Q6GydUAsLcL3DK0gI/hVVxwGHHa0q1NjrLxPm+wVqCsuXkOXIRJVDW7ykqVvMNbCNAzOTsZeo5F9XQLa9uTpBldfS79DvA1hs2w77neRhpbHrmCjRTigo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k5QHu8gx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k5QHu8gx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0D9E1A19B4;
	Fri,  4 Sep 2026 17:19:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E79E6057F;
	Fri,  4 Sep 2026 17:19:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA39211C79BD3;
	Fri,  4 Sep 2026 19:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dT18jH/OGxHmcOGPtiBSCEPc2hH1+FWlq3U/B8ZSN8I=;
	b=k5QHu8gxj+Mqr34r5SyplQv+WZELOPS8tWPtyJnVIr7Nkmw27nNpi0cVWFHQ6vbPDbFNnI
	UwPHREFxIJH43KQAxdzBw2vpDrLkrziFIhCbgck2414Wd2qeLQl6WzGwLh3IhQQnwFvIOm
	RUBei2MeBG0vcIHNG6fbF9/5sRemTVAqLSVu+Zs+Szt+A3QgZdP44lYkFzgFnASsr56Okm
	e2vJ2JigRaUN9Dd16vlWPbQ8O5Njw9rTf3hXXv1HLRz86dlij1QwkV9QH1zEarYbMIcCJ1
	SMYbTK2Fwuq9FwLEh6V0yBJX8BOnbfoN4Lfnq8Y412wnlfWdDHxERdCDJFjJ5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:16 +0200
Subject: [PATCH v6 23/26] mtd: spi-nor: winbond: W25Q02JV-M: Fill locking
 information
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-23-bdb282f42a47@bootlin.com>
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

The SFDP table is pretty complete except for the locking capabilities
which must be filled manually.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x10000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_read
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0fffffff | unlocked | 4096
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x10000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_read
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_read
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_read2
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_test
e61267bbd0864dfe7e67a8bfc0875a23308d98c7297fcf5a813830532f48c06f  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0fffffff |   locked | 4096
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=268435456
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=4096
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 268304384 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0ffdffff | unlocked | 4094
 0ffe0000-0fffffff |   locked | 2
+ flash_lockk uu /dev/mtd0 268304384 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0ffeffff | unlocked | 4095
 0fff0000-0fffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 260046848 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0f7fffff | unlocked | 3968
 0f800000-0fffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-0fffffff | unlocked | 4094
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-0fffffff | unlocked | 4095
+ all_but_one=4095
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 4095
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-0fffffff |   locked | 4095
+ flassh__llock u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-0fffffff |   locked | 4094
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 4095
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0ffeffff |   locked | 4095
 0fff0000-0fffffff | unlocked | 1
+ flash_lock -u /dev/mtd0 268304384 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0ffdffff |   locked | 4094
 0ffe0000-0fffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index e3c67db28c90..0c854c975eb6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -336,6 +336,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x71, 0x19),

-- 
2.54.0

