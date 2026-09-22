Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109DF4A3F1C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106606; cv=none; b=JlML0v6UyPhUJQ6fwfsZAuQ0avLGFiN/0ede+YqDU+zQlYWt1HZWwJp45wORc8MutQvbu4OjKZxv1rmTCNHI5qx16CITcEl+dqzQpKpREhewd/mKiJSCCQ4rlGD5yzh49rphIfLtV88B7yhclNeG5Mg/ZrW/vyYjvE27sgUezdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106606; c=relaxed/simple;
	bh=6hHR7aNkwpc/Z/OKkHBG+3SUNPzcTX4j+ywWnDHnsqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ueuc/9z6jAQtN8aXv/1YvlSoLWxAVMCWExRSJXi2E0n0K+UWfU0aUMtHdSpscWRuVK7GzzZjay4Vem6twhA3pkkaimCJQo4cmoQd7cuWa9fIlVek5DE9xph3bo30eXC1ww4fUxOuWVHpuj5yKpIIBf3KLbLQf0zgyfOYpD4SaIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNKRQYyb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNKRQYyb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso1068985e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790106602; x=1790711402; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g0QuVMlMWUevT7QcuyRM+FePdkLtnJVfWDEQgXRfZ/I=;
        b=NNKRQYyb+L4pdaynbf/sw4o9J0QlH3TgwSISfTwXh9qD9y1V2cd/lsUom/EzVWZum+
         vYBmhjJkpRA27S9tfLmzk2kINYGs58/TLGjBZTdVJCfI8e7N7/Dd3DAt6w7z3PCTHUJn
         XYH9DL57b2Q0/byMoV2YUHgrx+jsQYz2NAGGKmvRku7+2i6kQ2ousZyi0G5B8AyPlSMB
         bdRNsxO69Htbs4047p/8ECtkjc4x0hvFjitmllwciHuQjVyqZYX++IZGGbzaiyWvE4IG
         L0fIr2mIH2i0l4wtrqDNdRHfDZh1UZTlda9guci+GJDde/oLj3iltEzLksQ9x++ogplC
         aaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790106602; x=1790711402;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g0QuVMlMWUevT7QcuyRM+FePdkLtnJVfWDEQgXRfZ/I=;
        b=zyW8AJ3uYAfOmrKp9HkIz7giKUjEJY6NtkX73dM7iDjTPDymkaSKp3p6nQF94zIsZo
         v74A73AvKTaF5MjrzEMM2/iGg6GgnKwt8W8xplDl6NIqfkRZecITXMiOM2JlWwG0Gh8p
         EUgEZ0AYXBrDN6Id25D3qFQDC5Lhq7MySTUgueVxE5PVKFaA3eg7+57+HftCtEku+cj1
         hMkmE7CdATdIYP1+2v/2L0tup1D0/NVixTTAHcaxQFrL5ylRRxzOxb9Ul0EIoxrgGoCv
         E5w0r9gsxP+kY8DS4Fi/Ip7FueVHnj2w3iW4C2uONinXssgdJz3gf5O2Wdy3Fequcod7
         wg/g==
X-Forwarded-Encrypted: i=1; AKwUvByV6oU8+7B9DMBjYRlnEyZPTfzkvaJqBQ7drgcpso3xEL6EjAhXKqGdpwERIpfAG7zJHbjeEXWwaPr7K9M=@vger.kernel.org
X-Gm-Message-State: AFuF++ljkN3300ejfED0fI5+9l319DJ6/H7zOWzoJUN2JCUUokLoTaPu
	oDsePT2dCMjJfPZ07LIc6WcsZd1GFNyJNjCVDOaA/NmZ0+S26WmGuTeqQDp4AQ==
