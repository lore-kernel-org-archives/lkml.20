Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86604457CA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363192; cv=none; b=PEVY4YrmgFvZZW1CtAGX7SMabSjiHg9vUfHXR3WORxxZtdXwuCju3BtAG4GO2M3/e98vbq3PklMH4L5RyJtBiJh5DeGXeiyePK+M/+zhh61xmApWqhRBM5Gq9SneOGTb6i0ZYgYoTdJJP9TesDIhAo/CzURJzz8s93jOObeAeIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363192; c=relaxed/simple;
	bh=il92iscxRx335UsW8VTDiabR2loBTTgVkGFIZ1f3ayg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0Cy3P7I+cmqpGjYewE+qU4pgYAtmK/NniuBUyHiYmvPdxGugr8g5zlZ9vVYmYUv+u8lAyg/H32x413K/8FMjcbOvThTwm3n+bfqDo526TMSSoeqenrVySrTku0A8TkWp3hJC5F9QFno0QeJR/qI7FrINnW58LhDyOxyVN1P/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iU2Y0y95; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iU2Y0y95"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so734939f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363188; x=1790967988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5jkKD2v4oiF/61cAOq1H7aVeTB8y+S8JbJGXm/lHUM=;
        b=iU2Y0y95bDsYYAb3ZzAqPzRrHk0AEWNg9zNjCeDlD5uh47ERT5rQOD7Wpe7W5ibXR/
         4922NIolF3SRZ/uH+f+iZhLZ8o034W08ukadQ00ABRpoinzotrfe3+TRJI6GmrP9CtL4
         21nL8x1smIUeEfAp+n2USlrb14JDy+FEPaDyQQP0yhz2+L/xSDA1eMgIeEQMnqYypuI1
         otc8CBPrWkf0u3PNt8g1V61QChLgBgFIsjcmghKSU9By4NgP4YTBm/R5FCALC/2MeUWQ
         JAnbBmmxDaQLu9aBo5k4pOsgAGf5MkvAtExWnJjHzROyL6jjwH0PmEYQPjCLeOQN/SJD
         HaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363188; x=1790967988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5jkKD2v4oiF/61cAOq1H7aVeTB8y+S8JbJGXm/lHUM=;
        b=tB+qBRNgF+NRcSgaakMs2PcIGDui9XvsyPErbpGjM6KTVtktVjjEAXLozns1JZfuBA
         J+C8JfFqbz0pKfadltbzcOOJxEiU2CGAeIgBGTzLKxJACroKzESpugALQ/LclIeXqjaA
         W9Q9iubqsd1SXBtd0rUMEg9QlejhMN1p2xYAJ1B5Mn8ctcpTp+C5V1WAHBAUTBJOHgiW
         eVmD/LSJ9lJh5iyCgbwFeABXM8u8M1S6UE1eZ78kUJKxco3y13YESSCU/+WKBhx/c4qG
         6TvK+HaQwvGH0aJwDDMVQaKq4fAgNJLoSsB0SO2zIGbBqS8rYkpr8bhvUVEMUJAE+EVn
         N30Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3GlRpxeHTqbiuMg4YnYLLMYWo9BLcp7V5nfNzPL4ToTDpCr+q+74wPBk2EkEz78rinMtUahNcdbIuguM=@vger.kernel.org
X-Gm-Message-State: AFuF++lxnCDnta7rPZJyXoMMT7Yyv6QmirbWj6AQKfYuDtAkwT1m+mvc
	3P9lrlaAR6weo107vPpcmGAc37ba+8xakRFOrHh0MFmwMEnU2zicgK1D
X-Gm-Gg: AYBFou1JBi+o2l9GKG5ZH1+RUAVGpURz9x+Z//rAqRKK0yLV58fmn1J4LFPi0nhP6WG
	stKsZqHIjkOqSOzPBX2fGmkY411GNuY9D2xWdWyOAe+/9H5y1o3DuSOkCfIataVbNKmmQ2CMbad
	swIDVE1IoMuE0OjxiInvl3satpZbQZ3o2zcKaYnI6o3nGpSB4FzY5Q2xKtMtG0jmyX/713faLoa
	wG9K/ni095GtFmV9pX6GPhpN5kbfRAELvgML7chGaITp6PWc06y22WcL5rUvUn+VUXpckR88Dh1
	Oq0a+Yz4cpg/WDe+EZEhe0GeoaecPyfhe3vlOPq/h0cAaC692ebqf6DPQ0hb14irSz5K0XOICI8
	NsoP5us3qKEpWiFrcpMM/XWwJNoSJMRELhhGZf6g8uGJsmZXSTxAFFLfxu7DjFZUx26J3JXrW1y
	HHwjkpcrl/eAJBwiBUp+JgvhJQBENFsA2yUYjb3edbleHvcmS14fc535LSfz27TeXuM7qa7+uEE
	NoUt8hPl3soq73v3u8H3Gs7fJE=
X-Received: by 2002:a05:6000:41d8:b0:488:7b80:f2d0 with SMTP id ffacd0b85a97d-4887b80f651mr6001675f8f.52.1790363187806;
        Fri, 25 Sep 2026 12:06:27 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:11 +0200
Subject: [PATCH v2 2/8] mtd: rawnand: qcom: make config_nand_page_read()
 more generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-2-a1b088052d6a@gmail.com>
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

