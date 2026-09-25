Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5F443E43
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363193; cv=none; b=n/OaBwzbQJtYaZgHsQEp+gaUVqsMN61v2YlBxMoZRjGJ4iE2y50M1FGcF2A4umNwUfuSgJlNMQGfbpwTbQ+oAQWowc6Kuk3vwg+ouQbozd7LjlXtgjRiyT83jWo98T7IrjaQ0lQCzhlSNvH6TlR8ezrQgvyP57/lkpd31iI8C60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363193; c=relaxed/simple;
	bh=IFRr4+k7bQz+8SmOA25c5x9CqNT4NgTehkHBc+nc+ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uu1Z/5FHQRyC4QBS58+gl2XTorHk7/CeH0kGE8cCEYSuwvDRFVjL/42nVnUh+HfvJynwP27gHercSibgWiIGmx9+y4P/6AsBhlzjMa2MUPtVMgS++XndlY10B3TWOz1qPS/UAQeplN9BB8XD+lYt++y7z6lIZCg8QlF+LbsQVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPxqfPCD; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPxqfPCD"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so720027f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363190; x=1790967990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qGsLFVBH+PkOR+pSsm1K1BuRl8tuo2QZGCmeMXdvZ8=;
        b=LPxqfPCD/8k3vg9EvcfwGjYNCCd5VP3XuJVPhFXodhTh80v8vcf5a+jmtsLGP5fT9q
         WJzB1FO0XWv0mt/QTyKSRPgtAnAdK/Jvg1X8gUQIbYCCGdCP94TUYUclAoyiJoPXYQ2p
         fY4ICAzu8u6XAQcpc0shX7I7vl6WggrOksHDSS/Oof/27HkzNUpbzSvz8s/2MNgsWuhC
         cPYRkalcAZ3DuCLbI9pcRlJw6p0Y8+YuEh+qaf3QPGjlVYCKKrOJuRtUm7iP7RaPEkOX
         UG7esJLtcIAudFogeQC0GpxGa4nb/SnJaOQdTSyAGrIm4h3B+J9eqwqgETg4gZe77bB/
         mRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363190; x=1790967990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qGsLFVBH+PkOR+pSsm1K1BuRl8tuo2QZGCmeMXdvZ8=;
        b=sO9ly47txNnqKbvOI/XEay1m555d3Pvw8a6kyBY/XflTeFd9/EWoR0Q+GpDa3/UDuU
         4ezWodiTbR1SCFISxD8DIc4zP0sUUdqcf2i315F2JyROCbCZoJ00G2Gz+Gyx2qcJ5wSy
         BXJqL+PGZIGxT4fCN5gbE7r/7EqVdDYRiznYAr/hthhRTOKwht7WBRWtRpHvpHVpsAoX
         XUsdvcY7EZk+qu7tyMUlp+Y6plckAoY0louZ06hzUk2g3m0/RP0qjinjaXm1UBpihYog
         7jjw3kOolQBYZx6mPml+HFSwLZ7ZPVUhqYlXbjT4EMnpoumOHkgaAyWiT8Hbh10lOqVq
         A/rw==
X-Forwarded-Encrypted: i=1; AKwUvBywIBRygO2NTM2wChz0Wq0gFeHGhxiF8gsUdMlaFzklTSLIEVYtUkn8DStxH96HegR0uS1Ivlczcu1al5M=@vger.kernel.org
X-Gm-Message-State: AFuF++kwUedtJgFRipKofyFfGuSW1PlFovuEvsPFIILaTf4AzwtXPhJJ
	7zfeIavmK8a1F8+EhwOaUyT0RkD138cl7F87QlF/i8BsgSVAG015HaFD
X-Gm-Gg: AYBFou2tHctxDoewpD6Xaz7E/NbQb5ARkzxnGpQEa9fStCiXbuCpn86msciIO84+XsD
	2yKfWEuMiqA6LHsHEBKkP3aiV55pAEdrkyB+K+2AVkDtXfRa+dWmRMghYt0dCIeyC5GKj/eyV44
	kpECX36rYboGc8APFXersuS+5I8KwuvBKWTra/EFOoTcaAyEsHVtS1Ol9dAwDCFMJF98m8Vz4q/
	I3IhbCLuqLRIs6Al1jPITXEfRIOix5W6ZgZPI6h0MrNHJz0VHkgKOydDyVD/l0D8pkcWbxFMNRM
	3AqFgquDoZ7rhGXhL+ZWvBPCHP7TfSXwjzcMojTsdjjXBpIAgN9uov5cE205FG+HgAiWkxeASdz
	nJvg+KaDnfgNFcmJYbMqNdiB8lwyhwYJafOT78H59WeA8q5oxF/Qhl/mnCefEWptLI1WlOyJej9
	Op8fm4Ijp7pbAk4huhyDxeXcPLDYDdOCCgVE3pVQwEe2Fww/CXGjWMepFSy0dDE5kAa21hxFMsv
	tcL/4YFyPdTKj4EuigwbRmozZiV7YdccSr9XA==
X-Received: by 2002:a05:6000:4b05:b0:488:8131:c684 with SMTP id ffacd0b85a97d-4888131c7f1mr3986610f8f.13.1790363190377;
        Fri, 25 Sep 2026 12:06:30 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:13 +0200
Subject: [PATCH v2 4/8] mtd: rawnand: qcom: make config_nand_cw_write()
 more generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-4-a1b088052d6a@gmail.com>
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
index 1f3c00823309..99fbf5458083 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -378,10 +378,8 @@ static void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
  * Helper to prepare DMA descriptors for configuring registers
  * before writing each codeword in NAND page.
  */
-static void config_nand_cw_write(struct nand_chip *chip)
+static void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -1018,7 +1016,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 					    oob_buf, oob_size, 0);
 		}
 
-		config_nand_cw_write(chip);
+		qcom_nandc_config_cw_write(nandc);
 
 		data_buf += data_size;
 		oob_buf += oob_size;
@@ -1094,7 +1092,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 		qcom_write_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 
-		config_nand_cw_write(chip);
+		qcom_nandc_config_cw_write(nandc);
 	}
 
 	ret = qcom_submit_descs(nandc);
@@ -1144,7 +1142,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, data_size + oob_size, 0);
-	config_nand_cw_write(chip);
+	qcom_nandc_config_cw_write(nandc);
 
 	ret = qcom_submit_descs(nandc);
 	if (ret) {
@@ -1220,7 +1218,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, host->cw_size, 0);
-	config_nand_cw_write(chip);
+	qcom_nandc_config_cw_write(nandc);
 
 	ret = qcom_submit_descs(nandc);
 	if (ret) {

-- 
2.55.0

