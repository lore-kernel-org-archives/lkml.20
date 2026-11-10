Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316579;
	b=Aq9tWetCtDNB+0fzAWdPaSUUSjP0sZPsLqStLCLbsuG8NJJ4RepFAzYtAwTF7jV3UBCJ
	 A0xUH1HmFHVnOR7pX+9IJoLN2LyJR/aH8SLymCqXa9w2QCo8g7uBeS0aB0UuE/GTROmB3
	 h87laSmdCdB7LPJ2aVW+e1QqXeUyejPNUhbp2NO54AE+WkeNgFIWsNT0vtvR7NqxTt9Ey
	 HhfZic2APzjhee4tUsX9WLLg4/1h94unyUdkE2nfNRDTivYCj+zkpKDanK5BV1TQw7Ha2
	 3ryyqmj57+2rktKGRTqx/VeeRe8/zSVYFRdzTzUuk7DFe2RMrHTyjqW6xReiD6f1Y8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+LrMmR+vkKu4p9kzNlmH8/RuG63V3SyOhjhj9/0YiBo=;
	b=UTfg6oEARdPhoroGhUI1yl21WVS7HtXI+WOd+dBQl2VhcjZWgk32JwaVJhGs3WQtKpJa
	 kQKmoRVMIsC+ebbJpGnupC+hNVPc6qI7c6wpK9U41yo+/xPVEeqBmakRY1uFtB4VAmQ1Z
	 f0f9j/6V/30seXDiAepauy3ATxt7+Z2ZqsbYBOF3zvorr/lCalCHz24MFJC3NWsSa8Lo+
	 RRh92gGL+2g/GKPhNgq/lLHxn5i+L+zykChmOOabF5fx+yoJVYo7lx70eafP7OiTvN/cu
	 c/5GGBDHEstEHWOab5XqrstqJIpX8cd4zxcu8f/A0b4xS4fCnJfth+AGYrnghY5Jyig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujHf7F8v;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21D606BFFB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B21D606BFFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujHf7F8v
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1122049a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316578; x=1794921378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LrMmR+vkKu4p9kzNlmH8/RuG63V3SyOhjhj9/0YiBo=;
        b=ujHf7F8vbBL9mJIIbCDBDy172NhqabWtc4jQ1OoIaP+P001lSlq10qIjBhKQq13AOf
         pDH2AfJz8b0xTnz66v6Gj5y6UIVXLM7zifrvXpNo4SREqE1WSoxZCDZmNnZI3nZ87+cn
         RFFR+SyLVI8dYr+Rm+mu7D7NiGPJGEdeOxrG5KeTT+DAiCYwWHujGHdMyNqXQmt+laIY
         AwiqzvUDwSbJwZ44SH6rAWFjyHUDkhYOreuBk6ex/6BJpsUeeb+8gsalHEt77L0NBZ6/
         GZP7gTWuZfwxxiL4JZH3V6iDKoAyRefhjYPU1ATRJ7ExP6dUlj5ZlApUcks8oE+7XtTs
         erjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316578; x=1794921378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+LrMmR+vkKu4p9kzNlmH8/RuG63V3SyOhjhj9/0YiBo=;
        b=q8NrMZbsmZzI6sYDLZDdt8f1TzQmaNWykXGyD0lEMj2TY+FNDj5dg9U62h8gx/iGAD
         AYh4kgUdvXOYwYYZeXhWyL/ra6QYJUmJI5SBvCM7Dj3DOJG+YsrfRge2wcOPhkL0Z8CL
         ey5YpHcxXv9esCscuy8JhJOblIIQQSCybxLLTTtEfsnCgX5xgPG440ppCT2NBcMFuu55
         Y693sRj7e5vRogh2LOh5fiOsVZW3pvxKbm2TYocy6FnkyhKmKQS17Xj1fCC6ohdPNMcX
         1XcSU1rvUUXbfBzmxNzPoIRSNB898q2VOkHy7MrpENWC3I+dfXgviclz6U9wP/kLXCrj
         3lyQ==
