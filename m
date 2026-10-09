Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290D347207F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532000; cv=none; b=e+a4O9/k31V/1SrSNn0wun2XKfRBr9e8JS2J3OypySkwYy54EgvTD5QD4CY1IXAXlO2lHELVT0YEn60C+NFeKkNiSsZ97JyT0xHaVDN77ezGgwlHC0sQTIG1SY4Jb8NNcLjI9tulCVAQsZX7FvruggNfvxLxj+4Pv96z+TKmpg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532000; c=relaxed/simple;
	bh=R3LSXZ+FGIRaaZdWRoNl3GlFoExwgG/edLQqbMsfJds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NGtJ7dngKEfCm0E8egz4EFxlaGhYGnFyyOT9NU6STwVkvu6I2KhvfJU/ierRRfu/yOWzAx4aYwwBbN7xLqgAu4gJyom7f/vVYUX2fc34WqrHjVqBnKshUayH+qs50DTKFNESNlAvo5UMatMGnY85y9cxDCOxbq5lCO5ffRUlaWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jatcXYIW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jatcXYIW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afe29c08ccso5035725a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531995; x=1792136795; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FjvL8b01mXk5DvR4PJw4NeiN/Lrrl4B7yiu5lqkQT5k=;
        b=jatcXYIWVi9uqpS/SaDUYNz36jvHS6tvDxpTgGTERZMyX2/D9RFzKZ3IIUkv0eFg4r
         JNxtQrYHVAH+8Z18SRjTkH37kzElJmv2tTWmbnUbBDblpGkRDpln68g8pK3+t+ghQHea
         L7EHbgfMGnt8kS3Q/QiSBc3yY5jzlzIJkDmBj3QB0P2eQlXLqMf91ZowAE111SqQSic4
         fa3O9EP83ROdmuGiHC762DdsvC6g4a2UG9vWTp0Yk8Yl2pw60aprKX5XYbMqOzCkH15O
         3ClKNOCpefvRkpg5W9bee7BU0Ie+Wf7KNp1GJbrA3hRgvXn6rapPjZrHhIvmddkyC73u
         fCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531995; x=1792136795;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FjvL8b01mXk5DvR4PJw4NeiN/Lrrl4B7yiu5lqkQT5k=;
        b=1pC63E5925zn9XMHXO0S7wfMdkiOCyTCrpyD00ojuimIiYFTmNFwCwIDM9QtwT243i
         8i/a22adnQflEfn92mOmNGPaKGhftX9rkUvULvi+PPR6qlawwiRuAU9FGBzdpZnimZ7r
         /MjZBB/PcdjuMzMHmCPtFZ16gn2s89PPxy4QvgAgiwCrOONjMNql9wAHXmSJVVd0TFoB
         vOtF6NVQTb0jrdUfy//FQdKyhBaEVOXv+C6eI2yWT14AG7gHXCdV7vcDig/I/IYn8fWT
         kSk4m8Swj9s8je0pWJy11y2Awq/eqIJe1CtoRUyuPl3rcyTTs1UEHrQ9Hvtuj8kHNMn9
         Mwdg==
X-Forwarded-Encrypted: i=1; AKwUvBx98j8MTCIs/eVqkJcaNwVXHEPwszXs+HlcbDTBE874BW+7qyxgyYXClRQDsITaFMidgus68kdkFmxpqqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZwAXC1FeAmzklutEFH0eu01SssgIJJLToPwh/SS3vGHOB461h
	boFm5JQaOk9VRMfSR4WBID18KzW/1gzjfXX+sXDrGXFucToVoX2mKDDvm6/WG2oI
X-Gm-Gg: AYBFou0dNqGgrvXaaD950U9LVj11zNfGkuWFKzPNiFk4Jv4aC5YAOdk+6ncltCg/+ve
	Th2t1X8SJIZfsweUfOfdkn18btQ3vP5dKto4gJOHv7bzjsBarxqZXJuleY12xEtJjKX4mxVjfU5
	ESyt6rcDxxSg6kVvn3OB51zQooWRty5YLebJZS5sesq/b3kBoyf+PFDIaxf5elQibO/SDju1STr
	uGZaVhmARwp4kHNjoygV0bUCRj5Ky94OCsajrn0zYxItanz31GEfrrdfvvOr3hBUGhYeRKYvbj4
	o9tV4+61eRrWB2SjFRXdCBkLxeJdNv6nKmysPkTBo2qDYv+F0P+6rDJSZX2i73jZwFLv6r+z/oq
	G7hg8qX3SeRyl4PwPqO/wjbvIUIFoODF4NnoMnkiY+wrrMXv+E0eXbN8VeSd8S6r4Sh3LY789ZZ
	gLELxxb7aMC85cVJ7OQdzSB0IgcDEzf4vyw11/09tsQg8GbvGKfe/cIcxkAVpOZ6IDQTrUdZCtz
	+vLj7WDKH/hCx2/4MWapTE4Gcc=
