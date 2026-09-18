Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950A5226BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761198; cv=none; b=KE9VggBkuHDiwo3qyt8vjViKP6ScQn5YNIJp83iIfkRTTNX808kuO+XPIaDEKOOI5qz/TDPso6OwUpxWlMVejWMiSXEl8mh1VYOUG5YvE11CNPbMd0J9UM9hll7DgOfyMVB0zIEw+wCL22PbqWaqLO2Q8P+trJMe0Hehhkp95bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761198; c=relaxed/simple;
	bh=RN2p2/bXMONsVTwFz5kXNK8tWapTL/QkX7GwSzBR0Rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c635U9zaB13lkN8XfNGzj+ot2NqHP2aTkDc6CB+Rqo/n7umNoxC2iGqGoASUp617cJEKFUAEkMRl73aXrLV7Ce7EGqcJEW5k8QGpZACHYhmmP8Tr3+DU3goDt7KmsQKAgbc8ToJ+rJioK1mef6dNBu5betwxK7qeee7bWD1G40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gENIzWpP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gENIzWpP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso401541f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789761195; x=1790365995; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Djb0xkVRmjxoEZ1HgTSwJ708yN2LZl+WunF0a6oqDtU=;
        b=gENIzWpPnUZuqpoXTvz8X79gPSoBpMekMpRB0BPL+f+Y/CcYQQxs7r3TtzaidirEuc
         UFTwiZuTJUIp8tNfqlR0TOOl/ZW4izuH8sOHRuP85iIpDre19ozbRpDeMqTGiyAigDV/
         Od3w0rXMvLt7ybjgg0UcpR1QId3buVULpweMnNmAIraLJhQ2ZlUTH+tesj5YZbj4ISqX
         kvJKRkRsvVNdbXgdjuHnM9Tapte8MmgosOmdtPP2hrw9pyQzZHdQ+Gcky7t7Piigyry7
         ri+VUm84NpTp6W8S9BslbtRTxTzgy84wztyq5uOoduim4gSuJJjXjruCKIfY6C7fW9Fk
         eOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789761195; x=1790365995;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Djb0xkVRmjxoEZ1HgTSwJ708yN2LZl+WunF0a6oqDtU=;
        b=oqIKqwBEXbidXlSHS9QNVjtIlQXUnRVDABgx+3ffLugeh3t+WwJtdRZ9vGq7qHJjlh
         TzoPCofRWofVycySqphEKackcvBfcm19H4FcT/LkSZC5M9eKcsjsIEZ2xd7XeEt6KtlW
         GfNlsi2KLYypn+cSDJKzMFclsDViBH5tfxH1tkZ/4nQcKVbGkeLWu7qUNVWOu9DNqd9a
         O/VHJ3Peu+/f9jGXPTU84f35xfEQH+DO1KhHTb/nIQTEWfDqw2EOMewWpXtBgjpNiEHq
         FfyWQOlVlgBYDM9I+Vn90idMOhm0LIq41FGtjtDUefdmayfCmk4UNScVoke0KsgWbcWG
         pBXA==
X-Forwarded-Encrypted: i=1; AKwUvByLzAR73D99Yjehtxzlf2domoS9jzF9bmuMkSVEIIU7YGLIq533LA1L0Pd2pKK/cY6+tedLrotJ/HbgKWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kW6bbvnGSGg0LxnA6j7fPIxcXxvKsdWuU5eue/3H7ad2/rpYEn
	+QipDs77VpTmi3yP6MCV3Inri5yFXYzQ9rSmRhR8K+L3rbM2Bu7UzhDL
X-Gm-Gg: AYBFou0MLwyMCde772q4mScOf6L0lqE0U+1KZUCUVkhh1guF1EqAcyMuWoCifgNwngR
	bfMv/oZu1eW9Pjl6QXklrhDfFKzhj5/nkXDviLOlLaOltsc5aOS+X74/YEprN5tU3/clPyiozDg
	AfSdyDdXeBJoHFUEuY0PqN6GKSA32Ym3ZkuqWbd63LTHy6h+7jXERxmBb4gHmeYuUuD3BngDJCC
	CbpwcuVshg3dAO5+JCWcprZY1vmafChN0v/pfLqlq1U7gOSfUdXLuCxArqHO+3FULo9vne7LQoF
	+D4s8EhBhM9zTMwZBQU4LeABhgOiZvWQH4wcgCNBMvODV9SwOe3FjT2FFyecRz4YkU1PZGkSEoh
	ZAOTvwm8qCLchEMkoA9zZXjPS3mAEpZYkz/pVzNGm+Yy7ltEw5lNSZdZEXdfXLLY3a2SSwq/i6U
	4LaiIgqcZB6LqBwy4wQwWXrvQ4T+My5+Ix4eSE1ro5/LyP8aCKh1ANYWtVfdiwLcyEPjeiShGx1
	v4dEZfKSRUkUXcjVZ732VAD6EvGJaKJIMZZNA==
X-Received: by 2002:a05:6000:420b:b0:484:3147:49c9 with SMTP id ffacd0b85a97d-4871d98cfe0mr5479150f8f.2.1789761194562;
        Fri, 18 Sep 2026 12:53:14 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-487244608a3sm1010447f8f.8.2026.09.18.12.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:53:14 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 18 Sep 2026 21:53:08 +0200
Subject: [PATCH] spi: spi-qpic-snand: add qcom_spi_config_page_read()
 helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-qpic-snand-config_page_read-v1-1-a686c4657857@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3NQQrCMBCF4auUWTuQFDXUq4iUOJnG2UzTSRWh9
 O4Gdfm9xf82qGzCFS7dBsYvqTJrgz90QI+omVFSM/SuP7vBB1yKEFaNmpBmnSSPJWYejWNCdwq
 UjsF5Gu7QCsV4kve3fr39bLw828n6H/f9A0Nr4g2CAAAA
X-Change-ID: 20260917-qpic-snand-config_page_read-057cd4701c9b
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-spi@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Move the register write sequence needed for configuring a page read
into a separate function to reduce code duplication.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 45 +++++++++++++++-----------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 9e626ffbe63a..aaa40753d274 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -501,6 +501,17 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 						   read_size, is_last_read_loc);
 }
 
+static void qcom_spi_config_page_read(struct qcom_nand_controller *snandc)
+{
+	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
+	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
+	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
+			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
+	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
+			   NAND_ERASED_CW_DETECT_CFG, 1,
+			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+}
+
 static void
 qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int cw)
 {
@@ -564,13 +575,7 @@ static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *sna
 	__le32 *reg = &snandc->regs->read_location0;
 	int num_cw = snandc->qspi->num_cw;
 
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+	qcom_spi_config_page_read(snandc);
 
 	if (cw == (num_cw - 1)) {
 		reg = &snandc->regs->read_location_last0;
@@ -763,14 +768,7 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_set_read_loc(snandc, raw_cw, 0, 0, ecc_cfg->cw_size, 1);
-
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+	qcom_spi_config_page_read(snandc);
 
 	data_size1 = mtd->writesize - ecc_cfg->cw_size * (num_cw - 1);
 	oob_size1 = ecc_cfg->bbm_size;
@@ -875,14 +873,7 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_clear_bam_transaction(snandc);
-
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+	qcom_spi_config_page_read(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;
@@ -963,13 +954,7 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+	qcom_spi_config_page_read(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;

---
base-commit: ca01ebd9e2ed0ea7ed4a068bcd666b0f394581ac
change-id: 20260917-qpic-snand-config_page_read-057cd4701c9b

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

