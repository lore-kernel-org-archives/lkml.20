Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253284;
	b=yuyMQpSI4fHSg79j1O7v1SSUGw5BR0LRx6FTNgDPQTlbV+qUoR3gtjNWwjb7GgjtO8mN
	 4VPGTMEmHAvr2yCACVIfhL0AEQF5Ftb6FPYUUbkjQzpKK48AdDr7YCjQuqQvQrCGisRTo
	 blN4HMz7hBNLWR/R0XoX2XRSAXunc/pivmV+q/ZjP9TOJED+mGhNr9IR9CyiYVCO7F4zh
	 1bvS0gztk46+WAgq3RduJAS4Y9QmXoH2rKCLpoC9SLToPpqC2Ly2QOrmWjrKMpBipUatz
	 VhJeMa3cWAEqrWOtGNTWBshlzPmE1KjxNE8tyKVxT4QUuUQOKiVftQ8A3B48T8qG9YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wZi3AbEuRwrPOxFpdt26jeERVpxEwSJfhncQlRMhB9g=;
	b=tKxGansojtZ1mzo04zTqfmuruKBevQjXoIg6CDWqjjRuF23rjNB4gtt9nhtgHaHS1i5q
	 0T5MX4hKrsxA8/2ume0ReSJSGfkPldOFdtC2HdznaGk1CeWihVjd/oYksxLVCQKf8jaMX
	 RjQDwzEp+dLfya0PxIrR8uAT4h2WVLX6QTnfLgQYuNeK/rSZNAP8uVzP8T0jSvmS1Liy7
	 h+QSwOTHLG3PyinTs/wJ051KiwsGfhdwcnjc2IqJAVjCgnXFOKyHmCG4RDgtxQk64uuYR
	 JBOuZIsfTWWPn1T1JnKV2sD4ffeOwwkJ+pebek2VnZUjHUGr1SnkGVOKXqUqcPU1h5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CepEGuOM;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F3860A380D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F3860A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CepEGuOM
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492f0a1b685so869126f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253282; x=1794858082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZi3AbEuRwrPOxFpdt26jeERVpxEwSJfhncQlRMhB9g=;
        b=CepEGuOM2HlTOQq37OEk1WIY5J9sn3vF34fjvorViNxe5MPe06DCSo6Nd0VWDi7WNk
         hUap7YfbBW0Y9zguKlVZlfyt51Id1ovZNRhZ9xW5cXWz8jaWtGuqo8zoKaJ8DBrO6IvJ
         Gv+uWSq2sprYwO8bNaTp3jsHdNOf5OrUQQruOXPs2cK2lzC8NvIw4jWdDrIeRSnYgMfK
         XqalE6g6Qnh/8b6Sy2AAsKgKsZq7YAvMWVuyrbchKAQvumJT1DNYOQq+X8kBDzqS4LC+
         iFvJNcrvl5yNwIv9uyLW5c7fhf4IzTPxzbT/r1JAlJR1hVbcNtz0H3Zpd22EDtKB7d9G
         JMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253282; x=1794858082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZi3AbEuRwrPOxFpdt26jeERVpxEwSJfhncQlRMhB9g=;
        b=tJu+eh1dCP2vpgI3tyuXNCgcvWX8bgZY3zGzWmZ8f23150PSmY7YL3wJx3KcipVIzR
         VCsCTxIOsN4S5OzXOZ/4CHFDkcbkMNrjb+qcRrsz1Wq+Yu0gyMXHM9O2nqEg5sbogJ8x
         7m24O/erkT17vxV85LDBOrNi/p1ONMn3HZNYD4GxGFYtlCD4IPNE5/apBgaQZC0+g+IP
         +1Ysm4i+sPErZHDLaMqOD+nWpZ/2gRZy+CXyqzs2ab2U4A4rmlqLnIP5DYEOjbtnqbZu
         lcnjw5WXVRRfNx5tRVQMxZM6YESaDFQ0LbSuSbNB95J2su2GTCrIdUDMPkv81Xu/H/yg
         opMg==
