Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565528;
	b=Mc5jM3uYoD8EWthsl/ks9WKeDXBi6+jkM5YBzDJh1KPU4JCKn3e7nM+VlKGNMRd7+pwx
	 2JYET7Nu02nFJNmFHCta2n/u8mSOYI/twbkCiyrWaE+B2i0cyLjrd66zO+/0InRrA22j4
	 GfDgsV+/Ir7zMQ91DARjWb55j+fB9IQvPD1rJYOzFhCb1gQr3AyjRLjLkZdeHjPQch9t3
	 X8MMa0n8DoWMOiFQHugVXgrS4GyykgQGDiFGw996X6uSl/kh6NWOVFdo/b8cYVhBzqHT+
	 +uvxJJsptd9QMwYV2jx4fF1rcGMETGwwQ50Q1+aeCtJaJIX8tDgtjRuWJ+Zv0ww0/Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565528;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=34eweslnCjzZk3P3dkb/YboySmeDEbPaEMg/uu7bDtU=;
	b=b0Vy2P4uXUxPyjXmb3V7/1unwCpuAG24+9agWcil+e0PwAVxK7QcLOQIcAih1FuEI39R
	 zdkGrtUNrEAyxl2KyrggkfHtalGXEA/jVj8+LasbW5j4kReLtRbiy6W8OqB4ZLOCSiPie
	 gB4UyS8jJWSOetWJZoRiioAp34/a3V4EIWbzN6am/75idh4oDgGpv2lAlI6srdIuDPOI0
	 hsFfy1nDk5zE840uKk9+bh0CKk02izZZbRU8hRfewJM416L5BZfQd7hsXPgbKNUyq4OrY
	 4tbJzSYT80cytuEXf5vUHkUCm1fQdEPs2LQrEh5vWXh5NmpR2FjfP1AV2c4jM1g/Q6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b="ETh/jPkM";
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ACD606A321;
	Fri, 13 Nov 2026 10:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09ACD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=ETh/jPkM
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 37E5526BC3;
	Fri, 13 Nov 2026 15:25:19 +0500 (+05)
Received: from fedora (5cfcd9fa.dynamic.mv.ru [92.252.217.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id DB0B926BC0;
	Fri, 13 Nov 2026 15:25:16 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru DB0B926BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1794565518; bh=34eweslnCjzZk3P3dkb/YboySmeDEbPaEMg/uu7bDtU=;
	h=From:To:Cc:Subject:Date;
	b=ETh/jPkMCkpuyTeQd9NoMRCMSmMPyJvhxzX8TJuclHoA4bvmDn/X/igsbQMf+16ty
	 uqXnzShJEFYg/oCm9ZP+IplFq6vt2STbQ0vtbtS6o8nbXqLfV0niT3ac7lWsrxfqL2
	 /TP/pRIX2bXQcbrc2fJrkK/2ylyOeGL2rNxm36hDDIyrK6HHFj9Vb4xOq3pYsHkdtw
	 FTfOEqJyNwKbbF3y8ClBDl0tCtz5fJ8o4wLkX/SnR4TiwW/3k2oiz9qa+z18Q/obnx
	 lxPgNZ7rRMzWVNViSheG3kQKWHAKfgrg76xGOeOylUSG0+jWbdlurUx14Z3NIGAEN/
	 Pi6D6amovLGoQ==
From: Alex Kazinsky <a.kazinsky@ideco.ru>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Alex Kazinsky <a.kazinsky@ideco.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v3] media: rkvdec: Handle interrupts without a current context
Date: Fri, 13 Nov 2026 14:24:52 +0400
Message-ID: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
X-Mailer: git-send-email 2.56.0
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

The watchdog can finish the current job before the threaded IRQ handler
retrieves its context. In that case, v4l2_m2m_get_curr_priv() returns NULL,
but the variant IRQ handlers unconditionally dereference ctx->dev.

Pass only the device pointer to the variant IRQ handlers, so they can
acknowledge interrupts without accessing the current context. Retrieve
the context inside rkvdec_job_finish() instead. In the IRQ path, this
happens only after successfully cancelling the watchdog, while the job
is still active.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: f9c7b7deeffd ("media: rkvdec: Support per-variant interrupt handler")
Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
---
Changes in v3:
- Pass only rkvdec_dev to the variant IRQ handlers.
- Retrieve the current context inside rkvdec_job_finish().
- Remove the NULL-context checks from the variant IRQ handlers, as
  suggested by Nicolas Dufresne.

Changes in v2:
- Fix continuation-line alignment in the IRQ handler declarations.
- Clarify that the issue has not been reproduced on hardware and
  describe a possible test.

v2: https://lore.kernel.org/all/20261026124808.642373-1-a.kazinsky@ideco.ru/
v1: https://lore.kernel.org/all/20261023131124.94116-1-a.kazinsky@ideco.ru/

The issue has not been reproduced on hardware. The watchdog/IRQ race
is based on code analysis.

 .../media/platform/rockchip/rkvdec/rkvdec.c   | 26 ++++++++-----------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  3 ++-
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5250dd59df2e..1b43f05b0299 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1089,10 +1089,10 @@ static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
 					 result);
 }
 
-static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
+static void rkvdec_job_finish(struct rkvdec_dev *rkvdec,
 			      enum vb2_buffer_state result)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
 
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
@@ -1176,7 +1176,7 @@ static void rkvdec_device_run(void *priv)
 
 	ret = desc->ops->run(ctx);
 	if (ret)
-		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+		rkvdec_job_finish(rkvdec, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops rkvdec_m2m_ops = {
@@ -1434,9 +1434,8 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
 	}
 }
 
-static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t rk3399_irq_handler(struct rkvdec_dev *rkvdec)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -1452,14 +1451,13 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
 	}
 
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+		rkvdec_job_finish(rkvdec, state);
 
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t vdpu381_irq_handler(struct rkvdec_dev *rkvdec)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	bool need_reset = 0;
 	u32 status;
@@ -1481,14 +1479,13 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 		rkvdec_iommu_restore(rkvdec);
 
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+		rkvdec_job_finish(rkvdec, state);
 
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t vdpu383_irq_handler(struct rkvdec_dev *rkvdec)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	bool need_reset = 0;
 	u32 status;
@@ -1510,7 +1507,7 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 		rkvdec_iommu_restore(rkvdec);
 
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+		rkvdec_job_finish(rkvdec, state);
 
 	return IRQ_HANDLED;
 }
@@ -1518,10 +1515,9 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 {
 	struct rkvdec_dev *rkvdec = priv;
-	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
 	const struct rkvdec_variant *variant = rkvdec->variant;
 
-	return variant->ops->irq_handler(ctx);
+	return variant->ops->irq_handler(rkvdec);
 }
 
 /*
@@ -1607,7 +1603,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	if (ctx) {
 		dev_err(rkvdec->dev, "Frame processing timed out!\n");
 		writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);
-		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+		rkvdec_job_finish(rkvdec, VB2_BUF_STATE_ERROR);
 	}
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..894c18eeb795 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -30,6 +30,7 @@
 #define RKVDEC_8K_PIXELS		(7680 * 4320)
 
 struct rkvdec_ctx;
+struct rkvdec_dev;
 struct rkvdec_rcb_config;
 
 struct rkvdec_ctrl_desc {
@@ -72,7 +73,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 }
 
 struct rkvdec_variant_ops {
-	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
+	irqreturn_t (*irq_handler)(struct rkvdec_dev *rkvdec);
 	u32 (*colmv_size)(u16 width, u16 height);
 	void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, int row_length);
 };
-- 
2.56.0


