Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438608;
	b=PBr8IgG4x0ORMDI28AZYM4ShCQr++EKRUsbcFhxMp4k6YJRimKa/1mgCydmFTdSsxzOM
	 gpqTiJFhXclchQWDv5jrLq4/rK+AcBZfYE1HRqkrTJSBNnabQ5JAbMyPKXRyFF40ADHZ8
	 +FOmPLY8BnvF7QlHQOpCS5m1TdlvpJ4XhV2kIHyfJ3nEGffGNbTWZLjFTuEQ4/UD+v2Ux
	 FHaa0ePtSUlGuuVQYFjCZDhU7YMvxsYRDEpj3aBpGqhghnFL/JI9P5CfpUnMOXm95GjsE
	 4+zpHYe81U54n3YM8+wPlMpWhDohTsydjMuDjqkcaiYHAKdcSMqJqOUih86iFcEx48g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438608;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WMCRyKhWFy3EUBEIKYSRgXD2GDnE9L7VKyi4duKmKXU=;
	b=jD8FOU1kyDcsDIFrpYXbwMQ3a6PoXadeFWu4OnAsU5k+pc18Aq/Diz/Wjb7DQoiR8Z0K
	 X4sTHxXRji2YZFcPVKCS20IDfZeoQA/TTDMRwdKT8Y8DoBRnPkB6o2BoBMVFYpRlhjJIn
	 i+Si22ScpW6Cdp6mVkvYxa4u9djke8UCALdaXXDoVjscfwrZWTVkKWVSBXc+WLRk4AeX+
	 mJJ/Nf9vYU4P71ObtGsxKtB8pjQKZW4TjVl9COLieLCcRcRnFI3wAJ6PsC9iBGa4R3b7P
	 J8zMafCXYoY1zXGSiWjyPDzD0RcYxpFz15niRQoHoeClxkrB75+EK9HHfDY8Fxgh1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=bGPXg+hd;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XqhKM9AW;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8F360A261C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8F360A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=bGPXg+hd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XqhKM9AW
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id BF429EC00D2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:36:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 19 Oct 2026 15:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792438606;
	 x=1792525006; bh=WMCRyKhWFy3EUBEIKYSRgXD2GDnE9L7VKyi4duKmKXU=; b=
	bGPXg+hdqjtgE2CA43l0u4Sj9uaDWWIWGu7s0PkfC012HJ518v5aNCEVZU2TJ9FL
	3j9LcIjxmV/BVal0DsMmKEv0pBG1EuifVENMU9/eSnjew+g/9quvU67xoVRqdBlq
	GHh1KsHeH4A63kCXd39mqOapGRH7U4KNGT7kSsTmBNR6lB/+CnZlMRbF7S5J0yCs
	faZooH0rEYwzCHmFwSfCr2sjHKY22vXNpLhlnPBLK3WA2vTmWVBe4QHPjiDpe0MX
	6NpT92g6QkfLfG4L5cxRW4K47gEhOrcS3e5IfTIWifEWNXo92BL/kNNIwyqpJ+A1
	ijzJtz6dpbHpKGRiyr8/sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792438606; x=
	1792525006; bh=WMCRyKhWFy3EUBEIKYSRgXD2GDnE9L7VKyi4duKmKXU=; b=X
	qhKM9AWSy5klSNZSdLn0GK3UbVvK5MzfywJvsIOW+4it12DFGZhdt0Ykiv2NK0Hd
	yJPrj7VYO/Y6etjdlP5F6wkmz0ZtRAbTx0Hd4Bn1Avys/PsAf2fmE2eKsY6MxNZH
	A7kA3ABgwwGL0xtIeezhyKqqMTABK1KZ3umwUpu9ItTO9UVSSXT3KRR67xvLMk0B
	+UqSRyMH9LnA2GbNa76R6MMo43X7VL5d03RirPVpQokXUZw/GqTXmMLK9QqE4kJT
	ZN0pNbrKUnDykG4yl4MFoJR36Q7FdR6BzXqj32ckgbUGqFKVmBxb0/o31fpMzsZ1
	dzBIRG0L8kKPYG6v8CMBw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792438606; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:B1BYj1ll3C6z8Zvt94iNqno3s470J2fXIUNQkKXjUqKKB/a
	LCzZVWAM32DYPqaCwfTAtyg/xsBSPZf9vRy+MVQd02FG+kpLuiX7PoEr3NCLzMgN
	6nMwoKUOe9e4Tl3YSSOhSGvDJzSiPCDOIT4VWJVTimkxwF1XePHcAJ4jBzvzz7wE
	D9WECDrJMOKzlNBvScJrp3GFrdFiOjU9TynDdT0IY67Lz57v/PPDKRl0vQzYobko
	Y3wy9rQOv8MOJKCN+lwSqpRyLcb/0CpzVj5C0DDbQ46weSdRO4iIib0YPwcKOM9M
	i3q5XvDUbs749qgM6NqKll6p95NHXj1/lYJN/2g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:irctTx16rzorL5mHImqoOMQSaw/d742OSzy4Giy8ziA=:V9FTuKJK1+rnhy11hj1NYGOIoXL8RrlS7ZneRoBDcRw=;
