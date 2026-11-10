Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286049;
	b=11Y2LcD9hFYNMxbn3blKgGfQResV9K+Cg7lppp40Bu6i+O2MbqE4Tzag/XMpQT940fD3
	 yw5RzGLZeIkxKNSRxZGwo+6NOoillOF718KPNmp/brl92DD7cfP3zm89njUAiWGcist4d
	 vczgCK65ss7W5ZjhbWieXfojX16NoJH0MQeMTnwe2OLmTXHtmqR0xuTio+KuzyPVQsfNv
	 lO5GLyeX8Gknw2yF47vYwW4/RIklId871SSYu5V8n2ssFt2kgUnZARzhKmwfSr8VeYfXU
	 WbRrudOClVyh1/cmnKa8u31pIlPzwZlGRTRcnMPiBR7dpWsvMnpUvhfBoGnhzIn+t+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IqXwC3pMxk6g7+TWqeDTzs7FinmxAK4PGG891U1+a7c=;
	b=svwMXwcYFs+uAPuybbBbo6oy7JpJmTWDqWp4Wr+Jg8dqUHm1/u/5bs/nUCOQVJBLlRrt
	 3+Ri1KVVAZ1uKKunXtvnLXeSG3VXdWEg+W+lO+tMDwSZ+FHKOOmW4ao6f6NiqkxyO/vRU
	 de3OAIuxMC8+IujMXbBr+bC0ISYQ3i69wo8zfvtAwte/yDqXpfvgsDXhD7IyHPV3McX0q
	 Q59azFci98KGP61BXdKToWlv0KI/mwktpT80BCT4Ttdt7Pm5UWfLPeAFH20OFZzqPzbLM
	 BRrClpmWstmDHRTRYL1s+GtbcQfl4Yrmbclf8sWF4WxV+vFvJ33DMTZc5JUeVTo6BLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AZly0ZuU;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B181C606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B181C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AZly0ZuU
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9441591aa5cso181860885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286047; x=1794890847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqXwC3pMxk6g7+TWqeDTzs7FinmxAK4PGG891U1+a7c=;
        b=AZly0ZuU6Uiuk4kHv8pspfqBNz2vE91Tl2vaAv1CnxhNeu56Yd+XMYB+t+QqyJFLdf
         mUOi/rt1pS7HTcoPcFmk/DI2+wdtF52qAkkIhDIGFb0g6LFOZTHp+yNcl5mnUnoXka7i
         buP3mEfQtOgJGubP8RQ2GKdFqz+Z1+wGZ+1KVptLemmq9vv2B2WfFkfjFTU8U1WJaY2z
         ujnCwHHHP9U4uEjKP2Ve/OVxc8ZzoWacWpDy4Y8eTBMpwAdQcw0XHPmt9MsIBP50xygF
         /HnuqjAuv9mSFGZ+3vGA21cu7b7Q1V8eU/zhGJ1ZXaYFHiM2GVMGbbO4hXVRgbFbNGWD
         4HTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286047; x=1794890847;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqXwC3pMxk6g7+TWqeDTzs7FinmxAK4PGG891U1+a7c=;
        b=NhW90IHoO77MeZZQ5DVyVrm7zc5oRGbCqzNBdAIdUo7MOI4Kmc5XQwOyVC97/7uhvD
         x+yaX+1iT45abCDesEj3zySbUTN6aoZb6XzYPPPwsC15CA62X3zwLJO/rbV8ZDJeuU0b
         /ncWMtYlTApeFFgoiIJpQnfLEzneipBvHoDPXe7Bxg1isqWbSsOGT6bjRVyRQ95Mo41S
         Mt2iCkArodX7sTWXI/Yc1VaLwAQsc4HRZ4W8NJy08vPLcES727KmuusoJtnB8yGsl/F2
         lFgXFYIO2CYstAVy1x7BSKbc9HOlJQ1xrb/FacvAlYJQfki/Q+/GmQxYAVyS4vmFcLNx
         KEDA==
X-Forwarded-Encrypted: i=1; AL+hErFR7zfXQAa2NCirKb0TP7tszGAfP1aT2exmjzODbzXGILpEnnzftbOhTWSblsrZlQDeoT/ADMAa4Sh9PYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sWQAlQPHyd/MrW81e0Iqh0+O/MeDi8eV9z8a0NbWTYzfFzFZD
	sWcy2tlf6Qx2hnEr3ihOep8LZcwgOUsv3uSZaGEKmaY1IhGZnGr2c8g=
