Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316633;
	b=2UHvehiQ8vVfVz3toPZRgMxGvelpce7MuTaYX3G5ksgbQdrTxfK6sV1rFP2xclUxNskl
	 N/IWdPTOQ1jNzgT06b9OBtNb6w8dhnvam/4hi9jDFiUfGCPRqn4/VeYgyx1jmZrWk4aM7
	 /CRFub85oiVHI0Scs9gzfXML3sHAok5jkn39O9i6+ekf3KsX1lqpDODOnvWr8bSQQDVUM
	 BstTHucNtcToMNH1knH1jRd/Uxph1ih0ADkRMpMXzCtklbpkQEgv0rcRMBs1FAHepdfsU
	 hw8DWUvTFSVYPec66UWKcD3vUBslQSWG+nyZ81ou0HR8FpHH9kZeYKaINyrIYMH7Zug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3R86nX81cq8fPtcXx1q+l9uA6SN/ot4zzy2OGu+76Gc=;
	b=BF5DMRlr5r61PF3jau1xrzgANGSNt7cxA3tplg6YtKXFtShu0BazY78++jj7HRIF2Yc+
	 2z2KVNHm85cLUQwOluRHWZHDCs2aPjt1MGTMXYdbGrfnfPHocZZZDuMVoHx/4R+iO998Q
	 L/XZyLwoNPybWZnga5Sov7WxdmhJi3s99h8gpku7hb7MRUQLZzaLbdDjMEZ5XM7s19SYl
	 AzUPMxbIQBqZIgQ5iie7qeSR+Kb7zIyh7Zet0TuEfKvn5n4Y8KkQlYUI0+77Xgt2isxsy
	 KcmlW4hSmeDcjEhh34HDAnspltlJU9iyzs98HlmXKzao6OWO9RzXHaQ629JCk4VJT2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4+aDYW9;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EB5606A76F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21EB5606A76F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4+aDYW9
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb9f760337so986308a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316633; x=1794921433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R86nX81cq8fPtcXx1q+l9uA6SN/ot4zzy2OGu+76Gc=;
        b=G4+aDYW92oak+lJqUw7XTAYYObFMx2FEhQJMnNm0ERl377a635Wy4WZfFcA5qzUkUg
         ca/qQQ/7Z0S3kN0vgnwJyQiFIp42kKU9A6n+uRYIniexLHSckagRiaxsqe8S/vT6sqha
         aU2SgAje1yRE0QMvu/xvGMvmsDAVmFD3u0bm0InWLClyVAjYemBRQdhMEbl5MPvfRfQf
         CH4GToFUU2jnY553ptNWeXnSnKhUivPTuwDphTYX+7GgCGA8BEpwoh2Ki8we0PZQxjhC
         MmeBk+uD6topf7FHR0FIGjg6sCIFlhol0QxwPxALVgxdVekQHzUHu//CV0e02uzuRCAq
         BStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316633; x=1794921433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3R86nX81cq8fPtcXx1q+l9uA6SN/ot4zzy2OGu+76Gc=;
        b=lZPAyfjJJLtx/Uo55oqxFCtyp8UclLubFv2iSs3vMJprdn+kS15VTMMwbp/3WQd3Hz
         4hRmzMTGXC4QIcGwDiBTH8JRpJwZ+AjGKcjxpl3IbWRcCJmuGIV+uLBKiyfDoFhgaYnP
         TmdF4S0sFf3zqEML9DMDVj7uNVqzHPdrhMCIfrHdqrZt82Wd++of98VLYmRgImFg1Ln+
         dhScENJXU6/RVIJ2fiZiuJtqY53tX0jaZbs+2UbOzV/B+Wc4RFxgt2b0a2rHcVWyuEP3
         /3j3q39eBKeyJYXUQR41LGvdi8cSQluRt3N/mBETem9TCeSMNrmOThqHpn8Br3Yp55Ez
         oRpw==
X-Forwarded-Encrypted: i=1; AL+hErH5K3g+xpDCJ6YosNimXnJgbsHD6ALJDs+ynlVLqkkS8RR+DQaXOXHA1qOJqCfu12GsRPtJ4K4/lWdHcYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9edGvxJJgFnDarDb5p9pQesEbIS/qoRYucwwK+T6FwPA+wcaFx
	PvycVD9pF8y90IRhlSIpfoGPghGqsGoio2DzZoGAan+3Tn4s9TReB1eX
