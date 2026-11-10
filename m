Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305289;
	b=wCLVhi3kLQHmxCG7zfT94hvyll53FilkxOl7x9/cpETVySzvXqD/rxqxdOE5XLEKPLNZ
	 251H5lkUM/R32Sxo2oslVX1+zWbrsXwX4/1Fpe5qND5JwtJcb738hIULGxMuTEM5UGTvD
	 MM007WbONl6bUYYdNjzWA5yh4sZ0gVZM+LikxoMZIeb05K/AZJ4ZFuYBe62qAeA0fHm5v
	 yeznUnXpefZDtsaWZ609biUjn/PKHK+G8VLSlX5uYTBA9hsy+Sw6Zg/8wbnBJCrzczQx8
	 9AG0lkp73daZFYP5lmPIY+OJkpmYS3KjOB/94lCwrg1jV4r98ZB2uzvyB1bt31WKJPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305289;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OTqb+u/6zluLlOP3I5e/tKiZ+G2oB8lCoDxeE9cs974=;
	b=DOnBcL9SrD2qI9m4C3eLR8+33cu4WiUKT52lAJDasmkK9scWPmDWMkQmQwdGkHVMxW1T
	 n1H0UOlbvTDiIyoX636zy39MDTe7pU4sXPZ8o17ZMZRd0DeG9JGqtXfTK0PPB5XcQQhoh
	 lxIep+LA+ZDLAiCpg8nMxBp9LJyTYp1Wqth5BKM8setM1KwdZUTINfyF4SWIJAMqMFaV/
	 7+E+FASSEuF9SguDwYT99jbIJKQzfTgD4SQzl3oPKABaAmiX+TFqpdm0n3fCTHbpsaZ4q
	 y/1szEkeeimjD/CxCuP+59bFHOkvt2fCgvE3VFk4xh4Q3Dg9R4OskBPcniI0HP22cOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0uGdAZb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9117E60A2602;
	Tue, 10 Nov 2026 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0uGdAZb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305289;
	b=mjLchmhisOZ9utNR2iYyC0qO12e8/rYmajuKxySz11UVgEnUgK2PI57S9iolJxG/DDdr
	 qpxNiytCaH1cEKurnOaysMa7NYofANiuLGLA5LM11+Kr3gVvgwefZH6OX5aCU1fsOErmu
	 yM/iGrdwoT7fNxOKAZJTeYVjSZXtwtodQX2ikT3yuGNWLI2b6Y4WP1DSVNjDpRt1CbP2I
	 lFJ8ZDf6NY1pj45bSFUcEjM1c+lU579vN4UQW8NSv78YSxQklJIE67Ke7DSP8iPUitPiy
	 zR76Npbt0vXc243SDQD1myyhZsqtaBybXlprY8q1EqgayPHsZPBUQpQpKknSAyiHYfw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305289;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OTqb+u/6zluLlOP3I5e/tKiZ+G2oB8lCoDxeE9cs974=;
	b=jHie0Bc2N8OBYYniFnDiJ+iCQXSM/WM6K9Un2eI7I4To9+uy8FBHZ43FkGV8gGCq9wLb
	 /IJ6e21kE4AxkxJ8z9J/ydmMUYp14T4x4Mzct2eGzqvtMdoyQ58+ig4NbsiKNVyuIYAp1
	 EY35E1u8x9RV6Ilx8yzRlI4qEIZpCYUl3sOY33Hw/CO1PTN4C8C+cSDgNzImZ+Y7D/VUJ
	 VG98IuqmQnYDm8ytOpryNNCRxSV6L6Akvw4FJVtNWT5bixdPCwlpBf5C/WN70TmqysGjC
	 EQUlnPS+rN7ZP0sKptXPDrdfm8EB5ImN08U2GIcIkDcgcNbH2mHgDGHTLba1KCKUE2w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC74C1F00921;
	Tue, 10 Nov 2026 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305289;
	bh=OTqb+u/6zluLlOP3I5e/tKiZ+G2oB8lCoDxeE9cs974=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c0uGdAZb8/CN7Ervp+UO+TmjZFZoxNjEhG2ghJvw01KTA2x3X0V9E1AZtNSKYvd6I
	 ZSXO+b94oxPM/i20Xrr0QUzA5za2yi/MG1ndBicF63gqa4vJGPBduIHkEQz9icoULQ
	 C6T7Hc6P4bvRd80xk6Z+FrazALBv/xamFhimRifb8fFJe8Dv8Schai0XB3tEv8BYhw
	 t/Z9hpKke2UV6RDTJmuAChgK5T4Zm6GBBXgLyKvO+nw1pnFIPMV1YO6aSJyPrQQ4P3
	 9rVcs6dk8NZ4HF6QnLuXrYX/syrbDeOG3mAXLtV7SUTFqRN0NKMS3p/4d4iSa2NRDr
	 0xKpH1eyU/URQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F0B4548AE7;
	Tue, 10 Nov 2026 10:08:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:12 +0000
