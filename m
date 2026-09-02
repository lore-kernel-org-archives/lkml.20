Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552E4AFE26;
	Wed,  2 Sep 2026 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368433; cv=none; b=rHnJMr6olWyujCPsTwLXBWecBP4LIiKAkFP/NDHouRZkEU+YVHS2JdVoLKG0IdjZOgHn02NpVviHn3NvcUnFxqk1xwI4Dm3rRdOSxgd9pHLadC4ViMi9GAHUIUCeMqBC7Z9ExHSNE5WMU0q1lDzKoIv3Pdslc0HhM+v0hxRQDdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368433; c=relaxed/simple;
	bh=S/0WSfkdcU6ezGk2/5S8ezXhq7SM4nfHbJvanxdVTxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nb4yE742Ed5QU7jPG5J+SufXghwkYrdMG2rsBtZupTVwPQCqch5aguyGPd4NS+LmPZZI7cCwWOs6mc+FUtW/KVqWf+fIU4H3eGw/+eXpWozuQT3NQa7uePT5rDQGIog5wVe2S2X8+bqi55EcoVAIrcCJx9lfuvRMuzbzFZkHjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TZ4zAU9x; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TZ4zAU9x"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A218E1A1976;
	Wed,  2 Sep 2026 17:00:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FB3F6053C;
	Wed,  2 Sep 2026 17:00:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F4D711C79FAF;
	Wed,  2 Sep 2026 19:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pzX6nFA2wcrYKsG+4CqUFw+zxIGXPqyB6hIubZ3XSqA=;
	b=TZ4zAU9xK6fOjIAGPMYf6UQOgLA4Th/o0Qhr89khnKLmjvu6ayYV4wVKeNwpZ2tO76qwDx
	7VF4DPAUWsWDOA8G9FvUbbRHzGI1/vcih46pLQp03g/4wDyy4b1l7Xg8PiND/ZHo4Lkvif
	xCONjSSl8EtAkzB97OEfkDufeidFgvEitc9pdJaFiRT6hnBfmiQ7ighfSyBwY2xjWUZpyv
	Ppia164IIcfahEIW/OrfqXyLB5p1OhGaHTccEvSoGHvQbTfy/8+QOO6au2Paw0KX6+Rpob
	ojGR7LmSSjxv9MOimu5n5dz57Yl2ftOASoL6PnBKVdUE33p8r2D6w9sZlsw/VQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:26 +0200
Subject: [PATCH v4 12/25] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-12-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There is an ID collision with the chip of same density from the JV
family. Both chips are very similar in practice, it is mostly a matter
of electrical differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
the new SFDP (rev F) field which forces an alternate write SR2
opcode (0x31).

This density wronly advertizes its size and requires a fixup for
that.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef4018
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0100ff00080117800000ffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0344eb086b083b42bbfeffffffffff
0000ffff44eb0c200f5210d80000142a010186e114c1e96376337a757a75
f7a2d55c39f66dffe930f880000000000000ac0000000000f7f5ffff0f00
0000060d44bd27ed080d
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
94b52d6e903a2046e144eab0760384b6932c6fdbfec17eb7336f1778c3898daf  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02
 1S-1S-4S
  opcode	0x32
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 40 18 00 00 00
size		16.0 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xeb
  dummy cycles	6
 erase		0xd8
 program	0x32
 SR1 read	0x05
 SR2 read	0x35
 SR1 write	0x01
 SR2 write	0x31
 QE		SR2 bit 1
 8D extension	repeat

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-007fffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff | unlocked | 64
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
[   15.791564] random: crng init done
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
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_read
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 8388608 (8M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

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
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_read
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_test
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
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_read
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_read
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_read2
b3260b68e0373cd253fc558fa9a5c89009d3edb2393f4110702318f69a6d74c2  spi_test
884cedd0494868db17c609edc62e2471ef344025e30cd511fa28b41b9b50e50d  spi_test2
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
 drivers/mtd/spi-nor/winbond.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 1864ad27e5e3..1ddc2ea1ad9c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -43,6 +43,20 @@ static bool is_w25qxxrv(const struct spi_nor *nor)
 	return sfdp_h->minor >= SFDP_JESD216F_MINOR;
 }
 
+static bool is_zd25q128c(const struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header)
+{
+	/*
+	 * Zetta ZD25Q128C is a clone of the Winbond device. But the encoded
+	 * size is really wrong. It seems that they confused Mbit with MiB.
+	 * Thus the flash is discovered as a 2MiB device.
+	 */
+	return bfpt_header->major == SFDP_JESD216_MAJOR &&
+	       bfpt_header->minor == SFDP_JESD216_MINOR &&
+	       nor->params->size == SZ_2M &&
+	       nor->params->erase_map.regions[0].size == SZ_2M;
+}
+
 /*
  * Since SFDP is populated after ->default_init(), the match functions using
  * nor->sfdp as discriminant cannot be used for this specific early fixup.
@@ -62,15 +76,7 @@ w25q128_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt)
 {
-	/*
-	 * Zetta ZD25Q128C is a clone of the Winbond device. But the encoded
-	 * size is really wrong. It seems that they confused Mbit with MiB.
-	 * Thus the flash is discovered as a 2MiB device.
-	 */
-	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
-	    bfpt_header->minor == SFDP_JESD216_MINOR &&
-	    nor->params->size == SZ_2M &&
-	    nor->params->erase_map.regions[0].size == SZ_2M) {
+	if (is_zd25q128c(nor, bfpt_header) || winbond_rv_match(nor)) {
 		nor->params->size = SZ_16M;
 		nor->params->erase_map.regions[0].size = SZ_16M;
 	}
@@ -261,7 +267,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q128JV-Q/N */
+		/* W25Q128JV-Q/N, W25Q12RV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x18),
 		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",

-- 
2.54.0

