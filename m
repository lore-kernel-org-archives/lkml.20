Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316638;
	b=h6WR439lQu/Kekj5Cj5y5csAsTuUlawPwaCpi5REfUzECwXIcWEErofIbDWFA9ssVvQs
	 IcgEd+LNtooQuuh5S6uR867foyM/86MmcDnO23qU3x2xnn87EJt4T32dNqc6NDSZU1Kbs
	 p9uUtYu4jpNhMi8JUOX2uNTIW8Q693DgCFlLva6DwiApftVtgc7XJSu1vsBS4+lyDf3Dc
	 xpW7tNO28s++4xATzJm78rgjAtGQr/UlCXV8ci0svKUfdjfxBuMIlQLyx3IIy6cK7tVUw
	 INSi0MHGE1HJsS4XxLbcpyHm3QioRC6oxQ6mIDejVf0fW3UNRwnOOu3lpJW4tADU/sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r3wr6IHLy4V7+ZNBxFAJmCOSfBx7lTozRB+lQsmMRkc=;
	b=QF6voHZ2Vv0lHPuX4nuuw6E/uGVout6L+wKyFl/VxYLI3k+zDjd5ePHSkiWFnk9ozC/2
	 uPaDFfd6r2d02ztXqr/hmfJrQ0ijS8aJm0SclOTnlXgctjjwNdnKnTHK15nsLfnBSVhBA
	 4A4jjq6DQBikmlZ336Ixo6JTYRiLjtj9Bh3Z7vLiIK7bfR3D0EeAY60bEAjYcvBMGDK5n
	 xQuJz/U0vOpSDIGpeuwsE8ggHULd+GuDPYlrczbsBNdWF8ffDKuDRHpexmbL0z0+c+UmF
	 0s7HLMVYqKlt4NzOyldjIXJ/ZHa5vmzAa6DqyszSp7IQyZECwBOI7TCHnHp9jadJXmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZxFUalg;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2030606A76A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2030606A76A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZxFUalg
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1292178a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316637; x=1794921437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3wr6IHLy4V7+ZNBxFAJmCOSfBx7lTozRB+lQsmMRkc=;
        b=iZxFUalgzOBVwtWuMdphShtd6WjtgWG627EyNp9xyU4q2GHZ4d2IMiye4iaCvyW3xi
         pjbR43L3Z8aocTsO++ifSl9D1xwyC6BDkHMNb7iAweXlj1J8MzSH7I+DOZGuGXWC9nfY
         BYKAP+8qLPR6SURsGEOOOq3UTTeU95mCl06gI0tI8FsegUooZSfPfcQig5xKjePPVbzk
         MPXcNgm/tbX1wDpsVk3NC0wajrfLr6zbEdXdWOl5URWp4JKatnzaIf4/fbptYjaFNDw5
         rkzrWdlNKmOF+ss1WYPKwdJBuwktKJ9EIfG1QvammA6GWxBYr63S/36ZbFTSf+uEFq7c
         zJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316637; x=1794921437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3wr6IHLy4V7+ZNBxFAJmCOSfBx7lTozRB+lQsmMRkc=;
        b=WHgzsgFXgKjdDk8Kp0VaQSEHThs7LEcxicLwCgjSp1JU9by0H3D7UGv+tvOUScOSiu
         f0cr1n+MpdNvP65MoUSzlAQfiQqNrRpM0AdySRG7/BA50FKE746Ia56ZJ1ZeLFmMtrx3
         pZ5eBamOIDNX5bjBdKvHpR0oCw5bgFPfdMuAJZBZ8oIWZUlWgo9LZbwxpu4IDd793NpB
         C286AfOpB/C+OSbXnepYU599Zab/Yvhnq6Yo9hZpLSLe+Va6OC1gZwqMmgDMkwtP6jaL
         XmNqusspO8y3sLaLQmX+X+VIrF4r7KFrqYhh8sAxDjWNjN0cbqnCyoC/waBNAd69Rty/
         1RxQ==
