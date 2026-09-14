Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D603536A36C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354927; cv=none; b=f1NVGcYp5Un3OQsvdenKOG1wYGBM46sVxmZm+6ZJfVdYR+8vzJu5eDWHs4qre0QcEJKEmaW4vOcMYw1NMmHENU2xVU0MvJ2YTjmmOluS/TsXuT/C+5IYLJH5ConiSOXZdhtBMIvHO2guaMXBchsrLLy7jJgPDz62hNj+bvZIkYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354927; c=relaxed/simple;
	bh=ySqoYQ1XnzlLitXctoBmkfL5K98OvUxXEwUoBjaPCPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jY8bSocQgMcYP6cx8BUMcBIlhcgYXqRXSSzaP5SjDlAt+IE6iU2jjG8kG5Anvj93t62c9S6fIUd8AHCgxSaRXn7U4bH2Z5SoTL8ejHj3NUtqo1n6WkVhlkhkRUmfEDa7sOy3jqDq2DCDNXyqeq599pDo+UfLyAZ6vw77RpcopyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcXjYGQr; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcXjYGQr"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8049e44d0c3so2350417a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354923; x=1789959723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWbz9jOOwHMkOzJhcyeNlTXZtZx9bja+bTwtbiwOKWk=;
        b=VcXjYGQr5EzSNkheN/pgerTEtwxKzp7tQydtJpRgumjy1HOTLM45D5nu/feXGyVXDr
         4ywL/K4sKCk964w0F/u+bJ4ovFON5HI46vAA3vzuxsp69HTAcYEz3JXEQtAGR+C6hRfk
         qvhOqdlTy8UqlJ1snYPEgLLL91QlOPbdsCsK2mFxzvC2TUZkQQqp0klIa+4/YqQu3rA4
         bR6dwZxSWB1ItpCWqDfWTXmEQNIToa0jGMa1MvvN3TBg/Ff9o/0U85vkD4tHtmtv/MW4
         s2+3CNiVTzp1hqQ/Zqb+gbOoELq831HCq5YZavOuWejeqvlRnBPuOeNOlgBV2horHoGu
         oz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354923; x=1789959723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWbz9jOOwHMkOzJhcyeNlTXZtZx9bja+bTwtbiwOKWk=;
        b=lYap7bKEvlrDAlz4/tLPbuLM5hVwGFjK7tLOmEeDjcLLg8oLDfmTYyNyNlwbGhamQ7
         6M3b8YWUT0YlWNH34GGnUmzumyegYeyGLGRfWZLoIeh9aY02jFt9hbdKLexRh/uBnWf/
         l/hpnOaBhLirPE2yfoZPi9lU78WKFccBRpCNPh09TpizaNZW4wShGpLsXft1Ya8af60i
         ZZY3T/zlUK3upxBzsr0vw6Ahw7/tE2sm9TPZOtqT5ltBgVfsqIBHWiuiLJtBVKtLMVD0
         ifN2rfLtK0RYEQ/Vt03GFjWZxqMXa17YhhjprOTwA+9Y7LhLusbIUU8MgjiSx87PzYsw
         E2TQ==
X-Forwarded-Encrypted: i=1; AKwUvBze+3eLysI5RqpCHqmfFC0K9G93vce0pCl3X53ulR43wLgIBFbU+BMvpbxszIVlK/srbrw0bUCQXOHf3yc=@vger.kernel.org
X-Gm-Message-State: AFuF++l3oXxU3Aqsr83lD1iCcO1k7PRiM0FoVwnv2CUnoalA8N8HMSMX
	el8TXC0oHZn1giMoiyFPjV/imyDg2Nfpf/RWT+oXdJzjjBxPiaiYX3GL
X-Gm-Gg: AYBFou0EW5nGeCp/Su6x1dXesPIgSFIcA5vmRKUOd9VxtKa6ORa4p8HaGvTLL8yoRga
	mksfQB7jmDu4zPoRAuqbqnrPLyv20y8KMLw0gwfYy+gMnNkqXQZ9GdAMzWleyAwcAzwO7+94RNS
	mW0VQ03Huzpsw0nngPczaa779kvsxSsidjaQvChfBxVrj2hWpHiZBXD+5H1T1sHSx7YK+mz+NSb
	LRfrCCGMofjD1nAtE1PMr4RuTIIw2oyvbxTtf07TmmLSsiMXpBOYA8qSVti7DhFBKs7IRnLyazT
	7oQ49R1NMy570Z34mBoL2oDmR2Z9XAPA8IOrkD9MBKI2zT2wlyQp/c4WntJO3bhgwd0KcNhaa7a
	YzUyz42E3QiKbl8W0Wb6GoQS1fvSH5i80a1eQE3vNFCadvh0EgA+Y8bjTJS4A8lZPxjPA6+DXV+
	lcn4tNrSaqArxXeMrWSRkQeCQtLGNxhyvo9CVpXuGuDsXB3ByOse9G0KodY9R+N6eSbqqL7JtE4
	AIuWQJxO4X2CN9sUISNhVyVOpFSMY5oQBadcRa+qDW3RdnVruYrLwiRyOPvxRNVATxZfnyvEfCg
	o9Ng8ouKT2ryvqisOJVUoNUJY86ZTeDPaGGHLXswfKFCEw8UNyE98yy9++aahhy98oIYZmHhQPz
	1Yyu5jTKGCDQsD+X/aCdUARgnsk+1tA2sn3SJmt+X
X-Received: by 2002:a05:6830:3888:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-80897489f75mr263437a34.6.1789354923503;
        Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:23 -0600
Subject: [PATCH v5 17/18] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-17-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
index 4103337f6a07..2b8ed142c9bf 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1005,35 +1005,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
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
@@ -1223,7 +1248,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1540,10 +1565,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
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
@@ -1733,7 +1755,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -2037,7 +2059,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -2045,7 +2067,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

