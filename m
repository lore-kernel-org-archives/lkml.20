Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305291;
	b=nxvSes0mebj/XwBAnB0aLFIuo6wHC4wmUEbWJ5Nhv+44M86P6tBYAROryw4rRP77y9SC
	 yGDsYQEeJF0DiozyPG9JQGvGt9u7JWuPNFf5y25PcC6JpSMaVJjtSyoL6hD8Lqc4HeZrL
	 h+j1pzLNPQbpq2kUpqm2hcFyszHF9sedFuawoeWH04wtsddck8InSvADsqd2ub/F5lntU
	 5Zq3X7RmbOWKJOR48PfmSdJbGXJ16iwNFdA9XhJAkbc6j35PThoM1QZN0dEYshiKo3AEN
	 5WbHlyXJo+tEiDhZ/UPrV+5Qpq5YZ91KK/TGOTF+VpW9OF56aM6T4CgLQzhDo4IudFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305291;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nofB0KTSBzPImVqMXFW4fi1iB3SNUF6zZo9ksZEEd5w=;
	b=ZtcfBAPjQL2VHYKa4Tr0aCPOLieSpwsScYJE4r1msGo45MO/hMAmjcHi+dFQQ53/CZGI
	 m0zr6iFbYvAoDtHfqpO5ZlXd0yCmYrfq6XT55aTQt8l3PMwFZZNb1NvSdTl6tE9gIlGwy
	 Biu40l7RjuQP0ZS0NKJI4M6843T7WCqgIGgvq4A3Q9uOPmAwHLhMhwhsyGw2jjFbp/Ijn
	 8CDQur+9kLZXaa+DU4eey1leR+C80bgCWzkDLXDvgk1Sus4zps/jFqOb+DK46ps3OmENl
	 wlUsN6DDwrgodGvVSL2l7hYRGJW6UVI5YXvG9gyDxTtvcoaoZpqcO7iZ/iWTby9q27Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEvkdNTI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCCF60A263E;
	Tue, 10 Nov 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEvkdNTI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305290;
	b=viZ9wpRePPVDTqaWRacNY6AlIdW9UVsUG8QYyZtIjyt9r1Uh7YuUADfy6lRE5NnAgGkN
	 DT6LBZPu+IkgotgwVhqGJW1cOpG3sMSscQ7EorERTGLvVCceq/wklY3gpaUVtETOgxvk5
	 37rRrM5JuDd/AQzLSqTPIX/GLbMuGdR0pf0M5nQ6U4anztI2BKBUq+q9zpVTGMKwOWWqp
	 aFOlbrY6rhK3eJfwbQYs8SxljszcvaTiYP3F6kfZtvTboV2lo9RYJiTYntS+RnXYjctOK
	 zXQtILv8WfCPjF1XWpEIg/OzWB8gX4SjSEgFQzS3bL/C6bldzhKadYFTvBVLxt4oNSA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305290;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nofB0KTSBzPImVqMXFW4fi1iB3SNUF6zZo9ksZEEd5w=;
	b=CqNM0BwPk1s65W8A1Z+zV6AJ65TwhrPBy3uzjJM4Ut36HobvgEA5wFdtnBoisq0KHHby
	 vBRyGDh+9nd1kmWXG4cGO2oKJcD89JmR59NptxqD2cEtpnCuwLTVIIBY56/I4UkdGtsAW
	 ZdhMhAPr2EC1zWXSvC2z2lX9+wJbkeOihdPpEGtT1fcYSqrj53gXnk92kmXbz2f3Imy5B
	 wWxuew5Dpa8UhEgNDcK7lHxWbELgZ+aI+Lgho6WM0P9snYgxHLfvGTLtKxvOGBaF2spiW
	 F+adoKNC9TkX3elC8VvFemCEicXGM+LNVo+KtOY82eGzJHQKUOvDJr07nUGX1onPLPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC68C1F00904;
	Tue, 10 Nov 2026 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305290;
	bh=nofB0KTSBzPImVqMXFW4fi1iB3SNUF6zZo9ksZEEd5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LEvkdNTI63hYo1ERgXTniAA9Cyr19Uvn6HH1b5zuREW1CWt6LKNA8v0RFVvLzC/Xp
	 F/5yNtWw4nX08hrEBYFnCkHrDmEvGgWiIPVwC5UjmgWDe4w/E9wRYnr3BxqbCO+3gS
	 G3imodTpG/kf51dzfS9a12W89bsAgr9qKzKeqW6u79gpb138brIleeScFodA7/GZx+
	 j8jEBhU7GYoLOj0Oe5BjfHH224iJfBEim6z1AJCqWV05h7pUE5zK+H73wmGg4QuHkS
	 yqb6XiHXDvaVsMZkMOI2URr97TVLyBaxFztYUiRVv10FyUeM1f9H2azE1uwGqoClBi
	 BOooNz5XibaYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DEA8D48AE3;
	Tue, 10 Nov 2026 10:08:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:11 +0000
Subject: [PATCH RFC 09/12] media: rockchip: rkvenc: Limit the QP of the
 HEVC I pictures to 15..51
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
Message-Id: <20261110-rkvenc-v1-9-ea8b47122d8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=4902;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=nzRroLyTR3LHObcUYhvHk+s1nb5TLThp8XYLPeVz9WI=;
 b=l9yS0DDt5begQJkokDdkchuL6PbD2r0zXcU8kfYrOM/QTLy7cq8lOqkaCeRafnQOwf8MxJkEU
 UJGE4M3QSrRDorWFMp+xJFpx/fOAK7Ck2mD1M6LuBnpWm0+K1dxasfc
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

