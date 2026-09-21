Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFC9386576
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973071; cv=none; b=WbzExGY35f947QYJYOl5G256U1BsGh0DkHIu9My1TztqliUMhQ/KfHqGK7uJ/4EJyPL1q6sWi5BHCp3I7ypnSf0dDDdTfKWihjX/aMYjwVA2o4saMdbUx6FDDNsN7jasnhJRVMSMdaGInj4AFz9YP0veETdVtGcdIDMEHIel1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973071; c=relaxed/simple;
	bh=uvUU3WVqNK6Sb/1CcBx4654/E7AUltpOTGV32kuoxL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jg/TY7+oVcdaDsjDJ48pEzstP0n2oaXA4tVSeZB+AHPTYgRMMlCqHnkSo/LV8GECSebN/iTPUybhwQgQjL5atefn8v8gnRAP9uI71YgJUQa9djRC33bWMyP6H4QjZuKtzzjtjFH0YNLQRIlQ9yry0lOMVF16anhTYhliG2Wh8do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gvyCrVMm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gvyCrVMm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 14D924E40C58;
	Mon, 21 Sep 2026 06:44:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD43F60339;
	Mon, 21 Sep 2026 06:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FF90103290E3;
	Mon, 21 Sep 2026 08:44:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5nDJiL0EATRkWh3IVdjmENchKkEql6m157AKNZC654g=;
	b=gvyCrVMm8n2aNxb5fqJ7fB6zph2I8jB006pGG4OM+10A+ceTM0he3mlJICtvzgkdzLXw51
	sOEYLSwjjO3i9k7abMNlFF+ejJx+fnsTS7JhRhN4DisjETXaN+HrRWwEVjk0hDXVSR4b46
	bq4kqf1lr1KYIf8lPUVqoC8cPmO0CxmFetfnJPO9y9V82LqittZkMYL9uEhX/MNW3uOI13
	nmMIqo05LaFvLmToRq7cXTrF7h3ap036u2UaYg1D1Teh6vy4/GWBGu2vH4xnBYp5WvyGao
	EUzM9cVhRXoNpW172WoPIkKJQA0xzVxFtFs0aieHewU49Hz/9VQ45r7iGWaWqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:56 +0200
Subject: [PATCH v3 25/25] mtd: spi-nor: winbond: Add support for W25Q25PW-M
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-25-38eef3b6a7db@bootlin.com>
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

There is an ID collision with chips of same density from the JW family
(which it self conflicted with yet another family). Chips are very
similar in practice, it is mostly a matter of electrical differences
(mostly power consumption being lower) as well as the addition of inline
ECC capability.

16 bytes chunks are protected against single errors. In case a
non-aligned write happens, ECC is locally disabled until the next erase.

Another significant difference is that PW chips identify themselves as
supporting the new SFDP (rev F) QER field which forces an alternate
write SR2 opcode (0x31).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef8019
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0101ff00080117800000ff84010102e00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff0f44eb086b083b42bbfeffffffffff
0000ffff44eb0c200f5210d80000142a010186e114c4e96376337a757a75
f7a4d55c39f66dffe970f9a50000000000002c0000000000f7f5ffff0f00
0000060d44bd27ed080dffffffffff8a00fe21ffdcff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
3361f4e84529b23aacc3cc1d41bcb36b2c3a0e42be019d71b586c952e03e6098  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-2S
  opcode	0x3c
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbc
  mode cycles	2
  dummy cycles	2
 1S-1S-4S
  opcode	0x6c
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 80 19 00 00 00
size		32.0 MiB
write size	16
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | ECC | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
 8D extension	repeat

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-01ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff | unlocked | 512
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
[    7.216017] random: crng init done
2+0 records in
2+0 records out
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
[    9.225266] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
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
[   12.783730] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_read
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
[   17.878349] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x2000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
[   22.062778] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_read
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff | unlocked | 512
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x2000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
[   23.733210] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_read
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
[   26.172756] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_read
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_read2
51acf03d440fea3017e99b0dfd9711173044c57be0e2699221e969b6c02a2133  spi_test
c17d6a0ddfc0f437e7729e42b91b5bd776f2eff4634a7f55c2e88e0774e43ab7  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff |   locked | 512
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=33554432
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=512
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 33423360 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01fdffff | unlocked | 510
 01fe0000-01ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 33423360 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01feffff | unlocked | 511
 01ff0000-01ffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 25165824 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-017fffff | unlocked | 384
 01800000-01ffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-01ffffff | unlocked | 510
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-01ffffff | unlocked | 511
+ all_but_one=511
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 511
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-01ffffff |   locked | 511
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-01ffffff |   locked | 510
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 511
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01feffff |   locked | 511
 01ff0000-01ffffff | unlocked | 1
+ flash_lock -u /dev/mtd0 33423360 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01fdffff |   locked | 510
 01fe0000-01ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 86e043cb20e4..51f6bcd3f8e5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -489,7 +489,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		/* W25Q256JW-M */
+		/* W25Q256JW-M, W25Q25PW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,

-- 
2.55.0

