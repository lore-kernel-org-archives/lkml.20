Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734692;
	b=uOdram4OzQ+3dWv4NrIVXR0xm9siztT2JbJpxxHRIgnEFDcmmVIJ4siWKhT9gK4uvd0L
	 8TURLclho8CFpNZlSUHTGY89RiWz4JT7DcGvjVFTK4tnAgT2ElJpGaxkwSQBP7SmByBbs
	 aHR2KdOacJi+LlaMEjOl8XP4toGVAMcDFx8jTAOT0Y/nvusvGdnqWADuxnTjrDGCmTfy+
	 GMQI0lL8s9pTBOwlVnxMf1dFeCZXVnp+m0qtWkx4qI710IUWKjWhyYegL0sAmGEbSY5Pr
	 k8pCSsBSjMGDJpx0QDvT2lPTzWDON+V2eL/VppucO/hYWR75kQftNE6wDoXqDQEc9pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NWn56ujqJNytV1vPtoqL3CvdGqy200m0NoH7JljBi/k=;
	b=b5SF+biBVi8S9VnAm5XajIBy90bRZBlZhoq6OF1Bb8IwO53VK46Qp/3QOiHCRa4N6wZN
	 MY1RMHzsDUWKZS8LiI72vTdiiH87jwOpXOChdftj+GDAgpj2Lb6ZzqlGgo4Y8H5fEkXEc
	 M7fqjCOG9vVKPBNPw2WaNAWG65WTCFJQnavqbroOGMCLu7nwpDZUERwKAa/cFWq3FRhhq
	 Syr45OqvloZXUo39GJylfo7jf4Z1w8W2gwHF4/HqnlD1d4clvZGNHBjcnL6YEfHFABZbx
	 7u+NktZQJuBOtNdsj409Mxno4OwsoxlL8lqHLLmh3jDPq9m6Ou6iEH1a49uR4e3cMVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pOPsALAh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C861B606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C861B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pOPsALAh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so45467115e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734690; x=1794339490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWn56ujqJNytV1vPtoqL3CvdGqy200m0NoH7JljBi/k=;
        b=pOPsALAhm9jkkyGAFY5NGarqG2OF44tDjpDFElBHy9wA3fNmrymkDIxuqrOl3BE3oo
         fCld77gct4VQwVy+Gph4HBex+k9dsndFcjGShF+ekEQcGHVJEnW1Xdpr3Qjkno3x28Aq
         FKgFa1+G2Ht7z6Mgl+mdBNPkw6p2X/fUQB/rdARfZd4A9QkLk4TsVchYZ7FQ+YaVKxxb
         ENdrj7Vsjd3ScoH2IZ3TNEhhstxeu72xuSE958q9C1kI//83JSbD7AI4ehaAuHC2sbXw
         0rUYEWBNGB2b3zLmSPIGEPI7JKMfi6bcbxf9zmfvxrFJDZRlH0kpmvrNTSywnclD3ztE
         lzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734690; x=1794339490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWn56ujqJNytV1vPtoqL3CvdGqy200m0NoH7JljBi/k=;
        b=cVw8jGgXnGYHQoypNdfvETn+BQfFoRBw2eyxVBUwQekAGIFBTi+CeiMUEHIi8fKyw2
         AkDFzZNQi12is902yLhcBTIxZyaLf4/XrMHArLAMxrwLYcFRvDGuWKgOCRI0CKAW6qot
         Ao4Wm9RiYJfNPWNlNGn6N718dal8PzeKq/k7joQeAkRBQM2ZTMk1DV0p4LJMwSw8Vmoj
         dV8zZRO8Caiir2gbzMODwOH0iQBPw6n4XkZB6MqR5GrUx/kGYla1+o3kHa5byoJwk+8f
         U2Vw2z4xT5tVkanCN96fWnAF4/bmcboB1LHkwasV2Xdb9y2dE3ZViAgbiMyNf/wq3F/O
         YG+w==
X-Forwarded-Encrypted: i=1; AKwUvByE4YKuZ7C1sZuVJJyFk5b3yQ7jDhd3jgJzqMwLJJOLDygutAN4LzGgLPIVc1hqgpf8p8DYn+rfwiQF7x8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iEf8DUePcMD4lcsZ77jD5JV2PSRSsWCOHMDUE4UHI6Oc3yLLN
	GKqysapkyRrW2xSkLNOtH+XPZBTGtmPSlHfaxjITaFGcwRiQURNBnUCBF2MxGbqofzA=
