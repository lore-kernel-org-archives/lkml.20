Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61D370D57
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294381; cv=none; b=a+jTEAc+lRZ1cLQ7oot283t6SQa7Od796XLCHdfaPn3EsYansaSCK4RDdtvblCMIcW5N9vsbd5GjXTTu2s9Ka2FSBxnLOo8Tf7tWG5CGoGc30xgbrO0pgzgUKakSpO9XtPIhcBTiTQiqf7sCyrJv4tHXTmd411WibN2loqhkFF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294381; c=relaxed/simple;
	bh=cZl8jUmPCC2YDRh4uue366K9dg4z+dvGR3JZ9BCJQ8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ucQp1yngWuZ6cEZ6/lt0lo+4x/aBQjpFRdAx/DhHnqBZexDRafavbhzQr1dwW831x7tFlavnZmur2zhKwaxA6DI2WqOQV+QogO2wlzvcVpcSxEuRixNooIaztkUfmUihxYR+GX9mU7zneCsjCZjL+MdnHsJdY84cPIXxEFxVIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tnb/o9Kz; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tnb/o9Kz"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so1190655ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294380; x=1790899180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+v5BjqCby3H9JvgpWm1j7CmRuzYXHs5Ge9kI+2lfbI=;
        b=Tnb/o9Kz4MAbnj+seNVfD4P7zfnxRlsBdspIpHka6F1PFxV6L3f8vl0CXWX4FqmEqn
         kf6VkAg7jOqcViVULKM3lo2lCbA0ql9qEchxARAuqgMYzeOVcso3lSRIaWKp2HFwnM4S
         UuMYvbKkBPoU2socZzpyGNVkg0+AyAbeWMxod/LLpRIDcrVog7wWIOfQRUnVJs6Nd8PE
         DhrBLdqZkqZta842ivz88adx4MXIPYfTiQqyA8zkPgZTaz3icOeGLA+P8mrd6mTZ1afC
         /YlQMZuvppt9RuSs9Ey2sxgKpm0Qabshkpenp+sUBVEXG16eGqcy4S27qCxPPy1Wkvtq
         DHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294380; x=1790899180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+v5BjqCby3H9JvgpWm1j7CmRuzYXHs5Ge9kI+2lfbI=;
        b=WRjn/c/mcixsTs2yG40wogqAm3KgV1Er9+4GPZAF7jYoUy/PHzjVIOPsXSYd9vgkEs
         Bo6nN69h1ZXW+TSUeNtv3aWRju1gT2zPKqHLciVFPn3oSn3No1Yewo6D0sz12mSpMcYJ
         BRAun0/Wxf6Yk/4n7LjmqtSuDK0I4iMELYobphoiZuPxPuFl1oO1Pd0DRcVpqY8FAThy
         wuUyIoEGr3TCQbsFzB2etpQiHgPHu6kOGdG7Jc0PKjwpzYGCgpKgN57FkDycKNEfpu+E
         q0/QsBBRlMNd29hgeBjfUb4RTYsRtal6XtfpCjxpR43QScYAOpBLhMs59sLYBYP8xVR5
         h2Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzCXMdDSoOpl6AfWhQWIT1geAQ0Fa5M2nkwx0pD8AtNb7cY347ArHNe9B9IppICJE57m3z/fMwowUnJ/ic=@vger.kernel.org
X-Gm-Message-State: AFuF++kU4HgRabaN3IvXZL0EZzKdx+GdLz0dZWNj3ztZlTiaR8kwZ9Km
	ERjaudMplcMnZFg95V8Smg6NSs1Ubjbse3VOAroU0U2uKz+CoL/5R97E
