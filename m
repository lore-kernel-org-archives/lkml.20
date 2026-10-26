Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018945;
	b=0ewIJwdy15VfbdlYU+sdThTQRquwicjSFBQI62qWtPqTZsacVxLhIaX6n31gmbF/m0OS
	 6Fh0kcUHDXdvSWzGZLy2HXYyznBWBCsHsX4xw/4Q8DzvIpd8MFBdteCSBe+AY0HmYGSnP
	 v0p9KEohf+He2wiqeGL0yfuNBrZNvhfIk4TRNFl3j7d5qyzt+athBX/wEb4QqwHPEbisE
	 xAYEYr1BmU0z0OtiH5xhikvJ4vsr3xqAxnbcbHxpPZ0yC1IndV7ttUXwfCkf64CLHnHe+
	 /PVmFqlwTCwuAcYWg88SqpwvQ2f9CEfS9hjKKnO6UNWPkbcuhX6m25BiMPgGwcgs7Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018945;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x3tZrNEj6Izrz6Ol6so5T/1/B/wLw4Q2nD05/ulbAI4=;
	b=J3d7v/6Dx7Oio2dWAesAyjTEYG3ZfmMryd81SyQFrYcO+GYAjmCOWPLdu7A2tkykggpb
	 12QukwcNja11XKRGvLzD6qcn2JYmutrzjbIMMgAg/kkg9HOfc2l9SY89TTX6/kvM9fePf
	 1NOBybR9JbpecASlbJpPtg/CiSt1VR5040dBZv3HyzyOiCw6iQI/mUbmm4wCuzTFFbmj0
	 e1D6aYPwwXrjEOhUY62JU/BNwbfRresHf5jOyfdwGEKHkIrMlczhtTHhzY+ZH/ye83i15
	 QwToTmI9ICqKzQ9l0/XwkRJ87jF5YWhBT74h4vcxwQk/IUrDXlGFKaKazIXoYAe0Ixg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=ZnG4lyXx;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C12606A31A;
	Mon, 26 Oct 2026 12:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=ZnG4lyXx
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 1B9B618A4E;
	Mon, 26 Oct 2026 17:48:55 +0500 (+05)
Received: from fedora (5cfcac1b.dynamic.mv.ru [92.252.172.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 723C133363;
	Mon, 26 Oct 2026 17:48:25 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru 723C133363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1793018934; bh=x3tZrNEj6Izrz6Ol6so5T/1/B/wLw4Q2nD05/ulbAI4=;
	h=From:To:Cc:Subject:Date;
	b=ZnG4lyXxmaYqab22+7p1mNqqmEpiLAp4nPsQqZmK24/PYwag4HNi05WuXboXdSxSE
	 gMAttKm6++CN3tGJ890xlA8WhE3zbE5muBfE33sJmxI2obZqMzrswYkXQsuMG3EWlc
	 7KsiHQxW7e08SBJ+F5Ul1vj0pO0Jii88M0K/LoP5ePoX40hv8BMBA/hMPbAzQ5mWnD
	 5bmy8jvDhn2qqn4fYJM4j3Sv7uG/holFmNbn0WxUiRzqWol8G8z1E6azBqMID9hOyL
	 +UMySHZpUvRmZ9z1cFvwAd/tTd0TtQvf01pcdz4r/De9GRNS17u6Pp9VBcyexkIG0R
	 vQjudsoFN9q1Q==
From: Alex Kazinsky <a.kazinsky@ideco.ru>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Alex Kazinsky <a.kazinsky@ideco.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] media: rkvdec: Handle interrupts without a current context
Date: Mon, 26 Oct 2026 16:48:07 +0400
Message-ID: <20261026124808.642373-1-a.kazinsky@ideco.ru>
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

Pass the device pointer to the variant IRQ handlers independently of the
context. Clear the interrupt status and, for VDPU383, disable interrupts
before returning if no current context exists. This avoids dereferencing
NULL while still acknowledging the interrupt.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: f9c7b7deeffd ("media: rkvdec: Support per-variant interrupt handler")
Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
---
Link to v1: https://lore.kernel.org/all/20261023131124.94116-1-a.kazinsky@ideco.ru/

This issue has not been reproduced on hardware. The watchdog/IRQ race
described above is based on code analysis.

A possible test would be to submit a single decoding job and temporarily
delay the IRQ thread before v4l2_m2m_get_curr_priv() for longer than the
watchdog timeout. This would artificially widen the suspected race window.
This experiment has not been performed.

Changes in v2:
- Fix continuation-line alignment in the IRQ handler declarations.
- Clarify that the issue has not been reproduced on hardware and
  describe a possible test.

 .../media/platform/rockchip/rkvdec/rkvdec.c   | 23 +++++++++++++------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  4 +++-
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..da4ed7bde05c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1434,15 +1434,18 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
 	}
 }
 
-static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t rk3399_irq_handler(struct rkvdec_dev *rkvdec,
+				      struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	u32 status;
 
 	status = readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
 	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
 
+	if (!ctx)
+		return IRQ_HANDLED;
+
 	if (status & RKVDEC_RDY_STA) {
 		state = VB2_BUF_STATE_DONE;
 	} else {
@@ -1457,9 +1460,9 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t vdpu381_irq_handler(struct rkvdec_dev *rkvdec,
+				       struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	bool need_reset = 0;
 	u32 status;
@@ -1467,6 +1470,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 	status = readl(rkvdec->regs + VDPU381_REG_STA_INT);
 	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
 
+	if (!ctx)
+		return IRQ_HANDLED;
+
 	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
 		state = VB2_BUF_STATE_DONE;
 	} else {
@@ -1486,9 +1492,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t vdpu383_irq_handler(struct rkvdec_dev *rkvdec,
+				       struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	bool need_reset = 0;
 	u32 status;
@@ -1499,6 +1505,9 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, 0),
 	       rkvdec->link + VDPU383_LINK_INT_EN);
 
+	if (!ctx)
+		return IRQ_HANDLED;
+
 	if (status & VDPU383_STA_INT_DEC_RDY_STA) {
 		state = VB2_BUF_STATE_DONE;
 	} else {
@@ -1521,7 +1530,7 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
 	const struct rkvdec_variant *variant = rkvdec->variant;
 
-	return variant->ops->irq_handler(ctx);
+	return variant->ops->irq_handler(rkvdec, ctx);
 }
 
 /*
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..8bcb51db5105 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -30,6 +30,7 @@
 #define RKVDEC_8K_PIXELS		(7680 * 4320)
 
 struct rkvdec_ctx;
+struct rkvdec_dev;
 struct rkvdec_rcb_config;
 
 struct rkvdec_ctrl_desc {
@@ -72,7 +73,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 }
 
 struct rkvdec_variant_ops {
-	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
+	irqreturn_t (*irq_handler)(struct rkvdec_dev *rkvdec,
+				   struct rkvdec_ctx *ctx);
 	u32 (*colmv_size)(u16 width, u16 height);
 	void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, int row_length);
 };
-- 
2.56.0


