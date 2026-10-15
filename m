Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5993E834F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036167; cv=none; b=r0TmhJW7K9n+H36fa6mA0MZ6lotWhttY/ljqtbJetkiqITHMYb0dsaw8cWn19ZRrJ5U7MTmqzKLJdZkMPyAIdjrYz69r8kHdaou7sgQSXr8mzoGAkiwi31bSekvADHTrP9Bi/Klkej2P+JDig80gsL/DRGzrFyzDQTMG3J2YqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036167; c=relaxed/simple;
	bh=Ti3KGfabYM5pLWxRfJUbJYw0fFkbsBcnpFku+5ou5A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SFuucDKNlF4LJMz/WhUz+NrujUdWRlMl+tlUF9uw1YBmW9ar8oazvRrlILaJ0NH/GQbZ8W6tTkS9rIjYDeocfXO+efQdv+oB7aOj4hMblqjkRQ7DzKpFrvTLoUbqkP/yqtVQ09GNpcwXlQTUitMnkoS8BD863ujjC/HA0zySqz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXvlQo0x; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXvlQo0x"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533972e0cccso55219881cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036160; x=1792640960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uk5A0ml1SQJvo5rmqKPeRixnRMv/3XPW9Wm32WbjN8=;
        b=XXvlQo0xiIYOIG4JcvYi/5m9jebP0Ka5FegAp+C6wn5Dztza+5RLREv9pjcCcYLQub
         bdItXRmjzzk4yWqhq53c9yr4spV5MqnOYK1jW+bnHMDCGF9qUG31wjPFM9l7ZJhsEIAq
         gW/JH9UpxXwehBb1oMxhDFCe0rBn2W21TDdAnt6VXZnuUIESYhL4OZ4iqXdsCrS+zU8B
         pcSfY07BD00W1DbL8bKWwylyyV5Dr+z1J+54rXavpNF6mRyHQeJ3nswyfEQszcOpnSft
         smaTF4U3RBf4iFuGnV3SOf5FQGULyU1FHBXzdfHWSXjVkqAdBlAnzPVgCTYb8+Z53M1i
         mTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036160; x=1792640960;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uk5A0ml1SQJvo5rmqKPeRixnRMv/3XPW9Wm32WbjN8=;
        b=H3FnRovFiSuod20oxUstexA01IV11ef0KIwWvL0u8h6nUIt9D1tUfn+OYGnBc7bEex
         CR8jgm8FT1axTq036sYpa/9z5qdteEzyNwsKjYq8zHvc4qEc3UfCWSD9zo1gZSlWV8Pk
         1djhSH3OtaJApaBvOzZeOXrjgdQn7Tg7kbhK5XFfEmatwRVzPlL8q/Q5kp26rQLLlHJx
         iW4LPtq195hDff1t/S+nHqtOgoUmTZAgzD/ttD8HttmcdDX43QKUM+ab/V1O3AwHhAlK
         QHYYcI0DRGzV4RHsA0Jmx2DnB3unaFgRGjBhTkRKGmeq+woZ/r9AiqTYPnRsAZfdg3sT
         F09g==
X-Forwarded-Encrypted: i=1; AKwUvBzcZqsg3A37FgQSm/ReQPB/k4/Af44WU4nzaVUgKlkpRyK/n1HUrEvLJPPwXHGvSepcZxCY3d80/hn3sbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4rrn0y1jOH01tMOvmBkSIxr5ZWFyH+Tcg/WI2QfX05UNVd+r1
	DwQlhfbjyXivNFhDa9xgoK5jVOrLi7S2XRhE22ltQxLM97cCv3PWM9w=
X-Gm-Gg: AYBFou218J34J2yKnb6+QJyClRnl9f9U859HbG5bRV4iGyP7omfLlSfclPRFB2yHem8
	qEXDV3N7xoQwUOtXHaFyzOLKgPE6ffc1jwDuG8KlblzGixm3KXs8AlyBKg8FcAvp0w/aQc2+pvv
	5GXDD8Njqt/+p12ig8YgbmrkZNzNCHei5gdmuOndFGPliQcMuB08yT8lwNccmhtgC5Xcuf/Axvx
	kJ4dGZ/SIu66lva2TxgH9q0I5W5rSQBZ0kOs/NtlddVp5VKbtxOPP4IDuu5wIMWGvW6RJryCWX9
	mIb1Ti1DZrFd/14Uf9TjrTm4i03Xp0jCQQ6ufeVEqwZfilDLj8kqUvV0V8Bra2Mx0IT5ZzVu0RW
	pvzFBYCV53TDZIRDyoxe4lmjT3Vx9ZQRqMg9dorvbkaEe9B5B8grSFdZrc7a7A4hbQtB+rHaUgF
	uchvg/x92CdELjpHnLhVOkwXSGeq2IyfqEemfbtYEZT0I+7syBmwg3h/qgwcCZKqdU76blSkoNW
	he8lP/dL/CVLqcuU3gUTjDCflnJm6z94Aouqxx5v1IBiGCLtGV5A3QfkzH1PqwI/QXlPWwUDDWt
	DSjZzKpw/gsOB46uz1cAGJGl9wD2vKmhXuO+UKQ=
