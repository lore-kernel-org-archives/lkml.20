Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316646;
	b=4NSS4xlazH155F4J3OT54ykYBmyTdOJbDPEeO/pif+vkApQBxYhqYidxOr8ZPEilmcFY
	 d1DMNyJbtp7KylnPOObOK8DFLLvw2lZu6naV+WsjanJGib+7q3Ouw7tzq0y4I+ERBKhEh
	 DV40sNlEI1FwP7cuo1aIOoyzqaymWEYS7Fyv4Ppks+3soXfr1sxZxzqeO+LDXVTdMcaLE
	 i268bE2cOZYoUNExJZYzBt9PjLpxOQVUtuyBkdrKJJJaS0KtihkmY4Efvswklcm0sASXP
	 xS8GyoRMe2CVQ7jlPC8f2R98ZnUzNRCyKsXxiluuWHT4wgJ+wH7rXbGcWzhQPgbFuRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=amYKu9Mlu4ZUHnYh3zoqDs5n/EBYvfKM0p/VC3iZw/s=;
	b=0ykgULpcdm9K6pX9R2qBQPIgvkELmX5mXNzesrPlIPl2pZcYmteDhEKhV0dRK3vzJqhk
	 9HsVyexcvmlHDkart2YEqwp30YCy708bpP0eFxRQOhGowtR1dlRvTTIwL5caRPjSQgxyj
	 MXPdIvZ3+uvfs0n71b2gWqrZNmc/lwz7qjhS+0ec0vPnnkCz8Ru0lNJWjM9/ssCCNfOUb
	 Oa6auvARvPyhENvfMySJPW/v9DowNeDEpGhkDYsGwzdQ0xug+679/og+mY8oKd59bazSa
	 QMHrauwCIsUVdNfKxYo/StvlsND3vErkMsn8yKG36doGOVKq5r8vUAM6FN0bA2IABBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrXf8wWm;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7F6071E4A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB7F6071E4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrXf8wWm
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso815263a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316645; x=1794921445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amYKu9Mlu4ZUHnYh3zoqDs5n/EBYvfKM0p/VC3iZw/s=;
        b=MrXf8wWm4iXgPVf0ei/9iKm3ujIo9AFWMrhwj29tFnKI1mmLIEFlXjP/1YH8S/xjmS
         zxB9Mgu4BvYCkCzLLmHZUnNv8B8NLGhZUK0NjPxiKrjOHRPKhTwM2eMcLJbaoU0kT2n+
         DLgepPgo/Ey390mn/I3PmZNRE/okJgzTVRnWAOQP7HQdX7rH80ynykHaDfbLNiXtQm+r
         Qb3CGyUXDsKdjb8sscBvef8EkBw/qHwU9FtFQnHKMb7lIgTGs3w0cWq/91ihcye5Z7HF
         PuLssEcZks6LItj5quTqwp/6C83BCCYnhGJZrVFgsHLGnBEdAGbtB60JVU+a3ot8Ydl8
         Oa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316645; x=1794921445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=amYKu9Mlu4ZUHnYh3zoqDs5n/EBYvfKM0p/VC3iZw/s=;
        b=Ck22VVANm6wF+3WlbDF44nZFdgLE/LnROEHfug24wtCOcMW6udB4g8CCLUaAMeoRT4
         nbnjZIszHhv/yV8BNHqUrCWV9vHZDvPTFUo/X7R/XeV0eWm9CyMdLtSMONb9pSRu0KeU
         xlMN7AZ5U94x0Dnd7+gbJ0aZsbopoSWtAudANS2W/vSOm8IHrIrBeoyGnURbMIah5qj8
         Z0L8/JUOrZhpwjBVfe7S+6M1fKhG/4XHKhv+q0CA0hdAesa6DFVYLvIrJCMR3DSu4dtn
         fZcqP35xbqdSTRYveqdG6wyh9fzDT0YQVW16PY+RnQNsn4DoOsqP9tvmw6y46h94vvVf
         3Wfg==
X-Forwarded-Encrypted: i=1; AL+hErEHBa0lr1n12kVj07xVG3w73gYHWUUPVA6hAuTgwhbrWLXdENc/6VgWv8QgD7W9sUIzDJqzL5GtALU2cbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dGCPDZ4ec9TpYgiqu3ctwwSso/rcT+4cB9vGYDDpkQWCL6WWh
	/bN1FY+ruAFCnHAGfXv/41xkUyz4ju480vP39rwx5tuH2SC3mSf+stDiehWzQw==