X-Forwarded-Encrypted: i=1; AL+hErFk8LQPOv8jFjRxrA/7A94XTkbpsK9oCCjudbyGvmu3zpz9AXSC6PGlJO4Ss2WxEXTAOsswv9VThSVZVBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uaQavpY0w2gC/Nyo2RnSWDdZizM70N1JJCOv+3ZVkyaG2W1z6
	ndnbW1uPwZYCWjSl3IllpU2ezBg2/lTjRX2Po3nhjv0pPElGywK17nzb
X-Gm-Gg: AYBFou2WiHkRz6zWPno2K39T6yjqXUPRGPtHtY+8gPY7lN/oKC6YlqhhvQMt+ATks2y
	7H/+VDxNqzkHKz456MadtA2Q05LtQwkTQyF+iSsKsy+qBcwN3nhIkyd4izSMHDH6oMSz/QiPDa3
	VLXjbKMLqdQ1aUhl5RShsJIsiTuhzztNhEysbGgIQ7UC/F0W7aLY09UOtA6mAfy2kOlYN+jsEwm
	t9+Edg7rszYq1M84EJLEQhecq2deiF4aFVro1aNYdrNoBY6K/Mhh2YEI5BF4LGFtY1+KG6VVPWD
	wnL/NwdPLbs3C3nvlpnisHQfWuJBH0NP6r5rQwIxQnTMS4Y//4UVr93UULAMczbFXT9icBJUCBe
	qVHbm5iOw9ZDyVhUZf4rj1gECV5tmZGHBsJtItuMgEk4f1krHKf6sjGB1VaaS1xPtPAPt8ioPs4
	qNCHI8UDS37poDI+kqRw6amQVmGazwGxZU3Izs44vFlrvOMBR62V01jBbbAxWp+7eY5kz4kZaLv
	+6uL6/AoS0Zv3CJf4ZZNv6gbOM1grQ3F8FOl+uM/9ryl6meZjeuq5tyFsj+13W2Be4MjKFzbFjf
	aU6uu/+Tb2MlXj6zFGk4fFZxLH0CmAX6Ej3AR/zgY1+cxlXOD/Hc
X-Received: by 2002:a17:90b:35c6:b0:3b0:9e2c:9b60 with SMTP id 98e67ed59e1d1-3b166cd47b6mr2411498a91.21.1794316578225;
        Tue, 10 Nov 2026 05:16:18 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:17 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 10/33] dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH
Date: Tue, 10 Nov 2026 05:13:10 -0800
Message-ID: <e0e306bdccfa7c8da6e9bed0bab9f8848db3bc64.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/mmp_pdma.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 6045d6d1cc79..abea70dea890 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -115,7 +115,6 @@ struct mmp_pdma_chan {
 						 * is in cyclic mode */
 
 	/* channel's basic info */
-	struct tasklet_struct tasklet;
 	u32 dcmd;
 	u32 drcmr;
 	u32 dev_addr;
@@ -373,7 +372,7 @@ static irqreturn_t mmp_pdma_chan_handler(int irq, void *dev_id)
 	if (clear_chan_irq(phy) != 0)
 		return IRQ_NONE;
 
-	tasklet_schedule(&phy->vchan->tasklet);
+	dmaengine_schedule_bh(&phy->vchan->chan);
 	return IRQ_HANDLED;
 }
 
@@ -1045,13 +1044,11 @@ static void mmp_pdma_issue_pending(struct dma_chan *dchan)
 }
 
 /*
- * dma_do_tasklet
- * Do call back
- * Start pending list
+ * dma_do_tasklet - BH worker to process completions and kick pending work
  */
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct mmp_pdma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct mmp_pdma_chan *chan = container_of(c, struct mmp_pdma_chan, chan);
 	struct mmp_pdma_desc_sw *desc, *_desc;
 	LIST_HEAD(chain_cleanup);
 	unsigned long flags;
@@ -1168,7 +1165,7 @@ static int mmp_pdma_chan_init(struct mmp_pdma_device *pdev, int idx, int irq)
 	spin_lock_init(&chan->desc_lock);
 	chan->dev = pdev->dev;
 	chan->chan.device = &pdev->device;
-	tasklet_setup(&chan->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&chan->chan, dma_do_tasklet);
 	INIT_LIST_HEAD(&chan->chain_pending);
 	INIT_LIST_HEAD(&chan->chain_running);
 
-- 
2.43.0

