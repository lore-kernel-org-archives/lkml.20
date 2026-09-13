Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2CC388E7C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272315; cv=none; b=o2qUTP6Qv9rJ/YF/w/Vk+T2mGOjK2yclpVzWc2TiFsUtpXO73Cg3ZwYKaDgqgPKeQJdsUIP2zMkQMnz6scsRdRbmrszgl1HnEiodJjNm1KxWrElO3y19RCjMIM0BgLS1UeVvZI01fw1pRB0nfgcD4yWOitzGloM98twbqxt/qPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272315; c=relaxed/simple;
	bh=7ad0N1K59n1v3Jr94aTA8Zx53dMLKuYLMcOiZWOAZ2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+qIIzkQV4BgR9COuFsv+DWvy9mBrlDw6UUx5g60aUEJAol0aU0UjtPWkCpkvhrGBz2VTqVt2MgJ91tS4KTV9q/ElVfrnFJj678QlROUNy/yOVYJGb58iG3Me6J4LohFxO0anay8RYnSQ8BZuJ7a67Z7jZopN9GC1krA4UOh2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISJRY+iV; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISJRY+iV"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f4e729368fso2426526a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272313; x=1789877113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=;
        b=ISJRY+iVAMHOvV2rxFgZZbY/U+8/EyUo2wrucZPwTO2RpOOSNOXDVEDSz1Ybfce1ya
         Nmva23omn++omdYXMi1GpfYEIXdl7PwtcR7oFfY/hctytNH1jz+S9Rbmb5hSFHyC6dYz
         uRxRZNMXKZ7HoFwXQQyy9iwNIVZ9pNOnXyTxoCTzAyz1u3x73hLGvMhrvYaT9+jS7bAi
         SuwjZw3djysqXOUS6nQ6vUS9pzz3fDg2EZblrH+5Kw+cnT72tGp9gwVDB6DGZatyM18P
         jimsv12mVEayAKTsH45+7nvbAbINJ/WBS79Y2xthaSH4tNxcw9Oy7J5rwyrdS2Bw8QhD
         dpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272313; x=1789877113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=;
        b=i1Q5f2dTVzqdSxozk4qDdKTwTU7i7H7vm1k6wAr1SjDJTi8kOzGhVuob/+H0rtvAFH
         HbPvfL5vsuGATfB2CaGvZjswPHnWtboPqmccgL3EGDIwAHXtHNJOH6bBJQoVUbrLR8os
         3kngaICJRkFaLcIjmNBnpcmB47SnO59Bt+ScdUOx29zid7Sne8uDywtn//hjSQbD8YAs
         fFewJMGn3BowKuDj1ZEeBcjdlzORhJPAIhV91bCKjO0RYY4sWD7F+I5uS18h6yNu/u3X
         hKCkAJ6X7kYxNoD6hX3yi35DBXXG/YM1LUFQ/++68CaiVFeX0xfwKyGNy5PAsCJ/Fh3u
         xCyA==
X-Forwarded-Encrypted: i=1; AKwUvBwlRmbtnewwJ3kAOmQHm2K8x0l/IvjQeEodAafzddW1fGziL0PPhnDO0Cq7yJM6qlrYVcjad9+ki1biWJc=@vger.kernel.org
X-Gm-Message-State: AFuF++nOOnrBmrcZIZ9/E5NPwCFdMdbnzwWGxecv0qFzrWWCKbesRImZ
	sYkDxFD7NznF5fK0Vdr14fWfMVIFNCVlJP3RLxGpIXUGSH3RF1HDf7Cx
X-Gm-Gg: AYBFou3f3n5It0keDypb30/qCa6H9y1k81IS5W8R5ut3L9+dBkvgAdyaNSz55vdEfB0
	NInxomhmCdPOFHsPxED4IStKnSyMqNkMOgDhHwLzAVfihi0OwQs0Rb4LkqX7M1/EhJludpmt79/
	+715WHybfinkaEX9nInFlqAFWFZdFUm9R/3B8dhjB1dnIZ7IFOaIIS/rqU4JwC6SmT5v5WxiNfC
	Ipc12e+wNwniWEylPBc47tpLqSG2vATdtVEnNhmNj/zSUjURkwymhO52vydOHFxARzjbvY2SDX7
	U3KiqAsZofurOyvimXiuKNtGz27DWmmxL8jCDJTJlKHt+XxMIJ+cr7L8HLCNunHN4rV3r1OTfK1
	q3B2B5gHH7T03H+diyxL00CHwoaEi71mhKEhNJapQ7/HcHEpOafO3Rhu62EDbeVAap7qmFJ7Dvo
	u/gYsQwZg+A5fa6cJ3TqCdE7WxN077FHpRwek1KrXL4J4EDo6SwpFGIEQvRm/RnhIe9DAabofo0
	g3LcKMB1Mdr/mMtHTWI0ntMOV6IIUW8yp0no+GXvsw9gHxTgrR0NiRO1PVit/uEtpzTf6UtcBnx
	W71OvlKTspbRMmeGkBBsbVOhHUpUbK7Yu7Oq5LixUw0IVVKYhjsUn2szaL0hEndTtRSTX2l3Ang
	UlgUy2hrHVnb5puqTiLXjmfnMyWzkMw==
X-Received: by 2002:a05:6870:6111:b0:475:e235:902 with SMTP id 586e51a60fabf-47dea515f36mr7446958fac.32.1789272312951;
        Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:55 -0600
Subject: [PATCH v4 04/17] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-4-4a64bed94229@gmail.com>
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

The PIO page and subpage write callbacks leave ECC enabled if a chunk
transfer fails. They also ignore program-setup errors, as does the DMA
page writer, and can continue transferring data and issuing PAGEPROG
after the setup command has failed.

Check program setup before enabling ECC or transferring data. If DMA
preparation has already succeeded, abort the queued operation and unmap
its buffer before returning the setup error.

Route PIO chunk failures through ECC disable and return the original
error. Issue the program-end command only after the transfers succeed,
preserving the existing successful-write sequence.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d5d8d383b6d1..5d88ad3b8f70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1610,11 +1610,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1629,14 +1631,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1650,11 +1655,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1670,10 +1677,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1712,7 +1722,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0

