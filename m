Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F68207A20
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456832; cv=none; b=NmtjqSTLmk0h6zcdTtaDxrt3KIojhVP67wmskWghuEQzQ2ajjkZWGZJVLRmNoksWMFizf8/io7KRLL09v6gV9ggcnOZplOJG4eFKhKbzHGEO90g1dJj8icJafuUOT2B1dMFkGjOBcy+U+tk536MQan/JFIhv8IJWSU6qUVzE0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456832; c=relaxed/simple;
	bh=F6QeRzEDWK5t1xhcyR513pNWKh1fKRnRhF3y+a++YlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWtSAXcumUShVw4h/E17o+/CWIWlPYWDFMVmUjYrMn1q8fROwpsTD7a8miwczu7LY9Lvhl1m2/NEqqfoK5JftvGC0/xj2vPcGwGPYfq77cy0pSVzl9cBUmU+KpobmreKs1A4TU6kb2yBtthyWraKe7vMKa9339KW/fuPBvo+ESc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iw8aaud1; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iw8aaud1"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c8so210102285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456829; x=1790061629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMRsbHWbqWxYa7/sB3UvfZ4V+AdJ5sViuPlZizxgnu4=;
        b=iw8aaud1s8C16xdDTCRF49TY1ifSNf/SrQQz3QR5zJM56w/SPGexi3tsRxGuX8Kpso
         j9GTr4iCJx6zcJpueDmApQ1wpSU4vpJ4cvoVNgpIh3odHdCcN/ijqOxfAkfP4RLXI0zg
         wsXs9/F+WBn1GS44Mwt1R6Bl8TlqvBW8fYoUcM0GJQmzmcBgLc19btHMX3pw5glW1NzY
         CV7tgZdNvgrUE9QKoldsQpiymU8BQUS4fC/4XnWlJ4PlVuWM748OanjKvd2uTJKHpSCw
         pUWMHyIgliSm/rrPjroHw7gceihCRyWZWBZ5XNs4rEqF01L+23DhoTArVDGpJuJRX/YS
         GnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456829; x=1790061629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMRsbHWbqWxYa7/sB3UvfZ4V+AdJ5sViuPlZizxgnu4=;
        b=g72GDRfkyjCPC0sE1nindjb0S+qFYod4hAw2p68RckkfB6tN7M7Gg8FEVFoXTvL9fr
         gpe5TUYyHEcPNdsYpS3aFja3coUbtCLzueItokkxpuutUTTVdB+ud1H031prbfsTW3W5
         Df254g99o20cgP18GrplbMVyWkZrGiCNTpYLtBON6Ub1ZeLzr3VFS49p+Bvd74K7uLZ6
         hv/QzstzLJrH1IouDj/kE7yJ432MCJEXKwdgZkVgzjCff6KZsr2t1lXe9OluRzEnk/I2
         xp+DN2u11N1itjqaye/mmCOVWGCDsc2wEiGnVWpfKZQmMNCEAqpOjSPlvre2uyPASsUZ
         AN6A==
X-Forwarded-Encrypted: i=1; AKwUvBzOTRLUmpcD02gU7f4Z6ZYYSgSEq1xNscxE0GPxDKKYeR0ucq6ySsjcRq6JP2Chlgxd9EeD0KhCYSBlan8=@vger.kernel.org
X-Gm-Message-State: AFuF++mj8tscLbMpOGLQMgz2zBtgUe4RphTZGZkIcZ7xkE3xyue+wOFO
	xKQR70WiLRhciz4TmXPYCQLFNFe2BKemfyJvbr1TPGdOZD7DS9O8A21D
