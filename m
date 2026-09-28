Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DF4562A9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578934; cv=none; b=Kbby1DJYBkvQLlRGJxmfKwiqRn3rf7YfCVAYDIsMz7zcsU5o1TtWF8/yf1EpOhzp2tZJ2RhNgkKh6CQ0JJ1tgqKvTKEntCWCSKwa+ojjgu1Ue4RM3QWROeQ27SIf6VtpHI9AQC+GwLM/eS/OPCJ6jNb9nCXF4JIsbncY3XclW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578934; c=relaxed/simple;
	bh=zza9TnXjTa58vqN+CvSp3ju1UX2D2hlDXXN3AqqsBZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=diR0KdlPczRhiG1dH/8PKp3YQT334NR1zp+Kik6/WBQ/NitKuyFESflI9N0JEeCE7l300GwsB6zl+DhFzv1z2VFD2Hecj0v0tCBDcV8XyC2LGDDNNZ4Iva3Rt1a8EAaxiOwVWng5tede9ImtUHNo23ibAB7hcH42PHfzxpNcEz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLt4zvMq; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLt4zvMq"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c20ce3c118aso426304366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790578930; x=1791183730; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OPkNPJmzSuKsV3tYjzk5WCFitXsvoG1mbaUmgEkFosA=;
        b=ZLt4zvMqIZ4IGgQIZPIovTA2RjGBg09wOaal7DScEU/WgnzVCgFC7WM6+vvPsaDDYv
         C/fmdo2utPvbA8QvCzBUyyz+BcRpJjvHL+ngd7Yxt2/syI+1tviMBInt4WCe3HVjkrJO
         Gl9QqizNBPmzQlp9w51cAG9ZAJZb4d/ceZ/k76ZlVXrIGfhEi298Z9JgrMx2mvWPVQDT
         TSM2e0p4ew/jQ1Z1N7cGUvBj8kElXihfZlluB0dTnQsN/aCwiOSYnSt20YWwhdN+7X0o
         yBOX/cUnb8z0DgbowQUWjwdF//OXevQALtqPNrtr2QxZL4Le01iNv3wAoSNF2OHNjUXC
         990g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578930; x=1791183730;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OPkNPJmzSuKsV3tYjzk5WCFitXsvoG1mbaUmgEkFosA=;
        b=e0+lN8GjAN94K5MnUYniSF5bgFhb8gs3cFoywS10m4XGLoCoXSDDpuj5LYcWNAPNPo
         LAzqpjuxcQOMtjtLx9e0JPg+quRssFN12xU/LPabfRrG2N81FEH8mlMmYCjpUj6FU/PX
         InzM5JevEOvbMZ01YrWcqRpNvgz2V3jSYVcqdq5YD4RsJtDzX5i1lnEQDZDuSjzTyeG7
         tGI+lklVW/V9IvNXAQZUJFC7Mo7YA/JbbYqBejxzM3WLOpTbFaS3wXmUeLi2JCY2Bpq3
         uRn8GXNq40K0df5Dfge2cl78zVXArAGnm/BQJDwcJcBb56YTCzNs7amTkGQ2EBoJAQXF
         /0Pw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ0f0DMMxa5FdkfSoojYFozZLT92HIWHdBr+gUNE1Thu/kt1BjVj+yvJq5h+zYZ2SKBfe4Aov6utQpc7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n2SaOCYtljkxojcVqOlFu2CUD3DfZN0XHxYxWWuh14xZKmqPeN
	XWTxNUNf0/TFl3VRqCponJ4nbxrRlxQSVcRuMB257xylnPvltzUMxiTS3okpdA==
X-Gm-Gg: AYBFou0I9MfGn5W9Gsy6NtzZFl0D7Ace+Wwk6LgXO9YKd2bpzOQfth9L5H5Gn0Eg9Bf
	2RiP9wNKKr4EMMqEDiJUA2cAHAPDKHZTb85SA3lvC6L8oiEUu/CNkfJDBMvGsWXJZZBZJwTo01m
	5Vcpzuz/h9KbJWXQbqcD3sJxcKZ/3k60HPzZ1ckg4rbKKPaW3EPczXm4CZrMhQ8L2u33iB4NIK4
	sFvwzi8GjM/yJ2EDFdhCHwW4bNUzbn3/1zbeVHFs76V2+KTi5RglAjVt83+hrV0MLOwqkWyhpY9
	mB/HECihj9dyAHhFdkNpuKPZRuifYqygkeGzp7teRItf6oq27rZI0vdtpx1UYuaJ8GFPTN9u4W7
	bO6frM8LOS8Z13+xh11H9iXVBcNIZF4OsVk8epPE7AJhY2VVV91r2RJKo8C4cNH1Gr2ne0pBK0R
	zcHV6s52f+N9sK69QOZKop4NQyfImLTWheaaMOKiAV/2Am9iDCQadED5csMufNXDTPZRtv9Gsji
	3HF7zCcS/8FknGMkm5I+RW8Tbs=
X-Received: by 2002:a17:907:9301:b0:c2a:b008:8cc0 with SMTP id a640c23a62f3a-c2ac2382bf4mr1095005966b.28.1790578930459;
        Mon, 28 Sep 2026 00:02:10 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm35536952f8f.10.2026.09.28.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:02:09 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Sep 2026 09:01:53 +0200
Subject: [PATCH] mtd: rawnand: qcom: fix read location register usage in
 config_nand_cw_read()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-qcom_nandc-config_nand_cw_read-fix-v1-1-98edccaaea0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBCF4avIrB2I01bRq0gJYTLaWXRSE7AF8
 e4NLr9/8d4BRbJKgak5IMuuRZNVdG0D/Aq2CmqsBnLUu5EIN05vb8EiIydbdL3g+euzhIiL/lD
 Ge/+4DcF1NEAd+mSp+TqZn+f5B4jgbIN0AAAA
X-Change-ID: 20260922-qcom_nandc-config_nand_cw_read-fix-e946537a0127
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

On QPIC v2 controllers, when the last codeword is being read, the read
location values must be programmed into the READ_LOCATION_LAST_CW_*
registers. Prior to commit 8c52932da5e6 ("mtd: rawnand: qcom: cleanup
qcom_nandc driver"), the config_nand_cw_read() function did it right,
but since then it always writes the read location values to the
READ_LOCATION_* registers even if the actual codeword is the last one.

Change the function to always configure the registers corresponding to
the actual codeword to restore the correct behaviour.

Cc: stable@vger.kernel.org
Fixes: 8c52932da5e6 ("mtd: rawnand: qcom: cleanup qcom_nandc driver")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d7642db2e2df..170af9f26d47 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -328,14 +328,16 @@ config_nand_cw_read(struct nand_chip *chip, bool use_ecc, int cw)
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
-
 	__le32 *reg = &nandc->regs->read_location0;
+	int reg_base = NAND_READ_LOCATION_0;
 
-	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
+	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw)) {
 		reg = &nandc->regs->read_location_last0;
+		reg_base = NAND_READ_LOCATION_LAST_CW_0;
+	}
 
 	if (nandc->props->supports_bam)
-		qcom_write_reg_dma(nandc, reg, NAND_READ_LOCATION_0, 4, NAND_BAM_NEXT_SGL);
+		qcom_write_reg_dma(nandc, reg, reg_base, 4, NAND_BAM_NEXT_SGL);
 
 	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);

---
base-commit: 55c5b6d5f59f59a8c98a7effc3195226cc20175c
change-id: 20260922-qcom_nandc-config_nand_cw_read-fix-e946537a0127

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

