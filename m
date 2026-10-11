Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616745FFDF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791756341; cv=none; b=aJ4P5iCddzs9/VBdRbVyhZOk6SpDbbZnLu4hYOchj9bLx1PmoFgWrzpmeQb4rr5bX0n0RwuvMgrivSNh1Pi47YMqb+Tc++sK1+rG8a3KlH8kyYEYPVdPWKAdC2n61wSSbyx5krotQqw89qA9uJYUfD1c+Xl4fs/EZ9K1t/cfn7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791756341; c=relaxed/simple;
	bh=QfvGJss0zjBml6IUWkokKgpncvyAlImazlL9B9iJcg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=miCgC6INkBMbcjl6qWVtKkhN9cl486I5pyZkgBIf1BcsPYx7GyQkoZe9+RdFK2Cc6WLEva5NwhROiGfpT4OMCy6uL22bOK6N/DkYlRThNEfm6zWPtQ4YlPu4EdYatNwJZpvxfJYUDXDf755OG1LGZ9GzNKHZED2rMsFiXRW3+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWKCi8Tl; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWKCi8Tl"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917a20e9efeso19927046d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791756338; x=1792361138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l9wqZaK4fJlc35GVIrKL+JyJeSSN6uS29/WxDZBB/tM=;
        b=HWKCi8TlHe+Bga40gM/1RvMezQXI454ppjMkJw3JMRJdYPaTrKMyD0EPOvopQ/gSWl
         SCwkosrJIiJepLPvC+8Im2WP3VVWLwtvH1x7O1IY8QueQqPM48dL4olzROiq/j9Vbqlm
         IVNQ5IoU0DXz7VYr4JJ0MmM4Olx+cO7HCZKHZJqZQrJlPzvlClALEllm8/N0XF8xyfMo
         p0idY35f2cWV4xo3eTUAvCGGJn1n8zQB6D9eGtRSlMpfo19CaiKLXHYpVuNYkRaLfOjO
         mi4t5WNMb5mzHnVcJaa7yB+4241/i9Qlxq3Mu8CHog5/k5WXPn7RupFHoL19l21438u6
         xU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791756338; x=1792361138;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9wqZaK4fJlc35GVIrKL+JyJeSSN6uS29/WxDZBB/tM=;
        b=pVKtEfgd/lA/O8xsejWUQKWX5domvgELugqNlR3tRWNneb8HR1Pl+4LEXTsUpDwXuN
         j8mo/BoESzBFSkHPuCFjNjzS7LToUGBU40pMXBUU6bZojUp0r8m5V8eZ4aixOtXzOtyM
         xYYdCLRt/xKlmArvbJ8YNBNkz+8qLIk0BUIKW06naRBBdDFtBiJprPDNT55OTzHvpDYC
         sf94hlrb8o7PHSnu4NS89JksbosIMTi9BNVxyNvcybhiylAoxiJhHDSDbXILnzj+pK6u
         2u+Gipabs//hixOz1gGyV8/NjmjvuUZlpSew5KXwbInsCumajtoERmZ+6k58TzPVXorQ
         bupQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ0V9sziRbbFo4hXohgBNOCTpIKKTpAkIcgv710OdL10DmF6+kWXc6Cd8Deqf3eNX9ZyHO9Y8zFt8jixk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL361iDZfaTBjz2XlfFEXPm2TCLxXowuls9uIFbHcOy8xamN4/0
	u79Pd+cCw/Ub4eGVDAPysLm+p9/Q2G4cLx+78GP7ub9z3FOXYQVH8mZ2B9DqoXkfFQ==
