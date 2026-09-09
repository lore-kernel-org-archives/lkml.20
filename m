Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A019550DB2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962917; cv=none; b=sd61oOMWBqwzTBqEApLU93Fh0cANVCtaViQPw1wmMmq5sW7Yh7z388z1TiR9j1a6XNm1F4r8H/8LKBX4jT6HwBHoMr6XM6EHvi69WgdU2zhSu1Y7CTsVLwyqSLv9Y0iH3x9fjR4IUN/tjZgNdcpaButUHMcuAsokaROUXofRv0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962917; c=relaxed/simple;
	bh=9HbugYz/pYdC/cG1I/ccf5Fqr7JLyMLydPSVYhaBuN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sUuH3R2Aa3af7UHHusGvwrKDzHbRSPqnI8wSFfGNOWC+wG9wwipq+kGj9mIroV+2erUMQjAo9USliccsZNf2okgDUZjPzw28hHf+5gnMbksdWfLnj2ojma5kuUkCWCoV8aq6MqIj6anqQra9TVLvhl1vigNIkymVovLb0L7dMHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHIKQDc2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHIKQDc2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso56237705e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788962913; x=1789567713; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DnHKDNRI8iYm5ZtC0djEPukDxOPGWya2GFDssTDt+Pk=;
        b=CHIKQDc20DOXCag7kbTgnR4a6iJUeKK8xSByBRSJDtfE291hPocgU8NsjphQ1X76X0
         LIvo5PDrjR/qxGa0hu285ckN+7GjHtNhYT1RKaLiKxXt3Al6KrXJZ3FHGW7obpnf3FSQ
         6pRP/ej+LrwGnEnXONTx4GChqAv92vhcWjutoMxIfjpaloroe2au8yZRfG/2dHBdCfWI
         INPc/+aRLmsX28b9T0bFqWqnkvrFrXO4uzP6jJIUMlPtGHdg8od4AkMHkRoxmr577tKy
         /LxoL3CfpM6GtBULVSTPjQzajbB6B9AEoSIKZsgSqH0aMgfB6+hhVRs/SFW1CIGB1uxx
         dY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962913; x=1789567713;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DnHKDNRI8iYm5ZtC0djEPukDxOPGWya2GFDssTDt+Pk=;
        b=acvJArzSpJd0ThYGDsPEuaJuoK6SxyN8ZdK8+73pzOSRHE8F8fDorlCjuIi12zXu7s
         JhTnVehvSqiBqFaHE/hJ4bnP6vT4KIWh7oYzf659ZdJ1rF4vZ1VW2msWpXYEGhJCxhuh
         o+FNVXoqHFYboQqzZlU9e7f8gbSE71OU0RY79OQRgdXlinHmSYT+ElYMaJ8DF61N6DvF
         myK3iLUe+gqqr4F3UL3A9F+PZ4eCMDf4vYlocMFk6rjt0zpdZHaJqyZP+Im5dKQR7f2p
         nAmml34ukHLHu2qBn6+okTNJd/FQJfQILSp/AuDWjvyGDBUNsKWiAGlYBv38yNb5q85W
         eV0A==
X-Forwarded-Encrypted: i=1; AKwUvBwHfVge7x6IS7R9h9dAxYGbKvSmWl/cqQbHw2e+8HomlIUhdPUsFyPh8PpCY0Ag4EMwdSL7oHmTZg9vHYw=@vger.kernel.org
X-Gm-Message-State: AFuF++n7NxjKHutQC/qFdeDl+ZC2FOofVyFCxcl0xRKSIBS1pUwfh42V
	fJajP4UVWhxI5AsitjThVqGyzNRYntBzv1lhx+1XKZLJlrPP1wVja4PV
X-Gm-Gg: AYBFou1gvKkG4bGY9nf4bhylaq4aCaqqsToN7SaPHQVMZumveMgncx6AlNSjc/gRwpH
	Jkz0eyKrSfLilqf5fYj0EXIUJCRnGIxVYkRmXGBtgSvCcd/R8hkTzo7dfT0H1uxRJtfvDQnvy0y
	CK8Ftue/6NvEJDqaJ1iVwM0YB5pDSkedPEQ7MXZlApQK7sjYF1+1uENbnoeLvNySWMam5rkiPG3
	wOVGGv8/Mm1ytuPS1mW8+1doGodCNdNMVgahRLEDUpycqDQmqw9LWSgcgU9S2wLF8SyvjLswgu9
	gQ6Q3llFeg2h9WFLStyPD4VmZ9zygNINq5bodyA54aMQhbJtXpX87pfb4Ifv0lHxVBp3f55D9CS
	GsiWuTacXPKRP6CEFVrOBL526bZpDW1m16o8eEDYqqCCDUouQ6NoqY1MeqG8vraaz4428FAUHLB
	GDoz8v/xwv8tUA66drk505ceGplw44/2QypyN+loC7xyt1676W08wWFLG4V2rj07hqtvXDgv8na
	iaCYBq+hcnzRyed+pQSejHsTwwH
X-Received: by 2002:a05:6000:4a1e:b0:482:f0dc:b4f7 with SMTP id ffacd0b85a97d-48587091b97mr39900449f8f.4.1788962913235;
        Wed, 09 Sep 2026 07:08:33 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm34278510f8f.11.2026.09.09.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:08:32 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 09 Sep 2026 16:08:25 +0200
Subject: [PATCH] spi: spi-qpic-snand: avoid writing QPIC_EBI2_ECC_BUF_CFG
 register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-qpic-snand-avoid-ebi2-reg-write-v1-1-9b1b1466cc75@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NMQ7CMAxG4atUnrFkTEEKV0EMSeOWf0mLgwpS1
 bsTdfyW9zaq5rBK924jtxUVc2k4nzoaXrFMxsjNpKI3CRL4vWDgWmLJHNcZmS1B2W3ir+NjLEG
 lv2rq0yVRqyxuI37H4fHc9z/mREapcQAAAA==
X-Change-ID: 20260909-qpic-snand-avoid-ebi2-reg-write-0920452b4b3b
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The description of commit bfb34eced559 ("mtd: rawnand: qcom: avoid writing
to obsolete register") says this:

  "QPIC_EBI2_ECC_BUF_CFG register got obsolete from QPIC V2.0 onwards.
  Avoid writing this register if QPIC version is V2.0 or newer."

Although the referenced commit is related to the 'qcom-nandc' driver,
however the hardware supported by the current driver is also based on
QPIC v2.0 so we should avoid writing that register here as well.

Remove the register writing code to avoid undefined behaviour.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 61b1f2eb19ce..05efe6313b7f 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -765,8 +765,6 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 
 	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1, 0);
-
 	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
 			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
 	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
@@ -1104,8 +1102,6 @@ static void qcom_spi_config_page_write(struct qcom_nand_controller *snandc)
 {
 	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG,
-			   1, NAND_BAM_NEXT_SGL);
 }
 
 static void qcom_spi_config_cw_write(struct qcom_nand_controller *snandc)

---
base-commit: cb2ad3c020579bf51fb0d702db9cf64af9698377
change-id: 20260909-qpic-snand-avoid-ebi2-reg-write-0920452b4b3b

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

