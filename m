Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246669;
	b=u6FZ59adpG/WUOy9tUVIDVigasnBrrRlsBJ873iI2f2hipa6SWJSSpYAeHTCLWrsqkMU
	 p0Lpth0X7kIgu4Vb+R6DFWtmLN3y0Y9LfvM5/GAZet3y0Huc5ZemGr/iu3WxVMTXpPSGH
	 nlwEvIOsSufmwjVtddJZ2NiatR72i3sjoiF/9d4xOhSX8hCUOBBe3IPuTQJvqK0p30vas
	 mO5ybpU7Jy5YQ6pKclqljm0/O+qzMo06b6Cp4swswSRXHMsxuCwq3+Il5yMAW/K0wOjdZ
	 hdnNcmqlIS85E4gOtrSEi3Yyjog3iB90at4IXBdB1/ppsduWVekobCYrCl1jCjkCjxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
	b=x7fZNi6XpqAEb2F8KapnGJ2Vyj2gbRqzvTere0zCOlv5PjtDzOeGCD7RPWrEQJwBJNaV
	 h0ZftgsDsy9LzfFtbAnCFG+cCRf3aoq4WeNO301QBbJYUyOLY4nfsQRzp95oKqAWAcgoM
	 7iP4N+xCC7c0CI5LUp8hxsCsSxyoc1LX4pEl6KjQJHsmfaqOc7BHfL94qJfp+3hTLsZWY
	 wdgViPcJmUu5YcF+g6Q4GcYLXZx+3m3U+mjF29/o1m7ey8p9WTgzl6Y17FxpPov3Dk6kY
	 nzmjAo5CIRf/HE7lbnZk2ilYxkIji9zrZvDP19I/jdq+eoF+glmtiodzBMntY7x2cFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LBTXI423;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0779360A2602
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0779360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LBTXI423
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492690dd5daso829670f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246667; x=1794851467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
        b=LBTXI423vlgi2O7BVRr2y01V367QWyvFHRmNVLQOxObpxeEsi9isoJH1oStcBoiik1
         YLXUaGmPdpUz22qXIDsHZGx/+8AE+C/3MdBHvbZo8nyhmG4UpaWCqDPDrebSOTsee0vT
         hlKVNZUe8Hwa1MqEauWi5lzQv2z14bufd82bj2AwPu8CvdBoo2Dyrh7pdKt0TKfIDjLL
         s+CDJIFRBPnt5T/LzdMgDSJPpL/km2ofABy4rnhVrGqcZPhiU5Wn3NKqd3xaS5KK8sxf
         rDp09mA8CiG8PlVUE3TD8KG9rXPBKsn4cuTwN4qZPLq9g8xBxiVjGs5O2hNlw7XOmASS
         9SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246667; x=1794851467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
        b=DMOLLeYvlFOPYBGZc6uVvoIMMIOxGXQ6PJIOiG2AQ2tlhOazjFv+GEDIGDOni9krkP
         ySK8Xpgog6Yo/YQ5Gutj4ndcUPmacjnEKfqGzIY5MYWZX1bqQize9WMBmqdGEINoiwZ9
         PjvhuXVbogkSdUXd4XYRJVNQPlRHgWlFH4PkVkschglR0nsijGhpJ1QQTwhFoM19MUNV
         nLEkw2xbRWVrEez/YtTFrngyhGylLhvjyHmS82Q/DlANOVHE/eGmPhTWEBlOm+IHx1uY
         DmuT87G7txGB9mOxzs7RezNz+JR0Cm90lsFRkYshldAlF1umQNfSRFPs9f7Oh9GSz4sp
         othw==
X-Forwarded-Encrypted: i=1; AL+hErFU657y/JA/jzTpwoRk21F9j65M2mK3K8M5lzPtwv6aJBwfRSWhKtaVtPL0oGcwjvbO5qfIv85YuPoOME8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H24ScRkdgPwJqqeEowT07UrCdkxURD8Z290OYqYKu5dEiUv0C
	SgAam7RxfVXMCkH4+QG2q+y1TdbkVl6i0kMtb9y4wx2BXUCeO5EEGd4n
X-Gm-Gg: AYBFou3a5N3R0/wueg0tc14/o8cWXoPmBOElRDo3UAgtYnAr14oMaIE+EE7UXO+pcda
	HZT9nSN1iPPugNtdB+Om/fxIyBZzAe/VKWAoKDsP/wr62geneIcgBVn4WU0rI280D/JRfrR9qfF
	jgBiQp6/2l5ZtJX6PyHm8rw1KBpFPa+wvI8sLN4QHqcFnhjQOZyaXaa4UoDSBdKzGehZXEFYXIu
	YbKmF+W7mJAwNmpysxOYT5n7k3VwaHKbbAnofY4ii8O7Nd/91gr4bKAUpmWIBT6nueocLxArapV
	27gfYl94cB9nihvFbkZ6Jn4BqC9ki4AS9LMpgnzIx/XB+dFK9ylaMh4apiL8xagys1dOxLsQH52
	XnkwhUNxZhXYNgzXdy/C/5mOLZqXfJUeWO93cIIr5bMk1AFcV9Xg0rmvYf4cjUP3ksDWF4C4EbG
	YP29v5ZGgA74f6WA6goYjkMVnS8+yFxD8uqnaWq5k6FXXgx0mhUBjt8ie5o6sEEhmS4Lolskdst
	8RoPvhmFWC574IezeHqC890Eyk4oVDdkXLFNDnzifIFJZ2GlWmgWJAZJgv503UDuvak6yM0vquF
	niRCuVcpd1+AH/0aUVhHyeNl+q/4YGoRiKpekmjvbWvwTAWlheuVJ7Spri3jCeJ06a7gVqnw8oe
	jObb2hbsXpalpjtqzKYQcpJYONQpWsMzTeawUqTx81G5IC9j6z57NbphCtMhI6+ms7QSP+DsWT3
	s3FxMj2pOEGBt9/Ry8ZKEm7Z10E3ODSI17ia6M2KYdut9A2ya29rIsiumG/W/n4Et5yvKquUawg
	jXhWPUUHX1kIwv3g1V2OAptMsl/PV404q/JjIJoiKq6RhWuXbY57E91+A==