X-Received: by 2002:a05:6402:27cb:b0:6af:a566:6f13 with SMTP id 4fb4d7f45d1cf-6b17c4ef796mr786131a12.44.1791531995183;
        Fri, 09 Oct 2026 00:46:35 -0700 (PDT)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd5c27sm719571a12.20.2026.10.09.00.46.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2026 00:46:34 -0700 (PDT)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v6 7/7] char: xillybus: Ignore and report unsolicited interrupts
Date: Fri,  9 Oct 2026 09:45:57 +0200
Message-Id: <20261009074557.19996-8-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261009074557.19996-1-eli.billauer@gmail.com>
References: <20261009074557.19996-1-eli.billauer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

During initialization, the hardware should issue interrupts only in
response to requests from the host. Ignore and log unexpected interrupts,
as these indicate misbehaving hardware, and return IRQ_NONE when the
interrupt appears to be spurious.

In the same spirit, in xilly_quiesce(), assign endpoint->num_channels = 0
before allowing the ISR, in order to expose whether the hardware
incorrectly sends messages related to data channels during shutdown.

Assisted-by: Deepseek:v4-pro Kimi:K2.6 ChatGPT:GPT-5.5 Claude:Sonnet-4.6
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changelog:
    =========
    Change v5->v6: Rebase to current tree
    
    No change on v4->v5.
    
    Changes v3->v4:
     -- Return IRQ_NONE if the interrupt is considered spurious, following
        Sashiko's remark + add attribution to Sashiko.
    
    Changes v2->v3:
     -- Add Assisted-by tag to description
    
    No change on v1->v2.

 drivers/char/xillybus/xillybus.h      |  3 ++
 drivers/char/xillybus/xillybus_core.c | 47 ++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/char/xillybus/xillybus.h b/drivers/char/xillybus/xillybus.h
index 51de7cbc579e..98c7ac4dd1f9 100644
--- a/drivers/char/xillybus/xillybus.h
+++ b/drivers/char/xillybus/xillybus.h
@@ -94,6 +94,9 @@ struct xilly_endpoint {
 	__iomem void *registers;
 	int fatal_error;
 
+	bool allow_isr;
+	spinlock_t allow_isr_lock;
+
 	struct mutex register_mutex;
 	wait_queue_head_t ep_wait;
 
diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 90c5b3d4e517..7189c6d97e7d 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -73,6 +73,8 @@ static struct workqueue_struct *xillybus_wq;
  *
  * rd_spinlock does the same with rd_*_buf_idx, rd_empty and end_offset.
  *
+ * allow_isr_lock protects allow_isr.
+ *
  * register_mutex is endpoint-specific, and is held when non-atomic
  * register operations are performed. wr_mutex and rd_mutex may be
  * held when register_mutex is taken, but none of the spinlocks. Note that
@@ -85,7 +87,8 @@ static struct workqueue_struct *xillybus_wq;
  * Only interruptible blocking is allowed on mutexes and wait queues.
  *
  * All in all, the locking order goes (with skips allowed, of course):
- * wr_mutex -> rd_mutex -> register_mutex -> wr_spinlock -> rd_spinlock
+ * wr_mutex -> rd_mutex -> register_mutex ->
+ * allow_isr_lock -> wr_spinlock -> rd_spinlock
  */
 
 static void malformed_message(struct xilly_endpoint *endpoint, u32 *buf)
@@ -120,6 +123,13 @@ irqreturn_t xillybus_isr(int irq, void *data)
 	unsigned int msg_channel, msg_bufno, msg_data, msg_dir;
 	struct xilly_channel *channel;
 
+	guard(spinlock)(&ep->allow_isr_lock);
+
+	if (!ep->allow_isr) {
+		dev_err_ratelimited(ep->dev, "Unexpected interrupt! Something is wrong with the hardware.\n");
+		return IRQ_NONE;
+	}
+
 	buf = ep->msgbuf_addr;
 	buf_size = ep->msg_buf_size/sizeof(u32);
 
@@ -138,6 +148,7 @@ irqreturn_t xillybus_isr(int irq, void *data)
 			if (++ep->failed_messages > 10) {
 				dev_err(ep->dev,
 					"Lost sync with interrupt messages. Stopping.\n");
+				return IRQ_NONE;
 			} else {
 				dma_sync_single_for_device(ep->dev,
 							   ep->msgbuf_dma_addr,
@@ -284,6 +295,19 @@ irqreturn_t xillybus_isr(int irq, void *data)
 }
 EXPORT_SYMBOL(xillybus_isr);
 
+/*
+ * xilly_allow_isr() is similar to enabling / disabling the interrupt,
+ * with the difference that if an interrupt is issued while ep->allow_isr
+ * is false, this is visible in the kernel log.
+ */
+
+static void xilly_allow_isr(struct xilly_endpoint *ep, bool newstate)
+{
+	guard(spinlock_irqsave)(&ep->allow_isr_lock);
+
+	ep->allow_isr = newstate;
+}
+
 /*
  * A few trivial memory management functions.
  * NOTE: These functions are used only on probe and remove, and therefore
@@ -652,6 +676,8 @@ static int xilly_obtain_idt(struct xilly_endpoint *endpoint)
 
 	channel->wr_sleepy = 1;
 
+	xilly_allow_isr(endpoint, true);
+
 	iowrite32(1 |
 		  (3 << 24), /* Opcode 3 for channel 0 = Send IDT */
 		  endpoint->registers + fpga_buf_ctrl_reg);
@@ -660,6 +686,8 @@ static int xilly_obtain_idt(struct xilly_endpoint *endpoint)
 					     (!channel->wr_sleepy),
 					     XILLY_TIMEOUT);
 
