Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8ED4AD7CD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368385; cv=none; b=YoeMJu2IqbdBGUNJYpZHinGq5pIxWCRo3YXfJZLy2vWnZp0UWO+tq6IawQigYAuK2G29tUwe5c3Mkk75Ele2WIbXpki4FqLIvmOInHIsazWumq1xsY1SXmVAM1HO7z2uGJHOW6Nr1I8ad2xgubv7qtfeO2dK0BYxVsb3WUEkURk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368385; c=relaxed/simple;
	bh=6FzBw6jS3KLfjifaiSvCC/iS97apWPiqZtKl8CS0Txg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EyCqANQu00/Q1pWxUMVyNpAEHzOEbK/NGlmULwfPjvxoby7COwujlD5ItRmXI2iHP7TGKZAmRSDoIk02DkVv1DGBy2VoQ9CbR+yUja1LyRz5HxdMvKbY4YtJzRYvLj3sBKEQIrDCROXbRc2xGjbYdnZUYkjvsIKpN6mW0XMf4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xd17MQZA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xd17MQZA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1CBAE1A1968;
	Wed,  2 Sep 2026 16:59:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3D2C6053C;
	Wed,  2 Sep 2026 16:59:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0940D11C798E5;
	Wed,  2 Sep 2026 18:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aI8zX4gCXAqLNE3WArET0YJfq+liXSSkiVbLeqHam0E=;
	b=Xd17MQZAPvIVbZE1/Loy/a1KlRpV8LMjWd1cMxPLOjrxHazZVK5piFBN8BSIk5bTG0pAqG
	NyMlILm924rpZjA7NtuRD492HYv/4PWJ70nZRLfuiQgWym2jLt1CUKXzx6uzkeJkuYlL5E
	fwHC76x65PKBK2w9PmYJ7CrDxO7m8JrrNBDrmctRQx3joqaHq4JoPBkf2F4tkMODOlyyO3
	EKQRD0aL4VDyeSvMsU+r9u7WVoDUDNzSu19GLptF9bU0XuKTj8unZ6WixV/LFhqZMlJP3n
	kBBWAUoP7mRkmcvL9xVnGLTChU0y3u5IRa468GHe9Me2vhi0y3hn3oswZSXf8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:16 +0200
Subject: [PATCH v4 02/25] mtd: spi-nor: Create a structure containing the
 flash opcodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-2-779d35303dff@bootlin.com>
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

Create a structure named opcodes in the flash parameters structures to
store all the flash specific opcodes. They are typically discovered
dynamically through SFDP parsing. Move the die_erase opcode
inside. Later on we will add new fields there, like the supported
opcodes for accessing the status registers, which are almost vendor
specific.

No fonctional change.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c      |  6 +++---
 drivers/mtd/spi-nor/core.h      | 14 +++++++++++---
 drivers/mtd/spi-nor/debugfs.c   |  2 +-
 drivers/mtd/spi-nor/micron-st.c |  4 ++--
 drivers/mtd/spi-nor/spansion.c  |  4 ++--
 5 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fef7f426a3a2..29b8fe3d1c65 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1140,7 +1140,7 @@ static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t die_size)
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_NOR_DIE_ERASE_OP(nor->params->die_erase_opcode,
+			SPI_NOR_DIE_ERASE_OP(nor->params->opcodes.die_erase,
 					     nor->addr_nbytes, addr, multi_die);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
@@ -3030,8 +3030,8 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 			return ret;
 	}
 
-	if (!nor->params->die_erase_opcode)
-		nor->params->die_erase_opcode = SPINOR_OP_CHIP_ERASE;
+	if (!nor->params->opcodes.die_erase)
+		nor->params->opcodes.die_erase = SPINOR_OP_CHIP_ERASE;
 
 	/* Default method kept for backward compatibility. */
 	if (!params->set_4byte_addr_mode)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ba2d1a862c9d..2cc0c80da3fa 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -340,6 +340,16 @@ struct spi_nor_otp {
 	const struct spi_nor_otp_ops *ops;
 };
 
+/**
+ * struct spi_nor_opcodes - SPI NOR flash specific opcodes.
+ * List of variable opcodes used by the chip.
+ *
+ * @die_erase: opcode for erasing a die, defaults to SPINOR_OP_CHIP_ERASE
+ */
+struct spi_nor_opcodes {
+	u8 die_erase;
+};
+
 /**
  * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
  * Includes legacy flash parameters and settings that can be overwritten
@@ -362,7 +372,6 @@ struct spi_nor_otp {
  *			command in octal DTR mode.
  * @n_banks:		number of banks.
  * @n_dice:		number of dice in the flash memory.
- * @die_erase_opcode:	die erase opcode. Defaults to SPINOR_OP_CHIP_ERASE.
  * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
@@ -393,13 +402,12 @@ struct spi_nor_flash_parameter {
 	u8				rdsr_addr_nbytes;
 	u8				n_banks;
 	u8				n_dice;
-	u8				die_erase_opcode;
 	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
 	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
-
+	struct spi_nor_opcodes		opcodes;
 	struct spi_nor_erase_map        erase_map;
 	struct spi_nor_otp		otp;
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 288e2866daed..ef6f0ffcd6bb 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -146,7 +146,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
+		seq_printf(s, " %02x (%s)\n", params->opcodes.die_erase, buf);
 	}
 
 	seq_puts(s, "\nsector map\n");
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c75b0a1cd567..031cf887318c 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -131,7 +131,7 @@ static int micron_st_nor_four_die_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->opcodes.die_erase = SPINOR_OP_MT_DIE_ERASE;
 	params->n_dice = 4;
 
 	/*
@@ -147,7 +147,7 @@ static int micron_st_nor_two_die_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->opcodes.die_erase = SPINOR_OP_MT_DIE_ERASE;
 	params->n_dice = 2;
 
 	/*
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 15dcec09332a..2a8238c707e1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -675,7 +675,7 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	cypress_nor_ecc_init(nor);
 
 	if (params->n_dice > 1)
-		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+		params->opcodes.die_erase = SPINOR_OP_CYPRESS_DIE_ERASE;
 
 	return 0;
 }
@@ -763,7 +763,7 @@ static int s28hx_t_late_init(struct spi_nor *nor)
 	cypress_nor_ecc_init(nor);
 
 	if (params->n_dice > 1)
-		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+		params->opcodes.die_erase = SPINOR_OP_CYPRESS_DIE_ERASE;
 
 	return 0;
 }

-- 
2.54.0

