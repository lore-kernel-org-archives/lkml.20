Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316554;
	b=KHM+Zz06zbGIVgdt3hWIRAgCg8Z3VVFEcRKzOYzORTCT3Q4Vbt9RPy1HaOMZx+kA/k8J
	 n3LO/vn2rCGoJy1BiE0Km1HYqd3Sq5LtUjHxRVMGZ/9pGc1xbD9oC9RF82knJ7i3FD8Ru
	 IQmqYkPRt3bJa1+30avv92Mf2s+DBKY3gfeBl/ntMwJegTcxwkPgeddq5B3BSoQPtBWwo
	 f+NbF8UywyvzxtkSWgxtwHSVLcrLxbT+quUOrR8UVcF4Fgfoo95spf+Y5O3z+NRf2dU2I
	 IRMwVTFuiXp6k1AvmwlRxhs5xUgy1xF/owu/wKZH0VzIEdeeW+8R1trlXUEtV25Xpow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KWMIZLeeMFs1toVNbHnIwaIuja67UMsXw+1FYa/JCeo=;
	b=v4x8Pi45g94o4DfDZP4qaB+9Jal0u2xsFnJe/0VaixlGxYuKVSdHnHctJQIgPa5fTq5F
	 mU9aUCUHitGREfuyKBpkfMFyZuGWCYNnigM/sovLfWrQVJhqoTIblqN6yzdAyG/xp6Z5S
	 eHuIIoKi+Ve9e3EAxJfLYpKB1YUVbfze4LqVgvhhUH0BogdIHnkBRA4bx97Wv99W2o6E8
	 GeQzRNmbI3uR2H7tPHYKf5AXIxwtC6dEdvo6X9yjCf3zBAPVy5xnTnXzqAqNCdjMyXlON
	 wilO7iB09w8UaD0IuHDqd5acz+s8BEkHLMpNd4zGUF/r8MlV8YGm0+9aMBZrhuoWDNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KsJ25AXr;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A87606A7FE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A87606A7FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KsJ25AXr
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso817679a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316554; x=1794921354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWMIZLeeMFs1toVNbHnIwaIuja67UMsXw+1FYa/JCeo=;
        b=KsJ25AXrsSWkxSwuJGjB9hHCi5tDaW0AfG9/2gz9Ol7P/hU/030sXpLllJTAt0cLGg
         eBj/8MifwHI2osy9l2IScRiXmFkSdV6a7btdxW/fOVmQj2OFH/Vn4vSKQw8thjobPAIA
         X07cltLw2Q9a+3kGu5dcuJ7JIEXRD25U0BQmE+jAofq9LgOXSHH2Xh1LSO7y9nLWqzm+
         GgFFrXKz2x79rFl0YjcxmtxJg5p3fNaK1rKzYhFl6yqUsomB/NJmrJ63a4W8E4mce2tt
         rxrVYQbeZNMku3I4l4U9LjlLaWltPGCQDbbrJpVhNM4PJp2yygz+Si92seoOYIbOnvPc
         K6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316554; x=1794921354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWMIZLeeMFs1toVNbHnIwaIuja67UMsXw+1FYa/JCeo=;
        b=p0V5dIKJk/VbZxAr0D5ZKNFdbM9xVQHDMiyuNlX+NqBARl97K/5HCvku/rsPFpzBVt
         xAQNFttZotuY/cItUeDP5Y5+QUFDtxkjt1mkZLSlPRX+Zphh5sol7xtJi8VP8dpXcs6b
         rq5bltBshOOmADvYBCEdOYXzpYfmaKAHfjQyo2zxoNJd8uTqNrg6invIqg4GBAnT6ghu
         2e5R6nJ5bvA4zmuzWRn4v+Y469jq5mG0zVkFU/5e75Zx7zrS5vJk7K4eVW7uWi9XIoRV
         uM6EPjTq130c14KjvVeHJ+5B7PsyspByM23sgJ2QJjBppp1LDeY9qGAsfYYSD4YQZYG4
         11jw==
X-Forwarded-Encrypted: i=1; AL+hErEp2HK19OIVmWqsFBjjFQIFCqHOdH6JnB1KYrGtMYuKX3D4yJaTCpJJ9jNmhdkc+X0OAeQj6DfK5/CggKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fUz009J6dvx+6wHYaOtItkSqwJs8lm2mRnl/gDiXNPJZg7VJe
	paFEE3GDJGQ+8WEaIrPj514Hfi/mj8pNsILSpH/8KMMDZ7asj0br7XqU
