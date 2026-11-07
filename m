Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036312;
	b=KjkTreLCWDCAz/6ySjifwERCG/y3/tD7lEFha+a8hCw9XFtG3MfDIN0gmAmj0/AquHoy
	 V7hfZE6BrN2/5VF3qJzZUCvyv4eOa4a7emyd8hZo2ph+tjyYZ1TbWUz2VPpqgls2sXxOz
	 4cDFsYz3lrBWeevtPYuA5LjMydAz6dDMPApCv72DfOcqjiVgUBdeKiiLnkQ/W92zaYGX3
	 wCv5+rg1gezgA/xD/O2kg1vCqQ6TiWSIF+jMjMXOlEJWwrDGP/Lpk+P7GOEJOLBTyZj9N
	 GIinlbJBiB/ys/0bIIdKovKT1MrnaqUSWJFXt/4924UW8WnzQLwu20W3Et/oqcPX6nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=r2dd8jRP0W945/bWYQPeHiO11p85GGQbJrWF47zymFM=;
	b=n4yrVmDbqFgjm/I7hrBZAlfaC3jCvOQoJsGHAkPuAkcCWArVmM5+B7WNkO/dJYQNRS8f
	 qVwikX69g/JsZkP+RHFIrDaUJeKd844jv7OLYTrKPAEiZUu9d4TjAfobVfM/PbWLrzpA6
	 9jQQbs4PcZM7qI6391db8s/gU4eXPLiwtemp6XmrZMN14LibcIWcq1Ql9d+9GxwS81rEo
	 2/Anxk9wdkvKdjrLydy2PoP9F1JZ2n1HNWFhWgxDBH2OuibcZ/6J3pbB3sHoUjtNiTEz+
	 RhBOYcJZtN4+uwbZ9ySKzJqD6uB6mCZymV0TORwIr7AjIFtH8QL3dJjObDJjiFR3J/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y1vSVoue;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1F606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C1F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y1vSVoue
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd3310348d2so117401a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794036311; x=1794641111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2dd8jRP0W945/bWYQPeHiO11p85GGQbJrWF47zymFM=;
        b=Y1vSVoueTJqDLM8jA8agI6cbb4i3g5fC3JmW4R1XHEhndYMfZ6lRtD2CHTqFq5AKqQ
         KXYEFgbEsYMfDGduQAhK69Y23OAxMa72MP7M20XQwkYD+Ox4k1JwFWjhGg1R1b79nu7Y
         U5gMnr4yx+rx4JkXiWjMww5TLCmEZ8g1Wg8sw/59fMAcuMexJIfqpWt9pLhZIz4hTBX5
         0KlyCCRCG1hpOIwRRohXWvKxfTrhbnuaNPca9r4EOR/qkJlmzikAZ8r1uvkSGj7UjLuY
         hLFhxRchs1RRPUGJM3kxBKqlvkvuS3eAh6nacqNNIjyV10nsT/DQQYx7d5iInDdK635c
         iI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794036311; x=1794641111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2dd8jRP0W945/bWYQPeHiO11p85GGQbJrWF47zymFM=;
        b=k2soJlKjy0FCWCp83PuEQUE+Q/nT60JPkhtwaBIiOpe9Aw/rOcbsnrg8JjvH4VqCGU
         WVC/Y8CPX2uLkonrhnt4SZ7oj4SbVhitkSS60OtzNQXdE9zNVoa+rXBaVOQfgT9vsSQB
         b3s9hTHeQS31Csvx5VMmFYDtV9TwpaHQ4cWmBes9FXm6YcNdHHr1kdY9ljbqM4wmIaT3
         28EhWlpcZIwl3UqJUwa7cbmzQuZsLVPH7wDOVQb5TMbaJsqbNsmXI+WWi15kVBASgHey
         JaU6B8wmA9ECMCZPR5gvCoOwR/lLX3kMgpnippWy6OZBkjtbKZk98oy3TDltWzw5l9Lr
         JKjQ==
X-Gm-Message-State: APuU4Z/GJOW98tjIH7mHQEzQX9K+elMVgdWrvzKQ3IW60wMaZXJwe/pf
	w6/UCZoDZM4S2ixp/6n7qz7F2UrX5ASUFQwWn/Ifc0X8bDfuml4fAatd
X-Gm-Gg: AYBFou2KeTxHjqEEcmtzH7Sfs6II5f8sufOVtBtks0DUe2F/MEOsMh60grcQA86i9nP
	RxHoYPj6apdosR+hkeu7lQf2HFMnbFU6YBwHzFVrLP4NW2zgSGiKB4ZKXLrMk+exqO2k8VNFHbG
	vKi6MIMVtJ7O3/N8uz1ZdPjiPJxkJdjR6WmNes4ZpsiGsApYBscipPMw+1nvD7cVlYDCiAoornM
	/zsL80tyRaZ5E06zOnbok9vk1v+GFmO+pnlYDmYA5Pc8/lPufdj62YI0l+bVhFgkPLq70UI+/SZ
	SDVjslx8HoqjZ9TqpltROwkuos22nkDbRu2LRo5MPzlzw9iRGbqhwNredRaMNJs3CyN4VkjRjkD
	iDPYlm9Mshl9SJ71HcgM6h88XUBwvl5cYqJ/bfLep50GJNK4/o8SannAYHTZaQJ/LNYpu3OZ4Ae
	jHgo1KUYnl4X69fYY7Dsu0X2xG2juHSF93SLVUOMXkqpqrnrGJv1EY/klIkdgasv8TVp2Zp+qkr
	/xO7lVAzxrlYqOdwhCEeN+JKpRRMjTQprv8jSJ174XdIhqhk3wRLSGvribYEpjrqyAOluYPF6U6
	XUdGqyYQ3hFsLaSsfvggiIyxvy6VLD4Mtw+0BQ1WW1R4nQqt
