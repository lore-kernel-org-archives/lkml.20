Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316551;
	b=mIwgkq4d7SJvY0pjZs9TpAPrF8F/3IfFzeLA1kUaAstINsKoJwsnxjILdddc3jDNBxTR
	 9TTcvOEYkmGE2ojZ9G/+adDHcc1EEnW4d0EWK+RbVA5kO63IDFoZlFTNj3m+OIjIXx1RX
	 +MWduYUnjVqv6PWj708YfJPPXZ6iNoikqG05Ncxjan8fAKTIWI/ZtrG4Q88aLusA09LTf
	 c3UupLf2TkbezavCf03kqTFp+/Y3v5//1C6a7ylwwA85Z8i8P6f7Qm3HmT5wZWs47WeHJ
	 Bzh0rHdl+Nk1j/aHx0RaysRA67q38/J17WphMFAKOMklwl1lGV7k6v2YujORHUNQnGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=;
	b=meXhJEZICe+p/5AUv6WU40uTf83eXc7/bdkKYlDSNUjOFqc0gmrV3H4ctmNc7tJTS1l3
	 7VzLAxaWgGlVxYxN4uT9VWPv1LjMtCqHWsLciyPhraeIbJpOf6eoTGYIUFDlEaMellXNf
	 A8o+bkoI3ApVuLeBf7I1DwJJcW3C0FXMpU211BKhXob51atjgqgxHVGDX9W0Mf1O6TaEw
	 HW+/SHS5ASG7FWPdLgekF7PwInniaeZpwrySoRxwD4UZQMmv4czVHMHP+6goATwLDOY8p
	 Ku1ZqcQs+qITjoMrIscFMDDydI0kzrcK+OZbcYxLf1tqT7Qbaj9vU7m8mTtkeU1DmwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m98KuahA;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A03F606E47B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A03F606E47B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m98KuahA
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1248410a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316551; x=1794921351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=;
        b=m98KuahARQ1XF9RSU0cRNYwhBEiDATZMGlK5zz9OZxKq97jurznAKC/RepoMebmZ1q
         2OaCPcoU/NRMDWdJEBr3ttZ5kU5yB7y0FqHRoCfFPF2IMTtzM2IA8ooKm3jcThgOKDzE
         9o2lurDBzl6VS22cHV26osO2dZIa8CmRzxDMjFOBknFWioBoKgb0+j5yoPW7xruV4G1b
         ObUGWCqMmbh69OBysdFffz58FKlaCSuMrJGVjNPrJ+CbtPQi5goyomAJ2pRrrNG+kOGu
         L6ybQp6oNYeKQ9qMyQBPVu6+4RS9Rtmj4g/TGobpSg8RYOXV92LCJdrqBROcYvIcl6W8
         IJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316551; x=1794921351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=;
        b=WzYgnx7Yqgi/xAekbB5SGf3akAOTOxUMhWFcvqEoHHmA3Rx2MbWBn0lXpJi4bQ7lOX
         zifr4YhWwTugIF3K5ZdcW0W77K8BaiGVe6n6QfM7Uz7cNuggfBTPI3+RkZGf6VuzgM8y
         oIbrlQlz0VpDZIMJAVXvi1RAEWg6Y34Y7rXE74gLT1UePE0vLcYekPwgtY0EbAPe3inv
         U7TdCI+0aWrKGnl+xnv34vKn0YnXeiLxPUqm+YNA4GwfV9S9eZze5scactDl4jaRQ640
         /tYSQAvikKMiMbiOhiBXHlP/rq4M8LwuK39JU1VAf+GhbM5Qhkksryuuyq9a61pEtQPf
         dpXg==
X-Forwarded-Encrypted: i=1; AL+hErFPNSKDrOwbeXeOuapCMPXiz/NSWfnHxDR37zdsiarVijFkrzCn2dCeyiQaxwCsGv/8yblWuUkgCMBFv58=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fXrkas26RvDYZFI1+w7vfauq0kb+izagXxE2H4Oamv/Rp/Lx3
	lF126boNVJMubqlScMrHVs6jsk7eQQWxb6a7miz4S565ZXHWE0D0x57N
