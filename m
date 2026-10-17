Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE234968E0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266402; cv=none; b=MooM4bb2Nnc2bHvsbDWNXPVknLf4cySU59FhTB61mn+ceRiEzQAVVQ7cnk8Kn1O/1s1Q+u4ak60dOy9T4jr/5xiq/h1XX+rW6aBwxIHd2Km0Fj7fuc6/28nAuaPgz5AuTJKkVToiBJgBW04CZvFBT17Xfj+sUyv7LblQMukc9Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266402; c=relaxed/simple;
	bh=lCv2gYemwbI1mKURr3K14d4/Nb3rNKPrtxXImPwhdBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raQrVSTMoz1zQSFwQqNJX5c7QuPi7353j3IA5po8HhXWaDwFNfuBaZRlNdfybWRssXQRTmRpD4c1YJ01bYshWJ5Q4XPL8NR4mqPC6Gr39vwoZjfn9Kt6zEVgtIgPIz8EJ5M58siB+r8ikV9cKHHO3zeItHT+g1AAtFu+XicZX3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdIZU0Rb; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdIZU0Rb"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-823b938464fso687281a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266397; x=1792871197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTIpJDfoSvJa9mNPyvSlvbjoEPEDMGD1iYdf7xNBtEM=;
        b=DdIZU0RbrQedOXpK1oDXZjVfAdqqWc/oE0HnAHvpb/wxQeT2JsU+yaXOkQmdEWZyC9
         7lv0c/4imaWalDT4Rk3m5bBrCZ4YFPNJj+PTRG81moPfQq6s+/ylY0RVIvFS4kDExmlP
         /zp126/NaOHLiw3il6/w/hPTL1YtPB0livrNBi8aENz+G3OwIaf7VtuVItuEzjMrTw1b
         wtmHXjCCKH4MAj2xpOucP1xCQOsro7i1DqtbP43WY+TJd8EHXhTRYGVkxGXLO+tzsMBQ
         2NGamj6G6ayKRT4WpqZrcLSvXMlP+NKCj/5QAca+o74EMY63HWvo0psscYedShUf7J3Y
         8YRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266397; x=1792871197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTIpJDfoSvJa9mNPyvSlvbjoEPEDMGD1iYdf7xNBtEM=;
        b=eQRQJbOAiigarAXCljdyfx07blD72iD7YpYxdaATQo8EreGzVbcn0zS+Arc5TrMNLH
         Zu1m6LKiuAyfN8hyEqwATj3Phq45S0eyzL94MPiAKbm13yZqTYWiRXdfPfUh5lpRmnSJ
         5I5fagvmdvZq5JDjzZqn6B3pn9S+63rIXmIQtnLDYwCxNNW7GkNEKrOovs+J8p4Q5IU+
         HYs0aY/y4JrNfRRJryTPCvP+21Jfn53fs4ezsAoVyg0PUZQ2/fWRDYeEiNLjEyfZJYQa
         ADwbJ074PBmPKekiHejrGitFnXOnurDyrqPVSBlKhoNDF4USh1G9rNkQjxnijwEXQTAj
         saBg==
X-Forwarded-Encrypted: i=1; AKwUvBxwYDbBFnetkhP+C1SPzSSA5FuY9RFUHb/TKKM8sgpCRqmXn+0NplPESXhRvqadc/Cn67mIe4BY1sItA0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4lngsg9HnVaZToICs5RizTjX9JmUHHFIorQo2/FAksLCYSzO3
	LXh0eLRxb30jrey4kMh83MtiEX2VBasOHT6hl98f2uYzLzsV3ADeFxyX
X-Gm-Gg: AYBFou3UDTtlE28ki+lmP513EOsqzGPrzscfusUUVqP+0uYEXfARy20rbmDmRcxGB7H
	J1HXTJwtBGE0M1isQUF1O9pKKyErY3aUae01DI9L8VSjs7KXtFTKe28hH603LGFJ2cCxo5hTtSg
	0GJgfo0cIm0LcYoSlzCKoMnAYgFeWs1NQD5Vj1fixSrDkAwsAViZrekM2dsUZSGz7C9K9oGhQ8u
	K8eNCE+kl5oPzVKeutUAQZptpB9iIEjoolW8Th4NxzbxyNCgBfDDYfV7+tJTFlHKqMXHPvVS//C
	eQ8tVyEny2qO1y4Awf2qA7nLA2fzqaYgYHYh7y7mJOxooay8g0CrPODQcw4f10+PE+VhZXnPFP3
	qqLBOPavpArSdqP1ATLi4DPrflei72iN8W67CVJaeQRT2qj2vg/2hH/ggzHd6rIWGqD84h/Z59q
	r4uZOMcWsvCvqJ0erlutWGCEqSXJteWXLBpUqSjLkAuUjrHjWLTq0+E5LQSM5A68T3W/lXn8myZ
	6XGzSDbMU2J1lDlrYwLlaSTJJ3vQg==
X-Received: by 2002:a05:6808:6b89:b0:4b3:7549:d3c0 with SMTP id 5614622812f47-53cd20aaa38mr2724743b6e.18.1792266397145;
        Sat, 17 Oct 2026 12:46:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:06 -0600
Subject: [PATCH v9 11/18] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-11-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
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

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913041642.E28F81F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 ++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f00f9a8ff66b..ab9ff470062a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1072,6 +1072,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1080,7 +1090,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1088,13 +1098,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1196,8 +1205,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1263,14 +1272,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 oob, ecc->bytes + user_data_sz,
-								 false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off,
+							    oob, ecc->bytes + user_data_sz);
 				if (ret)
 					return ret;
 			} else {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 NULL, 0, false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off, NULL, 0);
 				if (ret)
 					return ret;
 
@@ -1305,7 +1314,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1345,7 +1354,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1355,7 +1364,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2333,7 +2342,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

