Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984942236EE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434079; cv=none; b=HS8N3/q0xpn4dk+GXNsywzAP3jPwRi6LwvphJ0/Ouz2R/USahnTMBTAe2sbSWA8ZYnNosm96Z6hbhNXJuBuzW+mxkBoMZpDKPcxL3FJIFpHcx6ECTVXylcKHPopYH/CbQattPBBorvXviGh477LytM5vRPBBTmeN6y4isAhZJ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434079; c=relaxed/simple;
	bh=iAb7A5wNgtJCrMo9307qow4ioWDd+SLfoYen1G2IpzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSb5G/ft4fvoWfvSVuI+9z31k3UZyQzVO1yz9bK0cMIdCl1N6rOoSoYriYozWKy/2biHfCcm/A0z/zBeCAVu3JUscteVD6xBt8GSPuoOvfCXLLUZlRVUeosrx4Pmf55SCwxcgY2jYEJmqlJtswnRKRlskBZsvVbUT+Fhpt6NNrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F92xoZgg; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F92xoZgg"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa8so316108785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434075; x=1790038875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGhLYNsepumqw5u0oBUFEEWpvpdu68HMTUiCLOJMcZE=;
        b=F92xoZggng1FwhMCkco2EryOwkI+DsEpgg7jsRSPauFpJjtOT00Qbsdj4F6jl6tuyT
         nn4ZkS3Qhmu83QvMknReLLE/quLouK7DzqLRuDzE2JDeDgMkE4QooVN7bz0dhDbZgzXt
         xSEUDi9dhM3EUPUuVGI3rHpV+qMFrIPl3G9OjnfYKkvh5edVNJ6i9bNV4BfnewNFufXX
         I/KpnfhGzxDkV+xPoVumEkGL7op3crTWz1Ky+CLgOPCHvVUjRrL9kUhyFELEekAkpRU5
         i6YAwshypsepE0kyexNFtxTJU9tGp2PEvzZdJuy0ts7PTjUldS6a0HPgQT0DD7PCxcAO
         giFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434075; x=1790038875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DGhLYNsepumqw5u0oBUFEEWpvpdu68HMTUiCLOJMcZE=;
        b=By1le9SB86JOkw0Y82s/eDZQGxXig1338cuEUlj6F63DLUcOjUBy5fh9YLFP9x/wEo
         NtG7n+Fjv8i23uFTNeiWzUBBte9ylJJhXeUhU/r/WM3wCFwvnxUKPNzVs4SZTAKdcQ/c
         aPyUOKSn9c4J0iZCF1dWQ/5JnKkvrctVmEES3tFagwu5b0FaHn0QFqNzaRXED+pxHufx
         GR3rMz8lxZhkagTtRPBpH+GSObFbjWhKVgEX/Dd+QReQm69DGSmRt/AEkJMHy71bLDUk
         UOjJyLVYaXOpC61cQRipndPXoFpn8DrYU/+wSSNqKTnY3QaXBBcNXG8XvBRmzcT7qh4I
         FalA==
X-Forwarded-Encrypted: i=1; AKwUvBwiuJ1oEJnt8b/hRijYsr1grtCEkNzR4itO/q1RH5YoR9ziDMgd1Ln5EViQVsSdEdJCJU1SXlhjwbvk8ZU=@vger.kernel.org
X-Gm-Message-State: AFuF++njz5t6QESzlTt8xZakyV5U9u9d2z5d1TwwsOPGjWyVwIjvTqH2
	RbXmRpDoj+kQvOcQ4xoDt40gXlXohFQWtFN7dQeZlaIoQd8G9pxSHguE
X-Gm-Gg: AYBFou2BeFjeB3KzbQIhsoNPk1a/YMYOgUABM7tq8J8GyHFZ06WHcWVTz3eQMwGF6gU
	oLsJb7ziZQ336xCf7X43n6IpT9aQesmyzdPrGNRHLx+PKKcrD5S4NTDBmhpcuB7zWvCK7qnDsdo
	uVMRpxST/oL+jCsbpbj3U9IK0E7n8sn6PbA9lCCL1Waa4IZyZv9DjoEwj79mHvGUwM9tJbPslYQ
	EokSI8fARy8xg9YlxBE8icTL1SzK482HQu1dC/opmohAe8AUpUgkCI3L7sFGc9dibTAJScGTVn6
	3IS5C2ihmZs7z0oUuqdBaS5XMyYxFqpMWbeced3T2NYBrjIrCbTYQ69PpRsdKA1zTEVqw8uf/C0
	HKscvZC7dRV9l9df2CHEN+A+yldVr6Q3wGZPuAQz7rj+vR67uIQXypc8tHVKbE0GcIV/YMEZoJt
	ZzEXuPnRKy+DvII3H8SlqPCW9OWYpDpdLmsYhwRCRMKaehsdDK+cKAtp6lsVZea2Zn09c2w90j1
	aoHkjRK2w8PPEPNkxjy5ymK+naJlSUPLeaM4JaYLE33GhzS
X-Received: by 2002:a05:620a:2702:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-93a297ee80cmr821092685a.15.1789434074608;
        Mon, 14 Sep 2026 18:01:14 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18467sm1147705885a.11.2026.09.14.18.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:01:14 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: hws: remove debug controls and lifecycle tracing
Date: Mon, 14 Sep 2026 21:01:09 -0400
Message-ID: <20260915010111.101551-2-hoff.benjamin.k@gmail.com>
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

