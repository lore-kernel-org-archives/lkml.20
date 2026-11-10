Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316648;
	b=zPrt0mzZpgXfapfAicCO0IGsVYyxEOhSPTbgBRfY761SaxUWmXxsM8e6jEt3T++UA1Gn
	 oB8+SHj2qEO/5q/tHaxBjWo+1qWUgVLlj1UmbxKGoRITc0TgKhboKL0kC9WMCD7So5tL7
	 hqXNWH+YY4WfRbD13Mk7aftv73L/8lgLj19PR8RAP9zDSzNLCt3whMzbjyLvBB4qcZk/a
	 n9ZdpELpQa13fOg2zz0Zyrk7CwNYSS2+0q9Sjpi+6TgoZIMKyc3LoWOc7MscZsiMkpsm+
	 ilSQMKGxE97jwBfDC82aOPlWB77v9faC3ijEoQAYMEax8pa9s0sdtkQvzQdSJnOQGHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wYslcRexAqYsTQr6XAo48lObPwNop7Xx/VHJGBH6Ypo=;
	b=0xyyCXGcOwBtODQqEVKeixUvMjJFeRlqLLps8b2YsSiZjASV+quxwWnyarh/Ojzw1gxn
	 r5khJKLzCz9hF65X86xZr3l94rK2CX1Gzg22wtnfDr2AKplvy8zkhUwcyPFOfeX+1WJ5f
	 dxDGFjnRhbpJzMcSRL3PkrddZA/vnXeIjFF/nxjWeNWXZ46CDHiaoayBAWMJwGxuNlkxc
	 k/9FPqREFMeplCf7iXL0AioDIwIX6Xb9oXmfafOwIkb6VVqcyhxWqMiJE4kJyun4KdnDz
	 9J34wlw63lzZdgM9DeAm6L8tngex2/otKoMa7Ib3FjR8b99ym02WHxr90jLXGGajj2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddJE9tOl;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5210D6071E65
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5210D6071E65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddJE9tOl
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1075772a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316648; x=1794921448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYslcRexAqYsTQr6XAo48lObPwNop7Xx/VHJGBH6Ypo=;
        b=ddJE9tOlxv8auuIIyDtHpiXFuRaeATRkIZKBSkg2hIKtmNOIGoxU0cLQFGDJww8p3Z
         XzX1F5GwsmJ9aYld0QyR/SR4915LTdTUup1mgkhRzIZWGdlnL6hCdpzTlxx+PI7XoP9J
         WTESIoyd7at/67EGo1MTa4GZlpUWVwhN7cdHRKJyZs5tm8Ow34Jt+IflRad+ntnmA/nC
         ukuyz+OUA0DhHBWiK3tBMvYYnupFqoRJR7qlSDu1NDLOrOk4h5DUeBYvMe1S9NW9sd/J
         uqJYQvSe6jX0snl08oUZ6eAvgycT5AYrUu9xduaXe43wvIDN9xzGora0WWXOdcweTyON
         p+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316648; x=1794921448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYslcRexAqYsTQr6XAo48lObPwNop7Xx/VHJGBH6Ypo=;
        b=KCzYB7+R+Dqr2+OHmSO4feLnBCptSBOPv71qIwmWevVprT7uJFgpbAr+OcNeZTKRvR
         kFecKGagjwhupExN4bujVf76SyTrFhXqHWXGeOgYEP48C9yDQpJUxsvf9AipTeDwF9c8
         w5xp2y9UDcAEepYI2zb9CJH4WUwuINkre4SFRiTuh0vzzFCUF17cT1XguTdMX/+i5kX9
         QLwc6aiK9CyNxBsCMp6rnBpqgmxDseiuWvT05zD+N/w2687PKJQul5GSqIdnOEHE/9WN
         JFwOwda9OmZ9l2DOzh/7qRuY1wbnfjeZDaq21E4c5LUfV74RNvWOc0nemazm5yZ7AUtn
         3bvg==
X-Forwarded-Encrypted: i=1; AL+hErGUNYZeZcaKBnyXvUbYqzflKGp9FyT3JJfZW2yJ68QtBdHaXlCtsQRpRiOk+BrENRCbQKqnm3c3WDEZ8RU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xO+ZK5BtAiqF3TBlImHBqQXAlg+Iwid/+tEGpuDyFxkikgTGM
	iXYWNNhX7aNQNB4kSFQ+iBdmbCM8k7kzNyCqgWjjO6A/+Vsot8D3LUAy
