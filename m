Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1056345EDE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028075; cv=none; b=M1I/2gTt0fTw4K0vJqGtlwb789bGuABAWR5pRm1EgWSEA7mWlVBmDRBjzi/ZmUzlMYldd8YrJzuOp82SuJaZzri9iMMKthCra8iivo+bC0zMKRuoS1eyOv488DD3ZSX/wMEMoJ7UIiT0jYq4Aud0xulSpkpCiFqZmD/vF4OO8mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028075; c=relaxed/simple;
	bh=fIW/vMdm44Bsxi2J9pSdPVSnRlU2o1NOr7LGQ9C8GmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UzddHAFkA5yvVmVVm7YIcP6MChCl93fnORRIvLfXdMRql1mySuImAxMoFhAg5+ZbKkeS7UKHXz5teghryk++ZLB1LZPKibF28WJrCL222zg83lZt7FfYohprNkcRom5X+X+03sgLGuJ5tEHBzMGoSrKd/Qjl2NP/tGp5TbX7ysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl5wPjxz; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl5wPjxz"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-451a49abd8aso959124fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028068; x=1792632868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=;
        b=Nl5wPjxzyz/KUnW5Q5m1+cIM+Io6607BuWHFUQiF3lsAMRDXCbzKIeg9AJfgRO9EHG
         KWP1cQH2JmIMdVklljd7LsrbtvmE9k6wpwG1YnPjGdiKNoU9nZIm0umtXdcCjgNeS661
         4jxMWgjeewwL8eF/cKN+N07O48P55MZIUTjXdHT2UWBeajdpcaqy1pbaXL5kP7PEpN9S
         3quYtLxYIKmfQOmnBBNnz7MENJ7tQQj3QxGSXR0gYQzfwbgaetWTvXSkRYVch473V/+R
         3xeJsHQObaY5IoGenF2HJjLCWiPU/SWwaullJw+fLJsbhLt3FmudjABGCcVxZHDWxDaC
         aSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028068; x=1792632868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=;
        b=AZv3+gIGrOIte0tJP0lw0ln+4SfAewN0D+wB2nj1RJs9ck9uQ+g25sipTOV0vwK5+r
         BJyL65H/Q/Wcxwk445bZiF7PsRVxf08qNfZ8qTH7VumIPQm0n4Eg6NGE9dyxIkEDjo4t
         ORQG+L/gvM5neRRVL4xKZhkRhFX1He3higDLjU4j3yQqqTQaQ6mwwO22GgSDKjDaq2YN
         g6XDqZ2D+9ajWa1yTCsYTNlOZoXultH97V7ZxA7qTUstgU1fgp6ZJrN8qCkVwh4GQBQQ
         2C7VuHOlO5nF+wvUye3ZMrDxPxNTWq2s8Vyh3zg6e4xASBKCljnAJIXgwBodbQahrKpG
         wLrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpO3rFjouexzM5Mwgp2lZjxL61HRJ3LCHRvsnoIgu8S3pgnc9btN1XUJ5LH9CVrsaK/JxkBu/swR/jNMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSdOrTkM5rXh09QyIUhFpm5qNpiznxKMRfKY/0chnrGVR3bskC
	63fSia22lqaqGr9rWhnEo99m6lgdDZ2CI1IZpRaYvyxMpBSiQpekpisxVQTUKheG
X-Gm-Gg: AYBFou09TS6pabZVlfv+EFTIEN4PwDwNvG7xZtpRhExUgKYRPDqEmLLAYhiMq+rgQKe
	xuclKR27M/OYMH2gjIxrb3wggbTh4MWxHumijCqAWDrRbu9J8nPipkCjw1ShZoBFQcT8uMROKIS
	0+QL8z5jbkyZGi4Ud1MR6ybdPJCSCFglxY/6GGPYXuQoyAuQjaR7comKBecQy3wjpJ4Nk9RjxYe
	MuV1j9O9Bb2L6cEY7hzTkNYHC6HOeDncSC6/vXBQ9WQfVKUCjrcmZzmZDvv9sLPMMTS81MXLamw
	vxkpHvkuGj1JSFBjlYqRASSxQX8H3qqEucvxOeydKDe8g4iKAIKYJlWoN8c2TUtdYQ3X70AE8G4
	DAkCNrJ2/du0YVc0b20WFPE/P3AhMdZzPPDYf7lidHiMI4b4XNHlCZmMTK9spPZe/yD4q9thob6
	GL0svsqQ81j1tcC4lEJGdO8P/bu2gSCSnNDwGhxH/MmFmpXSFV4uVO5zKPlesXuAJ7kMkVd04fl
	1DjZ6+L1anL9opUwbZjZULndQurAcWYcnnhqkrN1GIUW7RRBorqspJgnyH0FJw1p2tKBpQP0nGM
	DsJpIMK6+eklHC9hIqHYhiNeLChigOgJ7xWabP3924FP/mDcar+HhThjvotu6B9EMf1c4/UeSrp
	7SSevEf7+Bs/xGhew4W3r
X-Received: by 2002:a05:6870:a40a:b0:494:76db:2aa8 with SMTP id 586e51a60fabf-4a2a86a7ebemr15214415fac.5.1792028067725;
        Wed, 14 Oct 2026 18:34:27 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:56 -0600
Subject: [PATCH v7 09/16] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-9-5d3fc6ad2da1@gmail.com>
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
index 6c4e1740a245..f8abcb46f7f0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1054,6 +1054,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1062,7 +1072,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1070,13 +1080,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1177,8 +1186,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1242,10 +1251,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
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
 
@@ -1281,7 +1289,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1321,7 +1329,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1331,7 +1339,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2304,7 +2312,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

