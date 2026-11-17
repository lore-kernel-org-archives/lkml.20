Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895329;
	b=PlaVsJQ5WQKpKboeOILLx8dbLPvTKCKOKazOCzhTjQS6GrxRRj07GIwhV4giNUh2TzUd
	 Kexho23MFlUa3Aava+qOGyGr0Aaf5d+87RX6MpAK+reZ6AkdzK1g/QJ6mEy+WkrLT7dJy
	 8rzeIKK5mcvEsO527xXGjyB3PRXCx0uhSHwlpgUZ2BPFZXJsxMdqT+ojdDwZgLn+5xMHC
	 37f0FkGcQFxmmKgjqGpb6XGzZLmgD3+jHOFUYhTlQCZy/pQ6oHgUfmXm86MIwKMfYyfIJ
	 m3MXcTq843y+0+3BbRvLj6FzG6ykELQa8TvDkuBRlGun99i3RJwwqRajIPQGsfBl/pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kdFONMEpSsExQurD2X7JvvBNBeHJ+tNFPqAE2qVsxuQ=;
	b=lFMXjfn7qqEEdtrzaWSLNuT4aIjMIseyocgBKaEHOPPTcsQfFptgnim5LDtkEULjtvsR
	 yBqm7ERMMsevAxMUf0fEAli70ygUa++PhXynDj0Z9AbqEV9Xa34GEYHN43munk+RPTMrD
	 gHNTPsZ7cFCfRnkaitIh/mn5l23H7IVBdfE/3GZ/ejqX9Mh+BRZHvX4bSVFbMGdZQ2GAj
	 0w4CwBc4XjcHsrLR8wrIuo7jyO2T8JN9rRqBjJ6zZV9C2aMA68D2sry9htUSS1n8lSXdb
	 ow1Fzyfglo3WlrcK9ipqBwLIcK1OkTCWwt8ePhzZLsG3pHvckmdFmgc0T40f0U5GrQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AkVkSAZ/";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4528C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkVkSAZ/
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so16647765e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895327; x=1795500127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdFONMEpSsExQurD2X7JvvBNBeHJ+tNFPqAE2qVsxuQ=;
        b=AkVkSAZ/bgxnWLchZVPyXBpFJgxlQi9sUzpUlYuivxhV5ziy4YIrv6nW+++8p4n+Nu
         LCn+9ZIwNPFilulP6fwNKTgfi/q6ICDl7SjtuHRZ6NtOg/WuDT35TUuvYmnRgsXkyrqQ
         VJ/WvZ6dYo+y00kxF3Un4x2oTplio+MweQhyQpF6EyAfpRPI1Ppv09wOuwuCU8FVdUls
         XZZxwS/SnR9O953Gbtc7970rxdQjJi6CzPGQISxxugfi+PW/PVl3ypzDey1Qxqv1lHDN
         U5fn+34QKPvq9AtIm6DZhXtsGWoEb2xinLz9C6schyCuKSzJZaJ6fA3+qtMyUWSCbPfc
         p9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895327; x=1795500127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdFONMEpSsExQurD2X7JvvBNBeHJ+tNFPqAE2qVsxuQ=;
        b=djkdwRveXECx5ULoUPfmAIx9Tcz97p0O7vIzFzsGuuzZACnumsUaTiPAHSJZYc6Q1C
         TCmztoout2U0VzurqykEchFn7dv6COMCEe06wqWpdLWOpwGV4kpX4GA1+hj2vm5JUJn8
         82ansKOlpFroXpuk+oV58f1B/OAItCqUzWOBOCUWBGbyeJp3aoIW2RuUXKbBptXvcQid
         yKIvFvQ7jDkoSCN27efmakIkUhQm8BBkeS+A7oYXIztRp9oyFHsesPfUMreWjhnmHwS0
         fvY831bifeiqxKY6zR4lClE65JcRvPjcHp4JJtr35Hf1duQtR9UER+JCH9pOvqz1r5sJ
         /w6A==
X-Forwarded-Encrypted: i=1; AL+hErEzXShkCCwX6hC9dg3MJrsQAP7k5RGnlHvS8Z4gAB7MWXUAvNw6mzPT0Qw3XNMFH9s3mubvQLZykUTHphY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I0TtFJc2vTAdqm4wbQrW5iimPzEYLqn1rSIscE63mFVnQ+DsC
	5UIl8bju7aDlTIMOKy+lkqn8ehZ2IIHAFpzTMcm73BWYGCnLL8+jND4a9gtcSCGN
