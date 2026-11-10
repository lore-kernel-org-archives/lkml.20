Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305121;
	b=bXr1jhviHHgMqvkHuckxCSvVB92hHFhIQVYRbHpM8JjY0urvv68Uowz1+WYgjSrYZMas
	 JZBv9bl5aDdP2Yb2nysrMei+GEi3bxUEkytb6iXx0nE7WWG2JnQWVf3fcCGIsygdCxLwI
	 ho0UoA9DvCaBFW2m/9Ko3b4u4oTKZrNJgMuC0KQ9zqOKRTqA3BOLHVpwlfPOPiP3ihLeQ
	 tp3awz6sJJu/+xjZtAHAfLQR2lgfM3doVbtofSZnHH/TN4TiVJeDF6E48Y6hhwBSUEYM8
	 D/iqcPGh6JxJRq1GgZ/3Flic8CqHCsrdevtKpr8hYZgBPm5o3Edm2UneOeReWtXN87g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305121;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fXxtM4mrSqwdm5z48R0tc1I4MlDBeNm231VHL0aDjD8=;
	b=vOTQ+UC2pIoO6oDILilqnU2qI2fFKgAGzihsV1Cpj+l5lkMPkZWywKaKytG4HWBUZixr
	 ef+nDRcgZsqyw5VIQKxGyXaR6+Ddsj0OI2IUCwz7Og+KgLZJkztaf2KVK08jWVbxuCeCF
	 OcZ3mmyuX43F3bANqPcb9ZObnAEQuIJpNfIXkiW9yE2/X+eurMi89t8PeMFcMuGjOCUNV
	 7VPUMs2o1gB70/zxbyKdKL9hOMlAEcVLkOQxFwQhVOAU+902nXL9AxXQTLh6urlaZ2C+9
	 ytb2KsNGzN2owK8QqzCo/LNkv4i4KPp9AKCQFFlP8zhVl+Cr/HSPiF1H0NXSEDRQ11g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeFttKFm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264860A260F;
	Tue, 10 Nov 2026 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeFttKFm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305121;
	b=pGXTlflAwa5cepTVBovWQ9nchbiC7qEhXHIl8tc4OU10vN/YIomKib02a6rwX1MBia8B
	 U8rnvqfkkUqhuoI2DV4jUH8DzVMh49Wt6M0oB4vVvJ6c4mv5E4qlkhLFQiX9p7E46taSq
	 85mp+WmMGNp+Lfw/In3LQbEFFHrd+XmPseD0CYNm/Ek6Vr41DmdW00P1vmykEJIXJ6xmd
	 /pVqEJFwjKMxBod6q74gXpMy655Ep3SsK6XRlEqsdli/VEGYFI2ZmL7UjwqPjaFzGgbTb
	 MMNg5SFacrbrwrMxG3KNe443aqsCF4jwji1G4OjphaVPO5mVOxQUKl1JYDMfP4P6vCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305121;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fXxtM4mrSqwdm5z48R0tc1I4MlDBeNm231VHL0aDjD8=;
	b=GIjZnGDeNaqvMnpgZt/HsdW4cVfC/U76sl9fn0lqIoEPTESlgep0tZKvP296B7cHv0Dv
	 LriUHVzK/BmC7DokXrF7sdBJheIE86xNciKk4rhsua2EYrn3KHaZli0mgPfV8PNKHgeC7
	 fskXOpOAqnqLnHFgNrnUDnDYYGnHWbqIyYXjz7LXIPlwFasANzFMCdfzqZXReR1vUzB5S
	 DovcSnKm2JvC0LbAZN7V9U3kWSpPYIxTOqSQLpVSqYZcs5uDvTjwJS3uPWxUFJdOz4YSY
	 PZaGfnUueEj37RjgNcGD8kAcJBnXgyVNRzag2Tlc1KqL12mLYXriITtDfIcZDLFpfZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39AFC1F008AB;
	Tue, 10 Nov 2026 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305121;
	bh=fXxtM4mrSqwdm5z48R0tc1I4MlDBeNm231VHL0aDjD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NeFttKFmIfceEJorlopOzhttMEz/nuYXGApkDYARIFriHVSWGQd+1y5goWtRQThLq
	 znSLL/BolZCI5zc793J2Ima3BFaNojzUEPiWEWDN5llG6Ylme33fZoY3R64xL53nzC
	 ysB6VyaUrlkzYVt7S9UDULOek2rR8K2SSyJI5/lrnv4Ztm/YBrdaC7xT9V8OhsofNF
	 X6NBvwgR6VE9OygudDKgJUPDEPTEI8VOAo+QNUcrjPgfmxT2Ltr+ZVfAXboQL6xUVA
	 3ncYhCffg04UjBNkHak5X5zP13b/BPnLmFnYx+gTHt6700B8gNrQW/f9+aDwORImmZ
	 k/+fvdkdJcJpA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE95748A92;
	Tue, 10 Nov 2026 10:05:17 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:05:20 +0000