Subject: [PATCH RFC 10/12] media: rockchip: rkvenc: Re-encode oversized
 HEVC pictures
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-rkvenc-v1-10-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=5197;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=CnTD9k51xhPhovXec4M42UtPMZ1lQDg4WDx349udodE=;
 b=UUJtPAINCYJCxhN14fvrq/KWdnnGuiFyM242OcxpOY2HMHNMedmUAWZzgTaGaG52znL8+nheO
 08PQMiNgBj7CcwkIcVJUEdjeOGvHzzmaf2OEqHI1G2Jdb8oCd+yozUP
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Let the constant bitrate mode of the HEVC encode core code a picture far
above its size target a second time, as the Rockchip MPP library does:
once the last pass of the picture finished, ask v4l2_hevc_enc_reencode()
and run the whole picture again with the new QP, writing the slice data
over that of the first pass. The hardware writes the slice header, so the
software headers stay as they are.

A codec backend now returns RKVENC_PASS_AGAIN from next_pass to encode the
whole picture again, which restarts the summed status of the passes, and
RKVENC_PASS_NEXT for the next pass of the same picture.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../media/platform/rockchip/rkvenc/rkvenc-hevc.c   | 24 +++++++++++++++++-----
 drivers/media/platform/rockchip/rkvenc/rkvenc.c    |  6 +++++-
 drivers/media/platform/rockchip/rkvenc/rkvenc.h    | 11 +++++++---
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
index 9baf76f7fc43..acbbfdd3f613 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
@@ -688,19 +688,33 @@ static int rkvenc_hevc_run(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 
 /*
  * The next tile column continues the bitstream right after the previous
- * one, as a slice of its own (the hardware writes its slice header).
+ * one, as a slice of its own (the hardware writes its slice header). Once
+ * the picture is complete, the rate control may have it encoded again with
+ * a higher QP, from the first tile column, over the slice data of the first
+ * encode.
  */
 static int rkvenc_hevc_next_pass(struct rkvenc_ctx *ctx,
 				 struct rkvenc_core *core,
 				 struct rkvenc_run *run)
 {
 	struct rkvenc_hevc_ctx *hevc = ctx->priv;
-	const struct v4l2_ctrl_hevc_pps *pps = &hevc->enc.state_active.pps;
+	struct v4l2_hevc_enc *enc = &hevc->enc;
+	const struct v4l2_ctrl_hevc_pps *pps = &enc->state_active.pps;
 	u64 offset = run->hdr_bytes + run->fb.bs_len;
 
 	if (!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ||
-	    hevc->tile >= pps->num_tile_columns_minus1)
-		return 0;
+	    hevc->tile >= pps->num_tile_columns_minus1) {
+		if (!run->fb.bs_len || offset > rkvenc_dst_size(run) ||
+		    !v4l2_hevc_enc_reencode(enc, offset))
+			return 0;
+
+		rkvenc_set(core, VEPU580_ADR_BSBS,
+			   rkvenc_dst_addr(run) + run->hdr_bytes);
+		rkvenc_hevc_setup_qp(hevc, core);
+		rkvenc_hevc_setup_tile(hevc, core, 0);
+
+		return RKVENC_PASS_AGAIN;
+	}
 
 	if (!run->fb.bs_len || offset + SZ_4K > rkvenc_dst_size(run))
 		return -ENOSPC;
@@ -708,7 +722,7 @@ static int rkvenc_hevc_next_pass(struct rkvenc_ctx *ctx,
 	rkvenc_set(core, VEPU580_ADR_BSBS, rkvenc_dst_addr(run) + offset);
 	rkvenc_hevc_setup_tile(hevc, core, hevc->tile + 1);
 
-	return 1;
+	return RKVENC_PASS_NEXT;
 }
 
 static void rkvenc_hevc_done(struct rkvenc_ctx *ctx, struct rkvenc_run *run,
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.c b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
index a82a22137488..7313523af6b3 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
@@ -965,7 +965,11 @@ static irqreturn_t rkvenc_irq_thread(int irq, void *priv)
 		if (ops->next_pass)
 			ret = ops->next_pass(core->curr_ctx, core, &core->run);
 		if (ret > 0) {
-			core->run.pass++;
+			/* A picture encoded again starts a new status sum. */
+			if (ret == RKVENC_PASS_AGAIN)
+				core->run.pass = 0;
+			else
+				core->run.pass++;
 			rkvenc_hw_start(core);
 			pm_runtime_put_noidle(core->dev);
 			return IRQ_HANDLED;
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.h b/drivers/media/platform/rockchip/rkvenc/rkvenc.h
index c1dce59d8308..8fae10e2c69d 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc.h
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.h
@@ -113,12 +113,17 @@ struct rkvenc_run {
  *	 registers (codec syntax, rate control and references)
  * @next_pass: optional, called after each hardware pass that finished without
  *	       error, with the status of the passes so far summed in @run->fb.
- *	       Returns 1 after updating @core's shadow registers for another
- *	       pass of the same picture, 0 when the picture is complete, or a
- *	       negative error code.
+ *	       Returns RKVENC_PASS_NEXT after updating @core's shadow registers
+ *	       for another pass of the same picture, RKVENC_PASS_AGAIN after
+ *	       setting them up to encode the whole picture again (the status
+ *	       of the passes so far is dropped), 0 when the picture is
+ *	       complete, or a negative error code.
  * @done: called after the hardware finished; @fb holds the status read-back.
  *	  The backend sets the CAPTURE payload and may change @state.
  */
+#define RKVENC_PASS_NEXT	1
+#define RKVENC_PASS_AGAIN	2
+
 struct rkvenc_codec_ops {
 	int (*adjust_fmt)(struct rkvenc_ctx *ctx, struct v4l2_format *f);
 	int (*start)(struct rkvenc_ctx *ctx);

-- 
2.55.0


