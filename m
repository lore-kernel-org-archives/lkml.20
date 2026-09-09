Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB57471CE9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942677; cv=none; b=ABdWeqH5BSQUcCqB/Cgs7hs3qhbXIVs+AdCneoT7dd+W6HUDJXHWD09M+dHoBtyYgQ6BORY5+o2eIIMbwcnwGUUcRGvz0TLhrLVy2zBZ3NdRKPDTvaF/1hLBC+dR81clwj/U94Vq5D9QAfYS7PQvl0lxheayNAt7lNL8V4skNZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942677; c=relaxed/simple;
	bh=4II9N3xTKSJHWx8rbwx7Teb5b9LWc1U4UIiXg8Tsx4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7woq00Kq9zC5YGiap/1u8BcXfj51I2UZnNd9XU9Hz68ams9cpTIXHw29+lJZj2RrFIklQrQ8g/0cVjhorakRdpulmKozSVDcJnYjyyVL9O/ggjUZj4iWITNzJNYv7FNC0JcyiBpKWnkwo0XCWjyd20y+xNABLTBDoDF1rAdG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhpXA2rt; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhpXA2rt"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f4ea388ba6so5287884a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942673; x=1789547473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=;
        b=JhpXA2rtfzsRRyt0KCXKZrkmkP9EbY2mnUQTNmOkw9NjASNOei0ZxmXB6Hx14Hd0dV
         AGyZJ2pR2oX1LqyQRUQulLT2O0PrKVTFb24XbSKzeaC7ytItlYobR8kfuJtME2rftxjF
         6B2BnHckMM37eXofxYD5RQ+n4WPH//w6+7BJ9jH6GctoPqsT9W31PfoEUITUW5xMsSLB
         S0vMkzJ/j29/1ZNhXqbJHyJAfayfyFIuNs8mYCvuzUZgOD2Fgb4rYP9thEeleYhyR0VS
         TQ73bVOsLqyJ1vnSU9XWCPtopF7908YEHd+jerlolrnZeFvozoxgrOQKlVWwOGfFyiHz
         cqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942673; x=1789547473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=;
        b=Xm7ALJfsfC4gb4ySmobj64LJ4xlqjEqaGm+KwGfdwU7K2CwhP3HoYQOC6mElhl5A8p
         SKayxQc9xYvf9WqAz3ZdqL1dP0xplzi7toPj3e+C0iMJxMuAg47KwzD8BYzHtrj+cQxg
         f9NtW+m2Ti1arNpvsMQKg4HA40eoGCRLj5XhdfdaPhjVNDyvUR307OfHanSdMNScZuqb
         YXOO/OrLssb3B8sa+ZD2Ek6tWwtytiwagiuFMnbjnbOw7vOZL/BjyYFngPRrKvmrzSj7
         1VhdL28j6TSi7WmzCzpCc/Qk7pPFKLsDm+E+6rs2rSkK/r9g2UOj0hz1ssDOmNSUZNed
         F0fA==
X-Forwarded-Encrypted: i=1; AKwUvBzeKr2yxmsRf+exWB9uiMzuu1X0mLfm6oJJ0WN1bDo4K8QwNlRYLFwcYYnRVU5uUnRaH578UFyjfxnAygM=@vger.kernel.org
X-Gm-Message-State: AFuF++k/COZsoUnxJZN/BnudkEnEdXh0h29O9DzoCEICdu4bzum73xM4
	85IPQZVIDEUv+X5rtnsioQG6lmkl26BTB84UTJ4OPgLXKIwRMoTVirjH
X-Gm-Gg: AYBFou3+z6wDgUTnlpw/buOE65GSan52qCyQqZW2/xFF9y3/d1hJsHdBcKdW6rzyc2q
	0ToOk1qI1V/j1iq2+M0VF4hOG82A4NyVC9/qlLlGw1+dfBY5B20PhRYRFSg3OJLeiF7+GR3PGVu
	ervYKJlrbP8cIpO+TlFQbPzMKiSppwN235C12B3sXe49nM8BVlUzwkbIH15BaD11DM59kNxROKQ
	A/8WVsCEisBrC3ALzT9mF+Z3VPb2ccYRHSkpOuC1dEt2ioHmbs2B47J/2oDGGhX82okSMMMP/kZ
	X2cdyZnWroaxhw4emDSuPi0QgIpHAHQW3hLHXZRw0ctb2gZXzFmy8bpELy5vth5Y9H8INPVfG31
	yJ+sIF/CTWfglnt+E3QNF8qyg7PlnpoHgt8Ia0xU1ByY9KyxekbXhlMHuBfuGYjPDaGPc5I1iro
	OhQRTX4vrEL08+SV5bHqiZ+Dn32XKF40IlqVYwiZX0qBOIX1f1RYcQypFX4rCCB+mDLhQu+Wfk7
	WHhlTTDct2VardOqjLqvXf+5NixwNsimtqRlmUoNxxbDKfETECI5TzoQQi2ZSRktXLqKQ7Dal7F
	om5cxGRWnOLZf/jEhWY11KQYGuunujbB7yXlXo45PJ7WfWpktgLCxbJdK8iK0G0LXSbmHmUee2/
	tizjXXb8YUT6KO3lCugem+wzl6iBruVXpGwk6Uys=
X-Received: by 2002:a05:6820:1987:b0:6b7:46fa:16a2 with SMTP id 006d021491bc7-6b746fa1a6bmr17306489eaf.55.1788942673434;
        Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:47 -0600
Subject: [PATCH v3 14/15] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-14-838cb0ba1547@gmail.com>
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
 drivers/mtd/nand/raw/sunxi_nand.c | 73 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9dc742ee4344..1c1fcea69108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -996,35 +996,59 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
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
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
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
+			len = sunxi_nfc_user_data_sz(sunxi_nand, step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1213,7 +1237,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1524,9 +1548,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1682,7 +1704,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -1977,7 +1999,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		goto pio_fallback;
 
-	sunxi_nfc_reset_user_data_len(nfc);
+	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
 	for (i = 0; i < ecc->steps; i++) {
 		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1985,7 +2007,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
 						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0