Remove the toggle_debug and dma_window_verify module parameters, register
snapshots, and routine capture and lifecycle messages. These diagnostics
add register reads to interrupt and format paths, including IRQ debug
reads before the suspended-state check.

Keep error reporting and the posted-write flush needed before arming DMA.
This also removes diagnostic MMIO accesses that would otherwise bypass
the suspended-handler guard in the following shared-IRQ fix.

Assisted-by: Codex:GPT-6
Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws_irq.c        |  74 -------------
 drivers/media/pci/hws/hws_pci.c        | 145 +------------------------
 drivers/media/pci/hws/hws_v4l2_ioctl.c |  14 ---
 drivers/media/pci/hws/hws_video.c      | 125 +--------------------
 4 files changed, 4 insertions(+), 354 deletions(-)

diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
index eebb4b8a5cd5..787c9e498799 100644
--- a/drivers/media/pci/hws/hws_irq.c
+++ b/drivers/media/pci/hws/hws_irq.c
@@ -16,38 +16,23 @@
 
 #define MAX_INT_LOOPS 100
 
-static bool hws_toggle_debug;
-module_param_named(toggle_debug, hws_toggle_debug, bool, 0644);
-MODULE_PARM_DESC(toggle_debug,
-		 "Read toggle registers in IRQ handler for debug logging");
-
 static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 {
 	struct hws_video *v = &hws->video[ch];
 	unsigned long flags;
 	struct hwsvideo_buffer *buf;
 
-	dev_dbg(&hws->pdev->dev,
-		"arm_next(ch=%u): stop=%d cap=%d queued=%d\n",
-		ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active),
-		!list_empty(&v->capture_queue));
-
 	if (READ_ONCE(hws->suspended)) {
-		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): suspended\n", ch);
 		return -EBUSY;
 	}
 
 	if (READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active)) {
-		dev_dbg(&hws->pdev->dev,
-			"arm_next(ch=%u): stop=%d cap=%d -> cancel\n", ch,
-			v->stop_requested, v->cap_active);
 		return -ECANCELED;
 	}
 
 	spin_lock_irqsave(&v->irq_lock, flags);
 	if (list_empty(&v->capture_queue)) {
 		spin_unlock_irqrestore(&v->irq_lock, flags);
-		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): queue empty\n", ch);
 		return -EAGAIN;
 	}
 
@@ -57,8 +42,6 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 		v->queued_count--;
 	v->active = buf;
 	spin_unlock_irqrestore(&v->irq_lock, flags);
-	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): picked buffer %p\n", ch,
-		buf);
 
 	/* Publish descriptor(s) before doorbell/MMIO kicks. */
 	wmb();
@@ -67,8 +50,6 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 	if (READ_ONCE(hws->suspended)) {
 		unsigned long f;
 
-		dev_dbg(&hws->pdev->dev,
-			"arm_next(ch=%u): suspended after pick\n", ch);
 		spin_lock_irqsave(&v->irq_lock, f);
 		if (v->active) {
 			list_add(&buf->list, &v->capture_queue);
@@ -88,8 +69,6 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 			  hws->bar0_base + HWS_REG_DMA_ADDR(ch));
 	}
 
-	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): programmed buffer %p\n", ch,
-		buf);
 	spin_lock_irqsave(&v->irq_lock, flags);
 	hws_prime_next_locked(v);
 	spin_unlock_irqrestore(&v->irq_lock, flags);
@@ -104,16 +83,8 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	unsigned long flags;
 	bool promoted = false;
 
-	dev_dbg(&hws->pdev->dev,
-		"bh_video(ch=%u): stop=%d cap=%d active=%p\n",
-		ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active),
-		v->active);
-
 	int ret;
 
-	dev_dbg(&hws->pdev->dev,
-		"bh_video(ch=%u): entry stop=%d cap=%d\n", ch,
-		v->stop_requested, v->cap_active);
 	if (READ_ONCE(hws->suspended))
 		return;
 
@@ -149,10 +120,6 @@ static void hws_video_handle_vdone(struct hws_video *v)
 
 		vb2v->sequence = (u32)atomic_inc_return(&v->sequence_number);
 		vb2v->vb2_buf.timestamp = ktime_get_ns();
-		dev_dbg(&hws->pdev->dev,
-			"bh_video(ch=%u): DONE buf=%p seq=%u half_seen=%d toggle=%u\n",
-			ch, done, vb2v->sequence, v->half_seen,
-			v->last_buf_half_toggle);
 
 		if (!promoted)
 			v->active = NULL;	/* channel no longer owns this buffer */
@@ -163,9 +130,6 @@ static void hws_video_handle_vdone(struct hws_video *v)
 		return;
 
 	if (promoted) {
-		dev_dbg(&hws->pdev->dev,
-			"bh_video(ch=%u): promoted pre-armed buffer active=%p\n",
-			ch, v->active);
 		spin_lock_irqsave(&v->irq_lock, flags);
 		hws_prime_next_locked(v);
 		spin_unlock_irqrestore(&v->irq_lock, flags);
@@ -176,13 +140,8 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	/* 2) Immediately arm the next queued buffer (if present) */
 	ret = hws_arm_next(hws, ch);
 	if (ret == -EAGAIN) {
-		dev_dbg(&hws->pdev->dev,
-			"bh_video(ch=%u): no queued buffer to arm\n", ch);
 		return;
 	}
-	dev_dbg(&hws->pdev->dev,
-		"bh_video(ch=%u): armed next buffer, active=%p\n", ch,
-		v->active);
 	/* On success the engine now points at v->active's DMA address */
 }
 
