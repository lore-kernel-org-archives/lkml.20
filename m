Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839403B3884
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790544202; cv=none; b=ZHaUFSUk+A19+ZlwzLN2bFAL3lbTRoKX5OKCJG7ccZzb0t77mj2D/aKetWzbugPRRgWMf2FrVYqXuvvPqtFbB4zNkAHVc7U1bQsAeEsPTcIj9bD+0RH9x5SqrDDGGfWCCBV4zEzTxJ7U+mfcB5z9PrNZqPEqbdxdjzRMjpHclOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790544202; c=relaxed/simple;
	bh=foOUMokXhV1YQBZj9rrq42ml0ef1GpGSyOYE2PlIZwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvGBXDpo6o/OExsO/+vA4yJlLpDr7qCMFn8OgevYJ9T13X9YTti7Ts5/Zr1pu9SOP8X4wPz2Y1uq0hBKnwo0yRdR6HBeomttrUrY4qWt0jCF/hVoPbnfF1hihX96ndaydyIw8zpx87Y7nKuhm6UmQWQqnfneK2gBWYWikrES2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0DK75ig; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0DK75ig"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ad20d4so306443185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790544199; x=1791148999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQle37WXzAyJLdjrbjf8ZmAmcyTiuSmhV+wDo26Cq+o=;
        b=i0DK75igeDP/ILiFyg4SfYiXkTKahQT8VAr93q00EDsMfVrkLAx0AQIDQ5BaGm/3f0
         LcE33YnvfHL1fmBbq0DzaH5jtaVbhq94Q1YqjFn2uqs9weiUYep/Je9ihiLYG2b/2+Id
         MBjCNtvPzRfhgudcRn3G1dITBNlboQvl5YOgy9dkwmcO3Q8fCNhpHhLWJpiUXhhe0Nzc
         mdP6Rxo8ooW1GsrLI/Ak30Yxfja8H/XrNmXATzlnPgXJoxdnUk7pfWTikD8z7y+fJ+O0
         Q8fBaAD0heAzPBrcgXGe+9JLGNljf1D/+pSnPWqc71GJaxzchqwNlSH41Dpaa1AFntEI
         uALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790544199; x=1791148999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQle37WXzAyJLdjrbjf8ZmAmcyTiuSmhV+wDo26Cq+o=;
        b=P+zsQkvktlLIYfkAqmQ1h5I65T+lewewbfBw6SEersxlnp3qth3ZuYTiF8tpd3hfTp
         ssc1ZBT0bLc4zRfHoBXD6KXTDhQIB7AXTNAXuHoDHpDN+05RHvJNd0mKcklPBVQ99r68
         tNOHjDw1Udd9xtfRtqiyYXiPBXLeaiELXJNCL5pTsus+vOPFnkXJJidlPzlmyRlXfugB
         DITK2y86L3ix40bCRPcViSxcUfGiyvt9R3CLhCoWLunODZ8nVrxZoQ87XmEAa6pBQmQ8
         DyftYn/POFBU5aqIrCmdk1LtZKMQ7bHkxwiFspis/hv58gum+XJ8uvCNbyjAQ3K4AqB9
         mqBA==
X-Forwarded-Encrypted: i=1; AKwUvBxT2h9lkCHMzLVSz+TMPuwNY5OP2cPT2puSh4v8rme9w1jUrEcPi3MyBhQfDFg6Sx6UU1FQMufZ3E+6alI=@vger.kernel.org
X-Gm-Message-State: AFuF++nZSfb2dpVrlXxVDv9iRYcLD6HP2fu6+FiLRhUaiUtMy4Vvwi/f
	HUoFFw1thvIn81N1Bw26gKTk1mFlUohaUdZHi08Q60HuAyTzWNK2A9wC
X-Gm-Gg: AYBFou2uuvwLRa73bfitx0MTND4j1zH8rr6jTdjtNcwO6BqrJYSX1hcl3oijhtPBxjv
	Bw7Cw9HwIh4mZHTOWfvxd8A1kIKCUTsWkagGbVsLFL0kBxpxhakRBQO6DPUI3kjfIO4A71nsw6s
	IcbtRSsz5IbvYHw+XkfLWCVISK2e4i9YGlE4/kmBjR0uclvShm5LaD/A2qTuBLXA+aAwcGObspU
	0/oeR/F+IYq3ht4vJpa+PLBjCFPVmlL8UxQNcai0UEIXwnb3WMhH8O6ZYnDqc91N1Qf9Y4RapM8
	etCW7sKn87kiRdGyXH7rkvgtSgrRQGWLZffjSzWEg3Qev2hLvd8Ykgp37ZNp0Fx8jHkLBzvYTS0
	HIEWiSbjGid6ukPFBzhl9DZpvUcvDyInCy0+pfSWivNagMqs3tcR1912Yfxv4ZSIP1/5TDGgB7I
	rHJ4h5jlUH0PzYeVMctOK4dTJG2q7DmcF9eki/yzl9NlOU/8hESPTitKZo3KICGgybi2XtGc0pD
	4E88NmJTBubJruhtYSwztybNb4y72io8azLQgNgHVT2F9kdBY1N01OLuD1gVWaBdXr2nox81Asr
	gXyykYFR5Rgfunt6WrdbF6ttUXK4dCK9Rns8uq+XrjyP/LnS
