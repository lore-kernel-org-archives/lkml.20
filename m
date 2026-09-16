Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976B1493642
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599930; cv=none; b=IpmGimwD0YmzCjccnVWCbUuaYfvqvK69BnBRzWNkabiqQWeSHOwN+MzXbIXwGOmz2cJDYar2oEapfBnCNE52JhWvPa6JabhDVabvDf6C6ksu1R/2fIKjhTtTnY9+iof2vNREFkJDKEj+sDbiLluecEjxLFMcI91ZykwBol3oPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599930; c=relaxed/simple;
	bh=Z6PcnsznE6aBA3m7fse5WL9XUU+DUmRIKh/4fcjvkIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFIA5t7MEHV4EZ/uXJNXAC8ARPlR7U2U5iJZm+7CvXbo7NXi+dVp7SieCde1zcqNl90RuEpHa8eRpPwschs7MifbnJfoGYnTGrr9a/6jyElgsdgV+qPpFapbBwZOX5S1rTMtBE2btBVmGtBcv15JSUwsvwflDQhTD9Aq/ITaA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J33nf6yG; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J33nf6yG"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso111193a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789599929; x=1790204729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QOMIwZQbx5+TuflTXtQ2GHARtOa9+XMsOBCfGbZ4teI=;
        b=J33nf6yGvVZSLVfcdmVBXk74IoKYL/6HoUxOskj6TVeW74T477SBHo8WTb+YTIM+yt
         1PgRrxC3mgqOy4WPZNcOpBdaU0AhehzouqIfuSQ5d7fsmElKJhgbCHAtBWzGK1syFrPX
         yeayP1FZHwjTbF+LoBGtigGXbFkk0/DDGR0xmHH0pO4eYcZw1LRjUnBkoJgDvHVvlu/n
         PJWXoEiijx/AKLtAR2iLcyHYU8ZsNvWMlfmRIuMKlAyNlVlCA4yY0vSp3EOiyA0PPIUF
         plhRt3/L21aEsiojrD9xfBOnQT4VCF6+eBT6ddJZuWb9hIyLbMRbtEHQTzqm5BB01MRh
         oKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789599929; x=1790204729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOMIwZQbx5+TuflTXtQ2GHARtOa9+XMsOBCfGbZ4teI=;
        b=MJCOQEccJ5LwFFdrWXPXHw7elbk/Lbap+o3ojcnzj1KX6pZaX1qfgNr4Xeqx+oCyDj
         Z29F+sB3wKbQ9u4YdSm0fKYgxO0fLr8jWvMPbpZ/IB4SszY1znjcjRobMCLWQvabTId9
         xsWegs54CDnATtouDBP2gRLlshCgA0uor6jIJPR6VaU5n4y3XSWzHFmW9UvP3kLEAIlD
         VMOM1+cAfJuXira8qM9m5Pk0S//4x622e71vgAvJk3VJgBxGIfPJRZhkx4NbGlKEKkQL
         kRVm+1Wq9+MMQULi6rHtxO5EQoVyYIkfpad0GuasD1MRY4zzILc0HKDnTCVTl+uCMYN5
         9wMw==
X-Forwarded-Encrypted: i=1; AKwUvBzik2NkLZU9JsQ/XKyxbNXIXS5CHulSg6qvh+uGlXwAabZP711XqGZB4OmdZ12TjxKGrdSGd/iI9J6XK4A=@vger.kernel.org
X-Gm-Message-State: AFuF++klQMDK2dE7dklGIc1Uf8FjPZxniv+ga/6walNoWfldL8Zv0XLW
	SClK8ItubMtzVb1vamEAgzDiTJxCOyrzZGYENz3VXyrusvj4Tq+51m4K
X-Gm-Gg: AYBFou3YF1YsqducFgGQwlpQTjKqUcAW1RKPyD54j1zWXP8tns2DEeWh8KZc1FZMo5L
	CG3khtd1+98aPziuMC86sZokEDnGMFFGdoO99sVTAJgvPmRpu7WoGWlFLZUGZ2BBjuNvVjgZHdO
	t5GLQPbZ8vDgs1MY2miybcvkR+rq3CQIMefhCpozM9e55sXEGKKxxMXvXj+ntBtDGmkWfAUR7I8
	j0GKH6ApMduzzbLOt/Noz5FpvQXDWPB0FBSiXqWbgRfy48tjQrZ3KR4VfiYGeYPm6/ee05T2bk2
	Y1tAMaAFlH6FC15813ctMGw2iYVHUfh8xbrG4XGjJTwhqUAuGAnpvwbYlbwPvNnHqp//QgBGVBh
	UkqL1f9BjOTa9loMa68+FUKbtdNmVnN3iOeF+WiI+8tG9ls5M/Ct9KeoFeNZ3NL/pHmvFd/nV/B
	c3uoOyiQFqhzyCYjR7IWZoAKiFhBtBwcTNvn2zma8pY9XmiZQhTjuKyaioztdQf3iq/TX/68SVi
	WnVETDDuZ6tUuJtphx0Uq4FFEOAFGW8HpgHfiDKPPgeT+o+gZ5CXq//RE22Tjl/knl4DAFpDm42
	qxJzMuIIp7n0CVc84VHQEol2iCmyvpnh0hnb7EFcXCTpZLLe
X-Received: by 2002:a17:90b:5445:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e1e23d60dmr9633703a91.1.1789599928755;
        Wed, 16 Sep 2026 16:05:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35daaa93sm1707990a91.2.2026.09.16.16.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:05:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: cesa: complete pending requests on device remove
Date: Wed, 16 Sep 2026 16:05:26 -0700
Message-ID: <20260916230526.284982-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mv_cesa_remove() unregisters the algorithms and frees the IRQs but never
drains the engine queues. Each engine can still hold outstanding requests
in three places: engine->req (currently in flight), engine->queue (queued
but not started), and engine->complete_queue (processed but not yet
reported). The latter two are only completed from the IRQ handler, which
is torn down before they are flushed.

If the device is unbound via sysfs while requests are outstanding, those
waiters never receive their completion callback and block indefinitely,
leaking the request and its scatterlist buffers.

Drain all three queues in mv_cesa_remove() and complete each remaining
request with -ENOENT before freeing the IRQ, so bound tasks are released.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/crypto/marvell/cesa/cesa.c | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/crypto/marvell/cesa/cesa.c b/drivers/crypto/marvell/cesa/cesa.c
index 564b09773507..25a30deca4c5 100644
--- a/drivers/crypto/marvell/cesa/cesa.c
+++ b/drivers/crypto/marvell/cesa/cesa.c
@@ -546,6 +546,52 @@ static void mv_cesa_remove(struct platform_device *pdev)
 	mv_cesa_remove_algs(cesa);
 
 	cesa_dev = NULL;
+
+	for (int i = 0; i < cesa->caps->nengines; i++) {
+		struct mv_cesa_engine *engine = &cesa->engines[i];
+		struct crypto_async_request *req;
+
+		/*
+		 * Stop the engine before releasing resources so it no longer
+		 * issues DMA to the SRAM region or to request scatterlists
+		 * that are about to be unmapped.
+		 */
+		writel(0, engine->regs + CESA_SA_INT_MSK);
+		writel(0, engine->regs + CESA_SA_CMD);
+		writel(0, engine->regs + CESA_TDMA_CONTROL);
+
+		spin_lock_bh(&engine->lock);
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
 }
 
 static const struct platform_device_id mv_cesa_plat_id_table[] = {
-- 
2.55.0