@@ -191,14 +150,6 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 	struct hws_pcie_dev *pdx = info;
 	u32 int_state;
 
-	dev_dbg(&pdx->pdev->dev, "irq: entry\n");
-	if (pdx->bar0_base) {
-		dev_dbg(&pdx->pdev->dev,
-			"irq: INT_EN=0x%08x INT_STATUS=0x%08x\n",
-			readl(pdx->bar0_base + INT_EN_REG_BASE),
-			readl(pdx->bar0_base + HWS_REG_INT_STATUS));
-	}
-
 	/* Fast path: if suspended, quietly ack and exit */
 	if (READ_ONCE(pdx->suspended)) {
 		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
@@ -210,12 +161,8 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 	}
 	int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
 	if (!int_state || int_state == 0xFFFFFFFF) {
-		dev_dbg(&pdx->pdev->dev,
-			"irq: spurious or device-gone int_state=0x%08x\n",
-			int_state);
 		return IRQ_NONE;
 	}
-	dev_dbg(&pdx->pdev->dev, "irq: entry INT_STATUS=0x%08x\n", int_state);
 
 	/* Loop until all pending bits are serviced (max 100 iterations) */
 	for (u32 cnt = 0; int_state && cnt < MAX_INT_LOOPS; ++cnt) {
@@ -227,27 +174,9 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 
 			if (READ_ONCE(pdx->video[ch].cap_active) &&
 			    !READ_ONCE(pdx->video[ch].stop_requested)) {
-				if (hws_toggle_debug) {
-					u32 toggle =
-					    readl_relaxed(pdx->bar0_base +
-						  HWS_REG_VBUF_TOGGLE(ch)) & 0x01;
-					WRITE_ONCE(pdx->video[ch].last_buf_half_toggle,
-						   toggle);
-				}
 				dma_rmb();
 				WRITE_ONCE(pdx->video[ch].half_seen, true);
-				dev_dbg(&pdx->pdev->dev,
-					"irq: VDONE ch=%u toggle=%u handling inline (cap=%d)\n",
-					ch,
-					READ_ONCE(pdx->video[ch].last_buf_half_toggle),
-					READ_ONCE(pdx->video[ch].cap_active));
 				hws_video_handle_vdone(&pdx->video[ch]);
-			} else {
-				dev_dbg(&pdx->pdev->dev,
-					"irq: VDONE ch=%u ignored (cap=%d stop=%d)\n",
-					ch,
-					READ_ONCE(pdx->video[ch].cap_active),
-					READ_ONCE(pdx->video[ch].stop_requested));
 			}
 
 			writel(vbit, pdx->bar0_base + HWS_REG_INT_STATUS);
@@ -256,9 +185,6 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 
 		/* Re-read in case new interrupt bits popped while processing */
 		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		dev_dbg(&pdx->pdev->dev,
-			"irq: loop cnt=%u new INT_STATUS=0x%08x\n", cnt,
-			int_state);
 		if (cnt + 1 == MAX_INT_LOOPS)
 			dev_warn_ratelimited(&pdx->pdev->dev,
 					     "IRQ storm? status=0x%08x\n",
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index f06e60dc2ee6..65b32fac6d1a 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -27,11 +27,6 @@
 #define HWS_BUSY_POLL_DELAY_US 10
 #define HWS_BUSY_POLL_TIMEOUT_US 1000000
 
-static unsigned long long hws_elapsed_us(u64 start_ns)
-{
-	return div_u64(ktime_get_mono_fast_ns() - start_ns, 1000);
-}
-
 /* register layout inside HWS_REG_DEVICE_INFO */
 #define DEVINFO_VER GENMASK(15, 8)
 #define DEVINFO_SUBVER GENMASK(23, 16)
@@ -139,38 +134,6 @@ static void hws_configure_hardware_capabilities(struct hws_pcie_dev *hdev)
 
 static void hws_stop_device(struct hws_pcie_dev *hws);
 
-static void hws_log_lifecycle_snapshot(struct hws_pcie_dev *hws,
-				       const char *action,
-				       const char *phase)
-{
-	struct device *dev;
-	u32 int_en, int_status, vcap, sys_status, dec_mode;
-
-	if (!hws || !hws->pdev)
-		return;
-
-	dev = &hws->pdev->dev;
-	if (!hws->bar0_base) {
-		dev_dbg(dev,
-			"lifecycle:%s:%s bar0-unmapped suspended=%d start_run=%d pci_lost=%d irq=%d\n",
-			action, phase, READ_ONCE(hws->suspended), hws->start_run,
-			hws->pci_lost, hws->irq);
-		return;
-	}
-
-	int_en = readl(hws->bar0_base + INT_EN_REG_BASE);
-	int_status = readl(hws->bar0_base + HWS_REG_INT_STATUS);
-	vcap = readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
-	sys_status = readl(hws->bar0_base + HWS_REG_SYS_STATUS);
-	dec_mode = readl(hws->bar0_base + HWS_REG_DEC_MODE);
-
-	dev_dbg(dev,
-		"lifecycle:%s:%s suspended=%d start_run=%d pci_lost=%d irq=%d INT_EN=0x%08x INT_STATUS=0x%08x VCAP=0x%08x SYS=0x%08x DEC=0x%08x\n",
-		action, phase, READ_ONCE(hws->suspended), hws->start_run,
-		hws->pci_lost, hws->irq, int_en, int_status, vcap,
-		sys_status, dec_mode);
-}
-
 static int read_chip_id(struct hws_pcie_dev *hdev)
 {
 	u32 reg;
@@ -197,11 +160,6 @@ static int read_chip_id(struct hws_pcie_dev *hdev)
 
 	hws_configure_hardware_capabilities(hdev);
 
-	dev_info(&hdev->pdev->dev,
-		 "chip detected: ver=%u subver=%u port=%u yv12=%u\n",
-		 hdev->device_ver, hdev->sub_ver, hdev->port_id,
-		 hdev->support_yv12);
-
 	return 0;
 }
 
@@ -228,7 +186,6 @@ static int main_ks_thread_handle(void *data)
 		schedule_timeout_interruptible(msecs_to_jiffies(1000));
 	}
 
-	dev_dbg(&pdx->pdev->dev, "%s: exiting\n", __func__);
 	return 0;
 }
 
