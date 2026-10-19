Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438604;
	b=3gE1o86AJMewc8VKREhi80RQapC6AVvmmcUC/A9y0L93KtvC2R9gBLaIqo0Q1wD4LHDm
	 b1Ta/U/oAIRXuh0mTqTTm+8g35m2gtZCQQNfpQ3DgK4X8AeuhVRflkK2A6X67fRFk/bpl
	 OJMJX8Fck/+8mDslcx9ri+nH8SUPpUvWSwXOHhuCY9ZUpKtOPa9CUMK5TnMKGtwhDLwjO
	 5ckzzRl1Y+8WeRIYFXyvLm5ZYn5ciFXrlXQYDCgXdG5GfzebDiIEJtkKs91p77Ir63TTf
	 JLM2/dmS2lhtVMXg//wnqwQ17NL022DPW0xm4dDLKCzokRehdoIeqiTeg0qb3KrKj5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438604;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CJRwlTAZRK6IR44h4h3xiSuIwWh6F244P54SZtp/WgA=;
	b=ltD9PoIWljruwRVe3/jClkHyqbHV0od56xy2iduiV2TBsMZFYZIXLMtA4nCcACa6xm0F
	 2Ej+acmqIwgUqYVVHHqyf/T0thBQIY1RuvH8lOrye8F18Clw1oLBgrGQOy8x7S3crZyU9
	 3jnzFlVaWJnB1D0niOeFtWDY5CAuORds/7LWWagdtRunD4XogxEx1Btj1XCUPTMZoE8Qi
	 2OkYIaF+POkBi+/eSQLPmCzGqMzhZSrZpuwcCDouIBWV10WHG9p5zdknpI8DfftF+fpG9
	 bCfnyPcfBK3GFF9XnEad/KnsxW9/K+jP1/ctsBbp7YmmxNXo/t6dzF2rcaIS0ITMMEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=ZTbAz8V1;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="remC/Jfh";
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50543606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50543606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=ZTbAz8V1;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=remC/Jfh
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7348A14000B0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:36:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 19 Oct 2026 15:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792438602;
	 x=1792525002; bh=CJRwlTAZRK6IR44h4h3xiSuIwWh6F244P54SZtp/WgA=; b=
	ZTbAz8V1d2CgXJiS3201367dPrR1PVGK88ecznuEdNCtwyGEtRvFzxOpoXHf6a5k
	YI5cZMaRHRNXt+zvU29vlOZ1tyZWya+WDyOndyou91oyRHEw6LxkHy/YgeFD9u8W
	MnoAxjfTyRQBfl+OigMm+0vctoLe1/3K4W410xcKKMI7g5tRzYmJD2NQ580GhITe
	5vibdBr82bGq9GdXmMbJPdtaRbXHbN340M6+HwvmHewFbdRLA2NMed+mtmzjvc75
	xVkuagdGuEyOQhbH6GSjrsu03O/fw4ecjHFwFNQ/rfri/rK7OIOn50laasr3P97V
	pTbQo4gbRHiJVwiFOBO9aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792438602; x=
	1792525002; bh=CJRwlTAZRK6IR44h4h3xiSuIwWh6F244P54SZtp/WgA=; b=r
	emC/JfhcvEwhLWlm3kSI1PGGFMtgUOqE2piRYdEpatCOvZAP9cRIhp/wDXzTLnMR
	npOn/Jy8P6npP4cLboO9FPMOv9HaqSiYZ6FK9Z2ylb0YfvkC99Tocb1VDQgqzt6E
	t94y1iTYdGb3w7mf6MvNe3tNh4fjzPtba25RWLOhCDJqeZoGUFjWi+7atK1AYwwl
	xfwSRH53n8tf7wAHn3zN+QmDkfSv5q8ayROBHb4aZSlQDroE6VQdDxQcn8JPES3a
	Ga2yY25XOKPZn91d+mx80NslsTzetqXF6iDlSoPjhr0CRWyw42FaR2r1flMgQLOm
	72r60Jm4DL9qGe4FADk9w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792438602; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:nNkXE0Itkuo+QQt/xzLA+DmpIiFcgR5azqpaEPlODDQsC7f
	cWROiTM0FG8hRSvlhXHAgL8gNvTGwryXfk8vjOwvgrQmU4Cc/uHpPlg6hoXbhnRB
	uYihaAaYQOyvGInUynNKmYs2zpwOQSE3a7tT5HQWbA8Sz7KPpbcFHtcuU6+3Opm1
	6/3XqkM8sxDdqT9NZrBMWjF+JA8O8Jw9cD+3u4YEuHvDmXHaQMj0IFIlPFM/SXgJ
	/Sl4S8UPS+OwoWubhnu3XzMjn3taVX8rBbWyNmlQv/tmEAYJepzuiVUWrevRG/I4
	/O8ZumFr7q7XPvu19zq2adUKSwApsySls3MTFDw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+CdioG894q7djeKnStrt/hDdzhBQAhgfjWVJ9VTIbws=:wUoB+tzmdXUGwcnXHotnd1pd1WPvQakQefF128fOukA=;