X-ME-Sender: <xms:TnHWaooVCzzfdj6wJPU1z9Xgus58IMaJGEjr_SqhOOhmy2BBixI9gg>
    <xme:TnHWarVz9BpzprS0HTkvR5O10pIzxBigywwiuda01LnNv5IS48REEiPLAu6skq2WP
    G52wPg6k1gsx8QDJCIZRSLHQcqeCkD5ttRejhHiFyxI4XpAEcgmDFNS>
X-ME-Received: <xmr:TnHWahHF0zTwz_taxva67XykO_UDjcrLnHMl36iYi6g7XngaEkw6Ne-OmQkaba1sjfSXZmucuNPUS7sDjsoaNIQQZ8EgNBo>
X-ME-Proxy-Cause: dmFkZTEmBQwo+sf/j1ocKwc2/RsLqnHk33Sx/VCjkHynw/c/caELFOiXGalx/mofXmjPnL
    wm+KKOhmvwpj5rVueT42yNXbD5vQKy4cgduUgU3N5hgVFpyQGcqUyfn+XWe0Qez0wARhd9
    J+uV5sHaLIZEa+WsGRYXGsjXjHEHd+4axWXR5FmzONYIBUSInuSF4nSBLTDsmDjDV+hlcY
    bJgeQCs0NPbBjuuC4044qPHRbczAJXvNb+umMO+yXtWH3/B4nWGn7WyYrseYv983I+eT59
    3yqfjlVzMtGd7Yk0/rb/Ct8Xzf6bUKGFQLeCY8mVVP6lI9Ll0Hls25nqi0n3NaKV9xv5Qn
    2TgJOLQaiwO16Kr8pJzMNGV2ZTsxRv2HhEP8k6AFuhpyl3LI5uOgSWAR6bmPJT9jjTJriF
    qjnkJNFm5sSIZ6TjlJr2z+9ZExhXohrmWcsXF5RQ9LOfjYfHCHoJv5yitoe5856WTeKZZI
    Sa8WN8vvj6zR33F6Fs57pHRvSi7wcMZ1banWQ2DT7rQf1GG/Faclb6C6q4kEHpeEx6ljcm
    sw6ttqX3Xaz6oFgr1Dko+lBC0eKWtXSs9dm4Uf8HwjaDCCkmW6QhmaKdlFPc7AS8xS4qaC
    9SYNZc+7QMZ8TcU7EopOWpbYvofHtWVltYuw0NgViaC88OB7J6RlG4104AbA
X-ME-Proxy: <xmx:TnHWaqAhqsgt-hPrAnr8KXZs24NJoqNLn0lj93hiRrDeYKci70xiEw>
    <xmx:TnHWarxendGVLiBOefkvJ_8JduHkQqaxEAWr76J9iqhURIRjUoth3g>
    <xmx:TnHWaoeF7jD4K4SI3UDAXfdz4hS-wU2K6PyblcF4jMyimefiA6ehCA>
    <xmx:TnHWaousZGtCZ0SEriWLxC8RiIIsd9Xs1HWKnNhtop0CJQEKPJpFNw>
    <xmx:TnHWamWPR8yJGHKnbzbWhyX8CymfDmJE3rdlrhyjYuK7LN0ECFMvZMEF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 15:36:45 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Mon, 19 Oct 2026 21:35:42 +0200