X-Gm-Gg: AYBFou1mhUypC8p3U9V7ZOrJB0HkYMO93rDP5RmJYpAismT8ITC3esutbjUQ/MoSYh7
	XBRzHxMhh4Oy1FOWk0ZE6OZIr8oaX2AsrAsjOV/2vTx6cAe9bTbJ7P1iQUqeVwTQhKnQA0GJ6bD
	5yKXtXBtlSjrUmGSR3y6w6lcfr4KiaE2/9cGrFUYlSEUYCsnhV7inOqrxYk9MNV6hyyhMA/H6aL
	gX92erJx8BEndNKFmSrBdh8Fyr1jvJhpfGhgGRRxQ6E42RPBCVVPEQV9XOFUigs7UxqKDNUMKtV
	XlrBTKNkTxcd9yzY2ouAOkGd11lkLNadYvuybH+EoNuJzUYy0+pOVIfl1D2AwRfCuCoNaJH7YWG
	px7NubScKYonrPDw6yjVHnPT0ZbJkRL8dQL2dVMpqqZTp4LLSrwSiT/j6XTpy8zHiMJ8riQQ9YT
	LKs9tWL+PF3ooyBTxBmz8s+4kh4hTi0V/mr3ZAi/pvnyiIoflW4NNHg2SS7Phs11utsw37zuzfN
	0viNiA2D5wN6sAETRjrysv3mPEH5JHssWmmptDNQBQtlqOrxKhr7/+XNJ/5C68XzPKGHwZevR7W
	/pZ1K8hbDQ+kjYKwW4Cex+dpLo1ddzD3FCiJNzgbqnAz+iSQfw==
X-Received: by 2002:a05:620a:4455:b0:939:6dea:374a with SMTP id af79cd13be357-93a29be35a4mr904680985a.46.1789456829104;
        Tue, 15 Sep 2026 00:20:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ec337d23sm1126447185a.2.2026.09.15.00.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:20:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] dmaengine: ppc4xx: convert irq_of_parse_and_map to platform_get_irq
Date: Tue, 15 Sep 2026 00:20:26 -0700
Message-ID: <20260915072026.54904-1-rosenp@gmail.com>
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
eliminates the corresponding irq_dispose_mapping() calls since the
framework manages the mapping. Also allows dealing with -EPROBE_DEFER.

While here, fix a latent bug in the err_req2 error path: the error IRQ
was not freed when a subsequent step (I2O setup) failed.

The struct device_node *np declaration is moved to the scope where
it is still needed (I2O register lookup).

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: handle -EPROBE_DEFER
 v3: use _optional
 v2: fix missing free_irq in remove and fix description
 drivers/dma/ppc4xx/adma.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..0b4ba9a2fe88 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -3865,28 +3865,28 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
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
+		adev->err_irq = platform_get_irq_optional(ofdev, 1);
+		if (adev->err_irq == -EPROBE_DEFER) {
+			ret = adev->err_irq;
+			goto err_irq_map;
+		}
+		if (adev->err_irq <= 0) {
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
-		dev_err(adev->dev, "no irq resource\n");
+	adev->irq = platform_get_irq(ofdev, 0);
+	if (adev->irq < 0) {
 		*initcode = PPC_ADMA_INIT_IRQ1;
-		ret = -ENXIO;
+		ret = adev->irq;
 		goto err_irq_map;
 	}
 	dev_dbg(adev->dev, "irq %d, err irq %d\n",
@@ -3899,7 +3899,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			adev->irq);
 		*initcode = PPC_ADMA_INIT_IRQ1;
 		ret = -EIO;
-		goto err_req1;
+		goto err_irq_map;
 	}
 
 	/* only DMA engines have a separate error IRQ
@@ -3917,7 +3917,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 				adev->err_irq);
 			*initcode = PPC_ADMA_INIT_IRQ2;
 			ret = -EIO;
-			goto err_req2;
+			goto err_req1;
 		}
 	}
 
@@ -3927,6 +3927,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
 			    XOR_IE_ICIE_BIT | XOR_IE_RPTIE_BIT,
 			    &adev->xor_reg->ier);
 	} else {
+		struct device_node *np;
 		u32 mask, enable;
 
 		np = of_find_compatible_node(NULL, NULL, "ibm,i2o-440spe");
@@ -3956,14 +3957,13 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
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
 
@@ -3987,13 +3987,10 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
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

