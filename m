Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735203;
	b=bic59NcK0w8W+cj/8umQ5pQepM6Uqw3xRYaspzuJVu9l4qjuW30pZuEPCrJF3AjViCtJ
	 tfdehYWdouw6d8G4q+ujbQpodbFdWKAqL5IsIbJdlX9CLr8OD+wV5nVycRKCteStQpX/2
	 hhjs1izKx+ZNm/gVD/hLT1+7vox7nb7QxyV3rI20Oeuqve/TyCBN2hvCU+AvXhZcKqcKc
	 Pdr8MweSjdUZSgqF9R3hn1g2NDz+WzPlsa1ipzTCx00b0o2lcqlGjMuX5wF+9UuJesL93
	 iVikLsz3SUUMyYJBTFG9opRb0AsYP3l1gKnOKHPpm6h7UofZYOvVol77x3pSlElwCdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
	b=qDZSEBpWjmB7kgzGqddPUaxCdgsIUBsWp9qhEbinXvXO9bNIYwxxYEyXRXXoyi3eLgpr
	 4qkMHhuesne6FOPQIpLCjUI2nNVReu8v8ddmrvw3l0MYeR0cZ0loGOKs+lT9+JoaAcEDB
	 AIZ3Z4NtihQ4T1mGLm2bJzF16spXPB1SxGWGNWiEfgQnXmvlrkkBMrIbYUawIFjon+ZiD
	 ATsGht1RJzLT+gZubBdvKLi3aFs4j+GSQb+N8Wr7DoaWLpiK+fewVbjGiuNeEixSWG6G9
	 kA9suSa0li6SvUMy8xftFBkcRMAbqzInSYRDmRkoqaRIajrZThJyYOKwHr3hExi33HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1np7wLe;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347E5606A889
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347E5606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1np7wLe
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70b875f6f1fso2980261eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735202; x=1795340002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
        b=G1np7wLe9YENBfqgbqsA3M95uDrY92Ce+uYyA4rjypwjjgqs/2/eEx9wbHH1gKTIe0
         As2VwO0SgzYcp9ynYl51iAvtA7n/WYtD/tPqrX0+koGDUZc40Wdpqo7R5gJsOxHOzHq4
         G85IgQcG2dT3Loqwnb2K3i3+csoZo1Xz2uD0PHXEMZwUWkZ5ZLD+v0GQ05K+krI/BA76
         cZpgBZZeHd1xsW9+PfhQlve5dZDzCxsAbiqoMW+NzAh7qc0drN2DW5Z5kj/jTjAG0W+F
         Jb56tn6WV5kePXZWBUMtNe6pfkZkyjXkdA6bNMaffYJkgKrCSEIafLAEl/R8s9DZPTOi
         QTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735202; x=1795340002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
        b=NshMD+T5WEPG3ekvupXctOAdZLy2kfxykDh7yBhXo+aBNsTw0fbh8a7lVhkkW73wpV
         kdaW+VpDgVWRi0Wo0tcKtRAsh30hjXrEuXorsaC/2OoXXyBOSUxgg4kwd5v2iZQYwc0T
         8sVvTYj+ODM20Q4pLi8FdC8uuiW9d23XIxZqtQT4Sw5LaB34aesvwzBVQeNdSX8bnvmf
         r3uj4w4w1dMabcLSIl6gs3qE3B5htJXKvQGycnamLhaLTq64Y2kTguF1tZYYMPraNEbB
         erJC7o4IYP3x/A8Eb7qpUTCUkhkq9S0iJODen8LrETHXtTVIElgdxnOIXVFK2/6yi1pQ
         QqCw==
X-Forwarded-Encrypted: i=1; AL+hErHhfEc+G54lIvT6Dqb2oYAXnl9eaxtPndiU467kYI8mZk7JjVZSNNn4KQLcSYIy/3ppO21jlwY6qFFyrro=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U07R9wX6Ak88j/45J1QTLHY6gXB7ZwTnaiCOCKiT3BYiv4x2O
	dnNPfznzXPMvLk+wSHu+CPwsy1VFSkS4yaBN8xYxu65F6zI1xKFjFHYd