X-Gm-Gg: AYBFou1ptje4D143TbR9pbIBrKuexeEW7Lj56BjejlwfiayumiJggDo6MVAGVF4wP1D
	oiSkx8jl/vJpBrhVNwrUXRJo7f+kxo/IUgoccdEBvs7/uvt+uPQ5y0lwZNQLPbcVvx37lLHYDZW
	NKj8NarXcSu9Zop+3+dndxlFd1IIoHfOxtpfEKIU1B4m1SKuYnpO4PaEyi3JXI7xx1atfvQd+J9
	HYcI7ThmjXjHMbEQZRHAqWy/qF7vtt6+VAhNC7+ETPYBAESMLZWydgDg9SAhEj01JgKiWYsv9A/
	WvdNLu0Fv4VCAs78WbOsn/V+UTJE0X9sStnU/xRyQfJuM2CcEePFkeMbeN0Hx9EByb/uGEL0eGm
	BzXRTtbRT+6X3vhkw0qDoDsEK7dfndN6Pzij96FnAryUUoxhCJeoLT68sSzRpAhlt0bn4hXyYL5
	M+/KeTxKryc6vaBqCxyEQb3NIOD+ry36lwlazhoFr000j4vLr9I30a0pmE6bPX7MrlgzZY1fx8x
	AheFPiPqk7/LxN0zXlTO+6R1Q9ev0vgVk0IPgxV6C+526v18FNtdsI1g4GRGwYZMuw5KkyQl7IM
	Mf8OtiRSYeus211pyyxTFlUu5K9e
X-Received: by 2002:a05:6214:5188:b0:917:7c94:dcb3 with SMTP id 6a1803df08f44-91b557c3ba8mr148170766d6.45.1791756338486;
        Sun, 11 Oct 2026 15:05:38 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e7f6a1sm79788786d6.6.2026.10.11.15.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:05:37 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 2/2] HID: intel-thc-hid: quicki2c: quiesce IRQs during teardown
Date: Sun, 11 Oct 2026 18:05:31 -0400
Message-ID: <20261011220531.2073892-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011220531.2073892-1-mhun512@gmail.com>
References: <20261011220531.2073892-1-mhun512@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The managed IRQ can access HID/DMA buffers or queue recovery work while
remove or probe unwind tears down those resources.

Disable and synchronize the IRQ, drain recovery work, then mask THC
interrupts before freeing the IRQ and releasing HID/DMA resources.
Track IRQ/DMA initialization for conditional probe cleanup.

Disable the IRQ before shutdown deinit as well. Keep IRQ disabling and
release outside the shared hibernation helper.

This issue was found by static analysis.

Fixes: 66b59bfce6d9 ("HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (x86_64). No runtime testing.

Related recovery-work review and series:
https://lore-kernel.gnuweeb.org/linux-input/20260717035609.3874015-1-even.xu@intel.com/T/
https://patchew.org/linux/20260729050145.2272597-1-even.xu@intel.com/

 .../intel-quicki2c/pci-quicki2c.c             | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 0d2ad7bc3648..9a9b640f32b3 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -648,6 +648,8 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct quicki2c_ddata *ddata = (const struct quicki2c_ddata *)id->driver_data;
 	struct quicki2c_device *qcdev;
+	bool dma_initialized = false;
+	bool irq_requested = false;
 	void __iomem *mem_addr;
 	int ret;
 
@@ -700,6 +702,7 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 					qcdev);
 	if (ret)
 		goto dev_deinit;
+	irq_requested = true;
 
 	ret = quicki2c_get_device_descriptor(qcdev);
 	if (ret) {
@@ -718,6 +721,7 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		dev_err(&pdev->dev, "Setup THC DMA failed, ret= %d\n", ret);
 		goto dev_deinit;
 	}
+	dma_initialized = true;
 
 	ret = thc_interrupt_quiesce(qcdev->thc_hw, false);
 	if (ret)
@@ -738,13 +742,13 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -759,10 +763,16 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
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
 
@@ -784,9 +794,12 @@ static void quicki2c_remove(struct pci_dev *pdev)
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
 
@@ -811,6 +824,9 @@ static void quicki2c_shutdown(struct pci_dev *pdev)
 	if (!qcdev)
 		return;
 
+	WRITE_ONCE(qcdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
+
 	quicki2c_dev_deinit(qcdev);
 
 	/* Must stop DMA before reboot to avoid DMA entering into unknown state */
