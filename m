Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2554C3E9584
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036168; cv=none; b=mLdv50uIDyJ1uJc9bTECceNeb5HceVd1wbhyCmljtu2e1Q2qS0baQ3gVe7+9f8kzsnaxQqQREWqpSzNokCAB9/3g8Td6+6Fz1s2CpAD74mV4y6P5QRcODtBQ6naz/lWwyQJa5nn2jn2NTq/6rBpqDAUVbRMz0MjJUX3sYkbJlyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036168; c=relaxed/simple;
	bh=ZyEaSUcDig1wJZsjxYxZc6dyVczNomBHB68Xe/Wjz4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KiTgtoI2I6erI0tg5lyPLwX035t1LsUqhskFNzUh2RoWpMVgOusl3s0Zy2xUZOvzAF8ZuNXiHQEvHc/TUUXDqFE0vJFt7HBX+QY/pDPHyM+dRVuAFlo7ILRLtBMSf19nzRBP9RyhKcPH+hBnGHQaMnAB7H3xdwDwBqAxvCizLfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVSJ8LGD; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVSJ8LGD"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917a707f37eso61313906d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036162; x=1792640962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WzXutQ/e6rJyBoq4Bg/0fBVEiN2JdTj2MgBZ/de9U34=;
        b=TVSJ8LGDYrQ5Z4R5jTpvQcNgmXg+tdsVILckmEDvayEfi38b3BtXcsNbWGH2YvjLgX
         yX2lhBJLsIKf8uxKSMXhpTBH2fq8YUoUw/dlP3mXYjJZCVMWDOw8jDCFCOyEFCpyrSLg
         tzv90hPlifYxMVKfqilEJIf76HFf/ovzDg41/jQkquheKPDl5uou+Oh4gDZWzPrCMYHJ
         BcAwRg+52Pmm4tY7vcW6B5qmiINVhw/WPmiDV70wmh/FxuSVg7BnqXD5ryfzyNJa9VKS
         RcmIGpFiLyolyRTonsqdRAhfQNhVd6iomtEENqO544kS7tHBC2sSvARW0Tu9rJJrpqFu
         VvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036162; x=1792640962;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzXutQ/e6rJyBoq4Bg/0fBVEiN2JdTj2MgBZ/de9U34=;
        b=ILOVQ9OHaXyBIiMgYB2eaIHqaqfWf8/PIli2WDt/yIeHVyvipOBILk7rKgIxw1qa3v
         +8MUR3jzdf4HNC4di0HXvpM9EHe0FHUN22fhVf73aVHhNGVzOPlCoN1rl7yI8XTxY1lr
         iRAtcjataosfHqvIhoAAVy1ywO3mny+SJpNjy9/4zOR+nswZ5RtXsFYXOKfVPpkRkvhc
         eeQBSOg57FKj7yNtqjIDLcRtebksklrhiXcLwpTqlnWNhXKmDtwRYDGinVbm8doT27FS
         /njoCYSTfw7aRh2kRU9HO9y3K9iWJaegFiZ9U/JLA8ZV/tiamlisd9Wic3n6/V2fuki4
         wkqA==
X-Forwarded-Encrypted: i=1; AKwUvBw7wB0xfLHOK9rSBRj2tQ8ImXvtg9r/Z6NjNykabRBnuTemBWP4xlNi8EaydAurcOBx43K+2rFQEJ3BAA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4v2hsU/50uRT/lz1dgaXI5deahnJxjCTsrJqV+LnOW9epXwvF
	azrbBwxU9wKlJlT8RB+RxFBit2xmFgqTmwQEHe0lAtTgExWkeZWubS0fedPRFk4=