Subject: [PATCH 4/4] media: rcar-isp: ispcore: Add NV12M support
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
Message-Id: <20261019-v4l2-add-nv12-v1-4-4a84736803b6@ragnatech.se>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6681;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=V9FTuKJK1+rnhy11hj1NYGOIoXL8RrlS7ZneRoBDcRw=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq1nFBvEx03LwbH26FuWOHNKW0i3ZyrCDZgKcwc
 xT6EYNItuKJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCatZxQQAKCRAJtP95BPlN
 JCxhD/9R9OJ9TB/dcokfHwf8+/3hdor+1S9PJzVcG3fE/5IuiN1KhfLhmVhrHS9U+7QpLPHntq4
 6/n36vVEOAmeSWu4YuN10hBkr7xiWUhmaxlCdqz9rT/6EpIJttl1AfXxjFnhNGL+6RetWNpfQmV
 B5rQ56/mjpS/bZx2XinOd2ML4gHIREPLMrGNuR7gYBbBciSi5kJ19o2DdyRoGMtO3ZaDT7yHnMj
 4ucTPIPUScLjI3XZgj97vcqO9jx7V7W2Hf6DO/oKYQq+eR/8l2X3awBowoWsShjmLws5MbSvUAJ
 mDPE1XZAkq/hdrcdZ3qdl8uEYlNhETNIOjkxPYvoJgF7qK7WpMJ6a5wSvuj/lqPDx+ggvctqiOA
 Y8chZzYTJRnmO7H0dRTJI2OgR+YqyIOMjVK3Vk8VsjgfMzOtJDzcOj9N/f407ZNphB8dcHgG+Mz
 5YKRq1zOsRELhi0p5uKMSlpu9AmSxN74X0gthJ1MiavDQkh3yRtnfDxZ24FwbeBfYbx17/ZQz0v
 sburOZQ8QBxou66liQYRp/gUiGb5CxbXsg4q4PV6uK3wstM6UGiGa39s5Iu1RQSokJMLnyDprPx
 g65fSkCq6LTSaFzIaGZZGjlgOE1y+g0cwV73i9dICMHZLlVyyIveLN1zmDbxOfSs/H2oqFydG8S
 n2I9RvBhi0losYw==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

It is possible to support NV12M output by only outputting the CbCr plane
from even or odd lines. Enabling support for it is straightforward but
one snag around how the DMA-engine works.

When the DMA-engine is configured to only output CbCr data from odd or
even lines it still outputs blanks pixels to the buffer for the line
where no data is taken.

To work around this and still produce valid NV12 frames the device needs
to be configured so all blank pixels written to the buffer are part of
the line padding. In addition to also keeping the same number of padding
bytes as the Y plane.

The DMA-engine is able to do this as we can set different strides for
the two planes and haw two DMA-engine lines (one with data + some
padding and one with only padding) make up a single correctly formatted
NV12 CbCr line.

For readers comparing the DMA configuration with the datasheet this
driver takes the CbCr data from even lines, compared to odd lines in the
datasheet example. The reason for this is that if odd lines are used the
first even line adds half a NV12 line of padding at the start of the
CbCr plane. To counter this the CbCr plane would need a padding line at
the start of the plane which is not supported, or we would need to set
the plane start address half a line before the buffer actually starts
and potentially corrupt memory as we write blank bytes outside our
buffer.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp/core-io.c | 39 +++++++++++++++++++++-
 drivers/media/platform/renesas/rcar-isp/core.c    | 40 +++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
index 48db37bad69c..a9c522212e9e 100644
--- a/drivers/media/platform/renesas/rcar-isp/core-io.c
+++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
@@ -768,6 +768,39 @@ static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
 	pix->xfer_func = V4L2_XFER_FUNC_SRGB;
 
 	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_NV12M:
