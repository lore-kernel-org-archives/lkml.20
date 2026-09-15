Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372272FC893
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434078; cv=none; b=qecCx19D0OK7yPLOkQgytDpPqA//7j7oBDqb6lNJtehzzLxbBlZhzjAxbg8L4QUvUw5Q6JxlHQXsDY1WkHReIO+iwbDZRtP5yhgit6qEnWzmkGmQayBIk8nOftTyYyPIf3hRBG/WDK1zNarp2G/X1weVAaKlkN2MwkPFErmW/Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434078; c=relaxed/simple;
	bh=6VDkLnXloEgLZAQkEc6JPjUeoK2T5pqG7bVPz15pr1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMsEUHbZFTH0w8FFrSjy1hJwDa5bc21n9wk/X8ThjKq1q23MxZm09dvLBfmIVLUKit4iZKa8Get1fyxFDd3tAs1vwgg9UOWHfJ5SqMBoPKwivSqp49K0yBGKm+nsBdMB0CDlycVDQM4MY7TBVNehzrUuAD6mZmmYK3DVEFBZI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWajsXJQ; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWajsXJQ"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadeb7so346549085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434076; x=1790038876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nkm39s62KoUeXtjUMR2iUNjO7KM7iB+N7kJ3tlV0Lus=;
        b=KWajsXJQca+8jP+4W+Awv3bcxbQgBX4xCK/pvK2wkUqizCqB7V7m3epjimcquqeIqK
         wXIKj+6+FJnCrO5/WQbk7q4ukAe0MsriFQA1YM/ilpyE2xFZul9V+pRg2H/YoThOvCyT
         bDoa8AsyOdYCbHMr2/j51zmvc4BlZX62PVOnZYEbHZWbDpyUcNfX646Tj2P6XvXDChI/
         Flk08hhrZ0TM85BcCcceZGtVAIrt12U/xJ+XNWotVBaKE1OFOlo/jSxRhZRj85t96vQR
         LlICI0NGS+P5etWwmUCtM1ke896oDbULB3O8YTxYH2n1fh+KqA4jnQWjicFhEshg/cPr
         f/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434076; x=1790038876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nkm39s62KoUeXtjUMR2iUNjO7KM7iB+N7kJ3tlV0Lus=;
        b=uw6UEEfqGdyRRy+4pP4754ryW12U1hl4h0ZXVOliFCCAijy/vXq8E4auO+mkqh7oys
         jXWKnkRD42d/3aBB1WzicJ80VxyOrF6f8iZMx+XRYvoQP+mtjzGChz5CZM4t3v/EQt8h
         sML6ba6SOVApP3f3JW65zs4TshZASWOw5D3+LoEJphW6VMDpikbPtvpusNvw9I27pije
         F27c5VPwWzItlVPdfrPiSIWLZZT9v3wty/cQOdoVfySLWk11YlI76UxPtigiFPJkpDy2
         4POGFo+WcA0Cpr9SSMt/wQHG1kAH0xJg7d3NuPS0uCu9gO612KxIw4sfp6geCNmEZd/a
         ZeXA==
X-Forwarded-Encrypted: i=1; AKwUvBztRnHyx76C/pfArj+aNb9pTf6DDA+6no6d56BcrqHVMYPSihsJDfAb0HU7z5lxKBEJeK9lVI8DtsoykQU=@vger.kernel.org
X-Gm-Message-State: AFuF++n2bVWePU7FuQ8gnkg32vPilOmbdZsO6C/LVNY2ye1hi4/J8Wzo
	1GIHSpmjOOZX2HKeL1Grph5nrvjZ+LvwxxcaBqQW4cNpsvsOmio3d3Ld
X-Gm-Gg: AYBFou0hQKyw0DYvsn+OOYv/+cgiojIbgIU/rLY69k5LqGiik0EfrJ9gN4r/TNii3GX
	2LCPMmHHIBJty7qepmsjVXwyF2LIp7drNVNmHzLODguEibsp3Ymk4pLbBOdwgCfz1J2kplb8olI
	vgZvBT44QGshp7TnOMxTvoSedJDqB6GK87QqcpEwtKLaAAU59TRVpTbxb2idvZjR9KKJ/dfcrKq
	ZvuR4wXipz5ENCH/F61cExhWCgXP3vAcN18Ouz8YHqDfiB1qYDIgeZzKP5RPop8Y/CqQQ0gLdjh
	Dgntg46GsG3TcNrzQS1S0Qc+yyqNZAM1exvbaE4UyIj1g0rUaKJ+lYBB8DNavRk5fyMVxE7qGbS
	bqnKuaa7CfUS4IVnVVoVkM4W2080+dPtjicvfT4amhdlLAX8e7vWKeW0KHC5VeDOUC5/cyj2kRL
	h8rAJhsrtFY5QW12349t/g8u8rPZgygyBVia2IhCC13074bwud0L6z8m3AD9Nk3ug98yeIaCRfE
	2RWM+uL6IXeqnlAByCotwwByJ0qwUNzzi1BOOoAiNbQ2st6Dw==
X-Received: by 2002:a05:620a:2904:b0:930:9091:f0ce with SMTP id af79cd13be357-93a2985a593mr819363885a.22.1789434075834;
        Mon, 14 Sep 2026 18:01:15 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18467sm1147705885a.11.2026.09.14.18.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:01:15 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: hws: quiesce interrupts without disabling shared IRQ
