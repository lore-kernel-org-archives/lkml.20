Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6733848FF8B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266384; cv=none; b=jl6MHR6CNKYNEeG8FFfAgvCGctSqDVFM42HySPxHtDMWTRHhf1BeCDr4sPX0gAipVEUiHe/AxFXF1PN4jH8gLfKkRRrmpRu7L/z4N1cbAKwlfZ1eHBv93sALVbT1FF21iwD9APA+IeINbnH78BetlII1ASQW1ljz+zGH+cgD9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266384; c=relaxed/simple;
	bh=UTEH9PIbIWwcFKs3wGw1jrXsTWb2sXQT0iEqAm4jyHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJoY0MCxJ55fweB0xp0zUh0SMyz7xtczO+rZHtTS+YyHWoTezRIRYpaUrmuaws9YJ3ii37PPuXlFoCOOJvasflpKNs1Winp+l8oL2tRguk/urpKzU8KbOBCRImCrjDbokMB0YXVFjOLxSeXPuvEDaGktwG+u++X55LRS90w65ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFLFwkmN; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFLFwkmN"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-825b40f8a26so353907a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266378; x=1792871178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcVwsAGitc/8mDgkiqGJIxKdaOI/OCkQfgdeA86v4XE=;
        b=UFLFwkmNFB6qYN8Kx+Wd1brDm66vIiEbmsxfESYsy2d98903pCPw7b0GaU/yJ0bkYD
         zI37syo5MQ3y0hO2TF3GGD1fKoUCdzpsGT77g1RVi1uoGddtQjFUs23QvI1i8uaEMn/H
         +dCWW98Hypemjy0fciXK4snfGQi/DQnLdWLUXYo0lj7CToVvEk88wLwYHys6KtZZSxh8
         VsiDduKKcwSxos6B0BFHIxxpToFJAHeTZ26q19+9pQh906gBJgYbjYjsNgHSG4CEM96M
         fJ+wOrpKAL+zHhX4ZiQVmHuG4EojbIzWEMdLHlamsBD66K6hIg6+dGF3KUJJLU+mxwQS
         OaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266378; x=1792871178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcVwsAGitc/8mDgkiqGJIxKdaOI/OCkQfgdeA86v4XE=;
        b=THevihAFk/W7V+berhC0qrycLUQaGwbRIVgzskH5jyEYEv3AiY/Ol+wkjewvEpzRJ8
         ehitUNgAiNsXEFF+IT9IRitushfRRP7GY5XLdHcoKnOy7tI4sSCMHAf/u4jRy760PVry
         Mbs1ZSlHjEK1E86JTWI76jAGPhNHxEl8P4VmhUe1f3Su44sEjSFbcNSY1F3MT1KABGCR
         KjjdvM/UJ0bZnHHNIh73jZozGWBb4nQOV9UZvY3lAAH9GHCX+n/93FPIpceQWx3XW9Xo
         hIhZ1Jbr3D3BL1dKO741WhJMy+bLZlOy+iQwGKAsyISit6ZyKXFWj2O1nwb8xOfLi0Q9
         gp8A==
X-Forwarded-Encrypted: i=1; AKwUvByMqCrRaHw0XyZuL/BlNDTXiIH8DW+kX++iSJma+IuSlAX7e8CH+Qtp79OV5ZJYqnqOuhRkIp2Gn5BENrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT5TjHsaLPbyGUEivwM/UNGlcEhxRmJTtIgs9CV3S5NwGlp1S5
	QIUcEZUq4z67Yv5ocRSjV6ZJFF2XYXtx+qPXQg3ssEFXg2XxEyXHlvQp
X-Gm-Gg: AYBFou0RGjib8X14hlHR/T6AtELNIyd9a8f0cmpaF6QyARBOtdE+uW1T8NntKTz9Jpa
	EGRwWRRSqn9Tlxqi9bJAYDeLMHCoYyKxyTTFW7s8ccZxtBA1IwMEtrfPabP/61wC346oxrvyTnj
	Xyx0fXQsoGskixJhVAthTWgrLEd+yhnI7M2jZdEGYBYsj07rTTa0Yl9LOxKKzdkTuSCyL9MkwNL
	ANkEInzxqAGhOGZqQLyOmuUXgaDandXhbn0YVWPCZKC3E4AOPTfReuPsFvNyD4ww5zcmwGMD/8k
	QQMjoLTzTuM38slt1Qd3qbVoeQP5bPMJk1tndKfdN0OjzUU+JYIHv1BABSd12z8BwguFHFrndhQ
	f+TuxJZrdOqhkR5OmBI2BbNkIVw9ZXy/kznNrQDRj8eV+eaoEN3iFGI57njAE0Kac+Ebz8YQjeF
	yNLK0tbwBlhq3UAo4jJYysqMB3YlvXmccBj04i13nBJmFJJPIPlaOJpxLutGP6e80H0bEXABhy0
	4MoRBYpGmT0OzuhfA13VulayiRlbNcHNI/BmAYTD0RM8RIuRedE1wVJei7CA/mljlNnZnpKjTH1
	fv+aACdPalTT+Nduf97ZRxDhcfNMzHn6XFMIRSh2Rf1NiEmQwp5rIo4kfw1yLap6IXCyAvbsph7
	yo9uL+lfwVEqexgDGwSJj
X-Received: by 2002:a05:6808:4fca:b0:4fc:248a:de3b with SMTP id 5614622812f47-53ccaf2998dmr3273386b6e.23.1792266378042;
        Sat, 17 Oct 2026 12:46:18 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:59 -0600
Subject: [PATCH v9 04/18] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-4-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The ECC read callbacks ignore nand_read_page_op() failures. A command or
ready timeout can therefore leave the requested page unselected, yet the
driver continues with data transfers and can report success for stale
data. Return the setup error before starting PIO or DMA.

After an ECC error, the driver rereads the physical data and OOB with
randomization disabled to distinguish an erased chunk from corrupt data.
Those rereads can also fail. Do not pass stale buffers to
nand_check_erased_ecc_chunk() or count a transport failure as an ECC
result: return the reread error instead. Successful erased checks retain
their existing statistics and correction-count behavior.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

These unchecked returns were found by inspecting the read callbacks and
their NAND-operation helpers.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4ff19da8b98d..29715d179d22 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1038,7 +1038,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
-/* Return whether the chunk is erased, and account for its ECC result. */
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
 static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
@@ -1050,10 +1053,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
 
-	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1317,6 +1326,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1324,6 +1334,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1375,9 +1387,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
 					    0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
+
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
 
-	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1465,7 +1487,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1473,10 +1497,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1489,7 +1514,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1514,7 +1541,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1523,10 +1552,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = read.max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1541,7 +1571,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

