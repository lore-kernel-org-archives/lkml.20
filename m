Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170DC57C702
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967571; cv=none; b=RgLi6N04NCgRcR771RjDQBCJTzxWtI9mFuENidXmo1OIWpZpmsqNX5TnWi9m6UuL0uecDiBvvIYHBzoGRcBNJDVc7ZTexvsMmZBHw8LxIAzA6pcuEhDw9kiU4RlNI43yjDB+dw1tbC8EZcH3j3h1Q2p80lgLf08FiW59BgEsEWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967571; c=relaxed/simple;
	bh=dQ2AD4ugK7G4sG7SCyCVGD2ZZGE622riUDYCaUyVIIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozLbXIgHt05xRVoQB1ql7rNKJgnDnb6HMkvWKjCp4kfNJijS5E/1XAJ+/10jsTWHT27MlqaPf1JNsN/jyu2soy2Aa+3AFpFNLK3bQET6KvEk0UFPP0Xu4fo6XRtidQlcgdsstEBb32WQEHAXKfGGDEe9MQb93WfUvTq2Wth+Y7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XyIQyhlu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XyIQyhlu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B8B91A1A7C;
	Wed,  9 Sep 2026 15:26:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FC8260448;
	Wed,  9 Sep 2026 15:26:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B42D911C7AF94;
	Wed,  9 Sep 2026 17:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967563; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LEJMNiRxJlfqQunueEkwosv/x9ys3Lz4flU3y4ULSpc=;
	b=XyIQyhlufnEEYHLbpx0kft9hL5kQTvmaeJTkkMiwH8acPQHhU6KHw6qoxD5q5DOdwlWfVI
	Dlb3uEJsXFTw/EpSxt2zpGoS0qbl+WEpVAw2zyhymLaDGm5zqZPcRWCweAN/JxN6ELlyQM
	NbTx2965dKwHa1Mg9fTd46phDxwp5pupsZhmu0ZTWAlFHtox2bydgqh1celbFUmxAVFEzb
	FXe59v07dvhH1WQ8R7mDm+g6pNCQqOUbQW78xDMjiL3QyKSUuJN5XMmmQaIeWA/5n46wJf
	M0NZt52EffE8TtSI9jUWRsxqLMDvDtmhya9FoQayPkEeH6XJK+1D2FIFFDpR/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 09 Sep 2026 17:25:39 +0200
Subject: [PATCH 08/25] mtd: spi-nor: winbond: W25Q128JW-M: Fill locking
 information
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-8-c1b20c39dd1f@bootlin.com>
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x1000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
96949af8654a85b6455db627c5154773954ab295742038c1bc95cbe29aa4bcb5  spi_read
96949af8654a85b6455db627c5154773954ab295742038c1bc95cbe29aa4bcb5  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff | unlocked | 64
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x1000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
96949af8654a85b6455db627c5154773954ab295742038c1bc95cbe29aa4bcb5  spi_read
96949af8654a85b6455db627c5154773954ab295742038c1bc95cbe29aa4bcb5  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
96949af8654a85b6455db627c5154773954ab295742038c1bc95cbe29aa4bcb5  spi_read
96949af8654a85b6455db627c5154773954ab295742038c1bc95cbe29aa4bcb5  spi_read2
96949af8654a85b6455db627c5154773954ab295742038c1bc95cbe29aa4bcb5  spi_test
ed7b778dfbd16c83772901462340558886b5adecd7d61b176996325ae4e4de9f  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff |   locked | 64
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=16777216
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=64
+ ss=262144
+ bps=4
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 16252928 8
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00f7ffff | unlocked | 62
 00f80000-00ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 16252928 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00fbffff | unlocked | 63
 00fc0000-00ffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 8
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0007ffff |   locked | 2
 00080000-00ffffff | unlocked | 62
+ flash_lock -u /dev/mtd0 262144 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff |   locked | 1
 00040000-00ffffff | unlocked | 63
+ all_but_one=252
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 262144 252
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff | unlocked | 1
 00040000-00ffffff |   locked | 63
+ flash_lock -u /dev/mtd0 262144 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0007ffff | unlocked | 2
 00080000-00ffffff |   locked | 62
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 252
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00fbffff |   locked | 63
 00fc0000-00ffffff | unlocked | 1
+ flash_lock -u /dev/mtd0 16252928 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00f7ffff |   locked | 62
 00f80000-00ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index d0da8f29fe5f..4ffc7a39ac6d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -434,7 +434,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x18),
 		.name = "w25q128jwm",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q256JW-M */

-- 
2.54.0

