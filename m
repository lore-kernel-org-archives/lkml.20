Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305123;
	b=pFx0F1EccWmjaQ5Uo975n4fNHSSNfvYgScYpOoep8xsEJyawAzVG7Dpu1ZPsIJEKuzwE
	 OQE4VbfbspxySI7OitY+TtJNmq1xdxV2kH8JrKzUC89CgZ68wsn+7bwGCPxrSzGTj9Nb1
	 nMzA1ktHm04Z03AxKC4T6MHSmdbp7kQn1nqw2XS/Lwjoq44lUjEVNrokUplpG5ZkHOXTp
	 wGoQTZ5AFWNbTCAcJW0ycRJwQ4dvz/j6NAvORprZPzlQgbil2qEj4w3y3ZWI8FAEKo6t+
	 idkUt0ASdt147YihgRVtKFxr9UW5tz19/ylMcN/Bdg9qXTWQP47C9NPVf4xUl7NX4vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305123;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J1l+yp+9bGZ5T8DXIQd1s/3x46JxGIjeoVPbXjIZcDQ=;
	b=xcazW5hyGuENowRDGp0MS16u62Tg8a4simLQJx+gfs0l6wfLMAQaGqjsg8AvSqDtAWJ1
	 GaVR9UqrSfods41X17X154KM96y2SzZ32p+iZH3zo/ujV9xD5NcGIVTHeWTL1zdsFl48G
	 JMs7yUPmM4l1bKFB9Azez9BiDgQaBJGBnYas9nEEWCP/+JObr7/vnNm+gk0Vwv8h+15+w
	 t4yGS93J3TLFvf1D87vuPPlxFFDkpiAkrUhDHvHK1FYZL2cmF4lf0La2pD/MS10qnwdl4
	 9wHUXZFGWZShvD678evWv6aq9yCB9m4+F3/YfWPStSl6336txMUvZ4AOIO+392tB83A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEhahqFF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EED8606A331;
	Tue, 10 Nov 2026 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEhahqFF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305123;
	b=iqbI/os5gQ+G0oak89DH+/+6tkHVvRzvck9osNjSgsb+Z1c6Y/2rB7rwvN78wrg1QzcW
	 WiosZQO3jCYbpajSvSD2tgot6e/Jf+ZFT/5bfqLak6P96LNq6t9wjY9awcky7uWZ1s2aC
	 5ND2pGDxjpuZgIES30XunOtxpjlOvtX4lsddlt409Ny3VGNd2a98v48gI29UX693hrAIm
	 XT7PoP5ReKHqMdy5DKyKfJ+75pFdz8sq+Fni6czrYbagBEvOiHd8cEwZnlKvSklnZPaaw
	 I/eW+XVhogUkQSsOldHzQnfG8RjB/VSRHQT+gqK7DJKteN07w9zrOoRoTmzJIPV0s/Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305123;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J1l+yp+9bGZ5T8DXIQd1s/3x46JxGIjeoVPbXjIZcDQ=;
	b=RQx21pTaepQzsDBCft7LAAabDPns1yFxmRj2ZekFaH8Nhg/LRaUXGUudAaDozTijLzrC
	 AGo3E0Za6JZgzw7erhqGnkXbEBr1L5RHaIXxgxCgWrLnH5F4vPt9Cmovz35lF9bqp+Tmn
	 L8iK9SfW1ctRUaljC//aYCE78oohLXSIcXRrbRr9jEGWYgjghTh+lQxSbD/JLf9dns/bF
	 w53HJvbaUu0adAY0iFtOk5zNZvMi5AJ5sQKKyqUi+bZTdEILv6VLT01dCk5bRd8V9X0lJ
	 VmQ2Y5kJESaU3tzxSTTsgpOMBwn9vLWWeBRPCB0Dnlx/odBSfffnWKhdGGPH5LPp2wA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 806E41F008A6;
	Tue, 10 Nov 2026 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305123;
	bh=J1l+yp+9bGZ5T8DXIQd1s/3x46JxGIjeoVPbXjIZcDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dEhahqFFRSilG2Jafa44QoqLGAQhbA//cwGNB+Y4KvIao/KubOG9BFjL/5vi5xM7O
	 EVNpTxu90R2/MU+STkUymNj3ue8mxixr1kPLrdQttH+vY3zf4B3F4SoWiLHSzH0RJe
	 GX02p2knZfKkwK8G3YsNbPWImj84qOUvNx6heNFSD5to/BKdwNyWC4ybcsIPPHw8hi
	 JkCWsPOxNZi1nqVW8bUeywxrhMpATHnH0mif7aBjZN+D1ukCLpvYJnaJQkRKpb9ECx
	 cdopBQW2XrfsCxibg/CQ03LSoQFKg7isvj+muawkz7pMf53QoFR7CaoiK2xXmFdEPb
	 5YaNk3SxJn1Vw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 202BA48A9A;
	Tue, 10 Nov 2026 10:05:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:05:22 +0000
