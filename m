Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316651;
	b=nJMGOkWQKu95wpsiLEu8vTQE5rGdgHC3RfS6pA8tQhtC1FMexVsNz/djjkK4bvyuHNKR
	 5c0mL0jBOm9wB9xd+N5Rc8BEs+lMr58Itt0gMPtXlz5Sh3ks/2FDcMhj1TlEfQvyloVWY
	 77IuFwB3KvES57TphVhkcjzQ2CDt3QeGTEWGC200tnZJs6Cc3B31g/xa0UEncD0m7N/Gp
	 spAFOzVP8ENUv0n6K4mKS+Ivf+jCe5iQaScBxmQCV004djkrEwGQSfsAhJjFmlRdfotda
	 G6G8w9uXL09JTAvXCSpvf8odWHe7xZqEwlAAgkXC2KBsyD5Z/WLYl7aKNkDJpTxbiRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
	b=Qgi0+CmkMZLtg8YVQ1KlJswew6CC94gInEvxsZ07XwqLotQNQagNA/FMx+AvO5IFgXUY
	 r0uVgYATTv/v1gGUV2KoPdNrkQFZLRb9w9EsJC/fmCKyQagxA/pGVRjTzMzhJB6CwWFHD
	 z6honotS8PvxQBoVoAva66PM2IULGov7gw5k9xcNR3WmLLBszetlAzuoT2EKdoV5Lzn1Z
	 30G9nJ8TFs8HbnFACMt0Em7LNQnkIq9s3KirLvJ24GS5a4tEdvXzO82t96bL4+y6wBWr2
	 3MHLHU7WDNaVzTpegFNFMPXcUeUIh915lFyswSJ9At/WOks70WPMRGQ8kCrOAjuAQJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwqZ+l7P;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C466072A0C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C466072A0C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwqZ+l7P
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso989772a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316651; x=1794921451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
        b=hwqZ+l7Ps+KRYUGIvP07EumEH2t42cEuZ/4Sqch3YflI2QnBexnmBFTxioaM2IPW9Z
         0FIeg8IctMBQm+pDLaHrEjl218GqSmEfRQIMnlWEMLrB5/A0+iXR+YK4xqVKiY5POVjT
         FDG6xBNKaEN90oUvA2We854jVaTt9SJNxEenG8gxVShYMYgkvdemDMqD+WDjUGIIdXJq
         6MWabFFizpwUQf8qIqT1hXuGmkMOes0m82ft4vZDYC7/doPc1he44EX6xMhR7rB1Hj81
         t2cEc9jJkOjyX+hNBGOBrqHEs7qfmoHYgmSTpydLQIiFh2FeJO3NMjswyZJG0VQ8pkBD
         jpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316651; x=1794921451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
        b=Eo+Gn0mVG2T5VpI5ZTm72JGeUkITHVbFv3pNJ58EiiPUPY87IuF4UZS/BXfzwqi49K
         fidJzRd6OFkIvdhXHZWWKPuYPWu6lMUFOEbXtWayQhBkVUsjongM+urVngb2ZzL+b75s
         g61RlX2+mB4WvZ8dzAm2krdM1HttbsvkCwdMPGCclzF3f2tZIbTjYZlKxnOX1QMl6cRa
         gXylSnU6Vb/Mt6Ar+ROh10wtwIYRUj3VJPqObwEiNUEift1ylGZkNkhdtY6z6SK76UZW
         yesTtWPfPKrY4hY6M0uG8T9wk39uh6cidrTeKErllgrmTegq57WTuz30eEt/sHYoGJ/I
         YWvA==
X-Forwarded-Encrypted: i=1; AL+hErGHdAA0XN9lUXp2te/M3tCt6YWvTSNqDGlyc4/wQ+YPTkC+Gkw3Q4hHvEC54upxhfy9DasRoxNbjRWp4dU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GCQaAy27D+KxUTkumDUXkeK7pEQXvbp9mdio6OlbRsrGy0+qx
	e/mfz28WJxDqO7zm5BfE0AUYK3VEN+quh49BfVIcoC0txY7KTzJmeH+/
