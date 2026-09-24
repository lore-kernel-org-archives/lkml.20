Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9CC4CE68A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280290; cv=none; b=m4FIZxi2HARk6Ex+5SgizzIs4ylq4JdYsbBJw06ju2HiWF3KgeCxD7s9nv35ryNAEz4DtD0dzQyq7DgaYopHvscBOqkxsJSOo6rfMLPekKCAjdMfTDJHm8NcdzU/K7EAFPo0TVTurXs7uTh4WQxu7ku+8iyVeS02pFLLna8ExwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280290; c=relaxed/simple;
	bh=BPavRjrum6VfbqPcJF08CbX4xZToaAd1DUG8LFySsNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WN799JK/4i66V0dtKppa/JqrbcLnsVyv/r5Hroc8G7dnZO3umVlldqU24vurQqbgIx0kjGY0KitLtDjG7AfENbXuv0KgBh39l3xAjJMzmok45gHixj7EsWguswRFzcejSUmtNmF/NAZoBMufQKfkoKjcguHE81FFsXwQxEgoK6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4rbkTGj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4rbkTGj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so113701f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280286; x=1790885086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brmCNhyneEOagKuBVY37ScCGkg7oOLEAO4altKaW2BE=;
        b=Y4rbkTGjuyYxZbZd7PPEquHoV6/EEP5ydqQTYdN3Gt3Bw1sUrfe8aKTBU0vOMvaH9U
         c3xWUxXIwJ+jqaXrqRqE6cVjMIME2WfL4dTnlrZXrwnxjPVY53HeeXkoo95DeV6ECekT
         WApYI6Su09NaO8MqiepR92b3ZoatVxPNH8guLTH/t4sy8LbACDb+Ng407F3Lxb9xQOby
         McTRnAH9PT1GV/sAdsRXcAQ1GuAEbtF+7xM+g18dT/uRD7INGEVf41IhYHYUhQ0RP2jW
         Lnby5fGrD0snU3YmidmpSQvl5Jv2OcRpX8JnO5Q1P7TLu6+CQnczg02q3VBbfX07jGru
         bRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280286; x=1790885086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brmCNhyneEOagKuBVY37ScCGkg7oOLEAO4altKaW2BE=;
        b=gjjTuGHf7VnMdD0tdeoExUdvE825NpbiQzj0foDTQasbLUc5FFO4ZEc+4pl+lHBEjw
         mLDPXo8YtLpgF9PYdVOT2edmPlXqhOZNlEKeaLkuOkMNY6JXL9on+hIYoYNrKuCIR1lV
         YFkq2HACQ/iClgBbpctG1mRkaJJwqM8UDKR2qypJ3lD5JN8kjtyxHkTvhDqQx9/qM2kY
         eP4tQAhbrUdDQXUClNLtgyF1nU9Co6WqHqgppiPzG12lS+Ctde9A2a8BSjNPPXT5414i
         w1Rc7hQfiJ7IgImBt0tP3ZtV24YjwRoVZ3ngYgouidgYWK5W2hfXjl6JyJaO6wIKKYYg
         azmA==
X-Forwarded-Encrypted: i=1; AKwUvBweQRhFVkkOUKxRx9Ap0UIYKbbehw/QRwZaFr5uMmHSJfpEVHtA64VZNgYyaj+zFcoWasM9BsbpofzCRDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lUw8wU+vqH60ClE4tFQ47YpjbDPnKPky8RvnMUV2loqd+Oa0ZS
	Aj4ZGdmfVORz3RxAI4UV1cA3FHj3dPaTbzA9cRcmQGLkBxNaNVWE7T1n
X-Gm-Gg: AYBFou2PucUt1CEUZX/hvR4vQVBRX4EQSNrpJoSwNKHP8B4NFjnhWBdBnaWw1VWj/pp
	a5yLYvOKJ2FbQ5cVcJKQGGI3weNMrXlMroPJ6PYauwnoGyJOgaKmXwfWVteO9Sd14SoxYFuOKZ6
	HLmNowBin4nUD5zdOVPzlcI+gNCpO8KiwSDbw8rHnpH2pcrMpqrmLcuFixzArgVRjDMP2gKyMnn
	jY+FRTccJRfA7WXmDdyp5j3/DzrfNEiU6q4LUByIlaFkevjztxr9ksguBGtLvbu8cXDNa0wnMHO
	jwlbcuW1RB9Am2I3Tc8aPTaHyAkB8uFUzazEz9REgGodg7NJTsvFsGZUezx+nzBliTxwN4cWrqn
	3qmpDjmCYftmI3AHpKREPhODtoTSjXDnzj0IC7EtcmLG9T7c3lHa/GwX029op7nyc8eWImq79Eh
	1NSzPprY9T9vh6RdlVC7NBxJ1rOAY594jRDzEhzzLBsjpoEVhEEZ1sP3t+ER+DpPNLEdFsbsM0e
	4DdQS0T4UDD92LFniHOVa25hF4=
X-Received: by 2002:a05:600c:8411:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49fe66ef334mr59626725e9.25.1790280285674;
        Thu, 24 Sep 2026 13:04:45 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:45 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:23 +0200
Subject: [PATCH 8/8] mtd: rawnand: qcom: move common code to the
 'qpic_common' module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-8-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
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
index 437448995187..87bf9f67b267 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -458,6 +458,12 @@ struct qcom_nandc_props {
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
@@ -483,5 +489,16 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc);
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

