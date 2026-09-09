Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549A476690
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942664; cv=none; b=hIiBXO/mUVS04NkMzqEajTL3GG0Lo0zCKReaF0k9IXCifCOb/nnli092fMi7mgrgx8sUINhOWw6hdBmzb8qB9ct4MCzSNQsVaVjf+FPAnse8ycwmjOYF/wDwHjrHmOPzYjXK91Uu5fJiwuciel0R19CR0eAyqYSWI9sh+DkDuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942664; c=relaxed/simple;
	bh=RVqGVXQUJeISiEcx5IgnCpMhNKRA1FoC04a/+LaFAXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEra6nsXNEmjDWMBGhqgxoyaXTZHzdZPRV6TrjHwUTMwiGAXZyLOFHQsXa2sWVRuhr9l+plWLmgRbyp82c28dve652sLVYvup1H2y/wf+Vw3a6wbTzczGEwrAQuMT0FuEARHZsUTH/F8pcqL1ykiTbU39pA23M+/3C6vdakzt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIBWQHri; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIBWQHri"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1598d3f73so3295787eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942659; x=1789547459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bs355GQcNdyXLmSFCPmXMNpmCIkqcr3KcfubGPkH/gA=;
        b=bIBWQHri1Ir76JgaDprsfCA4+hDKNmBYw+M13AZFhp9Bu3PK63Dmh4wK3y6huscvEa
         1OgKi07LqUeQ6laZuPUb5pXojYKX2xopWf6z7gEwV2lANv2tJGjmy5P0MrPFGtjwLPuI
         TDHh33hEdGiXvgpfiK7PtF2jhV4ybUk+dlX1ZmBdQmfBlJkkCuHWNZeF9S8mibx8PNBB
         tquPRctgzAEndyqYBbBLkjgQMZJYrLdrwHzODv5Wx4n2+gaz7CxbwGQgjVpfGQiMhckn
         qCgYSBTWhEyCjEBd4dsV9r1GDoP90omqjH6I+FmbMOV/+loRBnTnMUfdjyLbx28R0FMa
         PGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942659; x=1789547459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bs355GQcNdyXLmSFCPmXMNpmCIkqcr3KcfubGPkH/gA=;
        b=RRWS2q/sJleopmwSh0mJ7AM5zMxpDZnsg/73bB74dulkOo9QBpEjSFFlgbUHLnW5Ri
         lHtf7sUY7JegRsHzgtYbeZ38jRSkDA1i65qRJ3fbFct1lWFUTnzCxyraKQm8OCAc73KT
         N7fw3jsmKR7voR6XLz++2K2Zuo5KhFAOBAEQ7DN3JFrfD6YgVTMvzyKTc+lrfGtIXrcs
         Q0kF+dHGXJFX17JT59ENf36iP6wC7Wdcgyn1s0g4XrW7Jy92gaQgAs9sI4RLMkWMCLVv
         Z9XRVGWBUksWsC4oTOt7ng9ccN7JyGlLBvjJ1Iu/STKkJypVezVQytx7qfLjlL/rpjEp
         fW4A==
X-Forwarded-Encrypted: i=1; AKwUvByvUb+sGKnn59jeghz8R6M2lEaoINLrTCIdfCRUrkJ28Hg5TiL1ijkPqKEk6zIIKlX6Lllfu0Mp/3q31X8=@vger.kernel.org
X-Gm-Message-State: AFuF++nMshbcYF6+giTSZ0PaVUz3Rw41wN6Ghywh8fApF1276JQ6haX3
	Nzl0rY5vPFSl0TiYdiRLTqCzNeH/GgF+Esa3sWvQO213Zg7D5gWB0bMP