X-Gm-Gg: AYBFou2WFL2KzPG4wQVJFuAN2OMYh2341Gg4aK5GJnk3UnwIGLoa8qKJyVY21KcMsI8
	S2GCsNA27B+JxuzyFmf3t5bWGFOea/rNWXiz8bJEtJNAtEJJsbZiX/Yhods5Rfl6t8Fm1T86v6w
	9KtF8hciPf+UguMCPfrFws4Tc7ZI+uPxt7BAkLYtzZqghnrH+ky2g0733bS6cnLM7sTX699ACVw
	nyStqo3wKcPmnEnauC1lePquJR3jW6lh+bYJ8+HhGi8C1EFiYlMrRJjNJ9ig5Qi125Z8Pz+3C3P
	LG0GhiVlYumAw/tAhmFMEBVDTm6PuX6+KKyqTDADw1jcXfHzcSxCv+i/jxZegVaRFSm71vJLEx9
	PuIY6E95GxW5B3/W6p8sbge8knsPmN5duw15MKnBcmgDDxKTnDY002AHxIhiuX8ocntEjoKixoR
	ckRalZUsf0fjwwX0E/JhZI53qroJ2KvVzLownHAupplwdXBuHtggXN8scAaoGqLntGFOKLvOg0q
	YU0arc0fCvx5dXsvyeAS+MTokg=
X-Received: by 2002:a05:600c:81c5:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fdf13b84cmr3269845e9.22.1790106601998;
        Tue, 22 Sep 2026 12:50:01 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-488684863d9sm714041f8f.12.2026.09.22.12.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:50:01 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 22 Sep 2026 21:49:55 +0200
Subject: [PATCH] spi: spi-qpic-snand: fix read location register handling
 in qcom_spi_config_single_cw_page_read()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qpic-snand-fix-singlecw-readloc-v1-1-41fd834a10fe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NywqEMAwAf0Vy3oDWB9ZfWTzUNGpAojbgLoj/v
 mWPA8PMDcZJ2GAobkh8icmuGapXAbQGXRglZgZXuq70zuF5CKFp0IizfNFEl43pg4lD3HZCaqj
 3U1N3fm4hV47E2fsf3uPz/ABViwQhcQAAAA==
X-Change-ID: 20260922-qpic-snand-fix-singlecw-readloc-c4c89b4369f5
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

When the cw parameter equals with the last codeword, the
qcom_spi_config_single_cw_page_read() function configures
the read location last registers. However it completely
misses configuring the regular read location registers
for other codewords.

Change the function to always configure the registers
corresponding to the actual codeword.

While at it, also drop the single-use 'reg' and 'num_cw'
local variables from the function and use the respective
values directly in order to make the code easier to
understand.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Durig writing the previous patch [1], I have missed the fact, that the
qcom_spi_config_single_cw_page_read() is also broken although in a slightly
different way. So this went to be a standalone patch.

Link: https://lore.kernel.org/r/20260922-qpic-snand-fix-cw_read-readloc-v1-1-67f6819fb3d7@gmail.com # [1]
---
 drivers/spi/spi-qpic-snand.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 05efe6313b7f..32bac31b5f00 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -560,8 +560,6 @@ static int qcom_spi_block_erase(struct qcom_nand_controller *snandc)
 static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *snandc,
 						bool use_ecc, int cw)
 {
-	__le32 *reg = &snandc->regs->read_location0;
-	int num_cw = snandc->qspi->num_cw;
 
 	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
@@ -571,10 +569,15 @@ static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *sna
 			   NAND_ERASED_CW_DETECT_CFG, 1,
 			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
 
-	if (cw == (num_cw - 1)) {
-		reg = &snandc->regs->read_location_last0;
-		qcom_write_reg_dma(snandc, reg, NAND_READ_LOCATION_LAST_CW_0, 4, NAND_BAM_NEXT_SGL);
-	}
+	if (cw == (snandc->qspi->num_cw - 1))
+		qcom_write_reg_dma(snandc, &snandc->regs->read_location_last0,
+				   NAND_READ_LOCATION_LAST_CW_0, 4,
+				   NAND_BAM_NEXT_SGL);
+	else
+		qcom_write_reg_dma(snandc, &snandc->regs->read_location0,
+				   NAND_READ_LOCATION_0, 4,
+				   NAND_BAM_NEXT_SGL);
+
 	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 

---
base-commit: 3d743adf090cd4c9a2120c1e02b0482e88aa0d2d
change-id: 20260922-qpic-snand-fix-singlecw-readloc-c4c89b4369f5

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

