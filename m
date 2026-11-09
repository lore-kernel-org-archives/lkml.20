Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253281;
	b=gCtYpBADVMVMwixtGySQD0DWcVIlbS32F92DQlXrs2E5W8qexBDdEYAb8xC/B9F0r4HQ
	 4q+WcuPJRDPb6YwGh7yclbHNneZHC51E35Vx30e3DC3vgFw45e2PFCq4yiSuKtzeilS1d
	 x7WwsVawLRodCnucGCX73jnsN+d0xGaBXHQ6Sc6XGFdBcqxuZ0yZpg8Wg1SwXkBa8UGza
	 wUT3G+L9uuGbvQTIMx7a9XbwuVkK8cDkzp5r3GAaU6Brcy4vXYlbaHx1sqSVKafgLWGxV
	 o61iBsyvHuMUKv+S3fKrYb67PfDtDVaBEacejbs/5/Mmi2xOHQ+g6H2bosof/fjYGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hXRH5duEyw3mUcCWcjPhOLWXWgyqrG4tmCM1l7tyASA=;
	b=MvxSpQgwCX44R2lN5CeRW+xnPy35YagI6ZZ3ekimxt9vPxDmQFC79ZqgxfeoKo2IqIs8
	 +GpRrap0DL9fSGa3mFqpv1QelieI8cfeWWHTbLaYTb0OOh58h+zqy9r7e5Z8mVbQSK/uc
	 Ga4Bj/oB+igMYuUk/wxY3/Dw9j+h935f7lPswI7tvdhZUjaGccXM7SOEIUDXdaS2JRRv1
	 k2i1BizAJJ+Qwqw2y2rasU5hG4I5IQghHKNlQKFRw6ZLND8QmH3lmO+Uwv9flkQJJaF4W
	 JK41Q2nliMsvYPqUHOiGPhBIRrvBR52TN0w/ZufkyfUtcCoIuFT9RPoEKcSqV/+IFkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQi3wQtf;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C560A2626
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0C560A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQi3wQtf
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10917435e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253279; x=1794858079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXRH5duEyw3mUcCWcjPhOLWXWgyqrG4tmCM1l7tyASA=;
        b=UQi3wQtf9r81/s7uonnwSY26mbn0xs1utlp3+GUyCw0SfFhPgolqoyMwgW9nXfXWTD
         W9mcSs40QBf9OlLQnpTQy7qF51mxpOFyXuVMHTkvQq80nyRvb5F+PkhcjMq8rpiI4Qo+
         sYobdfnPxEkv/nKx2jfyGpwLTRrIW4koiGWauCXAjiBz6FIJ0VqPuof1Q5vw+JCOohEu
         tZwznJaETXhbkF/t0C0XePOIZuSIoTXjlRkHWnEZJnxGK7Hg1E4K6bNUPUtZi4WjGHbq
         xHlPiCuOoEmEcBi3rRvAk/01rhdi/y8uV3LREBZx7CmIvrB5ISHGXkHqKMqA+pZ7zJ6Z
         rlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253279; x=1794858079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXRH5duEyw3mUcCWcjPhOLWXWgyqrG4tmCM1l7tyASA=;
        b=ptNrY19NbQHlptTSyOivnQMus+/jAUKQILF2THUsfKti5UDXscqiJv2lEbvv5ySSDs
         rG5IhwiUWEKU4k53IB0DWeGZ0pYQiOAcqTo4P9hyywnOopGg6P6+Z/X6e+PpmMDp9rcm
         K2UnOpBRuVGmXYzO/e2IVUOAT+tj/D4k+o0KhCJGwzuVMJhUd/ULRtdoEIIZ/X+u11ZB
         WbV2wj89UbUippaBIUOEft8c/QNHoXEHlNgPdzpP7O7ZCLud281kLhhLxo00xdqW7dxa
         qcwK+cXlfEaKTMi6cuaoGOMaJmtel4IvRW+t80CVMoGhLZcKd8EHCxKWTsnZDGQ5M2NC
         UxTg==
