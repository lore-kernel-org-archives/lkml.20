Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0F342509
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028078; cv=none; b=PDYPo7Dqx3guN6e3EzedlyG7wJvivMDjnOir3HNpBMfx1jgEDJ6Fh3Vyjuc02iNneWf80F97Mcd9yW/J9QRgBEC6VzQoUuRYiyf/lz04Dh9UGSKdlXpqON3krqdkS9alVTrRyfbh6sHnqP3cvu2nneILOTqiueVaNpZ2auTXUrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028078; c=relaxed/simple;
	bh=ZEKjLdrQvIkgydjVw4i2vZt9v4LnkMBrUPI5IXpMP30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvQ0JuaHwAgf9L4bmDfrzZcrYjCplsxvfKQcNXrS9MkCrnJw52NJy/6r737sU3iam9E/BvHCBpNQ8x+YLa9uwXX7OsiEnVaVAwkk2LvDOltADGZ/+mR0ZvW6pTiWjBbaZ+Fye5+h3NqNhq6r+veauXX23zcuI6tHbmoBKpA8kcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZOVlMp1; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZOVlMp1"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4f59ea27bd0so1639239b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028070; x=1792632870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQCXnCBoKTXRiFJPMtozb/9z1MKfV5eVFxvBnHn0o9s=;
        b=FZOVlMp1BN7CP5CBnOvNcXWmIJC3cqLv1dwkiM1vKr/5ePnRFI7sfo2USTkQzr9s0S
         CFK/Zu/k+jViFsNrNSub232t3NxgwY2eVMksBxyAY3xsVTxkDxnc3RbY3EpCk/BVYQGP
         IfReUQxeEcWguA9SsJLHc8vakF0qLxiFhNBsGc/lecdO/Oh/V4aHVOeHwhwTeJxjbXYL
         6AhUyCITphEcxwkQLKhqEIf2nOigjm0bM+7lJmvpkh4z7VoTXX62HQKkjaD+IxQKtY0R
         hOB+I7d4J3m5eFx/BnpI0aWUkHBS0a5RfZfG0G/B1cmp5RYeR90iLXMnnjrnqfGuBfiB
         z3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028070; x=1792632870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQCXnCBoKTXRiFJPMtozb/9z1MKfV5eVFxvBnHn0o9s=;
        b=wPKqdPCwgthPec+bt94X9mF78H1213grLSpcaygRvAlKigNAQ7AHBBeKZsYW/hWRzy
         2HAfp+txq6VvYnsbpBOZSdF4gvVJqdeO9hXqgsMn6d8TLpSFFscUGGYzK4uOqjoBYfZt
         i8W49uN9hhnYqivTOTMBPvpjqPknHl4HHcdBd4Fxp5kFWx7NZV8D9r/5YiZ+QvVPRRD3
         dtNbKmL63mu+SIuy8a1pbejxHWYsrQH+Veu8jrYUwvBAQzkwMI6C+STtsDNfg/v8J0x3
         DrAGDkB2rjMaNP5k5LSP2NOUpW4FME26hWDNtvnVU0bO7wuKly5tVmJMyS07V+Fd57D3
         Lhig==
X-Forwarded-Encrypted: i=1; AKwUvBxvToGr9zP3pt6GGR1dJb3rfnQ6XYa8j5Wcs/kTfRaG3GmgDl2KnjcPiU940zI7pPpdlxyrqo9kggF+J0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYeqrBb5nLm4wqs0kNKvPlXTyHy4Mbhf1Y7QnqbHBnedyytRw1
	sNBzPnzrntr7FwUBa51vPXQhLWpLXQooNIqa4KEGkJFL78WAY9rj4w/4jge7eN2o
X-Gm-Gg: AYBFou1I/ho7BldQEXKFwZTqBc2V+UvdQEioC/7L4QQ53KOx2nzZYvZZiBqcDEWG5Ez
	Scq1mQpAkhYcsm2yPEvVvyy4NZhUT45KV0lUgZPiYrXuLzCgqT1dEYDqafwq/MqEqSyNVPH/MQg
	tOdwKr9pgJSlH/m2BCXKd6K9cY1Tv3CNkJHjmWQ218asQco8OdEsE9yy4vXn1ziosP/QGl+VHK8
	NJw6TRvP1TP5AlFgYWungufPOPjCl31mIfgw3SLg5T8cu+9VI0Ohi3f8U6tB68V4wY5qvoBSZlr
	Kj/I3jjq2ORe6RYstMFKU8m+5fd1rN54004GYrIeYqwyt2PfzmriflENOGaKaGsFKtR3UL+6g+H
	rwLAeRjOiL5ohs4HoDQUFNlqboZMVJ7SC1zfjYQKwarhugy5dBBUpX7ovT5GgHIC9uqCJpLFyIe
	tadO5GM6U6Ej5po7A3xX+JVJL4lljzbxL0L8WX3XpRES1TEEFkyJpSCQu0weoReoCd8GttOHBQX
	uGMPZpHrezbOfkC/Xv8i/4CqJM+zHoRxyuEyRqu4b5ufB4ObuQYtK2NuCmKEWHG5bTmS0a1L4pm
	Ij1jNsCfSPhhMdVLXPVAX7dar76l84MDyU6A8/Vqrf505fsmVLGBeQS1wtN/lb3WXGlhPg59oso
	lR4ugqfoPuFxa1YD/sWenO0iqPYy+JH4=