+		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+		pix->num_planes = 2;
+		/*
+		 * The DMA-engine still outputs pixels for the height lines of
+		 * the CrCb plane. To produce a NV12 frame we must ensure all
+		 * these blank pixels are in the padding area of the frame.
+		 *
+		 * To do this the stride of the CrCb plane need to be half that
+		 * of the Y plane. The first "DMA-engine line" will write the
+		 * CrCb data + some blank padding, while the second "DMA-engine
+		 * line" will only write blank padding bytes. Two "DMA-engine
+		 * lines" will then create one correct NV12 line in the CrCb
+		 * plane.
+		 *
+		 * All frame data also needs to fits in the first half of the
+		 * line. The strict DMA flush settings used already ensures
+		 * this is always the case.
+		 *
+		 * Finally the NV12 stride of the Y and CrCb plane must be the
+		 * same and the R-Car ISP needs the hardware stride to be 256
+		 * byte aligned. By align the Y plane lines to 512 bytes the
+		 * CrCb planes hardware stride is always aligned with 256 when
+		 * cut in half.
+		 */
+		pix->plane_fmt[0].bytesperline =
+			ALIGN(risp_io_calture_bytesperline(pix->width, 1), 512);
+		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
+		/* Both planes must have the same length. */
+		pix->plane_fmt[1].bytesperline = pix->plane_fmt[0].bytesperline;
+		/* The CrCb plane is half height of the Y plane. */
+		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height / 2;
+		break;
 	case V4L2_PIX_FMT_NV16M:
 		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 		pix->num_planes = 2;
@@ -794,9 +827,12 @@ static int risp_io_capture_enum_fmt(struct file *file, void *priv,
 
 	switch (f->index) {
 	case 0:
-		f->pixelformat = V4L2_PIX_FMT_NV16M;
+		f->pixelformat = V4L2_PIX_FMT_NV12M;
 		break;
 	case 1:
+		f->pixelformat = V4L2_PIX_FMT_NV16M;
+		break;
+	case 2:
 		f->pixelformat = V4L2_PIX_FMT_XBGR32;
 		break;
 	default:
@@ -854,6 +890,7 @@ static int risp_io_capture_enum_framesizes(struct file *file, void *fh,
 		return -EINVAL;
 
 	switch (fsize->pixel_format) {
+	case V4L2_PIX_FMT_NV12M:
 	case V4L2_PIX_FMT_NV16M:
 	case V4L2_PIX_FMT_XBGR32:
 		break;
diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index cb9d9033d0cf..9be2f73394ee 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -341,6 +341,45 @@ static int risp_core_config_output(struct rcar_isp_core *core,
 	/* For all frame capture slots. */
 	for (unsigned int frame = 0; frame < 4; frame++) {
 		switch (pix->pixelformat) {
+		case V4L2_PIX_FMT_NV12M:
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_MODE(index, frame),
+					1);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_POSITION(index, frame),
+					0 << 24 | 0 << 16 | 4 << 8 | 16 << 0);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BITWIDTH_MINUS1(index, frame),
+					0 << 24 | 0 << 16 | 7 << 8 | 7 << 0);
+			/*
+			 * Pick CrCb data from even lines.
+			 *
+			 * The datasheet suggest taking the odd lines but that
+			 * would require padding at the start of the buffer to
+			 * create valid NV12 frame, or start writing outside the
+			 * buffer potentially corrupting memory.
+			 */
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BPP(index, frame),
+					0 << 28 | 0 << 24 |
+					0 << 20 | 0 << 16 |
+					1 << 12 | 0 << 8 |
+					3 << 4  | 0 << 0);
+
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP0(index, frame),
+					pix->plane_fmt[0].bytesperline);
+			/*
+			 * Stride of CrCb plane needs be cut in half as the
+			 * DMA-engine writes blank pixels for the lines not
+			 * processed.
+			 *
+			 * See risp_io_capture_try_format() for details.
+			 */
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP1(index, frame),
+					pix->plane_fmt[1].bytesperline / 2);
+			break;
 		case V4L2_PIX_FMT_NV16M:
 			risp_core_write(core,
 					ISPCORE_DMA_IMAGE_FRAME_MODE(index, frame),
@@ -436,6 +475,7 @@ static u32 risp_core_pix2bus(const struct rcar_isp_core_io *io)
 		return MEDIA_BUS_FMT_SRGGB12_1X12;
 	case V4L2_PIX_FMT_XBGR32:
 		return MEDIA_BUS_FMT_RGB888_1X24;
+	case V4L2_PIX_FMT_NV12M:
 	case V4L2_PIX_FMT_NV16M:
 		return MEDIA_BUS_FMT_YUYV12_1X24;
 	default:

-- 
2.55.0

