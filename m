Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465480;
	b=X3s2QlCf02M3Ren5J+EFfRCmqBzmsrAYKALZjYRj1/FHRo3LbrgUqTWh44c6gfQuPzFe
	 /pbIOO3hxumkvuxpgou2+pN4MAia9wOHz/0vulSrCzXzzGJ485EZsmywOTW441si/tbh7
	 tGG5GrhOTeTt6HJE9wnPdhJp1B1327ftC7YmhDZOKuwemrkeArrrY1SbTZU09OC9a1YD1
	 uKKxccX4dOQk2lnPEq5qIB8sOfwk0s+kkMnfupnzCD1B7osclG0mF8qVTpPMCDURbMs60
	 H/dwUtIRwdIkBKo7/JqnB1rwWCJBmoSE8ecxv9tEdQAlveicxHDhjCDxAWVq8pt5FKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IjW8FjpBB738idIMh2c2G0UwubAUjehXMvdNt5zGIgI=;
	b=ntrxeAxBrntW20dJ0rY9cdMPtFuQ7mAXovsq+LzIoSURre3+yF6OMGM05tEqVZMA9PfK
	 fmMSePy0ZN0Y4iALzfJIRtTeyaU1W06bH+VW50S4u5o9CgyKHG0MGZcik/k6fQhePS9Xr
	 HMaHPhuWTyK2j+L/Z3o1tDk1bCss5CziWWtoZr/QmuRgu89Lfg8QRQgyWhWj9CuFjCmbK
	 NTU7G5OlpmydvgCFwmJc8+Xy9r1IgHlaSNVKxFdrkEukm4FnTJItcfBsy/3rcg/pHNxBl
	 HIxzaSthTR164BDto9woi7CafK/PlR7suB7/oVoyU+1CBSx0GKOxEhqb2WztO0bgqwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=La9hR4Km;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D215E606A890
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D215E606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=La9hR4Km
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f3c89594cso302344685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465479; x=1795070279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjW8FjpBB738idIMh2c2G0UwubAUjehXMvdNt5zGIgI=;
        b=La9hR4Km7gw+WIla7x4BOBrH4IeJMFTXN7rjLTKymGzp7MH5i5iPiCor/+Oyp9DFdK
         RFAVj9huTmOQQ4vrJuNtmSfdERUOYt6gNI13X/lp4sBYMAgL5h0Yxz+7r2W5gCOpyufG
         ZFdkwYRTbjGYG+VOjdL9Gz9Uet9wuzU1iXiDe2MgnBjgUUI2qzBw0L6sjjn1JAsedbiK
         lGYoCKXiHVrCCfxA3KHHH88ggqnq+gvYAabHNPiFPSqA2KGBQ5loHc+x1sK4BtaqSqtz
         vHx03UkOAhn+EqjI5Nu1lBC+c/XRTdIHLltR6cB0k+7z0VYqEVHrV6T5aWcuFYHaoYFP
         S/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465479; x=1795070279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjW8FjpBB738idIMh2c2G0UwubAUjehXMvdNt5zGIgI=;
        b=cTZ1k6q5wvc7vra1C9J9yS1hzNZEUukxv4E3l+mZU96V+PDEX/1ki8vMMx7zQUKA62
         ISdmKYFl01owbYpFgZ9zJG04wFdgNTqjnG33toBru4471+BTW3Pa+DibGQ5O7O/1sOX5
         3vpbdeJbxp0CUV4xle+DAGIQl/AXaqyUfce7TG+TaNBao2B+qXtOd++8WUOM7bfbeDD+
         Iob4V0dkKqgGRr/0rV0liT/hco4g2bNqfFwSMNyAhG5iC6a3oruHT0Ze7F/H97l4eNfC
         4urfmGBcYd0gMGtDUGNYOlfpMb83HgaH7EdxIWJoPcB9oLh6i5qYCbZmUa4Tz+gLkU2s
         zJVw==
X-Forwarded-Encrypted: i=1; AL+hErFw93setg+av8e61aYlgtOcRWzpI6GeBLg0ThH1iB03vj6sufvzArkiDVkuWw/dKJ5O7t8yYJ7J9BXFA+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Op2+c5dLoRieqvHvSRaiO8CtFdzDGK2ZLP/2AAfcATKnJ9C6K
	D6/D56dJQv7aT4q+zsRpWounYUKlwpPiYTTPoX0lJ/EDGA8dYkul8Oc=
