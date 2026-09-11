Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D343713C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164753; cv=none; b=PJ0Le7J5GFkCDoZ6hQugGiCIRr8nxst+NrEdEUCyWeWEWrz1t6crVGCEFl0XlvXD5J4/0T8RufpkZzQi6H0WiSOb3gUWu21byZo6ekxM3Tl+Qlho3S1+K2dyA+JrVaCyQSVlgnF0kUkDS3XiLwcr9rZGwku0uOvyBVsshzjB+48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164753; c=relaxed/simple;
	bh=GX1x8dz4qgRYzL5UerJOIyi91b032WQxa7VJIAn1e00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KuHQ/jwuA0t8NgEypbW4NgzxBMcIJ5s0ca2l5t0nly4HOJalWg7XvHkCRESe6vsNo6mBSHgsPlayw03BAd1ccyzgZOOWbRFKlYbGr4tM3NdHHm5LQvBYYUobNrBHX8cm3JY948T1380RONVmLysl9Y+KpI8g9EzkpO6JiwoWI4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCO3Ls9s; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCO3Ls9s"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so250061a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164752; x=1789769552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rc3MxMc8Y1g7wnfypnKob3muQN/yw/LEeDBLa1c/hh8=;
        b=dCO3Ls9sOFv0cMWoHj079Z+HzLf2/8X31lczjG/UtwXd4o0p5YFmGCR+bRuVhZuyh1
         46lEhNidCv74wT/wJyTeQD60wzPXh7iCvV1Bw99L6vcb0i+p3gIz7M10J3ufQOrPXevI
         1UTn5axZtB/Xvjde2uNMDxpZOXmVoDeNmPpKacqfGEDFp8tX3JSMwGBZHZbx1nRiz7WB
         CdgtEemWOfmQkB1QJj5PEaN/nBfdz5E7fVnI2X1UYup7IxIZ10w5SBDgGHup2cPKMdBF
         1OdMOrMSW25oL1IdUfIJ0d+Xx4X0lTCAkn02L4BpFFyrZR4v2amUTv58UIs4gA58yzSH
         LlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164752; x=1789769552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc3MxMc8Y1g7wnfypnKob3muQN/yw/LEeDBLa1c/hh8=;
        b=CJdfPNr4BA3SQcLTJdvdgUY+CoXxrrjmDrAr1LV65MGbR6IFd8FWGQ6cIOmIcFybhj
         QPTVUz7htWzPN9csi6ek36FCic+XiE9qdRNlrwOqDxKKTgoIeOIGmb6v5OIaWonA5Hhm
         v83WSRtUqj6wo5DsP75v4Hcg0TBb79i5wfmVZdsy/2lJU2Zh4u/+NSUB2XNUXCk8/lIz
         jqV1v0Ii0SXI2J1Kr1pWHPE0tHJAbA3K/2xWQQTlDlq9QRuF44RK/vsUYWBwXkUmt46F
         mX0JgOdEmDbbEjXrs4r5DcBDhE1GAW5IwIXQWxVQzi424d/xHiCzBeM3fCBncnn0yrOq
         2JKA==
X-Forwarded-Encrypted: i=1; AKwUvBw4LybNFzyJXDJS97gL2MoCEpSf64rrk1AviH9tQ4RccHaE32GJdX4W6FW4sl28lHPmtTTkKSapYKzz0Os=@vger.kernel.org
X-Gm-Message-State: AFuF++lbGKWVn5+RR0nGrBngoBmULewN8OXY6U4I76M5D6HJz+dTOYWy
	0cF7NwaSUlhWQDTE42y4/T8It0hvPkI5O3XWLDEeb4oMmos4xuqdDTIm
X-Gm-Gg: AYBFou03SXGvNR1rFq/LW6plrDe9gUWpdhWsuUCAN6eIHzj9+6bTgm6xdhCjBII/bwl
	AoiuWUJM2zIl7l2KZwiMIFSIahduR7CxRJXO6f36o23CHuUO4XsR5TCLXjStfCCH70/DbF1mndh
	AfRZ/9Jf/6h5aeH2R/7znXdg4PAEA/282khgGToHCVukYZnMLve9GeQjJLvQUKc6u9/D8g64Jm5
	cm/HJRAnVT45ddXgbHXO8NIIh2dh5ufs0g0kSFCfRtn0bEKe8mgsxmw4I8LpgcwidaE0xSP7+f5
	lGXm2kyZdyZDwyTmVoXRJr686aIanuMzh9pMBJMl4aMvhJkmg3CL/K2nFGGTrp2lSdNIItHU2Zt
	M0glq844HI4VOBwitLHagKQw/kSp6LqESh0uUCpxRM7fHTp8ha4LwnrfAPk3NAO+4RAHaZSUMzp
	+fznBUkw/VZHUi85h4zZ5vCkOSWNg+8oiQKVud1+IxhxQlBt+e4VsYGL0JdBpnxuOsgzMw4Rnfa
	THQRqjSr6jbU7Zy9TwpUVIfyI75axObQNQqu6aS/F2rZMNY5u1bUNS25x6FDk4UGSqQeCmdjLnX
	L4dSvLS/JJOFX1xrPvGIqcsAeEWJuVB6LRfdPMGHoTZKA5kdcwRJcB8Evj4=