X-Forwarded-Encrypted: i=1; AL+hErFisa+DiDa9f4GT9Vlu7FXxCytlk54kvK6Viu+NL1wPjMwYC1EGPIcAR2N0VfZTaj1nOmdmlWZjCQrN2ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z84aB2DVfY5AKDEo8W0fmixxUMSjxCTHLNkb6gW+RQ74ZBebMc8
	XlkIsoeerKPIH50hnofPxm+YhoCYVzJcoAKKTI2ENIJJpzm1ilEqpWT5
X-Gm-Gg: AYBFou2Z+07tfPR2jNvt6whRxI9iQb7HC5PZUxFeZp1AU1OAYB3vTKEgfZAsvZt43l6
	JUX5X+KaDFIdSsYe3Q1udplTxSW3bVa3H3hhjvcPbhfVLFxQpkNifo95QcSEXBjEC6iWYpQ7qTn
	UbYzdVd1IXp4h3fObygQ67QTvIQBFg6pvANyM7RJRNPTFCVY6YSP1zUefnEy7+sVkrG05iQvBft
	Bv0DVyiUgddO5vvL+bSOs2G6VYUqBtEJZhcvmmqjKOilzRGWPweQns4BvfP2f8MIbcGC6EBM62T
	nJzSThs+eaXZFrkNsojWuT5XCmwgxjSO79PERGmSga82PD1V17wuNNSyTtQGCwN21+iwT7iRjz1
	1RUVON+62H5fl/8KHOfUuuavDvb2I0lNlIs74XP0bzPf58E86lgth9WSDkiLIgP0Atz+1H9ryfO
	JCvgmboLeBhSS/hBZo2rNKi5lAFfgDmsrN0uCS/Q1SKQMyvW8NBCv1c2i/YZvbw0TnV96hY0FiH
	uzl6GiRLdfRX0XU+5VCrowz3akzJnnUtpk7GUTa6mPt/y1rSKXBW8Y9Y5RPh+flRqysxCX+n/vc
	u5zh8CWUSjYx2cY3n69cx4w4LHCnyxI=
X-Received: by 2002:a17:90b:55cd:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3b166cb467fmr2693107a91.35.1794316637413;
        Tue, 10 Nov 2026 05:17:17 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:17 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 26/33] dmaengine: mpc512x: route callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:26 -0800
Message-ID: <051bf57158a5c5ae82d0b7babeefd951c3ba85a7.1794315350.git.allen.lkml@gmail.com>
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

Schedule per-channel BH work for completions and process callbacks there,
leaving the controller tasklet for IRQ/error handling.

Drain the per-channel BH work in mpc_dma_remove() after the controller
tasklet is killed, so no callback can run once the device memory is
released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mpc512x_dma.c | 78 +++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index f67421f2d6d3..b6a1b3c94da4 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -372,45 +372,47 @@ static irqreturn_t mpc_dma_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/* process completed descriptors */
-static void mpc_dma_process_completed(struct mpc_dma *mdma)
+static void mpc_dma_process_chan_completed(struct mpc_dma_chan *mchan)
 {
 	dma_cookie_t last_cookie = 0;
-	struct mpc_dma_chan *mchan;
 	struct mpc_dma_desc *mdesc;
 	struct dma_async_tx_descriptor *desc;
 	unsigned long flags;
 	LIST_HEAD(list);
-	int i;
 
-	for (i = 0; i < mdma->dma.chancnt; i++) {
-		mchan = &mdma->channels[i];
+	/* Get all completed descriptors */
+	spin_lock_irqsave(&mchan->lock, flags);
+	if (!list_empty(&mchan->completed))
+		list_splice_tail_init(&mchan->completed, &list);
+	spin_unlock_irqrestore(&mchan->lock, flags);
 
-		/* Get all completed descriptors */
-		spin_lock_irqsave(&mchan->lock, flags);
-		if (!list_empty(&mchan->completed))
-			list_splice_tail_init(&mchan->completed, &list);
-		spin_unlock_irqrestore(&mchan->lock, flags);
+	if (list_empty(&list))
+		return;
 
-		if (list_empty(&list))
-			continue;
+	/* Execute callbacks and run dependencies */
+	list_for_each_entry(mdesc, &list, node) {
+		desc = &mdesc->desc;
 
-		/* Execute callbacks and run dependencies */
-		list_for_each_entry(mdesc, &list, node) {
-			desc = &mdesc->desc;
+		dmaengine_desc_get_callback_invoke(desc, NULL);
 
-			dmaengine_desc_get_callback_invoke(desc, NULL);
+		last_cookie = desc->cookie;
+		dma_run_dependencies(desc);
+	}
 
-			last_cookie = desc->cookie;
-			dma_run_dependencies(desc);
-		}
+	/* Free descriptors */
+	spin_lock_irqsave(&mchan->lock, flags);
+	list_splice_tail_init(&list, &mchan->free);
+	mchan->chan.completed_cookie = last_cookie;
+	spin_unlock_irqrestore(&mchan->lock, flags);
+}
 
-		/* Free descriptors */
-		spin_lock_irqsave(&mchan->lock, flags);
-		list_splice_tail_init(&list, &mchan->free);
-		mchan->chan.completed_cookie = last_cookie;
-		spin_unlock_irqrestore(&mchan->lock, flags);
-	}
+/* process completed descriptors */
+static void mpc_dma_process_completed(struct mpc_dma *mdma)
+{
+	int i;
+
+	for (i = 0; i < mdma->dma.chancnt; i++)
+		mpc_dma_process_chan_completed(&mdma->channels[i]);
 }
 
 /* DMA Tasklet */
