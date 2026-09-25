Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D443F8BA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363200; cv=none; b=JhoKX0NQKUW39ogGxvELXEJ5ZdOLdbyPufWT/z6LL/UVLDBJ3tKkkC8exOPzLlXXmY60cJ2SP3/G2S4qQ2ezLQy/d1OMkI9W9BCaMZQuWBoCCktsp/yOVAJ6pQCRERgSfLDks/YBv1ICoJUAu5L3ihMwvrjOTHvSHBvyyM4er4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363200; c=relaxed/simple;
	bh=ESjlETgMBbydGZUcpjTO6UAvB5064doC1Wh6eDsCeIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cc9CyQbP+tTkUoC1zdmsm+d91SpkrWpL4usd0C2mbiMY7g3i5qmJDh4ZWgW5N068kFGcZ/K4DpymOBixESAS+Xw1mEIVMtQ1mbrIJLFzbsXbERj80s2cwNqxYDwqMPCcey4vmfhRW27825NZlVUbnUe1L67kfqePyf5KrCpsAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fj956D7W; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fj956D7W"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so700358f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363195; x=1790967995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79hwgqqwJM7rcF16m3dJoWOkkqY9Z7AIYmJSq7v9w4I=;
        b=fj956D7WQg+D6asqhQi7D0sjQDT2LhAaEgBqO0hRz9gkUFIXVq9LRCmy81BgDX3jpd
         D8deHgSBOrQ663bkuDiwS+GL6ghngcB+d39qy+aDTjzv0nK1SVI5KZlbE9aCSdjDxy+T
         wC83sud1sd4YqlDa/5H8UMkQjeuC8yy9baHHuB0KJsx49IMFzY2m7NmC+JtwtipNXZgQ
         DHJ5PSdk74A4qB70KRmBjrgBF/90XdkX+oZQBaEuS0Nb3nQN/Jjk5oUvJYNI/bsMWwaZ
         Ew6MEjQ3vvCZQUurR6jt5PExNOLm82ZyOICP7P+NtRyEyyXgB4xi/WaoxevZNoAr8fHV
         BnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363195; x=1790967995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79hwgqqwJM7rcF16m3dJoWOkkqY9Z7AIYmJSq7v9w4I=;
        b=PehX7emh8X8D+iB+kZOxvtm0lUwhzonBmcYGzfpNu+QSjM/QU7W3P3vy9KGjJdtHoK
         tkKGiN4wS2Nm9hGvxHc6oSq+t4gJ8LQHfm5sYmwKJfskAT6Nb58hHA5mU0RnUAGA/PWL
         ZyYLLPbWYjqASg+PXeXzI6IKU2A9LS9bHH68O1T1mcgg7V5f2rLr1rSZTLEtK7iv16TJ
         KvrxSgN9u/6xwfZZpAcyhRk5Bk/aszGhDRpgJbDtLWyn/YILuRuMKNNdGI6Ir+VtbBAE
         U5VcUC2xr2tSjWH1qYgHRDleCBkjfl8bvI+qut+UgNxYgT5hZYauJmYMxxacsrtSIqtH
         UG/A==
X-Forwarded-Encrypted: i=1; AKwUvBz/PIOMrp0ktD7OHGS4aFZ5vGmQElndAEdFubmYxQJTZlTbJ0cJbLLTqJxievnMKWZ4FCii7toDLnGS7v8=@vger.kernel.org
X-Gm-Message-State: AFuF++ka1/Iwvzx0MV5d8W167FDIs7cwCTBLEzMvtIuWx5nnNK0Sw2sL
	pXcrv5SBqv2QHOQejtwUImm4NanWrTqirsMlK/vR7EhiH4gGcwUUJr3D
