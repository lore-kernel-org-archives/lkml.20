Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286045;
	b=n3k/D4cSa2vyEat9RQ1ATE97YZEDdaEdD701dBrJ1RLFbOTO3hCMUBbVu5brwvGuRmPZ
	 mitJoYNgQp2p7/w+mIsgxaJYBB5fjMOA80+xzw+UFzx8c1x1lyF/L4xYZ79kLxrzuUDdx
	 cKpJ9zF2ZKw2wN/7mAyzeCuxPH+5kPFfsuTEa9LJDe/2bVjrYDL+AYcFpY6x1yN3b8J2O
	 Bf/khz9349aISYlg1J0RhCQsT17X/CWAmTrYy8FQUMws8yxqOXWaa3iUkmdub2oUUb309
	 6WPEtG2VbcSGgljyHBHJXbZVqU9MBxDHWW4HwjRjnsS72jwDVb65Agn/zPl9xH+7LLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wC4bjhOhhN40eUTNX01dcV9nWNkEq784qFI5/5FUXkY=;
	b=LqGRFI8QgQC+CUtMBzK/LvJiVnNwdpeKBGQCj3BzFus9R05Q5tx1krtzSBv8ioAqvkEX
	 0oLTRewsh3b62N1nsEVc5MlBe0kUgZOp0Ak+J7db+2iOnGJrREtLVitoM39BAijE8VaiP
	 mp8WXd0nAi9jZ5hmEO9LIFCOChooMjkbfvKZDLQM7VSTLojMnLy0eCbiXGd4cSpFXAdDD
	 wUS9OOrcTYMMvNzNjfkUP5UT/nYb39yY74HnoJpxTF/i/0qUvKKqWh8sHkHbc01qvlKEi
	 xgtYU2iUQkiGBdeKZRmJIMHVoiY4DoTY8OpD4i1BaVqchtT7jl9fjdAZIANsif0c5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOKtYxA2;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4595A606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4595A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOKtYxA2
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365f9a04c5so20965581cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286044; x=1794890844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wC4bjhOhhN40eUTNX01dcV9nWNkEq784qFI5/5FUXkY=;
        b=BOKtYxA2Y/d5AExMzrRrxYGrgfAuorC3jD7qH8yibGS3P6VdbCYINFUliHco6MPMES
         7Bplz6JmAKdCJPtQJppbrc0Re04zFtI8Da5jrQraEQ82Ljm9WihiXnZxZxPZjY9VKMn2
         PqQblg1npSaPIa50xOLOTvjw1FaAAAsg5glHi+dUCvWBaXxWqbvhSpd1FcdXszL/DR9H
         ieOiHYslvG/vZmMHkmSVc0MYCvdEg+NtLwdr2wVjeMYK+0ex/nNGrWyOYDbrTq7t8t/T
         mX64h7WhF+YERyg/UkTCLMrR/YF7rnY8TU6OAnhvDPA1/SSA2PM8h/OoQs4/w2Ndsg8a
         VxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286044; x=1794890844;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wC4bjhOhhN40eUTNX01dcV9nWNkEq784qFI5/5FUXkY=;
        b=AnFXRtOfqbtn9XQsT+fLiNFYkIkYKQaD7xt6aG/0MDy1WZ/0A15uHxsb//3jReKDz9
         CSxSVqQLJBFvZBlUGrUAwBJpWpQIw1bBeuIE0ESIxOPI1a+MuAsHuq6eeQcl0ubBLAL+
         NCydvaX/LPz9mm+WexpeP8pmbGym2HNZuCLYG5+yOgXJHQlljJfvGy2tzyehizoWKOXd
         NucH8zCcezdzvwHIhGcm9q0TV5Ur/Cpoz7JXKmNQSbLhTT1r7WvIkb31t1m0MglCRohv
         L+aNojP7sSF7tps+RuOqP/fwwlphp+01aznG+dmmuEfJ2qexJ2lFf2BIO6L080E/mHsJ
         OErQ==
X-Forwarded-Encrypted: i=1; AL+hErGjxp/ecUdQHnElkdC7l6CkZPbZxczBE5VVeUVM4utz6Fx6H75042ZC7cEPbS+oZAnzhTVBNZ0wdWYCbYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V/ckceGNtKUcagS/pW8CP4EbKJwsLhgI5V2dgSCoiMV2ukbDn
	xKObIpvnoCv4zQnDW8oV68/WvapcqzksOIQuSqbzKq8jP6zUVX6Elg4=