@@ -236,22 +193,14 @@ static void hws_stop_kthread_action(void *data)
 {
 	struct hws_pcie_dev *hws = data;
 	struct task_struct *t;
-	u64 start_ns;
 
 	if (!hws)
 		return;
 
 	t = READ_ONCE(hws->main_task);
 	if (!IS_ERR_OR_NULL(t)) {
-		start_ns = ktime_get_mono_fast_ns();
-		dev_dbg(&hws->pdev->dev,
-			"lifecycle:kthread-stop:begin task=%s[%d]\n",
-			t->comm, t->pid);
 		WRITE_ONCE(hws->main_task, NULL);
 		kthread_stop(t);
-		dev_dbg(&hws->pdev->dev,
-			"lifecycle:kthread-stop:done (%lluus)\n",
-			hws_elapsed_us(start_ns));
 	}
 }
 
@@ -424,8 +373,6 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 		if (ret)
 			return dev_err_probe(&pdev->dev, ret,
 					     "No suitable DMA configuration\n");
-	} else {
-		dev_dbg(&pdev->dev, "Using 64-bit DMA mask\n");
 	}
 
 	/* 3) Apply optional PCIe tuning. */
@@ -436,8 +383,6 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 
 	/* 4) Identify chip & capabilities */
 	read_chip_id(hws);
-	dev_info(&pdev->dev, "Device VID=0x%04x DID=0x%04x\n",
-		 pdev->vendor, pdev->device);
 	hws_init_video_sys(hws, false);
 
 	/* 5) Init channels (video state, locks, vb2, ctrls) */
@@ -462,7 +407,6 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	irqf = IRQF_SHARED;
 	irq = pdev->irq;
 	hws->irq = irq;
-	dev_info(&pdev->dev, "IRQ mode: legacy INTx (shared), irq=%d\n", irq);
 
 	/* B) Mask the device's global/bridge gate (INT_EN_REG_BASE) */
 	hws_irq_mask_gate(hws);
@@ -485,13 +429,10 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 		ctl_reg |= HWS_CTL_IRQ_ENABLE_BIT;
 		writel(ctl_reg, hws->bar0_base + HWS_REG_CTL);
 		(void)readl(hws->bar0_base + HWS_REG_CTL); /* flush write */
-		dev_info(&pdev->dev, "Global IRQ enable bit set in control register\n");
 	}
 
 	/* F) Open the global gate just like legacy did */
 	hws_irq_unmask_gate(hws);
-	dev_info(&pdev->dev, "INT_EN_GATE readback=0x%08x\n",
-		 readl(hws->bar0_base + INT_EN_REG_BASE));
 
 	/* 11) Register V4L2 */
 	ret = hws_video_register(hws);
@@ -515,8 +456,6 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 		goto err_unregister_va; /* reset already stopped the thread */
 	}
 
-	/* 13) Final: show the line is armed */
-	dev_info(&pdev->dev, "irq handler installed on irq=%d\n", irq);
 	return 0;
 
 err_unregister_va:
@@ -558,7 +497,6 @@ static void hws_stop_dsp(struct hws_pcie_dev *hws)
 
 	/* Read the decoder mode/status register */
 	status = readl(hws->bar0_base + HWS_REG_DEC_MODE);
-	dev_dbg(&hws->pdev->dev, "%s: status=0x%08x\n", __func__, status);
 
 	/* If the device looks unplugged/stuck, bail out */
 	if (status == 0xFFFFFFFF)