X-Gm-Gg: AYBFou2qCadpqT7BCs5JtMq0aY8FyG+P6P01iKuCGTpar4ybi5m+pJr3y+nswVS5vyJ
	23drqskTEKMDGeKBiitiJzHYoGUKKUYga0ZZ7XKfsnh4V5vfyxyFpsmW0bbq2BOvS4FvjUOBa9W
	pWuafE9TlJpXFBbdQVHSB8FAMXLRcHLnbFSbS6lA/n2gY6t1lBs2spchmU1M/XLytv4rmfZjG/A
	g/LD87unDP9Cx2YWLfd2h72wBwqFMh9QZK9FQ+ejiHtZg/eTS6Anyt6VvPK5fy7uDiU7NWOslLw
	Uf/KypEidk5ONZjFv/NTmf3shBT9w9UsAw4Rw+O2oGBdMnSTmZ9kmBopMxXXWBKwixivHMENxT3
	LJAIhlz3S4ruX9fAd4D2l/b0ckXHl/BXnve38e1NQnvoAsLy6mkgejoz58XRmoYO3elE2yvkESf
	KPtsW2Q2UsgX2nZHvLz9llqq3DC1/WAgqLvxBO4HfNtFuGzSs0/OtJ/uUo6STa2AwpxvwfIaa0c
	9Sj2Fiziaz+G+0ay4cHGyzUxTmtDS2NEnF9H0C0wvf1vR2YsA0HSIfeMaep5BH45DpLpmDJYmfu
	x6YGZA8hloolAX+TBpe3ixY0QHRYZ/KLpI9zaH6tltud/THhyUQKTZIbZ3F9kvje41zkc5IgEeS
	m0+FXa04m814+y92Ram/BxJvdm3bb
X-Received: by 2002:a05:6820:4b14:b0:6be:7782:5a51 with SMTP id 006d021491bc7-6be7782655emr1244864eaf.10.1788942659380;
        Wed, 09 Sep 2026 01:30:59 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:38 -0600
Subject: [PATCH v3 05/15] mtd: rawnand: sunxi: propagate buffer and column
 transfer errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-5-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The PIO buffer helpers stop on a FIFO or completion timeout but return no
status. Their hardware-ECC callers also ignore column-change failures,
including the extra-OOB paths used after DMA. A read can therefore report
success with incomplete data, and a write can issue PAGEPROG after a
failed transfer.

Return transfer errors through the randomizer and OOB helpers to the
page callbacks. Always disable the randomizer after a buffer transfer,
and let the existing page error exits disable ECC and skip program-end.
Only advance the extra-OOB cursor after a successful transfer.

Keep the corrected-bit count separate from transport status so successful
OOB reads do not overwrite it. If any legacy DMA OOB read fails, discard
the ECC statistics from that attempt before the caller retries in PIO.
Leave the successful transfer sequence and OOB representation unchanged.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 220 ++++++++++++++++++++++++--------------
 1 file changed, 141 insertions(+), 79 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1bc94565e9e8..7081df77f63e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -632,7 +632,7 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
-static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
+static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -648,7 +648,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
@@ -660,17 +660,19 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		if (buf)
 			memcpy_fromio(buf + offs, nfc->regs + NFC_RAM0_BASE,
 				      cnt);
 		offs += cnt;
 	}
+
+	return 0;
 }
 
-static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
-				int len)
+static int sunxi_nfc_write_buf(struct nand_chip *nand, const u8 *buf,
+			       int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -686,7 +688,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		memcpy_toio(nfc->regs + NFC_RAM0_BASE, buf + offs, cnt);
@@ -700,10 +702,12 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		offs += cnt;
 	}
+
+	return 0;
 }
 
 /* These seed values have been extracted from Allwinner's BSP */
@@ -853,23 +857,31 @@ static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
 	bbm[1] ^= sunxi_nfc_randomizer_step(state, 8);
 }
 
-static void sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
-					   const uint8_t *buf, int len,
-					   bool ecc, int page)
+static int sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
+					  const u8 *buf, int len,
+					  bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_write_buf(nand, buf, len);
+	ret = sunxi_nfc_write_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
-static void sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, uint8_t *buf,
-					  int len, bool ecc, int page)
+static int sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, u8 *buf,
+					 int len, bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_read_buf(nand, buf, len);
+	ret = sunxi_nfc_read_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
 static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
@@ -1140,17 +1152,25 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	bool bbm = !step;
 	bool erased;
-	int ret;
+	int ret, bitflips;
 	/* From the controller point of view, we are at step 0 */
 	const int nfc_step = 0;
 
