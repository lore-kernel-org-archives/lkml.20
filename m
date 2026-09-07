Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E44A6CF8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784551; cv=none; b=cWU2q6LzAAGCHgOH+vsUi1RA38OzCdXWH+rvt5uCLc4G03rMBy3WiXIBgMMhLr5+4/Qcbo+FzoKpKgzZ6woF2EfZVF/Sbb+s+CJk/poVwKl/v+l0/jQab7td4a/goc+SHhJc98PT+8oJP2FpxRl+4XvuuRBYrbR3T6/Z0euWYh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784551; c=relaxed/simple;
	bh=BLhbselfkKqOBVWiP4lT6W58q9Wfhi9f6WUsewOl1Xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nb8NhfS4re6QjKvWZtlRH92IMojauWcaA5wI5XHzKtLDm8RFMZLf6AnMFjqwyfXSqiRgWgiM5BeMjU32r2moaYkOC2AKDt5VkoIwYwKe4VSFuzNDiLtKNw4BkHrX9Ux3sugJOUQujCp5GLQz+6ZLTT74v5a7BycQMpN0mtY7wPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnEZhpbC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnEZhpbC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso4192614a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784549; x=1789389349; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Lms/wFPVMGmY+9gbS2lDfdGM1WBdzhI1fanedp3MG8=;
        b=WnEZhpbCYWOb4xtsf1SoMjOTmwLPUx3EfbMLA++TLgaOl2RCl72Dht6FlzrLNYQrUR
         7Ctdy8NwODkAr38cZdOciQTlrkF6XA7/4xx0EuTXOZyezjOdYJyqurRJD1ta3v6z+oWI
         IEoyrB4dgoXvFiRIBB7Otbrp8q4D+OXVxTrTMkFJJvNPVLyNg+O6E4LUnKi8vpj2TOe+
         B/6GNIr2WmdzkzvS9PBRocIdKVcO8rRNObxVmn/frhsRL7JZEeLHn0DyLErQZVAkWYE1
         gM6t7ClVdtBSOr9xPBVgiDCXmAPjj5mqAH6TVE30UnkYARTZ+aAMaASJa6FINbPJHl4j
         KmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784549; x=1789389349;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2Lms/wFPVMGmY+9gbS2lDfdGM1WBdzhI1fanedp3MG8=;
        b=aCxgZ8H85JDRAcBaCTB29Ah+uA2/2l4K8VbY7sLc4y5YxGWjv+sNc/AH+pB8ALwUOR
         k7vAsZkClp0Ge5FyI0OzdMXf67O8vnG9TSjIRyZxZXM/3wLfgQP/BAtnC2p5jytLlnJZ
         lVKJkGMA0aDm4uk2xhBLa8Piy8BtMzxtXr80Ni07rf2e9c+DDEmjs4EZLD+hQr5olHTz
         yFwN7KcpKjbWEeizyOt9X08MzzrVNcOWGwtlTng5si6+5rCkFnhbq6lv7esY53Dei5cq
         cCLpUtdnSvt2IarFU2tC0pcxrqhaz+fW9IGPktUtQpK3858GV7vN8qtWG48iHV368qXa
         d4cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkZxm8wyzNlGFue/edcjOOlGykkkTpGD5MrYvxKPNveQPUv2EJCHV0JKPGGmztx4e9WVeNWuD9rB2jnWw=@vger.kernel.org
X-Gm-Message-State: AFuF++kr9lrcaU4vZxl+Hl10U97siUoUTAbLNOHpBe2WbMjVGI/k2kWW
	O0bt56C65hP454MpUzC+vfaGB0etmyYFrrvuxeeDK2yMEjjyJzU8/V6bR+n7QlNn