X-Gm-Gg: AYBFou00suQkuXf5dTmMkZZ0uNLIU2JMU/USu1XdfOWNfAur3OSpdE0oxh0fOdstpGp
	3Mf1OuQft9/Fwctxj9KbFUa0V0CnxrTuPxgjrGxz33PL3Sx2zQ/+aggY6cVlEZr1x/2VDzC8ykt
	dk+jSm51nBzPP4OY/w4LV2M10GONWBWWtYpi0nxOFVfTeaQa7yF579g46MSIrSizxu0UR8x4BtK
	YZaOyLmeX3xoCOrgq2DMlONGFX7dqBvF9ikzNo3tlW2EbQZ9VVqmOjy55/FXMqVghU7lHXa9qPj
	dsiJvOQm86cF437SAsN4N0UhQjmUzu0ZuA2oZytsF8UvU3KBf9g8pxYrxwFK5DUh5Dei43v7Mh2
	eLOuH8j44hE+u2sEes1BNR9xkE3nI+VUoDwh3DUNZLUceCqJ+PK8DtmQor6qNjm0v+mUCTUi4Ya
	YUJM7vv6oR0AvpvAnIftUSy3RwkESVt+U+dQhURnwcppWs//WyNDAG173wXbllx8L3MRjCtvIy0
	RRuH9fFO24E88N4vB/JzmMEg+RwUTsc0IT9DDoLvLPHWcbquQhq5dYkpSjhdmLsLWTIqxFXaU2U
	0SmsNiMGl3lKWQZa3uO95tP8TxNoa3Q=
X-Received: by 2002:a17:90b:2ec7:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b1679a3218mr1654613a91.23.1794316647670;
        Tue, 10 Nov 2026 05:17:27 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:27 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Stefan Roese <sr@denx.de>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 30/33] dmaengine: altera-msgdma: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:30 -0800
Message-ID: <cdab3a18232b5371f09f3df30ab855e3b4ba46c0.1794315350.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so completion
handling runs via dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/altera-msgdma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index 567aea0fac38..9a0741642a7f 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -170,7 +170,6 @@ struct msgdma_sw_desc {
 struct msgdma_device {
 	spinlock_t lock;
 	struct device *dev;
-	struct tasklet_struct irq_tasklet;
 	struct list_head pending_list;
 	struct list_head free_list;
 	struct list_head active_list;
@@ -684,11 +683,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
 
 /**
  * msgdma_tasklet - Schedule completion tasklet
- * @t: Pointer to the Altera sSGDMA channel structure
+ * @chan: Pointer to the Altera sSGDMA channel structure
  */
-static void msgdma_tasklet(struct tasklet_struct *t)
+static void msgdma_tasklet(struct dma_chan *chan)
 {
-	struct msgdma_device *mdev = from_tasklet(mdev, t, irq_tasklet);
+	struct msgdma_device *mdev = container_of(chan, struct msgdma_device,
+						  dmachan);
 	u32 count;
 	u32 __maybe_unused size;
 	u32 __maybe_unused status;
@@ -748,7 +748,7 @@ static irqreturn_t msgdma_irq_handler(int irq, void *data)
 		spin_unlock(&mdev->lock);
 	}
 
-	tasklet_schedule(&mdev->irq_tasklet);
+	dmaengine_schedule_bh(&mdev->dmachan);
 
 	/* Clear interrupt in mSGDMA controller */
 	iowrite32(MSGDMA_CSR_STAT_IRQ, mdev->csr + MSGDMA_CSR_STATUS);
@@ -766,7 +766,7 @@ static void msgdma_dev_remove(struct msgdma_device *mdev)
 		return;
 
 	devm_free_irq(mdev->dev, mdev->irq, mdev);
-	tasklet_kill(&mdev->irq_tasklet);
+	dmaengine_kill_bh(&mdev->dmachan);
 	list_del(&mdev->dmachan.device_node);
 }
 
@@ -847,7 +847,7 @@ static int msgdma_probe(struct platform_device *pdev)
 	if (mdev->irq < 0)
 		return -ENXIO;
 
-	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
+	dmaengine_init_bh(&mdev->dmachan, msgdma_tasklet);
 
 	dma_cookie_init(&mdev->dmachan);
 
-- 
2.43.0

