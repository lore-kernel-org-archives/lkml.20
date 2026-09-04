Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DE51991C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542386; cv=none; b=ccN3iflyPLE4hu7PhBFapIwWOon9j35zzmfbWO/x1RmfvQLNox/dUch5bImPmJ8JSCvtXupPmYgSDgGzEDGp7Y9/HnhuLB3H9Xsa9QlcMm8rklAgh39KZVEdTczv7r3HJ3Uf+9wkHbveziVL+TVa3z9W+QhVoLh+yPtW5g8vjZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542386; c=relaxed/simple;
	bh=M7IpITHLaiYEX5JHtixPIOy7b9EAWPxn0vNvl86IDHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IK6+xmieUQQgkRj1zR/D4pKlmKW2RydS0Sxo+2GXo7/26Rx1zJiyOn5FfFzD/zVhPpMXplNyn9AQe1hr65JxYBktYVZX/wKe2NLJsHuRViEc1kGLfvyADguuDYubchMgrZCtnPyANw8iO1q8bCXx4AEC4vuXF4w21RSLG6GYSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VLbVHgbd; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VLbVHgbd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 347571A19AF;
	Fri,  4 Sep 2026 17:19:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 091E96057F;
	Fri,  4 Sep 2026 17:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9551C11C787BD;
	Fri,  4 Sep 2026 19:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YCbqryqPilq7zrBCqHsiQdVIqNIwzQLaF8NcPcUj1tk=;
	b=VLbVHgbdLOgcC7ckvf/M7u/ecQccnFGV8Wn5LbJpX2g7rc3sKkqnms4sTSUrMnCKxYJERs
	4jaOspxudBd8e6mZvbLdVMXWhbGUZMMxnBtW3/A3pKwMVIdvNBVuKffq9wtMq4I1vyWI+R
	70pOV9d7zwE4HS3DUNuo2wRUxS5ZK3/zj56oiXDZ+zhcBpDNfBQgoyYT1yCMo30CeShxYo
	JXlWHPeP0bJDLizGPj+9C0+UU/dYepSVtvVkdK85y3Yi4kslxEysjtA1tMhlVGhXsZwZIn
	1c/6zuCyCUkJxfpHWghI42Dur5CPFYCetmVSGNdVta8P0b3vlKW+c9DGfEkDjw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:11 +0200
Subject: [PATCH v6 18/26] mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill
 locking information
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-18-bdb282f42a47@bootlin.com>
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

The SFDP table does not advertize the locking capabilities of the
device, flag these capabilities.

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ sha256sum spi_test
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_read
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_test
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
$ flash_lock -l /dev/mtd0
$ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: locked
Return code: 1
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_read
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_test
$ dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
$ sha256sum spi*
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_read
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_read2
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_test
0236e30ff05676c4bcc80b55aa0ebf4747630e0ae3360e025c9e0c2509402a6b  spi_test2
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff |   locked | 1024
$ flash_lock -u /dev/mtd0
$
$ size=$(cat /sys/class/mtd/mtd0/size)
$ nblocks=$(grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params | sed -e 's/.*
unlocked | //')
$
$ bs=$(($size / $nblocks))
$
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03fdffff | unlocked | 1022
 03fe0000-03ffffff |   locked | 2
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last one
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03feffff | unlocked | 1023
 03ff0000-03ffffff |   locked | 1
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $(($size - (2**7 * $bs))) $((2**7))
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-037fffff | unlocked | 896
 03800000-03ffffff |   locked | 128
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 2 # first two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-03ffffff | unlocked | 1022
$ flash_lock -u /dev/mtd0 $bs 1 # first one
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-03ffffff | unlocked | 1023
$ all_but_one=$((($size / $bs) - 1))
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-03ffffff |   locked | 1023
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-03ffffff |   locked | 1022
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03feffff |   locked | 1023
 03ff0000-03ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03fdffff |   locked | 1022
 03fe0000-03ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index a8b1fffe083c..17559bfbd465 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -234,6 +234,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q01JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x21),

-- 
2.54.0