X-Gm-Gg: AYBFou0LnRbi9Nh0d/eXDw6PPyq9jCLb/UmN1rOzMAabRKgq3LpWgclZlZvbxTw/vM2
	S6z5vaL5/RtGHRSjlcYH9pZZKEGVUc0vVCRvGz+IRibgs2qe28gWx8RsihYJoP7RduzNDZwCihv
	Nh+HBoD+WLDk2rV1bST/FukCFSsYEBznKg6IaN2K4a9FOGbAc5utJbl1mKhHmUrWcE2gAqUfdqr
	un3uolLAZZkz93vACygzBsIeIAJGuGxGqg+G/RbEK9c5rEXhKbFEu7vzbDZpCsT/NRY58LqoslA
	nWc8JzX9PH/YwFw3xyY1pfFlOkpmLVE/+fBWd2hf1h/u5jbUTWnA+Y+LQ4eHglgcayY/Fz/W21d
	yoR6Tc0FC1FRSUiyBpeUpwU2pc1F/KxZRNUAR45oT7K44oMcI1ei55HMoTdCxInvlytFTI0PlXB
	pNlKGXP8c0lHV78HM6mI8gcKG/OXxtt82/aAAPfuSupJN6Jq/Y78nrV3yeiJ+YCuacGz1Xl5Xzx
	Tj2hAlf2lk/EwUtifAkXDwk81Ur92dsXjvKG1H03hGqXRWzrHyU9kWc
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr31333923a91.18.1788784548566;
        Mon, 07 Sep 2026 05:35:48 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm14340890a91.5.2026.09.07.05.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:35:48 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 07 Sep 2026 20:35:45 +0800
Subject: [PATCH] spi: ar934x: Convert to devm_spi_register_controller()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-ar934x-v1-1-71327eb482bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNz3cQiS2OTCl3DNBNTw6TUZAsjixQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AOySnrGoAAAA=
X-Change-ID: 20260907-ar934x-1f451bec828d
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788784547; l=1498;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=BLhbselfkKqOBVWiP4lT6W58q9Wfhi9f6WUsewOl1Xo=;
 b=HpJj81hqivICkbzn4O2Jkitr7MIqfrmBY13a8xfPgwUVZwkfP2wAlwFAARIC55NvKobTj0KOn
 5BHe3sj/jfNAPzKcJyCL3aC4oVEgf2lQ2e6368jSy5Eamj5tteukaXL
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Switch to devm_spi_register_controller() and drop the unneeded
.remove callback and dev_set_drvdata().

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-ar934x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/spi/spi-ar934x.c b/drivers/spi/spi-ar934x.c
index 2210186feab8..01e51a30591d 100644
--- a/drivers/spi/spi-ar934x.c
+++ b/drivers/spi/spi-ar934x.c
@@ -197,23 +197,13 @@ static int ar934x_spi_probe(struct platform_device *pdev)
 				   SPI_BPW_MASK(16) | SPI_BPW_MASK(8);
 	ctlr->num_chipselect = 3;
 
-	dev_set_drvdata(&pdev->dev, ctlr);
-
 	sp = spi_controller_get_devdata(ctlr);
 	sp->base = base;
 	sp->clk = clk;
 	sp->clk_freq = clk_get_rate(clk);
 	sp->ctlr = ctlr;
 
-	return spi_register_controller(ctlr);
-}
-
-static void ar934x_spi_remove(struct platform_device *pdev)
-{
-	struct spi_controller *ctlr;
-
-	ctlr = dev_get_drvdata(&pdev->dev);
-	spi_unregister_controller(ctlr);
+	return devm_spi_register_controller(&pdev->dev, ctlr);
 }
 
 static struct platform_driver ar934x_spi_driver = {
@@ -222,7 +212,6 @@ static struct platform_driver ar934x_spi_driver = {
 		.of_match_table = ar934x_spi_match,
 	},
 	.probe = ar934x_spi_probe,
-	.remove = ar934x_spi_remove,
 };
 
 module_platform_driver(ar934x_spi_driver);

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260907-ar934x-1f451bec828d

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