Date: Mon, 14 Sep 2026 21:01:10 -0400
Message-ID: <20260915010111.101551-3-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915010111.101551-1-hoff.benjamin.k@gmail.com>
References: <20260915010111.101551-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HWS requests its legacy interrupt with IRQF_SHARED, but suspend, shutdown,
and removal call disable_irq() on the shared descriptor. This prevents
other devices on the line from being serviced, and removal leaves the
IRQ disable unbalanced.

Mask the HWS interrupt gate, flush the write, and synchronize the handler.
Publish suspended state before draining so callbacks caused by a peer on
the shared line return without accessing HWS registers after suspend.

Keep capture-core initialization from opening the interrupt gate. Resume
restores the core and clears pending causes before publishing live state
and unmasking the device-local gate.

Fixes: ba07fd2f5742 ("media: pci: add AVMatrix HWS capture driver")
Assisted-by: Codex:GPT-6
Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws_irq.c   | 12 +++---------
 drivers/media/pci/hws/hws_pci.c   | 27 +++++++++++++++++----------
 drivers/media/pci/hws/hws_video.c |  8 ++------
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
index 787c9e498799..8d883663617b 100644
--- a/drivers/media/pci/hws/hws_irq.c
+++ b/drivers/media/pci/hws/hws_irq.c
@@ -150,15 +150,9 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 	struct hws_pcie_dev *pdx = info;
 	u32 int_state;
 
-	/* Fast path: if suspended, quietly ack and exit */
-	if (READ_ONCE(pdx->suspended)) {
-		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		if (int_state) {
-			writel(int_state, pdx->bar0_base + HWS_REG_INT_STATUS);
-			(void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		}
-		return int_state ? IRQ_HANDLED : IRQ_NONE;
-	}
+	if (!pdx || READ_ONCE(pdx->suspended) || !pdx->bar0_base)
+		return IRQ_NONE;
+
 	int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
 	if (!int_state || int_state == 0xFFFFFFFF) {
 		return IRQ_NONE;
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index 65b32fac6d1a..c9397b13392a 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -325,14 +325,21 @@ static void hws_irq_clear_pending(struct hws_pcie_dev *hws)
 static void hws_block_hotpaths(struct hws_pcie_dev *hws)
 {
 	WRITE_ONCE(hws->suspended, true);
-	if (hws->irq >= 0)
-		disable_irq(hws->irq);
+	/* Publish the stop state before a racing handler can enter MMIO. */
+	smp_mb();
 
-	if (!hws->bar0_base)
-		return;
+	if (hws->bar0_base)
+		hws_irq_mask_gate(hws);
 
-	hws_irq_mask_gate(hws);
-	hws_irq_clear_pending(hws);
+	/*
+	 * Do not disable the shared descriptor. Wait for any invocation of this
+	 * handler that raced with the device-local gate instead.
+	 */
+	if (hws->irq >= 0)
+		synchronize_irq(hws->irq);
+
+	if (hws->bar0_base)
+		hws_irq_clear_pending(hws);
 }
 
 static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
@@ -661,11 +668,11 @@ static int hws_pm_resume(struct device *dev)
 	hws_init_video_sys(hws, true);
 	hws_irq_clear_pending(hws);
 
-	/* IRQs can be re-enabled now that MMIO is sane */
-	if (hws->irq >= 0)
-		enable_irq(hws->irq);
-
+	/* Make our handler live before reopening only this device's IRQ gate. */
 	WRITE_ONCE(hws->suspended, false);
+	/* Publish the live state before the device can raise another interrupt. */
+	smp_mb();
+	hws_irq_unmask_gate(hws);
 
 	/* vb2: nothing mandatory; userspace will STREAMON again when ready */
 	hws_video_pm_resume(hws);
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 624c48a63b3b..bdbce09ec3e6 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -565,7 +565,7 @@ static void hws_ack_all_irqs(struct hws_pcie_dev *hws)
 	}
 }
 
-static void hws_open_irq_fabric(struct hws_pcie_dev *hws)
+static void hws_configure_irq_fabric(struct hws_pcie_dev *hws)
 {
 	/* Route all sources to vector 0. */
 	writel(0x00000000, hws->bar0_base + PCIE_INT_DEC_REG_BASE);
@@ -574,10 +574,6 @@ static void hws_open_irq_fabric(struct hws_pcie_dev *hws)
 	/* Enable the PCIe bridge. */
 	writel(0x00000001, hws->bar0_base + PCIEBR_EN_REG_BASE);
 	(void)readl(hws->bar0_base + PCIEBR_EN_REG_BASE);
-
-	/* Open the global/bridge gate (legacy 0x3FFFF) */
-	writel(HWS_INT_EN_MASK, hws->bar0_base + INT_EN_REG_BASE);
-	(void)readl(hws->bar0_base + INT_EN_REG_BASE);
 }
 
 void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable)
@@ -604,7 +600,7 @@ void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable)
 	writel(0x80FFFFFF, hws->bar0_base + HWS_REG_DEC_MODE);
 	writel(0x13, hws->bar0_base + HWS_REG_DEC_MODE);
 	hws_ack_all_irqs(hws);
-	hws_open_irq_fabric(hws);
+	hws_configure_irq_fabric(hws);
 	/* 6) record that we're now running */
 	hws->start_run = true;
 }
