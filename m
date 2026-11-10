Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316557;
	b=ouCTZltNeou63yw6idbrneSndqPi7pd9B+7vWVLfUaluFElYFH8BjMWG36jWxe8cV69g
	 X0/mDwkPcmN3WW1Lf5k70XPB73SflLxnzRzBmDeGAzfR9APbSjt8NQSXuykw3c8K5jgJK
	 q0RDzddFOf9YG2H4Tbs/TE+l/bXdaD1mdWsRDotfApUT8N5/sUkKGya2QtXyPn5oePbF0
	 SliI8PrmBjgEQuPsZbQYYBfvqgHxm4fTGzEi+9mGFP0O72IPT7UGNunHKXRtM0kXdGHCs
	 IUZutlxBXf6UdPqdOsrO3LkSDdK7etXRvScOJd1rFFGQd+pxK+ZOCOHnKxlUCOla6DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5J6MwDWOHWjl7QywHmcoK9CGF6kb9+LR3zZN5cslCcw=;
	b=ORIvyYrr0ZzgiQwQpBf7zqy8+OGWGR7XRt8pV82YGbnk48qaKOVF2EIh9H+1m6+6KTJh
	 3Rnwdj5GbJjzYLSy6mxQl3x4xt029zJh/7nj0JNB+zKtO+IubCJWXx+3/BbNcmGgdCgzp
	 OgZKOvYcowHNozBWQmV7DQuvz23wHGyllb9IbRC+LZtapA6HpV687+xO4dMsYR1s2PZ+x
	 h5rfkS/vD3NFlisSaMqIUFJGHJ/lyxeaUT7KXQeaDZjqgiwfcePxtlKF/gDY8efODgVr7
	 pVSCN7NuGY/kdzW2jD+/oCAUXj3bUDfphOaU2lJSp0SC6uI8P5FIsoubbICoMdJn40A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGWDsgvk;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AA760A2624
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AA760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGWDsgvk
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso1487792a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316556; x=1794921356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J6MwDWOHWjl7QywHmcoK9CGF6kb9+LR3zZN5cslCcw=;
        b=mGWDsgvkZ9BVtWthrqf+GCKg5Iom3nAsBmf513svhEgHMn9quedRdd3D3FvNbQ669P
         SOWpYfDpsOeQ0JgMiX7Z5ZDwyF1Ll8S23SS4OKDJ8lAWcSagdR0S6ieEMxS3mDioSLX/
         xyMTorN4v4zIfGb2rRIRW4lTLDj4oXnaYNN57e597vzv+mt2dEZWNFlA4a6MfkppHXYh
         mHX5W7+MbCT5uGGe4zDwMhRE7XJK/vIAQOvqDkV6My873jPIjeiIdSJkMVQjokCAaoKt
         FR+VndYcyQmIt3VytEJEmb65RI1MZSL0E2oucAOAwUR2dEY27WY3UCfOSyDUgSD/l/pf
         KPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316556; x=1794921356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5J6MwDWOHWjl7QywHmcoK9CGF6kb9+LR3zZN5cslCcw=;
        b=iN6ikFqUrFdaJO8inK62AdWYI/w2PaPKPWTAxJA2FpnBQKUg/pfJQ/6fhXJlpVAFzO
         +5g+qkN/zIgeAAEjMNxilRC+rSt/NNVpTSqWWmngzhk3gOcpkFerrR+HJyJTym5lcrNB
         1XKfNHsZFZCplMUalsdikUlGLifVmJ42Mep7baRmSLODLUl2y+tQO0/t/TSwT/rx8hcL
         lPTQhiUafeD7e/q+yaFbr30YWNbiC0wpglA9+UPvAdf/q7/a8bFXezy/P45u4oktJbGc
         jamby2VS+gsAdjYHRMRZDid7KMsPEnmHHW/qOKk717EsYvzq39mbWbSOm8ZHP+u/sKkY
         dQvg==