X-Gm-Gg: AYBFou2wa2su17Mqj8SqJZN4OChN3JvWy2Adgi4THrt0nyQJnEsN+lYbaYO4Qv7ACSh
	AQHj7F+DhcFID52CQkr05Qxd8yPfAY1qSYszUMBPHIaK1C1OKxZVNATj7G30qhmVy404aDMoXtw
	xvPDWi7oG8Z25aly5vVQyGZdIf8E4uMzJxGhJbMlV+EbiQYqNGiTJEnnLK6/fK3o7FsPgb/ezGz
	HETz1MzGfQCDJPq+Y72ayPlM/QTrO62oulZtCxtXFPz+TKuzMqQZswhHOMO1UF54QQgAPVL/iHA
	N3pIurBiwQVVM1WpcxQ7nYC4BzOx5G9qDWSRJOdKWv1AA3mLUWpGkBEIRgRQH6f2YE6aAw8U+/K
	rgt5UrbdmUqhCuE4I15scv2N3h67pRQ74rVNggWuUBz7v4lQnoxd7hylWP6PFW02nKkgzDUT4LM
	xiDBXyihoo4gyArhWoM7AKJCqZuGgGkMYDuM0nqBTCRG4LmNOa2VQGfyAiaR47AE8obP1xJP8pH
	eQLMoRFocXu8WOOcLNQbGnDH8q5f6cdfkZd8ZJoTQwRPw1NXsN9pP0ohEqo4B8XkiyDrmZvd0dL
	GgixuznpTOhsAugHx6w0KqLrgp/T2zyoJdyjSVjM6LaJ4NkL
X-Received: by 2002:a17:902:ef12:b0:2dd:b772:57fe with SMTP id d9443c01a7336-2df7da5ce53mr38368675ad.10.1790294379591;
        Thu, 24 Sep 2026 16:59:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm2134785ad.51.2026.09.24.16.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:59:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] crypto: cesa: complete pending requests on device remove
Date: Thu, 24 Sep 2026 16:59:37 -0700
Message-ID: <20260924235937.148475-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mv_cesa_remove() unregisters the algorithms but never drains the engine
queues.  Each engine can still hold outstanding requests in three
places: engine->req (currently in flight), engine->queue (queued but
not started), and engine->complete_queue (processed but not yet
reported).  After unregistration those waiters never receive their
completion callback and block indefinitely, leaking the request and its
scatterlist buffers.

In mv_cesa_remove() stop each engine (mask interrupts, clear the CMD and
TDMA control registers, then wait for the engine to report idle), quiesce
the threaded IRQ with disable_irq()/synchronize_irq(), and drain the
three queues, completing every outstanding request with -ENOENT.  The
completion callbacks unmap DMA buffers through the global cesa_dev
pointer, so keep it valid until the engines are drained, and mark the
engines aborted under their lock so a racing submitter cannot restart a
halted engine.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix a bunch of sashiko errors
 drivers/crypto/marvell/cesa/cesa.c | 80 ++++++++++++++++++++++++++++++
 drivers/crypto/marvell/cesa/cesa.h |  4 ++
 2 files changed, 84 insertions(+)

diff --git a/drivers/crypto/marvell/cesa/cesa.c b/drivers/crypto/marvell/cesa/cesa.c
index 564b09773507..d91e1af0fe9c 100644
--- a/drivers/crypto/marvell/cesa/cesa.c
+++ b/drivers/crypto/marvell/cesa/cesa.c
@@ -52,6 +52,14 @@ static void mv_cesa_rearm_engine(struct mv_cesa_engine *engine)
 
 	spin_lock_bh(&engine->lock);
 	if (!engine->req) {
+		if (engine->aborted) {
+			/*
+			 * The device is being removed: do not restart the
+			 * engine nor fetch any new request.
+			 */
+			spin_unlock_bh(&engine->lock);
+			return;
+		}
 		req = mv_cesa_dequeue_req_locked(engine, &backlog);
 		engine->req = req;
 	}
