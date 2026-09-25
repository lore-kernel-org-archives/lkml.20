Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A55547F3C0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363192; cv=none; b=qfT2x/+F2ywwasxrOkq3pqs7GMvhMY/9zC+ECEg+55g1sezPsS4/2/FjjD0ADgZwb8vFDYz6htLb7PnZlDCQ3UqweB2jn1F2zrCwxBDrhm3dyWwpL+45IUDRzBi2W7MaWJf8ssG4OE21KYib/rQlyJBRhYFdjVxipOiUnBi6S7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363192; c=relaxed/simple;
	bh=+gtdBJGY/+C2YqGdkPVQO4qEd+geM3RDHzJi5sVTPl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxdghkxfjiBu2E+3zq9NFl0Wh6FUf1rduO10/XRfNouNWxZVGNNyJXT8ayAVt8HUiLtAdUZpnxoB9eW4lsgaG/PYrLZ/XSFsvfoeuTRoqTqSOuT8F22M25bgK2KAzzsj7y9rVAueKgpyof/XO4D5ahwFNIxjMCROc0bdO8PxzpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fC2r0Jq0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC2r0Jq0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so711701f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363189; x=1790967989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sg0ZYzOcfsY4Z5izNeP33bopaC20kArbvAiber1DDPo=;
        b=fC2r0Jq0NA/4UGYTJ3ohn1dB7gK/lFmmYWj8eRbfnbbInrfHrDi4AtPskx59+hXqz4
         1IQS3hjCj8D97hkMCPWXEWizRH5NimkuWqAdrvVT0+8yMqqPIoC2po6dJtBmze3jqTFt
         XDdAe9LEMkC9riLmNif3isAdQVTj4GjBsQtHozxdjiuZW/p7LUMddvCOrhgJNm1rSEkh
         0855zbk8ibPqWK7v9WjsPwcyTaLgjxM/8Fefux/BKeCeKEiA+uFtkZhdFPgioUOO7tln
         69fVhlWonpPCkuIedZ0nWwqqzocqxiMMSdwfQaDxmk6WmhDTmFmDVNT7XtQOkCo5QP/w
         hVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363189; x=1790967989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sg0ZYzOcfsY4Z5izNeP33bopaC20kArbvAiber1DDPo=;
        b=Vx/FID2nAeyHWpYyiz4C2SdNakYUVJsmFUKMHDjakr+rjBN+AOv77cxw2HSTEnaymJ
         nFOA+DgqCc4cD5FJbxtblWy/SEL9FI94oSRceHDBN7WLvPdZWuw5cXDpgoit9Etips0R
         n2pBa3Y6TWY2M63S20euBQHcDIp7H7PGwjzxUmWlv0qYL5InCfCEtCKA7xvZzuSf7CH3
         KmescEuNbq6KP2GFdKfhg+vJ3uWhwgdCoL/UDMEBVtTNhYq14E75eM6iF4fa8zA6Q10R
         22c36cFSytsC+wH3LRADgM3trubrhwux4IrZ5ZGAmtM5HW5of4qFo2UX9yIun21BCn5t
         besA==
X-Forwarded-Encrypted: i=1; AKwUvBwA5gef47lqoCVEP1JLve3qKgaHtb1LHl7X2NWf/KqTP7sCo6uPY9+SE4pm5NRsinu/V9IfTqWWdhEpXXk=@vger.kernel.org
X-Gm-Message-State: AFuF++nPBiCdEkQFvWgc2omzGTngbmDfrzmWjSN6YIRsTGkYjLFuEeBm
	qzBgZHbujk//G8YtcWwBjaMXW1GBs+S54RS7r9wweCBfKn+6hm5YPQKR
X-Gm-Gg: AYBFou0htpuO12OR6ALeVkAm4Wj1cMhzxfGS7dWqc9zoQPwChXu4Z3oKwaTbCYxS8kj
	dSW4aAr+Ey9XZgnCEwAds3wrC5GGJFi63MeR9MQoSXKJsMns4rCkEDNaBwHvVl2BYHnF3QbaIA3
	1xet5lYOKy7B8EPjtySLwlXGA9ajWZgEDMDERbA+0QEMBXB2P9/PAT4GgRz65uRBut7x2Il8cQ1
	mLox30lQj/BYEVUsSFbcwV63OOZlKixogM3T4gqufR4dXGhQ14ygL2T72Qr/MbPcaAJtYWCckMJ
	H11bY1jx5yuv9DS/rdky1tbHZAvxQJH/zB7vnp+AOCZAKQqeM885GL4RNIrtvYy1nFG8qLRJwLc
	vQBJSKG2laFnVEqj6VQ7t9vjdMecaF3mkAiWrUjv18OLR5YLM6LP83IW2tNsQ+r7RshqHykQN2i
	GqTrVUSDvoYWGYMoXnzLDecNH8b+AntPUkNNVPmEaEJRPIeKFgfdvCtlZ5CsddRffmjJ9OO2vXk
	2Q/a1Add5pn2s+3DyAJV+fJBuE=
X-Received: by 2002:a05:6000:25fe:b0:488:8352:cbfd with SMTP id ffacd0b85a97d-4888352ce66mr3102447f8f.46.1790363189125;
        Fri, 25 Sep 2026 12:06:29 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:12 +0200
Subject: [PATCH v2 3/8] mtd: rawnand: qcom: make config_nand_page_write()
 more generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-3-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
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
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
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

