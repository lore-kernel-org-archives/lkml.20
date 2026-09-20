Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757C3E8351
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912839; cv=none; b=eiev25lTC6W4Ui4yaJQ3sOPMZStMW+A0ejDJIHI33y6cHhFI4f56DD0xrOBVuBP/WNGhRkzds0E/ECWOgQnd/+NSWBSCH32a10Yp6OhWHBDXmeR2kYdEG/2CGnx5J1IJ9gz/y9YzUBGd9HR6xoFT3tqtUgf8hlI5yU9wqe1+5DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912839; c=relaxed/simple;
	bh=s5LKbVQbY7zQS+0NQ4TGik+lbSyIeG5RVCCyAW0stIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZZbe94gxZj+oqmc+gia32il1sngKnY80Ff5W5aqsv4Zgg5/JSHsUVPtrevLISNcpymN6MVcIN5FgwtYzDEfbwt5N9p5DkVLWsBdS6zxXdBa2VyDZcQ8fSe2u6rVrEn9wxrlEnO1nonmJ2zN3Cv5ze74RZH2MMNah9RQyEoMnZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BWb6cwpB; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BWb6cwpB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D9EDD1A09A4;
	Sun, 20 Sep 2026 14:00:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF29B6033F;
	Sun, 20 Sep 2026 14:00:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6EFC1032906F;
	Sun, 20 Sep 2026 16:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=doyiamMhxH6XuJwCWnexHapFGv5TIbpIYj6Vqv3mNhA=;
	b=BWb6cwpBibrK+x9ayOHS5OCwJj7vMdSfLckZuSfWP9OoNCPF3cK1esqBRwAVc1kGf5Q1RX
	r3GpCATsTdlXWqEPhAs3SOhM6dgj9xYHPdFwTWDm8NzCafnR4SEHdbeqAgpUbgtLkoqTNn
	4FBs2CE/ZqI6tEL+qviFvF+q+ENu+N6Rgbe7voW3wH0f4A5AbFlxWuoWagP2PV7swiLSoT
	fP4FBbZHVi+I9CBARrjYjz16zaIeSE0bl7V43ID4wwbGMVrW1aiMLD0crMZm4nIKgx3G8l
	amX2SM+yQ0mdESNIzuSTUkyCH6amfam2G6tMzW84lCd7SF7MPJM5dBjkYjlgtw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:11 +0200
Subject: [PATCH v2 02/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance
 identification of the chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-2-ab9c9688d071@bootlin.com>
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

The EF 60 17 ID has been reused for:
- DW-P/G (no SFDP support, but CMP and quad capable)
- FW-G/Q (SFDP, CMP and quad capable)
- JW-Q/N (SFDP, CMP and quad capable)
Add a comment to flag these chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 55c55e41ec92..5ce29987a13c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -330,6 +330,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
+		/* W25Q64DW-P/G, W25Q64FW-G/Q, W25Q64JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x17),
 		.name = "w25q64dw",
 		.size = SZ_8M,

-- 
2.54.0

