Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53D4D4893
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220756; cv=none; b=PjIBiJxRqaTezdwlNzHXnPGOQYaye4A4rwVR+yONOwd6Bg0r2+hQzpGQ7iQC/xWIiphFGBoh+17OaS0zAGHUUuKaFHv2oomoy9b8+3Fwj4F09ZhZbwzfI+lI6YaBrIlZetOF4LBHLzabLc4lbBzRpXqCuOA+JNexzJVUpD5PZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220756; c=relaxed/simple;
	bh=XMSRAA6Z6xxlL9jvU9waE1kdtHmvEad1lopoNsRdKSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OZ+QMDWsJ3MdwOigxPbuxaaNazONRwuDOf5WAc8eX0ZsNzcF80R45+giMGaxBgPZQeuWDDrkCsCELunw6iKC2k7uJmklnwgMy8xJp7nqqFS6QUqTAHKaD7VihKhySTqIzrHOWJtzgub16yFqOGhqrzOOpPu/uLxVJlOiht3H/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTAdJ9Su; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTAdJ9Su"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ff680331aso20546155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220752; x=1791825552; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KhIVGVi7iDg6wZeRjmVwM4ZVMIecRYFD2p/QE27Jwwc=;
        b=YTAdJ9SuBIyS16sriJYaRGRvdQA+MSTKXNbPY8UWR3LgL4X2v5cOzSPbOhhSCZs1Zb
         0nsljNKVu0SADniuFpFcVmKI/P3ISOz/72KanmBx8WW0IfmuD72nFr+hysiEt8KBXAst
         x77SwhNeBiKQiIaMcNMt+Y6zHU6kd6DZXcwaGzLkGoQy1Cefitk1ol1rxbvclZH7rt42
         EwbsSMt9HKzpRLprdPpEh2YIzb6Tw20OI7cv7ifr/GTgRHKc3g1ZCKIeSXhMAt8Xah8l
         EhWBzLOb78jxUjdXgq6BDh7TKHL7cuqHYQIBppmluvBIaAh1wY5V7sVP65Brl6gZUH33
         wuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220752; x=1791825552;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KhIVGVi7iDg6wZeRjmVwM4ZVMIecRYFD2p/QE27Jwwc=;
        b=wqi2IJQjro+F1eSXc5/TzHMb0DuX7CLal9BvChrQrQhWObqcrwIX20KrNqhgG6Em89
         nPtmXcFbKMd1mGJj0Bg3uvn9ntTWO0JygqFGlUdgLL2ZBCoOZnzhiCrp6a5dqgKHvAQU
         7jDkCWOTlGDzigCq0AHdfwr5oF+mXucs+skjzD1vu5L0jfaLoM8sSs0mfa6D6nWVo64c
         2jHWazbmtvhvJfhz/U8nPwCSsT4OXcdM/63ZKYHP6HDncqX7vz8Wwn/6me12IfN1u63p
         +30aDF3IdWNY8tTGMdieFnzod4SL+bfylLO1UY9XjrRzjCtltRkIcUu7DkfRevywX4M1
         3oNg==
X-Forwarded-Encrypted: i=1; AKwUvBxb8HqsPxp8WptQaH4OSe5EiCmZgOtRmU1HJe5ysCc+MPAg43w57kY8XnypBzQZaBvRa3ub4o1F8DYBYiM=@vger.kernel.org
X-Gm-Message-State: AFuF++mLNoPe7QPYo8iheUcQtL/wY1MN9ulB+liJm2aFJzloci49QM1e
	NWEATH4we3oESPju4sVvx8wf/ym/dxHDvb1G+Q3R8XVUEtoEEdgoocyC