@@ -593,7 +531,6 @@ static void hws_drain_after_stop(struct hws_pcie_dev *hws)
 {
 	u32 ackmask = 0;
 	unsigned int i;
-	u64 start_ns = ktime_get_mono_fast_ns();
 
 	/* Mask device enables: no new DMA starts. */
 	writel(0x0, hws->bar0_base + HWS_REG_VCAP_ENABLE);
@@ -613,23 +550,17 @@ static void hws_drain_after_stop(struct hws_pcie_dev *hws)
 	/* Ensure no hard IRQ is still running. */
 	if (hws->irq >= 0)
 		synchronize_irq(hws->irq);
-
-	dev_dbg(&hws->pdev->dev, "lifecycle:drain-after-stop:done (%lluus)\n",
-		hws_elapsed_us(start_ns));
 }
 
 static void hws_stop_device(struct hws_pcie_dev *hws)
 {
 	u32 status = readl(hws->bar0_base + HWS_REG_SYS_STATUS);
-	u64 start_ns = ktime_get_mono_fast_ns();
 	bool live = status != 0xFFFFFFFF;
 
-	dev_dbg(&hws->pdev->dev, "%s: status=0x%08x\n", __func__, status);
 	if (!live) {
 		hws->pci_lost = true;
 		goto out;
 	}
-	hws_log_lifecycle_snapshot(hws, "stop-device", "begin");
 
 	/* Make ISR/BH a no-op, then drain engines/IRQ. */
 	hws_publish_stop_flags(hws);
@@ -640,13 +571,6 @@ static void hws_stop_device(struct hws_pcie_dev *hws)
 
 out:
 	hws->start_run = false;
-	if (live)
-		hws_log_lifecycle_snapshot(hws, "stop-device", "end");
-	else
-		dev_dbg(&hws->pdev->dev, "lifecycle:stop-device:device-lost\n");
-	dev_dbg(&hws->pdev->dev, "lifecycle:stop-device:done (%lluus)\n",
-		hws_elapsed_us(start_ns));
-	dev_dbg(&hws->pdev->dev, "%s: complete\n", __func__);
 }
 
 static int hws_quiesce_for_transition(struct hws_pcie_dev *hws,
@@ -654,40 +578,20 @@ static int hws_quiesce_for_transition(struct hws_pcie_dev *hws,
 				      bool stop_thread)
 {
 	struct device *dev = &hws->pdev->dev;
-	u64 start_ns = ktime_get_mono_fast_ns();
-	u64 step_ns;
 	int vret;
 
-	hws_log_lifecycle_snapshot(hws, action, "begin");
-
-	step_ns = ktime_get_mono_fast_ns();
 	hws_block_hotpaths(hws);
-	dev_dbg(dev, "lifecycle:%s:block-hotpaths (%lluus)\n", action,
-		hws_elapsed_us(step_ns));
-	hws_log_lifecycle_snapshot(hws, action, "blocked");
 
 	if (stop_thread) {
-		step_ns = ktime_get_mono_fast_ns();
 		hws_stop_kthread_action(hws);
-		dev_dbg(dev, "lifecycle:%s:stop-kthread (%lluus)\n", action,
-			hws_elapsed_us(step_ns));
 	}
 
-	step_ns = ktime_get_mono_fast_ns();
 	vret = hws_video_quiesce(hws, action);
-	dev_dbg(dev, "lifecycle:%s:video-quiesce ret=%d (%lluus)\n", action,
-		vret, hws_elapsed_us(step_ns));
 	if (vret)
 		dev_warn(dev, "lifecycle:%s video quiesce returned %d\n",
 			 action, vret);
 
-	step_ns = ktime_get_mono_fast_ns();
 	hws_stop_device(hws);
-	dev_dbg(dev, "lifecycle:%s:stop-device (%lluus)\n", action,
-		hws_elapsed_us(step_ns));
-	hws_log_lifecycle_snapshot(hws, action, "end");
-	dev_dbg(dev, "lifecycle:%s:quiesce-done ret=%d (%lluus)\n", action,
-		vret, hws_elapsed_us(start_ns));
 
 	return vret;
 }
@@ -695,15 +599,10 @@ static int hws_quiesce_for_transition(struct hws_pcie_dev *hws,
 static void hws_remove(struct pci_dev *pdev)
 {
 	struct hws_pcie_dev *hws = pci_get_drvdata(pdev);
-	u64 start_ns;
 
 	if (!hws)
 		return;
 
-	start_ns = ktime_get_mono_fast_ns();
-	dev_info(&pdev->dev, "lifecycle:remove begin\n");
-	hws_log_lifecycle_snapshot(hws, "remove", "begin");
-
 	/* Stop the monitor thread before tearing down V4L2/vb2 objects. */
 	hws_block_hotpaths(hws);
 	hws_stop_kthread_action(hws);
@@ -717,9 +616,6 @@ static void hws_remove(struct pci_dev *pdev)
 	/* Release seeded DMA buffers */
 	hws_free_seed_buffers(hws);
 	/* kthread is stopped by the devm action registered in probe. */
-	hws_log_lifecycle_snapshot(hws, "remove", "end");
-	dev_info(&pdev->dev, "lifecycle:remove done (%lluus)\n",
-		 hws_elapsed_us(start_ns));
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -727,22 +623,13 @@ static int hws_pm_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct hws_pcie_dev *hws = pci_get_drvdata(pdev);
-	int vret;
-	u64 start_ns = ktime_get_mono_fast_ns();
-	u64 step_ns;
 
-	dev_info(dev, "lifecycle:pm_suspend begin\n");
-	vret = hws_quiesce_for_transition(hws, "pm_suspend", false);
+	hws_quiesce_for_transition(hws, "pm_suspend", false);
 
-	step_ns = ktime_get_mono_fast_ns();
 	pci_save_state(pdev);
 	pci_clear_master(pdev);
 	pci_disable_device(pdev);
 	pci_set_power_state(pdev, PCI_D3hot);
-	dev_dbg(dev, "lifecycle:pm_suspend:pci-d3hot (%lluus)\n",
-		hws_elapsed_us(step_ns));
-	dev_info(dev, "lifecycle:pm_suspend done ret=%d (%lluus)\n", vret,
-		 hws_elapsed_us(start_ns));
 
 	return 0;
 }
@@ -752,13 +639,8 @@ static int hws_pm_resume(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct hws_pcie_dev *hws = pci_get_drvdata(pdev);
 	int ret;
-	u64 start_ns = ktime_get_mono_fast_ns();
-	u64 step_ns;
-
-	dev_info(dev, "lifecycle:pm_resume begin\n");
 
 	/* Back to D0 and re-enable the function */
-	step_ns = ktime_get_mono_fast_ns();
 	pci_set_power_state(pdev, PCI_D0);
 
 	ret = pci_enable_device(pdev);
@@ -768,39 +650,25 @@ static int hws_pm_resume(struct device *dev)
 	}
 	pci_restore_state(pdev);
 	pci_set_master(pdev);
-	dev_dbg(dev, "lifecycle:pm_resume:pci-enable (%lluus)\n",
-		hws_elapsed_us(step_ns));
 
 	/* Reapply any PCIe tuning lost across D3 */
 	enable_pcie_relaxed_ordering(pdev);
 
 	/* Reinitialize chip-side capabilities / registers */
-	step_ns = ktime_get_mono_fast_ns();
 	read_chip_id(hws);
 	/* Re-seed BAR remaps/DMA windows and restart the capture core */
 	hws_seed_all_channels(hws);
 	hws_init_video_sys(hws, true);
 	hws_irq_clear_pending(hws);
-	dev_dbg(dev, "lifecycle:pm_resume:chip-reinit (%lluus)\n",
-		hws_elapsed_us(step_ns));
 
 	/* IRQs can be re-enabled now that MMIO is sane */
-	step_ns = ktime_get_mono_fast_ns();
 	if (hws->irq >= 0)
 		enable_irq(hws->irq);
 
 	WRITE_ONCE(hws->suspended, false);
-	dev_dbg(dev, "lifecycle:pm_resume:irq-unsuspend (%lluus)\n",
-		hws_elapsed_us(step_ns));
 
 	/* vb2: nothing mandatory; userspace will STREAMON again when ready */
-	step_ns = ktime_get_mono_fast_ns();
 	hws_video_pm_resume(hws);
-	dev_dbg(dev, "lifecycle:pm_resume:video-resume (%lluus)\n",
-		hws_elapsed_us(step_ns));
-	hws_log_lifecycle_snapshot(hws, "pm_resume", "end");
-	dev_info(dev, "lifecycle:pm_resume done (%lluus)\n",
-		 hws_elapsed_us(start_ns));
 
 	return 0;
 }
@@ -814,22 +682,13 @@ static SIMPLE_DEV_PM_OPS(hws_pm_ops, hws_pm_suspend, hws_pm_resume);
 static void hws_shutdown(struct pci_dev *pdev)
 {
 	struct hws_pcie_dev *hws = pci_get_drvdata(pdev);
-	int vret = 0;
-	u64 start_ns = ktime_get_mono_fast_ns();
-	u64 step_ns;
 
 	if (!hws)
 		return;
 
-	dev_info(&pdev->dev, "lifecycle:pci_shutdown begin\n");
-	vret = hws_quiesce_for_transition(hws, "pci_shutdown", true);
+	hws_quiesce_for_transition(hws, "pci_shutdown", true);
 
-	step_ns = ktime_get_mono_fast_ns();
 	pci_clear_master(pdev);
-	dev_dbg(&pdev->dev, "lifecycle:pci_shutdown:clear-master (%lluus)\n",
-		hws_elapsed_us(step_ns));
-	dev_info(&pdev->dev, "lifecycle:pci_shutdown done ret=%d (%lluus)\n",
-		 vret, hws_elapsed_us(start_ns));
 }
 
 static struct pci_driver hws_pci_driver = {
diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci/hws/hws_v4l2_ioctl.c
index ce396b7225d2..7169fd048e73 100644
--- a/drivers/media/pci/hws/hws_v4l2_ioctl.c
+++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
@@ -794,10 +794,6 @@ int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *
 		if (!max_bpl_hw)
 			return -ERANGE;
 		if (bpl > max_bpl_hw) {
-			if (pdev)
-				dev_dbg(&pdev->pdev->dev,
-					"try_fmt: clamp bpl %u -> %zu due to hw buf cap %zu\n",
-					bpl, max_bpl_hw, max_frame);
 			bpl = (u32)max_bpl_hw;
 		}
 	}
@@ -811,11 +807,6 @@ int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *
 	pix->sizeimage    = (u32)size; /* logical size, not page-aligned */
 
 	hws_set_colorimetry_fmt(pix);
-	if (pdev)
-		dev_dbg(&pdev->pdev->dev,
-			"try_fmt: w=%u h=%u bpl=%u size=%u field=%u\n",
-			pix->width, pix->height, pix->bytesperline,
-			pix->sizeimage, pix->field);
 	return 0;
 }
 
