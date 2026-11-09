Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253279;
	b=eKHCZ9wlctS1nzro62zWJfb1eGkkm3ujvoy6MeaubPcD6IibDZH4toDI6ABdga9qeTOu
	 GHTjuBaYE6/KtuTw1Jfx90yl/QX6BEOF9HWP9zGnHqXC8abP+KR9GDRspBFEg+VRgLVat
	 wKVKzhjZakpoYQGNF0FJaYlRCZzYQ7Ve60KjD/2ryBt1dacrs/VTQUnTdWsnFdCpTlsmx
	 tGTThuyqpRV+2yigxr8kwoqUDkwhk+198qCnFzTCI+b4iPJVsGBImmwxQEqwCfbjilYqv
	 v6gXALZt+m74F60UpVF0UheA5nSJ2zJibJQK9ZG6Bpgc3caierG5NvZizrYgRWJqymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vjB/gteyhKa5P+vqzk8KHckJQMIF77fWcQQmU9RJfl8=;
	b=KW0zYBXsl89XVt4W5haWbkWIyrYqfWyVy8RBSNUZHjvWgCBnDvi2GTQyeu8QhZfkeF//
	 nU15MSIEi5Gs0kgYS71S4QvBK5VwJA7wrE3VpvxrngfvhKLuMwy8sHZoLrk520NDctTjy
	 7yFzKXoir2wv1nfDUwzv31PYpK6BNONosMRbhDz6/SRja3N8bi65pfANl9cpi5dgm7MGw
	 5Ry+oyC/TVWFzGqTL/CDTY66eAGFOmEu4RkxzsLZCB9zPgfPMTZDLorgPokK/f0s/l9fn
	 XKKODnWPmx7AY0DGWuYGNyCcfhncYz1Ox2yJ6YQ6Q97EvkU8EzWL8iPRbehm7TxHJrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jGd/n/yu";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B660A2615
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3B660A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGd/n/yu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso9386675e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253277; x=1794858077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjB/gteyhKa5P+vqzk8KHckJQMIF77fWcQQmU9RJfl8=;
        b=jGd/n/yu4WxqhV0zfgUF+5PFskHPVqJHOa112P5FIX209dpqZWxAUR/6ROE3yteAuO
         yfwq2m1u1gcjnc2Gu8USPCE/XojE0tSrSpCHFLRLAlL4jghvS6nNiBMZX8maSJPZnX+H
         vdlcFSVbYNSr6aEXYyWIodCArCEpme55GPplHX3B2JzjR6erSJYnHwy8ZbctFIjIVbJy
         QAJATbhGvR5NtKs2rk1n/fPa4/3lJP1qAckcMEo4iQ/wTQbWmeQbK6/PHqYhpaswHQJz
         hJSJXhMI74uSPpGZtl975+8c4bPUf6MIX1RooH5wPVUal6sB099hmicDbBHVphGszFMf
         0Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253277; x=1794858077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjB/gteyhKa5P+vqzk8KHckJQMIF77fWcQQmU9RJfl8=;
        b=fjbT8XJdCT5prreSqVQuFef5r5Wx1e/fLuQYuRnYp/u3ObZcwUWiZWVi0Fc6lRnM1k
         TAycp7uzsF6/9BbuMSXj+7/W8ABu8bStBSR2jraRiexV1/jsxZBZ+RhjnyYBg3YEsWvq
         R2BIrnKD0Mg9kqKZ703pT+u1T+ZhD+H3bNcie+tdTgyy7INvWzd6Ub7qbjOL0CfZ+4g/
         EtAEI9hYEb/Et7CQxkRIyeAC6gaSL6BoHB6+X5Pk/QwH0vC5oWa/oo6To9vQWURCnJnm
         CacGK4Q+LXHqQjxzlbFCLIZdaHn3T0vbqgmOCaTvY8RGz/HzIO39eAV6HDb4wfGDtqu8
         YWLg==