X-Gm-Gg: AYBFou3NdRdFDqEpkC1Bpm5304qTovSch/QE9Vr8tbnmwDcHtfjWpsCtN5JMFLCI8L7
	nXCH2BlZ4nKSMZA9JnFTqwihCfeNciV7ap83r0OMh2UdC/6QacDlGrlreaJGDh4Ny6WVIs4GERp
	SESYYOVYsC/BMmRQuAYdF9jQQXbUZOPzila8IfPv9NE4iG2oGuiw92QZcVPUdMCjF5YmuNb9s9c
	oaqd1Na0Gc95BOn1Q+wcNz7LTT9oQJ088YBD6QRFaKX4z/L/vxpEl0+5F6BRBHNMU1fnXyx+fh7
	wKUcoT+v8IIcMuS9xkylbfBAf8xstrPv0mBuxzcwwOaQQXtAUUX0LT8/a3AmZA+e2AtvJbS1lYX
	DNRobIIfhdPsRKNqhyQ/UyPda0dnUTQEljqm/pfpt2ijNEZ+Nhv1n5t5fNaORw4bq2xg5g2c89v
	SRmcoZ5L/7Mg82ibARAlTDAb+jhYM6ju0BKGo7klVd5pVkvgE+7yJ2dFIpShSzsPBlw6H/HLeAU
	p0JXiWvOXibVy1ic7GY58dPds77EIBoXbTfQv3herIjiGUxJGXtuTTx6s1zKPL8p8gQH4RXH2ls
	cTj8VAdv07gOPT5EkhuIHSf7jclSNCR/
X-Received: by 2002:a17:90a:e7c8:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b166d1a008mr2747340a91.52.1794316650614;
        Tue, 10 Nov 2026 05:17:30 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:30 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sinan Kaya <okaya@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 31/33] dmaengine: hidma: defer callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:31 -0800
Message-ID: <1654bf0a77be77ccf3a2775a838d1accf604ac4e.1794315350.git.allen.lkml@gmail.com>
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

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work.

Since callbacks no longer run synchronously from hidma_callback(), drain
the BH wherever the driver previously relied on that ordering: provide a
device_synchronize() callback so dmaengine_terminate_sync() waits for
deferred callbacks, drain the BH in hidma_free_chan_resources() before
the descriptors are freed, and drain it in hidma_remove() before
hidma_ll_uninit() tears down the TRE pool that the completion path
reads. Kill the low-level completion tasklet before that drain, since
it is what schedules the BH.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 85844965f0d8..2cde0cd08b1f 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -155,6 +155,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
 	}
 }
 
+static void hidma_chan_bh(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan = to_hidma_chan(chan);
+
+	hidma_process_completed(mchan);
+}
+
 /*
  * Called once for each submitted descriptor.
  * PM is locked once for each descriptor that is currently
@@ -181,7 +188,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dmaengine_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +210,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
@@ -529,6 +537,11 @@ static int hidma_terminate_all(struct dma_chan *chan)
 	return rc;
 }
 
+static void hidma_synchronize(struct dma_chan *dmach)
+{
+	dmaengine_kill_bh(dmach);
+}
+
 static void hidma_free_chan_resources(struct dma_chan *dmach)
 {
 	struct hidma_chan *mchan = to_hidma_chan(dmach);
@@ -540,6 +553,9 @@ static void hidma_free_chan_resources(struct dma_chan *dmach)
 	/* terminate running transactions and free descriptors */
 	hidma_terminate_channel(dmach);
 
+	/* drain completion work before the descriptors go away */
+	dmaengine_kill_bh(dmach);
+
 	spin_lock_irqsave(&mchan->lock, irqflags);
 
 	/* Move data */
@@ -813,6 +829,7 @@ static int hidma_probe(struct platform_device *pdev)
 	dmadev->ddev.device_pause = hidma_pause;
 	dmadev->ddev.device_resume = hidma_resume;
 	dmadev->ddev.device_terminate_all = hidma_terminate_all;
+	dmadev->ddev.device_synchronize = hidma_synchronize;
 	dmadev->ddev.copy_align = 8;
 
 	/*
@@ -913,6 +930,7 @@ static void hidma_shutdown(struct platform_device *pdev)
 static void hidma_remove(struct platform_device *pdev)
 {
 	struct hidma_dev *dmadev = platform_get_drvdata(pdev);
+	struct dma_chan *chan;
 
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	dma_async_device_unregister(&dmadev->ddev);
@@ -922,6 +940,10 @@ static void hidma_remove(struct platform_device *pdev)
 		hidma_free_msis(dmadev);
 
 	tasklet_kill(&dmadev->task);
+	/* the low-level completion tasklet schedules the channel BH */
+	tasklet_kill(&dmadev->lldev->task);
+	list_for_each_entry(chan, &dmadev->ddev.channels, device_node)
+		dmaengine_kill_bh(chan);
 	hidma_sysfs_uninit(dmadev);
 	hidma_debug_uninit(dmadev);
 	hidma_ll_uninit(dmadev->lldev);
-- 
2.43.0

