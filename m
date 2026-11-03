Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734695;
	b=baVPheCCY2KrzjJmNycF/8ypcZzTvHBXiA8ovaeKpi4ZWsYHZ8gCXb/6Mw5+5Dl+gb0l
	 tju4OdEUdMtVhhVeapUUH0Q9jUvZXk0BqegRyY2m3boy1FGZlJ8jVeDkraejcI/96M7iQ
	 4pxuh/OJb75Z2Ei+ZE4czKvjJZ6uvtQuAdvTNPPBDbBEYzpg/JFtReA9El8ibx6K3sMUP
	 GkOONyUML1n209/SL1XXsOtxGdZ+yRUBNKkAgqrp/pAUUU+JgJLYcWn1ZQJWRThbfry6r
	 0WhY4ZxQwrcksVxN7GeMtGGmbGmGeTduNiwsbvN668Tq43fRggUPsktZx5o4iEasjsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d4hMQmwIgsvART1qT+lR5n44NTeGYh1EUuuwM0Np57c=;
	b=XQhkKF8ypBTEe2dft0jDPQJrK/BQON/IZG2J2KZ/YIvM+jDegcJuLCHCoQC5GGUEJ6MJ
	 fu2i7l3XwuASGGh2IiFFaUTeoqbR9xDlRteT+pb1dfDxFsPNPUxV1fB4/Lbm85J7gOPGH
	 8ztK7OJgZ9XpJXVEPmmF0M/Is8XHogVP6dz8/+nnijawnceq61Tr/YZKIml8N73Zs/z1l
	 J1rtZzWtELhEXdDzd3i9+QoTZaMnGFn4uWo+5HJD3RTR4aV8k5RcOr8dVzRPO1VrpG6lc
	 +TLK2ZRMrUESvBBhAJDgNHoJ66fTuou9vX1p/KDh6+lul7z4l37/iKIHzaZhshHr3xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d10f2oT1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE83606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE83606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d10f2oT1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so36405015e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734692; x=1794339492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4hMQmwIgsvART1qT+lR5n44NTeGYh1EUuuwM0Np57c=;
        b=d10f2oT1bDEU2Cq8Gs/pPNbUmM+Zy1dXr+ZAb3ZisXWERlzDu60bNTpRpaFkdec4pc
         alF2JIXYmc7Qyvq+ORU7OhTiHVwxqXU0d0Ps65FEbcJepQGJ+Awuggv26P5JZXi2J4py
         84SKut2YMCLT/WHl+vb2GStWKkQ4TDbAjyD3Q138WQSr6kr7+uqy6MRz9O7oO3OvC8hy
         A+8WziwjuEsIQMmGISW+ZkmiHSJUpQx8ScfKIKfHNdaykMqkSb0XBXw854V446TUW91b
         sVwlPqQxD/qfYEW12fT7C0tsygmQO5vq391A4o6wg6rOVWsuMVD72hHW07pXg1OH4e78
         tqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734692; x=1794339492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4hMQmwIgsvART1qT+lR5n44NTeGYh1EUuuwM0Np57c=;
        b=RuH+AzFom46X7dFojdRCYkpagZvIt5fLzjwZW6ife4vhJBBxHeDYwjuh/+VndK3xIA
         HQPjrf8HVYnMC7s5DgIlIpAR07nJ189bVTGcLHu3i29Fz7BtJfURye8OsQ24xO9/C+XZ
         zl/qnVok8ALMtvSXg8rj1/04c9ExhtMs9KvDQRJSPLYT6V//umouDUtWVn2g+JhZyyhO
         1bVPHO/rVZ6DOQpaAG4zPziZk+yWl3xRxXpEylF56bBj8J/ebkCOtUR6BM/W9CVsvVM2
         0PCrs7XeWuXqdP1myvwzujYEuQ6dRIfnrhvEibx3+Ak7X1Twp36UcgTVz77SaVrCeeQ5
         uqWA==
X-Forwarded-Encrypted: i=1; AKwUvByrJ5J/ONpzl23Dl84rvMS3x3jgKMQ7PVy0k+hRSEGS84NmZbfYG5QakBPJV13Co+HQ53zmMSDSNTEsE/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VIj0hFRpLtGIh1oGF/fA3iPM6lPqtSAoHLFkC+ScDS7koJOmu
	YWMXCj5/wEPmflC73lhgNgWgF1NWyQDTt4jo6FAEGbfPxZzClvxNEcGdQmgDdbLgiJc=