X-Gm-Gg: AYBFou1MXWql7twjg7cMUMy61UVAz1FGvGLqXLn/NowQOP4TFNbOoxmxlpNRpv0cUl/
	EKnx6Ks5PYIuvDC4r4KykrLJrgyRkDh2KTiSo6FHV1N7XmZzHeNyCOjRYcdgEx+MuYHpRKvF6rL
	ua2z9WP8ZGytrc/ScWbdGj8XfV6M5qxB85DjP+1HxgQHoNETnz59WcAoc6AV1IMpZb9poCxlTme
	bcp10UPzGuhGAa+J04Y5bm/DeQHGmQwEalF3NNbHGKCbwtfwWoilynrop2GifULdDxi/fuKeKpu
	0pQab9ZKScdq0ILUpK5h+ZHUgRzdhq3EtSo+MX2jp37J3PmW/1FbXz84pQNy2TYY/B54pBzUXLV
	fBOPa4GOE7PPhkTBeSUdY6wVKSPHLKl9lfHQwlWOBuYkGk+FVPFSPOuQxcKX+1pEttlpUSU2KVP
	PBM9qX7Vi7fVz9hev+Z+utYcw2QLUpEBxtqZ19KIL6RcGNMJ4xiIHNdKcBevMYkgUaMNAAqWZ3A
	qTqd2Hv6nyes3+gY0XSdl2/yVIilxU3BkmG3WFzFf7fOQFrHodM/pg7qenvCil+C1W+SKsprifM
	zr4n+KSknf950BMlOKyFCyXxQf1C8wbZ
X-Received: by 2002:a17:90a:e7d2:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b166d11497mr2661682a91.42.1794316553404;
        Tue, 10 Nov 2026 05:15:53 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:53 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 05/33] dmaengine: ep93xx: hook callbacks via dmaengine BH
Date: Tue, 10 Nov 2026 05:13:05 -0800
Message-ID: <b5d5937dc553fed9b30127ce3ce898b89cddea02.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ep93xx_dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 8a0b66a7d886..b073d9164e83 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -167,7 +167,6 @@ struct ep93xx_dma_chan_cfg {
  * @dma_cfg: channel number, direction
  * @irq: interrupt number of the channel
  * @clk: clock used by this channel
- * @tasklet: channel specific tasklet used for callbacks
  * @lock: lock protecting the fields following
  * @flags: flags for the channel
  * @buffer: which buffer to use next (0/1)
@@ -196,7 +195,6 @@ struct ep93xx_dma_chan {
 	struct ep93xx_dma_chan_cfg	dma_cfg;
 	int				irq;
 	struct clk			*clk;
-	struct tasklet_struct		tasklet;
 	/* protects the fields following */
 	spinlock_t			lock;
 	unsigned long			flags;
@@ -796,9 +794,9 @@ static void ep93xx_dma_advance_work(struct ep93xx_dma_chan *edmac)
 	spin_unlock_irqrestore(&edmac->lock, flags);
 }
 
-static void ep93xx_dma_tasklet(struct tasklet_struct *t)
+static void ep93xx_dma_tasklet(struct dma_chan *chan)
 {
-	struct ep93xx_dma_chan *edmac = from_tasklet(edmac, t, tasklet);
+	struct ep93xx_dma_chan *edmac = to_ep93xx_dma_chan(chan);
 	struct ep93xx_dma_desc *desc, *d;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(list);
@@ -853,12 +851,12 @@ static irqreturn_t ep93xx_dma_interrupt(int irq, void *dev_id)
 	switch (edmac->edma->hw_interrupt(edmac)) {
 	case INTERRUPT_DONE:
 		desc->complete = true;
-		tasklet_schedule(&edmac->tasklet);
+		dmaengine_schedule_bh(&edmac->chan);
 		break;
 
 	case INTERRUPT_NEXT_BUFFER:
 		if (test_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags))
-			tasklet_schedule(&edmac->tasklet);
+			dmaengine_schedule_bh(&edmac->chan);
 		break;
 
 	default:
@@ -1414,7 +1412,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
 		INIT_LIST_HEAD(&edmac->active);
 		INIT_LIST_HEAD(&edmac->queue);
 		INIT_LIST_HEAD(&edmac->free_list);
-		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
+		dmaengine_init_bh(&edmac->chan, ep93xx_dma_tasklet);
 
 		list_add_tail(&edmac->chan.device_node,
 			      &dma_dev->channels);
-- 
2.43.0