X-ME-Sender: <xms:SnHWahD26REa1m7-Zo2Hp-v8TvwSk801w601j6e3PE230tq3vcEVxw>
    <xme:SnHWasNwGpgcWvhHVggWrh7qPd8wPuqs18aHXlxpd1qxzCLsNYlfRukrqWqRAFLEd
    oT7FYfsf0zugcRrEl44xLqtVJo2WUH82TTX09Htr8pHB5oV4I7AZ06w>
X-ME-Received: <xmr:SnHWagcYQwwJEypaDyctZ83opnig39-u2N-NHS26cFKilwrJ986tUYdI8YHcUUujCIfclLXsJnLosM5gTM014czIjGP8okY>
X-ME-Proxy-Cause: dmFkZTEmBQwo+sf/j1ocKwc2/RsLqnHk33Sx/VCjkHynw/c/caELFOiXGalx/mofXmjPnL
    wm+KKOhmvwpj5rVueT42yNXbD5vQKy4cgduUgU3N5hgVFpyQGcqUyfn+XWe0Qez0wARhd9
    J+uV5sHaLIZEa+WsGRYXGsjXjHEHd+4axWXR5FmzONYIBUSInuSF4nSBLTDsmDjDV+hlcY
    bJgeQCs0NPbBjuuC4044qPHRbczAJXvNb+umMO+yXtWH3/B4nWGn7WyYrseYv983I+eT59
    3yqfjlVzMtGd7Yk0/rb/Ct8Xzf6bUKGFQLeCY8mVVP6lI9Ll0Hls25nqi0n3NaKV9xv5XZ
    RRVInhxShhIKk0hEZpbNLoftaXK2KNKoPtr4/U3cpF8HP69aszufdFyslarloOKJu+8DNB
    Et+mSIuBk+k0wlDdukF80eDYif+bsFnzlQOXJSidzT+ndOvaCPohXMQVDbp43itbvC5ugp
    p5wTDsP+7rc61YOuKOUwZkOHVmRcOno/sKa9ug3iccq6tQFnQX7icvJ8SCTgs9oxcNRU7L
    U4Gy2f0/3tSkjxYLuTIKjcR0x3hq1JYkzLWENcRsbI3WM++cb5WTYulJnseATTjI1XGZpb
    seG5CdPDZM0KVwnklwN9eSydDYCX/KTI3swqoUELUSASfRAmllCA+w8hEiqw
X-ME-Proxy: <xmx:SnHWal54YVbXxpsZQgKCTy71d-xbr-61ORM-l4Vi9PPrHt66dyxwog>
    <xmx:SnHWaqIBxJsv1i5GjdCpAlx5OFFgL4oSM14ZUqIPqwcglT6AdKa0tg>
    <xmx:SnHWanWFxJmOLu2oYvA4KF5NzIHO7oGJjwyEgHGp9tT_MHsk4CmrXg>
    <xmx:SnHWauF42qWM3r7xvOu1G4CsGMH23zyiZlfgoULnhgMeF4HYSJe0AQ>
    <xmx:SnHWahMba98wblzcKP_wteNvZMhl9m8XxeL3LhdAJYR9FfD4O14gBzIm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 15:36:41 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Mon, 19 Oct 2026 21:35:40 +0200