X-Gm-Gg: AYBFou1k/85pO8vDwsNzXLJuBfOOlLotY36V6+SMMRatVYkLrvUMQvwtwssxjmvjABR
	ystm0POygqMcxyb/th7EtaPp0FY7z6h7edDNc1YowE4NhsEBFgVAG9l6WPVPJdTQzXSPr4xk9tK
	+rSucKAXC7MYY+YIcwMwYqgVZwBP0c57u1+0LYc5rak++N1/RBWqzEz3gDF0KmLTLbcFLbjB4fm
	0xcDKzIlfiO4/DCHE0UG7GlrQdVQGPGJVVGmF8MXyYmrsbFBW/B0iJOicrxruUJHcUJ0YDfAJ6E
	L5LXA4EuebwnWYWzY6emzKZttKSjKK6c3ColpceF1YFyRC76sQgqvyDBdGxJ7zRZsR7JE9NzCkd
	fJe0RIBCDpvGzMM+Tb2c5gDE2XLc4RMWqUDqNk1T85s9xqPlxJPDYT0pG8IrRS82/wgqVdsArs/
	hd92BpD4a1iKFl2vGLmh6V7kddeJSBmHeAr80Z2+KA3EUVCSI520zkcvqrKz9AC9W7nFnDEbsCt
	r+0yrqGg1ZTFWF7tjIBPyQ49yxeepvI/bRzNzwc4GkC3Nqmajc0d7myTGQiRwz7Z5FcnIZ8xcNd
	1ZQ5dibw1slpFrxV3ZOuo/xlI454E5iK22yzoPWZGWatvCLrxLQdrqdYvoXX5rooZA==
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr258857695e9.2.1794895327227;
        Mon, 16 Nov 2026 22:02:07 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a33c344a58sm3455470f8f.34.2026.11.16.22.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:02:06 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH] dmaengine: axi-dmac: change IRQ to threaded mode
Date: Tue, 17 Nov 2026 09:01:24 +0300
Message-ID: <20261117060124.27914-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Threaded IRQ handlers run in a less critical context compared to normal
IRQs, so they can perform more complex and time-consuming operations
without causing significant delays in other parts of the kernel.
Additionally, regmap-irqchip requires child devices to handle IRQs in
threaded mode.

In this patch change IRQ to threaded mode for compatibility with
regmap-irqchip.
Switch spin_lock() to spin_lock_irqsave() in IRQ handler as it may be
interrupted in threaded mode. spin_lock_irqsave() prevents recursive
spinlock deadlock.

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 98aaccd26a26..4a340e382e44 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -583,6 +583,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq, void *devid)
 {
 	struct axi_dmac *dmac = devid;
 	unsigned int pending;
+	unsigned long flags;
 	bool start_next = false;
 
 	pending = axi_dmac_read(dmac, AXI_DMAC_REG_IRQ_PENDING);
@@ -591,7 +592,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq, void *devid)
 
 	axi_dmac_write(dmac, AXI_DMAC_REG_IRQ_PENDING, pending);
 
-	spin_lock(&dmac->chan.vchan.lock);
+	spin_lock_irqsave(&dmac->chan.vchan.lock, flags);
 	/* One or more transfers have finished */
 	if (pending & AXI_DMAC_IRQ_EOT) {
 		unsigned int completed;
@@ -602,7 +603,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq, void *devid)
 	/* Space has become available in the descriptor queue */
 	if ((pending & AXI_DMAC_IRQ_SOT) || start_next)
 		axi_dmac_start_transfer(&dmac->chan);
-	spin_unlock(&dmac->chan.vchan.lock);
+	spin_unlock_irqrestore(&dmac->chan.vchan.lock, flags);
 
 	return IRQ_HANDLED;
 }
@@ -1324,8 +1325,10 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_request_irq(&pdev->dev, dmac->irq, axi_dmac_interrupt_handler,
-			       IRQF_SHARED, dev_name(&pdev->dev), dmac);
+	ret = devm_request_threaded_irq(&pdev->dev, dmac->irq, NULL,
+					axi_dmac_interrupt_handler,
+					IRQF_SHARED | IRQF_ONESHOT,
+					dev_name(&pdev->dev), dmac);
 	if (ret)
 		return ret;
 
-- 
2.47.3

