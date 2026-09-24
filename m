Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2434BE446
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280281; cv=none; b=E+yd4hEwTAP6opOfVTouqKBJgU2xK9iqvq8AN5NM1KxAEkuhMhFs3KJPMgNFpNDhn1SaTC1RZNz/W6OpinTLacwrzVH+s5GEX6F0klY9iCvaFE1l2y6jT06FWziKsn9YbEtzf4J208RDaWrkvs5azpqz9O51yvSMEhj3mwkkKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280281; c=relaxed/simple;
	bh=nr3gv0YVsi369I9C32f7Q8ESyMUsrvt/FTf4apJEL2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Spefji5/9a24V1uxxb4u8xZHIGtJSlGOvZI2zZzHda9AT1jGdczzFecJbm4fsb9NQCvoAX2G0ocU2d0XWg8Ejn3s9oveX5ElHAcpwwMhKUe9footDDLQ1m8mtKihaCu0XQoZNpaZXIQl8MBvNQ76/l0NfG1DNCPCG1+jyu+3pU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLR36ty4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLR36ty4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso1546935e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280278; x=1790885078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElnHn2hsyQHJS/loLjzxhWE+x4OJLh0H9QSrawSVavs=;
        b=bLR36ty4VEcF+YYF4S2WplGpwvcaISztIeep4nIQzLRYHbexkUZ1VrJWkG1R2BF6nA
         w32SfQzH1DqbcYGnFw+LdmOsAJnDUGHV9vkVSyqbeEc4kfpF5R4DQLyd3aHEMZEm01ap
         PnVxpd2JNhMuuXwwrxm4zNf01rUXGHxG3UwJTGihP3Ho+XGAOM6br7bz3j4nhPPNuGa3
         TmrSDOn6plcesw7R3osnpXNl8JfnG35cyfH15Cv+n3/c682QcXe3W4zMtGUT+Rc0rGUQ
         br1VlH1ksXPWNblIn8HAtRDSSxnwJGeJ063v2EEuia/rcFWUWBsbfeM4M4plPjqvd6Y9
         h0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280278; x=1790885078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElnHn2hsyQHJS/loLjzxhWE+x4OJLh0H9QSrawSVavs=;
        b=oySfwL+5vXRiDHkbXKvQjWHFeab7m+D63jxDDsStRXTp5pWwtRw7L/fnVcCBmUtv0+
         kieP4WL7ZAauh60lb3LaInCcs2cm2wxz+i0uwMp+behHCpjdFkK6J+lNi7fzXKCs/INf
         fUtZmw6rZLPYITp9ahb0IB5YIhjpUZAqTZJaFe0PVlkKYJyYj4tdY107XuybamGZvSjZ
         lNYbPvho06BhqKBdplTwZVAsr1wrm8VCaJPYl2jt1JOAGR1MW+tgHtNE3o3pWNxKTkP8
         iBvlP20KVwLTEGyi2JNsGEWDMNFB4YWPyHgnshTyQYgcTYN+5hZyXlMh4MNVRq3vARmu
         H6aw==
X-Forwarded-Encrypted: i=1; AKwUvBz+JM3BqeG1NIe3/dAD89QFdPnjkzcj4sKRQGm9ZWsDpgh1SqNSX2uU7RkEzzUf9PryORSQKh33DITmIUE=@vger.kernel.org
X-Gm-Message-State: AFuF++mo8M5W/cOaWaUKUjonhnHnxPkrfB2O3hzR/NoVFTKerS9ATfYO
	l7Ghb7oenMGpI5tkqv8x2e7eFdltyq/4BdeHFdl/eNyCqXxSZHkbhUQA
X-Gm-Gg: AYBFou3bT7ogbpoi/2zh5pkXRBmdkYDEHykmuD/4DmUClAlEYLE0HfrstSaHfMoFED1
	9zniH7CZfAUFt1s0OgWeDT01SauHgtoLPi8jPcmA9IoE2DlQxZqn0F+LvaCN7DL9tCxodxu0Adq
	gv7lBv5QDhANu0F8wn/s+Ubrx8uuq/293JdEf5LNbFMzteQ+BRZ8gw4MlFxVd3dll78/LT4zFxw
	FcxmdAkVmTxi2CoCUoNzX09+lNb2aOJ3f52+87YfBri3qJtYI/WXh/ct/wxtU7GJfRRGmJxDTzW
	YjzSMWTQVGsg11mS44wrLMgyLSm8wiVL60LiJt0osGmMms4UwlNxk/LeG6Ru3bC1gX3K6+9sGb4
	JyMg32yKoes1JlBBw6sf+f9BX2HgcqTB6h+PUyiPyitFgdsVZvdEPxM1CIHzD958vCvRPt/3NbR
	ZwDvRh32PY93vcBSHyO0UAhxuvNSZP+wbTKqRHA7HJik7u+g/WRbtBp4j0sWh2MMG586X6XM1fR
	v2AbSZe/mVmf45qj50JAOdm1RE=
X-Received: by 2002:a05:600c:1546:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fe66f4f59mr63598875e9.23.1790280277751;
        Thu, 24 Sep 2026 13:04:37 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:37 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:17 +0200
Subject: [PATCH 2/8] mtd: rawnand: qcom: make config_nand_page_read() more
 generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-2-f3012199b161@gmail.com>
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
 drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 12bfb14cd9a3..c65a8416c3f5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -305,10 +305,8 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
  * Helper to prepare DMA descriptors for configuring registers
  * before reading a NAND page.
  */
-static void config_nand_page_read(struct nand_chip *chip)
+static void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	if (!nandc->props->qpic_version2)
@@ -357,7 +355,9 @@ static void
 config_nand_single_cw_page_read(struct nand_chip *chip,
 				bool use_ecc, int cw)
 {
-	config_nand_page_read(chip);
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
+	qcom_nandc_config_page_read(nandc);
 	config_nand_cw_read(chip, use_ecc, cw);
 }
 
@@ -490,7 +490,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	qcom_clear_bam_transaction(nandc);
 	set_address(host, host->cw_size * cw, page);
 	update_rw_regs(host, 1, true, raw_cw);
-	config_nand_page_read(chip);
+	qcom_nandc_config_page_read(nandc);
 
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
@@ -727,7 +727,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 	int i, ret;
 
-	config_nand_page_read(chip);
+	qcom_nandc_config_page_read(nandc);
 
 	/* queue cmd descs for each codeword */
 	for (i = 0; i < ecc->steps; i++) {

-- 
2.55.0