X-Gm-Gg: AYBFou197/19fXmOalZZZvzSTXHYNL57WQwkPQ3/kvqrdXWPgu/2bxywvh1S5l0im54
	CJ76PiKsmFWC2ZPt+L1HK1yOsM42/JUXQy1eNxp8q0TwBdloGC0r06L8JhzDj1ce8z48iX78wEj
	13HyWxydltpJC15ASVR82eEIB4r5RjLERXGaby5FJAsmIpHtvEixXPATZSObMf0QI7rsxSucVln
	WO5NTjpRElPwxpyRzRyzpBdYyIgRQ06xB30P/5C4+7OkBmD85kwAvd8g0MG6gqHtRIFWUb5qVwn
	sjMTfrlihW9J/O/5O9Uz2bG/WNqjcXCBlJYKvlnBBTZT1XDkiEJWcL8Ktla3VCp3bEHWJsQsTk1
	lEf5GA1y6kaLEbdBv+20HtJpoiCgu/m+KVKhxwDipOQMfcdd8nZlAWYKD+Xi6x9UPeI0Vu2XfkE
	OFREgy9GzFVFtDy2Bdv9bhv+W84FG36dEkDjfrJS0JekjT9pSHNmdgiG4B2LZ41FHYfqSJY7Rp2
	1AoCzBelEph+C4ctyLjwu3FyjtPrirBi1bmd9EqXd2U6rUpk0o9pzhKpOanI2ptAgMNzGngHJrQ
	6Z5XD/WGi7+iwuCeTMV5B6XjscQnxTd9yBDsHAT04P07BDoKQ7JV4aiLpGpfUYuksbZIoLr/bE+
	i82L7NGfgmy11ixMWgTynFoq5C9z2lis8XK7l+4rITJDakr50OUiGwFj/iwS1+Quo
X-Received: by 2002:a05:620a:468d:b0:93f:611d:a18e with SMTP id af79cd13be357-9479f376a49mr271245385a.55.1794286044122;
        Mon, 09 Nov 2026 20:47:24 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73ab4bsm137920185a.14.2026.11.09.20.47.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:47:23 -0800 (PST)
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
Subject: [PATCH v2 1/2] HID: intel-thc-hid: quickspi: quiesce IRQs during teardown
Date: Mon,  9 Nov 2026 23:47:18 -0500
Message-ID: <20261109-thc-rebase-v2-1-mhun512@gmail.com>
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

Fixes: 4138f21115ae ("HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Rebase on mainline b3dfbde62cf1. No source changes from v1.

 .../intel-thc-hid/intel-quickspi/pci-quickspi.c    | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index bf49d8ce5f07bed092339e46c444538d78cffe26..acb4d2716ea7450d2852a900c3f0acc1d7570421 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -600,6 +600,8 @@ static int quickspi_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *id)
 {
 	struct quickspi_device *qsdev;
+	bool dma_initialized = false;
+	bool irq_requested = false;
 	void __iomem *mem_addr;
 	int ret;
 
@@ -652,6 +654,7 @@ static int quickspi_probe(struct pci_dev *pdev,
 					qsdev);
 	if (ret)
 		goto dev_deinit;
+	irq_requested = true;
 
 	ret = reset_tic(qsdev);
 	if (ret) {
@@ -670,17 +673,18 @@ static int quickspi_probe(struct pci_dev *pdev,
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
@@ -695,10 +699,16 @@ static int quickspi_probe(struct pci_dev *pdev,
 
 	return 0;
 
-dma_deinit:
-	quickspi_dma_deinit(qsdev);
 dev_deinit:
+	if (irq_requested) {
+		WRITE_ONCE(qsdev->recovery_disabled, true);
+		disable_irq(pdev->irq);
+	}
 	quickspi_dev_deinit(qsdev);
+	if (irq_requested)
+		devm_free_irq(&pdev->dev, pdev->irq, qsdev);
+	if (dma_initialized)
+		quickspi_dma_deinit(qsdev);
 disable_pci_device:
 	pci_clear_master(pdev);
 
@@ -721,9 +731,12 @@ static void quickspi_remove(struct pci_dev *pdev)
 	if (!qsdev)
 		return;
 
-	quickspi_hid_remove(qsdev);
-
+	WRITE_ONCE(qsdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
 	quickspi_dev_deinit(qsdev);
+	devm_free_irq(&pdev->dev, pdev->irq, qsdev);
+
+	quickspi_hid_remove(qsdev);
 
 	quickspi_dma_deinit(qsdev);
 
@@ -750,6 +763,9 @@ static void quickspi_shutdown(struct pci_dev *pdev)
 	if (!qsdev)
 		return;
 
+	WRITE_ONCE(qsdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
+
 	quickspi_dev_deinit(qsdev);
 
 	/* Must stop DMA before reboot to avoid DMA entering into unknown state */

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.53.0
