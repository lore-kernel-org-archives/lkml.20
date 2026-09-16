Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56412561A2;
	Wed, 16 Sep 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571392; cv=none; b=YcHUdwLf84lDHnLJ3q8K8xNEurrWT+Aa1MZwTS38yaXCNiCn/Zd+Y9s9Ab8S6Z6zDyxH9tfWkZmNDeh8tVOnspyZhaJk2lDvOooC3f2hHdSfz/SGNt0Tt6dwNO/ARDQbSznMOnOijJO54M8gQF03rPwLZfGi5N5YECngfaHPCtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571392; c=relaxed/simple;
	bh=LCfWlMyulSCbWE4yYcWf7ZdZcQMd2XNaUgsH9b4WqKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRrqr7EVzqcRxBEKasHzT9fZoPvQHv24r1xUqq71p4qT4OeJo9cPyBjUHiPuW0+d27dtVAW4K6SCQPsop73qwY3Kt4YF7CLk/JOpVnNOfCoUfbuNqhMgWz1cwAycmf+FMEoWfZmXZ1jKJfW4Fvsp+xEAzFDGK+HiY+65II5T/hY=
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 174532020F4;
	Wed, 16 Sep 2026 17:09:47 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGc-001Fsx-37;
	Wed, 16 Sep 2026 17:09:47 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:42 +0200
Subject: [PATCH v2 01/17] media: rockchip: rga: zero cmdbuf in shared code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-1-23aa2cb74e61@pengutronix.de>
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

Zero the command buffer (cmdbuf) in the shared code instead of the
individual RGA2/RGA3 implementations. Besides centralizing the memset
operation this also uses the cmdbuf_size member for the memset size,
which is also used as the size for the actual allocation.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c  | 2 --
 drivers/media/platform/rockchip/rga/rga.c     | 1 +
 drivers/media/platform/rockchip/rga/rga.h     | 3 +++
 drivers/media/platform/rockchip/rga/rga3-hw.c | 2 --
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index be1bc8ddbd03b..4d7b0a03820a1 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -443,8 +443,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 
 static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
 {
-	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
-
 	rga_cmd_set_mode(ctx);
 	rga_cmd_set_trans_info(ctx);
 }
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b3cb6bf8eb863..bd0afd33affe4 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -41,6 +41,7 @@ static void device_run(void *prv)
 	spin_lock_irqsave(&rga->ctrl_lock, flags);
 	if (ctx->cmdbuf_dirty) {
 		ctx->cmdbuf_dirty = false;
+		memset(ctx->cmdbuf_virt, 0, rga->hw->cmdbuf_size);
 		rga->hw->setup_cmdbuf(ctx);
 	}
 	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index bd431534d0d39..2b4f5694375a4 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -152,6 +152,9 @@ struct rga_hw {
 	u8 stride_alignment;
 	u8 features;
 
+	/*
+	 * Requires that the cmdbuf is already zeroed.
+	 */
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
index c4a71306278ba..46ba6d270f232 100644
--- a/drivers/media/platform/rockchip/rga/rga3-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -261,8 +261,6 @@ static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
 
 static void rga3_hw_setup_cmdbuf(struct rga_ctx *ctx)
 {
-	memset(ctx->cmdbuf_virt, 0, RGA3_CMDBUF_SIZE);
-
 	rga3_cmd_set_win0_format(ctx);
 	rga3_cmd_set_trans_info(ctx);
 	rga3_cmd_set_wr_format(ctx);

-- 
2.55.0