Subject: [PATCH 2/4] media: rcar-isp: ispcore: Update image data flush
 settings
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-v4l2-add-nv12-v1-2-4a84736803b6@ragnatech.se>
References: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
In-Reply-To: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 Yusuke Goda <yusuke.goda.sx@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3542;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=wUoB+tzmdXUGwcnXHotnd1pd1WPvQakQefF128fOukA=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq1nFBuubdHR/iCNmFwq+/RQJS47EmBY/3cGsgC
 AYL9iQbS9uJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCatZxQQAKCRAJtP95BPlN
 JPREEACC+OT3Y9S+qOMjpuDZRagALg+zGvLOn7ESG3JHDW9+m8XGMgCg8RBu9Rob9GBnDMA4XT8
 n80JY+D5oK1jv3wGtKbWgVVaODYACl0clSa6LWcND55iOVdF39C7Jej4UZDCk98bluLMAeEyXzT
 h0e6GMI5zoJNWLyv3O16mB+1LRRe5u4rhhbzjj0lX2+rvsPJnCXvX/CNqiPV//P34+jqwA+i+5W
 AZ/uvJB5KdxUXmIIOru2JcbGYbQrDtUk4Hz8tHLN6VlD+Prd3+U2zF1GLZCoSXUsbZYQt1q8clN
 63f62NIEAvJ7JI07IgiUHfm8hMKehF3zLuYbMWpJlVOJthywIlViWZh7vGIe6C4KZSHmLiGN0AR
 +U4PheiPYchfKlZBbqBEtthO1c2l1gif8VoNjURHnnsHWnNJr3kesVYGNrLHysZyjcmTDyIEHq+
 ImNWCwIkaYv43srOT7yplBUFyJMnkpR9Hyu6jPEd6oLxfEiDE2opF5uexwjOFzRq9EJPfdzfPEJ
 IfARkPVwxetheTDEeZY+RWidSOxmAwLNaTbo23zMuACuiEKlXQvNIIYMs+yddx0DapuxWmBdfc1
 9Y21na+5JtJUvwq/cWJk2CFQjAUeFGA6pUlk6HIpSV1PIgnoKz+ykAr8n6pLyArzYM+cSJgeXnJ
 Ln5F8h6AqBORQUw==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Later versions of the datasheet have an updated chapter on how the image
out flush settings depends on proper stride settings. Update the bytes
per line calculation and flush out settings to match the datasheet
clarification.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp/core-io.c | 28 ++++++++++++++++++++---
 drivers/media/platform/renesas/rcar-isp/core.c    |  2 +-
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
index badde72352c1..48db37bad69c 100644
--- a/drivers/media/platform/renesas/rcar-isp/core-io.c
+++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
@@ -733,6 +733,28 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
 	},
 };
 
+static unsigned int risp_io_calture_bytesperline(unsigned int width, unsigned int bpp)
+{
+	/*
+	 * The datasheet specifies strict alignment and padding rules to be able
+	 * to flush out all the pixels. Each line must be 256 byte aligned and
+	 * at the end of the frame at least one extra line of space must be
+	 * available.
+	 *
+	 * As we can't extend the buffer with one extra line we need to work
+	 * with stride setting to satisfy both constraints. Fortunately the
+	 * datasheet gives us a calculation for this.
+	 *
+	 *   FLUSH[pixels] = ALIGN(WIDTH[pixels], 256)
+	 *
+	 *   PADDING[bytes] = ALIGN(BPP[bytes] * WIDTH[pixels], 256) - BPP[bytes] * WIDTH[pixels] + BPP[bytes] * FLUSH[pixels]
+	 */
+	unsigned int data = bpp * width;
+	unsigned int padding = ALIGN(data, 256) - data + bpp * ALIGN(width, 256);
+
+	return data + padding;
+}
+
 static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
 				       struct v4l2_pix_format_mplane *pix)
 {
@@ -749,16 +771,16 @@ static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
 	case V4L2_PIX_FMT_NV16M:
 		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 		pix->num_planes = 2;
-		pix->plane_fmt[0].bytesperline = ALIGN(pix->width, 256);
+		pix->plane_fmt[0].bytesperline = risp_io_calture_bytesperline(pix->width, 1);
 		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
-		pix->plane_fmt[1].bytesperline = ALIGN(pix->width, 256);
+		pix->plane_fmt[1].bytesperline = pix->plane_fmt[0].bytesperline;
 		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height;
 		break;
 	default:
 		pix->pixelformat = V4L2_PIX_FMT_XBGR32;
 		pix->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 		pix->num_planes = 1;
-		pix->plane_fmt[0].bytesperline = ALIGN(pix->width * 4, 256);
+		pix->plane_fmt[0].bytesperline = risp_io_calture_bytesperline(pix->width, 4);
 		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
 		break;
 	}
diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index b5861d0cd0e8..3e135e84b75b 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -398,7 +398,7 @@ static int risp_core_config_output(struct rcar_isp_core *core,
 
 	/* Set image out flush EOF. */
 	risp_core_write(core, ISPCORE_DMA_IMAGE_FLUSH_OUT_REG(index),
-			pix->plane_fmt[0].bytesperline <<
+			ALIGN(pix->width, 256) <<
 			ISPCORE_DMA_IMAGE_FLUSH_OUT_PADDING_PIXEL_EOF_SHIFT);
 
 	/* Enable DMA and set burst length. */

-- 
2.55.0

