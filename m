Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305122;
	b=sMmT0NM3Q/gk3y+8J3WP4RzxbjNsFzNNCO0zWdGdHbLLzlYdTLDzflcuoK81av1Whwkx
	 lOC+63wY+IWFRXV35x43EMIuYzPdN4GOtAV1FXRKg5zzmgvU7GUfrc7fsQAwKD/xO0jZB
	 Clt+9txRoiF+NKZVaZ77AyqldjCB3glFalqWymQXjxieRkCV6gSeT0gJd84/Nca/F1Tk0
	 WrKuo4LwsB9Y+xkqqG8OT+CQPiPftrLFtQlYVMHsCfT6mo+KQWresKZTmj5XXnWiDTqEh
	 JRnq/X4koI9og0vqKzNgeilvIYfIH2vBVmKqvLUQXqBx79iTliyMGZGbvT+CpVw28Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305122;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B6tsTtNJ7eSxCtbobBtZhv4ltSXxm3THjly+TFG5UKo=;
	b=2pHrmBBJZoFb2+YuLbB5TYGlqZfT19F+3DLW4pa812aBGQ9CxWK6/huVNdK5565FIuYB
	 a1ihKX5uSrQ8JdDVLxgx1AxxVrDOp49nqELuXTS2LruUbV4HQ4P9GbO0zK13vaP6OuBgO
	 DcoYe0S90C0gLGADLsE8trXIlq2BHd57s+V532xZVXRa3PDoF5F1SyBlCEwWQoEcu3q6m
	 v2mUsqNbs9UmeF74J9ittTu9FsfXkVcOJeWtE7LGqTTjBV0Y1FooALEM8Gm00+dGnLHVW
	 uzbx4zsZepI/XXwb48NqA1ZSecyRCcWrcosct70DIDbQcSrbl0IlR+91ZxQJUCaQSFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwzji1En;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268460A261D;
	Tue, 10 Nov 2026 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwzji1En
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305121;
	b=b9kfhyCA8ct1eoOIv+C8NnOOhM+9op6o76ZKghXjGad26kVuebp6y5pzv02WIAyoQdu6
	 ji+rnLfM/rGBl030EsymasIQ/dnqbNVkhZauYKivV/oWrjkH8HodXUORiMHGg12OkWYSP
	 6nFRsSRWtJSZvzmzjnrF3X8VIDlsTdE2dzCgBo1ggPZXhNyzDdIJ6eGWCEXlqSzc3aOIg
	 w5W9qZ9si5kYD8dC84KwQsm/V9ly5tFZrp2GG6MfBjCF4gLd7lhFHjzmjCG4XvWm3+E85
	 DjiXWWUE1bLSRp1j3zQnd92kjcS0QvmV11poFPUFj8P7hG2NNkyvvbaM8BqPMfil15g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305121;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B6tsTtNJ7eSxCtbobBtZhv4ltSXxm3THjly+TFG5UKo=;
	b=MJ/F2Bf5p/l1Pv8+d7t4c5JucLtHbQq+2AV31WZoYmk9WjQGFarZ5Tdb8mmqTwTBm/Si
	 VIaRB1qyd65n8ppDbNTfDXMzVi5bvSRhv1xTTkJjOtbzoujSVViKtaMrxgU99qt9Gycrx
	 Eu7q7EiNfqDb8pwXz5c+V7z9TAIpLxfjqSPxLvvbtd+t3jxI0RbzebV6anw/9WGfRG4h+
	 IuS6mhR6JPF2taxKC09TfUNy7HRPGibaIuj2pmXR8ku4azaiRmDRCo9aLLWUK2uBy4tUX
	 wCbbFCthsm3I7VT7bC/wSgXGD2V8R+pEGWoErrXAEJ1ZtsvScyxGffqra0uKa91JLBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A16161F008BF;
	Tue, 10 Nov 2026 10:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305121;
	bh=B6tsTtNJ7eSxCtbobBtZhv4ltSXxm3THjly+TFG5UKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nwzji1EnG0CZnvOqf9vQIr/a7nuJbcw/f4PLeGueRS0tu20PgNLhvmFQYWagWvccx
	 y/ipo1EGsPEQQMDFi8B1P0ZKr+WqUflA7B0clLSAMOijXmCMr1fC15oTYSaaID+oQs
	 qrs/PyF2/ITtKH9vE/ytP38FnqzHSbl+zooqBz7R0tZD9d+RD9gzBvffQt3AapH6g3
	 nFdVN3N4yeJZ7OxbN9JhPjokVjpWucd4rynwqnznDn380eTw7GDNN/b6HYSHk9hUqP
	 NCaYSca/Z34V/tGl9oxgtjRRQN7OrLHKWzhgiJGSScTB5ZUawgLrTOOAJhGhOK+18z
	 3BpaIe80BDY1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 52C4848AA6;
	Tue, 10 Nov 2026 10:05:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:05:25 +0000
