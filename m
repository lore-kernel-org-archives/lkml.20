Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465478;
	b=RyIir0kkxMknz5kVJpKEdHLzNFpUW9pxnsOf4gHXw0FMLc8RRlSAvnxNoIu6pBBZYgI4
	 vMGEiM2vxYK8tpic4pDgap8Ps+UoUoBi7I/wFvjIU4VYZLIziR6Z0z7mjWs0kNdZrfPAp
	 goOnzEsvypex+luxmQ0/skw5qH0bbSdE1NK6yjcbqw2Qt3LV5OUFWmRBHGLrBnoKZ5IBW
	 Fqn+Ba1gkUApmEslH6333JTvB/xjJiHu+OSeseMfhmJITWQ69S35w7sywy3hwyNZIcDrJ
	 hN039qkr7QzIIg0tW4VPCP8E8H5K78lsDQaGKVbEtzUpmrPmrHh9C6whaVnrDU9nxoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OkeeWDCkxdffvS0wSjkvgvaVXM+F7+2xZNU5w6osvGE=;
	b=MgcIpod770GISYkZOrFsybCYf45QeSBiKKSZwnTt5HroC5h/xeQAVv8/KAol/V6SuF1Q
	 0xV4V3G3JcQfYZVOgVrbW669abEyPHWxyJC1Qh61xbbMkC+/KFlHl1wzDvT8fVeVs2VtM
	 V5E8t/7EnyaK5sE8a15m8n3EFUL9cuQ+dXjixhGGa7un3MlL3djTxoFhQy4nHtV5+1Mh0
	 MqBfzp4+ZUcdE1MKBKh2zYT5rQYh0A4kocym+WX3S50qhtXTlEOrJz6tMNq5HgucYydCO
	 CZJ1LBpn/U43BlaVK1M+E3PI0zHgZT/ZVyutd5CDFQGzkfG5FQfHrCOLpB6GtZK3c3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkYXWNaD;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49E606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F49E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkYXWNaD
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f079a63b8so393283885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465477; x=1795070277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkeeWDCkxdffvS0wSjkvgvaVXM+F7+2xZNU5w6osvGE=;
        b=xkYXWNaDJJi9Ef9rHKolDilpQ2ae4Uy9NE962l5PYu/SWhfci3ZDyYpMonEmfubENd
         LOB0C9WxSuZRla6m/1REcj8tTJ9y9mTwPiFH7A/Eo0Ol4rzJ/8If8yu4SbRZl2bVifTb
         LpQZU8pM2Ni3blE5GvWscPgzdkXstAXaWI0WmRb9mOTJv6SwV6uhghIZXbL9eRjh8S4u
         U4m0nYk03jliOJcL0+5ZMoit3uJRZNMHsz4pDrVN53Kw+h5SckahhB+I9F/7ZzOHs4jM
         scV7g1Iygfi+Qn5vR28dxuoKj0PG5VkUc8bHj2XiLx438Oa5IbCX4pz4ChTRb83hK9aE
         VAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465477; x=1795070277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkeeWDCkxdffvS0wSjkvgvaVXM+F7+2xZNU5w6osvGE=;
        b=bET7OuHA1TIF+2tqYofjjKERVivnOGfKhZWTaMlWTweXbwzpj1Ulr36dHqvxQNC7TU
         QsEM2+dK/xR6wn5ksjS9qjl3iz4v+6OCtTfIx6VTC9re2F0nS6/mU1vmAX+Po5il0mu9
         c3C76JMH9gtmBmJQ0OIxaY3iD8CeuW0HVbVVrjpNl2cV09ZwNWv5Pqlnesi2CZANo5Cn
         mQgsoubQDdS7Dk4lE7+8d5DKF877G6faJwiGr9WN3Ml2q8QvGQpLzCsuwcj1pyTX5/ln
         BpXVbZbXRflwobYeS6Qsg4vO0ODn0HgsmLTv02cmrz/EYO+p1E70CYfYIxGBJI99Urs9
         ejGg==
X-Forwarded-Encrypted: i=1; AL+hErFahRDx8iCXiM7w7OHMcOvZppfHRlvt0j09BfDP0+glJ32xqSdWiNqvPN+d8LnBaekc1howJO/u1rwAOPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NaYMFa1UjPs4DXnO5Q53Xzuvf3ff671Eynr5m6Nto94hFpmsG
	aNa2xQ7r3pSL3cbv4QSqmCNNu62RtsMu8IqyCM8dtTMVDmydD0zR4W0=