X-Gm-Gg: AYBFou0PwmmlHjNrSymbP1fWUdaH4pWpZ5TdXIlpM9LTJnEfoHpx3p2pegKCvs5ogNW
	wKmrQ7ryQaUO116q7sXXcRDjSLbmGi9NyJRx+J4UaQghd4uKG4JIfE8my5xvkAvdp7tgod912aI
	e680U2mv67zaG+WAue16a5bORbQ0qH7OjhKukgOAj2IpTU65oABPGjOR4RA0xImhfUc850QBf8B
	Naku6XOj6l8ejPcLbEwcIiZPBLbCqKHZyp5BLZzHYU55bxhNUuaq+HxPzQBFOacH+O3GtmuM19t
	SZ6xw2Q4WZM5ZwSlN7PxOIjCcv1b/1n6O7J3p/fnfyv23kG4wgAiNmKXyElwFYaZO5DpyRAoD9d
	QcQSHzmBRBT7NAXVw93R25+MrTgV+D7eKjbmq/yzJJY7q2Xb8BpfWe09a/bSW1OFhLO6GnTVlIq
	VdNaxPh386b0j4bi/QeizokF0sl3LvBjLhalEOnkxja4O3IFJzKrIqGAP3LWcQYqd+OjHW0ZM05
	AT/9Hrc9cwmJE+ubwYMRHg5m7G6
X-Received: by 2002:a05:6000:4b0a:b0:488:823d:507b with SMTP id ffacd0b85a97d-488823d5296mr3689507f8f.52.1790363195404;
        Fri, 25 Sep 2026 12:06:35 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:34 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:17 +0200
Subject: [PATCH v2 8/8] mtd: rawnand: qcom: move common code to the
 'qpic_common' module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-8-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The 'qpic_common' module provides some generic functions which are
usable by both the 'qcom_nandc' and by the 'spi-qpic-snand' driver.
Move more code from the 'qcom_nandc' driver to there in order to
allow using those also from the 'spi-qpic-snand' driver.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - No changes.
---
 drivers/mtd/nand/qpic_common.c       | 131 +++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c    | 131 -----------------------------------
 include/linux/mtd/nand-qpic-common.h |  17 +++++
 3 files changed, 148 insertions(+), 131 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 4f3e4dd766da..91ae970734f8 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -775,5 +775,136 @@ int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 }
 EXPORT_SYMBOL(qcom_nandc_alloc);
 
