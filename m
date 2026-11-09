Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253285;
	b=Ji/tyd8SuqJ+8r2lgeGO8/yoTuOQUTSGfmetbY2rWpClW9iXBC7wGjQBDJIwjh1ZVo91
	 B0cWlXaq5HH0kxbZidDoOEm7RCprGKBdSlxB4DAJSpT6LgnAlkOGNU6MAF6bOA13VdY+y
	 hcciekIT2TuxtE7GIq5iZatP81SJDzy7Czg2Xh3ay0zuOeGBx0JLA1cHo5qrOCMC3SWZT
	 +rjs7Pxd47GAVYYodNZ4mmSLwR8jGy733hub/TuIOsGLkhPsq35y/vmrhdlR6fIDibYdP
	 e/X88lILrJnySoRgjkDGi0yNtIm4no7+eO7zJP6Yhaq4mMUk4coctugzstyWTTF8rLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yPj6/SqRUU4G27b4S8AB+m7SzAAWnuPJHVAUoCo488I=;
	b=HFYbUou3ldY5IwDtix+HRbKcc5sZ35rSRl3OJ7F8KPzz6aA7vWB3bSXDirMjdKqyzF1/
	 QPJi70syAJzFe+m3cte8TuoFDuqMdpw1nmR2J1IRDEuD8ESgVD8vH42FdnlABDehvxtaO
	 mKG+uluPtT6jIlPcnoUYGzrPOM3vhUZkw59BjkozFWUGpyCLtNqfJFROcWGAA5oHqzxBF
	 sEeJWNOpfRsIhvuhs/cNCX32TxVAGb54KDHugH2CcnPLhvWLyWuDG0L8KWHQr6ok4mBa6
	 7Lm5Xneo3K5+glcOI6/6eNdYnMAID6twaDDv6NPxSextPBuMLbZgxPcLMknOoVtdbbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7fieBjk;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D553660A3814
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D553660A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7fieBjk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so15716365e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253283; x=1794858083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPj6/SqRUU4G27b4S8AB+m7SzAAWnuPJHVAUoCo488I=;
        b=C7fieBjkZqxonGqisjpuD0Y/A7tVT7XygPE/N27Qly4Tnwewfo90QxxH3C+e8jTf1S
         aoalvkygtChaebkuwASQ6SQxeaKorUJgxXBFpOZU68z9G33CDqFktSYW/PXNOQsVlkYs
         78E3VP3HD2aYpcmz/IMtrl8jgR3QpoBnwheQ2ZAFKxuvtlzONRRpP+uz/aVdV0+jkJZH
         RPGVwM+y3484709lK/WkC1nlGA8UZN1rshZLtN7BlwdDBvbUKPh16idZDEvQsmUfoALQ
         SbLoBgHF6XXz3Syoppl3zK71WB8iMq+j4ewvPW3tFfaGyvvDeDLY9ml8h7sS2IpoGV9P
         jO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253283; x=1794858083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPj6/SqRUU4G27b4S8AB+m7SzAAWnuPJHVAUoCo488I=;
        b=LivkbBTgg1qA/rUfjK1GbfBnnXglo8oLGi/NUNwMYgAmkJkg7mFX1p4Ga2p8zdrpzE
         xeDPHVUUTLLQNY52mu4Lmqb8+IFZWk+nkmBrfZPCWoNjl8sBm7VOUTzi3mF9Csaq+iAf
         YxUHI4WyRqAgoJIZOnPgWjvTIpMJ4WqcDp113F5Z3pO33nRLNsyH3wH24TZg7vbTOK8p
         7MKOvN4tcPduhM5y9vzjHNJUTAMAvU6kMvnLAGk8pJ1Jtfm4keMgCeIQLTps1+1ew1Dp
         H47h+/nW9Qfj4OpJLEX3s7hl36GzEMkFEPQ2pekdiXrpFFjL2VJErHQ6uZrTcsn1Bjin
         iW3A==
X-Forwarded-Encrypted: i=1; AL+hErGEPcbXnkcCoRnhoDGJzdu748b8KK6Jpx1M8V82bRdbnI22HL1Wj2YRltskzPtV9e8Jjda961JEGe8fjG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wfQ3FDCeDO9aaWL4HroiN7wj/LlpfvNEeVL/pqCNSEA2pJuDX
	Y9g3JtKkd4gPEZQTWxYrByBZomvHl054EIOdZLKs58z5OL/0BlZeV9Rzsk5bPg==