X-Forwarded-Encrypted: i=1; AL+hErGyGK39iOzlhOmH+6ooINDzv1m5vJhiDOL6Y3K9gz9n3c1HmJeIJC5yYx+RgeVr9XSBFMu1N7dyuynaC8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CnKRzgn/0MkdG13J1NDMZ6ixtwGFwxySqq8Wv+ODRNUMqK8oW
	3ls8nHYQRTeSI/QvOVRi0Y2buPu588Bjg9w3Z1nD2wub+A7oOHnj5NsVoGOItw==
X-Gm-Gg: AYBFou05H07Hdf5mi7PBOhfq3XHdbNza8Jo8a4irtG5WgBDsUca03oKuE58W+5UqksP
	9ibhL050mSyJh65ei6CeMyTdycY2jnBfh9GSiJNXJQesnIqsN0EPb0alOBtSmWmo3RHlfPWep5x
	HzHefTLQTFwJnYQfrMuvpS/Z5SpWJ6JfqnJzHZ/ViysI00yZmQisLddoXsyyNDn9fegedpoJk0c
	u+4ql9KFbU7rZE9txXVSZ5z6Gm4gikCCJscUSX4AmcJmyjkQd5xoij2iqrXgcySMol9e+uydkhH
	iq+Tsuwsh89TdLxsZpbKHSrY4vATIYZ5HI4mOm3yfjzpYNcczLftUqmf05hkbhmJabDCk32OIo4
	w+ERNfWeo0pISZUUAw7nPQliRbwgJBmdag3LWgd7QGNOWAMJQ2EX9IqUgPX63sBczCfAFgArqIj
	UDKzsmLfAv9nRKKEIPCcQqGg7TSc44TNnmToy2EmwdNiQuJQAscW/AIBXBuSjjSjJ4PcAK/Wy2V
	ZtAfP4Xue6ocqN56tsLVAPmnBYJ73ua/49RzcfUA4wMzm9C8Q7OzqZPKry/jXbqOkzkSNtNCtMf
	mnRBWYlcBjQH77B14IqgB9Dko5XyB88qpEf26qlwC0XcCqeFYKmlDuW2lg==
X-Received: by 2002:a05:600c:4752:b0:4a5:87a:50ba with SMTP id 5b1f17b1804b1-4ba0235ba4amr3951945e9.33.1794253277139;
        Mon, 09 Nov 2026 11:41:17 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:16 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:03 +0100
Subject: [PATCH 2/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_page_read() function
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
Message-Id: <20261109-qpic-snand-use-common-functions-v1-2-1e8601e2db84@gmail.com>
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
 drivers/spi/spi-qpic-snand.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 981e16221b59..cf75c142303f 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -518,17 +518,6 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 						   read_size, is_last_read_loc);
 }
 
-static void qcom_spi_config_page_read(struct qcom_nand_controller *snandc)
-{
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
-}
-
 static void
 qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int cw)
 {
@@ -588,7 +577,7 @@ static int qcom_spi_block_erase(struct qcom_nand_controller *snandc)
 static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *snandc,
 						bool use_ecc, int cw)
 {
-	qcom_spi_config_page_read(snandc);
+	qcom_nandc_config_page_read(snandc);
 	qcom_spi_config_cw_read(snandc, use_ecc, cw);
 }
 
@@ -758,7 +747,7 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_set_read_loc(snandc, raw_cw, 0, 0, ecc_cfg->cw_size, 1);
-	qcom_spi_config_page_read(snandc);
+	qcom_nandc_config_page_read(snandc);
 
 	data_size1 = mtd->writesize - ecc_cfg->cw_size * (num_cw - 1);
 	oob_size1 = ecc_cfg->bbm_size;
@@ -863,7 +852,7 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_clear_bam_transaction(snandc);
-	qcom_spi_config_page_read(snandc);
+	qcom_nandc_config_page_read(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;
@@ -944,7 +933,7 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_config_page_read(snandc);
+	qcom_nandc_config_page_read(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;

-- 
2.56.0

