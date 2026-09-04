Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5882F50C28E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542363; cv=none; b=kQ/sHObCpMCunb5EzOB9J6BFF0H3Sl4BYI4SFqscE2XQMbkiR6oJ4YiHmQwDFmYGYlE5meOvCOjEFv3z5XNZ60mYuJPUC5iNqZGwoPWnmD5qiW0/WQcrmInfJRrXx4tZv3R5QnM+5AR/OcU6YIi2Ieu2tUGt2Nh+7lKOjjJ5FJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542363; c=relaxed/simple;
	bh=O1PQNcROidz+AcrSIIPYjk30k+VUNMrC1HDv/tSGo/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IEZ29/1lAZcIkJOtV8nItqkUQxbe9UP2Y942jxuDdUXo3kCe4oY9tjOQQMgfr7MyZ2zsD+Kjgwi24elHBeZ1YMqWoe44sq1iTm0HGzjKdNPb0rfXqYXBlCq4Zcx1gqVj6HuPGwAcpXvIqbLUjjIVVVYt4bKJO5pZY6QgqP0g8wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d8MIYvv4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d8MIYvv4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA2E51A19B2;
	Fri,  4 Sep 2026 17:19:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE3226057F;
	Fri,  4 Sep 2026 17:19:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2A3B11C79982;
	Fri,  4 Sep 2026 19:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PDuQBuqQ5Eqfy+3Z3OCef/VeYuSq4VTsl7Z7MUvQqhg=;
	b=d8MIYvv41uWctGK9Ey3UGSJxY8Vxyhao5BxQ22KaO29RYI+zyLVGlznsIFghKH9QxL2GDF
	o1KfctQcJPfN/YDCwvN5DSQZX98M3pWqHRD6K8AdtAh8tjbcv9vVEfxA5iR+9nMV4igc8P
	9w6OV+RkznnTd+DgUWC8VTZE15UUo5pvq6LpF5ToR1unA28OltGGjBfLwa+X57cj9rnuqw
	A678NgGCAfUnjmncCbOTDnxC815kAkSyQCuVtFOHB/qQhspQlhW5bWRH5zo0CFIgtCFiCE
	bgK+lZ0wrYbV9mRHL1ef3WP1EZoFHeDjtdoU+VJvQb8Un4ZwiJCAETpKrJwZ+g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:57 +0200
Subject: [PATCH v6 04/26] mtd: spi-nor: winbond: Move W25Q01NW to its right
 place
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-4-bdb282f42a47@bootlin.com>
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

Chips are sorted by families, and inside the families, by density. The
second ID byte indicates the family, the third indicates the
density. Move W25Q01NW to the right place.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/winbond.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6b99d9488c40..13a2fcd703e8 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -300,6 +300,12 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x20),
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		/* W25Q01NWxxIQ */
+		.id = SNOR_ID(0xef, 0x60, 0x21),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x15),
 		.name = "w25q16jv-im/jm",
@@ -365,12 +371,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
-	}, {
-		/* W25Q01NWxxIQ */
-		.id = SNOR_ID(0xef, 0x60, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
-			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25Q01NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x21),

-- 
2.54.0