+/* reads back FLASH_STATUS register set by the controller */
+int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
+				  int cw_cnt)
+{
+	int i;
+
+	qcom_nandc_dev_to_mem(nandc, true);
+
+	for (i = 0; i < cw_cnt; i++) {
+		u32 flash = le32_to_cpu(nandc->reg_read_buf[i]);
+
+		if (flash & (FS_OP_ERR | FS_MPU_ERR))
+			return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_nandc_check_flash_errors);
+
+/*
+ * Helper to prepare DMA descriptors for configuring registers
+ * before reading a NAND page.
+ */
+void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc)
+{
+	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
+	if (!nandc->props->qpic_version2)
+		qcom_write_reg_dma(nandc, &nandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->erased_cw_detect_cfg_clr,
+			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->erased_cw_detect_cfg_set,
+			   NAND_ERASED_CW_DETECT_CFG, 1, NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+}
+EXPORT_SYMBOL(qcom_nandc_config_page_read);
+
+/*
+ * Helper to prepare DMA descriptors used to configure registers needed for
+ * before writing a NAND page.
+ */
+void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
+{
+	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
+	if (!nandc->props->qpic_version2)
+		qcom_write_reg_dma(nandc, &nandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1,
+				   NAND_BAM_NEXT_SGL);
+}
+EXPORT_SYMBOL(qcom_nandc_config_page_write);
+
+/*
+ * Helper to prepare DMA descriptors for configuring registers
+ * before writing each codeword in NAND page.
+ */
+void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc)
+{
+	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
+
+	qcom_read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
+
+	qcom_write_reg_dma(nandc, &nandc->regs->clrflashstatus, NAND_FLASH_STATUS, 1, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->clrreadstatus, NAND_READ_STATUS, 1,
+			   NAND_BAM_NEXT_SGL);
+}
+EXPORT_SYMBOL(qcom_nandc_config_cw_write);
+
+/**
+ * qcom_nandc_set_read_loc_first() - to set read location first register
+ * @nandc:		NAND controller's private data
+ * @reg_base:		location register base
+ * @cw_offset:		code word offset
+ * @read_size:		code word read length
+ * @is_last_read_loc:	is this the last read location
+ *
+ * This function will set location register value
+ */
+void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
+				   int reg_base, u32 cw_offset,
+				   u32 read_size, u32 is_last_read_loc)
+{
+	__le32 locreg_val;
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
+
+	locreg_val = cpu_to_le32(val);
+
+	if (reg_base == NAND_READ_LOCATION_0)
+		nandc->regs->read_location0 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_1)
+		nandc->regs->read_location1 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_2)
+		nandc->regs->read_location2 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_3)
+		nandc->regs->read_location3 = locreg_val;
+}
+EXPORT_SYMBOL(qcom_nandc_set_read_loc_first);
+
+/**
+ * qcom_nandc_set_read_loc_last - to set read location last register
+ * @nandc:		NAND controller's private data
+ * @reg_base:		location register base
+ * @cw_offset:		code word offset
+ * @read_size:		code word read length
+ * @is_last_read_loc:	is this the last read location
+ *
+ * This function will set location last register value
+ */
+void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
+				  int reg_base, u32 cw_offset,
+				  u32 read_size, u32 is_last_read_loc)
+{
+	__le32 locreg_val;
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
+
+	locreg_val = cpu_to_le32(val);
+
+	if (reg_base == NAND_READ_LOCATION_LAST_CW_0)
+		nandc->regs->read_location_last0 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_LAST_CW_1)
+		nandc->regs->read_location_last1 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_LAST_CW_2)
+		nandc->regs->read_location_last2 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_LAST_CW_3)
+		nandc->regs->read_location_last3 = locreg_val;
+}
+EXPORT_SYMBOL(qcom_nandc_set_read_loc_last);
+
 MODULE_DESCRIPTION("QPIC controller common api");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 99fe2c434ce7..d65c0101f471 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -149,68 +149,6 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
 	return cw == (ecc->steps - 1);
 }
 
-/**
- * qcom_nandc_set_read_loc_first() - to set read location first register
- * @nandc:		NAND controller's private data
- * @reg_base:		location register base
- * @cw_offset:		code word offset
- * @read_size:		code word read length
- * @is_last_read_loc:	is this the last read location
- *
- * This function will set location register value
- */
-static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
-					  int reg_base, u32 cw_offset,
-					  u32 read_size, u32 is_last_read_loc)
-{
-	__le32 locreg_val;
-	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
-		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
-		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
-
-	locreg_val = cpu_to_le32(val);
-
-	if (reg_base == NAND_READ_LOCATION_0)
-		nandc->regs->read_location0 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_1)
-		nandc->regs->read_location1 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_2)
-		nandc->regs->read_location2 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_3)
-		nandc->regs->read_location3 = locreg_val;
-}
-
-/**
- * qcom_nandc_set_read_loc_last - to set read location last register
- * @nandc:		NAND controller's private data
- * @reg_base:		location register base
- * @cw_offset:		code word offset
- * @read_size:		code word read length
- * @is_last_read_loc:	is this the last read location
- *
- * This function will set location last register value
- */
-static void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
-					 int reg_base, u32 cw_offset,
-					 u32 read_size, u32 is_last_read_loc)
-{
-	__le32 locreg_val;
-	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
-		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
-		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
-
-	locreg_val = cpu_to_le32(val);
-
-	if (reg_base == NAND_READ_LOCATION_LAST_CW_0)
-		nandc->regs->read_location_last0 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_LAST_CW_1)
-		nandc->regs->read_location_last1 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_LAST_CW_2)
-		nandc->regs->read_location_last2 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_LAST_CW_3)
-		nandc->regs->read_location_last3 = locreg_val;
-}
-
 /* helper to configure location register values */
 static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 			       u32 cw_offset, u32 read_size, u32 is_last_read_loc)