-	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+	if (*cur_off != data_off) {
+		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+	if (data_off + ecc->size != oob_off) {
+		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1172,13 +1192,13 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
-	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, user_data_sz, &erased);
+	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
+					    nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
+					    pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
-	if (ret < 0) {
+	if (bitflips < 0) {
 		if (!(nand->options & NAND_NEED_SCRAMBLING))
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE,
 				      ecc->size);
@@ -1190,17 +1210,22 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
 		if (oob_required) {
-			nand_change_read_column_op(nand, oob_off, NULL, 0,
-						   false);
-			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + user_data_sz,
-						      true, page);
+			ret = nand_change_read_column_op(nand, oob_off, NULL, 0,
+							 false);
+			if (ret)
+				return ret;
+			ret = sunxi_nfc_randomizer_read_buf(nand, oob,
+							    ecc->bytes + user_data_sz,
+							    true, page);
+			if (ret)
+				return ret;
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
 							    bbm, page, user_data_sz);
 		}
 	}
 
-	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
+	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, bitflips);
 
 	return 0;
 }
@@ -1233,31 +1258,39 @@ static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
 		sunxi_nfc_user_data_sz(sunxi_nand, step);
 }
 
-static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
-					    u8 *oob, int *cur_off,
-					    bool randomize, int page)
+static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
+					   u8 *oob, int *cur_off,
+					   bool randomize, int page)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != (offset + mtd->writesize))
-		nand_change_read_column_op(nand, mtd->writesize + offset,
-					   NULL, 0, false);
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
+		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
+						 NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	if (!randomize)
-		sunxi_nfc_read_buf(nand, oob + offset, len);
+		ret = sunxi_nfc_read_buf(nand, oob + offset, len);
 	else
-		sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
-					      false, page);
+		ret = sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
+						    false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
@@ -1328,21 +1361,24 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		u8 *data = buf + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 		bool erased;
+		int bitflips;
 
-		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
-					       oob_required ? oob : NULL,
-					       i, status, pattern_found,
-					       user_data_sz, &erased);
+		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
+						    oob_required ? oob : NULL,
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
-		if (ret < 0)
+		if (bitflips < 0)
 			continue;
 
 		if (oob_required && !erased) {
 			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
+			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							 oob, ecc->bytes + user_data_sz,
+							 false);
+			if (ret)
+				goto err_stats;
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
 							    page, user_data_sz);
@@ -1351,7 +1387,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		if (erased)
 			raw_mode = 1;
 
-		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
+		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
 
 	if (status & NFC_ECC_ERR_MSK(nfc)) {
@@ -1369,23 +1405,27 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 							  mtd->writesize + oob_off,
 							  user_data_sz,
 							  &max_bitflips);
-			if (ret < 0) {
-				/* The caller retries the whole read in PIO mode. */
-				mtd->ecc_stats.corrected = corrected;
-				mtd->ecc_stats.failed = failed;
-				return ret;
-			}
+			if (ret < 0)
+				goto err_stats;
 			if (ret)
 				raw_mode = 1;
 		}
 	}
 
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						NULL, !raw_mode,
-						page);
+	if (oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
+						      NULL, !raw_mode, page);
+		if (ret)
+			goto err_stats;
+	}
 
 	return max_bitflips;
+
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1403,13 +1443,21 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	/* From the controller point of view, we are at step 0 */
 	const int nfc_step = 0;
 
-	if (data_off != *cur_off)
-		nand_change_write_column_op(nand, data_off, NULL, 0, false);
+	if (data_off != *cur_off) {
+		ret = nand_change_write_column_op(nand, data_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+	if (data_off + ecc->size != oob_off) {
+		ret = nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1435,27 +1483,35 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
-					     u8 *oob, int *cur_off,
-					     int page)
+static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
+					    u8 *oob, int *cur_off,
+					    int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != offset)
-		nand_change_write_column_op(nand, offset + mtd->writesize,
-					    NULL, 0, false);
+	if (!cur_off || *cur_off != offset) {
+		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
+						  NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
@@ -1494,9 +1550,12 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 			raw_mode = true;
 	}
 
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
-						!raw_mode, page);
+	if (oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
+						      !raw_mode, page);
+		if (ret)
+			goto out;
+	}
 
 	ret = max_bitflips;
 out:
@@ -1623,8 +1682,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 &cur_off, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       &cur_off, page);
 
 out:
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1747,10 +1806,13 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
+	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 NULL, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       NULL, page);
+		if (ret)
+			return ret;
+	}
 
 	return nand_prog_page_end_op(nand);
 

-- 
2.53.0