X-Received: by 2002:a17:90b:4f42:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b1061d20b8mr905743a91.18.1794036310826;
        Fri, 06 Nov 2026 23:25:10 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c2bc8sm2238847a91.3.2026.11.06.23.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:25:10 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: pch_udc: drain vbus GPIO works before freeing the device
Date: Sat,  7 Nov 2026 16:25:01 +0900
Message-ID: <20261107072501.3434465-1-hj351016@gmail.com>
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
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

pch_vbus_gpio_irq() and pch_udc_dev_isr() schedule
dev->vbus_gpio.irq_work_fall / irq_work_rise (pch_vbus_gpio_work_fall /
pch_vbus_gpio_work_rise), whose handlers obtain the pch_udc_dev via
container_of() and dereference it. Nothing cancels these works on
teardown, and dev is allocated with devm_kzalloc(), so a work still
pending or running when devres frees dev dereferences freed memory
(use-after-free); pch_vbus_gpio_work_fall() polls for up to
PCH_VBUS_PERIOD (3s), widening the window.

The two works are armed from different sources. irq_work_rise is only
set up and scheduled once dev->vbus_gpio.intr is non-zero, from the GPIO
interrupt handler. irq_work_fall is INIT_WORK()ed whenever a VBUS GPIO is
present, and is scheduled either from the GPIO interrupt or, when
dev->vbus_gpio.intr is 0, from the UDC device interrupt
pch_udc_isr() -> pch_udc_dev_isr() on UDC_DEVINT_US.

pch_udc_remove() calls pch_vbus_gpio_free() before pch_udc_exit() masks
the UDC device interrupts, and the PCI interrupt (pch_udc_isr()) is only
released by devres after pch_udc_remove() returns. So draining the works
in pch_vbus_gpio_free() alone races the UDC interrupt: pch_udc_dev_isr()
can re-queue irq_work_fall after cancel_work_sync() has returned.

Mask the UDC device interrupts and synchronize_irq() the PCI interrupt
before draining, so neither source can schedule the works any more, then
cancel them: irq_work_fall whenever a VBUS GPIO port exists, and
irq_work_rise together with free_irq() under the intr guard. free_irq()
runs before its cancel so the GPIO interrupt cannot re-queue either.

Found by static analysis and code review; not runtime-reproduced (needs
EG20T/ML7213 pch_udc hardware with a VBUS detection GPIO and an interrupt
racing device removal).

Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v3: the UDC device interrupt (pch_udc_dev_isr(), UDC_DEVINT_US) can re-queue
    irq_work_fall after cancel_work_sync() when no VBUS GPIO IRQ is in use, so
    v2's drain alone still raced it. Mask the UDC device interrupts and
    synchronize_irq() the PCI interrupt in pch_udc_remove() before draining.
    Also corrected the teardown call-chain in the commit log
    (pch_vbus_gpio_free() runs before pch_udc_exit()). Both per Sashiko review.
v2: drain irq_work_fall under the VBUS-GPIO-port guard rather than the IRQ
    guard, since it is scheduled when vbus_gpio.intr == 0. Per Sashiko review.

 drivers/usb/gadget/udc/pch_udc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce2..a22bf91 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1406,8 +1406,12 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
  */
 static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
 {
-	if (dev->vbus_gpio.intr)
+	if (dev->vbus_gpio.intr) {
 		free_irq(dev->vbus_gpio.intr, dev);
+		cancel_work_sync(&dev->vbus_gpio.irq_work_rise);
+	}
+	if (dev->vbus_gpio.port)
+		cancel_work_sync(&dev->vbus_gpio.irq_work_fall);
 }
 
 /**
@@ -3010,9 +3014,17 @@ static void pch_udc_remove(struct pci_dev *pdev)
 		dma_unmap_single(&dev->pdev->dev, dev->dma_addr,
 				 UDC_EP0OUT_BUFF_SIZE * 4, DMA_FROM_DEVICE);
 
-	pch_vbus_gpio_free(dev);
-
+	/*
+	 * irq_work_fall can be queued from pch_udc_dev_isr() (UDC_DEVINT_US)
+	 * when no VBUS GPIO interrupt is in use, and the PCI interrupt is only
+	 * released by devres after this function returns. Mask the UDC device
+	 * interrupts and wait for any in-flight handler before draining the
+	 * VBUS GPIO works, so the interrupt can no longer re-queue them.
+	 */
 	pch_udc_exit(dev);
+	synchronize_irq(dev->pdev->irq);
+
+	pch_vbus_gpio_free(dev);
 }
 
 static int __maybe_unused pch_udc_suspend(struct device *d)
-- 
2.43.0