@@ -862,11 +853,6 @@ int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *
 	 * hws_calc_sizeimage(vid, vid->pix.width, vid->pix.height, false);
 	 */
 
-	dev_dbg(&vid->parent->pdev->dev,
-		"s_fmt:   w=%u h=%u bpl=%u size=%u\n",
-		vid->pix.width, vid->pix.height, vid->pix.bytesperline,
-		vid->pix.sizeimage);
-
 	return 0;
 }
 
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index dbe0fc2a66b5..624c48a63b3b 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -44,27 +44,15 @@ static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma);
 static struct hwsvideo_buffer *
 hws_take_queued_buffer_locked(struct hws_video *vid);
 
-static unsigned long long hws_elapsed_us(u64 start_ns)
-{
-	return div_u64(ktime_get_mono_fast_ns() - start_ns, 1000);
-}
-
 static inline bool list_node_unlinked(const struct list_head *n)
 {
 	return n->next == LIST_POISON1 || n->prev == LIST_POISON2;
 }
 
-static bool dma_window_verify;
-module_param_named(dma_window_verify, dma_window_verify, bool, 0644);
-MODULE_PARM_DESC(dma_window_verify,
-		 "Read back DMA window registers after programming (debug)");
-
 void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
 			  dma_addr_t dma, const char *tag)
 {
 	iowrite32(lower_32_bits(dma), hws->bar0_base + HWS_REG_DMA_ADDR(ch));
-	dev_dbg(&hws->pdev->dev, "dma_doorbell ch%u: dma=0x%llx tag=%s\n", ch,
-		(u64)dma, tag ? tag : "");
 }
 
 static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