X-Received: by 2002:a05:6808:1241:b0:4f6:808e:3838 with SMTP id 5614622812f47-50c582328f9mr16041562b6e.52.1792028069956;
        Wed, 14 Oct 2026 18:34:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:57 -0600
Subject: [PATCH v7 10/16] mtd: rawnand: sunxi: bound DMA batches by the
 user-data register bank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-10-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H6/H616 store ECC-protected OOB metadata, called user data, in 32
four-byte registers. The fields for successive ECC steps are
concatenated in that 128-byte bank. However, the existing allocator
fills the OOB space left after parity, allowing up to 32 user-data bytes
per step without limiting the page total. A whole-page DMA transfer can
exceed the bank. For example, 16 KiB main data plus 1280 OOB bytes with
BCH40/1024 leaves 160 user-data bytes; with 1664 OOB bytes it allocates
512. Register accesses then extend beyond the user-data bank.

PIO can handle these layouts because it reuses register zero for each
step. Capping the page's allocation would instead move parity offsets on
flash and break compatibility with pages written through PIO. Split DMA
transfers without changing that allocation or the logical main-data and
OOB offsets.

Fill the first batch up to the 128-byte limit. Transfer each remaining
step in a separate batch, using hardware slot and user-data register
zero after explicitly selecting its main column and spare-area base.
PAGE_OP generates later main-data columns from hardware slot numbers,
not relative to the selected initial column. A multi-slot batch starting
partway through a page would therefore revisit an earlier column.
Single-slot later batches avoid those generated column changes. Pages
that already fit keep one DMA batch.

Program length fields from the batch's logical starting step, and
consume its protected OOB and ECC status before reusing the registers.
Keep erased state, correction counts and trailing OOB handling
page-wide. On a failed DMA read, discard all partial statistics before
the existing PIO retry.

Use one page-read setup or program-begin for the whole page, and send
program-end only after every batch and any trailing OOB succeed. A write
may fall back to PIO only if DMA preparation fails before its first
batch; never retry a write after part of the page has been transferred.
Raw access and the OOB layout reported to MTD remain unchanged.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 202 ++++++++++++++++++++++++++------------
 1 file changed, 139 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f8abcb46f7f0..c27cd8e04739 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -54,6 +54,7 @@
 #define NFC_REG_H6_RDATA_1	0x004C
 #define NFC_REG_A10_USER_DATA	0x0050
 #define NFC_REG_H6_USER_DATA	0x0080
+#define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
 /* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
@@ -951,7 +952,36 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 	return sunxi_nand->user_data_bytes[step];
 }
 
-/* PIO uses register zero; DMA concatenates user data within each transfer. */
+/* Keep the on-flash layout, but fit each DMA batch in the user-data bank. */
+static int sunxi_nfc_dma_batch_steps(struct nand_chip *nand,
+				     int first_step, int end_step)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = 0;
+	int i;
+
+	if (!nfc->caps->reg_user_data_len)
+		return end_step - first_step;
+
+	/*
+	 * PAGE_OP generates main-data columns from hardware slot zero, not
+	 * from the initial column. Use only slot zero after the first batch,
+	 * so the explicit column change selects each remaining logical step.
+	 */
+	if (first_step)
+		return 1;
+
+	for (i = first_step; i < end_step; i++) {
+		user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+		if (user_data_sz > NFC_H6_USER_DATA_REGS * sizeof(u32))
+			break;
+	}
+
+	return i - first_step;
+}
+
+/* PIO uses register zero; DMA concatenates user data within each batch. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
@@ -1369,30 +1399,32 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 					     pattern_found, step, 1);
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
-					    int oob_required, int page, int nchunks)
+static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
+					   struct sunxi_nfc_ecc_read *read,
+					   int first_step, int nchunks)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	struct sunxi_nfc_ecc_read read = {
-		.buf = buf,
-		.page = page,
-		.oob_required = oob_required,
-		.dma = true,
-	};
-	unsigned int corrected = mtd->ecc_stats.corrected;
-	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
+	int page = read->page;
 	int ret, i;
 	u32 status, pattern_found, wait;
 
+	if (first_step) {
+		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
+					    NULL, 0);
+		if (ret)
+			return ret;
+	}
+
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
+	ret = sunxi_nfc_dma_op_prepare(nfc, read->buf + first_step * ecc->size,
+				       ecc->size, nchunks,
 				       DMA_FROM_DEVICE, &sg);
 	if (ret)
 		return ret;
@@ -1400,7 +1432,12 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+		sunxi_nfc_set_user_data_len(nfc,
+					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	/* exec_op() restores the page's spare base during column changes. */
+	if (first_step)
+		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+		       nfc->regs + NFC_REG_SPARE_AREA(nfc));
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1432,10 +1469,32 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	status = readl(nfc->regs + NFC_REG_ECC_ST);
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
-	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
-					    0, nchunks);
-	if (ret)
-		goto err_stats;
+
+	return sunxi_nand->oob_ops->read_batch(nand, read, status, pattern_found,
+					     first_step, nchunks);
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+		.dma = true,
+	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
+	int first_step, batch_steps, ret;
+
+	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, &read, first_step, batch_steps);
+		if (ret)
+			goto err_stats;
+	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
 	if (ret < 0)
