Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316631;
	b=2Z7VW365NzRXT2TCSze3fQu41Ow1uHKO4Lko19y4xMdtqRQMEL4B9n1HsyHzgFxFEk0n
	 oeINaQpnV5aA33hU0pLhzWH/dl3zE/Mb2Ot9Rh8wdzEFIiN9/kIusBO/Qt1oJ28jDAc0U
	 aiYQyLCgSd3qf5cxTJTXL1LzEzYKvIcp+J4f7pOdeTecPddPuRHGpKkUhEkZOjwPynsrz
	 4G5EdKfBVy0Ke5+taMjIDpVTfCaWidnQXC4U/ncwmWZpuC7VJdg+I2PJlu741ToTzahD0
	 sC/eRSSYrot8Y84PcUIlyB58bHXm41yDiAZ++e3FEY1kgtOBBdB+RWlh8tDcO72ziVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQpYBoUkzC/8SCTUHySkHk/Y3ystrO8zczp3tQ3CUnY=;
	b=tlWNL6EL9fsKA0eAgjzXoiINJNb1M6lKn1GbBBhgofVfFW2TaDk5y/mJjyW3uMlmrh4h
	 2e+esORAR1NYs4iIvofuIVHNEw3iDW0tjXwy4593gOfnoiYQorcoTjZH5o+jZVSniV/nT
	 buS9oZDnmTJDwmfgSobykwmkoacTZ6Wpb6c+XCUG3EfjbS4a4EyDx0V6doIzyQFrEQPjN
	 sJ92RrSXkOoPRVzfLRUOWIPixUrWKzPew5Zp3WLNEjHgDuVcJOnl3+tt/dL6HQ6Dd+j0j
	 EV976U4rLXtl5dKmtlLVD3mabYFWZ3RcQdzEc5vrXcJOv8NJYhAVsu1W3dcngQAmlNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZAQxtc9;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0722606B2C9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0722606B2C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZAQxtc9
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so754098a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316630; x=1794921430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQpYBoUkzC/8SCTUHySkHk/Y3ystrO8zczp3tQ3CUnY=;
        b=FZAQxtc9vnpznm7RKJSLf+NOe3hcXZrXKDquJl32G8Aic6Hpb5dUVmnTZGQfnfqsQ4
         A5N+Hnk5FgL+P+uIEVGc0fenBNSLPSYsujyjQiRsNJo7eS49QIY7UDsgtC3N9DnZ0WOd
         h1nY3vbDcbPjFLzcBmJr1ybYkHSqy4lHEMhXBe5bg0kiaVCUPzjjfSxunqgtRH72qD4p
         LUrrV13aTnTPF+tAJ1xAlKUbk3gVl64p2Y3hf/vQzd1xtCPIvUToAP7nwpqra0Szst25
         o7Hzps7tsNlXiLQ8OJa3SEFmzYD3jx8l8qphRW5C66FfVcFy/7jlK7Y+TAmXKKUfcK3u
         5h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316630; x=1794921430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQpYBoUkzC/8SCTUHySkHk/Y3ystrO8zczp3tQ3CUnY=;
        b=vQ8qJNghvVyYtOOFY853zHsxnimcXbL4V1f3MGTx84pAJp5jo92OVeotAHxxuHA/rR
         63NnY0406/HGPc7yscmH14IRUjhmdOpWBLQ9bjXAdTs8fVMBOmiuiWF9VLAQ11Z9LLGY
         0vVtvGBObzICUeCGInYtreaBorbO6SX/DdkabCW7VwRBxdMivQ4nxZuXW5+pNXFkoE9T
         6CIoqaPDlslGs5i0BqTNxfE6JFoymALH7qW3zm1WwBLdfNjiynLCBYv6lBTofO/X55yz
         jqzq3KPTcI1oa0T99OeGedHRAvHbx1owXdeMxkNnVVkH0EcLCY8xn/nnVFw9OXlxLyr4
         GDdw==
X-Forwarded-Encrypted: i=1; AL+hErE/s1OBplpyATO89Mi1MKBrwx1JfXtqGg3dKCjZHRXVAAkexcldbNFV41Zw302U3NgWvUqopkxJ2kSMNjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HVuFJ+Um4ciJ8OSQ5oxvbW5qT1rO0q6QdvWcN0ZKgIdcNZQnL
	KRpccEs+ZensaIGu8mLtEnbxai3SU4gSnRZ27+bax0VT1epb1tk2RGYTrG7Ibw==
X-Gm-Gg: AYBFou297uibg6xs5omMkxAvgP5DPOX5w3dqq1s/bAwCuyaLynIxeyK7ti2QoAgfn5r
	mCEQuObNF43Z8YfWBV3VCMnPzUpe3ZyIIbdRjN01HHJRlY6drNrUonUqkNMlQWR21zRDTXX4fQv
	x688GDoJ146nHwsjfXp8R+BBMazwaaeY3sqAyXsYOPdWZKABvacoi9fyiP0/vEs6BHTXw1HyOx4
	B3waisL2QOm9Z83henZpTeMKP8WMibH5RT80OoscFYzYwzMgJazsUjUdRkHTS8YLfOY4oF63jt3
	VWshjNPlA+uFlsk+IfNxKu9d2ymhnkWHbroazISrQ8SAHv3Lt4P2R01PHca1UAECKGc160P/eo1
	hFJeDrLGXgvklpzLbo3mThhF3M/WEkpd30OUchiCBeaTD+QlfGZMgSPcdrXdAnbv5OvMrmtSZWj
	akD0jMGV0VTh4/Bkrp/GSgcETOjHkQbopEjouGjO89iNit5U/EBQXt+p9No4B+2MZ3h9Kcu5tTj
	gwj1wRZNFsb3fbbgYJW2OTLY8Db4W1w03a3ezDfDj/fLxvD7GGCNSfcVq4r2/RFPXBjpxJwieLd
	8Xtv4/egEPmsAcFrlJh9jVwHkISVPG4=