Subject: [PATCH RFC 08/11] media: v4l2-core: Re-encode oversized pictures
 in the encode CBR
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
Message-Id: <20261110-h264-encode-fixes-v1-8-7a64486df499@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305116; l=8744;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=QMdkDsTtjT2f31/k5IiRqFS0jwAS6O/W4Mg+KxiK5yY=;
 b=i+tWYFhI3iyE+rcGo8CsnnwAeixqPB+iZpTLdpsimztsk0AZhnJdGSSwCYcndF2spEB3hV/yc
 Crea5Lqz1DiBb8W0ZLbZeDE3frRdy+ruL4v7gxwTZqjcxtFY0TYDbOi
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A scene change in a P picture can make it many times larger than its size
target: the QP state of the constant bitrate rate control was set for the
content before. The rate control repays the excess over the next pictures,
but the peak bitrate around that picture, together with an I picture
nearby, can exceed what a decoder buffer of the stream takes.

The Rockchip MPP library codes such a picture a second time with a higher
QP. Do the same in v4l2-enc-cbr, for drivers that can encode a picture
again: v4l2_enc_cbr_reencode() asks for a second pass when the picture is
above 1.5 times its target (I pictures) or 3 times (P pictures), when it
exceeds its target by more than 0.15 s of the bitrate (it alone moves the
bitrate of a three second window by more than 5%), and when that window
is more than 10% off the target. The second pass is coded 1, 2 or 3 QP
higher for a picture above, 1.5 times or twice that threshold. A picture
is coded at most twice. The window is a running sum of the picture sizes
that decays over three seconds, which needs no history buffer.

The QP state then learns from the size of the second pass, with its error
counted at the QP of the state.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-enc-cbr.c | 94 +++++++++++++++++++++++++++++++++-
 include/media/v4l2-enc-cbr.h           |  9 ++++
 2 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-enc-cbr.c b/drivers/media/v4l2-core/v4l2-enc-cbr.c
index 70810b3fea23..28826e32c418 100644
--- a/drivers/media/v4l2-core/v4l2-enc-cbr.c
+++ b/drivers/media/v4l2-core/v4l2-enc-cbr.c
@@ -16,6 +16,11 @@
  * the size the plan expects at this point of the GOP is spread over the next
  * pictures, so that the bitrate converges to the target.
  *
+ * A picture far above its size target that also moves the bitrate of the
+ * last three seconds well away from the target can be coded a second time
+ * with a higher QP (the re-encode of the Rockchip MPP library): I pictures
+ * above 1.5 times their target, P pictures above 3 times (a scene change).
+ *
  * After each picture the QP state moves by a fraction of the QP error
  * 6 * log2(size / target) (a QP step of 6 halves the size): slowly for small
  * errors, so that the QP does not follow the size noise from picture to
@@ -29,6 +34,7 @@
 
 #include <linux/export.h>
 #include <linux/int_log.h>
+#include <linux/math.h>
 #include <linux/math64.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
@@ -66,6 +72,16 @@
  */
 #define CBR_STEP_UP_MAX		(4 * 256)
 #define CBR_STEP_DOWN_MAX	(2 * 256)
