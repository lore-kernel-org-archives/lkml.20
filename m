Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA5D13D8BD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295487; cv=none; b=r2csF2/zM8mxMzCT7nEl5CEKNimm7Sg5wQsr5qKnGFnHVoJWILE90Zsz8qZZDaJqAyb9dYTwYcGKBq47BZFNt1phxsn1EzJ/tHpfDZqj7Rx9c4POZ2CYxNUO2bHR5VmpYWPY4rbWbRnwCLaVz28wNTmq9Z0hAp4iXPM7weSAog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295487; c=relaxed/simple;
	bh=VouvCuUd/6iJICZZJOMhr223Co3gy72m5EBeKMWsXXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r/Cy15w0oR8DOccp4eZnOxmUbdOxj3OEv9MybKylqrtv1LvrSFHwWmkAkdRYHlodcu0bq7GS65syMzCg6QSr1uANlPdRX0G7oYr1QPmzSWI4nSk3/fIYnCjl0PUUdFXf9F8Z0WbWgSv2rUquE7akOCErhnrZbI6on32f3T4+q4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn2cQIxf; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn2cQIxf"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5365f9bef55so2758951cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792295485; x=1792900285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAlfdGBaXEKTM4aRdqODW2suuLZt+2xf1jp0Ji6ORdA=;
        b=Kn2cQIxfO64tBWXSZIr6Ui860cstgm9pqbmYzL+BJ5QiCo+QGBnmNXKYU0WvSS/KdK
         MTytpV9Z+3ZycTQ3cUDImbKfTufNLi74WmczakqOdv9ZbEjlKLjfFEfD8XWO8owCHqnb
         FIMua00NNA/+JJu82y2vCP542LIvCTq1W4Ipu9iQNNvYhxC8ALuvZ1DVwDGR4i0qLmuj
         Rm2phoHt8+8m6cd9z0TXhGvzdqkpqLWuHtZ+wORFGf6ky0YvCxDcjLsSioT34NJWdVuv
         gFh/09Hzsa+C+rezpaDRnY5/PmFCkUqLJk97nz9jyuNfBFZgVF32jHXAoJ1MEMUgytXl
         2X4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295485; x=1792900285;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BAlfdGBaXEKTM4aRdqODW2suuLZt+2xf1jp0Ji6ORdA=;
        b=txkOBVN2rHkeK6PZLgPzVMSv3lGQ4H0JpranHgzWm6sxBvuPp5QVuSNFD9GtUIVCtY
         Va/UjTt7LiZeaaIF3b0Bdu2GQcFZsAWaxyChm6GAeHx5rNnb8WCtH9hGdXp5M45Oa7nT
         9TlZJaQkFoLMiVNH0kS5YiokF8GCvTLLWN2+E+GHa6Ex80Bqsh+3Hu7W7BjdXkPbEou9
         qDlrkawHLUwFUkOz8SK1SwmLQD+fc9dkslzNbAVllKjM4CxlidVJzr16oL2VW0CcOkWE
         gi4dkEeaoYqyux1YmbSUYCF1axmn5CFLwORlDEh4lD3kuiYTtyLvHG5i9mqO2wgYWJtS
         hB2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwfvARxHJwY2t/N2ETfxs+SZoXL5hyDqfR4WBidDwnMtfKhlHxHrbk1xIXrIlD1EzNeeSkESS2N1e+1O0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOhYyHkum/5KtAosuFDyLgNclJaCZ4cI+8Mjz+002Ri/O4btSA
	TTpJOmHuZ08GW6gNTR9vF7YZV+DVXQoEO9tebYBW2kJU2ypgj7z5vTM=
X-Gm-Gg: AYBFou3OIC10MNgUNfvLz4V2wZaGxo+b9TVB+xus++z0apbVvAXaq1tl6TX7tPucPd8
	E7WegYgdvIcBW01bTcfX5uHazuk9V9ClggBdQFnCUdLaSFRkOIrV5To2evl/PAYUE0QijymS5AU
	MRSq2NANZP79TrTvWP517oDDxDQsGrOIdfBZ2JxIB2d7v/qcg/9CbVfvxPleIdIwEkhJFMFTA4K
	19e+wUtpXoc9Qv/Vc4XGI+Atf6lVFwXptaWoHI2rgWzkksrJTDboEsgm1Gk/kgSwW0YkZFBuLbX
	IvBZ6eiqXfG+u+Rwd+Nls47XRxHwBWv1E/H60/lFuqHvHfu0XkHr5ct4uOn1x8I+ShWgUZJl2pm
	0zr6IemmVIt5L2buf6jhF/mg3QzDGdJ2p/+ayap32seLi1mA7JkzLZ0Syjg7nnFAFpYwzknCqjK
	1AM55k0KrRxBl3UsJ2NcWkaNQSy5ua8yiMEZPi4mWLdMau9ozeWn57+/Vd9PDcHglb+V72vra94
	97TBsvxRoQikfpfRbQOw3dDtKYaekQZy4zz6bIPc68CEKTw9dL1yHytr+Ud7vkaD2TMbvfvyKP7
	/JCkdw6TW2IvJ3CN1+jVbtUH9Ezg
X-Received: by 2002:a05:622a:1813:b0:535:2110:a9f6 with SMTP id d75a77b69052e-5364600602cmr63576021cf.18.1792295484793;
        Sat, 17 Oct 2026 20:51:24 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536660162efsm1032371cf.27.2026.10.17.20.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:23 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: s5p_cec: release IRQ before deleting the adapter
Date: Sat, 17 Oct 2026 23:51:21 -0400
Message-ID: <179229547105.3971562.9800339494753406560.s5p-cec@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ handler reports transmit and receive events through
cec->adap. Adapter unregistration masks the hardware interrupts but does
not wait for this handler. With no open device-node references, it can
free the adapter while an already queued IRQ thread still uses it.
Devres also unmaps the registers before releasing the IRQ, since the
mapping was acquired after the IRQ.

Free the managed IRQ before unregistering the adapter and disabling
runtime PM. Request it only after the register mapping and adapter have
been initialized, and free it on adapter registration failure before
deleting the adapter. This also makes IRQ release precede MMIO release
on probe unwind.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 4a92d32..e83705f 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -199,11 +199,6 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	if (cec->irq < 0)
 		return cec->irq;
 
-	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
-		s5p_cec_irq_handler_thread, 0, pdev->name, cec);
-	if (ret)
-		return ret;
-
 	cec->clk = devm_clk_get(dev, "hdmicec");
 	if (IS_ERR(cec->clk))
 		return PTR_ERR(cec->clk);
@@ -231,16 +226,24 @@ static int s5p_cec_probe(struct platform_device *pdev)
 		goto err_delete_adapter;
 	}
 
-	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
+					s5p_cec_irq_handler_thread, 0, pdev->name, cec);
 	if (ret)
 		goto err_notifier;
 
+	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	if (ret)
+		goto err_free_irq;
+
 	platform_set_drvdata(pdev, cec);
 	pm_runtime_enable(dev);
 
 	dev_dbg(dev, "successfully probed\n");
 	return 0;
 
+err_free_irq:
+	devm_free_irq(dev, cec->irq, cec);
+
 err_notifier:
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 
@@ -253,6 +256,7 @@ static void s5p_cec_remove(struct platform_device *pdev)
 {
 	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
 
+	devm_free_irq(&pdev->dev, cec->irq, cec);
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 	cec_unregister_adapter(cec->adap);
 	pm_runtime_disable(&pdev->dev);
