Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04F83624A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942659; cv=none; b=JeIJBpx1q8y9SnyH7AneVH9KVsVrU6q1SHm+r7u3ndy3wzqci41bGHD1CGBtjTwUGEdg9SoD1PRYnaRCqkLCA2el98nSu+B7koVjcfqW9qizryQOianrMdzPZu5eccazwCCHPVJi1uH5MRQrEtKg5dlRkpAiWOSS2DRdTfMEOzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942659; c=relaxed/simple;
	bh=JjcfMNv/ryMPrxdyyGEQfKzKotCCfWbAANdXEfsoU6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HNZow5Uu1BINT1+kCb6VvuynupiYOqZM0MmINmXBUvv/nQdEtv3f/wO5iOPSD9AbKb37hzn/yQ7IZ2UKGDysao7RiicpPfqZgpC/k3HWHxrRMCcb8k7nEmVFvaPeWqGl8DUfz6akoAL6Z+WCVPokda1mPaRi5pZ7fig7Y1OlCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWFolYZc; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWFolYZc"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a30eb3bso688794b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942656; x=1789547456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=;
        b=ZWFolYZczaPCbDhcYVrPKQ1+yhEdhacDH/pfYkRBBqeKV9oQxS0gutQf+o+wFigIde
         U8Vwc6caUU2lkt0QIvLxIkf8d9dA2dlcLhW1lfeoRaTLugZSXM8YxVf4Yfg8GsPoryIP
         QIdImxNP4OfytcLj8sX3uz3xO5LVEYwXnihmLj76W5UuGZxi+LNSpDAiW/3wqfxAwQU0
         v0GTg4Lx4ZpX9cMSb6PvmpHrvcGq7mdN++kBZeHIwBWfGI2K54szekUvWEgwrhlKxtLW
         CDhFiDwxaHSLWLc7OLhomQqnINZNu0j7gfjdBrniwXt5nkMt3cxwEBKZxdNDYZ/gCZZc
         WV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942656; x=1789547456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=;
        b=fDSQdNC/q6SPR6yqRbWVvX9QVLyPfCwvrvEKsi+OEV7uoXSdavCAaTaoy9xhh3n2qb
         Jk/22kL19pUky/d4Y9CYGZMdXP2lVRk+Odc4JYI0prlpilaY7izkF3mlWKZ5xBBIdKVJ
         EuxuUrAsHqDIh69b/ECQhHmFRvd0GF05Pm3IQGOh9RTBKronGNHDTvgMObtmbuA27UAh
         faRWm1+57JU+HqVP+b+X6yEQklzuwCbvADbdLbwih71sX5mDXEMv+M2HxTfh5ROCiktq
         PsrsBjOr/4exFCrdxHRna24iOI0qDJzH/B5BLn4Jb30JBWpyNsxNT/rKz3HUXdFCtPLK
         yOGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0sNf4zVRitAfBvJjVi2ZDVyxn8D3Cpj2hi0Of++5hWgB9ONkgbyY0iYgNNLD8gpG0VBEco4AXg2b81BI=@vger.kernel.org
X-Gm-Message-State: AFuF++nBXW9WO2MSpthB9a2HxpXY26VR9PXjdbBaStvpIs/97aLfs2f0
	QASl4bSWxLyPtQDsEJGhK7ZBGWxwMp39+OsAVIMTP6RIy/KFq2y1tn05
X-Gm-Gg: AYBFou0uTc9JKRkNH9swfyeiGDZzyTTcRVdwx+8yav2Tjg06MVXQA0yqmw8XQwN9xGJ
	8DUm/6W3Fp9ACMRkFnQjrucumg+hA38ODCBcYbiqiO9Btd9bLe4IrWv1WvdwgSaX8OLuQJPeAYt
	J3PVec7SF6IYOsMnBHOzky5+nkGz4NfGi46Wbt/0KTTdKIPYnUN2ciA1UPQ7KbabEpAiRIGAPn7
	MF6UIUmfOyrQb7ZwllX34t1ljR9bmwHF6nUHlYS0jLO6PSKnE0bvDDatKW2Gn1OFrbib7Ph90wW
	BK5E9LEHEyPEWiKQQnALHzELlhOY2fvd/Kx61YqfRxAaWA/u2UI/255glgBUrNEtoCYhvQjk0l4
	O5ETye3s4XIRet4dK+E6d9mAHtIU/SRgUkwuvJNiP55CCur+mRSdqV20+QWpNxPJP8VRTsG9/AQ
	GER/AMX44tT46zwyLZGRWvbM0qL9fMcNqx+QVNgYSJLsRQRGHana2lyZUS+p3UukZwfyq8YbddL
	DmzmU60JAuxM223Xi9OSYI9DA2d9GXYzXhATmQb4RDKikZ+C2mJ9JAaStaigTym0QC4mRIeShAR
	qRjrKvF1DQVUF9sPOzCU/LIc8Mop+WxcXZwawapTqNgEOG2x42w74O/s9Jvhl7Be3o++jljqqob
	aSqtnvcL9wg9ULl0LJsEWb8iaA0dn/ld/KXRqBtQ=
X-Received: by 2002:a05:6820:61a:b0:6b1:ba66:6998 with SMTP id 006d021491bc7-6bdca848f71mr4429570eaf.14.1788942656520;
        Wed, 09 Sep 2026 01:30:56 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:36 -0600
Subject: [PATCH v3 03/15] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-3-838cb0ba1547@gmail.com>
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
index 5190b39aec5a..af8ba2d9f7a0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1598,11 +1598,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1617,14 +1619,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1638,11 +1643,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1658,10 +1665,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1700,7 +1710,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

