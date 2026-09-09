Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6F569F2A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967549; cv=none; b=UxTDk0Mu3NeijPpgW6DWc622zi3lzTqV0VFzjQ++mv/UYwG8yADrNArH4tn0933Om2MqyZ+DUpddnoHbdI+uRML6McfZ2zQLPklOLzlXxogae5X6UV4IOR/0URqQ5d2cXs9e6tlPMm5GjsBMD4h7TRduZqrzjjwAFiy6dRpM0Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967549; c=relaxed/simple;
	bh=0zNN5EMKyLHp+gHTfKhqaUAnQZcH5RA7KeS0l9bnz4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5e0kYp+ADPbkkUKYTpVXgI/U3ttHxJ9s4SurpWki0umU+Gmh8PAztpnSvPxCnIvlQTIfV5FSrXHsZZVb9PULHhK6UixrZUer/YON7Br25+YG76mnoVq7SsKipZyhqTneazxn5Ovb8QfkgH2T/RqlwKum/cHnJM3DsYwLcqOwBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0b20iL85; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0b20iL85"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA9374E415B2;
	Wed,  9 Sep 2026 15:25:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F7DF60448;
	Wed,  9 Sep 2026 15:25:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6F9511C7AF6A;
	Wed,  9 Sep 2026 17:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VgAafngqW7qJ5v4+IjgL/cytyMQZkw0gU3BV4hiArOg=;
	b=0b20iL85P4KV0PoHbp1+qSvbfAdR6NGH4HGyz3UlpdW8jH0RXN4ciJoGkxaeQagGP8kQLz
	s+NJ51SZgPbhmR530FlXKM6hy8P0CsUvRkXArlr8jctIGZSIkCnICN0LzNfX2ka7YoEdTN
	kVP6tVSrAc/tGUzGdKHHMmf+KF+ANEm5926lR9F7yFa9LMqJuRZfYTffw7NPN3bAseP6mi
	OlpYipqMU4qsOYle3DP3H6Dh4aNUji3CLcdVgXC4ZrDXMvmcbvFaPGY3EEZPa3QDzbodbp
	AkO2ysGtUv9qFlRRryhxPaaqn9yXwCHCd5vuN3DwSzr91nuPbQ470q0mx5Ft0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 09 Sep 2026 17:25:32 +0200
Subject: [PATCH 01/25] mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance
 identification of the chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-1-c1b20c39dd1f@bootlin.com>
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

The EF 60 16 ID has been reused for:
- DW-P/G (no SFDP support, but CMP and quad capable)
- FW-G/Q (SFDP, CMP and quad capable)
- JW-Q/N (SFDP, CMP and quad capable)
Add a comment to flag these chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index f6321c1dc7dc..55c55e41ec92 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -322,6 +322,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32DW-P/G, W25Q32FW-G/Q, W25Q32JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x16),
 		.name = "w25q32dw",
 		.size = SZ_4M,

-- 
2.54.0