X-Gm-Gg: AYBFou378KDhdcBz4COz4AHxSnuQXhIh4TMKymoMqFJBtLT3nmqjuB0h9fFRSZuf2cG
	cP9QOp2Hxkhs7TcFxVKzEf+0258TpPYvfdsE8GpdjuDirwIsjTA5HoIxP8A/2eikBaqh7YHKNpW
	smEqE2BjvH+tiglgJyJW5HzObtelzVQ/IDmySepitxMfRSRjV/NEiRFRqif6bwEb24KMlr5UvQW
	W98wk3X8wzMasBQDPX+fXXAQeNuYbbKSxgSXhOth90hFNqO+HACdd4ac3VswiTh3oY/LnH1E3Hz
	JPr1RfjZmKbr0Us5WzlFJbpxcoe4/oBJqsgUN89R6OotcBPuZ9BMzi5gGbrU5BKonLrB85lESyp
	9t77afy9VxRPEyig3cxQoqwNLmqVboqUSr8+bWb/QScQAIU4WPDXcMfPYhjJ8Y/bXcvEk7obDmh
	pMb2MjTIBJeaVn6T6s/IERiCYfwfudmgd57lxmI69lpAXA42S0YPrddKoviLBPYL0mSSsOS6G8R
	Ro2YWZ1IA6UfrHAnlDdnGrHOy1YD+5rzYUAMNtXs6nTTj8pn/LDxz2McpgeBapHK75f8g8FpyOQ
	nlBjH4ohyh0kQAqO+KpE8zTDCpObtDoNTTqeCZHhxXRhFGAd4dhG2ITPLuyBxKfytKmUYCgZfsU
	e5pvBW7YfAlF1nHofPABKCqXHbfv/BagfguVSZ0QknrfXkjoZLHweS5OxCos5iKXZCMJ8js866P
	G7nk+IeutAm6rtJFo05bdJkmwl5WngfVpL
X-Received: by 2002:a05:620a:440d:b0:93f:5f83:2ca7 with SMTP id af79cd13be357-947affbcac7mr813036885a.52.1794465478806;
        Wed, 11 Nov 2026 22:37:58 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e3c34sm658719885a.36.2026.11.11.22.37.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:37:57 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: even.xu@intel.com,
	xinpeng.sun@intel.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH v3 2/2] HID: intel-thc-hid: quicki2c: quiesce IRQs during teardown
Date: Thu, 12 Nov 2026 01:37:52 -0500
Message-ID: <20261112T063704Z-thc-v3-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112T063704Z-thc-v3-0-mhun512@gmail.com>
References: <20261112T063704Z-thc-v3-0-mhun512@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The managed IRQ can access HID/DMA buffers or queue recovery work while
remove or probe unwind tears down those resources.

Disable and synchronize the IRQ, drain recovery work, then mask THC
interrupts before freeing the IRQ and releasing HID/DMA resources.
Track IRQ/DMA initialization for conditional probe cleanup.

Disable the IRQ before shutdown deinit as well. Keep IRQ disabling and
release outside the shared hibernation helper.

Found by a static analysis tool under development.

Fixes: 66b59bfce6d9 ("HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

Changes in v3:
- Add blank lines in the probe error path (Even).

 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 29319b6227f3..84e458fdd69c 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -652,6 +652,8 @@
 {
 	const struct quicki2c_ddata *ddata = (const struct quicki2c_ddata *)id->driver_data;
 	struct quicki2c_device *qcdev;
+	bool dma_initialized = false;
+	bool irq_requested = false;
 	void __iomem *mem_addr;
 	int ret;
 
@@ -704,6 +706,7 @@
 					qcdev);
 	if (ret)
 		goto dev_deinit;
+	irq_requested = true;
 
 	ret = quicki2c_get_device_descriptor(qcdev);
 	if (ret) {
@@ -722,6 +725,7 @@
 		dev_err(&pdev->dev, "Setup THC DMA failed, ret= %d\n", ret);
 		goto dev_deinit;
 	}
+	dma_initialized = true;
 
 	ret = thc_interrupt_quiesce(qcdev->thc_hw, false);
 	if (ret)
@@ -742,13 +746,13 @@
 	ret = quicki2c_get_report_descriptor(qcdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Get report descriptor failed, ret = %d\n", ret);
-		goto dma_deinit;
+		goto dev_deinit;
 	}
 
 	ret = quicki2c_hid_probe(qcdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register HID device, ret = %d\n", ret);
-		goto dma_deinit;
+		goto dev_deinit;
 	}
 
 	qcdev->state = QUICKI2C_ENABLED;
@@ -763,10 +767,20 @@
 
 	return 0;
 
-dma_deinit:
-	quicki2c_dma_deinit(qcdev);
 dev_deinit:
+	if (irq_requested) {
+		WRITE_ONCE(qcdev->recovery_disabled, true);
+		disable_irq(pdev->irq);
+	}
+
 	quicki2c_dev_deinit(qcdev);
+
+	if (irq_requested)
+		devm_free_irq(&pdev->dev, pdev->irq, qcdev);
+
+	if (dma_initialized)
+		quicki2c_dma_deinit(qcdev);
+
 disable_pci_device:
 	pci_clear_master(pdev);
 
@@ -788,9 +802,12 @@
 	if (!qcdev)
 		return;
 
+	WRITE_ONCE(qcdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
+	quicki2c_dev_deinit(qcdev);
+	devm_free_irq(&pdev->dev, pdev->irq, qcdev);
+
 	quicki2c_hid_remove(qcdev);
-
-	quicki2c_dev_deinit(qcdev);
 
 	quicki2c_dma_deinit(qcdev);
 
@@ -814,6 +831,9 @@
 	qcdev = pci_get_drvdata(pdev);
 	if (!qcdev)
 		return;
+
+	WRITE_ONCE(qcdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
 
 	quicki2c_dev_deinit(qcdev);
 

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.53.0
