Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790B544E66F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791756339; cv=none; b=ouk25BUpBJR7DqzdCByESOPcEGJ7F4QoPV1CxtBYgu8bMJ9lqVJEdYX2oBeYukK4UzFoxlCuwUryl8/w4aUud0QC5qtgh5GwMAjp+TMBaaVdZ+xFPnTMpFHVbXMMgGkR+pZu1ImUXzdVO26Xbkl1mxK/UsaIyHVCWgIQiiTLXYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791756339; c=relaxed/simple;
	bh=I+54PC+pJ38JSitnMZexdRIjsurRqTyiynXWikBr+GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MBJXDz11vy8J0xh2K2jgF3pKijwzUGywPDUMrYyEU/nH2L93ux+65GQI2yH6vwm3wsrAcocTf2LuXecfzvwOKTdiXEhgRo0L+gAV/0CG7s2piKNTzlwFM0AjxHK+kuvvfKU37O6KGKsy1aSUflc5zL6vW16aWSfoe3UlS5R7lHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+E5ayb/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+E5ayb/"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917c04630c2so19284206d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791756337; x=1792361137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Yzb0v70/6n5iozmnjuyB/01hZM2YfaJFOPT1lWFCsk=;
        b=Q+E5ayb/31e7rgGduJoC1SAR6BvQYttUGtxOc9IrZPfo01i5uhecMJwGkDUTCvREJb
         iHJPsU3imj1Qxbz8p6QVxe7juLkMwL7WahAbpmEyFb4M0qCbhfAGkOGbpk4PtMurli4l
         Ec0CZrnKehyFJ5j7qDzvHPCmbnIiTKcAF/fW4MVxyG/WUU6GrT2nM/s9cikO2OLA+Uqi
         4SDq9MMaiDG4cvnNaQF9x9+CT4gMdwr1EMABoG1+h4R1vxuUhxOnk4lQz9zOEeckDKh5
         vl7fe+7pAAvRCLSKXUu9dMEJEigts6ecu+oUgnqAWoWBVUpx7lGryoDICjSxdk/IWxlm
         aZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791756337; x=1792361137;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Yzb0v70/6n5iozmnjuyB/01hZM2YfaJFOPT1lWFCsk=;
        b=GXx+JJ8Ptl1+ZYuN5X4FUutjdHXxk6WaFVEMzdxylBXeQvG+vHf2/cIBWEbJwHRAPQ
         TQFKFd0Trf3LQzFi3YjeynNec4GtRZGozOcXk7k3+qBvVraPvbDuAxs9IyIA4EhZZkh4
         b3bJKQPn++R6e6RmBNGychIPgxmG1VwuEEqTbJJKDFHD/yCTjNGU16be2+ceuNF54y8W
         1MvgT2qC4TDj4sFlGH6oFaSt3ZDTCvIPXyo1I0BQe5kdVaOmvHk+1/93C6ALmnhwp6Mu
         LbM5VtBU1cBcQ9F+0zZS0P2Sxa2TQNLZEIoi2SIMqIrlbj5i1HUoOuL/qaHhZHZGg/ps
         HjJQ==
X-Forwarded-Encrypted: i=1; AKwUvByNLAnjBlqojYAQZAzFEKaJxN93xWUEXXdw45XVRllkos6Sv41GCtAyfp02Q75QVtSW1tTldiF+hdeGkTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0cq5ZIZP3wNKOEYxcFWTb2BA+CgkBWJ4jBpwuk2k9VQBjAroo
	RvxBKA4yg5FXCtoHidMJf9+m+SIH62vom4zPgoR8l3wm6QFO8+eIbh4=
X-Gm-Gg: AYBFou0TrwLgrqhgUi+27C8apn2GrvUDToYvXnBDm7f5fYkK1VYZHe1qmm8U1449MYd
	qr6gWcTfS5PEwzHQ1aAUmJV+vc09MD93EXzam4H18mLIXhrufxCWtPxwMyDcH9TNNvcNU5osTef
	lIc4ebG/nkxl9dfb/Cr9iGRPq8q0YyOHk2CjQIBFAez3iABstMtVxd5DMgNNw7YJ8nV0TldyNhg
	wLb9jst6cBhzQ0o0/vxM1ltwhzqWn7VCTnVbjOyRrjiyAETB/T9fR9spupP02T2ggfAGot5BVuU
	1pIz0GgFbnuSBlkmeGC7vTD3QEq5DSeShqNFfFJHJDdlme3Rag/zOGyHDPsQupUMp9Rss8kRFzy
	eyejUn4uVz7QvmPvK1qxgk3m7bHyG0VJLb2d4DSrN7VtEYRJZ7ER6CP1Qj/cdn01PHXIPXJczas
	Cjdl2tG13ZokeN9UBn7ynBkZ+z2MMiriM06zf+HOFhzIF3BEnoij//THVeHnJ1xuUL/jLDtoFyS
	rkvVeDkzAe+BEYRTuZPSFiY4uYCURYdeFBiIrFd1a9ImU+xw60wmXsIFA8t/bu+vr2qGb9gk0Yb
	o+PvhGTfFb3TCtnahFZVCr9fOeKa
X-Received: by 2002:a05:6214:54ca:b0:917:a2ba:e478 with SMTP id 6a1803df08f44-91b55531783mr135130476d6.23.1791756337281;
        Sun, 11 Oct 2026 15:05:37 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e7f6a1sm79788786d6.6.2026.10.11.15.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:05:36 -0700 (PDT)
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
Subject: [PATCH 1/2] HID: intel-thc-hid: quickspi: quiesce IRQs during teardown
Date: Sun, 11 Oct 2026 18:05:30 -0400
Message-ID: <20261011220531.2073892-2-mhun512@gmail.com>
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

Fixes: 4138f21115ae ("HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (x86_64). No runtime testing.

Related recovery-work review and series:
https://lore-kernel.gnuweeb.org/linux-input/20260717035609.3874015-1-even.xu@intel.com/T/
https://patchew.org/linux/20260729050145.2272597-1-even.xu@intel.com/

 .../intel-quickspi/pci-quickspi.c             | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 89226f5ce45e..0bd22f285c78 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -597,6 +597,8 @@ static int quickspi_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *id)
 {
 	struct quickspi_device *qsdev;
+	bool dma_initialized = false;
+	bool irq_requested = false;
 	void __iomem *mem_addr;
 	int ret;
 
@@ -649,6 +651,7 @@ static int quickspi_probe(struct pci_dev *pdev,
 					qsdev);
 	if (ret)
 		goto dev_deinit;
+	irq_requested = true;
 
 	ret = reset_tic(qsdev);
 	if (ret) {
@@ -667,17 +670,18 @@ static int quickspi_probe(struct pci_dev *pdev,
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
@@ -692,10 +696,16 @@ static int quickspi_probe(struct pci_dev *pdev,
 
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
 
@@ -718,9 +728,12 @@ static void quickspi_remove(struct pci_dev *pdev)
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
 
@@ -747,6 +760,9 @@ static void quickspi_shutdown(struct pci_dev *pdev)
 	if (!qsdev)
 		return;
 
+	WRITE_ONCE(qsdev->recovery_disabled, true);
+	disable_irq(pdev->irq);
+
 	quickspi_dev_deinit(qsdev);
 
 	/* Must stop DMA before reboot to avoid DMA entering into unknown state */
