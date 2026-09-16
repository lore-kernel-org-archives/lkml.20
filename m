Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2867392823;
	Wed, 16 Sep 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571396; cv=none; b=KXvD/quUKTsmUrokPFKHW9qwxvoMjMacVd3dMo117EdXrRT4aedRMa0chHK7BcDQAdVmaSJ0iA2Rjb2N11liM1KwC1TxaLUw1TEm7s21YOH48BHIIRSGlbFGicklXCozga2/LmbtLmDQcgnsXuBWrF43ssc89sHoCi4pRDRSMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571396; c=relaxed/simple;
	bh=nokP+HkAeAsjfnIgakz0YeqhxsbLRHxZzyuuYyYFs6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvxuf3VHYuelhMYQ3MkODqM5H7W0znvDCGMD87D02U+LhMnG69um2LdnhdXs/vZJP92eiROXzPW53c+yMVfhX9NppzjmCbW5rgzY9dpZNMnak8LqQxhdQVuFzE7PNHxGDxTHThO8krcaPPvJTGF/fgNsCu+q5m95WMLeFiw+53k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A68D72059F6;
	Wed, 16 Sep 2026 17:09:50 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGg-001Fsx-1n;
	Wed, 16 Sep 2026 17:09:50 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:47 +0200
Subject: [PATCH v2 06/17] media: v4l2-mem2mem: drop curr_ctx member from
 v4l2_m2m_dev struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-6-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2

Drop the curr_ctx member from the v4l2_m2m_dev struct in preparation of
adding support for running multiple jobs in parallel.

The curr_ctx member of a v4l2_m2m_dev was used to track the
currently running context. But the currently running context will always
be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
check if the queue head is already running, the curr_ctx member can be
completely dropped.

By eliminating the struct member the code is mostly agnostic whenever
only one job is running at a time or multiple run at the same time. The
main exception is the v4l2_m2m_get_curr_priv function, which is by it's
design incompatible with running multiple jobs in parallel.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2:
- split curr_ctx removal into a separate commit
- add WARN_ON to _v4l2_m2m_job_finish to prevent mismatching context to
  device (and an unused m2m_dev argument)
- rewrite v4l2_m2m_get_curr_priv to get private data inside the spinlock
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=5)
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 61 ++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..60cca94195166 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -84,7 +84,6 @@ static const char * const m2m_entity_name[] = {
  *			v4l2_m2m_unregister_media_controller().
  * @intf_devnode:	&struct media_intf devnode pointer with the interface
  *			with controls the M2M device.
- * @curr_ctx:		currently running instance
  * @job_queue:		instances queued to run
  * @job_spinlock:	protects job_queue
  * @job_work:		worker to run queued jobs.
@@ -93,7 +92,6 @@ static const char * const m2m_entity_name[] = {
  * @kref:		device reference count
  */
 struct v4l2_m2m_dev {
-	struct v4l2_m2m_ctx	*curr_ctx;
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_entity	*source;
 	struct media_pad	source_pad;
@@ -232,8 +230,14 @@ void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev)
 	void *ret = NULL;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
-	if (m2m_dev->curr_ctx)
-		ret = m2m_dev->curr_ctx->priv;
+	if (!list_empty(&m2m_dev->job_queue)) {
+		struct v4l2_m2m_ctx *first_ctx =
+			list_first_entry(&m2m_dev->job_queue,
+					 struct v4l2_m2m_ctx, queue);
+
+		if (first_ctx->job_flags & TRANS_RUNNING)
+			ret = first_ctx->priv;
+	}
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
 	return ret;
@@ -252,14 +256,9 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
 static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
+	struct v4l2_m2m_ctx *chosen_ctx;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
-	if (NULL != m2m_dev->curr_ctx) {
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-		dprintk("Another instance is running, won't run now\n");
-		return;
-	}
-
 	if (list_empty(&m2m_dev->job_queue)) {
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 		dprintk("No job pending\n");
@@ -272,13 +271,18 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 		return;
 	}
 
-	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
-				   struct v4l2_m2m_ctx, queue);
-	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
+	chosen_ctx = list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_ctx, queue);
+	if (chosen_ctx->job_flags & TRANS_RUNNING) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		dprintk("Another instance is running, won't run now\n");
+		return;
+	}
+
+	chosen_ctx->job_flags |= TRANS_RUNNING;
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
-	m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
+	dprintk("Running job on m2m_ctx: %p\n", chosen_ctx);
+	m2m_dev->m2m_ops->device_run(chosen_ctx->priv);
 }
 
 /*
@@ -469,15 +473,16 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
 static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 				 struct v4l2_m2m_ctx *m2m_ctx)
 {
-	if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx != m2m_ctx) {
+	if (!m2m_ctx || !(m2m_ctx->job_flags & TRANS_RUNNING)) {
 		dprintk("Called by an instance not currently running\n");
 		return false;
 	}
 
-	list_del(&m2m_dev->curr_ctx->queue);
-	m2m_dev->curr_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
-	wake_up(&m2m_dev->curr_ctx->finished);
-	m2m_dev->curr_ctx = NULL;
+	WARN_ON(m2m_dev != m2m_ctx->m2m_dev);
+
+	list_del(&m2m_ctx->queue);
+	m2m_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
+	wake_up(&m2m_ctx->finished);
 	return true;
 }
 
@@ -548,12 +553,15 @@ void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
-	curr_ctx = m2m_dev->curr_ctx;
+	if (list_empty(&m2m_dev->job_queue)) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		return;
+	}
+
+	curr_ctx = list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_ctx, queue);
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	if (curr_ctx)
-		wait_event(curr_ctx->finished,
-			   !(curr_ctx->job_flags & TRANS_RUNNING));
+	wait_event(curr_ctx->finished, !(curr_ctx->job_flags & TRANS_RUNNING));
 }
 EXPORT_SYMBOL(v4l2_m2m_suspend);
 
@@ -896,10 +904,8 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	q_ctx->num_rdy = 0;
 	spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
 
-	if (m2m_dev->curr_ctx == m2m_ctx) {
-		m2m_dev->curr_ctx = NULL;
+	if (m2m_ctx->job_flags & TRANS_RUNNING)
 		wake_up(&m2m_ctx->finished);
-	}
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 
 	return 0;
@@ -1194,7 +1200,6 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_m2m_ops *m2m_ops)
 	if (!m2m_dev)
 		return ERR_PTR(-ENOMEM);
 
-	m2m_dev->curr_ctx = NULL;
 	m2m_dev->m2m_ops = m2m_ops;
 	INIT_LIST_HEAD(&m2m_dev->job_queue);
 	spin_lock_init(&m2m_dev->job_spinlock);

-- 
2.55.0