X-Gm-Gg: AYBFou0X6YQ6nOwCh2T5oJUP/Y+fDkwNGzAg7b/am63SVNBYpk+nsocw31Yl1QxRVCG
	+OjVmf93ucAFTXfHAoGxbLIESOL9BN5TPvrialnfUOD7YF7bRoI7T4Dtmq0Q62Z4LWlV/XdLPmH
	+XZZ28kCfvCi6S4Zqs3cBF25CLFb8E9pRHj5VICG2G6txdosE5O5kPnubHv9RCkVUtSey1m620y
	gWcIiG2sbK+xsh/2n5qbNaStsgXHH74142CJAZI1eqDnKl3yS0rCz6EbfVdndGPnUnDZRleIrai
	4Dn14Ies8f2/SymtHODwdkCfH9z8Q8TXw8E8dckjYsWAVzdJpKHrk+SME0Miso203wB56+ZjJEZ
	q0qR8ie8GzHqIUgaE9DnprB40I6QyhrwyfZ7tR0SZGBkGlGT+VICzHZgBW7ARLKXcQsJB2M8r1C
	JCWTR3+bJ6sGMoy+9emfEZcPMX4DOo1FdC7B0bcd3hg2V/+JNF69te6LEVpLeuAMzlOcYy0zKmu
	RFbVA+J9JGUzihs/jXOZpxX4lsaMPeSqWqT2xFUltM7JseEw/82ENcqzf8itRdp7DjMx7MTo+sG
	FiEdZEwWeK1fv3nQNmQxqCl6u3iUEUrY7YCsE/uf72hU8ZYgLmq61zLVbxJndNEwNhoefhIOfIY
	VW14=
X-Received: by 2002:a05:600c:354a:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4ba022ca866mr5590405e9.0.1794253283177;
        Mon, 09 Nov 2026 11:41:23 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:22 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:08 +0100
Subject: [PATCH 7/7] spi: spi-qpic-snand: use the common
 'qcom_nandc_read_stats' structure
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
Message-Id: <20261109-qpic-snand-use-common-functions-v1-7-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The 'qcom_nandc_read_stats' structure defined in the 'nand-qpic-common.h'
header and the locally defined 'snandc_read_status' structure are
identical type wise and both are serving the same purpose.

Drop the local structure and use the global one instead to reduce
duplication.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 4105a04afcdb..6c5878f3f8b6 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -64,12 +64,6 @@
 #define BAD_BLOCK_MARKER_SIZE		0x2
 #define OOB_BUF_SIZE			128
 
-struct snandc_read_status {
-	__le32 snandc_flash;
-	__le32 snandc_buffer;
-	__le32 snandc_erased_cw;
-};
-
 /*
  * ECC state struct
  * @corrected:		ECC corrected
@@ -610,7 +604,7 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 
 static int qcom_spi_check_error(struct qcom_nand_controller *snandc)
 {
-	struct snandc_read_status *buf;
+	struct qcom_nandc_read_stats *buf;
 	struct qpic_ecc *ecc_cfg = snandc->qspi->ecc;
 	int i, num_cw = snandc->qspi->num_cw;
 	bool flash_op_err = false, erased;
@@ -621,14 +615,14 @@ static int qcom_spi_check_error(struct qcom_nand_controller *snandc)
 	snandc->qspi->ecc_stats.corrected = 0;
 
 	qcom_nandc_dev_to_mem(snandc, true);
-	buf = (struct snandc_read_status *)snandc->reg_read_buf;
+	buf = (struct qcom_nandc_read_stats *)snandc->reg_read_buf;
 
 	for (i = 0; i < num_cw; i++, buf++) {
 		u32 flash, buffer, erased_cw;
 
-		flash = le32_to_cpu(buf->snandc_flash);
-		buffer = le32_to_cpu(buf->snandc_buffer);
-		erased_cw = le32_to_cpu(buf->snandc_erased_cw);
+		flash = le32_to_cpu(buf->flash);
+		buffer = le32_to_cpu(buf->buffer);
+		erased_cw = le32_to_cpu(buf->erased_cw);
 
 		if ((flash & FS_OP_ERR) && (buffer & BS_UNCORRECTABLE_BIT)) {
 			if (ecc_cfg->bch_enabled)

-- 
2.56.0