@@ -1741,71 +1800,88 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
-	unsigned int reg_index = 0;
 	u32 wait;
-	int ret, i;
+	int first_step, batch_steps, ret, i;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return ret;
+	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
+		unsigned int reg_index = 0;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
-				       DMA_TO_DEVICE, &sg);
-	if (ret)
-		goto pio_fallback;
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, ecc->steps);
+		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+		if (ret)
+			return ret;
 
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < ecc->steps; i++) {
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		const u8 *oob = nand->oob_poi + oob_off;
+		ret = sunxi_nfc_dma_op_prepare(nfc, buf + first_step * ecc->size,
+					       ecc->size, batch_steps, DMA_TO_DEVICE, &sg);
+		if (ret) {
+			/* Only retry before any part of the page has been transferred. */
+			if (first_step)
+				return ret;
+			goto pio_fallback;
+		}
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i, page,
-						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
-		reg_index += user_data_sz / 4;
-	}
+		sunxi_nfc_reset_user_data_len(nfc);
+		for (i = first_step; i < first_step + batch_steps; i++) {
+			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+			const u8 *oob = nand->oob_poi + oob_off;
 
-	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
-	if (ret) {
-		sunxi_nfc_dma_op_abort(nfc);
-		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
-		return ret;
-	}
+			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
+							    page, user_data_sz);
+			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
+			reg_index += user_data_sz / 4;
+		}
 
-	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_randomizer_config(nand, page, false);
-	sunxi_nfc_randomizer_enable(nand);
+		if (first_step)
+			ret = nand_change_write_column_op(nand, first_step * ecc->size,
+							  NULL, 0, false);
+		else
+			ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+		if (ret) {
+			sunxi_nfc_dma_op_abort(nfc);
+			sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+			return ret;
+		}
 
-	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
-	       nfc->regs + NFC_REG_WCMD_SET);
+		/* exec_op() restores the page's spare base during column changes. */
+		if (first_step)
+			writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+			       nfc->regs + NFC_REG_SPARE_AREA(nfc));
+		sunxi_nfc_hw_ecc_enable(nand);
+		sunxi_nfc_randomizer_config(nand, page, false);
+		sunxi_nfc_randomizer_enable(nand);
 
-	wait = NFC_CMD_INT_FLAG;
+		writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
+		       nfc->regs + NFC_REG_WCMD_SET);
 
-	if (nfc->use_mdma)
-		wait |= NFC_DMA_INT_FLAG;
-	else
-		dma_async_issue_pending(nfc->dmac);
+		wait = NFC_CMD_INT_FLAG;
 
-	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
-	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
-	       nfc->regs + NFC_REG_CMD);
+		if (nfc->use_mdma)
+			wait |= NFC_DMA_INT_FLAG;
+		else
+			dma_async_issue_pending(nfc->dmac);
 
-	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret)
-		sunxi_nfc_dma_op_abort(nfc);
+		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
+		       NFC_DATA_TRANS | NFC_ACCESS_DIR,
+		       nfc->regs + NFC_REG_CMD);
 
-	sunxi_nfc_randomizer_disable(nand);
-	sunxi_nfc_hw_ecc_disable(nand);
+		ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
+		if (ret)
+			sunxi_nfc_dma_op_abort(nfc);
 
-	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		sunxi_nfc_randomizer_disable(nand);
+		sunxi_nfc_hw_ecc_disable(nand);
 
-	if (ret)
-		return ret;
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+
+		if (ret)
+			return ret;
+	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */

-- 
2.53.0

