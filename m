Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7A3B6BE3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122347; cv=none; b=AnwznqRngAiMNOhnCkS7KAzTvNb6JJYWeq6n9ukKOzoSTd9enKTuEo7Nmjcr7RK0QNfNvuzvCHJ+zm2WRHKSLNeUyOv0EvFIhZWAnJbv3en4pRP67nxhkRn2lt/fvvahNCmqW0qSLLFPfI+Xutrgb/6NfdaeYvZFpQEED//YnXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122347; c=relaxed/simple;
	bh=44SdB/unSRPSVYBoHP4dv/wWCcEp8Mtv+c+krHUUX5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMSxV269GbEiHa2MBkCqDX43l3fe+PamoPMsqFKJ+LRk2bhPQ7jL2dbqnHtGloq3t0Dm/JV3oh7fgoELbcak+lMiaf62o1Du8/WMhIRjI6WtI2Hp+HEyxyh22n8vf67lJxQ5yrpt3cSlEDDbvtNoNqDDCpgsMLEnz4sGSeh3KGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePlSFbB+; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePlSFbB+"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-824e6e6ed71so2262317a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122344; x=1792727144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=;
        b=ePlSFbB+q8VlPaduva+q8m3T5Rma1KeeOiEVrzkFySNKzpcxvofyHg++cDz/hmLaXU
         BR8f21ekpDcpIBfC3pjOr8giq+YEITI+eSsoDx5TNhm3MBqzQLRdj21YPAqxAU6dAY9v
         44LjhZBqJYsh7H/Bm0TWZzPHFogoxIWVBs5SR4WqkFs6hunI/9bZw13pUxaRgLDDwqF4
         dCE2o+ohrAcOQIum0N9v7L8Le8f2zV56ZciRuxxQxWY5alkQ2htMDghwOvKgoeXQIla1
         DPmIScUiSjWvnq7yFNsheN4T9ASC0jjtubJnT9JLb2OrGXSGWVnOc5FivdiLTrFRm5A/
         H4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122344; x=1792727144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=;
        b=OKdiz8x0t+I8bZSBPCfj/yLgLHykCrZbrwIgtp+GorYEFVwa6Np1Dq2PmSYZXA2XKF
         mWX5CAl6VdgJzaysCetHjCcRId3FAC/H4Ghry0BwPU0uV7bLoGmNCb3qlrP353r51YxS
         qHDythM2K/pdpYRPzNYJJukofzUKKbdhzzQLeYLNGHL0SsG0sHO5FgpsTmJQ1OkL7nxr
         Uxa6RlYtjo7h5CoXGj6jIbRebPK3eo4XLeXD9GmWSoo+JAdthOMpGT42nSPfM4hElUZ6
         F0VUl0qj21R70cWZyalr2nN12gwSMYtA26psKVAJ0tDLl2Gku0Z4aUaxb0lsMrmHtANg
         eyLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2GqlZH8sbHPcU9EL8OPmVyp/jOfL3dW8ioelAadWOHY3txz6TbFnpb3jutfP8w3N3pzJeg/NzAsoLU40=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEIrpsCmoofF2XSFeMOAiVaMt9kiSPvNY/BRRfnB2FfH6sSlRY
	iwP92PBK12sk/5Z8TwIo3J+KIO4jrpXwIfzpW7EEBmoqXUjZKbujBb3K
