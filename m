Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F64C8C54
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280282; cv=none; b=ERuDRqDuKLzpby4lJkUDOB6fBZJMd5oy6f9pdiZWDKSeyDW9iWYEr7GTs9ksKnrOfHvACHVUD7KhsB01D7b2nqQLq7a3D0/6f8nKf+Fr/zubei85T4jrLVmupM7BoeOaF/vWflq2+DvUDKGFHTWnvhmVsLNxqQuj5tpdGWC/rew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280282; c=relaxed/simple;
	bh=pA6UJFYAdUJYNZRTgO/wCDr+bljQsjsVqN7G2i9omLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTNjOAa2S0rPgt+tJdG//Mxwwwemq8XJddYGypq1HhDMF3Q7nsveew+WzYCl7Tz4WSY5CiliKcIUB8b0h7zVtY5Kdpo0YBYwFq2FTy2duzpvRg9EBL2GcRwb5SPgFnntr8kYOZ8XbOc+tQylYokR6fIf4V87Gr+q1rIKFY9/U7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zyj4GE1V; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zyj4GE1V"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so1185635e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280279; x=1790885079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvoJ+1SnGtHb1aER45OX4q+Sg7b0MJkGQf+G9BmIWik=;
        b=Zyj4GE1Vhhex3ox0LhMQ+5FTa4U2KQlY0Dz7KnXOxmyzn20wXsC7XbGtOWLAH/0Dpc
         wjXhYzGJ4bqJVa1nrvAJcZY9koN5QjQvsPAe8IQ73otToRuiIA6RLyfSEgH2dOevr+xL
         3rXyuXibXBngwkQnkxUPl63465mUz0ovAxrVWg+npZ1zUvfvBmI3N87/k4vusxGSSneu
         jdhqrBMtH0YmmcI97+Sil9/YSu5Uj/A3A7ocU3Yk49whnNL+gGkYROzbUI/aqrZ0Tz9k
         dfFfQPTs91+2ihGQdEG3JllEKUHyJFt6JUdB1fy3zWYHpTKA1TABwY0pJuz7Npls4C0Z
         b0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280279; x=1790885079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvoJ+1SnGtHb1aER45OX4q+Sg7b0MJkGQf+G9BmIWik=;
        b=n6ue84cPZmZdjYj22/K5qjhQbVdlCXlw7OWnod7a9PFgSnvWTqErTtKpY2cDVvI7Eb
         YKWveKRoPKdks6d8eiFDZemBXXt8yhfS+FTME++SPW7GNDQmU8Kx1csAT1VCCfF6MhY3
         UTy/B8uEJxNxASQxUX7K6u1IfMyFaso3Chg+Pr8TKB+zfuEYkeGjAITW370fksH2768M
         gmo3lhX8ztzomhY7InTfkhMBDvFv6ZtwGxcpdze7ARH5t4BP8fWnhzQC07qQbsOq8roL
         GTBZbwe28b0XiCezrKovSqF9kYOZvVJNCja50dbkLYUFzjFIKsQzHrtScJODajlXiIJ+
         gjJg==
X-Forwarded-Encrypted: i=1; AKwUvBwKEz95flg74ABkJ4CHqZc8z8s3QDKoUA6+dq3QD7nRTx8XnDsi5mPGJ3FjcAUMF4Bo5jAPygHqTBkFNSE=@vger.kernel.org
X-Gm-Message-State: AFuF++kKncRza/t3VBBGBXUAoQxvokzPHArJeAhvYMdyp5inQZk83syy
	F/hqJyx1oFcLSM0b9CmOf9NerpyrpjjRupH+VD2q+vgOFGAQwFZOemXf
X-Gm-Gg: AYBFou2VkEIgc8kt//PTeWbLdQsCQw6rBXYB6CYr8MP0UewOT65JssYx7LGPZ4Ir2VP
	vC17GuWNHkLOXF8i6BdrbBQb+vrS5+EAXBgSySD4/T1idydqHg3aezpHyoZ19K6cKV0E5e37A7s
	YGFaPDU2hPprjeAmwZeCI7u70NjWD/bTnwHJT9VJde69am7dbhId+5S6m1+9TRsfK+l8jRHVCEb
	DYm7wY1a38iZSont5zDh79ViOIZmXM7mgJna0fmPsevwejFT940kZMepD+csc2B9B6Ve0IswyfZ
	KHO2BGVjxwdfZUyV6NOHN3vDIcdSYXHR+2Ze6zHtiY4O/e1awOI6ILs8YX6+c0diiGKTZXiRwgo
	nxKZTqZKeg1GdoPr/KDTxjo8PvWDSPMxmMIPZ4dfnUAGpG0B+VN1qsdwtHmAsPd2Stx58+VKgiR
	hG5I4T+mjqX4AtcaQsTfQyjruC/8zTylpKqaH962JGl5fFkKXnxfwSGtxJWQ3aHeu28eHfnjnkk
	bRM3SA2L6qllSK4CZK8G9oGWnQ=
X-Received: by 2002:a05:600c:37c9:b0:49f:c2ef:cfb9 with SMTP id 5b1f17b1804b1-49fe66c897cmr55518965e9.4.1790280279053;
        Thu, 24 Sep 2026 13:04:39 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:38 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:18 +0200
Subject: [PATCH 3/8] mtd: rawnand: qcom: make config_nand_page_write() more
 generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-3-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c65a8416c3f5..1f3c00823309 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -365,10 +365,8 @@ config_nand_single_cw_page_read(struct nand_chip *chip,
  * Helper to prepare DMA descriptors used to configure registers needed for
  * before writing a NAND page.
  */
-static void config_nand_page_write(struct nand_chip *chip)
+static void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	if (!nandc->props->qpic_version2)
@@ -989,7 +987,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 
 	host->use_ecc = true;
 	update_rw_regs(host, ecc->steps, false, 0);
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
@@ -1059,7 +1057,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 
 	host->use_ecc = false;
 	update_rw_regs(host, ecc->steps, false, 0);
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
@@ -1143,7 +1141,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, false, 0);
 
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, data_size + oob_size, 0);
 	config_nand_cw_write(chip);
@@ -1219,7 +1217,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, false, ecc->steps - 1);
 
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, host->cw_size, 0);
 	config_nand_cw_write(chip);

-- 
2.55.0