+	xilly_allow_isr(endpoint, false);
+
 	if (t <= 0) {
 		dev_err(endpoint->dev, "Failed to obtain IDT. Aborting.\n");
 
@@ -1838,6 +1866,9 @@ struct xilly_endpoint *xillybus_init_endpoint(struct device *dev)
 	endpoint->failed_messages = 0;
 	endpoint->fatal_error = 0;
 
+	endpoint->allow_isr = false;
+	spin_lock_init(&endpoint->allow_isr_lock);
+
 	init_waitqueue_head(&endpoint->ep_wait);
 	mutex_init(&endpoint->register_mutex);
 
@@ -1850,6 +1881,9 @@ static int xilly_quiesce(struct xilly_endpoint *endpoint)
 	long t;
 
 	endpoint->idtlen = -1;
+	endpoint->num_channels = 0;
+
+	xilly_allow_isr(endpoint, true);
 
 	iowrite32((u32) (endpoint->dma_using_dac & 0x0001),
 		  endpoint->registers + fpga_dma_control_reg);
@@ -1857,6 +1891,9 @@ static int xilly_quiesce(struct xilly_endpoint *endpoint)
 	t = wait_event_interruptible_timeout(endpoint->ep_wait,
 					     (endpoint->idtlen >= 0),
 					     XILLY_TIMEOUT);
+
+	xilly_allow_isr(endpoint, false);
+
 	if (t <= 0) {
 		dev_err(endpoint->dev,
 			"Failed to quiesce the device on exit.\n");
@@ -1910,6 +1947,8 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 
 	endpoint->idtlen = -1;
 
+	xilly_allow_isr(endpoint, true);
+
 	/*
 	 * Set DMA 32/64 bit mode, quiesce the device (?!) and get IDT
 	 * buffer size.
@@ -1920,6 +1959,9 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 	t = wait_event_interruptible_timeout(endpoint->ep_wait,
 					     (endpoint->idtlen >= 0),
 					     XILLY_TIMEOUT);
+
+	xilly_allow_isr(endpoint, false);
+
 	if (t <= 0) {
 		dev_err(endpoint->dev, "No response from FPGA. Aborting.\n");
 		return -ENODEV;
@@ -1946,6 +1988,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 	if (rc)
 		goto failed_idt;
 
+	/* xilly_obtain_idt() allows and then disallows the ISR */
 	rc = xilly_obtain_idt(endpoint);
 	if (rc)
 		goto failed_idt;
@@ -1964,6 +2007,8 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 	if (rc)
 		goto failed_idt;
 
+	xilly_allow_isr(endpoint, true);
+
 	rc = xillybus_init_chrdev(dev, &xillybus_fops,
 				  endpoint->owner, endpoint,
 				  idt_handle.names,
-- 
2.34.1