@@ -301,22 +239,6 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 				   host->cw_data : host->cw_size, 1);
 }
 
-/*
- * Helper to prepare DMA descriptors for configuring registers
- * before reading a NAND page.
- */
-static void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc)
-{
-	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	if (!nandc->props->qpic_version2)
-		qcom_write_reg_dma(nandc, &nandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1, NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
-}
-
 /*
  * Helper to prepare DMA descriptors for configuring registers
  * before reading each codeword in NAND page.
@@ -361,35 +283,6 @@ config_nand_single_cw_page_read(struct nand_chip *chip,
 	config_nand_cw_read(chip, use_ecc, cw);
 }
 
-/*
- * Helper to prepare DMA descriptors used to configure registers needed for
- * before writing a NAND page.
- */
-static void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
-{
-	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	if (!nandc->props->qpic_version2)
-		qcom_write_reg_dma(nandc, &nandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1,
-				   NAND_BAM_NEXT_SGL);
-}
-
-/*
- * Helper to prepare DMA descriptors for configuring registers
- * before writing each codeword in NAND page.
- */
-static void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc)
-{
-	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
-	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
-
-	qcom_read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
-
-	qcom_write_reg_dma(nandc, &nandc->regs->clrflashstatus, NAND_FLASH_STATUS, 1, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->clrreadstatus, NAND_READ_STATUS, 1,
-			   NAND_BAM_NEXT_SGL);
-}
-
 /*
  * when using BCH ECC, the HW flags an error in NAND_FLASH_STATUS if it read
  * an erased CW, and reports an erased CW in NAND_ERASED_CW_DETECT_STATUS.
@@ -438,30 +331,6 @@ static bool erased_chunk_check_and_fixup(u8 *data_buf, int data_len)
 	return true;
 }
 
-struct qcom_nandc_read_stats {
-	__le32 flash;
-	__le32 buffer;
-	__le32 erased_cw;
-};
-
-/* reads back FLASH_STATUS register set by the controller */
-static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
-					 int cw_cnt)
-{
-	int i;
-
-	qcom_nandc_dev_to_mem(nandc, true);
-
-	for (i = 0; i < cw_cnt; i++) {
-		u32 flash = le32_to_cpu(nandc->reg_read_buf[i]);
-
-		if (flash & (FS_OP_ERR | FS_MPU_ERR))
-			return -EIO;
-	}
-
-	return 0;
-}
-
 /* performs raw read for one codeword */
 static int
 qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 0f40964eefe7..f31fd18d837f 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -457,6 +457,12 @@ struct qcom_nandc_props {
 	bool use_codeword_fixup;
 };
 
+struct qcom_nandc_read_stats {
+	__le32 flash;
+	__le32 buffer;
+	__le32 erased_cw;
+};
+
 void qcom_free_bam_transaction(struct qcom_nand_controller *nandc);
 struct bam_transaction *qcom_alloc_bam_transaction(struct qcom_nand_controller *nandc);
 void qcom_clear_bam_transaction(struct qcom_nand_controller *nandc);
@@ -482,5 +488,16 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc);
 void qcom_clear_read_regs(struct qcom_nand_controller *nandc);
 void qcom_nandc_unalloc(struct qcom_nand_controller *nandc);
 int qcom_nandc_alloc(struct qcom_nand_controller *nandc);
+int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
+				  int cw_cnt);
+void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc);
+void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc);
+void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc);
+void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
+				   int reg_base, u32 cw_offset,
+				   u32 read_size, u32 is_last_read_loc);
+void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
+				  int reg_base, u32 cw_offset,
+				  u32 read_size, u32 is_last_read_loc);
 #endif
 

-- 
2.55.0

