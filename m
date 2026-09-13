Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7D125B093
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272331; cv=none; b=NNVKAuvvHJSpS9qb2xVZsLvondW0cym9a9IFVbS0fxEXpqdAryC4Z1EqKwarc69GNu18Q7OTNxXewi5IcxkMJE0Mxg3fXs6UwgaFoTKO89jUbxBwJtqwp5SjyBh9JuOmKdB70bOozvPklAIZA5eTDm/VR9ptuODaIyJPmi/bdVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272331; c=relaxed/simple;
	bh=sHxgZAC22jRN5x+cGiwyrOUKu8MIdzjliuwZEPvI6DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8ZiLHNPxfSHCHuwf7OciubwXtitGmnvyNhN70EzP2uOjmHj5Z8FfhVO3ZmuhPEY/9QI3TnqVzVuxqc3g32rFJhT27Mn5RAt4ijrSX9wL3z5Vo47AvA7xkYu+bh4bUyhjgc+izuayMcOm4LGhHQxIhuJWcZi1SwauckNTnsIenQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxbJIMSl; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxbJIMSl"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-451a49abd8aso1815424fac.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272328; x=1789877128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=;
        b=AxbJIMSlE96AdxQwzO4lIX3mWdTw4sIUV5fkvZ4mIY9fQkhDYJYhTaycqHsxTL3yKU
         TQ3XvvI4HfE/DhOXuVIPTqq2DTMl3DHgHfuTe6PQJMciNh0KxLajmHxkhvJfmUoOmcga
         s8eB7rOKS+62d0KJEihQ96eTRrC30gIGV4Xxcv8SW4CmKKrG/yeH1bJ+4z0Zduco5Oiv
         Uf0Fm+TI3whL1uR3tsvsCtD4rxlQi028Wzn1w9Ve2FCXm+QzYqLJY52kTLDdyIDJN9kX
         9+SAGpatOX+V2GcJ50vNuQoP+2V6fKe/d70eA9S3NmVSqK1tajykj38TsF2tXo70QgVp
         AfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272328; x=1789877128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=;
        b=EnPQHmB9qYzoKesWQDj9A/mAyyNmh0wJaIl9t4vQ4r0DSdEEqBC0PVk+Gnc/f0IMTD
         FIL2z5vPaWemfHcfZ0cEy25Tks9kSQtd8GaOXvlIgjuQtiTeossE3nU8CYfkrwA9AfHe
         tHWY010UcqxCp+6Ddu9l/6JKdp1Q0+m0mY1iF9Qwq5NWXrjCpVNiNivDU1azSwgeCOGn
         nun5VYw2xEztaDrgDOUJobx1HV5fBIXSfubl+iUpjgZvFj2heeHuck8kWZWQLVbZFALa
         Z4I+yDFNUTm2px/P+iE/Tu/qPwOWagszkWpVYyXVfudb9jfwnawxlBOkg8LT7uw8Lvkt
         A3nA==
X-Forwarded-Encrypted: i=1; AKwUvBzOIWoAix10rP9Z3f6q4Yf4gMQCAsbQNZSfH+hU7xeuRpIMVR03WPWwB2mtlsZdR6E6BcR1/q8iWKr++vQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mC4Ta71V4eB2z2q+0yd1frN46DP2dEFIGiY6kZQMyf8p2Wn7I5
	+DYD1g0zm+oXmOA8QiojP50r8CoxbZ/TYyedSf35JT6UCts0rUk8gEia
X-Gm-Gg: AYBFou0IzMWPvGcjYMmb9T3DspoxVh272z2OrLl2fqCpbM+2et+FMaacirPSBziUtL0
	dGpeHa0BhiWgH1bMwhcPd5OBEAUCqjm87Uz3tP1R9Od7Gbak4mxJSC+04nZ0+9vz9/Rz3Pyi6WE
	oa5s5XO3RgOt3G432qUSqJu251hv7T1oVNWh9r3QzcOylrnCIrVjxp+erMZq7peAq/zU7sm5Mtn
	3ZNf4w1Xx0P+y6Vj+gGTZEAJd6zNdAm/4DDEmYkmxCAXkHP8wM2wlWbga08BTZBuj3xrpVql52O
	UwoqCOowBqoCWLhD2iEaOQLmznBrGFOG1WP5A01WUQdfcs59wP95MtmzQJ1JPV6vj5fICQncMjh
	VfUK6SLl1LtmPifs06JKcD+LU/sPV3lc0FVX5lL1XmWLJhszHRuhLdBjpb6N1fOnuiCtEZ3rAgc
	j9yr0oyjRcIt/fm0o1BMLVL4j6ro5QypmUJGnlCMTgQhZjUsfox2asz1oO3oQ6TAQyzQbgKvYCT
	JSc106aUuYYMNMkfezA2N3wMMbaf19wAm/gEOcpsajQk+ouelaSCYUdgUPGW9ZEER3ryIzzYSMm
	CWh4zNJb2uZlT4L72LTPp6ZragjLfMFP9J+NgZdTxTMz1XTMKjiu0v2ShTWsry0bSPjDqsmNicb
	CtT9Vs10wIaaZEZV8+yv09T8CowIUKA==
X-Received: by 2002:a05:6870:d307:b0:47d:a38a:6218 with SMTP id 586e51a60fabf-47de9864d36mr7458245fac.25.1789272327784;
        Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:05 -0600
Subject: [PATCH v4 14/17] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-14-4a64bed94229@gmail.com>
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5fba3c111a4b..84e1e04d0743 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1755,8 +1755,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1805,8 +1803,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1835,8 +1831,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1877,8 +1871,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1902,8 +1894,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1947,8 +1937,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

