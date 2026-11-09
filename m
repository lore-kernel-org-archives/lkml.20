Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253280;
	b=x+ZdiyMYPgi70tioVz5bqVGTRE3XPgvk6P5EeHqE/woqJ19tyNyEqsvFxnGaUNy9sDrl
	 1+tWVPoydYAbofrfe2YOz8YkyG2RwkdDCln57FmE7C2ADprmGdCMW+oWnOBEd5eWrczJd
	 iv2EALQ6Ke4bWtdYmyd0+IgGJl3nc3elYWgjsFn2iLV3o4Kp35EYWS7b4ZHTM1J3FEhb0
	 V/2ZWnOngJg6qmbQM6b5n3dXISy4TojRRMpi0JXMdbIldrSEUq5PUxppr/EQ0AHdJ6YaC
	 DcphZyhp4Rpz4TIAI7kZky/D24LPCJfugMtvULu0KAAPHVI4Y54OWdZn3gzoWe5tkaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uRO3Gw4B7BUYegkURbfJRBwxO65C99A7i3r/+iHeW/k=;
	b=ANHygSOb87cbhxKWeyd9Z4HS435q0NAK/OJ0O+PymOGU/TQW/jhtxGyD/zTyjLSO0iSF
	 PSnIDGDupRU9WHq4zix/DB/13FW8cA2Op6uoPNMc895TiL9Bxv5KDIAUkWk0TYQkuPhMk
	 nU/jmdSH3VzvU0AVDLN7Re40cCyQfT1l6tGIXZX3Hs4XZApKJGjY3rcTflDnUsxlD3qpS
	 V61RtV66SSxGDdXxi4LgqNzLHmk50+qLKqPpppCCPAuS8lsWIC/mbmOkDCNnklsxevt89
	 u0PzV5jLxntlh0hq26H0IWGqIP6pEqI6mxIWVEp5OBkCot9dipzGYggaFnb/OtGrmOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+NBXR0a;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7360A261F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C7360A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+NBXR0a
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e4831c028so1365207f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253278; x=1794858078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRO3Gw4B7BUYegkURbfJRBwxO65C99A7i3r/+iHeW/k=;
        b=I+NBXR0azYvF6cvFg98dnoMTttO5Le3Wx8KqBFYGClkExkrjW3QJAHfa3w5KZAWwbU
         7jNl1Q0KbVFFQZIT79ZVSt/6EYLuD0+J78DY7lsSyw6MfKBLpmL8FjlwHS9WQapxna3P
         yK6RGPbzueYdDgth9nq+uJVcLByRlqOl25RMfIyAABud5tHt1hBQmUsbkw2C3oUF9Qsh
         yr7iocfk8uN+Euj+QG9IDFRoRWnuKKQqupIY86SVjSr/j/qPzFf7YZF7bpZVQddHR12f
         VvBp0ZsNk3Sk5nnaoNCEVvXGCnZYpM5HWzBxofAlry0eW5ZmaY2n4iF3osQv3CMaCS5X
         PhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253278; x=1794858078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRO3Gw4B7BUYegkURbfJRBwxO65C99A7i3r/+iHeW/k=;
        b=lPyCaG8SVDheV4rwB4GR48HOr5ufS3Ve/I3hC2WFM5KjsAH+8YsLLS4M/okPSE3Hgh
         XYaCPUtFRaunau2Yq3P5r890C9L8Au0C3htyjNiL4RigRkJn3coEcmMU48y81O6cR0IW
         wZJxFU6bJ2OXYSJW1k3o1AG/oydoPIDB7/3o9BppmvumWpaAPIY8ECzBaQp5uQ2OtQDu
         EQtuUp2j4EN+TxSzqetDj5/yahVPWfbKSKQnDHiyVpP8bZm+bCjiB9Jb5ExxA/tNZKw/
         jxHXBbdd8KGu3vRdnJHPiswDRJTrijHYnUW2eR/UJk++25COIpsPNhv0US5O246X6pPp
         bahg==