X-Forwarded-Encrypted: i=1; AL+hErF4eL19ATJwjN/diTYV8W8M2Uvv7iHDhMpjAgUdWeajVixS9Fn1jpsIA6ADykrR9GIU8/8MzwlaHoSPL7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vdjKVoV0mq2+87GuKzlTS+dQXO67//HDKsmw5nzXfPJ9hVGfq
	KXSNBUt0oJ62b8Q5orDVRWcd+jOLSYO0v8EfZLXqEXdOVTzgrE/4GR+1cd23Aw==
X-Gm-Gg: AYBFou0BFuWXU4YWAlW7ceQRL0YHsX9VXSAE2KcGYv02A2fVlEOoZCLwaRtXPZmiFnl
	7lF+sgOsbij0NAZ25K3LuVfFXuJuBrhIfgaXdB7NkS6uBQhXSRj8a36/zG5YPx8ztfaRrjoQurJ
	AQdnpqRXU7NU135UCGYkX3uGqRSYAJnIJtA5m3CnyNM1tcfS2CTOcTXNTQuKZ/2u8mUiBEDJ7Qc
	OmK+M3WBJIipABh9OIHOTftuagPlWaFWoe2WNH5vcO1uVM+dfhJZ0wIQx51OZzKVEwRrb5pJxyq
	+WoVWJQgsCu/dy0dmoOuaYqfwO174y3XsZq1THT2G3oW38rtwpEcB/wPIgylMM4Vz/QnAsshzG4
	iWxid/N2JCcrlCFJK5Pe14uKbFuBM6ZycWECKtRbiPkiSoQCLaIJ5F6Z3FhCxPHXy/atEkA7Uig
	FNst3jvvvaNDHUmwxiDDL+XiBrCV3WDUoD4p6hsBsQ35O7MT8V40dz/AtJfmNQ0kYOAJnA0CSjX
	k6y4iO/HuDrkBewNj/R0M18+e8hlEzWD1TXFQLPzx8Z42ZBk6masJg/xKuFAy0QvZnD3ltiWd+y
	rNtESR2Rd9fiel4tD0/0sx65xd23A0D05OCeDq/oSqz5DwIFKd7b81XDtMA=
X-Received: by 2002:a05:600c:350a:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4ba0233d868mr4333885e9.10.1794253279437;
        Mon, 09 Nov 2026 11:41:19 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:19 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:05 +0100
Subject: [PATCH 4/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_cw_write() function
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
Message-Id: <20261109-qpic-snand-use-common-functions-v1-4-1e8601e2db84@gmail.com>
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
 drivers/spi/spi-qpic-snand.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index a825bdb93a8a..6774a0a5db2a 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1063,17 +1063,6 @@ static int qcom_spi_read_page(struct qcom_nand_controller *snandc,
 	return 0;
 }
 
-static void qcom_spi_config_cw_write(struct qcom_nand_controller *snandc)
-{
-	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
-	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
-	qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
-
-	qcom_write_reg_dma(snandc, &snandc->regs->clrflashstatus, NAND_FLASH_STATUS, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->clrreadstatus, NAND_READ_STATUS, 1,
-			   NAND_BAM_NEXT_SGL);
-}
-
 static int qcom_spi_program_raw(struct qcom_nand_controller *snandc,
 				const struct spi_mem_op *op)
 {
@@ -1144,7 +1133,7 @@ static int qcom_spi_program_raw(struct qcom_nand_controller *snandc,
 		qcom_write_data_dma(snandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 
-		qcom_spi_config_cw_write(snandc);
+		qcom_nandc_config_cw_write(snandc);
 	}
 
 	ret = qcom_submit_descs(snandc);
@@ -1214,7 +1203,7 @@ static int qcom_spi_program_ecc(struct qcom_nand_controller *snandc,
 			}
 		}
 
-		qcom_spi_config_cw_write(snandc);
+		qcom_nandc_config_cw_write(snandc);
 
 		if (data_buf)
 			data_buf += data_size;
@@ -1271,7 +1260,7 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
 				    oob_buf, 0, snandc->qspi->mtd->oobavail);
 	qcom_nandc_config_page_write(snandc);
 	qcom_write_data_dma(snandc, FLASH_BUF_ACC, snandc->data_buffer, data_size + oob_size, 0);
-	qcom_spi_config_cw_write(snandc);
+	qcom_nandc_config_cw_write(snandc);
 
 	ret = qcom_submit_descs(snandc);
 	if (ret) {

-- 
2.56.0