X-Gm-Gg: AYBFou0dx6+xj4hHkalWeB6Pvpt+X6Gx2A2G75yqnRe9Hgekk7OY8X1O1QCxEWhOYR3
	whfczarbwSFICWoCJH9F4HbkYQRIUXFMDJidn/4Jq8sOToL/TV/lTuuhApVTRnW9ToN1xjDM7l9
	GZEG3lrgfVR0mwkFLB2gffoUufcUSKngfGqqcF0ofQU0K5YlrrRJkJ4YZGJItc8F0idJxIjlRDS
	fLIEb3LrAw+AO/AOQZmt5c1Ek3tftVHJt8nKIbt2QN0VKrsSZxEFYwBJX2z8jF3VOFrEAYNwlWb
	VfAAxY/3CXLJCVBgvHwdijDn29PGFQKbFULOEQkJEmTy92IJHAsmg+7UjU45Lpts6ChWOZqeEpG
	ePoi5AiMi3QEhefMRr4xS8YkkgzF9h+D0Q2p6jwpgJ2tXQYMkDku3QOVoedGPVjTUeo+hJ+s20F
	WPtF9ib54IYrMSCZSVSuOV0y57C/UYd6LXfLgKQxWaA51yI/eOSUopP+X0v705HITOs5U42zTI4
	Q+2px93J8ZI0h9QKqAMP7TVUFJsgsjEahZNnZ7EmJ3nxo9HoXIvXipDA+BTvVcusACh9RCyF+Qo
	7Kgg7rsj6Vlvi5IhXyt/CxR4U3QBbDmLL6tGofyX2eTtXuq3oFC4GQBrs9F26rIe3K3d1V5wab9
	YIdnCc7c9Jtd9YwW6qrSwQBBwNqn2kThptm25OFyRdw6oH6AroMYF4kukb4LFR3VQVmEzfIFeaX
	Z46tUdjXOonyCfW3s/N2fzAlcGh6tmACOD
X-Received: by 2002:a05:620a:458f:b0:93b:d7a3:45cc with SMTP id af79cd13be357-947affc1715mr809592285a.53.1794465476793;
        Wed, 11 Nov 2026 22:37:56 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e3c34sm658719885a.36.2026.11.11.22.37.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:37:56 -0800 (PST)
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
Subject: [PATCH v3 1/2] HID: intel-thc-hid: quickspi: quiesce IRQs during teardown
Date: Thu, 12 Nov 2026 01:37:51 -0500
Message-ID: <20261112T063704Z-thc-v3-1-mhun512@gmail.com>
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

Fixes: 4138f21115ae ("HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

Changes in v3:
- Add blank lines in the probe error path (Even).

 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index bf49d8ce5f07..3aa0ae81053e 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -600,6 +600,8 @@
 			  const struct pci_device_id *id)
 {
 	struct quickspi_device *qsdev;
+	bool dma_initialized = false;
+	bool irq_requested = false;
 	void __iomem *mem_addr;
 	int ret;
 
@@ -652,6 +654,7 @@
 					qsdev);
 	if (ret)
 		goto dev_deinit;
+	irq_requested = true;
 
 	ret = reset_tic(qsdev);
 	if (ret) {
@@ -670,17 +673,18 @@
 		dev_err(&pdev->dev, "Setup THC DMA failed, ret= %d\n", ret);
 		goto dev_deinit;
 	}
+	dma_initialized = true;
 
 	ret = quickspi_get_report_descriptor(qsdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Get report descriptor failed, ret = %d\n", ret);
-		goto dma_deinit;
+		goto dev_deinit;
 	}
 
 	ret = quickspi_hid_probe(qsdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register HID device, ret = %d\n", ret);
-		goto dma_deinit;
+		goto dev_deinit;
 	}
 
 	qsdev->state = QUICKSPI_ENABLED;
@@ -695,10 +699,20 @@
 
 	return 0;
 
-dma_deinit:
-	quickspi_dma_deinit(qsdev);
 dev_deinit:
+	if (irq_requested) {
+		WRITE_ONCE(qsdev->recovery_disabled, true);
+		disable_irq(pdev->irq);
+	}
+
 	quickspi_dev_deinit(qsdev);
+
+	if (irq_requested)
+		devm_free_irq(&pdev->dev, pdev->irq, qsdev);
+
+	if (dma_initialized)
+		quickspi_dma_deinit(qsdev);
+
 disable_pci_device:
 	pci_clear_master(pdev);
 
@@ -721,9 +735,12 @@
 	if (!qsdev)
 		return;
 
+	WRITE_ONCE(qsdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
+	quickspi_dev_deinit(qsdev);
+	devm_free_irq(&pdev->dev, pdev->irq, qsdev);
+
 	quickspi_hid_remove(qsdev);
-
-	quickspi_dev_deinit(qsdev);
 
 	quickspi_dma_deinit(qsdev);
 
@@ -749,6 +766,9 @@
 	qsdev = pci_get_drvdata(pdev);
 	if (!qsdev)
 		return;
+
+	WRITE_ONCE(qsdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
 
 	quickspi_dev_deinit(qsdev);
 

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.53.0