@@ -542,9 +550,81 @@ static int mv_cesa_probe(struct platform_device *pdev)
 static void mv_cesa_remove(struct platform_device *pdev)
 {
 	struct mv_cesa_dev *cesa = platform_get_drvdata(pdev);
+	struct mv_cesa_engine *engine;
+	struct crypto_async_request *req;
+	unsigned int i;
+	unsigned int timeout;
 
 	mv_cesa_remove_algs(cesa);
 
+	for (i = 0; i < cesa->caps->nengines; i++) {
+		engine = &cesa->engines[i];
+
+		/*
+		 * Stop the engine so it no longer issues DMA to the SRAM
+		 * region or to request scatterlists that are about to be
+		 * unmapped.
+		 */
+		writel(0, engine->regs + CESA_SA_INT_MSK);
+		writel(0, engine->regs + CESA_SA_CMD);
+		writel(0, engine->regs + CESA_TDMA_CONTROL);
+
+		/*
+		 * Flush the posted writes above and wait for the engine to
+		 * report that it is stopped before any buffer is released.
+		 */
+		timeout = CESA_ENGINE_STOP_TIMEOUT_US;
+		while ((readl(engine->regs + CESA_SA_CMD) &
+			CESA_SA_CMD_EN_CESA_SA_ACCL0) && --timeout)
+			udelay(1);
+
+		/*
+		 * Synchronize with the threaded IRQ handler so that it cannot
+		 * run while the queues below are drained.
+		 */
+		disable_irq(engine->irq);
+		synchronize_irq(engine->irq);
+
+		spin_lock_bh(&engine->lock);
+		engine->aborted = true;
+
+		/*
+		 * Complete the request currently in flight and drain the
+		 * pending and already-processed queues with an error so that
+		 * waiters do not block indefinitely when the device is unbound
+		 * while requests are still outstanding.
+		 */
+		if (engine->req) {
+			req = engine->req;
+			engine->req = NULL;
+			spin_unlock_bh(&engine->lock);
+			mv_cesa_complete_req(crypto_tfm_ctx(req->tfm), req,
+					     -ENOENT);
+			spin_lock_bh(&engine->lock);
+		}
+
+		while ((req = crypto_dequeue_request(&engine->queue)) != NULL) {
+			spin_unlock_bh(&engine->lock);
+			mv_cesa_complete_req(crypto_tfm_ctx(req->tfm), req,
+					     -ENOENT);
+			spin_lock_bh(&engine->lock);
+		}
+
+		while ((req = mv_cesa_engine_dequeue_complete_request(engine))
+		       != NULL) {
+			spin_unlock_bh(&engine->lock);
+			mv_cesa_complete_req(crypto_tfm_ctx(req->tfm), req,
+					     -ENOENT);
+			spin_lock_bh(&engine->lock);
+		}
+		spin_unlock_bh(&engine->lock);
+	}
+
+	/*
+	 * The completion callbacks above (and any concurrent submitter) rely
+	 * on the global cesa_dev pointer: only clear it once the engines are
+	 * fully drained.
+	 */
 	cesa_dev = NULL;
 }
 
diff --git a/drivers/crypto/marvell/cesa/cesa.h b/drivers/crypto/marvell/cesa/cesa.h
index 44351b252861..56c0dd6f5772 100644
--- a/drivers/crypto/marvell/cesa/cesa.h
+++ b/drivers/crypto/marvell/cesa/cesa.h
@@ -10,6 +10,9 @@
 
 #define CESA_ENGINE_OFF(i)			(((i) * 0x2000))
 
+/* Max time in microseconds to wait for the engine to stop */
+#define CESA_ENGINE_STOP_TIMEOUT_US		1000
+
 #define CESA_TDMA_BYTE_CNT			0x800
 #define CESA_TDMA_SRC_ADDR			0x810
 #define CESA_TDMA_DST_ADDR			0x820
@@ -450,6 +453,7 @@ struct mv_cesa_engine {
 	struct mv_cesa_tdma_chain chain_sw;
 	struct list_head complete_queue;
 	int irq;
+	bool aborted;
 };
 
 /**
-- 
2.55.0

