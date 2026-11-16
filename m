Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839165;
	b=mbbqHku5p832kq53fXlM047ZG6MG5LCUFClCOCap8tgEpBcJNML+3u80DKp47IhttGQZ
	 6oKI3LQjxBPmIvkKPG8nkI5c064qAdHVVDh6IFHem5Tif0H6NZlnEU3sNO0WIxbEeZYfO
	 2/5TRvzsjrL70rTU76aFmLDBKps5MWL+DXxS04ENzOYC0bdDzul47FFo0+yFDU0v9unTo
	 J/HVUpM8AGuaVDbwKjWijDCA++7qX+Y6QFjt6R0qMimiSQnxsUurLX3bpdQdjWAU5aTAn
	 IVO3BhqbWyFPVw/HKGiFbLcMTyowCnTQUwGGCFc1go4lH9GgrpvRTGpNZOYBeW6tcow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839165;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=hjm2U/3sD82BLLj01xL0O6/baLC4hcqezA7afcoOYTE=;
	b=SdrFJE3Gp2ugbEacfZnVXJdZDqJlzzz5Tl5ueizmwDF+COMQMIFO6co39rB4CfyO+K43
	 Hy/r5Oj/mMYnsRaTElKANaVStB77eGvoHPIsySxhtkEfczHV41FhpC+tiY+QxSspSrU3J
	 8NKaDvKgiduF93gVQJmFFRB/rj8NHBgwCIBtkgfu7ggcF1B6gptxNmqranWhd01ufD0gl
	 98o/dJAzHiRKZ6c67RIpl89hVHPATpJMk2GQcZlGFdqjdcwCeGuHjpqOG2b71g+DdE9Z4
	 CA3IsoEYcC8zH35Gwn0ImuIlenhJkskX5ROI8plCdJf4sIuSfAWUgN50m3/JF/0tevg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=VtJ1JjLf;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE2606A323;
	Mon, 16 Nov 2026 14:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDE2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=VtJ1JjLf
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54dbcb4b9;
	Mon, 16 Nov 2026 22:25:56 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: max3421: Fix potential resource leak on IRQ request failure
Date: Mon, 16 Nov 2026 22:25:55 +0800
Message-ID: <20261116-c29ba55625-usb-host@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e4c014f503a1kunm3902e7d410e611
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGklIVksaTBofSU1LGBpOGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=VtJ1JjLfwG7gJQh0npnFo9YDqHxnb6p14/84hXXvjSCVGunqjmPwxyr6WAfUuxigs4x6vvtjC/JvUUyRKcGaFJjn/xmnQN35+Jx3IqX+JZw7af1Ht+8PZL6vfPRMTQN+7pDZCGJ/HtWRAiGkgl/VfHhX3qc+g/KO0kEiSUA+hnc=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=hjm2U/3sD82BLLj01xL0O6/baLC4hcqezA7afcoOYTE=;
	h=date:mime-version:subject:message-id:from;

If request_irq() fails after usb_add_hcd(), probe drops the HCD reference
without removing the registered root hub. The root hub and its HCD
reference are left behind.

Remove the HCD before unwinding the SPI thread. Keep the transfer buffers
and platform data alive until the thread has stopped.

This issue was found by our static analysis tool under development.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/usb/host/max3421-hcd.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 73e76d0e6973..09ba92c41a0d 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1911,23 +1911,24 @@ max3421_probe(struct spi_device *spi)
 			     IRQF_TRIGGER_LOW, "max3421", hcd);
 	if (retval < 0) {
 		dev_err(&spi->dev, "failed to request irq %d\n", spi->irq);
-		goto error;
+		goto remove_hcd;
 	}
 	return 0;
 
+remove_hcd:
+	usb_remove_hcd(hcd);
 error:
-	if (IS_ENABLED(CONFIG_OF) && dev->of_node && pdata) {
-		devm_kfree(&spi->dev, pdata);
-		spi->dev.platform_data = NULL;
-	}
-
 	if (hcd) {
-		kfree(max3421_hcd->tx);
-		kfree(max3421_hcd->rx);
 		if (!IS_ERR_OR_NULL(max3421_hcd->spi_thread))
 			kthread_stop(max3421_hcd->spi_thread);
+		kfree(max3421_hcd->tx);
+		kfree(max3421_hcd->rx);
 		usb_put_hcd(hcd);
 	}
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node && pdata) {
+		devm_kfree(&spi->dev, pdata);
+		spi->dev.platform_data = NULL;
+	}
 	return retval;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