X-Forwarded-Encrypted: i=1; AL+hErH664dv6P+fSQyWmZMQ1BP4UcBWRcBUf250gGjnTbFuGsln8FCngABpE2tYUBcRXWxIdxwu85luZlyajUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kCaiS4xJLZnSLhW1DkOezDsW2qRzG5NAu+6+lsx4Hi6LfNSnq
	PHMF+RuPCq1cyl1e2GSkuQjq21PrtFui28N82oOyPXy0DQUsZ/gE7EEoPRro/Q==
X-Gm-Gg: AYBFou2k/aLUunazsNDP0R6wt4/NShPx9q6KpiF2SkANF5B2v1asZgd7KEVJe81SIYq
	/Kk4hnVP6IwuCnrhNKw1y6mkZ6xkqOdWIbkLX1VvVgBxjVhR2m0gvvjjjyEMEbme/QSE7AfTH5X
	CN68iS/pP5wmtFNg2crz0y89lXMT9afCmLmUNgdRhhTuadm8/0Yo5t56JEbWUQkpcAED4PSlXgY
	QPR3R1zqfF/Z1nthRAvE8c1ZJidTmFOddjnvUqFuHeMbohwa8wv8VGpKZd8JzXCYE9wfC5lnTK7
	lfrzow3iJ1JiBRb6BdRPb8oqg3W6Tjm1wJs7FSGUfEyVzv54sI+eTH0JifEoShfy5d2D/AX0xvk
	porLFakSiI/bLMCO7jKduzzZxTSSB8z0oVMDok4SBD9anQVcmqHNUBybX/gd7BO65dN++lQhex4
	N3Re3/0DWyFU1sfzYp2gLmR2c0NEhcBEL5RJFp6+rm5iK1hfeYjsal5wnOHJ6F07oO7COnuJvR+
	fz2eeXidrOfEMidaWVhkJGoRkZ6aJZaUrb06QcMr0pngzQk9qPgomEdVvIU0xtmPBFDMmN+vLiR
	noh0hQbBBpUmk7MPV50XS5FiXCtVKAlNXBaQofC28RfcT134yaFKx7V0rA==
X-Received: by 2002:a05:6000:4028:b0:48e:2f7e:bdbb with SMTP id ffacd0b85a97d-49830d81993mr835355f8f.50.1794253282019;
        Mon, 09 Nov 2026 11:41:22 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:21 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:07 +0100
Subject: [PATCH 6/7] spi: spi-qpic-snand: use the common
 qcom_nandc_set_read_loc_last() function
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
Message-Id: <20261109-qpic-snand-use-common-functions-v1-6-1e8601e2db84@gmail.com>
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

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index ad91edd5f6df..4105a04afcdb 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -122,27 +122,6 @@ struct qpic_spi_nand {
 	bool quad_mode;
 };
 
-static void qcom_spi_set_read_loc_last(struct qcom_nand_controller *snandc,
-				       int reg, int cw_offset, int read_size,
-				       int is_last_read_loc)
-{
-	__le32 locreg_val;
-	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
-		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
-		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
-
-	locreg_val = cpu_to_le32(val);
-
-	if (reg == NAND_READ_LOCATION_LAST_CW_0)
-		snandc->regs->read_location_last0 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_LAST_CW_1)
-		snandc->regs->read_location_last1 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_LAST_CW_2)
-		snandc->regs->read_location_last2 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_LAST_CW_3)
-		snandc->regs->read_location_last3 = locreg_val;
-}
-
 static struct qcom_nand_controller *nand_to_qcom_snand(struct nand_device *nand)
 {
 	struct nand_ecc_engine *eng = nand->ecc.engine;
@@ -490,8 +469,9 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 	reg_base += reg * 4;
 
 	if (cw == (num_cw - 1))
-		return qcom_spi_set_read_loc_last(snandc, reg_base, cw_offset,
-						  read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_last(snandc, reg_base, cw_offset,
+						    read_size,
+						    is_last_read_loc);
 	else
 		return qcom_nandc_set_read_loc_first(snandc, reg_base,
 						     cw_offset,

-- 
2.56.0