X-Gm-Gg: AYBFou2SwNnIgbcJED402rWGsxUIAxkgq5dbQif9jljxcNR4ncA7veiJ0+WoGMazA6O
	mBJqBu5BeD3THIj6fHwFF0/hA0vpMmX32yVNwIXTjTJtqberWuaQsbpsYdhsKFEYRePUK3F4GJc
	qfItCCc67wdkfKbNuyT+kghN6RfHyHQYLA8EhfIVVqK079fK4v+SvfpVnvAb7YffRTZ2VnVCqSL
	tnbopJrbgEq3EDPI6jeaeJC0O4iMa+JJFPoynEfSPqyXoRinSWYdkMPNhd+SoWSGvb+7xiaDvB8
	uY+f5Q5q5FCLQRtHnjCxUAx/Wci8koxOgnH6x35N91nzvswP9b6DrrtKTuJ93HIqoXyZe3C0ERV
	WDoLPqxHlZZm5LOKe1+YZdtoRJQDQ6tmX83C6ba/6oaO5Z5SQfFxTYB+aoetE4JHZV34KsQcGSY
	Qbt25MSmuYit8HCMVk0ZH4rcfrmc8KLvJGsKBfzGA8Uwaibd20Wfutb/GrhIlLofX0L0tWIfPau
	Mfap+jKN+poje/c4ZKx6+CbiH/gxhiWS+//bA3UZaqU4gx3x7/+kSJrt9GZvk4SWYSWPlhmAthc
	ncWIvibCF0komp78OIitMfmRFw==
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr306335255e9.31.1793734692505;
        Tue, 03 Nov 2026 11:38:12 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a98e8f9fsm88604435e9.13.2026.11.03.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:12 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 20:37:31 +0100
Subject: [PATCH 4/4] dmaengine: ti: cppi41: Share register setup with
 resume
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
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-4-d7213446c5f5@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3316; i=msp@baylibre.com;
 h=from:subject:message-id; bh=WMBFq4INcBNu7YqK+yhLsA4zE2pb8zqN0QE1SNt5kRc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFhK1mdy/2jndS05y8+utDSh7Nsk2Y72Lwe3NTzflX
 am8P0u1o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZyO5+RoXuzb/2voM1Z2mez
 lq8RW99cYBq6v4rz85RrKpNlOAQPX2FkeHgibuGCv9v4C7REFCecZG57mc9byH7hmsLOcpc7zTb
 GfAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Both probe and resume basically do the same thing and setup the
registers. But resume has its own copy of the register writes. This will
always lead to differences when changes are made.

Create a separate function that is used by both probe and resume.
Note that the ordering is slightly different but I didn't see or found
any issues with the new order while testing.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/dma/ti/cppi41.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index e2a089066c6d..b62a26c2659d 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -873,9 +873,6 @@ static int init_descs(struct device *dev, struct cppi41_dd *cdd)
 				&cdd->descs_phys, GFP_KERNEL);
 		if (!cdd->cd)
 			return -ENOMEM;
-
-		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
-		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
 	}
 	return 0;
 }
@@ -903,6 +900,24 @@ static void init_sched(struct cppi41_dd *cdd)
 	cppi_writel(reg, cdd->sched_mem + DMA_SCHED_CTRL);
 }
 
+/* Program the registers, also used to restore the context on resume */
+static void cppi41_init_hw(struct cppi41_dd *cdd)
+{
+	int i;
+
+	cppi_writel(cdd->scratch_phys, cdd->qmgr_mem + QMGR_LRAM0_BASE);
+	cppi_writel(TOTAL_DESCS_NUM, cdd->qmgr_mem + QMGR_LRAM_SIZE);
+	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);
+
+	for (i = 0; i < DESCS_AREAS; i++) {
+		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
+		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
+	}
+
+	cppi_writel(cdd->td_queue.submit, cdd->ctrl_mem + DMA_TDFDQ);
+	init_sched(cdd);
+}
+
 static int init_cppi41(struct device *dev, struct cppi41_dd *cdd)
 {
 	int ret;
@@ -913,16 +928,11 @@ static int init_cppi41(struct device *dev, struct cppi41_dd *cdd)
 	if (!cdd->qmgr_scratch)
 		return -ENOMEM;
 
-	cppi_writel(cdd->scratch_phys, cdd->qmgr_mem + QMGR_LRAM0_BASE);
-	cppi_writel(TOTAL_DESCS_NUM, cdd->qmgr_mem + QMGR_LRAM_SIZE);
-	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);
-
 	ret = init_descs(dev, cdd);
 	if (ret)
 		goto err_td;
 
-	cppi_writel(cdd->td_queue.submit, cdd->ctrl_mem + DMA_TDFDQ);
-	init_sched(cdd);
+	cppi41_init_hw(cdd);
 
 	return 0;
 err_td:
@@ -1187,26 +1197,15 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 {
 	struct cppi41_dd *cdd = dev_get_drvdata(dev);
 	struct cppi41_channel *c;
-	int i;
 
 	if (pm_runtime_status_suspended(dev))
 		return 0;
 
-	for (i = 0; i < DESCS_AREAS; i++) {
-		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
-		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
-	}
-
 	list_for_each_entry(c, &cdd->ddev.channels, chan.device_node)
 		if (!c->is_tx)
 			cppi_writel(c->q_num, c->gcr_reg + RXHPCRA0);
 
-	init_sched(cdd);
-
-	cppi_writel(cdd->td_queue.submit, cdd->ctrl_mem + DMA_TDFDQ);
-	cppi_writel(cdd->scratch_phys, cdd->qmgr_mem + QMGR_LRAM0_BASE);
-	cppi_writel(QMGR_SCRATCH_SIZE, cdd->qmgr_mem + QMGR_LRAM_SIZE);
-	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);
+	cppi41_init_hw(cdd);
 
 	cdd->ctx_lost = false;
 

-- 
2.55.0