@@ -111,21 +99,7 @@ static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
 
 	vid->window_valid = true;
 
-	if (dma_window_verify && wrote) {
-		u32 r_hi =
-		    readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
-		u32 r_lo =
-		    readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
-			  PCIE_BARADDROFSIZE);
-		u32 r_base = readl(hws->bar0_base + HWS_BUF_BASE_OFF(ch));
-		u32 r_half = readl(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
-
-		dev_dbg(&hws->pdev->dev,
-			"ch%u remap verify: hi=0x%08x page_lo=0x%08x exp_page=0x%08x base=0x%08x exp_base=0x%08x half16B=0x%08x exp_half=0x%08x\n",
-			ch, r_hi, r_lo, page_lo, r_base,
-			(ch + 1) * PCIEBAR_AXI_BASE + pci_addr, r_half,
-			vid->pix.half_size / 16);
-	} else if (wrote) {
+	if (wrote) {
 		/* Flush posted writes before arming DMA */
 		readl_relaxed(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
 	}
@@ -172,9 +146,6 @@ void hws_prime_next_locked(struct hws_video *vid)
 	hws_program_dma_for_addr(hws, vid->channel_index, dma);
 	iowrite32(lower_32_bits(dma),
 		  hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_index));
-	dev_dbg(&hws->pdev->dev,
-		"ch%u pre-armed next buffer %p dma=0x%llx\n",
-		vid->channel_index, next, (u64)dma);
 }
 
 static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
@@ -312,7 +283,6 @@ int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch)
 	atomic_set(&vid->sequence_number, 0);
 	vid->active = NULL;
 
-	/* DMA watchdog removed; retain counters for diagnostics */
 	vid->timeout_count = 0;
 	vid->error_count = 0;
 
@@ -525,9 +495,6 @@ void hws_enable_video_capture(struct hws_pcie_dev *hws, unsigned int chan,
 	(void)readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
 
 	WRITE_ONCE(hws->video[chan].cap_active, on);
-
-	dev_dbg(&hws->pdev->dev, "vcap %s ch%u (reg=0x%08x)\n",
-		on ? "ON" : "OFF", chan, status);
 }
 
 static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
@@ -660,9 +627,6 @@ int hws_check_card_status(struct hws_pcie_dev *hws)
 
 	/* If RUN/READY bit (bit0) is not set, reinitialize the video core. */
 	if (!(status & BIT(0))) {
-		dev_dbg(&hws->pdev->dev,
-			"SYS_STATUS not ready (0x%08x), reinitializing\n",
-			status);
 		hws_init_video_sys(hws, true);
 	}
 
@@ -743,18 +707,13 @@ static bool hws_read_active_state(struct hws_pcie_dev *pdx, unsigned int ch,
 static void handle_hwv2_path(struct hws_pcie_dev *hws, unsigned int ch)
 {
 	struct hws_video *vid;
-	u32 reg, in_fps, cur_out_res, want_out_res;
+	u32 reg, cur_out_res, want_out_res;
 
 	if (!hws || !hws->bar0_base || ch >= hws->max_channels)
 		return;
 
 	vid = &hws->video[ch];
 
-	/* 1) Input frame rate (read-only; log or export via debugfs if wanted) */
-	in_fps = readl(hws->bar0_base + HWS_REG_FRAME_RATE(ch));
-	/* dev_dbg(&hws->pdev->dev, "ch%u input fps=%u\n", ch, in_fps); */
-	(void)in_fps;
-
 	/* 2) Output resolution programming.
 	 * For now, mirror the current format to OUT_RES.
 	 */
@@ -1104,11 +1063,6 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 	struct hws_pcie_dev *hws = vid->parent;
 	unsigned long flags;
 
-	dev_dbg(&hws->pdev->dev,
-		"buffer_queue(ch=%u): vb=%p sizeimage=%u q_active=%d\n",
-		vid->channel_index, vb, vid->pix.sizeimage,
-		READ_ONCE(vid->cap_active));
-
 	/* Initialize buffer slot */
 	buf->slot = 0;
 
@@ -1120,9 +1074,6 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 	if (READ_ONCE(vid->cap_active) && !vid->active) {
 		dma_addr_t dma_addr;
 
-		dev_dbg(&hws->pdev->dev,
-			"buffer_queue(ch=%u): priming first vb=%p\n",
-			vid->channel_index, &buf->vb.vb2_buf);
 		list_del_init(&buf->list);
 		vid->queued_count--;
 		vid->active = buf;
@@ -1151,9 +1102,6 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 	unsigned long flags;
 	int ret;
 
-	dev_dbg(&hws->pdev->dev, "start_streaming: ch=%u count=%u\n",
-		v->channel_index, count);
-
 	ret = hws_check_card_status(hws);
 	if (ret) {
 		struct hwsvideo_buffer *b, *tmp;
@@ -1201,9 +1149,6 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 		v->queued_count--;
 		v->active = to_program;
 		prog_vb2 = &to_program->vb.vb2_buf;
-		dev_dbg(&hws->pdev->dev,
-			"start_streaming: ch=%u took buffer %p\n",
-			v->channel_index, to_program);
 	}
 	spin_unlock_irqrestore(&v->irq_lock, flags);
 
@@ -1219,10 +1164,6 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 			iowrite32(lower_32_bits(dma_addr),
 				  hws->bar0_base +
 				  HWS_REG_DMA_ADDR(v->channel_index));
-			dev_dbg(&hws->pdev->dev,
-				"start_streaming: ch=%u programmed buffer %p dma=0x%08x\n",
-				v->channel_index, to_program,
-				lower_32_bits(dma_addr));
 			(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
 		}
 
@@ -1235,47 +1176,11 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 			hws_prime_next_locked(v);
 			spin_unlock_irqrestore(&v->irq_lock, pf);
 		}
-	} else {
-		dev_dbg(&hws->pdev->dev,
-			"start_streaming: ch=%u no buffer yet (will arm on QBUF)\n",
-			v->channel_index);
 	}
 
 	return 0;
 }
 