X-Gm-Gg: AYBFou2dNP0CeaFWOhYroV3ZhiL/XAXIbdWCigsVTW9CkTRMR68Ul2+/DHmoMwogZqw
	q9TBF1xugABYBV58/sLbh+3//u56gXd9jPPJC5cFVtV5NOJ+C9PvNkfoKZs4yoyGo3VdQcyzTbw
	RPTQ0WCPD3zveiokO/3NiouZIRP+e9LUxvSphDk01Q3518ffkR8LTej9uRbKkEu9Dw5jtcYWM6o
	sAz9hnaHQ2CVbzd5aIMop+5VOBxsCEcdMiFNpc+DcuN6fa2QbTkV52nh0v3wStEIgyVM9+BjJeT
	hWVhZ2CesydTkRGZf8gweELDnggNt+HK3SZEAYdXcboWqEesFddnHke4FUH6RY6obQcwkLNKuys
	ivD+RN10rEYUJAOxyP8+jKKVmE51CNgdlPQlqJ8/W1lEzqa2tME1qj+qXgRAICAeXS66WhGv9C5
	l5mNHyGJO4XO/VNfS/v8iKCIhMsmNOXsZhmH+z5yBHaFrB5Bt3/MNWiTNE7/6Qe//lXxWsc+AYy
	rSWZ4Jv0H28Sd3JZTGGE0r7rUwMXj+kzmmWh07hN9ORPqS72eIefl5e8GsOdpgzJxBv7B9pdE4u
	jm54vMiYAFRg8XHIp9IjNHgW5Y4ti5O5rm8zPqVXEFegZijVvcU23dFBFP/k1jIhZz84ChpwTcP
	rvOfntkrWgW8wDsYRbUssX9u4M2sTmMjZXtUvKvJ97U3tlA2hWQcU1JlDKGTmEuBi
X-Received: by 2002:a05:620a:371f:b0:93f:21b9:862b with SMTP id af79cd13be357-9479f315930mr236813185a.1.1794286047443;
        Mon, 09 Nov 2026 20:47:27 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73ab4bsm137920185a.14.2026.11.09.20.47.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:47:24 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 2/2] HID: intel-thc-hid: quicki2c: quiesce IRQs during teardown
Date: Mon,  9 Nov 2026 23:47:19 -0500
Message-ID: <20261109-thc-rebase-v2-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109-thc-rebase-v2-0-mhun512@gmail.com>
References: <20261109-thc-rebase-v2-0-mhun512@gmail.com>
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

The managed IRQ can access HID/DMA buffers or queue recovery work while
remove or probe unwind tears down those resources.

Disable and synchronize the IRQ, drain recovery work, then mask THC
interrupts before freeing the IRQ and releasing HID/DMA resources.
Track IRQ/DMA initialization for conditional probe cleanup.

Disable the IRQ before shutdown deinit as well. Keep IRQ disabling and
release outside the shared hibernation helper.

This issue was found by our static analysis tool under development.

Fixes: 66b59bfce6d9 ("HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Rebase on mainline b3dfbde62cf1. No source changes from v1.

 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 29319b6227f3f6b14f3206d15b544b050b9bad1c..a3e98e0faff83ba90efcbfd244ed641688718342 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -652,6 +652,8 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct quicki2c_ddata *ddata = (const struct quicki2c_ddata *)id->driver_data;
 	struct quicki2c_device *qcdev;
+	bool dma_initialized = false;
+	bool irq_requested = false;
 	void __iomem *mem_addr;
 	int ret;
 
@@ -704,6 +706,7 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 					qcdev);
 	if (ret)
 		goto dev_deinit;
+	irq_requested = true;
 
 	ret = quicki2c_get_device_descriptor(qcdev);
 	if (ret) {
@@ -722,6 +725,7 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		dev_err(&pdev->dev, "Setup THC DMA failed, ret= %d\n", ret);
 		goto dev_deinit;
 	}
+	dma_initialized = true;
 
 	ret = thc_interrupt_quiesce(qcdev->thc_hw, false);
 	if (ret)
@@ -742,13 +746,13 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -763,10 +767,16 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	return 0;
 
-dma_deinit:
-	quicki2c_dma_deinit(qcdev);
 dev_deinit:
+	if (irq_requested) {
+		WRITE_ONCE(qcdev->recovery_disabled, true);
+		disable_irq(pdev->irq);
+	}
 	quicki2c_dev_deinit(qcdev);
+	if (irq_requested)
+		devm_free_irq(&pdev->dev, pdev->irq, qcdev);
+	if (dma_initialized)
+		quicki2c_dma_deinit(qcdev);
 disable_pci_device:
 	pci_clear_master(pdev);
 
@@ -788,9 +798,12 @@ static void quicki2c_remove(struct pci_dev *pdev)
 	if (!qcdev)
 		return;
 
-	quicki2c_hid_remove(qcdev);
-
+	WRITE_ONCE(qcdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
 	quicki2c_dev_deinit(qcdev);
+	devm_free_irq(&pdev->dev, pdev->irq, qcdev);
+
+	quicki2c_hid_remove(qcdev);
 
 	quicki2c_dma_deinit(qcdev);
 
@@ -815,6 +828,9 @@ static void quicki2c_shutdown(struct pci_dev *pdev)
 	if (!qcdev)
 		return;
 
+	WRITE_ONCE(qcdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
+
 	quicki2c_dev_deinit(qcdev);
 
 	/* Must stop DMA before reboot to avoid DMA entering into unknown state */

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.53.0