X-Gm-Gg: AYBFou3rJEaET/wEKfGjPlL57VLn5+Av1NwP1us8QJlMxp+DWy8x7nmLd5PHPMeiYJz
	DVjsW8/MAnsRKWmCFYHBy93Z0nPgRf3QwTo0tghudO6sPSyvh+N+/9OduWOFMqt10qQ71+Z43rq
	r+tPuJRyNr4WbJ6bV8b0h1QpGCKUReQnbVexdWU+t+ksvtI1ayAQTwmDfkVVyvKBDfF9SP6GKUc
	xeEgbW3oaJoW9D6HL19W67KoVxKjYNVmbZxiPt9tFe6uc0wSe2lYSA4SKMwQ9A9olUe/KSr8meM
	85KzQenejPxVUmyJMiImpjy+1MPxXnLwHwnAHTQRxP3yB4wmDc3t/N6txnhf6mdMZlmec3uHkU8
	dOeEdOP6KUQrOCJsNa5PPLPRGq27CmMqgPFdnoMTIXQCB/rxaqGIsGOxNnZT3f3bTOQe9DaGxoH
	bmrE+i6nk68tHLwIjcLeptkLr3uvK3K+lb8M+lSkCcfvWja0IqrQjI6FA3UwZg290qzaDRFWDEd
	3HkVm04KJQbD6L67Sm0XhYWkdjDWR/VvMINept8wmClCYXQI07PwS6k2afPHcAg2Le4nleCVwDO
	rDAg5D/SN9n24+WXykS8LftcZsi4oLA2p98+xmkS8AjXvmRoQGf9NLLgJNyQHN/mYdRjSM3ysBs
	PpyEqqtlNNk5vjkfFR0i0tnj3rP/PdHdeMWadJv7zdOHj6CxTE3umpScgp6ZXvbF9iwWewyeXsq
	bqjmLavYDlY3flSZnPF/Xw2c6ymdFZH/M5T6BUg4pMzwT/S5s5wSg=
X-Received: by 2002:a05:6820:1396:b0:71a:e696:71bb with SMTP id 006d021491bc7-71ae69675ecmr1052335eaf.35.1794735202064;
        Sun, 15 Nov 2026 01:33:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:55 -0700
Subject: [PATCH v4 7/9] dmaengine: sun6i: track paused virtual channels
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-7-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

sun6i_dma_tx_status() only returns the cookie state, so a paused but
incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
path pauses the channel and calls its completion helper before terminating
it. That helper ignores an in-progress transfer to avoid consuming a new
RX operation. With sun6i it consequently drops the partial buffer and
leaves rx_running set, preventing another receive from being submitted.

Track pause state under the channel-assignment lock and report DMA_PAUSED
for incomplete cookies, including status queries without a residue output.
Read back the pause register before returning so a posted MMIO write
has reached the controller when the client inspects the transfer. The
readback flushes the request; it is not a separate hardware suspension
acknowledgment. Completed cookies remain DMA_COMPLETE.

Keep paused channels out of the pending queue and do not start a queued
descriptor when a paused channel's previous descriptor completes. Release
the completed physical channel so other virtual channels can use it, and
clear its hardware pause request before reassignment. The paused virtual
channel retains its queued descriptors until resume.

Resume requeues an unassigned channel only once and schedules the
allocator, so an idle controller does not require an unrelated completion
to resume it. Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ab4474f0a8aa..14f1f463005e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -539,13 +540,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 		pchan = vchan->phy;
 
 		if (pchan && !pchan->desc) {
-			if (sun6i_dma_start_desc(vchan)) {
+			if (vchan->paused || sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
 				 */
 				dev_dbg(sdev->slave.dev, "pchan %u: free\n",
 					pchan->idx);
 
+				/* The next owner must not inherit the pause request. */
+				writel(DMA_CHAN_PAUSE_RESUME,
+				       pchan->base + DMA_CHAN_PAUSE);
+
 				/* Mark this channel free */
 				vchan->phy = NULL;
 				pchan->vchan = NULL;
@@ -937,10 +942,13 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		/* Flush the request before clients inspect the transfer. */
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -962,12 +970,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 	pchan = vchan->phy;
 
+	vchan->paused = false;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
-	} else if (!list_empty(&vchan->vc.desc_issued)) {
+	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
 		list_add_tail(&vchan->node, &sdev->pending);
 	}
+	tasklet_schedule(&sdev->task);
 
 	spin_unlock(&vchan->vc.lock);
 	spin_unlock_irqrestore(&sdev->lock, flags);
@@ -996,6 +1006,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1041,6 +1052,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1075,7 +1088,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