Subject: [PATCH RFC 06/11] media: v4l2-core: Bound the I picture size in
 the encode CBR rate control
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
Message-Id: <20261110-h264-encode-fixes-v1-6-7a64486df499@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305116; l=9619;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YS6Z381I0eqa6cgdBfWgmwtIwZkhdIpklFlbUIrYFtE=;
 b=TaRgevff76CqvLjGMdOHEoZ6Ltqb6e8dQqMSW06bm2j8x+l+mH03aDDrwOMfmwZBc87insqqr
 TcwP2JAKip6BAAMdg4ZVhBoS1q9SOlXVUYBDBVog70PZeJe6GuResva
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The constant bitrate rate control codes I pictures a fixed QP delta below
the current QP state of the P pictures, whatever their size target. On
content whose P pictures get very cheap (static scenes), the state drifts
down over a GOP and the next IDR picture comes out far above its plan:
up to 33 times the nominal picture size at 1080p60 and 2 Mbit/s with
HEVC, 2.6 times its target and a third over its share of the GOP at the
largest I/P size ratio the plan allows. The P pictures of the GOP pay for
it in the end, but the bitrate over one second rises to 1.5 times the
target, and IDR sizes swing by up to 3 times from one GOP to the next.

Do what the Rockchip MPP library does for both codecs:

- code an I picture at the mean of the QP state now and at the previous
  I picture (weighing the current state 70% when it rose from 33 or below
  to 35 or above), so that a drift of the state over a GOP moves the next
  I picture by half as much;
- after an I picture larger than its share of the GOP at the largest I/P
  ratio (30), raise the QP of the following I pictures by up to 4 QP per
  picture, in all at most a quarter QP per QP step below 45, and take the
  increase back as I pictures come out below that share.

All-intra streams are unchanged: their QP state follows the I pictures
directly.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-enc-cbr.c | 98 +++++++++++++++++++++++++++++-----
 include/media/v4l2-enc-cbr.h           |  8 +++
 2 files changed, 93 insertions(+), 13 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-enc-cbr.c b/drivers/media/v4l2-core/v4l2-enc-cbr.c
index 5bd10d494054..32f98052e981 100644
--- a/drivers/media/v4l2-core/v4l2-enc-cbr.c
+++ b/drivers/media/v4l2-core/v4l2-enc-cbr.c
@@ -4,7 +4,12 @@
  *
  * One QP state is kept for the stream: it is the QP of the P (and B)
  * pictures, and I pictures are coded a fixed number of steps below it, so
- * that the quality of the reference pictures stays even across GOPs. Each
+ * that the quality of the reference pictures stays even across GOPs. The
+ * I pictures take the mean of the state now and at the previous I picture,
+ * so that a drift of the state over a GOP (static content, where P pictures
+ * are cheap) moves the size of the next I picture by half as much, and an
+ * I picture that exceeded its share of the GOP at the largest I/P size
+ * ratio raises the QP of the following I pictures until they fit. Each
  * picture gets a size target from a GOP plan, in which an I picture is
  * "ratio" times the size of a P picture, with the ratio and the IDR period
  * measured on the stream. The difference between the coded size so far and
@@ -39,6 +44,15 @@
 #define CBR_RATIO_INIT		160
 #define CBR_RATIO_MIN		24
 #define CBR_RATIO_MAX		480
+/*
+ * The I QP increase after oversized I pictures: at most 4 QP (1/256 units)
+ * per I picture for an I picture twice its largest share, and in all at most
+ * a quarter QP per QP step below 45, up to 6 QP (more where the QP is low,
+ * where a QP step changes the size by fewer bits).
+ */
+#define CBR_INTRA_ADD_STEP	(4 * 256)
+#define CBR_INTRA_ADD_QP_END	45
+#define CBR_INTRA_ADD_MAX	(6 * 256)
 /* P pictures after an I picture when the I/P size ratio is measured */
 #define CBR_RATIO_PICS		4
 /* QP errors up to this are corrected by 1/8 per picture, 1/256 units */