X-Forwarded-Encrypted: i=1; AL+hErGVT9YWK4V41NJ+NVNghy68LRV7ToeU5inrowNV+EvJFPMpaxs4WgXJRSRo16b0AMWcQkB8NqCXo1U3X6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z91AajBpiueF8yRWPy2Yyb3RyMPmI2JBSaqAdW341A7buoXgMaD
	vNg78cpLcXi2TDB2Y/E6+E2lOJWxtXpr7NFcW9p0nGYMTYIvwOgWp3o/0E5aag==
X-Gm-Gg: AYBFou0++8m7KyIMCnPaQVh01CxnH+HdUPbMmsntOExVVowW7ulif5C6ZJU3qC07U6F
	Q6u5mdSDAsswILszC9IjUrtrwUvAwIJSUv2mthAxg1H9rejz6/caucY6QpQ4dH4gY/i2bKxEccs
	mHIoltLYLlFeph1MHQbd6TU2/A4ZkVuSPdWF9Tbboc6kWIrwMJnJ3is/g3TETIeWo0Hz20BVcPk
	LDrmJGNLCuMrGcIN6dnd/dDGbGIsFaf9AtUpF8nagml7q6hE2g0gPLxWz8r3b+ksIJiNJAEtE7c
	oa/edSi2DE+TqKPK1f3ifriw/0jgvg58dwdC5xXnUoW5y9tEbLnD1B6LvYuMKno65F2oM18RJh6
	iByr7agv3ACoGDqoc8Qfq+v1lLmC6/2FignYT+Jvz/lmmFPLHa8wSJIMGEEAFjBftTx9RSucT8G
	McVlzgJxbwI2I0BwaKRJC5LTyvfJWUVQSZ6Iu5EmlqW0b3a5O83M6zA4ZSzdWBFF+xu7bqCpFez
	CEj/6axnYN7jTAU/pLNsiWTfJrryvpdbAjQBTu3DtrNXmHOH1pBMAneu3fYz785Hr6gxx+b+F8A
	Qr6l4IkN46mtAz/A6zAptKPqvVu4ODieRvZmIwT2NOw1c121PRlRjI6ZiQ==
X-Received: by 2002:adf:e00b:0:10b0:490:9fe2:6a37 with SMTP id ffacd0b85a97d-4982ecf6412mr609375f8f.17.1794253278240;
        Mon, 09 Nov 2026 11:41:18 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:17 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:04 +0100
Subject: [PATCH 3/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_page_write() function
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-qpic-snand-use-common-functions-v1-3-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The common function from the 'qpic_common' module provides the same
functionality as the locally implemented counterpart.

Use the common function and remove the local one in order to reduce
code duplication.

No functional changes intended.

Note: in comparison to the local version, the generic function runs
additional code when the 'nandc->props->qpic_version2' flag is not
set, but that does not affect the behaviour of the current driver,
because the respective flag is set since commit 52efc89ccf66 ("spi:
spi-qpic-snand: set 'qpic_version2' flag").

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index cf75c142303f..a825bdb93a8a 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1063,12 +1063,6 @@ static int qcom_spi_read_page(struct qcom_nand_controller *snandc,
 	return 0;
 }
 
-static void qcom_spi_config_page_write(struct qcom_nand_controller *snandc)
-{
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-}
-
 static void qcom_spi_config_cw_write(struct qcom_nand_controller *snandc)
 {
 	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
@@ -1113,7 +1107,7 @@ static int qcom_spi_program_raw(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_config_page_write(snandc);
+	qcom_nandc_config_page_write(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
@@ -1194,7 +1188,7 @@ static int qcom_spi_program_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_config_page_write(snandc);
+	qcom_nandc_config_page_write(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;
@@ -1275,7 +1269,7 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
 	/* override new oob content to last codeword */
 	mtd_ooblayout_get_databytes(snandc->qspi->mtd, snandc->data_buffer + data_size,
 				    oob_buf, 0, snandc->qspi->mtd->oobavail);
-	qcom_spi_config_page_write(snandc);
+	qcom_nandc_config_page_write(snandc);
 	qcom_write_data_dma(snandc, FLASH_BUF_ACC, snandc->data_buffer, data_size + oob_size, 0);
 	qcom_spi_config_cw_write(snandc);
 

-- 
2.56.0