@@ -419,6 +421,7 @@ static void mpc_dma_tasklet(struct tasklet_struct *t)
 	struct mpc_dma *mdma = from_tasklet(mdma, t, tasklet);
 	unsigned long flags;
 	uint es;
+	int i;
 
 	spin_lock_irqsave(&mdma->error_status_lock, flags);
 	es = mdma->error_status;
@@ -453,7 +456,21 @@ static void mpc_dma_tasklet(struct tasklet_struct *t)
 			dev_err(mdma->dma.dev, "- Destination Bus Error\n");
 	}
 
-	mpc_dma_process_completed(mdma);
+	for (i = 0; i < mdma->dma.chancnt; i++) {
+		struct mpc_dma_chan *mchan = &mdma->channels[i];
+
+		spin_lock_irqsave(&mchan->lock, flags);
+		if (!list_empty(&mchan->completed))
+			dmaengine_schedule_bh(&mchan->chan);
+		spin_unlock_irqrestore(&mchan->lock, flags);
+	}
+}
+
+static void mpc_dma_chan_bh(struct dma_chan *chan)
+{
+	struct mpc_dma_chan *mchan = dma_chan_to_mpc_dma_chan(chan);
+
+	mpc_dma_process_chan_completed(mchan);
 }
 
 /* Submit descriptor to hardware */
@@ -551,6 +568,8 @@ static void mpc_dma_free_chan_resources(struct dma_chan *chan)
 	unsigned long flags;
 	LIST_HEAD(descs);
 
+	dmaengine_kill_bh(&mchan->chan);
+
 	spin_lock_irqsave(&mchan->lock, flags);
 
 	/* Channel must be idle */
@@ -1007,6 +1026,7 @@ static int mpc_dma_probe(struct platform_device *op)
 		INIT_LIST_HEAD(&mchan->completed);
 
 		spin_lock_init(&mchan->lock);
+		dmaengine_init_bh(&mchan->chan, mpc_dma_chan_bh);
 		list_add_tail(&mchan->chan.device_node, &dma->channels);
 	}
 
@@ -1088,6 +1108,7 @@ static void mpc_dma_remove(struct platform_device *op)
 {
 	struct device *dev = &op->dev;
 	struct mpc_dma *mdma = dev_get_drvdata(dev);
+	int i;
 
 	if (dev->of_node)
 		of_dma_controller_free(dev->of_node);
@@ -1099,6 +1120,9 @@ static void mpc_dma_remove(struct platform_device *op)
 	free_irq(mdma->irq, mdma);
 	irq_dispose_mapping(mdma->irq);
 	tasklet_kill(&mdma->tasklet);
+
+	for (i = 0; i < MPC_DMA_CHANNELS; i++)
+		dmaengine_kill_bh(&mdma->channels[i].chan);
 }
 
 static const struct of_device_id mpc_dma_match[] = {
-- 
2.43.0

