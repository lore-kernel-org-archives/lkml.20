Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225C838D686
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943723; cv=none; b=ZKnMBBZLkCPNpSpV844zug2D4JbB/ftHdHKcO5MyoselE7OuEOaNz4+oOrXuOjiSmMofzsOMT6GIgHqmq9+bhwXXxjK+rnmX0SB5+qiJtN7jp8W/rDNQJPAYmYQy8JVzuBLyVi8wFn8egKzeKNjtOkLOf4JEkDaADSxgNB3v0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943723; c=relaxed/simple;
	bh=VSm0z61HLPwCyRkfbL1gVrC6eZJ721ejX0ksJWtF7t4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsTbm9lExbjh0KGk4D7HlJu3chs/IxxA/7JsBzGiofbgqkS83utPumlga90K2f/R0OZ85pFtrkRlI0fopN5b+YPC0VJU+RoW6CVRXlOgCYn4Ii3B26/Et8YrmUrqB8Qcdz+5NpPQlRWJQaUvzrTsWMpwdMf1hjouumwZ2aDjEWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EPvSsySZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EPvSsySZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C12534E41110;
	Fri,  2 Oct 2026 12:21:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96D81603DC;
	Fri,  2 Oct 2026 12:21:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6975610328226;
	Fri,  2 Oct 2026 14:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vKr0WLdVeb/J8plYIr12nURhtOI2tu4K7NWOuJDWCQw=;
	b=EPvSsySZR1gzFOANoLQH84CatLGSxMSQR1UJPJXUHI/qb2qbKEe/HEgaGkPNu1G1lZY+95
	zzUlERF8r9ghrnqP11fwOENCUkRK2vthW3GoRzZ9Uil5U/pFKzkxMSTP/YT5T55+U6tiMc
	3MZu7nlBefEDg7rf1qFdMhQnouX5Mrr90QlW8dx58R7tUCRI6DGRo7xFQ88tmWaTqJ03i3
	FhUkrWXicZghcx9NFTsHJrBxKk37tyiGL7I0D89iFoSRvgB1pQTWuEAeerXYIqbxSYK3g/
	b5gms2uSlFATY/TZyv4pSvlQh9/bq6vjJsdF8OHEj8/yadlCUguixlSF69TQbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:26 +0200
Subject: [PATCH 13/15] mtd: spi-nor: winbond: Add support for W35T51NW-C/E
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-13-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

W35T devices are Winbond new octal DTR capable SPI-NORs.

16 bytes chunks are protected against single errors. In case a
non-aligned write happens, ECC is locally disabled until the next erase.

These chips may leverage lock CMP support, by using a Winbond specific
register instead of SR2 which is gone. This feature is therefore not
supported nor flagged.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Logs for W35T51NW-C:
********************

+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef5b1a
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0104ff00080117800000ff84010102e00000ff05010106e800
00ff8701011c000100ff0a000108700100ffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe5208affffffff1f0000000000000000eeffffffffff
0000ffff00000c200f5210d800003452b50082e31458e96376337a757a75
ffc3d55c008070ffe950f8a110cb088b0000ac0000000000ffffff860000
00000000000000000000ffffffff430ef0ff215cdcff000b0016b181b585
00d87b9d580b000030f6de9c10000000000000000000000000feffe300fe
ffe300058880060588a10070888400708885818501f0b1b501f0d8b8cefb
b02e2cd388a489aa00000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000081850310
b1b503100000000000000601000000000000b1050000e700000000000000
00000000000000000000
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
a290fdc72785300e3b6efb4964a0a41524707263735ec4a23009b97324aad7ce  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-8S
  opcode	0x7c
  mode cycles	0
  dummy cycles	8
 1S-8S-8S
  opcode	0xcc
  mode cycles	0
  dummy cycles	16
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	22

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 8D-8D-8D
  opcode	0x12
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 5b 1a 02 00 00
size		64.0 MiB
write size	16
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_SR_TB_BIT6 | HAS_4BIT_BP | IO_MODE_EN_VOLATILE | SOFT_RESET | ECC | NO_WP

opcodes
 read		0x0b
  dummy cycles	22
 erase		0xdc
 program	0x12
 SR1 read	0x05
 SR1 write	0x01
 8D extension	repeat

protocols
 read		8D-8D-8D
 write		8D-8D-8D
 register	8D-8D-8D

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-03ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
[   14.761055] random: crng init done
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
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read2
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
8ff4795e570cf12e4257adf7e9c761c516f0b1d5e1a2a2af68542add3025fc34  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff |   locked | 1024
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=67108864
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=1024
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 66977792 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03fdffff | unlocked | 1022
 03fe0000-03ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 66977792 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03feffff | unlocked | 1023
 03ff0000-03ffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 58720256 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-037fffff | unlocked | 896
 03800000-03ffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-03ffffff | unlocked | 1022
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-03ffffff | unlocked | 1023

Logs for W35T51NW-E:
********************

+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef5b1a
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0102ff00080117800000ff84010102e00000ff05010106e800
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe5208affffffff1f0000000000000000eeffffffffff
0000ffff00000c200f5210d800003452b50082e31458e96376337a757a75
ffc3d55c008070ffe950f8a110cb088b0000ac0000000000ffffff860000
00000000000000000000ffffffff430ef0ff215cdcff000b0016b181b585
00d87b9d580b000030f6de9c10000000
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
4e27c223863fa0982fa54d0b74b0bbfbf370c105f94bc0e49d0d02d8db79cbed  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-8S
  opcode	0x7c
  mode cycles	0
  dummy cycles	8
 1S-8S-8S
  opcode	0xcc
  mode cycles	0
  dummy cycles	16
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	22

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 8D-8D-8D
  opcode	0x12
+ cat /sys/kernel/[   54.436903] random: crng init done
debug/spi-nor/spi0.0/params
name		(null)
id		ef 5b 1a 02 00 00
size		64.0 MiB
write size	16
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_SR_TB_BIT6 | HAS_4BIT_BP | IO_MODE_EN_VOLATILE | SOFT_RESET | ECC | NO_WP

opcodes
 read		0x0b
  dummy cycles	22
 erase		0xdc
 program	0x12
 SR1 read	0x05
 SR1 write	0x01
 8D extension	repeat

protocols
 read		8D-8D-8D
 write		8D-8D-8D
 register	8D-8D-8D

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-03ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
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
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read2
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
496fde2866968c0c852f11ffcd7d1fc9e79f88256bf6f0ebf700d795483eecef  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff |   locked | 1024
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=67108864
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=1024
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 66977792 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03fdffff | unlocked | 1022
 03fe0000-03ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 66977792 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03feffff | unlocked | 1023
 03ff0000-03ffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 58720256 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-037fffff | unlocked | 896
 03800000-03ffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-03ffffff | unlocked | 1022
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-03ffffff | unlocked | 1023
---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 55b27bc7e467..a830cad64c1c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -633,6 +633,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x5b, 0x19),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP,
+	}, {
+		/* W35T51NW-C/E */
+		.id = SNOR_ID(0xef, 0x5b, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP,
 	}, {
 		/*
 		 * Catch all entry to make sure all chips solely relying

-- 
2.55.0