X-Gm-Gg: AYBFou3f66b1aHF7QNibicLIcJxXLnXQLsUHUMVTs1CSZnesEq3XQ4NNKZwzQX+k/7D
	rXFEv1PxoMgk3tyHUtG4H3YaQjhaXVoJDmDYzVGLuTuIFq98ZQa0TogqhZAwxsgyUz/hTtHjXbW
	N2hcOHourvZOqpGuRxI+njBOD/r5rYFW//mXGXYHc1UxwX8y82R8mF3TGddZ5ZIPYnvFse0O0+W
	VXLjRbcVIxYWtZ+igc7i346AGzfWGEhunOFzoADBvNaLcAyrhCaKPggz+nuo2ylZzeImj51fNWw
	3v6P6uzXM6+76KA7I6sGBLmdvA3Wr+3gSUB9mlQmF1fe8VNQDbRbBIBz5tOspEO+7iHfenMcZEx
	pY9EveZ8+ju5TcCKBRYltEu8tc/XuKlvxKMxhXOejqaruyDB05VlaHEm+QH44j0vA3MrJdlRNHe
	y0MaJGcD0jP6xP27CtdjHsPjJod15dgcu6/DcWwk2QLHOO0FnW854rotg68Nta5DJH4X1gzwRlI
	x8798d+I2Pr0DPf+C0YEondsZkKd96ep4JpUBcDim0D3pvxaz/7wkHScuE9qwLyHXROaISipXCM
	OYOMKNKd+Wnq+bagf5isi70fnA==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr320484655e9.0.1793734689818;
        Tue, 03 Nov 2026 11:38:09 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm88269195e9.3.2026.11.03.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:09 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 20:37:29 +0100
Subject: [PATCH 2/4] dmaengine: ti: cppi41: Fix register access in
 suspend_late
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
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-2-d7213446c5f5@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2344; i=msp@baylibre.com;
 h=from:subject:message-id; bh=lXiRL/4EGMomZ+sZe31WR8MZI18NdjhygEMgW/x7zpM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFvwTW/VP1Fd4LtTT6LlT6KO8YWJuuhuD2p5OfpNJ3
 lZT7jp2lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwEQKvzEyvIqxnuv47/Dz1Hz+
 gq+3e5+ffuU++ZVen4kIQ8q2acLLljAyTL6j8ujp/PlLm6qEV+x+uH51THjW49/eaYqlgZb7pj4
 05QQA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

cppi41_suspend() and cppi41_resume() access registers. However the
device may be runtime suspended in which case it is not allowed to
access the registers.

On suspend do not run disable_sched() when it is runtime suspended. This
avoids accessing the registers and crashing the kernel during suspend.

Resume when runtime suspended is delayed until cppi41_runtime_resume()
is called using the variable ctx_lost. This keeps any access while the
device is runtime suspended.

Fixes: fdea2d09b997 ("dmaengine: cppi41: Add basic PM runtime support")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/dma/ti/cppi41.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 458d20b12462..f5a824418fe7 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -146,6 +146,9 @@ struct cppi41_dd {
 	struct list_head pending;	/* Pending queued transfers */
 	spinlock_t lock;		/* Lock for pending list */
 
+	/* Register context may have been lost during system suspend */
+	bool ctx_lost;
+
 	bool is_suspended;
 };
 
@@ -1171,7 +1174,10 @@ static int __maybe_unused cppi41_suspend(struct device *dev)
 {
 	struct cppi41_dd *cdd = dev_get_drvdata(dev);
 
-	disable_sched(cdd);
+	if (!pm_runtime_status_suspended(dev))
+		disable_sched(cdd);
+
+	cdd->ctx_lost = true;
 
 	return 0;
 }
@@ -1182,6 +1188,9 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 	struct cppi41_channel *c;
 	int i;
 
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
 	for (i = 0; i < DESCS_AREAS; i++)
 		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
 
@@ -1196,6 +1205,8 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 	cppi_writel(QMGR_SCRATCH_SIZE, cdd->qmgr_mem + QMGR_LRAM_SIZE);
 	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);
 
+	cdd->ctx_lost = false;
+
 	return 0;
 }
 
@@ -1217,6 +1228,9 @@ static int __maybe_unused cppi41_runtime_resume(struct device *dev)
 	struct cppi41_dd *cdd = dev_get_drvdata(dev);
 	unsigned long flags;
 
+	if (cdd->ctx_lost)
+		cppi41_resume(dev);
+
 	spin_lock_irqsave(&cdd->lock, flags);
 	cdd->is_suspended = false;
 	cppi41_run_queue(cdd);

-- 
2.55.0

