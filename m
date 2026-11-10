Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316617;
	b=mUIjjOXEcEhs/Ku8xpn7VJJWF+heo97tnLx0DOn8nCemAn3g7YeYa2cytRB2dfucf+1h
	 QmHTCK98Ko6C2KvEZMgHkxA7U/sTRKIuaRJbMnQj+wQS+cfTtx+r0X2CHBL1vwHktqNKZ
	 enPlyozKpRSNdItAnhr2nWCcom5oVyxfHIvqBEkGtLBKJ2F1+TTr3FxK5F70uiwKQsobJ
	 xqv1pIfKXOIc7Ugn/lYcU6FqLgQBkpNnY/dSmfZ7cgPy+5aO9eDclzyHBifXGsV487qsa
	 YUNeCeFm14MRc+0GrEyS6mk1ci9dVXrSCV9qraSfou+rTYwqvS9QEIhn1mEsFDhII1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bcm4s+IXhIHN8NFhDrr675ONGZF6+mquo3EIHxy/j7E=;
	b=h9AJC4y0305AyTDmRrTHl5gVv70dOLkYlyT5NsHOkyIsx8WOjfNdfSljG7FqOcy3nm2K
	 qR07MU5vK+E48L+q9UOohIDi6n1LlDZETT1jYxid+2O5SpkEUsCJ6EsOX0Yb4zewI9Bvi
	 1iTt04uWqJMCtCNVevaGvS20P+1RJbdYsbE18rq2COqcjn+i55sqPhsRi7tub0vz2KvMJ
	 KjkR1J3uUJ+cWkopv+bFY1BPuK8Gwwd6Jyv5vVt+4wLpndhlNUGfbYgNtw96wPXkX1YYK
	 6xC5vDl8eRfWfBCX2GGkUkZN4Lh8M+5TexQCjkz9Ib6sHQqSylULxwOvGKXMQRE5WkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyDlQKgG;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C739B606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C739B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyDlQKgG
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1164298a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316616; x=1794921416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcm4s+IXhIHN8NFhDrr675ONGZF6+mquo3EIHxy/j7E=;
        b=xyDlQKgGsmPx05GGe6UfpYw7YlYAuNhgNmcHk8s2GNpUBl16nYZEYIGDPCyUtknZ79
         4xE3QLZog/xLzwcbsgMBvkHpSaJDlYgU2VTaTRNegxePFbuS9PwRnjXzBA3ASZ9jA2SY
         zz7ZJQEwORPhX7+rslxZZ1vWYBDmgx7FrKymW0Q4ZBwmN4JCZJh1GEmpv1PLyFFtQk6F
         ktjZLqi8uAj8xwlVzbw9k4ahVlT9cl+vSdnWldC6KD4xxF/MTqElY+bi6CDenDBbYPL3
         ptzSJFmwGr8mW9mOzQEV/TTW2aEXZUxw6BS1t/aiBKTDpvN6yVMZag0NjCrx6ghtVESI
         x8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316616; x=1794921416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcm4s+IXhIHN8NFhDrr675ONGZF6+mquo3EIHxy/j7E=;
        b=OwMOZeBr50JmCKsk6WkxdI0zxAzo/DQqdm/4iq1+zpDOsw3lsmcZ1BGXNmw1iC7M03
         4U9Bf1HigFYqcyvuFeWHFwepmWSuUqmGnW5RtQxbl5TwMhcdQFotSaFOt0PflnqN6xih
         KqORbOBSbeKnPquW0NkG5gcdtWQiRnnc4Rk3VGuMlq02kmCLN6oK6RUU9rfMCcRY9TIV
         du8/WOADriHJQJS71dPZ5i2+OCjCSAwznwWwX9i8az6wXOw9kAWYcNOHW7XzFlGvZBl8
         xA/JP6BERU+l+2egQuJ1NwkJAFxoag3XZq3EiEIpyZDt0WMs3Qp0NNUmJFv4oVgf1Lb+
         AzIA==
X-Forwarded-Encrypted: i=1; AL+hErFZ6WF5Pn3QU7HyB3d0s6rnjSmtRJxECHujIsUX92QwE8UUPsW8Q6OoNJCPMZhxy/9o5+g17P/k+y6gnJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K+YigX837MNy0tLCqHKj3LJqLguo3jol5GZ2Apzy5NqAEmRGH
	Gr5ZeO1uzyYey33cgczSlXdIqW/IXkUNOwk4ZczIUtSJ7PTzWh7Npdk+