X-Received: by 2002:a17:90b:1d44:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d9c234a8emr10421013a91.13.1789164751865;
        Fri, 11 Sep 2026 15:12:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm6523390a91.4.2026.09.11.15.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:12:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: ppc4xx: convert irq_of_parse_and_map() to platform_get_irq()
Date: Fri, 11 Sep 2026 15:12:30 -0700
Message-ID: <20260911221230.179406-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with platform_get_irq(), which is the
preferred way to obtain IRQ resources from platform devices.  This
eliminates the corresponding irq_dispose_mapping() calls.

Use the return code from platform_get_irq() instead of just -ENXIO.

Fix a latent bug in the err_req2 error path: the error IRQ was not freed
when a subsequent step (I2O setup) failed.

The struct device_node *np declaration is moved to the scope where it is
still needed (I2O register lookup).

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix missing free_irq in remove and fix description
 drivers/dma/ppc4xx/adma.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 76b9eaa05657..1bdc781efbb5 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -3865,28 +3865,25 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 				     int *initcode)
 {
 	struct platform_device *ofdev;
-	struct device_node *np;
 	int ret;
 
 	ofdev = container_of(adev->dev, struct platform_device, dev);
-	np = ofdev->dev.of_node;
 	if (adev->id != PPC440SPE_XOR_ID) {
-		adev->err_irq = irq_of_parse_and_map(np, 1);
-		if (!adev->err_irq) {
+		adev->err_irq = platform_get_irq(ofdev, 1);
+		if (adev->err_irq < 0) {
 			dev_warn(adev->dev, "no err irq resource?\n");
 			*initcode = PPC_ADMA_INIT_IRQ2;
-			adev->err_irq = -ENXIO;
 		} else
 			atomic_inc(&ppc440spe_adma_err_irq_ref);
 	} else {
 		adev->err_irq = -ENXIO;
 	}
 
-	adev->irq = irq_of_parse_and_map(np, 0);
-	if (!adev->irq) {
+	adev->irq = platform_get_irq(ofdev, 0);
+	if (adev->irq < 0) {
 		dev_err(adev->dev, "no irq resource\n");
 		*initcode = PPC_ADMA_INIT_IRQ1;
-		ret = -ENXIO;
+		ret = adev->irq;
 		goto err_irq_map;
 	}
 	dev_dbg(adev->dev, "irq %d, err irq %d\n",
@@ -3899,7 +3896,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			adev->irq);
 		*initcode = PPC_ADMA_INIT_IRQ1;
 		ret = -EIO;
-		goto err_req1;
+		goto err_irq_map;
 	}
 
 	/* only DMA engines have a separate error IRQ
@@ -3917,7 +3914,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 				adev->err_irq);
 			*initcode = PPC_ADMA_INIT_IRQ2;
 			ret = -EIO;
-			goto err_req2;
+			goto err_req1;
 		}
 	}
 
@@ -3927,6 +3924,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			    XOR_IE_ICIE_BIT | XOR_IE_RPTIE_BIT,
 			    &adev->xor_reg->ier);
 	} else {
+		struct device_node *np;
 		u32 mask, enable;
 
 		np = of_find_compatible_node(NULL, NULL, "ibm,i2o-440spe");
@@ -3956,14 +3954,13 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 	return 0;
 
 err_req2:
-	free_irq(adev->irq, chan);
+	if (adev->err_irq > 0)
+		free_irq(adev->err_irq, chan);
 err_req1:
-	irq_dispose_mapping(adev->irq);
+	free_irq(adev->irq, chan);
 err_irq_map:
-	if (adev->err_irq > 0) {
-		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
-			irq_dispose_mapping(adev->err_irq);
-	}
+	if (adev->err_irq > 0)
+		atomic_dec(&ppc440spe_adma_err_irq_ref);
 	return ret;
 }
 
@@ -3987,13 +3984,10 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
 		iowrite32(mask, &adev->i2o_reg->iopim);
 	}
 	free_irq(adev->irq, chan);
-	irq_dispose_mapping(adev->irq);
 	if (adev->err_irq > 0) {
 		free_irq(adev->err_irq, chan);
-		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref)) {
-			irq_dispose_mapping(adev->err_irq);
+		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
 			iounmap(adev->i2o_reg);
-		}
 	}
 }
 
-- 
2.55.0

