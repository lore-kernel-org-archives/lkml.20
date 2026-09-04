Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859D051474B;
	Fri,  4 Sep 2026 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545648; cv=none; b=I8OYy7u/VbU9ryk8yMeXeJxbypb36lh2HayNAhO0/0Q8VRDgpN8HmOjnybEMzDmXmYX1f061tBqS2pHca8Ok26iGskN1032LlQfIZKjysOTykQb6HcVsoBR/cwsC9YXujiEQpM4ESi2VXqCnCaiydjuZXjLSmYYCOwieD4tAzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545648; c=relaxed/simple;
	bh=4+rjf2O+nOuZbiMRnGaN8561D3nKZyJrulB160NKmTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XSrv3uQgDJDd8GL7mEkYbl7WENFRzQsTVKiZvKBGqgLX6vau4z9pxiG6CCPqPdlHFHy8IToa+J0SclCY84xmO0XQrr3DR8pdgLAKWGLQbJ5zt4RO+jFACpCEb6vEG63tce8f50xSbbbRQmd3pZT52qjlNgwAPLQyOjfNxU6o5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gR6ROCZI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gR6ROCZI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DDAC14E41521;
	Fri,  4 Sep 2026 18:14:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B10DF6057F;
	Fri,  4 Sep 2026 18:14:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1EBFC11C78158;
	Fri,  4 Sep 2026 20:13:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mky+QgCkcF4wW1IFBUfXutPfLyMAugM/GhiKs3ZGlBM=;
	b=gR6ROCZIIpXUC4MdUMvXx2zLkKQ4793B5ghILeVEffc2eW4AkJh26SDbiSVLykqa5xOsos
	giCBaZOC3Dr9mQ1s1hD2S86dA+9k1G8/Eaozt+AkkotpFOkfcBeIOUVFV+SdS9hSCHPj/z
	zegIAG3gH1mQswtFLVw6QOGY8Z4qR56NnkK5g7bJo52ZaByyBW8iKbytfX8XyEqiFyi3yo
	fYrXh1nEla8HxbEkdga7sY/Bz/BuJYZsvLxnk6uTjvqsc9IqwPZsu7Ls9pwcJrzDL/AA9F
	UitFG9mIyrxHzSXTL0+x5HAWO1fujEvVmswMhPO9j1P9a35hEW8xW0eL52EDrw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:12:53 +0200
Subject: [PATCH v5 16/25] mtd: spi-nor: winbond: Add support for
 W25Q02RV-Q/N
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-16-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
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

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef4022
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0101ff00080117800000ff84010102e00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f3ffffffff7f44eb086b083b42bbfeffffffffff
0000ffff44eb0c200f5210d800001602a60081e214dde9e378477a757a75
f7a4d55c39f66dffe970f9a50000000000002c0c0000000066ffffff0000
00000000000000000000ffffffffff0a00fe21ffdcff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
623c2663966d70cc6418f65db6c182a7d9146e15b190263f46ea81d9a934866c  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id		ef 40 22 00 00 00
size		256 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
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
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c7 (256 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-0fffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0fffffff | unlocked | 4096
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
[   14.840645] random: crng init done
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
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_read
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 268435456 (256M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

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
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_read
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_test
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
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_read
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_read
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_read2
c1c18ff55582ccab09e88cd6e6c14fe46c601c6461cb0012ac79949615f6c682  spi_test
28e04c28384aafd356a3e545ba79bf02e995cfb1e765ec663e35924c3f92b88d  spi_test2
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
+ flash_lock -u /dev/mtd0 268304384 1
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
+ flash_lock -u /dev/mtd0 65536 1
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
 drivers/mtd/spi-nor/winbond.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 4a6d4292fdb2..cd20622916b7 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -295,6 +295,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x40, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+	}, {
+		/* W25Q02RV-Q/N */
+		.id = SNOR_ID(0xef, 0x40, 0x22),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),
 		.name = "w25q20bw",
@@ -611,6 +616,8 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_partname_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x21), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x40, 0x22), .match = winbond_jv_match,
+	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x21), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,

-- 
2.54.0