X-Gm-Gg: AYBFou3jJ47pxj46i9PsPsR9EV1Z0/XulIjUXr+UqYJbxTY87OPgFze5R5vB7jXzyHe
	n7bvuNhxfWfaiMG6OWPMmhtp1rqzMW5G0Ij2aWNknh0eNOYO+IfU12Ui4nDc3J4yYSNziQr0IGg
	u+wkMd3z617t0mhuivQeizDJBjgcxtOcUdrt1ZFgyqpJ679tXzo3twbGu4KtidtgA8G19sEoecQ
	xZUyNf0J9QEiblVz4wdWpLPTEjMJArqN6Gsg/In40084sP49oqWg6QkQI8UkY+xE1aTheUyjeol
	q25FSydOGkASYCn4mc6IGMhQsMk5wWNOVKzH5prsrYBk1wZVQQHC1kWCgNXcrKWTZdUvP3IOhYb
	nUg90/1ED3o2Ma8652LgntNDHRLOt3FQA4nhxe8IHDV8TVk4bNg/M4+R2YUIfMLmKpTfFPh7SWM
	xolkvRpzRlMkaHvE45iJLd8Me7lVMFn9FZFFjripUjayeb4DEzqCtBvJZmro3XxTxcbV6A69MYE
	qZtBWpyOZWqQ7ZV7LaHY26gvUlULwNW4keViSi6NXorU4MiII+BeeeG+Kjmxv36q04YxZNdLp1G
	ZvnHU8XhfA+rnm36UrFEuG+TrvLZ4fA=
X-Received: by 2002:a17:90b:4a48:b0:3b0:d365:f8ed with SMTP id 98e67ed59e1d1-3b166cd7209mr2729464a91.21.1794316615778;
        Tue, 10 Nov 2026 05:16:55 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:55 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Alex Bereza <alex@bereza.email>,
	Marek Vasut <marex@nabladev.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 19/33] dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
Date: Tue, 10 Nov 2026 05:13:19 -0800
Message-ID: <b17d718ce2500611e33331d29d10e3ab5de07a39.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/xilinx/xilinx_dma.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index b89f2c3c1579..d23658c927c7 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -414,7 +414,6 @@ struct xilinx_dma_tx_descriptor {
  * @err: Channel has errors
  * @idle: Check for channel idle
  * @terminating: Check for channel being synchronized by user
- * @tasklet: Cleanup work after irq
  * @config: Device configuration info
  * @flush_on_fsync: Flush on Frame sync
  * @desc_pendingcount: Descriptor pending count
@@ -453,7 +452,6 @@ struct xilinx_dma_chan {
 	bool err;
 	bool idle;
 	bool terminating;
-	struct tasklet_struct tasklet;
 	struct xilinx_vdma_config config;
 	bool flush_on_fsync;
 	u32 desc_pendingcount;
@@ -1173,11 +1171,12 @@ static void xilinx_dma_chan_desc_cleanup(struct xilinx_dma_chan *chan)
 
 /**
  * xilinx_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the Xilinx DMA channel structure
+ * @c: Pointer to the Xilinx DMA channel structure
  */
-static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
+static void xilinx_dma_do_tasklet(struct dma_chan *c)
 {
-	struct xilinx_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xilinx_dma_chan *chan = container_of(c,
+			struct xilinx_dma_chan, common);
 
 	xilinx_dma_chan_desc_cleanup(chan);
 }
@@ -1979,7 +1978,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_hi_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -2038,7 +2037,7 @@ static irqreturn_t xilinx_dma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -2740,7 +2739,7 @@ static void xilinx_dma_synchronize(struct dma_chan *dchan)
 {
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -2831,7 +2830,7 @@ static void xilinx_dma_chan_remove(struct xilinx_dma_chan *chan)
 	if (chan->irq > 0)
 		free_irq(chan->irq, chan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 
 	list_del(&chan->common.device_node);
 }
@@ -3161,8 +3160,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 			str_enabled_disabled(chan->has_sg));
 	}
 
-	/* Initialize the tasklet */
-	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, xilinx_dma_do_tasklet);
 
 	/*
 	 * Initialize the DMA channel and add it to the DMA engine channels
-- 
2.43.0