X-Gm-Gg: AYBFou3G9uW6T+CWtSKzdkXpvI+qb+ISRke5SYrCKfsyiTG7rhqw751lf6aCLZQWz+F
	5+RJxrOctOjqjAL3+KrTMpMVKMeNalnlc3gxWERr8YaSs4V41OlCoVnLJ6sa5G9a9qhqyFobD0B
	QGka28W0yHdvuRJXwM7jQhIciqN8QyGzkxNNWFEYx/3PhrI7dISYWj2LgvBDHFNI8c2XQbWvy9M
	8/c5390HKsMh4UwOi4aARwtAzaqPa7TMd9PiyaNWaVW2jFn7FOiEdPlzaqmDaK7oIUlU6hZyKPW
	L58ifEnE3eyBotlwfXdHm8YQuOcVz/1FYRBsPm+0wFn81lyRKUZvn3f4RH0ngcTJpuRj4VS40E5
	X181zJ1qktyerqq73xkICbffjFc7rI7Mrg5DK24tUblMOeV39svRD7gelGQ5zN12dG85cH+1UeQ
	gBIq1vRl4B0hwkZHJn7+p/fWk0BaZkXjXVqp49PVETeNBRA0ZYeydQLOzOHwyRCLAvCt/7hiVdb
	1CYC16oocn7zquRqEzsX1iVXorRLFdA+O2+C1XZ4nmEO+C+iwa2mBeB2i9lF73TlH4gVKoh7fjQ
	Jk0G5bS+6wppgXVupga41XUt6YeVWA==
X-Received: by 2002:ad4:574a:0:b0:919:871e:57dd with SMTP id 6a1803df08f44-91b557c3bb3mr321876186d6.44.1792036161628;
        Wed, 14 Oct 2026 20:49:21 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 2/4] usb: gadget: pch_udc: initialize DMA before registering interrupt sources
Date: Wed, 14 Oct 2026 23:49:14 -0400
Message-ID: <20261015034916.2773248-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015034916.2773248-1-mhun512@gmail.com>
References: <20261015034916.2773248-1-mhun512@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VBUS GPIO work can reconnect the controller before probe has
allocated its EP0 descriptors. Initialize the lock, endpoint state
and DMA resources before registering either interrupt source.
Keep PCI bus mastering disabled until the PCI IRQ is registered.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested only.

 drivers/usb/gadget/udc/pch_udc.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 3b5c5c41c38c..c360bc556cdc 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -2819,25 +2819,14 @@ static void pch_udc_pcd_reinit(struct pch_udc_dev *dev)
 /**
  * pch_udc_pcd_init() - This API initializes the driver structure
  * @dev:	Reference to the driver structure
- *
- * Return codes:
- *	0:		Success
- *	-ERRNO:		All kind of errors when retrieving VBUS GPIO
  */
-static int pch_udc_pcd_init(struct pch_udc_dev *dev)
+static void pch_udc_pcd_init(struct pch_udc_dev *dev)
 {
-	int ret;
-
 	pch_udc_init(dev);
 	pch_udc_pcd_reinit(dev);
 
 	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);
 	INIT_WORK(&dev->vbus_gpio.irq_work_rise, pch_vbus_gpio_work_rise);
-
-	ret = pch_vbus_gpio_init(dev);
-	if (ret)
-		pch_udc_exit(dev);
-	return ret;
 }
 
 /**
@@ -3082,10 +3071,15 @@ static int pch_udc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	dev->base_addr = pcim_iomap_table(pdev)[dev->bar];
 
+	spin_lock_init(&dev->lock);
+	dev->gadget.ops = &pch_udc_ops;
+
 	/* initialize the hardware */
-	retval = pch_udc_pcd_init(dev);
+	pch_udc_pcd_init(dev);
+
+	retval = init_dma_pools(dev);
 	if (retval)
-		return retval;
+		goto finished;
 
 	pci_enable_msi(pdev);
 
@@ -3102,11 +3096,7 @@ static int pch_udc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_set_master(pdev);
 	pci_try_set_mwi(pdev);
 
-	/* device struct setup */
-	spin_lock_init(&dev->lock);
-	dev->gadget.ops = &pch_udc_ops;
-
-	retval = init_dma_pools(dev);
+	retval = pch_vbus_gpio_init(dev);
 	if (retval)
 		goto finished;
 
