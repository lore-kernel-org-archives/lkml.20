Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEF146C841
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420229; cv=none; b=oLkNB36QI1Q3ehHhOMRUrfeGsDgwZS6HGa/i8KhE05yTHwzr/Vv/OYV9Uf80GW+NF2oWoACJBFzSlcujhIlermg7zy7zuUlNcIqt8DreCJEXQdL12Wm21iDP2TmPP/+b0oVIAjLQvHTUT7D/N7163Ncs4OkpEFuqCBwwUTuIQgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420229; c=relaxed/simple;
	bh=Izml/kmhnoiBi2LFA6kerFQHV26tFgrWjsTUcd1Th10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vdm41p/vcOciudMC2E0AgP7242ShW3WV0NODx6inxlK0NTxHBgmYLLDUxouqpZw4lflVYhj9gEjM8KcIWWdfjTRtuPWDVedwr+eJo6zUM/Vy5LQWJ4yAz+hbSQ5+VPrb+4qu5sVR6SBy4XxY8EoPjlPfZr3AHce2XsqlduABEfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/kx8L1c; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/kx8L1c"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c537df4daaso995123b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420218; x=1790025018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=;
        b=G/kx8L1c4pN4ncVrVdEVAm2H6h86EGaLdaQjybD7kAaHOreWO+ArbwK7VEnChiWOMx
         HJ9u9nWXhmZVGQYCUHWwPiuASISw4sUOXAuDcjidnlxe11M0oZCGDaoXCXvr+9v3pSnv
         slGYd5a2TlnXU42zxcTXs8CJOA4vOh6ejoQdAlhM7FQVpCWCjtaHl2uYpuHrDZYQMV2L
         yO+8SDNqbWaJ1iMExsUWsN+UZvMyWYnGCmX9GR3lJJMn8N4MKl80XJPwry2DvHlL/jSs
         579q39mGojyEi2G8vicUfsh09kveph9fTs4Q7n2btPsXxA7LezHASwANlBIw4hckD6G4
         s8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420218; x=1790025018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=;
        b=TlRk581kFiL184AxmAxftNgiKDhDGp2mLeIoHewE+8rHcRpz9uXGM1dv7Yk1f0kLlL
         Q6H386S4x3BJMOZLZ5i1xuKDCYhtb/AvyxONflgHnqy0io1X9rNaZ770ZaC4JEnbOK0l
         Eb0A0MRUkV5QnaQQRNlc77YAp1LvXM5ovZBWSxF2UrjwPzlhPrXCwbCBa68D8GsgeUUR
         jnNjfGGrk/nbygTHweKBH7VofmWCR8sBEeqqVQ8QBMVssHebh+n5cyCPQ1OlrBSN5m1c
         lEoZ3vIKVX7EuhXjEuLqCjNhSAhJUTVsQFL61G39lGTOcZgdyCTMhSiZzthTLVdQfeA+
         7ipA==
X-Forwarded-Encrypted: i=1; AKwUvByShm+mOXH9k0ibHQpBy8puH56Rxa0lMsMa7PmH+wwOWuGrNDgISvJCrtbecCG0tsgnZQyf4sIxByCsnVo=@vger.kernel.org
X-Gm-Message-State: AFuF++ngR2PS3L8t0goRK/BKDJl2N0P/ctVlZPWN57NKpjYEOTiCg84r
	NraSPTxOv4jOCyuzqUcMZpvScvzKe805kRCZTfdnrECTWq1oqfeSy88Q
X-Gm-Gg: AYBFou10EFplcuXU6ALLbI0TuvaMLhP/TlkftxUfGbvC/9Q/dRByKJnxx6KWC1tyM13
	wZnEJEjAukjZ2d3fLPIPaR8ys+ix3+ctb8wbKjjAk16xdLdQz4pw/S7x9zPRHGscrMEEftBA9JZ
	sVLLzBBlkzoyxJGJrsm9o8yhA2j3ESPTnCoXlYIUWvYNi+XoqLIO8OweCQrsYgmm4RQSQfmAYty
	U4IQ5hVfmXPiw1/Gv++aK3PTr00XOkBIzbDBlT1R+qBHwX2/8CBj00xbo+p426HFqkjgiWl8KrK
	LhYUfJ21tEEQ+a8rQEno1kSVTEWDttDZIjFGtlnOkTLhjW0IlwGD3+p+FXzulEN/uXTYW7VXGbN
	bzuTuA65LQYmFrOHrjJU+GqfIiR8BrDlOA5xtfEGX7BIc4Yf6LiSy/ZtIf+GV54HY51V2gA33gd
	gMGQ00bBPeSaL/k9o/gWk/4OfCKdpnaKnX9FWcviB51VNiEbp26ZwFs8C866rufafC/OdOzZpCW
	PA5Ou9cypImb0rbzXTcKD0ACH5/QxqcaCZSNaQPRp8V+ckD8kdDWHj+pAB+4rDnpSlsLtA3cZx1
	ePr9R2aQ00v76wBHVl36P3EmzDgCvrYyeBn61UpSnVC8WoG2l7LNiDREBxClE3qJlAmt1rpE2Xe
	gf8y+JGx733+UiQvYYWLczihZe1kY
X-Received: by 2002:a05:6820:1893:b0:6b7:8396:f3e3 with SMTP id 006d021491bc7-6c542249981mr2544577eaf.69.1789420218531;
        Mon, 14 Sep 2026 14:10:18 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:03 -0600
Subject: [PATCH v6 17/18] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-17-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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

DMA reads and writes clear every user-data length register and then
read-modify-write one field at a time. Multiple ECC steps share each
register, so this repeats MMIO accesses to the same words.

Build each register value in memory and write it once, including zero
lengths for unused slots. Reprogram every word for every DMA operation
instead of caching hardware state, so controller resets and switches
between chips need no special cache invalidation.

Share the length encoding with a PIO-specific setter. PIO always uses
hardware slot zero, and its page callbacks clear all length registers
before the chunk loop. Write the slot-zero value directly instead of
reading and modifying the same register for every chunk. Keep the
per-operation clearing so other slots remain zero after DMA fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 75 +++++++++++++++++++++++++--------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 773ba55ecc07..41d6ef31ea3d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1013,35 +1013,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int hw_step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1237,7 +1262,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1554,10 +1579,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1747,7 +1769,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -2051,7 +2073,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -2059,7 +2081,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