X-Received: by 2002:a05:620a:4113:b0:93c:7e9c:3b3b with SMTP id af79cd13be357-93c7e9c3d27mr59350585a.25.1790544199332;
        Sun, 27 Sep 2026 14:23:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c44972febsm701974885a.39.2026.09.27.14.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:23:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] crypto: cesa: complete pending requests on device remove
Date: Sun, 27 Sep 2026 14:23:15 -0700
Message-ID: <20260927212315.113966-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mv_cesa_remove() unregisters the algorithms but never drains the engine
queues, so waiters of requests that were in flight, queued or already
processed block forever once the device is unbound.

Quiesce the IRQ with disable_irq(), mark the engine aborted so no rearm
or new submission can restart it, stop it and wait for it to go idle.
Drain engine->req and engine->queue with -ENODEV, the error
mv_cesa_queue_req() now returns to new submissions, and report
engine->complete_queue as successful because ctx->ops->complete() has
already copied their result out. All of them go through
mv_cesa_complete_req(), so ctx->ops->cleanup() still releases their DMA
mappings and descriptors. cesa_dev is cleared last, as those callbacks
unmap through it.

mv_cesa_dma_cleanup() now stops at dreq->chain.last. mv_cesa_tdma_chain()
links requests queued back to back and only mv_cesa_tdma_process() severs
the link, so a request that never ran still points at its successor and
would otherwise free its tdma_desc_pool and op_pool objects twice.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: fix more errors
 v2: fix a bunch of sashiko errors
 drivers/crypto/marvell/cesa/cesa.c | 120 ++++++++++++++++++++++++++++-
 drivers/crypto/marvell/cesa/cesa.h |   4 +
 drivers/crypto/marvell/cesa/tdma.c |   9 ++-
 3 files changed, 131 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/marvell/cesa/cesa.c b/drivers/crypto/marvell/cesa/cesa.c
index 564b09773507..aacbc7d0aa0b 100644
--- a/drivers/crypto/marvell/cesa/cesa.c
+++ b/drivers/crypto/marvell/cesa/cesa.c
@@ -11,11 +11,11 @@
  * Sebastian Andrzej Siewior < sebastian at breakpoint dot cc >
  */
 
-#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/genalloc.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kthread.h>
 #include <linux/mbus.h>
 #include <linux/minmax.h>
@@ -51,6 +51,17 @@ static void mv_cesa_rearm_engine(struct mv_cesa_engine *engine)
 
 
 	spin_lock_bh(&engine->lock);