X-Received: by 2002:a17:90b:540b:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b166d049famr2592552a91.42.1794316629958;
        Tue, 10 Nov 2026 05:17:09 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:09 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 23/33] dmaengine: timb_dma: route callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:23 -0800
Message-ID: <e9f90c61446942c160480ee81e220869de918105.1794315350.git.allen.lkml@gmail.com>
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

Schedule per-channel BH work for completions so callbacks run through
the dma_chan deferral mechanism while keeping the controller tasklet for
IRQ handling.

The controller tasklet recomputes TIMBDMA_IER before the deferred work
has finished the channel, so have the channel BH recompute and rewrite
the mask once the channel state has settled. This keeps the interrupt
enable mask consistent with what the single tasklet used to produce.

Drain the channel BHs in td_remove() and in the probe error path so no
completion work can run after the controller memory is freed.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/timb_dma.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 0acd7a36a3d0..d24508e2a0bb 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -433,6 +433,8 @@ static void td_free_chan_resources(struct dma_chan *chan)
 
 	dev_dbg(dmaengine_chan_dev(chan), "%s: Entry\n", __func__);
 
+	dmaengine_kill_bh(&td_chan->chan);
+
 	/* check that all descriptors are free */
 	BUG_ON(!list_empty(&td_chan->active_list));
 	BUG_ON(!list_empty(&td_chan->queue));
@@ -575,17 +577,42 @@ static void td_tasklet(struct tasklet_struct *t)
 	for (i = 0; i < td->dma.chancnt; i++)
 		if (ipr & (1 << i)) {
 			struct timb_dma_chan *td_chan = td->channels + i;
-			spin_lock(&td_chan->lock);
-			__td_finish(td_chan);
-			if (!list_empty(&td_chan->queue))
-				__td_start_next(td_chan);
-			spin_unlock(&td_chan->lock);
+			dmaengine_schedule_bh(&td_chan->chan);
 		}
 
 	ier = __td_ier_mask(td);
 	iowrite32(ier, td->membase + TIMBDMA_IER);
 }
 
+static void timb_dma_chan_bh(struct dma_chan *chan)
+{
+	struct timb_dma_chan *td_chan = container_of(chan, struct timb_dma_chan,
+						     chan);
+	struct timb_dma *td = tdchantotd(td_chan);
+	u32 ier;
+
+	spin_lock(&td_chan->lock);
+	__td_finish(td_chan);
+	if (!list_empty(&td_chan->queue))
+		__td_start_next(td_chan);
+	spin_unlock(&td_chan->lock);
+
+	/*
+	 * The controller tasklet re-armed IER before this channel was
+	 * finished. Recompute it now that the channel state has changed.
+	 */
+	ier = __td_ier_mask(td);
+	iowrite32(ier, td->membase + TIMBDMA_IER);
+}
+
+static void td_kill_chan_bh(struct timb_dma *td, int nr_channels)
+{
+	int i;
+
+	for (i = 0; i < nr_channels; i++)
+		dmaengine_kill_bh(&td->channels[i].chan);
+}
+
 
 static irqreturn_t td_irq(int irq, void *devid)
 {
@@ -692,6 +719,7 @@ static int td_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&td_chan->active_list);
 		INIT_LIST_HEAD(&td_chan->queue);
 		INIT_LIST_HEAD(&td_chan->free_list);
+		dmaengine_init_bh(&td_chan->chan, timb_dma_chan_bh);
 
 		td_chan->descs = pchan->descriptors;
 		td_chan->desc_elems = pchan->descriptor_elements;
@@ -724,6 +752,7 @@ static int td_probe(struct platform_device *pdev)
 	free_irq(irq, td);
 err_tasklet_kill:
 	tasklet_kill(&td->tasklet);
+	td_kill_chan_bh(td, pdata->nr_channels);
 	iounmap(td->membase);
 err_free_mem:
 	kfree(td);
@@ -736,6 +765,7 @@ static int td_probe(struct platform_device *pdev)
 
 static void td_remove(struct platform_device *pdev)
 {
+	struct timb_dma_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct timb_dma *td = platform_get_drvdata(pdev);
 	struct resource *iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int irq = platform_get_irq(pdev, 0);
@@ -743,6 +773,7 @@ static void td_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&td->dma);
 	free_irq(irq, td);
 	tasklet_kill(&td->tasklet);
+	td_kill_chan_bh(td, pdata->nr_channels);
 	iounmap(td->membase);
 	kfree(td);
 	release_mem_region(iomem->start, resource_size(iomem));
-- 
2.43.0