X-Gm-Gg: AYBFou2can8Tv2jwdzGfy8OJJcH0BSSMfzuRs5TKj5MTIFYWvyMZ6HTSVzyoaNFoDDQ
	fv9C+TjOmuFL7TNBXnQ+508pcy2+KlgK46eRQJmNFzz/+KIH/x0nBRAvCV2bN2ERsB0vRah0/rv
	8KZJUkErfMo96uTTtQY/oH+JgwCL2Ujy+hSgtG+IDLfYyyIOfMCs6UQt0OF7yIDvvtUCGRgbzTo
	rFHVw2q2Te8LMBJJkXzDQahL0rLAh2q/rnmfTiVvElpjMIkMOC2oguo+Vs1uBBzxwloJH5Yaqch
	IBpq7VLAJim1VLYngmzt09YXuaHZDkyfytymB+0YmumSiQ7tyYvk8pRWJv1aM1mdV2lcxwuXUFE
	H+281/+9TiyrClamQ6Kvfa5plwsuKBfDZOiayQcfa5OhW/roCmtoX3H8GZNwXMzJOBrEU0wA3EN
	Lf1o1bzi7i7XCsPdnTIZDX0/3Ea+iEGdi/2r0Ndtm1YE/Pbx8bZgCiU2NkO7AEu2ttZDDgZXzAX
	SKMCo3//o1gZDCzDbfRFQg4WTPH5Dq9SNXYj0K+yrRlIodvoqfZONqaHKhk1vfBHdUYgxXLmazz
	7ihZTIhz5NIvjHt4glPFyqAaWhzuXJ8=
X-Received: by 2002:a17:90a:e2c6:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b16cabf8fcmr1224865a91.11.1794316644780;
        Tue, 10 Nov 2026 05:17:24 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:24 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 29/33] dmaengine: pl330: route callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:29 -0800
Message-ID: <e9d076ea58ba3701e0f9287ce2fa3ccae4c8df0a.1794315350.git.allen.lkml@gmail.com>
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

Convert the per-channel tasklet to dmaengine_*_bh while keeping the
controller tasklet for non-callback events.

Initialize the channel BH once at probe time, alongside the other
per-channel state, rather than in pl330_alloc_chan_resources(). Unlike
tasklet_setup(), dmaengine_init_bh() must not be called again on an
already initialized channel, and a channel can be released and
re-requested many times. pl330_free_chan_resources() still drains the BH
when the channel is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/pl330.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 977a9fde80ad..6e88f5b45fb4 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -417,9 +417,6 @@ enum desc_status {
 };
 
 struct dma_pl330_chan {
-	/* Schedule desc completion */
-	struct tasklet_struct task;
-
 	/* DMA-Engine Channel */
 	struct dma_chan chan;
 
@@ -1575,7 +1572,7 @@ static void dma_pl330_rqcb(struct dma_pl330_desc *desc, enum pl330_op_err err)
 
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	tasklet_schedule(&pch->task);
+	dmaengine_schedule_bh(&pch->chan);
 }
 
 static void pl330_dotask(struct tasklet_struct *t)
@@ -2061,14 +2058,15 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
 			desc->status = DONE;
 			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
 					__func__, __LINE__, desc->txd.cookie);
-			tasklet_schedule(&pch->task);
+			dmaengine_schedule_bh(&pch->chan);
 		}
 	}
 }
 
-static void pl330_tasklet(struct tasklet_struct *t)
+static void pl330_tasklet(struct dma_chan *chan)
 {
-	struct dma_pl330_chan *pch = from_tasklet(pch, t, task);
+	struct dma_pl330_chan *pch = container_of(chan, struct dma_pl330_chan,
+						  chan);
 	struct dma_pl330_desc *desc, *_dt;
 	unsigned long flags;
 	bool power_down = false;
@@ -2174,8 +2172,6 @@ static int pl330_alloc_chan_resources(struct dma_chan *chan)
 		return -ENOMEM;
 	}
 
-	tasklet_setup(&pch->task, pl330_tasklet);
-
 	spin_unlock_irqrestore(&pl330->lock, flags);
 
 	return 1;
@@ -2355,7 +2351,7 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
 	struct pl330_dmac *pl330 = pch->dmac;
 	unsigned long flags;
 
-	tasklet_kill(&pch->task);
+	dmaengine_kill_bh(&pch->chan);
 
 	pm_runtime_get_sync(pch->dmac->ddma.dev);
 	spin_lock_irqsave(&pl330->lock, flags);
@@ -2491,7 +2487,7 @@ static void pl330_issue_pending(struct dma_chan *chan)
 	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	pl330_tasklet(&pch->task);
+	pl330_tasklet(&pch->chan);
 }
 
 /*
@@ -3121,6 +3117,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 		pch->chan.device = pd;
 		pch->dmac = pl330;
 		pch->dir = DMA_NONE;
+		dmaengine_init_bh(&pch->chan, pl330_tasklet);
 
 		/* Add the channel to the DMAC list */
 		list_add_tail(&pch->chan.device_node, &pd->channels);
-- 
2.43.0