X-Gm-Gg: AYBFou3OynbEv4mzvM6s9dsNCN1szztL4aZg+A3m5O7gPD6zbGbZHvx+n3wInZjuLNq
	Yyq6OfIlkm2BlptlYtcuAIesm8/HqRJbRJRbJoQ1SWkBhEevJvX9DmyFodT8AsIwoaXNTmya0S3
	A2leUq6rvoWcs6iNPOOLVphCucKOXJg0pFORs9SPWwzvwy1P1w1KXF4Zgof/VIWa0+or7EqonTr
	Sz186HNEXfwRq1T0ydgfk4OT2a0ItYWyXxkozoseKcj+4uofS2mBLOz0ljR8juOCl22epN1mUUx
	peEsK0FBdTpVhgsi4EyD+7pgM1rudhAE6Yq0zvax5Smd/gg9urGiLme2vKhACTxLHA6CxkcqOfV
	aAU178RXqSdYVuhjdeAF4dUQzNIf4FuMgMclNzdvskIid4p1R1725VPYYxdJECrCh7jIrKCP1lf
	2hQyJb6Y/YZdv29ZeQk31qYWF86/OjzrGeWUxgdklRjDe7DrG6guu7CC2SSDEXXQcSTDNKCttb4
	2qBLMB5Ao2a9HOvx+dsG5RRzRtU+Ij1BaZiGGWFRiDZ7DeAZqHhCraimu8fydUb34Pu+StB0hR8
	adVcQrFVgyFt36gnoigM124+7S45N082SCxyY0YjGGvwpjzpE+q7J93b6rHzVfatodtdMC8kSyG
	9loMds9UsI6E72uRff+AQSg==
X-Received: by 2002:a05:6830:6816:b0:7fa:ac4f:79d with SMTP id 46e09a7af769-83097c62d97mr22209672a34.25.1792122344353;
        Thu, 15 Oct 2026 20:45:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:25 -0600
Subject: [PATCH v8 10/17] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-10-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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

The hardware-ECC reader moves between main data and OOB, and rereads raw
bytes when checking a possibly erased ECC step. It uses
nand_change_read_column_op(), which sends large-page random-output
commands and rejects NAND pages of 512 bytes or less. For a small-page
geometry accepted by hardware-ECC setup, these reads therefore fail when
they need to reposition, rather than using the small-page read commands.

Add a read-column helper that uses nand_read_page_op() on small pages.
The core selects READ0, READ1 or READOOB for the requested column and
sends the row address again. Pass the page number through the
erased-check path as well, and preserve errors from the resulting
operation. Keep the existing random-column operation for larger pages.

Select PIO for small pages even when DMA is available: the DMA PAGE_OP
sequencer uses large-page random-column commands internally.
This corrects read-side repositioning only; the write-column helper still
rejects small pages. Software-ECC and raw callbacks are unchanged.

This is a command-path correction found by inspection, not a claim that
ordinary 512+16 NAND becomes supported. The existing controller-ECC
limits still apply: it needs 512-byte ECC support and at least 28 parity
bytes plus four user-data bytes, so 512+16 remains rejected. No
small-page hardware validation is claimed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9f03ba22b4b7..34c1c5037b11 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1061,6 +1061,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
+				 unsigned int column, void *buf, unsigned int len)
+{
+	/* Small-page NAND needs a new READ0/READ1/READOOB and the page address. */
+	if (nand_to_mtd(nand)->writesize <= 512)
+		return nand_read_page_op(nand, page, column, buf, len);
+
+	return nand_change_read_column_op(nand, column, buf, len, false);
+}
+
 /*
  * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
  * statistics updated in either case. Negative values report transport errors.
@@ -1069,7 +1079,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1077,13 +1087,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING) {
-		ret = nand_change_read_column_op(nand, data_off, data,
-						 ecc->size, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, data, ecc->size);
 		if (ret)
 			return ret;
 	}
 
-	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = sunxi_nfc_read_column(nand, page, oob_off, oob, oob_len);
 	if (ret)
 		return ret;
 
@@ -1184,8 +1193,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1250,10 +1259,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
-			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							 read->dma ? oob : NULL,
-							 read->dma ? ecc->bytes + user_data_sz : 0,
-							 false);
+			ret = sunxi_nfc_read_column(nand, read->page, mtd->writesize + oob_off,
+						    read->dma ? oob : NULL,
+						    read->dma ? ecc->bytes + user_data_sz : 0);
 			if (ret)
 				return ret;
 
@@ -1289,7 +1297,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1329,7 +1337,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1339,7 +1347,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2312,7 +2320,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->use_mdma) {
+	/* The DMA page sequencer uses large-page random-column commands. */
+	if (mtd->writesize > 512 && (nfc->dmac || nfc->use_mdma)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;

-- 
2.53.0

