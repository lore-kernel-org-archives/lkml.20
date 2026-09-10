Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448E38F624
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071364; cv=none; b=LfiV+xR3+6SD0Jn+S24jF+YoLp9JiM6vGaFq4NhX6b/wwWX2oGjHCpAgSawGwbqv0g6fB9dfJRTW4T3amO2tCG15WcHMG+fS71qz6nvCQuQs82Q1hccKk/SjtWZwrNhKUypbNG598vzoN9rEPzWxrMYuVWxs+fGnJm0tMlTXlOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071364; c=relaxed/simple;
	bh=2t6iEDA7zf3AOayYdwXK0SOCLfzvJ3STyo7Hy22ZSX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qs5LWUPePecrg5uqU1zjQlsft/7QauCXs96XHJSGATQBXmu2FGi5rjP0LGEWeUYlJsJ68HkdhaJ3ocIOgdu27YZHNj4aCDviH8xlR/HA99fo+yNeiptyFY/37kTnqhxc1LpH1TQJjl0D4GGC7JmDOfNO3yVDoSjMSIG/oPKyl0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkojnT5M; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkojnT5M"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90cc39e06bdso1540616d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071361; x=1789676161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp9c7LyaPvV/qIFnSXfT0Qk+bTOQ/yY3E+O4DTcTZiY=;
        b=BkojnT5MQMJEkDnbqVBwXXkDPTHbwN8zZz0KFPbNf+jCBkljbgepeVCC1XUchsDeUo
         N+XJlThYA23yz9JWk/mENaUIe47grYIcVygFDjRj/R/Ng3xk1YrwXXStCwkn5ZMLaYh0
         3v8P42Sx+RxluB/HYEYsd/4yWhP9jngIgLqOjXbggqOwZPrGnjZbKDJq5LcM1Rt00z03
         Jfpt3A7pWQqGwh2tBKrVEh/4WChosGAnb8opFQOJm4PPxKJQMtISnpJA4rALYMdyejlD
         PJLEqy+uSdcbB/ts5Hy+S+rUTe5Y7A1WEi7d/yZWzSwLhHYjoIaRruy6OYJy8lPj+CYM
         9pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071361; x=1789676161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp9c7LyaPvV/qIFnSXfT0Qk+bTOQ/yY3E+O4DTcTZiY=;
        b=P2pr/sisQ1R88ZnfjKoFUKnJEVxquxbIgQp0N6ShztIxZugcPavx1hQGChQUtiAfq2
         t6Cy1yFE0QHGbZeervw6FOMXgXe+35+kbVTbHtyhVhUELUCZUkWoAYidTjLeuFGICK7w
         Tn4WlU9qbKp/0tl5qZM9pbWXGb8u4zknSd8uRte+mhQmEnKJiQLdSy1WPBFhdoQQnGbi
         8MUqxjar/uXD3oi6Ggc0uWYU3ldIWFfIw3hTNRfVY7TTyOb9am2hCE6AQl31k7IGuIrk
         pG6kMuyga5uJN4gRmG623z2v8RRF8a2emfpwuUfWfXwKwwoZJq/r2LoVmSdtgGSkkBZf
         22EA==
X-Forwarded-Encrypted: i=1; AKwUvBwoJHXzNXjXl0Stjr1WNXI9WoDTdlwlSHIXaInNCU+Whae/0Vw+zipvaYSt0jx7kPSws2aV59ci+F9qTk4=@vger.kernel.org
X-Gm-Message-State: AFuF++kWYOEm7sPk3HxKZWxR9cDGqg6IUHkfGkn1+ZSH4SWX+k5+VUnA
	djYqRwYooRfuUVLhAHEyUzMeRi6eOF03fGmWlRKimy+y5ccvDvBVtWn5