X-Received: by 2002:a05:622a:5c9:b0:535:a5fb:645c with SMTP id d75a77b69052e-535a5fb69f5mr295651321cf.71.1792036160571;
        Wed, 14 Oct 2026 20:49:20 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:19 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 1/4] usb: gadget: pch_udc: release IRQ handlers before DMA cleanup
Date: Wed, 14 Oct 2026 23:49:13 -0400
Message-ID: <20261015034916.2773248-2-mhun512@gmail.com>
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

Cleanup frees endpoint descriptors and DMA pools while the managed
PCI handler is still registered. Drain the VBUS works and release
the GPIO and PCI handlers before freeing DMA resources on removal
and probe failure. Initialize both works before GPIO registration
so every shared cleanup path can disable and drain them.

Mask the controller before releasing the PCI IRQ, then mask it again
after the handler has finished: an already running enumeration
handler can otherwise re-enable interrupt sources during teardown.
Record the PCI IRQ only after a successful request.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: f646cf94520e ("USB device driver of Topcliff PCH")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested only.

 drivers/usb/gadget/udc/pch_udc.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index f5ac2b8056d2..3b5c5c41c38c 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1372,8 +1372,6 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
 
 	dev->vbus_gpio.port = NULL;
 	dev->vbus_gpio.intr = 0;
-	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);
-	INIT_WORK(&dev->vbus_gpio.irq_work_rise, pch_vbus_gpio_work_rise);
 
 	/* Retrieve the GPIO line from the USB gadget device */
 	gpiod = devm_gpiod_get_optional(d, NULL, GPIOD_IN);
@@ -2833,6 +2831,9 @@ static int pch_udc_pcd_init(struct pch_udc_dev *dev)
 	pch_udc_init(dev);
 	pch_udc_pcd_reinit(dev);
 
+	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);
+	INIT_WORK(&dev->vbus_gpio.irq_work_rise, pch_vbus_gpio_work_rise);
+
 	ret = pch_vbus_gpio_init(dev);
 	if (ret)
 		pch_udc_exit(dev);
@@ -2979,6 +2980,15 @@ static void pch_udc_shutdown(struct pci_dev *pdev)
 
 static void pch_udc_cleanup(struct pch_udc_dev *dev)
 {
+	pch_vbus_gpio_free(dev);
+	pch_udc_exit(dev);
+	if (dev->gadget.irq) {
+		devm_free_irq(&dev->pdev->dev, dev->gadget.irq, dev);
+		/* The handler may have re-enabled interrupt sources. */
+		pch_udc_exit(dev);
+		dev->gadget.irq = 0;
+	}
+
 	/* dma pool cleanup */
 	dma_pool_destroy(dev->data_requests);
 
@@ -3000,10 +3010,6 @@ static void pch_udc_cleanup(struct pch_udc_dev *dev)
 	if (dev->dma_addr)
 		dma_unmap_single(&dev->pdev->dev, dev->dma_addr,
 				 UDC_EP0OUT_BUFF_SIZE * 4, DMA_FROM_DEVICE);
-
-	pch_vbus_gpio_free(dev);
-
-	pch_udc_exit(dev);
 }
 
 static void pch_udc_remove(struct pci_dev *pdev)
@@ -3091,6 +3097,8 @@ static int pch_udc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto finished;
 	}
 
+	dev->gadget.irq = pdev->irq;
+
 	pci_set_master(pdev);
 	pci_try_set_mwi(pdev);
 
@@ -3113,6 +3121,8 @@ static int pch_udc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 
 finished:
+	disable_work_sync(&dev->vbus_gpio.irq_work_fall);
+	disable_work_sync(&dev->vbus_gpio.irq_work_rise);
 	pch_udc_cleanup(dev);
 	return retval;
 }
