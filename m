Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD945D19E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099471; cv=none; b=HPWO3ayXox3hcFltp8m1aXF6kbgbGALHIOxZH5GT3pDoYox753AXngqhN9NELVnIWcL63bpseRCQsTa5I2y1dw9I7IQ27rFvRTd/8AMF/qeTucTFNnYbjKly8PLve0xT822AubOZVEXCS8/e9Smke5XHY/+nA8qpLeR8S7GGE+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099471; c=relaxed/simple;
	bh=LfwBREZFm/uvbnLQDpjPD52GUyaT48FmQc+LONqtZ1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A6A1/A8lqOcFhqzRtZJPlp5qt2V8ZzYNroquRRHNhb67oN/9Q6iBFN+lHB7cJweXZ+HYVnFBeXcFqQwfy0UT7lTgyTKhowPU/mzeF1g+hQ8B/2yfHVJ3ZXo7i8lBUroePjBlu6O51p1c7ftIKbrV9TtsP21VbalIsuxPE5tRUXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJqToyBB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJqToyBB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so512165e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790099468; x=1790704268; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wMdh+dikN9LkfGwgot3m+LYXaGNeI/YyYQXw0DCrPPU=;
        b=kJqToyBB3opLFFDa6sqrDtsojWG65QN5Mh82Oa3tVDnprugAl4b2gHHZ0lEdAbW88Q
         ouNxmFVG8JDIewih5GEVxZ0VQXzKDRUbnzO2UUHB2dRo5IPBiPRtiCTSZi+8/xY4qjCK
         1OoPGwO3R+jEiNDcfz7RbjVBCaj2AfDDSLmDqUBzQda/IV6ADV/Ig0TMNMocutzX6elB
         TeVweVP+kGHUlnN9orG1AyMEzDlWir1nE/F1brnHaAPp1n7VBUVv9jkJ5m9HWJL9U8uA
         lBo3LRbbuxeM7ZE442eU2+qrUcI1fT4E0cxl1cfKPHsy+pVZirZl4JkwyfamX3tWGp2n
         Q6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790099468; x=1790704268;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wMdh+dikN9LkfGwgot3m+LYXaGNeI/YyYQXw0DCrPPU=;
        b=caQfMHu384FF/RJBIBzaHHRwWC1TAW2KBWAm4uqVGH+kizk+ZNmIBvRra0VRRP4bTw
         ltvwVeC3rxG2+sI4rPQTIOIz8qdBcZ3irZqxxh3z2b+t1/kBQTYZQmuvHC3N4tMy0tW0
         AgkcIeueBoqohS26fjCQYOQhX37Z5XMePYR9aDkrcJswXjf1Hjs6UnbjglooJuOWvz8k
         qoucvG+AtNz+TVi3wNLlO+zCvolXcx1SHqq+WfOmJpOwQq3V2d/XOr+JzZsmkXlW6jus
         jP10mmWTmH+2jOvyv61vCk2oMmBTlKxKcEDc6ZC9beUAQq4Ip88ftWIiEVpgzkXwwTn0
         lT0Q==
X-Forwarded-Encrypted: i=1; AKwUvByagCmYip34tSdbnNjQpQoEGZNQo+mHAm6xaSB4bTlWAioeCBUJuMdkxz/ph2PCyO0pW+V7oHwT1mgfJN0=@vger.kernel.org
X-Gm-Message-State: AFuF++lhVHf7ohTf+qUYqzXa+4ojU8J6XeUp2GSQn+Pl81ZwP+lkPQ0o
	11oB7KR8H6aPcpZRIAGv8q/0Wp8yFppkWbSN5pHQogagKRpMr87mdNi3cQc9xw==
X-Gm-Gg: AYBFou0zyZ/kUIRnkgAdzCvbpdt/EbyG6W33LZkEM5ydKCUDUdi7lLf6Hrf8j6EsIxj
	TzV9ywc1bkIwm1NFl1P4loLUjbv8Pe5oFdbVzaIUxmK9rur0x0I9GeRn0ZOe9leFseENvBlHalZ
	IxTtT8kWrAM7QPElq6gvYreFtKWWG4ix9AxDJcMN5HuKBk8GHbP1oPj50lS0OZePWcdDDGxy/n2
	L8nAGiihwoU5E9JXJfNpgdY6UuDyLuvzJxH3rQSf+zfVIyzzwW2JIZijGaCumaG8U3moU7NDZw5
	3RVc6BW2V5McyoD3n/wY+xnX4sVx8pu/8dd3n6Bos6vDyF3aorBIF/kBuCIpqfM2Ojxnqv0eVQd
	KhtNrw+x1PMdyUFN7Rt7ypNZ63HNGoDItbOS77SuBu9Y2R0t28YZ5FSYIn4SNhuk9DuG32VCNj0
	HVYsQo4RjlbskMe7+BXr1G/G809rRmoekU/zAt1LVqPZtX2uKbhHgtjkbUAhqF3L5j/oSAKk0ZB
	+ZrefCG8efFsUd/brP091MIuVs=
X-Received: by 2002:a05:600c:154b:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49fc5748e61mr223990845e9.30.1790099467530;
        Tue, 22 Sep 2026 10:51:07 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde1e975asm7349825e9.14.2026.09.22.10.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:51:07 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 22 Sep 2026 19:50:57 +0200
Subject: [PATCH] spi: spi-qpic-snand: fix read location register usage in
 qcom_spi_config_cw_read()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qpic-snand-fix-cw_read-readloc-v1-1-67f6819fb3d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NUQrDIBAFryL73QVdJNRcpZQiukkXgkkV2oLk7
 tnk58HAMK9D4yrcYDQdKn+lyVoU3M1AescyM0pWBrI02ECEn00SthJLxkn+mH6vyjHjOcua0Hs
 fnL2rmgk0slVW7Tp4PPf9ANcQsfxwAAAA
X-Change-ID: 20260922-qpic-snand-fix-cw_read-readloc-4449108092d2
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

While configuring a codeword read, the com_spi_config_cw_read()
function unconditionally schedules writing of the regular read
location registers. However these registers should be written
only if the actual codeword is not the last one.

Change the function to schedule writing of the registers corresponding
to the acual codeword only.

While at it, also drop the single-use 'reg' and 'num_cw' local variables
and use the respective values directly in order to make the code easier
to understand.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 05efe6313b7f..ce03599f90df 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -503,15 +503,14 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 static void
 qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int cw)
 {
-	__le32 *reg = &snandc->regs->read_location0;
-	int num_cw = snandc->qspi->num_cw;
-
-	qcom_write_reg_dma(snandc, reg, NAND_READ_LOCATION_0, 4, NAND_BAM_NEXT_SGL);
-	if (cw == (num_cw - 1)) {
-		reg = &snandc->regs->read_location_last0;
-		qcom_write_reg_dma(snandc, reg, NAND_READ_LOCATION_LAST_CW_0, 4,
+	if (cw == (snandc->qspi->num_cw - 1))
+		qcom_write_reg_dma(snandc, &snandc->regs->read_location_last0,
+				   NAND_READ_LOCATION_LAST_CW_0, 4,
+				   NAND_BAM_NEXT_SGL);
+	else
+		qcom_write_reg_dma(snandc, &snandc->regs->read_location0,
+				   NAND_READ_LOCATION_0, 4,
 				   NAND_BAM_NEXT_SGL);
-	}
 
 	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);

---
base-commit: 3d743adf090cd4c9a2120c1e02b0482e88aa0d2d
change-id: 20260922-qpic-snand-fix-cw_read-readloc-4449108092d2

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