X-Received: by 2002:a05:6000:26cb:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-4982eb0b774mr396069f8f.26.1794246667071;
        Mon, 09 Nov 2026 09:51:07 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:05 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 01/11] staging: media: cedrus: free MV-col buffers in buf_cleanup
Date: Mon,  9 Nov 2026 18:50:06 +0100
Message-ID: <20261109175016.42061-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

v4l2_m2m_ctx_release() releases the CAPTURE queue before the OUTPUT
queue. When userspace closes the file handle without STREAMOFF, the
CAPTURE buffers are already gone by the time the OUTPUT stop_streaming
calls the codec stop() callback, so the per-buffer H.264/HEVC MV-col
buffers are never freed. This is easily reproduced by killing a player
during H.264 or HEVC decoding. Each killed 1080p session leaks about
2.3 MiB.

Add a buf_cleanup codec op, called from the vb2 buf_cleanup of the
CAPTURE queue, and free the MV-col buffer there. stop() keeps using the
same helper.

Fixes: fec94f8c9954 ("media: cedrus: h264: Optimize mv col buffer allocation")
Fixes: 0ee952c2f484 ("media: cedrus: h265: Associate mv col buffers with buffer")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_video.c | 10 +++++++
 4 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c4b1217c14b6..54f867949fba 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -167,6 +167,7 @@ struct cedrus_dec_ops {
 	int (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
 	int (*start)(struct cedrus_ctx *ctx);
 	void (*stop)(struct cedrus_ctx *ctx);
+	void (*buf_cleanup)(struct cedrus_ctx *ctx, struct cedrus_buffer *buf);
 	void (*trigger)(struct cedrus_ctx *ctx);
 	unsigned int (*extra_cap_size)(struct cedrus_ctx *ctx,
 				       struct v4l2_pix_format *pix_fmt);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index fc54d993b11f..892193c12b2f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -647,10 +647,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	return ret;
 }
 
+static void cedrus_h264_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h264.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h264.mv_col_buf_size,
+			       buf->codec.h264.mv_col_buf,
+			       buf->codec.h264.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h264.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -662,17 +675,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h264.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h264.mv_col_buf_size,
-				       buf->codec.h264.mv_col_buf,
-				       buf->codec.h264.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h264.mv_col_buf_size = 0;
-		}
+		cedrus_h264_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
@@ -710,5 +713,6 @@ struct cedrus_dec_ops cedrus_dec_ops_h264 = {
 	.setup		= cedrus_h264_setup,
 	.start		= cedrus_h264_start,
 	.stop		= cedrus_h264_stop,
+	.buf_cleanup	= cedrus_h264_buf_cleanup,
 	.trigger	= cedrus_h264_trigger,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..6c643862ab73 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -858,10 +858,23 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
 	return 0;
 }
 
+static void cedrus_h265_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h265.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h265.mv_col_buf_size,
+			       buf->codec.h265.mv_col_buf,
+			       buf->codec.h265.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h265.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -873,17 +886,7 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h265.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h265.mv_col_buf_size,
-				       buf->codec.h265.mv_col_buf,
-				       buf->codec.h265.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h265.mv_col_buf_size = 0;
-		}
+		cedrus_h265_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
@@ -918,6 +921,7 @@ struct cedrus_dec_ops cedrus_dec_ops_h265 = {
 	.setup		= cedrus_h265_setup,
 	.start		= cedrus_h265_start,
 	.stop		= cedrus_h265_stop,
+	.buf_cleanup	= cedrus_h265_buf_cleanup,
 	.trigger	= cedrus_h265_trigger,
 	.extra_cap_size	= cedrus_h265_extra_cap_size,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index ad4ec3490775..adc7f255d7cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -560,6 +560,15 @@ static void cedrus_stop_streaming(struct vb2_queue *vq)
 	cedrus_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
 }
 
+static void cedrus_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct cedrus_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
+	    ctx->current_codec && ctx->current_codec->buf_cleanup)
+		ctx->current_codec->buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
+}
+
 static void cedrus_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -579,6 +588,7 @@ static const struct vb2_ops cedrus_qops = {
 	.queue_setup		= cedrus_queue_setup,
 	.buf_prepare		= cedrus_buf_prepare,
 	.buf_queue		= cedrus_buf_queue,
+	.buf_cleanup		= cedrus_buf_cleanup,
 	.buf_out_validate	= cedrus_buf_out_validate,
 	.buf_request_complete	= cedrus_buf_request_complete,
 	.start_streaming	= cedrus_start_streaming,
-- 
2.43.0

