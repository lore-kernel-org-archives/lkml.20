Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC24388E43
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272314; cv=none; b=EGpXZO6ozHABAn2ocQIxUZuBDEO6M5pIAWL/2w45klx32GfLvHTJzeyx1qM0+yQNsQD41GYhrheKCtsf7fSwIrKS0BREKn/fCCKLyGChFietREHfcXrnNaVXCCSXULw1G58N/pSKnXCUSUaQrt0R8NEbD4SHmwBTqN00Rjxnb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272314; c=relaxed/simple;
	bh=1ofTSNVZqDsQSHKXpbBSZfkmR0m9OTYZB1KI3A7Jry8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yjf4YdsGxFWngFsQVufIocD5jeCo5tbrUJABgQ4vTKLgPEYWMDrEvJx6oRZ+n+MK0AwzgDGig3jcQW97Bcw6ZWJgdvsqNCVztQlds30egqwv7Zn2gg+SH/k7IgikRjIBImusF1SqOxX8DERs6U15pnCrwPHA/bk4Y70DyehTXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THfDJXeO; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THfDJXeO"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd7695so229858fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272311; x=1789877111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXoUvOv6OG+lMdZt6DQEcnmCosxaVhf33Z8ty81lQ6w=;
        b=THfDJXeOduyFlKP+etrkWvcYOjZmGpWftB2Y9eJPnr4eMaFU7+BE8ZXxqUSbN/azxA
         x1sp2h1sSKRnCBzV/tzCCywQdQ4OtoKzfT/gzb/x6MiYXB9KENQObRAQwKx+QIg6TG4V
         pg7HX92Sf4zRN2mrBO8T4421q/TgvwqrMG/tLE745pvtoqQQVSW6ooJk1RaQ4u9CxKBK
         gT4F0v2EQO3pltj0N3oTJ+jLEsNlUYVZx3MRFiVCITsC16J9D+o7DAMjtMBOlUEGJPuQ
         E3nl+QUY1RG9y9CCmhkB74Pl+bq8y2sTJcQqZvZHO8ytqGrM50Q2VKAZJ0Tz+qrj2DmT
         VwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272311; x=1789877111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXoUvOv6OG+lMdZt6DQEcnmCosxaVhf33Z8ty81lQ6w=;
        b=G5wkd67qu75nZIqyufRygySbVywVrucOZAfTV5gAqtrzeGa2vvTW6iw7j1IuoSxulB
         SNEJiWhvj+xa4/FsxGtxCJeA5nxsR6dqNBoakMLRRAM+EWQ7cr74otXsVzxUmQYwICPt
         drJ0yNdIGzRKS4wLjz9jpq3Z1VKWN8JTTPuX4uRkQF6RGoYZBobqJrTIanO0LHDGktnX
         EunBbGsLm9geOWXQZwL0hdCclct2s4P3gpiF8Dx3LEyBbEJHW9T27JyGwg/cEwc7ao2b
         vUchTARS51aCI5jSHht7fK8TCoGAN1DYyPJ1eUobB0zwLI7QAOifiqyWZErzFKNkb4dn
         5sDA==
X-Forwarded-Encrypted: i=1; AKwUvBzIoPWIfUYxFgGlfe37txNX5bavtd3DLbeMbdaJ71N+PuUlxLaPeVn8aes7kZILpA9GeNfFKkbP3trQKUE=@vger.kernel.org
X-Gm-Message-State: AFuF++klwuQydihaCh2wfTjr037v/i7BQjqi7nNNdL8daXaHsV7iwTll
	rXiDl5jMXPb1mQFHqdogujMRneMBfErlIPdrr7T4LoqMK8xdLws4QIKA
X-Gm-Gg: AYBFou1KbbIUIsS1j6HkNrbwWWcdcwXGqoIO/YXft4wacx5jySY7IdDXd0GrbHm/qVi
	lZBVy6+HAT38d/4vwDU4Y8ZKQtzCKVrxvFe3dOadetQeKZ7IXRp3kojpmO2wMmVocDeCntGQiXE
	cSmL+we9nIwpAoJBulBv9W07shno1GyRznI//SPqTyCSMJ/gjtiT7tC18oPNI00YNw08ZMlLnBX
	qJro4iYXG5ajgzGeR3QwAAzeEAQPvPJUjQDHfyivHcIL+BF67N8584tmukpJK3NWAl9cx3VKiTm
	KZCs/tHc1LwPgbpzWOP79DH6nuyij7HddOStuloDG+Qt6w1IpK48FEQC90yho0tx6jYDIiMMzH1
	1cffMfhj+3ejLuSE5pOIofEt4SXHXWXZJ2+Ow0NAUvnav/qOa4+atwL1NBTDPdmHDB1jt9OE48I
	Q0LhQN6QiqDcnR8haNsblKmHlRlYtwH5ixVfdds2FJ0o06F3C2V04mI2kRIKTjQwqP+1UygiYLM
	i3pXEAa5Jku0HjuR0fF5DVGToc+VgQQCDi9vkbqxyhZH3cOvXgjEAeWWSm/fNIWLCyVx4nH/Ibg
	WtNDLWBN1it90NezPjsXaIJHeo6G6t7zFQKk/V1MBN4Ztq85hwMZw9oT43E9HgS1fOe1C64Mklu
	5i+0w0hEfCCBnBqzyvh9G+4iksbhYXQ==
