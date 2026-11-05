Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904955;
	b=HePlQWIUap3599iLvZHwpJbndu0y5qjnq828i2TXvnUqZxw4iXvHhAZTOPAbxkK7jRIX
	 dT3pb3XsHCnOIkjJnJJg0mm3SBixo4M/5Fwe3Q0DyLAcecb2LpsyuBo7sXW90wcwP/LyT
	 2V0HxOdTbYY385CQ0Jhhe1AYtIRUU0Qz4yCyRu3t3h4SYC2ZRGeLVCzsq1wlavXZwjZ0z
	 iJygduHPAyTuC3hUUgPmolfD9Cer1u7ODnyhrjWGncEtUjiO5obpasqyBNvq0OLZ7A9ON
	 z/jTiMws1nZCztcHwDbcdHjp733KeDZj+2Id/qKgRa9llUWq86q4r4uBC2Gaz8B5knA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
	b=Zh2nY0dav+CSSH5ihTrEEmx3XkmmCQ3YMNJk1QY2s4hBFu5L8wMqLbacZjfAhy0vzIc+
	 RgjtYHIjhguC8rQUyEviikHbjiOEvOnJaFfgGt/OHsvxSK5GjrWgMJ4Lr/afDLSDvGTpH
	 kcdZf8hfvHcScVNKJGaXLVPQsKrtOyelEHZsQ1nA5kP41MLpyImRVEUKApxtwm2HNLPop
	 1wnbaRy9nlYMduqf8RPNfnc5ZfFXSB98Wyp8ctOq726z/sHnn+BgHCTjzxezATBy8bmb6
	 daDA/3CoGF94AROm6MlLBmZbVxxrtUrxZsrC9uD5iofD8HjGtLu58CPW5WZsU4wFQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y9d2vTFj;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FAB6082BD3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5FAB6082BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y9d2vTFj
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d290b10a35so1043793eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904953; x=1794509753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
        b=Y9d2vTFjPJpkKsegsThQa8LAZzwDsNcncCOXG9gbYdky+bdpK4R4JZ04GLrHE8FAzo
         qKa830Er+Cin0QxxCmOoEbm6jvgqdkIrd4ttv8WkLIgRR3XfQFIpV447R9bGUh22GYYP
         9gT9hRoysIwpwXkZ6YuDHwViwwyyqFJ9Fm5vEA3Gpd0QcZghCydjrEctP+IFDk+QIm69
         Rg+f/avCrVll2P31aPltBlOn0XCcC/HtKpOzhUzsTNJJp7zNWnPK/y895P7QlOXN0IQK
         IOW3DUoM0uz8kRUSqXkazaQFy4Prd7zWaYMxgn2Cfu9jfuH7vrEKJo7ffEPLGglP+e2p
         dR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904953; x=1794509753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
        b=RFhMcG1mIKgVwxx0F9HEHbcKP8vQTPM4Nabh8Sk7iWxO3nKw3RQhS3idpTeJ07LTlk
         NJ50QvEigcGl6fi7IFxZaLlqg7XNmzX9DqXtvzB9ngFe1UJH+4CEZ9KSnev3Ej1N5m4s
         IfOzc7yfyKPNuF/31kUrqSos1E1CXA611knYHe/uLButpcIqbRZYNRqGKJF0OH15UORf
         G7kqo9aM2uG/Ms059V1jQ1Lu6+jRouHVfNWVIQdHrKTqmpxNh1VzqZFGiqGXNAEJqxSx
         qJjK0Af/7hCMbJFmuGuZ11j4iFVSZtNaZP9naSqWRaybKzkmykXqptNDBbOjIcTuUxRh
         TY+w==
X-Forwarded-Encrypted: i=1; AKwUvBwhuwOHB2AAHQ0txGmeGg24Fjz54kbpnvSYTE81yqkYGdBbKvq8L9wOK+5vSSXJ2jCwtr3YbKI6ocTvaTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z98UioGQDLtBx1btmizsAnaQmiM/8wlIF4hciOOORQFiPNhUqTB
	TFhOEBZgGDng7jSwHjG6wIzFqLHuESr+rptmT91Nnz0LhUyJV0UdVwmL
X-Gm-Gg: AYBFou0uPVGMNje9RhMNy+bQxZpTiQUqBN+yEzwNWR96gH0qiRShqQRwGMrQO9Mnfws
	EOwYrjIIVOr2L0+b9eqGYFawyZMGkRAa8xycPnnajkA3UjmFcVFZxEwEivZ4xlT1JBeyngTIZ0/
	Ctg+/eGCe256VISKw2E8/jJX1940s0oNbzwOLXc29oFj9ReCfWwTsmZ7lSHldQp8qRa4NBQnA/j
	6y8NC908TmUvEZ8XTP2kjrc3bIy11E/AEBD8mJt7W7z2mx5ZLXBeM4ggXODIt5mqS/nzghLRvph
	6fiB1WwEY+Ylyou//gLOzvNSsjDeV1Uv407BPrNzDboJUbd3Kzfdq9LiuizC+WlZnF9cZ3nrDqp
	XsCzJNQEUim5Lzql3mlH+VMh450PFjxKcMjKxBpXoed/4e9RoHLWrVm6ebUCczaJGUweTU9CT0u
	+fV4tia+UtofaiE6eQpCmRHc7cn4O5m8yhfOtNcsN9yLYWrhPapZgLTvGH7SMDZf+f+iufRYR0H
	kvhfge3n+XbXklM7Y51HIz4EgnvJ6IinuHwN2toL0GPY0klSDq9b05vAES6tTeAM+cnWBC3QpeJ
	xqxGMYbfuU96jCM3fDgiW/ecLUcMKUS2yh6TbOoBLHMfVYJINwPBCH7CQa7Fng6md5edI1Bbtps
	RERCNcodXOSPl+snAsIZOLrw3eVrDOciZKm2Vf8g3dVkUInNSRt7k+rllicdOhhIaADtXR4q6Il
	1JM7zfMRKc0TlAFXcp1NiBwgKP4v5l0EIcoSN160uzxKb7+xdqpDLb
X-Received: by 2002:a05:6820:340b:20b0:708:ccf9:886b with SMTP id 006d021491bc7-716e79e8540mr267932eaf.84.1793904953478;
        Thu, 05 Nov 2026 10:55:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:29 -0700
Subject: [PATCH v10 13/26] mtd: rawnand: sunxi: use page reads to
 reposition small-page NAND
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-13-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
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
index 5f57c5998f03..931d437e196b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1077,6 +1077,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1085,7 +1095,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1093,13 +1103,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1201,8 +1210,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1268,14 +1277,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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
 
@@ -1310,7 +1319,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1350,7 +1359,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1360,7 +1369,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2326,7 +2335,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