X-Forwarded-Encrypted: i=1; AL+hErGs1tTKVrlwsFNWZEHl209fxuLaUsLPPK4MmB4OTaYUGFRBOkXPVRQEx102stUiU532f0CNaBkQxN9Eu1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sbxb8C2QHHujrcC6XorkiDeuHWU9ZgRNyLStQFuVTgug7r6Cj
	xp4sKyhRB5eqZVJ7iM+ccSt5ltyQrHKLOcAzSgLkkcsPyKcxWWQJGnF7
X-Gm-Gg: AYBFou0QTWMtb3fAJVGeXSHiGJnBhEkP2Nrrh0AX9wGj9VpRJLKGT1zNZSSSO10g9v+
	R0PdIHJcudY+GN1BEbeBd+chBu5Z/CKAD74/wH/ihWzG3qvNGxyao2BXYhtpgaxzYUTfvqCRLDX
	S28eKGtEyKFgoMwkXyr+woo4A87rBwrzEyk0x421EF6lPPDAHXcKIDzfK8cJtwVMrRgSEIGS2iF
	Kws+woQtrOEepUQsHQu61XxP8ngjROPE5/T+/i7k0swwajMxu3AwHiCQ33brMey2sDoL3JfvXAg
	vugOnENbCrg5GpYpo5104hXJnlR5BLV2RcUNVRm2vbbIwcjEJVkKhX7nhshJ41a4dTuIWVfNUgD
	Jh3IuPBFuzcSQGguy2tJFK40CXxujo492fL0eQwXds7/TIT9wsetrBmA6P/z/y0AJ3GDvp9xKis
	/kKXCnIiOzAZKh0E5qBq2lBuOjhoxSO3Zgn1psYzKGvsVdBjPlfsGAiVYgrHAwM3HO3aZXa/HeL
	EdNKMUYo0/ErHuch21aVgTkpeXaXTfxlXu+zr5Q6zpyKXiPWrOcLuolmZc3GueFrV49aul6KE6I
	4tL6glCBddKxE45OwfB41lqgltHHCHA=
X-Received: by 2002:a17:90b:4484:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3b166ad1edamr2975506a91.4.1794316556474;
        Tue, 10 Nov 2026 05:15:56 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:56 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Wei <zw@zh-kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 06/33] dmaengine: fsldma: migrate tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:06 -0800
Message-ID: <351fd16a4ad121e2f2a423898480b449c5778480.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/fsldma.c | 12 ++++++------
 drivers/dma/fsldma.h |  1 -
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 99a878ed1444..f069d1bbff17 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -970,18 +970,18 @@ static irqreturn_t fsldma_chan_irq(int irq, void *data)
 		chan_err(chan, "irq: unhandled sr 0x%08x\n", stat);
 
 	/*
-	 * Schedule the tasklet to handle all cleanup of the current
+	 * Queue the BH worker to handle all cleanup of the current
 	 * transaction. It will start a new transaction if there is
 	 * one pending.
 	 */
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	chan_dbg(chan, "irq: Exit\n");
 	return IRQ_HANDLED;
 }
 
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct fsldma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct fsldma_chan *chan = to_fsl_chan(c);
 
 	chan_dbg(chan, "tasklet entry\n");
 
@@ -1154,7 +1154,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	}
 
 	fdev->chan[chan->id] = chan;
-	tasklet_setup(&chan->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, dma_do_tasklet);
 	snprintf(chan->name, sizeof(chan->name), "chan%d", chan->id);
 
 	/* Initialize the channel */
@@ -1207,7 +1207,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index d7b7a3138b85..cab33d010d51 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -173,7 +173,6 @@ struct fsldma_chan {
 	struct device *dev;		/* Channel device */
 	int irq;			/* Channel IRQ */
 	int id;				/* Raw id of this channel */
-	struct tasklet_struct tasklet;
 	u32 feature;
 	bool idle;			/* DMA controller is idle */
 #ifdef CONFIG_PM
-- 
2.43.0