X-Gm-Gg: AYBFou0mG4ApHYFoRTupZzQAvCYyfyF/9En49DUwqNGfzwxtj4qJqX/WIu+1GuT23gX
	bKuANfBRyLNy6cZb27F1DG7xsZ1RE0c/n2crzvxKL0Nkfr2F0RrwQJujPLfgwKCNgepwAdloTK0
	ZaaytpoLmzZhRRe0BL0ENLEbRwkFmxL3SdAyD6OAnzz0Nm67lx5+1aCIroUf3nLo3PIcWL3MK9s
	f4NIY+J3EFphMS5b+qOtZd4HOBxriVKbFFknK0k5e7F7E6qri/GqR5ytV5ns6+83N3FgcIPNU9m
	Bzv61B137ne33EzLojCvI4OdsVy2F7PlSM/39ngtOnK7MiOQtps4ShmQfkBFRiTFzs8wemd1QRF
	TbdZrT+C0fKlB7VJWxpvTesWpOqyRiZoJIBDPf1ipXugaarS7s6H1XG3TnIU+3sJ6v1XzTxxisg
	xXj130rFHe4xckzSQRots1EkEGNrPOKnrVdETemHNoQrJRO4NeQIOvMc0PaBG+2Gk1TNMbzR9wE
	tTH4wSGivY1MuxFvtFmZXa6C/PE6mRUdrlXhCrC9Aq3hJgutBPn9Amc8DR1lG2FjwEF02Ob1wii
	VeHe7aneV7EfblINoypEVl+gzu/0RUO3QsrVArxFd3IkrOGga/lT
X-Received: by 2002:a17:90b:2ec7:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b1679a3218mr1654109a91.23.1794316632444;
        Tue, 10 Nov 2026 05:17:12 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:12 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 24/33] dmaengine: txx9dmac: route callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:24 -0800
Message-ID: <fff4c9714cd77cf2587ea8785b0e74a8145e123c.1794315350.git.allen.lkml@gmail.com>
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

Use the per-channel BH helpers for descriptor completion handling on
channels that own an interrupt line. The channel interrupt schedules the
BH, which scans the descriptors and re-enables the interrupt, exactly as
the per-channel tasklet did.

Channels served by the shared controller interrupt do not initialize a
channel BH, so the controller tasklet keeps scanning their descriptors
directly, as before. Routing that path through a BH that was never set
up would trip the WARN_ON() in dmaengine_schedule_bh() and stall the
channel.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/txx9dmac.c | 10 +++++-----
 drivers/dma/txx9dmac.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
index 04de7f7ef31d..5c4d6ee7d720 100644
--- a/drivers/dma/txx9dmac.c
+++ b/drivers/dma/txx9dmac.c
@@ -596,13 +596,13 @@ static void txx9dmac_scan_descriptors(struct txx9dmac_chan *dc)
 	}
 }
 
-static void txx9dmac_chan_tasklet(struct tasklet_struct *t)
+static void txx9dmac_chan_tasklet(struct dma_chan *chan)
 {
 	int irq;
 	u32 csr;
 	struct txx9dmac_chan *dc;
 
-	dc = from_tasklet(dc, t, tasklet);
+	dc = container_of(chan, struct txx9dmac_chan, chan);
 	csr = channel_readl(dc, CSR);
 	dev_vdbg(dmaengine_chan_dev(&dc->chan), "tasklet: status=%x\n", csr);
 
@@ -623,7 +623,7 @@ static irqreturn_t txx9dmac_chan_interrupt(int irq, void *dev_id)
 	dev_vdbg(dmaengine_chan_dev(&dc->chan), "interrupt: status=%#x\n",
 			channel_readl(dc, CSR));
 
-	tasklet_schedule(&dc->tasklet);
+	dmaengine_schedule_bh(&dc->chan);
 	/*
 	 * Just disable the interrupts. We'll turn them back on in the
 	 * softirq handler.
@@ -1108,7 +1108,7 @@ static int __init txx9dmac_chan_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0)
 			return irq;
-		tasklet_setup(&dc->tasklet, txx9dmac_chan_tasklet);
+		dmaengine_init_bh(&dc->chan, txx9dmac_chan_tasklet);
 		dc->irq = irq;
 		err = devm_request_irq(&pdev->dev, dc->irq,
 			txx9dmac_chan_interrupt, 0, dev_name(&pdev->dev), dc);
@@ -1154,7 +1154,7 @@ static void txx9dmac_chan_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&dc->dma);
 	if (dc->irq >= 0) {
 		devm_free_irq(&pdev->dev, dc->irq, dc);
-		tasklet_kill(&dc->tasklet);
+		dmaengine_kill_bh(&dc->chan);
 	}
 	dc->ddev->chan[pdev->id % TXX9_DMA_MAX_NR_CHANNELS] = NULL;
 }
diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
index aa53eafb1519..f2abedb73d49 100644
--- a/drivers/dma/txx9dmac.h
+++ b/drivers/dma/txx9dmac.h
@@ -162,7 +162,6 @@ struct txx9dmac_chan {
 	struct dma_device	dma;
 	struct txx9dmac_dev	*ddev;
 	void __iomem		*ch_regs;
-	struct tasklet_struct	tasklet;
 	int			irq;
 	u32			ccr;
 
-- 
2.43.0

