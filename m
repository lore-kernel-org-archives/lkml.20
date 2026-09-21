Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509123793C6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973043; cv=none; b=JKqxp20SkhXhSU6k0fuWnLdgUToQT8j6YraxDS8I3N89MXIII3cu1zYC4unT2lzgyEMne2zRh0qreZ4NM7jI6X5/9/mUN5UmtNNLnPZCHG8BdMRHrWWTv035/Q5pMcjKe8Ufm9Pe/ubWPPmDgVtgy4Nj/gziEnvi2Ob6FBpDTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973043; c=relaxed/simple;
	bh=mT67xZ0SPQCBZs/gKsw+uN5JmKwgxG6PyCwuEHE3bUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drZxJyl/0MtiZCltiLYIZblEXLZRg1+0LPbmrGZpgiZTYtKP3x2OQt8ay/H6QsZbY6m6bdu9pT4NwolQxgisz8nGs7t2B40gkKE+xBeIzFzefDYMq1hd1rriVFSPxpWWUrD2EAYb3d05dnOFDYBRmENDnxoUYWCcfrYTUOlqfEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IrTYm3mw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IrTYm3mw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 70C684E40C58;
	Mon, 21 Sep 2026 06:44:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 331DC6074B;
	Mon, 21 Sep 2026 06:44:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2C39103290DD;
	Mon, 21 Sep 2026 08:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973039; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t99Z2GozNyrQMN8upwx5lEJgyS9IVxrcU4UP5CqBPFM=;
	b=IrTYm3mwM3/GUxFaL9hRzaZxyEwdDcfukWiXTU1CWkRtEyTJsj8tMoCsPXzSfQgg+b2uMs
	TCfkGeXyAAG5Nishx6S7PEr4DCA2yYKWNfF9c4qAhjFwK5FIzrAj/BcBLH/j66Dnkc1rhU
	+NiIPHkGxWfEibpw8sHMgXAZ+IWqnERrOgZvjGfU6IPH0pNyAhhIxGHox+lckqG7JommAq
	0nMa53yP8iRf8fHVwrU4bP20c3a1eg3AlIGbLEQrMl53O+Efm39kEeaHGGaieuAI0bW9eq
	oYF776KT9uSpUeM2Ug1bqC8K6TOwEtvgyXJ+o+5tLqYfnXr9x34lmOhO7B1ICw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:42 +0200
Subject: [PATCH v3 11/25] mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad
 page program capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-11-38eef3b6a7db@bootlin.com>
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

The benefit is not massive @25MHz, yet it is a supported feature
of the chip which is already handled by a flag, so let's enable it and
earn a few % write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 707 KiB/s
page write speed is 699 KiB/s
2 page write speed is 703 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 735 KiB/s
page write speed is 726 KiB/s
2 page write speed is 730 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
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
  dummy cycles	0

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02
 1S-1S-4S
  opcode	0x32
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 022fcfd05da2..7e79a415db4b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -334,7 +334,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x17),
 		.name = "w25q64dw",
 		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q128FW-G/Q, W25Q128JW-Q/N */

-- 
2.55.0