X-Gm-Gg: AYBFou02rSlU27bd0BBlFs9npocUokLJrpFX0ZIMqqba0nPYCOAh6iIZt2evma9bMke
	H0nrySrIrvSRaDOOrTPzXWYxOWyItmij5W/rjQG5GXzYKfOcl1qYNfSbz8zO8oT4/S8v2cOZdC8
	dqDSDCMjv1V2lS4qm1gYEO6pdctxcXj646rjJINSqvZRWXFXgaV1cPx/7kF7osYBB5Y7CNf+J6F
	tFXr7D3EWiM5k6QhcvOiLVQsYFVvWJ/N2VRr4/YDYE/c57RotTrxXFsr5oVBtvVNb6lGKig33DQ
	hJRpNL4tEK8WC03OoMOWw79AYFBkuRbftlRfFoV+SVBjt0AB8Eg6cW3LSsPQ2I2po6nfY1vPvYz
	VKWB3Pi/NYents7HZxRssCTRZYQHR/wWgrSfSsa0zNas7ql1LFZeWZyOfFqcQ3+V0JoXODRYoyy
	VqwraIzhEZnK3KIKEKs/4jtfiqL/V5OTxbtPotnCTmQ1Z7cX4lrgN82YiGmmzOoUZRa/hMIH38f
	s45m7HAn0e6GRPfoqDxooXiuXd5NhV3rGQ/3f3eeu/Aqfh+nCdtWs0kECJet0NmbyqtcUpy/1GZ
	BTB5BX1x6AcZkoR8OeWQU66NOjMUQLNBlOFpR+Uer4YFKk0L
X-Received: by 2002:a05:620a:260f:b0:939:4a44:5f99 with SMTP id af79cd13be357-939ea012e39mr79672685a.10.1789071358621;
        Thu, 10 Sep 2026 13:15:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80f5791sm66868385a.42.2026.09.10.13.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:15:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: fsl_raid: free resources in probe
Date: Thu, 10 Sep 2026 13:15:56 -0700
Message-ID: <20260910201556.44207-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add free_irq() in the error unwind of fsl_re_chan_probe() and in
fsl_re_remove_chan() so the interrupt is always released.

Also add tasklet_kill(). Present in _remove but not _probe.

Also add of_platform_device_destroy() on failure as
of_platform_device_create() increases the reference count and needs
of_platform_device_destroy() on failure. Requires placing the pointer in
the struct for the _remove function.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: pass chan to irq handler
 v2: split platform_get_data change
 drivers/dma/fsl_raid.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index befb4bb69d54..b931bcc06ff2 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -212,11 +212,9 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 /* Per Job Ring interrupt handler */
 static irqreturn_t fsl_re_isr(int irq, void *data)
 {
-	struct fsl_re_chan *re_chan;
+	struct fsl_re_chan *re_chan = data;
 	u32 irqstate, status;
 
-	re_chan = dev_get_drvdata((struct device *)data);
-
 	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
 	if (!irqstate)
 		return IRQ_NONE;
@@ -653,10 +651,11 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	chan_ofdev = of_platform_device_create(np, NULL, dev);
 	if (!chan_ofdev) {
 		dev_err(dev, "Not able to create ofdev for jr %d\n", q);
-		ret = -EINVAL;
-		goto err_free;
+		return -EINVAL;
 	}
 
+	chandev = &chan_ofdev->dev;
+
 	/* read reg property from dts */
 	rc = of_property_read_u32(np, "reg", &ptr);
 	if (rc) {
@@ -677,14 +676,13 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 
 	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
 
-	chandev = &chan_ofdev->dev;
 	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
 
-	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
+	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan);
 	if (ret) {
 		dev_err(dev, "Unable to register interrupt for JR %d\n", q);
 		ret = -EINVAL;
-		goto err_free;
+		goto err_free_tasklet;
 	}
 
 	re_priv->re_jrs[q] = chan;
@@ -704,7 +702,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	if (!chan->inb_ring_virt_addr) {
 		dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
 		ret = -ENOMEM;
-		goto err_free;
+		goto err_free_irq;
 	}
 
 	chan->oub_ring_virt_addr = dma_pool_alloc(chan->re_dev->hw_desc_pool,
@@ -746,7 +744,12 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 err_free_1:
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
 		      chan->inb_phys_addr);
+err_free_irq:
+	free_irq(chan->irq, chan);
+err_free_tasklet:
+	tasklet_kill(&chan->irqtask);
 err_free:
+	of_platform_device_destroy(chandev, NULL);
 	return ret;
 }
 
@@ -852,6 +855,8 @@ static int fsl_re_probe(struct platform_device *ofdev)
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 {
+	free_irq(chan->irq, chan);
+
 	tasklet_kill(&chan->irqtask);
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
@@ -859,6 +864,8 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
 		      chan->oub_phys_addr);
+
+	of_platform_device_destroy(chan->dev, NULL);
 }
 
 static void fsl_re_remove(struct platform_device *ofdev)
-- 
2.55.0

