Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C4392C25;
	Wed, 16 Sep 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571395; cv=none; b=SzO/BRXI6S6k0dSDWBfeEh99EzxdVTGkDNuL8R6zYswfoQCcTXUghwNBbdnpJvOx5JduzPZ/JWqj6WxB3vQIpv8SeF3CXDa495JuUxxrqTZmFG6RmjDtKoUKkN+6vu1J7Gu2H+GfIDObPK+m2If3VGqf4dcOpmSOYCsNc0WjOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571395; c=relaxed/simple;
	bh=mdWzl/Ow+GuOloQXpteITJ1YNj09nrOSxskSEWFP0ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baUvFF28XbBSqxK1OSoISf/txvCeWgvpZ0OniGTrsyTSN6Y9xa7pYawJcOVHLBbCSfTGZXWa3PfwGnorr3bQ6JJjsTIZpOML5ZDt3DOKh1wV+K8+JGq7F8AgkdOp5ph45oYqHlW9hhS2MdUdqWATSl/DaUIxBUsWVlbSoTf/woY=
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2277C2059FA;
	Wed, 16 Sep 2026 17:09:52 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGi-001Fsx-01;
	Wed, 16 Sep 2026 17:09:52 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:49 +0200
Subject: [PATCH v2 08/17] media: rockchip: rga: move power handling to
 device_run
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-8-23aa2cb74e61@pengutronix.de>
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

Move the power handling to the device_run function in preparation for
enabling multiple cores. This allows to power the only the necessary cores
instead of powering all available cores.

As the decision on which core the given job is executed will be done in
device_run, we can only power to correct core there.

To avoid unpowering the core in a streaming state switch to autosuspend.
This avoids powering down the core when the next frame is scheduled in
the next 50ms. The timeout maps to a framerate of 20fps, which should be
pretty uncommon in a normal video stream.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- also set autosuspend flag with pm_runtime_use_autosuspend
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=6)
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 12 ------------
 drivers/media/platform/rockchip/rga/rga.c     | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index c0ea6003336bf..3f7c3c68e0cb8 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -242,14 +242,6 @@ static int rga_buf_prepare_streaming(struct vb2_queue *q)
 static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct rga_ctx *ctx = vb2_get_drv_priv(q);
-	struct rockchip_rga *rga = ctx->rga;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(rga->dev);
-	if (ret < 0) {
-		rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
-		return ret;
-	}
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ctx->osequence = 0;
@@ -261,11 +253,7 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 
 static void rga_buf_stop_streaming(struct vb2_queue *q)
 {
-	struct rga_ctx *ctx = vb2_get_drv_priv(q);
-	struct rockchip_rga *rga = ctx->rga;
-
 	rga_buf_return_buffers(q, VB2_BUF_STATE_ERROR);
-	pm_runtime_put(rga->dev);
 }
 
 const struct vb2_ops rga_qops = {
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index d7f0712177b70..c24bc8e26b91e 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -37,6 +37,14 @@ static void device_run(void *prv)
 	struct rockchip_rga *rga = ctx->rga;
 	struct vb2_v4l2_buffer *src, *dst;
 	unsigned long flags;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(rga->dev);
+	if (ret < 0) {
+		v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
+						 VB2_BUF_STATE_ERROR);
+		return;
+	}
 
 	spin_lock_irqsave(&rga->ctrl_lock, flags);
 	if (ctx->cmdbuf_dirty) {
@@ -81,6 +89,8 @@ static irqreturn_t rga_isr(int irq, void *prv)
 		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
 		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
 		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
+
+		pm_runtime_put_autosuspend(rga->dev);
 	}
 
 	return IRQ_HANDLED;
@@ -801,6 +811,9 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	pm_runtime_set_autosuspend_delay(rga->dev, 50);
+	pm_runtime_use_autosuspend(rga->dev);
+
 	rga->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rga->regs))
 		return PTR_ERR(rga->regs);

-- 
2.55.0