X-Gm-Gg: AYBFou2YFOtZWWH/w1ZEK3rMuGvJc+SmWd/TXWC2TOqk0mDOyx4dA+C2WaWa0BwWAWz
	OABOMV3Tki3m97XphVVorXlPM+F6Ah8cFWLJRdhtQHyeyXv517a/eTMC5abBFG+g7IcdQw55nrt
	fEP5WBxMS7BjH8pNVplmF/YOREBHyo+TwXI1KEBeHjPlZ/OPW9KCjQzCgRLbapFnRnDeg7B6hGd
	TzfQRNiSaA24u2uKEUOiSZPT1MXIQNXGcxnJz7CescPQ3QiQLEq5Ezv1rVwFbr8aqDRvx2RRjCs
	x6c8cNxX+G9aq0u9wOqmeXcAaigEoKAWfjtQn7xpwAAEI5iID3Bb0+VvUTHjoOaUThCNdR9fiQN
	lfCHNLH1rQIcZcMH84bGRZFpDRz6lIAS82iF2Lb6y1rLMFdVIp8FZZIC79BYxkEblrzBCfIngIA
	El7Mnm18XJND4P2QfE6pekpZ8sfNPvU4S3l4cYcmuxdJPeJaOwynEPuMqXAIlfN0mEbRgZPB1zt
	9XdxNcFYiKy+LeAOImsZCTG45w=
X-Received: by 2002:a05:600c:4f06:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-4a1680b469dmr168127675e9.4.1791220751970;
        Mon, 05 Oct 2026 10:19:11 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178a17ac9sm5787465e9.1.2026.10.05.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:19:11 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 05 Oct 2026 19:18:50 +0200
Subject: [PATCH] spi: spi-qpic-snand: skip BBM copy on regular raw reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qpic-snand-skip-bbm-copy-v1-1-04f6aeda4044@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQoaKuEi1SpxoiMweiiO6et
 HyL/x8QSkwCXfFAopOF95ChywLcMoaZkH02GGVqrVSFR2SHEsbgUVaOaO2Gbo83TsZXThndUkO
 Q85ho4utf98P7frm+BPhqAAAA
X-Change-ID: 20261005-qpic-snand-skip-bbm-copy-f2d5c0219e7e
To: Mark Brown <broonie@kernel.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Trying to read the raw flash contents with nanddump, the second byte
of the OOB area contains 0xff instead of the real data in the flash.
This happens because the qcom_spi_read_last_cw() function unconditionally
copies the bad block marker into the second byte of the output buffer.

Add a new flag to the controller's private data structure, and set it
when only the first two bytes of the OOB area being read in raw mode.
Also change the bad block copying code to run only when the flag is set.

This ensures that the SPI NAND framework still can read the BBM bytes,
but on regular raw read, the output does not contain the duplicated
marker byte.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 001e4bd8bb4b..c90c2001ee8d 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -115,6 +115,7 @@ struct qpic_spi_nand {
 	__le32 addr2;
 	__le32 cmd;
 	u32 num_cw;
+	bool bbm_read;
 	bool oob_rw;
 	bool page_rw;
 	bool raw_rw;
@@ -457,6 +458,16 @@ static int qcom_spi_ecc_prepare_io_req_pipelined(struct nand_device *nand,
 	if (req->mode == MTD_OPS_RAW)
 		snandc->qspi->raw_rw = true;
 
+	/*
+	 * Try to detect when the SPI NAND framework reads the first
+	 * two bytes of the OOB area searching for bad block marker
+	 * bytes.
+	 */
+	snandc->qspi->bbm_read = req->mode == MTD_OPS_RAW &&
+				 req->type == NAND_PAGE_READ &&
+				 req->dataoffs == 0 && req->datalen == 0 &&
+				 req->ooboffs == 0 && req->ooblen == 2;
+
 	return 0;
 }
 
@@ -666,7 +677,8 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 	 * This can be removed once single-byte bad block marker support
 	 * gets implemented in the SPINAND code.
 	 */
-	snandc->data_buffer[bbpos + 1] = snandc->data_buffer[bbpos];
+	if (snandc->qspi->bbm_read)
+		snandc->data_buffer[bbpos + 1] = snandc->data_buffer[bbpos];
 
 	memcpy(op->data.buf.in, snandc->data_buffer + bbpos, op->data.nbytes);
 

---
base-commit: 65766f75dce38103e5cbfa40eefffdc285645084
change-id: 20261005-qpic-snand-skip-bbm-copy-f2d5c0219e7e

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

