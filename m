Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E08390CAA;
	Wed, 16 Sep 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571397; cv=none; b=rlQFZiYOUiTtL5XZRidlVAJ3pZuSjBuBCYeVZp8+HtD2NH0hZLqPDnxqCi7NNTCoDlNp41Fh5lTZqs5SpGYu4iLeiGus2RsRVAhRZCyu0DIsmRoXtFMY/ve0k5+lRZ84hMJpbzC25aTe2EoYZgOSTAwJNLEX7/ynsdxAQRZnfz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571397; c=relaxed/simple;
	bh=b8vYvIwZonhhpPmFyxHVDlkAmuTWWgbvt4JU+6Pdmqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JWIyzoEWbEC88tg2ZFuXcD5kgbWogNeAF8ptPXMINtB1HGMKOTurNwUAQVDrBf7jihlItdEHicFpy6jtO+YmUmfS0QGaIV8JCpA40G7nnXOKzVljamTTyIunuBHT68LUV7Mq+eh602Sk3cAn4ARMHNEc6cj2SSDz6G9B650Yc2k=
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 642872059F8;
	Wed, 16 Sep 2026 17:09:51 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGh-001Fsx-0u;
	Wed, 16 Sep 2026 17:09:51 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:48 +0200
Subject: [PATCH v2 07/17] media: v4l2-mem2mem: support running multiple
 jobs in parallel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-7-23aa2cb74e61@pengutronix.de>
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

Add support for running multiple jobs in parallel for SoCs containing
multiple identical devices. An example is the Rockchip RK3588 SoC,
which contains two identical RGA3 devices. Therefore it is desirable to
have the kernel schedule the work across all available devices and only
expose one video device to the userspace.

To avoid queueing too many parallel jobs, the
v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
to set the number of parallel jobs and avoids calling device_run when
the given number of jobs is already running. This is set to 1 by default
to prevent parallel job runs. Drivers with the need and support for
scheduling jobs can adjust this value accordingly.

Note that this change doesn't allow a context to be used multiple times
in parallel. So a single stream won't be able to utilize multiple devices
at once, but N streams can utilize up to N devices. This is caused by the
fact that a context is not added multiple times to the job_list and also
holds the job_flags to distinguish if it's currently running.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- split out the removal of the curr_ctx member
- add EXPORT_SYMBOL to v4l2_m2m_set_max_parallel_jobs
  (indirectly pointed out by Detlev)
- document v4l2_m2m_get_curr_priv being incompatible with parallel jobs
- add documentation comment for the added function
- rework v4l2_m2m_suspend to avoid potential errors due to looping
  outside of a spinlock over the list
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=5)
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 51 ++++++++++++++++++++++++++--------
 include/media/v4l2-mem2mem.h           | 18 ++++++++++++
 2 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 60cca94195166..f1b6255984087 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -88,6 +88,7 @@ static const char * const m2m_entity_name[] = {
  * @job_spinlock:	protects job_queue
  * @job_work:		worker to run queued jobs.
  * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
+ * @max_parallel_jobs:	max job_queue instances number marked as running
  * @m2m_ops:		driver callbacks
  * @kref:		device reference count
  */
@@ -106,6 +107,7 @@ struct v4l2_m2m_dev {
 	spinlock_t		job_spinlock;
 	struct work_struct	job_work;
 	unsigned long		job_queue_flags;
+	u32			max_parallel_jobs;
 
 	const struct v4l2_m2m_ops *m2m_ops;
 
@@ -121,6 +123,13 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_ctx,
 		return &m2m_ctx->cap_q_ctx;
 }
 
+void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
+				    u32 max_parallel_jobs)
+{
+	m2m_dev->max_parallel_jobs = max_parallel_jobs;
+}
+EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);
+
 struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
 				       enum v4l2_buf_type type)
 {
@@ -256,7 +265,9 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
 static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
-	struct v4l2_m2m_ctx *chosen_ctx;
+	struct v4l2_m2m_ctx *chosen_ctx = NULL;
+	struct v4l2_m2m_ctx *ctx;
+	u32 running_jobs = 0;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	if (list_empty(&m2m_dev->job_queue)) {
@@ -271,10 +282,22 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 		return;
 	}
 
-	chosen_ctx = list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_ctx, queue);
-	if (chosen_ctx->job_flags & TRANS_RUNNING) {
+	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
+		if (!(ctx->job_flags & TRANS_RUNNING)) {
+			chosen_ctx = ctx;
+			break;
+		}
+
+		running_jobs++;
+	}
+	if (running_jobs >= m2m_dev->max_parallel_jobs) {
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-		dprintk("Another instance is running, won't run now\n");
+		dprintk("Maximum number of parallel jobs reached\n");
+		return;
+	}
+	if (!chosen_ctx) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		dprintk("All jobs already running\n");
 		return;
 	}
 
@@ -549,19 +572,24 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
 void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
-	struct v4l2_m2m_ctx *curr_ctx;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
-	if (list_empty(&m2m_dev->job_queue)) {
+
+	while (!list_empty(&m2m_dev->job_queue)) {
+		/* Running jobs are always at the start of the queue */
+		struct v4l2_m2m_ctx *first_ctx =
+			list_first_entry(&m2m_dev->job_queue,
+					 struct v4l2_m2m_ctx, queue);
+
+		if (!(first_ctx->job_flags & TRANS_RUNNING))
+			break;
+
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-		return;
+		wait_event(first_ctx->finished, !(first_ctx->job_flags & TRANS_RUNNING));
+		spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	}
-
-	curr_ctx = list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_ctx, queue);
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-
-	wait_event(curr_ctx->finished, !(curr_ctx->job_flags & TRANS_RUNNING));
 }
 EXPORT_SYMBOL(v4l2_m2m_suspend);
 
@@ -1205,6 +1233,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_m2m_ops *m2m_ops)
 	spin_lock_init(&m2m_dev->job_spinlock);
 	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
 	kref_init(&m2m_dev->kref);
+	m2m_dev->max_parallel_jobs = 1;
 
 	return m2m_dev;
 }
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 31de25d792b98..37ffd33b653f2 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -144,6 +144,10 @@ struct v4l2_m2m_buffer {
  * v4l2_m2m_get_curr_priv() - return driver private data for the currently
  * running instance or NULL if no instance is running
  *
+ * It is incompatible with using parallel instances enabled by calling
+ * v4l2_m2m_set_max_parallel_jobs(), as it is undefined which private data of
+ * the parallel running instances is returned.
+ *
  * @m2m_dev: opaque pointer to the internal data to handle M2M context
  */
 void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev);
@@ -594,6 +598,20 @@ static inline void v4l2_m2m_set_dst_buffered(struct v4l2_m2m_ctx *m2m_ctx,
 	m2m_ctx->cap_q_ctx.buffered = buffered;
 }
 
+/**
+ * v4l2_m2m_set_max_parallel_jobs() - adjust the limit of the maximum number of
+ * jobs being run in parallel.
+ *
+ * By default only one job is allowed to be run at any time. A driver with
+ * multiple cores can call this function to (dynamically) adjust this limit
+ * based on the underlying hardware capabilities.
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ * @max_parallel_jobs: maximum number of jobs to queue in parallel
+ */
+void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
+				    u32 max_parallel_jobs);
+
 /**
  * v4l2_m2m_ctx_release() - release m2m context
  *

-- 
2.55.0