X-Received: by 2002:a05:6808:13c2:b0:4c3:bc5a:def with SMTP id 5614622812f47-4c4a7a390f8mr3678679b6e.6.1789272311396;
        Sat, 12 Sep 2026 21:05:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:54 -0600
Subject: [PATCH v4 03/17] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-3-4a64bed94229@gmail.com>
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

The hardware-ECC read callbacks ignore errors from nand_read_page_op().
A failed page-setup command can leave the previous page available, so a
later successful transfer can return stale data instead of the requested
page. Stop before starting the PIO or DMA transfer when page setup fails.

The physical rereads used to check an uncorrectable chunk for erased
contents also ignore errors from nand_change_read_column_op(). A failed
transfer can therefore leave stale data in the buffers used for the
erased check and turn an I/O failure into an ECC result.

Share the erased-chunk fallback between PIO and DMA and stop before
checking the buffers when either reread fails. Preserve the existing
erased-chunk test and corrected-bit accounting when both reads succeed.

Before retrying a failed DMA read in PIO, restore only its corrected and
failed counters so partial results are not counted twice. Leave bad-block
and BBT counters alone. Route PIO page and subpage error exits through
ECC disable before returning the transfer error.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 120 +++++++++++++++++++++++---------------
 1 file changed, 72 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 172c7c4b0ba6..d5d8d383b6d1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1067,6 +1067,40 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
+static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
+				       u8 *data, int data_off,
+				       u8 *oob, int oob_off,
+				       unsigned int user_data_sz,
+				       unsigned int *max_bitflips)
+{
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int oob_len = ecc->bytes + user_data_sz;
+	int ret;
+
+	/* Check the physical representation for bitflips in erased pages. */
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
+
+	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
+					  ecc->strength);
+
+	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
+
+	return ret >= 0;
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
@@ -1115,7 +1149,6 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int raw_mode = 0;
 	u32 pattern_found;
 	bool bbm = !step;
 	bool erased;
@@ -1158,25 +1191,13 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return 1;
 
 	if (ret < 0) {
-		/*
-		 * Re-read the data with the randomizer disabled to identify
-		 * bitflips in erased pages.
-		 */
-		if (nand->options & NAND_NEED_SCRAMBLING)
-			nand_change_read_column_op(nand, data_off, data,
-						   ecc->size, false);
-		else
+		if (!(nand->options & NAND_NEED_SCRAMBLING))
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE,
 				      ecc->size);
 
-		nand_change_read_column_op(nand, oob_off, oob,
-					   ecc->bytes + user_data_sz, false);
-
-		ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-						  ecc->bytes + user_data_sz,
-						  NULL, 0, ecc->strength);
-		if (ret >= 0)
-			raw_mode = 1;
+		return sunxi_nfc_hw_ecc_read_error(nand, data, data_off,
+						 oob, oob_off, user_data_sz,
+						 max_bitflips);
 	} else {
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
@@ -1193,7 +1214,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
 
-	return raw_mode;
+	return 0;
 }
 
 /*
@@ -1260,6 +1281,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
 	int ret, i, raw_mode = 0;
 	struct scatterlist sg;
@@ -1354,29 +1377,18 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			if (!(status & NFC_ECC_ERR(i)))
 				continue;
 
-			/*
-			 * Re-read the data with the randomizer disabled to
-			 * identify bitflips in erased pages.
-			 * TODO: use DMA to read page in raw mode
-			 */
-			if (randomized)
-				nand_change_read_column_op(nand, data_off,
-							   data, ecc->size,
-							   false);
-
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-							  ecc->bytes + user_data_sz,
-							  NULL, 0,
-							  ecc->strength);
-			if (ret >= 0)
+			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
+							  mtd->writesize + oob_off,
+							  user_data_sz,
+							  &max_bitflips);
+			if (ret < 0) {
+				/* The caller retries the whole read in PIO mode. */
+				mtd->ecc_stats.corrected = corrected;
+				mtd->ecc_stats.failed = failed;
+				return ret;
+			}
+			if (ret)
 				raw_mode = 1;
-
-			sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
 		}
 	}
 
@@ -1471,7 +1483,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1487,7 +1501,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 						  &cur_off, &max_bitflips,
 						  i, oob_required, page);
 		if (ret < 0)
-			return ret;
+			goto out;
 		else if (ret)
 			raw_mode = true;
 	}
@@ -1496,9 +1510,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
 						!raw_mode, page);
 
+	ret = max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
@@ -1508,7 +1524,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1532,7 +1550,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1550,12 +1570,14 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 						  &cur_off, &max_bitflips, i,
 						  false, page);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
+	ret = max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
@@ -1567,7 +1589,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