Subject: [PATCH RFC 11/11] media: h264: Add a VBR mode to the stateless
 encode rate control
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
Message-Id: <20261110-h264-encode-fixes-v1-11-7a64486df499@gmail.com>
References: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
In-Reply-To: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305116; l=2597;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=supRZTl1AvC00lV2bzX7xn0VFI0B/bSEPB87pSRgFFQ=;
 b=xHWnw7KxUwqWPaqyeTwDZiHs3gWXjvAJANgbHO5qQKsCy39hZlO6aaXqIOqFE53x2OGnAXSdc
 8DMBmtKzErnAx/bgxY38dLt64TsPAUQR9goCZ1q0Mv85LWJ5tcN+MUG
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The core reads V4L2_CID_MPEG_VIDEO_BITRATE and _BITRATE_PEAK for
V4L2_MPEG_VIDEO_BITRATE_MODE_VBR, but has no mode for it, so a driver
offering VBR fails the first picture with -EINVAL.

Add one with the encode rate control and its peak bitrate: the bitrate is
met on average and every second stays within the peak (a peak below the
bitrate counts as the bitrate). Drivers offer it with the VBR entry of
V4L2_CID_MPEG_VIDEO_BITRATE_MODE and V4L2_CID_MPEG_VIDEO_BITRATE_PEAK.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-h264-enc-rc.c | 24 ++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-h264-enc.c    |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-h264-enc-rc.c b/drivers/media/v4l2-core/v4l2-h264-enc-rc.c
index c4f1718ead0e..691c80c2a950 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc-rc.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc-rc.c
@@ -218,10 +218,34 @@ static const struct v4l2_h264_enc_rc_mode cbr_mode = {
 	.complete	= cbr_complete,
 };
 
+/*
+ * Variable bitrate mode: the same rate control with the peak bitrate, which
+ * meets the bitrate on average and keeps every second within the peak.
+ */
+static int vbr_measure(struct v4l2_h264_enc_rc *rc, unsigned long *size)
+{
+	struct v4l2_h264_enc_state *state = rc->state;
+
+	v4l2_enc_cbr_set_peak(&rc->cbr, max(state->bitrate_peak,
+					    state->bitrate));
+
+	return cbr_measure(rc, size);
+}
+
+static const struct v4l2_h264_enc_rc_mode vbr_mode = {
+	.name		= "variable bitrate",
+	.type		= V4L2_H264_ENC_RC_TYPE_VBR,
+	.init		= cbr_init,
+	.measure	= vbr_measure,
+	.estimate	= cbr_estimate,
+	.complete	= cbr_complete,
+};
+
 static const struct v4l2_h264_enc_rc_mode *modes[] = {
 	&direct_mode,
 	&cq_mode,
 	&cbr_mode,
+	&vbr_mode,
 };
 
 static int mode_prepare(struct v4l2_h264_enc_rc *rc)
diff --git a/drivers/media/v4l2-core/v4l2-h264-enc.c b/drivers/media/v4l2-core/v4l2-h264-enc.c
index 9745c0e85ee5..66473231df94 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc.c
@@ -1273,7 +1273,8 @@ static int rc_step(struct v4l2_h264_enc *enc)
 	if (rc->mode) {
 		pr_debug("  rc mode: %s", rc->mode->name);
 
-		if (rc->mode->type == V4L2_H264_ENC_RC_TYPE_CBR) {
+		if (rc->mode->type == V4L2_H264_ENC_RC_TYPE_CBR ||
+		    rc->mode->type == V4L2_H264_ENC_RC_TYPE_VBR) {
 			pr_debug("  rc bitrate: %u bits/s", state->bitrate);
 			pr_debug("  rc target: %lu bytes", rc->size);
 		}

-- 
2.55.0