As the Rockchip MPP library does by default for HEVC, keep the I pictures
of the frame rate control at QP 15 or above, while the P pictures may go
down to 10: add the I picture QP limit controls, with the defaults 15 and
51. The hardware row rate control of an I picture gets the same limits.

Move the QP setup of the picture to a function of its own.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../media/platform/rockchip/rkvenc/rkvenc-hevc.c   | 61 +++++++++++++++-------
 1 file changed, 41 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
index 27006e393121..9baf76f7fc43 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
@@ -567,6 +567,43 @@ static void rkvenc_hevc_setup_tile(struct rkvenc_hevc_ctx *hevc,
 		   buf + (tile ? tile - 1 : 1) * hevc->tile_buf_size);
 }
 
+/*
+ * QP of the picture. In CBR mode the size target of the frame rate control
+ * is handed to the hardware CTU row rate control, which adapts the QP of
+ * each CTU row by up to the row_rc_qp_range parameter, within the QP limits
+ * of the picture type.
+ */
+static void rkvenc_hevc_setup_qp(struct rkvenc_hevc_ctx *hevc,
+				 struct rkvenc_core *core)
+{
+	struct v4l2_hevc_enc *enc = &hevc->enc;
+	const struct v4l2_hevc_enc_state *state = &enc->state_active;
+	bool intra = state->encode.slice_type == V4L2_HEVC_SLICE_TYPE_I;
+	unsigned int qp_range;
+	int qp_min, qp_max;
+
+	rkvenc_update(core, VEPU580_ENC_PIC, VEPU580_ENC_PIC_PIC_QP, 0);
+	rkvenc_update(core, VEPU580_HEVC_SYNT_SLI1, VEPU580_HEVC_SLI1_SLI_QP,
+		      FIELD_PREP(VEPU580_HEVC_SLI1_SLI_QP, enc->qp));
+
+	qp_range = min(READ_ONCE(rkvenc_row_rc_qp_range), 15U);
+	hevc->hw_rc = state->frame_rc_enable &&
+		      state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR &&
+		      qp_range;
+	if (!hevc->hw_rc) {
+		vepu580_setup_fixed_qp(core, enc->qp);
+		return;
+	}
+
+	qp_min = intra ? state->qp_min_i : state->qp_min;
+	qp_max = intra ? state->qp_max_i : state->qp_max;
+	vepu580_setup_row_rc(core, &rkvenc_hevc_row_rc, enc->qp,
+			     clamp(qp_min, 0, 51), clamp(qp_max, 0, 51),
+			     qp_range, enc->cbr.target_bits,
+			     state->width_ctbs * state->height_ctbs,
+			     state->width_ctbs);
+}
+
 static int rkvenc_hevc_run(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 			   struct rkvenc_run *run)
 {
@@ -574,7 +611,6 @@ static int rkvenc_hevc_run(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 	struct v4l2_hevc_enc *enc = &hevc->enc;
 	const struct v4l2_hevc_enc_state *state = &enc->state_active;
 	struct rkvenc_rec_buf *rec, *refr = NULL, *col = NULL;
-	unsigned int ctus, qp_range;
 	bool intra, tmvp, colmv_stor;
 	int ret;
 
@@ -591,7 +627,6 @@ static int rkvenc_hevc_run(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 		return -ENOSPC;
 
 	intra = state->encode.slice_type == V4L2_HEVC_SLICE_TYPE_I;
-	ctus = state->width_ctbs * state->height_ctbs;
 
 	rec = enc->ref.buffer_current.private_data;
 	if (!rec)
@@ -645,24 +680,7 @@ static int rkvenc_hevc_run(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 			      colmv_stor, col && col->colmv_valid);
 	vepu580_setup_hevc_tuning(core, intra);
 
-	/*
-	 * In CBR mode the size target of the frame rate control is handed to
-	 * the hardware CTU row rate control, which adapts the QP of each CTU
-	 * row by up to the row_rc_qp_range parameter.
-	 */
-	qp_range = min(READ_ONCE(rkvenc_row_rc_qp_range), 15U);
-	hevc->hw_rc = state->frame_rc_enable &&
-		      state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR &&
-		      qp_range;
-	if (hevc->hw_rc)
-		vepu580_setup_row_rc(core, &rkvenc_hevc_row_rc, enc->qp,
-				     clamp(state->qp_min, 0, 51),
-				     clamp(state->qp_max, 0, 51), qp_range,
-				     enc->cbr.target_bits, ctus,
-				     state->width_ctbs);
-	else
-		vepu580_setup_fixed_qp(core, enc->qp);
-
+	rkvenc_hevc_setup_qp(hevc, core);
 	rkvenc_hevc_setup_tile(hevc, core, 0);
 
 	return 0;
@@ -807,6 +825,9 @@ static const struct v4l2_ctrl_config rkvenc_hevc_ctrl_cfgs[] = {
 	},
 	{ .id = V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP, .max = 51, .step = 1, .def = 10, },
 	{ .id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP, .max = 51, .step = 1, .def = 51, },
+	/* I pictures of the frame rate control: 15..51 as in MPP */
+	{ .id = V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP, .max = 51, .step = 1, .def = 15, },
+	{ .id = V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP, .max = 51, .step = 1, .def = 51, },
 	{ .id = V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP, .max = 51, .step = 1, .def = 30, },
 	{ .id = V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP, .max = 51, .step = 1, .def = 32, },
 	{ .id = V4L2_CID_MPEG_VIDEO_AVERAGE_QP, .max = 51, .step = 1, },

-- 
2.55.0