+	if (engine->aborted) {
+		/*
+		 * The device is being removed: do not restart the engine nor
+		 * fetch any new request. This has to be checked before
+		 * looking at engine->req, otherwise a request that is still
+		 * in flight would be stepped again and put the engine back
+		 * to work on descriptors the removal path is about to free.
+		 */
+		spin_unlock_bh(&engine->lock);
+		return;
+	}
 	if (!engine->req) {
 		req = mv_cesa_dequeue_req_locked(engine, &backlog);
 		engine->req = req;
@@ -168,6 +179,14 @@ int mv_cesa_queue_req(struct crypto_async_request *req,
 	struct mv_cesa_engine *engine = creq->engine;
 
 	spin_lock_bh(&engine->lock);
+	if (engine->aborted) {
+		/*
+		 * The device is being removed: reject new requests instead of
+		 * leaving them queued without a completion.
+		 */
+		spin_unlock_bh(&engine->lock);
+		return -ENODEV;
+	}
 	ret = crypto_enqueue_request(&engine->queue, req);
 	if ((mv_cesa_req_get_type(creq) == CESA_DMA_REQ) &&
 	    (ret == -EINPROGRESS || ret == -EBUSY))
@@ -542,9 +561,108 @@ static int mv_cesa_probe(struct platform_device *pdev)
 static void mv_cesa_remove(struct platform_device *pdev)
 {
 	struct mv_cesa_dev *cesa = platform_get_drvdata(pdev);
+	struct mv_cesa_engine *engine;
+	struct crypto_async_request *req;
+	unsigned int i;
+	int ret;
+	u32 val;
 
 	mv_cesa_remove_algs(cesa);
 
+	for (i = 0; i < cesa->caps->nengines; i++) {
+		engine = &cesa->engines[i];
+
+		/*
+		 * Quiesce the threaded IRQ first: disable_irq() waits for any
+		 * handler in flight to complete, so no completion, rearm or
+		 * dequeue can still be running past this point.
+		 */
+		disable_irq(engine->irq);
+
+		/*
+		 * Mark the engine aborted while still under its lock.  Once
+		 * this is visible no request can be dequeued or enqueued and
+		 * the engine cannot be restarted by software, so halting it
+		 * below leaves it stopped.
+		 */
+		spin_lock_bh(&engine->lock);
+		engine->aborted = true;
+		spin_unlock_bh(&engine->lock);
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
+		 * Flush the posted writes above (readl) and wait for the
+		 * engine to report that it is stopped before any buffer is
+		 * released.  If it never stops, the DMA-visible objects below
+		 * cannot be freed safely; report the failure rather than
+		 * silently continuing.
+		 */
+		ret = readl_poll_timeout(engine->regs + CESA_SA_CMD, val,
+					 !(val & CESA_SA_CMD_EN_CESA_SA_ACCL0),
+					 1, CESA_ENGINE_STOP_TIMEOUT_US);
+
+		WARN_ON_ONCE(ret);
+
+		spin_lock_bh(&engine->lock);
+		/*
+		 * Complete the request currently in flight and drain the
+		 * pending queue with the same -ENODEV that
+		 * mv_cesa_queue_req() uses to reject new submissions, so that
+		 * waiters do not block indefinitely when the device is unbound
+		 * while requests are still outstanding.
+		 */
+		if (engine->req) {
+			req = engine->req;
+			engine->req = NULL;
+			spin_unlock_bh(&engine->lock);
+			mv_cesa_complete_req(crypto_tfm_ctx(req->tfm), req,
+					     -ENODEV);
+			spin_lock_bh(&engine->lock);
+		}
+
+		while ((req = crypto_dequeue_request(&engine->queue)) != NULL) {
+			spin_unlock_bh(&engine->lock);
+			mv_cesa_complete_req(crypto_tfm_ctx(req->tfm), req,
+					     -ENODEV);
+			spin_lock_bh(&engine->lock);
+		}
+
+		while ((req = mv_cesa_engine_dequeue_complete_request(engine))
+		       != NULL) {
+			spin_unlock_bh(&engine->lock);
+			/*
+			 * The engine has processed these and
+			 * ctx->ops->complete() has already copied their
+			 * result to the request buffers, so they must be
+			 * reported as successful. They still hold their DMA
+			 * mappings and descriptors, so they have to go
+			 * through the regular completion path.
+			 */
+			mv_cesa_complete_req(crypto_tfm_ctx(req->tfm), req, 0);
+			spin_lock_bh(&engine->lock);
+		}
+
+		/* Drop the descriptor links into the pools we just freed. */
+		engine->chain_sw.first = NULL;
+		engine->chain_sw.last = NULL;
+		engine->chain_hw.first = NULL;
+		engine->chain_hw.last = NULL;
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
diff --git a/drivers/crypto/marvell/cesa/tdma.c b/drivers/crypto/marvell/cesa/tdma.c
index 243305354420..de07f2bf51f1 100644
--- a/drivers/crypto/marvell/cesa/tdma.c
+++ b/drivers/crypto/marvell/cesa/tdma.c
@@ -76,7 +76,14 @@ void mv_cesa_dma_cleanup(struct mv_cesa_req *dreq)
 			dma_pool_free(cesa_dev->dma->op_pool, tdma->op,
 				      le32_to_cpu(tdma->src));
 
-		tdma = tdma->next;
+		/*
+		 * Stop at the end of our own chain. Requests queued back to
+		 * back are linked together in mv_cesa_tdma_chain() and the
+		 * link is only severed once the engine reaches the previous
+		 * request's END_OF_REQ descriptor, so a request that never
+		 * ran may still point at its successor.
+		 */
+		tdma = (old_tdma == dreq->chain.last) ? NULL : old_tdma->next;
 		dma_pool_free(cesa_dev->dma->tdma_desc_pool, old_tdma,
 			      old_tdma->cur_dma);
 	}
-- 
2.55.0