-static void hws_log_video_state(struct hws_video *v, const char *action,
-				const char *phase)
-{
-	struct hws_pcie_dev *hws = v->parent;
-	unsigned long flags;
-	unsigned int queued = 0;
-	unsigned int tracked = 0;
-	unsigned int seq = 0;
-	struct hwsvideo_buffer *b;
-	bool streaming = vb2_is_streaming(&v->buffer_queue);
-	bool cap_active;
-	bool stop_requested;
-	struct hwsvideo_buffer *active;
-	struct hwsvideo_buffer *next_prepared;
-
-	spin_lock_irqsave(&v->irq_lock, flags);
-	list_for_each_entry(b, &v->capture_queue, list)
-		queued++;
-	cap_active = READ_ONCE(v->cap_active);
-	stop_requested = READ_ONCE(v->stop_requested);
-	active = v->active;
-	next_prepared = v->next_prepared;
-	tracked = v->queued_count;
-	seq = (u32)atomic_read(&v->sequence_number);
-	spin_unlock_irqrestore(&v->irq_lock, flags);
-
-	dev_dbg(&hws->pdev->dev,
-		"video:%s:%s ch=%u streaming=%d cap=%d stop=%d active=%p next=%p queued=%u tracked=%u seq=%u\n",
-		action, phase, v->channel_index, streaming, cap_active,
-		stop_requested, active, next_prepared, queued, tracked, seq);
-}
-
 static void hws_stop_streaming(struct vb2_queue *q)
 {
 	struct hws_video *v = q->drv_priv;
@@ -1283,10 +1188,6 @@ static void hws_stop_streaming(struct vb2_queue *q)
 	unsigned long flags;
 	struct hwsvideo_buffer *b, *tmp;
 	LIST_HEAD(done);
-	unsigned int done_cnt = 0;
-	u64 start_ns = ktime_get_mono_fast_ns();
-
-	hws_log_video_state(v, "streamoff", "begin");
 
 	/* 1) Quiesce SW/HW first */
 	lockdep_assert_held(&v->state_lock);
@@ -1307,12 +1208,7 @@ static void hws_stop_streaming(struct vb2_queue *q)
 		/* Unlink from 'done' before completing */
 		list_del_init(&b->list);
 		vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		done_cnt++;
 	}
-	dev_dbg(&hws->pdev->dev,
-		"video:streamoff:done ch=%u completed=%u (%lluus)\n",
-		v->channel_index, done_cnt, hws_elapsed_us(start_ns));
-	hws_log_video_state(v, "streamoff", "end");
 }
 
 static const struct vb2_ops hwspcie_video_qops = {
@@ -1447,42 +1343,25 @@ void hws_video_unregister(struct hws_pcie_dev *dev)
 int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason)
 {
 	int i, ret = 0;
-	u64 start_ns = ktime_get_mono_fast_ns();
 
-	dev_dbg(&hws->pdev->dev, "video:%s:begin channels=%u\n", reason,
-		hws->cur_max_video_ch);
 	for (i = 0; i < hws->cur_max_video_ch; i++) {
 		struct hws_video *vid = &hws->video[i];
 		struct vb2_queue *q = &vid->buffer_queue;
-		u64 ch_start_ns = ktime_get_mono_fast_ns();
 		bool streaming;
 
 		if (!q || !q->ops) {
-			dev_dbg(&hws->pdev->dev,
-				"video:%s:ch=%d skipped queue-unavailable\n",
-				reason, i);
 			continue;
 		}
 
 		streaming = vb2_is_streaming(q);
-		hws_log_video_state(vid, reason, "channel");
 		if (streaming) {
 			/* Stop via vb2, which runs .stop_streaming. */
 			int r = vb2_streamoff(q, q->type);
 
-			dev_dbg(&hws->pdev->dev,
-				"video:%s:ch=%d streamoff ret=%d (%lluus)\n",
-				reason, i, r, hws_elapsed_us(ch_start_ns));
 			if (r && !ret)
 				ret = r;
-		} else {
-			dev_dbg(&hws->pdev->dev,
-				"video:%s:ch=%d idle (%lluus)\n",
-				reason, i, hws_elapsed_us(ch_start_ns));
 		}
 	}
-	dev_dbg(&hws->pdev->dev, "video:%s:done ret=%d (%lluus)\n", reason,
-		ret, hws_elapsed_us(start_ns));
 	return ret;
 }
 
