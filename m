Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780970;
	b=s7SyP+d3ZyTbdMM3LvuH3wdXU6pRQ8v8v/c4AX+X6/0l1c7Rcu+qG/Prcofw0kmqrlHn
	 3+hcHSuXyffkn32W6temylngks2vh88XPs9xJNgxpbSpeWcLNThhNcF2QOktHMUa2U5Yd
	 jL2/lWmfjtA5QLKRRQ6+clWlAiaFiHu2v0LnNTQBC+MiYUzfX46XYdoBF4j6aVd0/DvYt
	 z0npbinuD2BnGHD2XlLfH0FIP0aMe7eazyt2MEauoKUc+6gzii/CzxbC9kF1nE47c5MRi
	 4lDk+ow7iew1afMVRY78WqZpAf+CItzUuj7ve9F3CZNIsn+XZaZKbMcRy/oIgiKTv2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
	b=Ro/1uMSIL4/pgIkMaYHxP1l1cMoN6v+kCBAbfTZ/UGK5vGo+bMJQPfywm4KAl6lJBAC8
	 oUZHKduUA/DzvjF58C+WYaGy4pSeebNCWmFmkrw3s468HNxt3SI0iQXDOHbPZdfwhovbU
	 NmWacs4LdU3zB0oGrq28QldBw8vHz+VBe6+9Z86Uf+z9ezB/PXnm+CjvKMIY5sc/MD0bM
	 8G6D0wev2njoQKQEYah8IsstzkgVSsXJW/4zl6g3pzVuJPyxVXMAhYgSKOOLkpCr9oddy
	 8FUERPFpdmyqx1YBZEDVIGEL7DH3/GkcNrvMvcBuvg5BxbpFActbvVMLmq2mrgbxXSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ikMZcuWM;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7253B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ikMZcuWM
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8479f46ecd8so558714a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780968; x=1793385768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
        b=ikMZcuWMFzrZbeNRRZjkSFNRWev+JqpYqTYCNWzW6FDfRpKqcQDLxR4jz7N5xRPblX
         1XAUaCInQHEUjkzPjlHwYMhGvHop/Lta38VeV5kIpMR8O8tuohTMPMCKMHTdP0fWKpDU
         gUW9abHgWVCwliqz9GiDjkYDmO3u3uehpyxITNbaBquqpKbyUP48+DlifaCvdVqwlQQI
         jmI0N+e0PfhggHJAhQzzLXRIhN265I1OXtAYyjeRxaAYvyNHBEFFe4wtjojratQ4TPly
         TYtYwrTxqUf4gcLl5IJZwrC6HNMlplGTsTaAR2r+LtAbCMqG6MGfPqFYFT4vfCflwRf7
         PZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780968; x=1793385768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
        b=LjpukJokySoYe5FzSZs7xF2b0JZuqI3ZPin6Mm5ibqc6lv7qX/3IkQapabam7mV0UW
         20OuIRw6Z3WNdydPTu9qlZIm1MMZ9EfH+H5UIvVzPsBWUgTDrJAARFChWn/fDe1Wj5yC
         0L3Dgq6+xK8AS9c2P8CyILqT+7YBM5/cLJ0shmnfUC/zaCzH99O9nbghL5QShCgIuB76
         Hha2gW9SPHKfpho5QHc2KaL1/ir0WySufd3Jhz+87hKlf2J1+tMcFb9aGKBCCWWgz2hc
         gHs/4WSlfWMcwlwSElQ3nM1cMMJWeblvQ+yuz0NJbf29bBqcCyyhb3HDX5whJzrnxi6r
         DXvw==
X-Forwarded-Encrypted: i=1; AKwUvBy5pATrq/U8OcafbkT+d78T4H3TWa/qVt/QE/kvXd084v6Sn+12p9Ay9xtqhu6TCVicnVkfHCjKtqwKPDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzdoEFCsD6Xto3ycaoeKPmeduiFkcPzQzCUBNojTdRmLWs8AdQ
	5d7/p+kvX5JKyBlGXsh/jNanv0LfoRhzvTuRAPtIxh1QTTb+AR+oqkBbzmuzZtSe
X-Gm-Gg: AYBFou1q4XVJsYIvJtof1q+Tqu3NIqITqgl55cTRPuHPmvIl7lhNbG7KZ2ya9e7LLMO
	WtErIL3iheiNU9KOmhbCV9fBqP/xNzc98SIkkPgvu5XAiwS9/zIcUrGq26icZtQKnG5dW1FOuOl
	cgvhYYWS2UQ05QgL5d+4BxGDYEDCrGk5an7hHr4y0bwQZqmW1sVk/a62wZGCfRpao1JeuQZp3SL
	28n7bLiBcmk5K4j2qSJ3hXjNgdB5rvBtAwZ8FAVE6A1xlEdHcL/3n1U9827QmIeWMkusBQ5efMY
	JKQsDmsIC1RBLkvKyU1BAsocUBk2SWLSOu3okpKaQuTiVOeAIeikrMghy3WeG0jFJ6OG9SSQYOC
	SHOKo6pN5xkG3W+2Tysb2p5NaipPXFLjpx4o7NbsetVYS8pwwImlkjFZ3AoSr33xjGZ+aBQ9sA1
	GmOKMZxi3TMOIBDWVNQ0Zur5h7R2jc7pyTWeC9bO6NjY8cmeA1W8y/sPtNS+neg/VBQVb4FKXi2
	GablFxMRLqtM7hd5r4OUwI7yi+i0l3gY4rhz7T5oxNcLtmB/uClN7T/busvWGRdNav/BlyYEvpz
	vOJPOKAyYdPe7ciCqdj4QSscX1MaDsedzBaHDQTOuQpO15WArdOOgnYJzVSCjI07A9fW3YQVPqb
	nT+lCJyHQMyQ5f4TZtLEJOLUIPFqZh5M9DYWkGWscqwbQp+WQbgPmWRhaCixy6HAEyzGU3/tgp1
	slNA==
X-Received: by 2002:a05:6808:4486:b0:524:884f:d89d with SMTP id 5614622812f47-55c0029724dmr56674b6e.21.1792780968326;
        Fri, 23 Oct 2026 11:42:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:38 -0600
Subject: [PATCH v2 4/6] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-4-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
Flush the hardware pause request before returning. Completed cookies
remain DMA_COMPLETE.

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
 drivers/dma/sun6i-dma.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a21acb9ecc27..157746c9423d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -534,13 +535,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
@@ -932,10 +937,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -957,12 +964,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -991,6 +1000,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1037,6 +1047,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1071,7 +1083,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