@@ -85,9 +99,9 @@ static u64 cbr_nominal(u32 bitrate, const struct v4l2_fract *timeperframe)
 				  timeperframe->denominator), 1);
 }
 
-/* Planned size of an I or P picture of the current GOP */
-static u64 cbr_plan(const struct v4l2_enc_cbr *cbr, unsigned int fps,
-		    bool intra)
+/* Planned size of an I or P picture of the current GOP at an I/P ratio */
+static u64 cbr_plan_ratio(const struct v4l2_enc_cbr *cbr, unsigned int fps,
+			  bool intra, unsigned int ratio)
 {
 	unsigned int gop = cbr->gop;
 	u64 p;
@@ -98,13 +112,43 @@ static u64 cbr_plan(const struct v4l2_enc_cbr *cbr, unsigned int fps,
 	if (gop <= 1)
 		return cbr->nominal;
 
-	p = div_u64(cbr->nominal * gop * 16, cbr->ratio + 16 * (gop - 1));
+	p = div_u64(cbr->nominal * gop * 16, ratio + 16 * (gop - 1));
 	if (intra)
-		p = div_u64(p * cbr->ratio, 16);
+		p = div_u64(p * ratio, 16);
 
 	return max_t(u64, p, 1);
 }
 
+static u64 cbr_plan(const struct v4l2_enc_cbr *cbr, unsigned int fps,
+		    bool intra)
+{
+	return cbr_plan_ratio(cbr, fps, intra, cbr->ratio);
+}
+
+/*
+ * QP of an I picture: the mean of the QP state now and at the previous I
+ * picture (the current state weighs 70% when it rose from 33 or below to 35
+ * or above: content that got much harder), plus the increase after
+ * oversized I pictures, less the I QP delta. All-intra streams use the
+ * state alone, which then follows the I pictures fully.
+ */
+static int cbr_qp_intra(const struct v4l2_enc_cbr *cbr)
+{
+	int cur = cbr->qp_q8, ref = cbr->qp_intra_ref_q8, q8;
+
+	if (cbr->gop == 1 || ref < 0)
+		q8 = cur;
+	else if (cur >= 35 * 256 && ref <= 33 * 256)
+		q8 = (3 * ref + 7 * cur) / 10;
+	else
+		q8 = (ref + cur) / 2;
+
+	if (cbr->gop != 1)
+		q8 += cbr->qp_intra_add_q8;
+
+	return DIV_ROUND_CLOSEST(q8, 256) - cbr->qp_delta_intra;
+}
+
 /*
  * Start QP of an I picture from its size in bits per luma sample:
  * 20.3 - 6 * log2(bits per sample), clipped to 15..45. This is the relation
@@ -165,6 +209,7 @@ int v4l2_enc_cbr_begin(struct v4l2_enc_cbr *cbr, u32 bitrate,
 	if (!cbr->bitrate) {
 		cbr->ratio = CBR_RATIO_INIT;
 		cbr->qp_q8 = -1;
+		cbr->qp_intra_ref_q8 = -1;
 	}
 
 	if (cbr->bitrate != bitrate || cbr->nominal != nominal) {
@@ -190,6 +235,9 @@ int v4l2_enc_cbr_begin(struct v4l2_enc_cbr *cbr, u32 bitrate,
 		cbr->qp_q8 = clamp_t(int, qp, qp_min, qp_max) * 256;
 	}
 
+	cbr->qp_pic = intra ? cbr_qp_intra(cbr) :
+			      DIV_ROUND_CLOSEST(cbr->qp_q8, 256);
+
 	/*
 	 * The buffer holds the coded minus the nominal sizes. Within a GOP the
 	 * plan expects it to go up by the excess of the I picture and back
@@ -214,6 +262,9 @@ int v4l2_enc_cbr_begin(struct v4l2_enc_cbr *cbr, u32 bitrate,
 		 cbr->nominal, cbr->plan_bits, cbr->target_bits);
 	pr_debug("  buffer: %lld bits, expected: %lld bits, gop: %u, ratio: %u",
 		 cbr->buffer_bits, expected, cbr->gop, cbr->ratio);
+	pr_debug("  intra: %d, picture QP %d, I state ref %d/256, I add %d/256",
+		 intra, cbr->qp_pic, cbr->qp_intra_ref_q8,
+		 cbr->qp_intra_add_q8);
 
 	return 0;
 }
@@ -227,12 +278,7 @@ EXPORT_SYMBOL_GPL(v4l2_enc_cbr_begin);
  */
 int v4l2_enc_cbr_qp(const struct v4l2_enc_cbr *cbr)
 {
-	int qp = DIV_ROUND_CLOSEST(cbr->qp_q8, 256);
-
-	if (cbr->intra)
-		qp -= cbr->qp_delta_intra;
-
-	return qp;
+	return cbr->qp_pic;
 }
 EXPORT_SYMBOL_GPL(v4l2_enc_cbr_qp);
 
@@ -248,9 +294,11 @@ void v4l2_enc_cbr_end(struct v4l2_enc_cbr *cbr, u64 bits,
 		      const struct v4l2_fract *timeperframe, int qp_min,
 		      int qp_max)
 {
-	s64 limit = cbr->nominal * CBR_BUFFER_SECONDS * cbr_fps(timeperframe);
+	unsigned int fps = cbr_fps(timeperframe);
+	s64 limit = cbr->nominal * CBR_BUFFER_SECONDS * fps;
 	unsigned int ratio;
 	int err, step;
+	s64 cap, add;
 
 	if (!cbr->bitrate || !cbr->target_bits)
 		return;
@@ -285,6 +333,30 @@ void v4l2_enc_cbr_end(struct v4l2_enc_cbr *cbr, u64 bits,
 		 * estimate: only all-intra streams steer the QP fully with it.
 		 */
 		cbr->i_bits = bits;
+
+		/*
+		 * Above its share of the GOP at the largest I/P ratio, an I
+		 * picture is more than the P pictures of the plan can make
+		 * up for: raise the QP of the next I pictures by up to 4 QP
+		 * per picture (at twice the share), and lower the increase
+		 * again as I pictures come out below the share.
+		 */
+		cap = cbr_plan_ratio(cbr, fps, true, CBR_RATIO_MAX);
+		if (cbr->gop != 1 && (bits > cap || cbr->qp_intra_add_q8)) {
+			add = div64_s64(((s64)bits - cap) * CBR_INTRA_ADD_STEP,
+					cap);
+			add = clamp_t(s64, add, -CBR_INTRA_ADD_STEP,
+				      CBR_INTRA_ADD_STEP) +
+			      cbr->qp_intra_add_q8;
+			cbr->qp_intra_add_q8 =
+				clamp_t(s64, add, 0,
+					clamp((CBR_INTRA_ADD_QP_END -
+					       cbr->qp_pic) * 64, 0,
+					      CBR_INTRA_ADD_MAX));
+		}
+
+		/* The state the next I picture takes the mean with */
+		cbr->qp_intra_ref_q8 = cbr->qp_q8;
 		cbr->qp_q8 += cbr->gop == 1 ? step : step / 4;
 	}
 
diff --git a/include/media/v4l2-enc-cbr.h b/include/media/v4l2-enc-cbr.h
index 6b66d121b0cc..c47e459a1d1e 100644
--- a/include/media/v4l2-enc-cbr.h
+++ b/include/media/v4l2-enc-cbr.h
@@ -18,6 +18,11 @@
  * @bitrate: bitrate the state was set up for, 0 before the first picture
  * @nominal: nominal picture size in bits (bitrate times frame interval)
  * @qp_q8: QP of the P pictures in 1/256 units, -1 before the first picture
+ * @qp_intra_ref_q8: @qp_q8 when the previous I picture was coded, -1 before
+ *		     the first I picture
+ * @qp_intra_add_q8: QP increase of the I pictures after I pictures larger
+ *		     than their share of the GOP at the largest I/P ratio
+ * @qp_pic: QP of the current picture
  * @ratio: I/P picture size ratio in 1/16 units
  * @gop: measured IDR period in pictures, 0 until two I pictures were seen
  * @since_i: pictures coded since the last I picture
@@ -39,6 +44,9 @@ struct v4l2_enc_cbr {
 	u32 bitrate;
 	u64 nominal;
 	int qp_q8;
+	int qp_intra_ref_q8;
+	int qp_intra_add_q8;
+	int qp_pic;
 	unsigned int ratio;
 	unsigned int gop;
 	unsigned int since_i;

-- 
2.55.0