+/*
+ * Re-encode: size thresholds in halves of the target (I 1.5x, P 3x), the
+ * least excess over the target (1/20 of the bits of the three second
+ * window, i.e. 0.15 s of the bitrate) and the least deviation of the window
+ * from the target (1/10).
+ */
+#define CBR_REENC_THR_INTRA	3
+#define CBR_REENC_THR_INTER	6
+#define CBR_REENC_JUMP_DIV	20
+#define CBR_REENC_DEV_DIV	10
 
 /* log2(x) in 8.8 fixed point */
 static int cbr_log2_q8(u64 x)
@@ -218,6 +234,7 @@ int v4l2_enc_cbr_begin(struct v4l2_enc_cbr *cbr, u32 bitrate,
 		cbr->bitrate = bitrate;
 		cbr->nominal = nominal;
 		cbr->buffer_bits = 0;
+		cbr->window_bits = nominal * CBR_BUFFER_SECONDS * fps;
 	}
 
 	if (intra) {
@@ -258,6 +275,7 @@ int v4l2_enc_cbr_begin(struct v4l2_enc_cbr *cbr, u32 bitrate,
 				   max_t(u64, cbr->plan_bits / 4, 8),
 				   cbr->plan_bits * 2);
 	cbr->intra = intra;
+	cbr->qp_reenc = 0;
 
 	pr_debug("+ v4l2-enc-cbr: begin");
 	pr_debug("  nominal: %llu bits, plan: %llu bits, target: %llu bits",
@@ -284,6 +302,70 @@ int v4l2_enc_cbr_qp(const struct v4l2_enc_cbr *cbr)
 }
 EXPORT_SYMBOL_GPL(v4l2_enc_cbr_qp);
 
+/**
+ * v4l2_enc_cbr_reencode() - decide on coding the picture a second time
+ * @cbr: the rate control state
+ * @bits: size of the coded picture in bits
+ * @timeperframe: frame interval
+ * @qp: QP the picture was coded with, within the QP limits of the codec
+ * @qp_max: highest QP of the picture
+ *
+ * Called after a picture was coded and before v4l2_enc_cbr_end(), by
+ * drivers that can code the same picture again. A picture is coded at most
+ * twice. When it returns true, v4l2_enc_cbr_qp() gives the higher QP of the
+ * second pass, which keeps the size target; v4l2_enc_cbr_end() is then
+ * called with the size of the second pass only.
+ *
+ * Return: true if the picture should be coded again.
+ */
+bool v4l2_enc_cbr_reencode(struct v4l2_enc_cbr *cbr, u64 bits,
+			   const struct v4l2_fract *timeperframe, int qp,
+			   int qp_max)
+{
+	unsigned int fps = cbr_fps(timeperframe);
+	u64 n = CBR_BUFFER_SECONDS * fps;
+	u64 window = cbr->nominal * n;
+	u64 thr, ins;
+	int add;
+
+	if (!cbr->bitrate || !cbr->target_bits || cbr->qp_reenc)
+		return false;
+
+	thr = div_u64(cbr->target_bits * (cbr->intra ? CBR_REENC_THR_INTRA :
+					  CBR_REENC_THR_INTER), 2);
+	if (bits <= thr)
+		return false;
+
+	/* The picture alone moves the window by more than 5% ... */
+	if (bits - cbr->target_bits <= div_u64(window, CBR_REENC_JUMP_DIV))
+		return false;
+
+	/* ... and the window is more than 10% off the target. */
+	ins = cbr->window_bits - div64_u64(cbr->window_bits, n) + bits;
+	if (abs_diff(ins, window) <= div_u64(window, CBR_REENC_DEV_DIV))
+		return false;
+
+	if (bits > 2 * thr)
+		add = 3;
+	else if (2 * bits > 3 * thr)
+		add = 2;
+	else
+		add = 1;
+
+	if (qp + add > qp_max)
+		return false;
+
+	cbr->qp_pic = qp + add;
+	cbr->qp_reenc = add;
+
+	pr_debug("+ v4l2-enc-cbr: re-encode");
+	pr_debug("  size: %llu bits, target: %llu bits, window: %llu bits, picture QP %d",
+		 bits, cbr->target_bits, ins, cbr->qp_pic);
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(v4l2_enc_cbr_reencode);
+
 /**
  * v4l2_enc_cbr_end() - account for a coded picture
  * @cbr: the rate control state
@@ -307,9 +389,17 @@ void v4l2_enc_cbr_end(struct v4l2_enc_cbr *cbr, u64 bits,
 
 	cbr->buffer_bits = clamp_t(s64, cbr->buffer_bits + (s64)bits -
 				   (s64)cbr->nominal, -limit, limit);
+	/* Sum of the picture sizes over about three seconds */
+	cbr->window_bits = cbr->window_bits + bits -
+			   div64_u64(cbr->window_bits,
+				     CBR_BUFFER_SECONDS * fps);
 
-	/* QP error of the picture, 1/256 units */
-	err = 6 * (cbr_log2_q8(bits) - cbr_log2_q8(cbr->target_bits));
+	/*
+	 * QP error of the picture, 1/256 units. A re-encoded picture was coded
+	 * above the QP of the state: its error at the state counts that too.
+	 */
+	err = 6 * (cbr_log2_q8(bits) - cbr_log2_q8(cbr->target_bits)) +
+	      cbr->qp_reenc * 256;
 
 	step = err / 8;
 	if (err > CBR_ERR_SLOW)
diff --git a/include/media/v4l2-enc-cbr.h b/include/media/v4l2-enc-cbr.h
index c47e459a1d1e..867e176ecb36 100644
--- a/include/media/v4l2-enc-cbr.h
+++ b/include/media/v4l2-enc-cbr.h
@@ -23,6 +23,8 @@
  * @qp_intra_add_q8: QP increase of the I pictures after I pictures larger
  *		     than their share of the GOP at the largest I/P ratio
  * @qp_pic: QP of the current picture
+ * @qp_reenc: QP increase of the second pass of the current picture, 0 if
+ *	      it was coded once
  * @ratio: I/P picture size ratio in 1/16 units
  * @gop: measured IDR period in pictures, 0 until two I pictures were seen
  * @since_i: pictures coded since the last I picture
@@ -31,6 +33,8 @@
  * @p_bits: running mean of the P picture sizes
  * @i_bits: size of the last I picture
  * @buffer_bits: accumulated difference between the coded and nominal sizes
+ * @window_bits: sum of the coded sizes over about three seconds (each size
+ *		 decays by 1/(3 * fps) per picture)
  * @plan_bits: planned size of the current picture
  * @target_bits: size target of the current picture
  *
@@ -47,6 +51,7 @@ struct v4l2_enc_cbr {
 	int qp_intra_ref_q8;
 	int qp_intra_add_q8;
 	int qp_pic;
+	int qp_reenc;
 	unsigned int ratio;
 	unsigned int gop;
 	unsigned int since_i;
@@ -55,6 +60,7 @@ struct v4l2_enc_cbr {
 	u64 p_bits;
 	u64 i_bits;
 	s64 buffer_bits;
+	u64 window_bits;
 	u64 plan_bits;
 	u64 target_bits;
 };
@@ -65,6 +71,9 @@ int v4l2_enc_cbr_begin(struct v4l2_enc_cbr *cbr, u32 bitrate,
 		       unsigned int samples, bool intra, int qp_min,
 		       int qp_max);
 int v4l2_enc_cbr_qp(const struct v4l2_enc_cbr *cbr);
+bool v4l2_enc_cbr_reencode(struct v4l2_enc_cbr *cbr, u64 bits,
+			   const struct v4l2_fract *timeperframe, int qp,
+			   int qp_max);
 void v4l2_enc_cbr_end(struct v4l2_enc_cbr *cbr, u64 bits,
 		      const struct v4l2_fract *timeperframe, int qp_min,
 		      int qp_max);

-- 
2.55.0