X-Gm-Gg: AYBFou2xJHNMIdy3tdpUXUQ4kZevMR1hd+fiEdhb57wAV0KyZupDvs2D4e6FiJMHzNb
	bxkj6QILZbm8mPDOxWrz+bvdkUFUq/lAT2S730+a/+bk5QQvenA4d8M/dwhVhY+rZ0pDJHLBb0Z
	6wa5G7pyxF0gukLWiBXsTpbm0fiPwNwrmU0lREUg77Fg024M8DxsDkBvGTfGCTzJyggWK1ac+Lw
	NuDj9F9IWo0DpRQE5pp290+QzZ5aB3YTGC6z4KBTxG4245Hqi5tVToiyBT6lsTsCpOP/6M+w/wZ
	Di0t75YxauoI/lReq+UYX8blzptFqLJmSgdwTjQWAByWTtXtjtU4OxOKtJoScbXp9RYjxL9nLf3
	2Bgvv8NM97wBmUFPHtRudDiTQQShMzzhCaSc+GchCtFOq0zDdyy0n/EyGvn1u/v63tlNn9unRzK
	MyOgWh7zmjyv81Ju1LjvJB4K649TJd4CR3gcdd9huLs2A2bv6080GoghJnofqU3hV2J7n9aR1vr
	AnC6pcBRPukBbPL7kKFMofp0gd28QCuV/yjGiGpyGlx22in3r8Aq7hF+SxKKIMCQfLAwBHOV+1W
	jcKr+Ohv8bWzsppbW1fD4EyTi14YCfg=
X-Received: by 2002:a17:90b:578f:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b166c92430mr2883561a91.17.1794316550818;
        Tue, 10 Nov 2026 05:15:50 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:50 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 04/33] dmaengine: at_xdmac: move irq bottom half to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:04 -0800
Message-ID: <373d4fa23c4c5b9898a02ad7a0568ce1d828081d.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/at_xdmac.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ef0dfe9d37ba..ae2ff7c0bd56 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -228,7 +228,6 @@ struct at_xdmac_chan {
 	u32				save_cndc;
 	u32				irq_status;
 	unsigned long			status;
-	struct tasklet_struct		tasklet;
 	struct dma_slave_config		sconfig;
 
 	spinlock_t			lock;
@@ -1754,9 +1753,9 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 	/* Then continue with usual descriptor management */
 }
 
-static void at_xdmac_tasklet(struct tasklet_struct *t)
+static void at_xdmac_tasklet(struct dma_chan *chan)
 {
-	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
+	struct at_xdmac_chan	*atchan = to_at_xdmac_chan(chan);
 	struct at_xdmac		*atxdmac = to_at_xdmac(atchan->chan.device);
 	struct at_xdmac_desc	*desc;
 	struct dma_async_tx_descriptor *txd;
@@ -1860,7 +1859,7 @@ static irqreturn_t at_xdmac_interrupt(int irq, void *dev_id)
 			if (atchan->irq_status & (AT_XDMAC_CIS_RBEIS | AT_XDMAC_CIS_WBEIS))
 				at_xdmac_write(atxdmac, AT_XDMAC_GD, atchan->mask);
 
-			tasklet_schedule(&atchan->tasklet);
+			dmaengine_schedule_bh(&atchan->chan);
 			ret = IRQ_HANDLED;
 		}
 
@@ -2310,7 +2309,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		return PTR_ERR(atxdmac->clk);
 	}
 
-	/* Do not use dev res to prevent races with tasklet */
+	/* Do not use devm resources to prevent races with the BH worker */
 	ret = request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", atxdmac);
 	if (ret) {
 		dev_err(&pdev->dev, "can't request irq\n");
@@ -2390,7 +2389,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		spin_lock_init(&atchan->lock);
 		INIT_LIST_HEAD(&atchan->xfers_list);
 		INIT_LIST_HEAD(&atchan->free_descs_list);
-		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
+		dmaengine_init_bh(&atchan->chan, at_xdmac_tasklet);
 
 		/* Clear pending interrupts. */
 		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
@@ -2451,7 +2450,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
-		tasklet_kill(&atchan->tasklet);
+		dmaengine_kill_bh(&atchan->chan);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
 }
-- 
2.43.0

