Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDDB51356A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542367; cv=none; b=qxc1ZxNI/GXF+uAcicEtkk+sZR+f4uIUEj9AsiknQjif4oAOFY9reYS0LOMmCXR0BkXqS5kFIU/VSfTMVK3pe9qdUqsa1n/NS0ZPe8KSyZawIMZjcW1egPZJHfC5pjG+FLtO5xm2uAhFA1kQ6yK5w9yEYpTquxEnLOuM2/RuThE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542367; c=relaxed/simple;
	bh=aCsx7Cm6UJsNd5qeomFiaVrm0lb62UMvJj7l0zXdUiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfrTVnM8RRGK5P4xcb+DPPhwYaWL+5eXn+WyEx8OaONwqnrDtOHbIiiiMTEA5YtyHkdrIHC5bj4SfW9KnW/zECje0hqft7g7zc/JJvVyEEitZClta4DhWmI2lTB7ELaIakpUQgKL/Vb2erNqSKslNPMBWHdOJCMJd3sJcG9YGGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o6IivGG9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o6IivGG9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 047F81A19B0;
	Fri,  4 Sep 2026 17:19:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD5146057F;
	Fri,  4 Sep 2026 17:19:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07D0811C78767;
	Fri,  4 Sep 2026 19:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9Ce20Jfpvb9YhNbBbIHNXF9lv/kpDC0mkSZLA1+S3ks=;
	b=o6IivGG92hP8fUYcAiVo15f9FVagdtynTs0OlAxJ0hfQ0AK/P0r/Iycd9/IVMHKcuCg26L
	hq0oA64AUsLL/U1b+0TrcDKJtGh/DjwjB5s7yR13IBFF0s/obHkOdVoD1yxcZegk3ytsY3
	1pV4mHb1KWzDnJCa06Bvz1ID/jWNA/pYFl1wzhS90P7BRilx2f5oBXMHgd8Pi0najrzLJr
	Jng+V+PMroNw7sQ1JLOYPZqdw1DFw4XCWtcY5HUxqbmLn1c7SEbM+fEmQqyFeTndm2aBUy
	kGOY0rpJqzAeV1Y3y8w6XOJzB3A7268YROXZbj3NdCyujfNBOXk3LJXKMnz2yA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:00 +0200
Subject: [PATCH v6 07/26] mtd: spi-nor: winbond: Make the RDCR fixup
 Winbond wide
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-7-bdb282f42a47@bootlin.com>
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

The top level paragraph of the QER field in the JESD216B mentions:

"In this standard, [...]  Status register 2 refers to the byte read
using instruction 35h. Status register 2 is the second byte transferred
in a Write Status (01h) command. [...]"

Value 100b, named in Linux BFPT_DWORD15_QER_SR2_BIT1_NO_RD, does not
mention anything about reads and only brings details about writes.

This has been interpreted in the spi-nor core by the absence of read
capability, but there is no explicit reason for that, except that there
were probably some very old chips which didn't support command 35h.

All quad capable Winbond chips carry a CMP SWP bit in SR2. SR2 is
readable with command 35h. In practice, all Winbond families but the
W25X family have support for this feature, so re-enable it Winbond-wide
in a late vendor fixup, except for the {EF, 30, xx} family.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 44 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 1fd05a3f743d..acd3c38ca2f4 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -73,26 +73,6 @@ static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
-static int
-winbond_rdcr_post_bfpt_fixup(struct spi_nor *nor,
-			     const struct sfdp_parameter_header *bfpt_header,
-			     const struct sfdp_bfpt *bfpt)
-{
-	/*
-	 * W25H02NW, unlike its W25H512NW nor W25H01NW cousins, improperly sets
-	 * the QE BFPT configuration bits, indicating a non readable CR. This is
-	 * both incorrect and impractical, as the chip features a CMP bit for its
-	 * locking scheme that lays in the Control Register, and needs to be read.
-	 */
-	nor->params->flags &= ~SNOR_F_NO_READ_CR;
-
-	return 0;
-}
-
-static const struct spi_nor_fixups winbond_rdcr_fixup = {
-	.post_bfpt = winbond_rdcr_post_bfpt_fixup,
-};
-
 /**
  * winbond_nor_select_die() - Set active die.
  * @nor:	pointer to 'struct spi_nor'.
@@ -313,7 +293,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25Q16JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x15),
@@ -399,7 +378,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25H512NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
@@ -415,8 +393,13 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
-	},
+	}, {
+		/*
+		 * Catch all entry to make sure all chips solely relying
+		 * on SFDP still go through the manufacturer hooks.
+		 */
+		.id = SNOR_ID(0xef),
+	}
 };
 
 /**
@@ -508,6 +491,19 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 	 */
 	params->set_4byte_addr_mode = winbond_nor_set_4byte_addr_mode;
 
+	/*
+	 * All W25Q/W25H chips do set the BFPT_DWORD15_QER_SR2_BIT1_NO_RD bit in
+	 * their SFDP tables. The historical spi-nor assumption in this case has
+	 * been to declare CR reads as unsupported, whereas the Jedec
+	 * specification doesn't clearly state that. In practice, all these
+	 * chips do support reading back the CR, which is needed for SWP support,
+	 * so make sure that capability remains enabled (needed for SWP).
+	 * In practice, only exclude the old W25X family (JEDEC ID: EF 30 xx)
+	 * which actually does not support this feature.
+	 */
+	if (nor->id[1] > 0x30)
+		nor->params->flags &= ~SNOR_F_NO_READ_CR;
+
 	return 0;
 }
 

-- 
2.54.0

