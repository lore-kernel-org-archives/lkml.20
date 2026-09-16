Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CB381E84;
	Wed, 16 Sep 2026 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571703; cv=none; b=HDYwhVO1x2L239Lp3UfxQiVbW+AIq2/X0izDqQ4sXQG657Q1ZWAQ8t4I2IM31tR82pLGTR+0KEshepnTxGUitCRhWt6tllLhK68JHbQ0Doi3EpywW4hfsN62/rd+HKygXDC/xj1HtE1qpxkq9QGjdHzOi8INQINSCrdUvdxVjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571703; c=relaxed/simple;
	bh=8/JFR7SViEhASw4/EUA55yLQovWOsRkldENr6I2by+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxxiyWTlDPIjjxgIhDyRg/j8cz282uJHvtj2jyEUe+U/jD/TTAAogqjJkKhMkWeHZPJL2awTWJbwg9ShE3Igcd3E4ZrtoeldbE5cFD62ImW4pYCBBUFhmjoVYGdIZaHYUFYBfE9/HIbZkiGPHd3Z+kSSXVbbv+c6US86OtWGUn4=
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8F694205A02;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGo-001Fsx-1s;
	Wed, 16 Sep 2026 17:09:58 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:58 +0200
Subject: [PATCH v2 17/17] media: rockchip: rga: schedule jobs to multiple
 cores
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-17-23aa2cb74e61@pengutronix.de>
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

Schedule jobs to multiple cores to utilize all RGA cores. To avoid race
conditions when selecting the next free core a dedicated spinlock is added.

Note that this doesn't increase the max frame rate of a single
stream, as a context will wait for the job to finish before starting
the next device_run call.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- Set core->curr to null first in pm_runtime_resume_and_get error path
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=15)
- Also protect adding/removing cores with the spinlock in bind/unbind
---
 drivers/media/platform/rockchip/rga/rga.c | 30 +++++++++++++++++++++++++++---
 drivers/media/platform/rockchip/rga/rga.h |  1 +
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b2eeae0a61771..6294825eaacfd 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -38,13 +38,29 @@ static void device_run(void *prv)
 {
 	struct rga_ctx *ctx = prv;
 	struct rockchip_rga *rga = ctx->rga;
-	struct rga_core *core = rga->cores[0];
+	struct rga_core *core = NULL;
 	struct vb2_v4l2_buffer *src, *dst;
 	unsigned long flags;
 	int ret;
+	unsigned int i;
+
+	spin_lock_irqsave(&rga->cores_lock, flags);
+	for (i = 0; i < rga->num_cores; i++) {
+		if (!rga->cores[i]->curr) {
+			core = rga->cores[i];
+			core->curr = ctx;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&rga->cores_lock, flags);
+
+	WARN_ONCE(!core, "No free core although max parallel jobs matches the core count!\n");
+	if (!core)
+		return;
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0) {
+		core->curr = NULL;
 		v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
 						 VB2_BUF_STATE_ERROR);
 		return;
@@ -58,8 +74,6 @@ static void device_run(void *prv)
 	}
 	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 
-	core->curr = ctx;
-
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	src->sequence = ctx->osequence++;
 
@@ -748,6 +762,7 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	struct rockchip_rga *rga = data;
 	struct rga_core *core = dev_get_drvdata(dev);
 	struct rockchip_rga_version version;
+	unsigned long flags;
 	int ret = 0;
 
 	core->rga = rga;
@@ -785,7 +800,9 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_put(core->dev);
 
+	spin_lock_irqsave(&rga->cores_lock, flags);
 	rga->cores[rga->num_cores++] = core;
+	spin_unlock_irqrestore(&rga->cores_lock, flags);
 
 	return 0;
 }
@@ -796,6 +813,7 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 	struct rga_core *core = dev_get_drvdata(dev);
 	struct rockchip_rga *rga = core->rga;
 	u8 i;
+	unsigned long flags;
 
 	/* Remove our core from the list */
 	for (i = 0; i < rga->num_cores; i++) {
@@ -810,8 +828,10 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 				iommu_detach_device(domain, core->dev);
 		}
 
+		spin_lock_irqsave(&rga->cores_lock, flags);
 		rga->cores[i] = rga->cores[rga->num_cores - 1];
 		rga->num_cores--;
+		spin_unlock_irqrestore(&rga->cores_lock, flags);
 		break;
 	}
 
@@ -977,6 +997,9 @@ static int rga_bind(struct device *dev)
 		goto rel_m2m;
 	}
 
+	/* after binding all cores num_cores has the proper number of cores */
+	v4l2_m2m_set_max_parallel_jobs(rga->m2m_dev, rga->num_cores);
+
 	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
 		  vfd->name, video_device_node_name(vfd));
 
@@ -1047,6 +1070,7 @@ static int rga_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
 
 	spin_lock_init(&rga->ctrl_lock);
+	spin_lock_init(&rga->cores_lock);
 	mutex_init(&rga->mutex);
 
 	dev_set_drvdata(dev, rga);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 522021c3e0249..b046083244bf6 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -86,6 +86,7 @@ struct rockchip_rga {
 	struct mutex mutex;
 	/* ctrl parm lock */
 	spinlock_t ctrl_lock;
+	spinlock_t cores_lock;
 
 	const struct rga_hw *hw;
 

-- 
2.55.0

