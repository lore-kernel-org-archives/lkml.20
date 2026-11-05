Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904969;
	b=2G+2GeH0UNQaTJLCIIjBf2MvofOPKPRoByutnY1YgFDEFVqSEMRE2n46FqQunKbv92ze
	 CM9X1QwAj++z8xq0nBLijFIE7U38vcyzv+R6rkjdIIBfD4qULQsnQ8PjL/rNBl+cDnpX7
	 AIpsOOsPn4Ca7QMsby56trn101VPtC0ip1LJkeJARg4ScHau32q8Nu7cKixdDReA7GyYK
	 NE7J49KVkG2xMi49G5Le/9/xytGxYX5tyw0R60zisJH7siY8/YySACiIosfa6tUq4uyx0
	 jm+IfrtR37RfU8nBarIi0HOxTEUJmOEHLadGO61TKiTkJrythiVHWI1WzsJfWtqQmrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=;
	b=s/BH4vqjOOpnVoSccC/erqOxuaabw7Zt/Mf/6jykegaehfcAPZsTBEgcPpLm2EUtv70f
	 4pxbngi+IRlz6ch0VwU5XqRMnDoF+L5nDSd+9IerebWe5TpgP5nDpcN7Kc22FAZvI61zC
	 NTSz3Suv0+stuO6Th8k2zKIgLiJdnIwGdkQ6LcsCdRWslUf21lLcw2GkUXU089KrlVuMg
	 hpnvLhTrTQlz4eCvWBbtGMl/sOMHzFewNMRpJkC97Y3bpJ/b9F/kvptDAEcHufj47YIl+
	 HNoSe45E6cerBQxwRFK2C9zXoZRVw5d8FbE7eRrmskZa0jQWK/XlPP0A2AMGLfXrosg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPgOSfbz;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80660A260C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E80660A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPgOSfbz
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df5e315bd1so1891812eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904967; x=1794509767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=;
        b=fPgOSfbz25Kk++AAS17UR4OeJhJ6QpPMMzH65MENyTLbOzSasnXSkcRaG10WOYZPrx
         H6dNc/ekG/vgGEYUp1fAwwWZ3gwKUDJnCoaZ3yFpSczFZ88liQ0olKO8jGMwashMgXnS
         rza2WGYNEgxL1g+LnfL0eSo13evUOJGvlw1/Y9P1HV7bh5z2tOI7z/NTkpbZSM5JCnFH
         5WAmuPrX+X3Xy4k9m5zcOz/lPS8wv8gGK2TdamVRpjru8PsV4zgNcq2+YjHXxWVAV8Am
         jt5ynPZGl8i72zy0ckrBrFFqfhD9zDX5wUpsEb1mX/FvZheDdaP6rULXQmW4pqnJTUcc
         k7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904967; x=1794509767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=;
        b=LXXqPpHzeis6Bd6AaAyW7pp9ObJHhLO4Y8wEDEQd1QgF3yX5SanfeK4+mkSzrmjzkN
         UApCU1kBdU6ky5L3aGGIJwXVR73278eZiVJNrnP+P3X+wUmH1foqLChKVagT7sk/Cto3
         3OYfq689r8FgCnjsjRVhsEfBnsOdywWQB7ORM8PfGVny28Hk1Y2sX7qJo55tRLpA0cix
         zYvZagbDMrejUunxXjhfEXfHyI4XFwO8zAB5sIz+X2JTzHx+4HcElzWLulCd/7zLbtvn
         nEXpDBRqW5IvhLYUScxxS2FdfeCEO0+lN08eJCHrivBBY15AR34qVQDWioALa0/e0tdD
         hLhg==
X-Forwarded-Encrypted: i=1; AKwUvBx6xoxH5qAEDBnMhgNciNAvWaQhNi5u5kgJANL8FoI4vO0n8shpQNuteK7nv+Dj8PWiAGiCJfYwNgdQ6tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7sx1E3E+RPF40agciKig/OoTZsO13faqOa8l2KZvqbF3WqfRB
	Jkmjw3YpQoG9U/l/A0RfJLrIwmYvNruERmF1pTvxjGGbwyFsTWvDLp+e
X-Gm-Gg: AYBFou07oot0gMEVENeAMgxxT0715A9Kwkuzc7s7XKT/AdjhEM5yU3pv7btSQaDFKZb
	aC0BbTVy0WJ4n2TlaTulxNf6g5m55X2WeEw0ORVgos0wdv0JCkPvXyIMcx/yJeDDH2AF0QGKAaf
	oHUkLGvDgm1yzOvf0JtuH6OpEJG4Pkf87eMCGUxGntO7NSlGEBbVxojc3mQS9za+PupXZSfa1LF
	y13/ZUCJhQDyCoFYonsmRedKskFhB+PxsbW9+CLTycubKpd9Z+AMyfJzYyvaYfAg+UBs7IcN682
	koEFztXi5CzJh0ylIR4vPul3FnW4NypDhXN6H3tNieCocvksnHLiIL6GFqMBtGTQSnpWHsAnzuN
	jKytecqDZ7hc9f13Dc8zA1kzxDCSl8nWk9URTVzOHMyo3RxQBMglL3jVsS2fcSdc713NXbV4Efb
	kPybLzzNVlHyffr1hZqMHgjDyyOuhlJSMYALmjubKb04hLYrsg3NRw9BBFMAbMeuZitIZttcoWX
	FvGUYA1Hm1OcF+JW00kzLcJjNcsxESsw3uKbXbYEB1BGus+rAg/xnBFlW1f/1OYca+S8DFsTB/M
	al2PUyvr+uSyhCm6ANR4gQuVPGsOWUd/jIOax1InLk3qCQF2Tbgqp2zF0EEBS9Ee9L6OnoAIgmu
	ZwGR0dGvfC0UMb/+EiOCis+bNpgLiGOqTGAIoD3VXkn2xwyZ6l91/OyWNnEajJIdNqr/pT3cyZC
	+BvXLv7tyi+1bfc+bQ+GPfRZs5r4wDLhGR0PxN20ICMJizdZnXoyjlGvDd5u5VR54ej531vBumT
	A==
X-Received: by 2002:a05:6820:7408:b0:6dd:4f30:258f with SMTP id 006d021491bc7-716e79ad995mr250479eaf.56.1793904967200;
        Thu, 05 Nov 2026 10:56:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:40 -0700
Subject: [PATCH v10 24/26] mtd: rawnand: sunxi: reduce user-data length
 register accesses
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-24-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Code zero means no user data; the other codes select lengths from
the controller's table.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Share the encoding with a PIO setter. PIO always uses hardware slot
zero, and its page callbacks clear all length registers before the chunk
loop. It can therefore write the slot-zero code directly, without a
read-modify-write. Keep the page-level clearing so unused slots are also
cleared after a DMA-to-PIO fallback. Older controllers without length
registers remain unaffected, and the chosen lengths and on-flash layout
do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 79 +++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c9135c8abf54..814331e16bce 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1093,35 +1093,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
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
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
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
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
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
@@ -1517,7 +1542,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1546,7 +1571,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1567,10 +1592,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
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
@@ -1686,7 +1708,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1955,7 +1977,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1963,7 +1985,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

