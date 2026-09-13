Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F4388E4E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272313; cv=none; b=cwhcyoFJOpv7uQLDBIevdC/1D7R963TCjQu2r0rwM0LiJhV1yWgJksG1ENRJ9k+Lv9ga+EtZ7f9Bi8rc6u+pYgYtvrbHXaZXWNuXx2IKTPMcwUUV7P2VmlMjwgqcIYnksNhFjMyvfZoklD0Kftg9QDRtYP3hZmbAThJdKITLYdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272313; c=relaxed/simple;
	bh=pCshx7KzarhNGja6hjwZgV+xF1fwWKykuklNPxmL+JQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/0SiMa+Ih3OW/EdIPgp2o9sewTivFUJusl4ZKDLbrPpKzh8BDrza3sLz+KNXqwrPp6Xy1bQOVfHX+FQRawdNyzdv/lcgimK8mxZ1JX/2h6RtueGpsGUxGZYvSeUHWuEUhLKYczYLFK9mP8XAk+42nKC2xrryL5ZCr7Ny94d1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sp/tvFuV; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sp/tvFuV"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a36887bso615209b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272310; x=1789877110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=;
        b=Sp/tvFuVlFbD4b35xlyAKhUd217P8aP5knPQuKC4FWwd328S6+AzfQygKBD1juXdVG
         t75Il1yuRi4HdqncDY1QX5jOs8nZ29/6ekFp3CAuaGgyUz+6u8UxdKH970ZlFX5xpXwJ
         HwrucUROkh25gBtQ2jc46HlIRd/zNv5X7trDHsAFaSRgFYtsCzHMb+ZUOIcDcSVL2lFG
         FiJiWQt0youwYd/o9dZEgOaBe4yWsdqKhiBUCn/p3S5uymVkVoe6RWyO0ZzRHD+pqlvX
         nv2b5pmBv/O7nTvWe6v9chrEj3JfJW550ki8HeP4mqg73MwMbZbV53oDfsA1MxKByWq5
         94TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272310; x=1789877110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=;
        b=SUBD6kyST5ui3tbkPXoYEJT5sspTDlH9GBNkMv97ND9BAfNgK0wJ8rICw1yS5/KFTF
         12SgZs8tv2I1hCPz0sm1Qhy6aV0JBorOdlq6HAKwYErYTMTjCsSH2mLqlQkkWS/45J4t
         hmVnc8Ezx+zb0eV/3QKnaG2ZPVoaUYsnFajHIo6o7SKtJI0biv95BLOwiXrhV5M/AVx3
         tVKXr1MwQHTrQNHk7ENVJSElXDnDfY4ynKurE2Drjldb507+bwAVfwdVOL9CW5FzfU+v
         rXSy5AVUvZyFQDRKDKJy8zYipP6+fJl+JWrqzsCBvWm15avxtpi46jcKe4kD2un7dBWJ
         QsrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYIEJtYisVmw9LfLFDjHxHa0/Cvdc6Rs1iZtyTI5RPuU0m9dyJ71ZGE2Nw5osPgGEzqGzCzD8oSbgg8rM=@vger.kernel.org
X-Gm-Message-State: AFuF++m6AzhYO5YhZmCkUOyQIbUQSIwrrkyILnDV2nI+7aVUcm3VhoCN
	ZtyE7AG9v0A0WHGhhFNm+EvNxGVdCKjmyN4f8PwOumMIh/xd3eFiVd6w
X-Gm-Gg: AYBFou01vhHu4mMV/PT0drwOYVQQKcBMVeP8hXB5boRYGI5b1T79eQGrwDf+qlcD1Sx
	+oO7PJ4IJl9PF8F1XFoOeOOdH2OizpCCsKnSKQhXnka9eiNS9cIWHR34wtRRZjDV57F50ilxJ/6
	pVl0wSerRyC0B0ZRnO3om9XUb7d/Ec+i5/8HyyBO4jo/yw2WuZUjS4NvA/Si0ZqcavPMptLwQst
	oJxIFdddh2u+ZozXX0Mpnjo6eB+PbjQlr5vxmDhYTjp6/3ntY4I/PUkHpzorPRvt6rsDMVhCfVl
	enTUNBy8hjRrsOp6BffcaGi3nJCYa0v/OKX4RkudZKA4l2+5DhMDfai6tG18H5tgG5UgfCsq4B3
	aNMx9TR06EmEvGMEXh0Mobl/kzz6x0ZKS0C7V4CAQYYEE0/3z/Frxq5kBvwUYqbOD6chi7o+gY2
	TWQKZdxYZCIuKC0SVvd9P/Uj5yv4c9ksWKn1X4SZl3RW6oHChrWQ6jUdts4mdRoQPpwzdLroPFg
	d/yVXObm0zBNmWXBjOcCdHX0rfEwMgEzYroNUPUUMxZNmqS4o830hkTp7ppnwtqyOzD18U1g49e
	IQw+laCKKVCxZGA0PpbLeWJMbDhagb4NxMIK7O11mpBlki6LzChJbo5IRvr3qCTzjGYuuRg1o6N
	YLkUwY6Ey8FIyGkpcnYlh60mcZqo5xQ==
X-Received: by 2002:a05:6808:13cc:b0:4b9:a8ac:489 with SMTP id 5614622812f47-4c31c8306c5mr7319934b6e.39.1789272310145;
        Sat, 12 Sep 2026 21:05:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:53 -0600
Subject: [PATCH v4 02/17] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-2-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e50cf5b6a730..172c7c4b0ba6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1011,11 +1011,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1069,11 +1069,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1155,7 +1153,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1323,7 +1321,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1420,7 +1418,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1684,7 +1683,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0

