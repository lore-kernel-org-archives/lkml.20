Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638998;
	b=U6mMSugOSCNTQ1CQS3vUGhkGlH43bUmgwmVoIUm1nuEBu/hSgxMFodkjup3HJ8uYb88w
	 JQOwCsd3hgA+F5VrKzh9MUVB3MCPDjeAi5wDDVhkLNIQWrwD6czSPLUGiN+7BV5erqKCo
	 Aj3tUnZl1pYQLCHmGi9fCxD/JCX+xM0E3BM+UC5izk+R6UNrjP6LYB9moQZEAwU+s/Fdi
	 KSN/ykXnvZEhm00Vc5SrUE32hpn1RrTBwF3N79XDPHhGCiRMQu9pIe72YIufOEneXFKK7
	 HTzK5sdS7xh9K1lw2IelxN9xo5ctLkuC9vlNDVJRvjvlkmHRekt1sNy/Eem8Zw4TkJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
	b=OADGOomLZQ/h3D19vWXhzw9jaW9jiqOKge5E8u81gU4fnuGKu7KHgOqgy9tScNgh8r9H
	 sbcbfeEhRUsAr9VesRkGNpdPS5MF2qYrr36MakwzUTlbaTePvftLiznDs/0876TeLOjEN
	 VVdD9Aus4rhuIjpOFTdHHBatyih8KEiCmF8FbuOaOXmr2MLY/cQ4bxGVLrN8so7ts1ZMj
	 fFI6U2e1th7PpTLRn49QRbYF8Tj+gsBvloU29Go1fECJWsSNjoEv+25XEoHSm4Zvuyj9A
	 7z3PTI3SVEtpzsBI8HuseMxAqsb6HHmgGWQOfPlJ49GYd6pJ3F2ju+4gXuxHutrJJVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1yT2Nit;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF81E606C545
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF81E606C545
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1yT2Nit
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so24998095e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638996; x=1794243796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
        b=M1yT2NitDz4CXfoU8I1R0c7bOY+0ctNnKpitvxEkOW5AD8sJlO+yw1Vee8xNWn/4XF
         IJA5+o2ewR05bZTyR39aUKC2JuG24zXhi97etjwoF0JfzYiyXYUm39IOO1YEByRjaFO6
         0KPkGKDR5IqXZ+LNUVlFeomD7/LmR3buq0rhtuq32yLqUYTxKicHjmcxOgixCH0OUSFQ
         JgLe+PwlQZdpGYe8T0GenpaMFVpsNcWq0GIjm8xh6KnHyDcjoUxjtopa3fDndjoGuZ8T
         97BnQoaMUA61eY0jxqJfa0qsqIhZHUU09k1EHPHxyHrbhJXrpJ4hi+pFBFX6z8blH5ze
         114w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638996; x=1794243796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
        b=H2XPdu3ieY0iwGPAlBVJ5Mbph3kJKMH9a3xHWm6vkNqKjHokUCLdC0v9VhwiO6x5RH
         9h93XK9K5qvbJAbBS+YjuvmynsZDnjyxEew+Zzt5NNNPtiLxFfXBqGESuLxJkOthLD68
         QYscVTQwJv6yWnNIalT2dLEVqW/DImWduFe7Iy1FwknkkfUVuo5uzIuMN01IhzTWDOwi
         NtOtMrlKI+OtYRLnTbWzexXo04t8Ya4UAzs5tEYCf5f6EANLRl2zb6R9Ovy7lMEsW5MC
         y3zGZOdRGW/NnUsMHubJ8EcGnAiMddPy6YhIQhTSeoGkh6M/SNvlHpWmcYUjP4IiI16A
         TfEg==
X-Forwarded-Encrypted: i=1; AKwUvBw0Qo+O0crJ/2BPnjLSF7WeONUoDLjziim8mlIBjUANTAOdY8osRjhHZaRNPHj5zzWWaRBRknS0EZcyTHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIveFqSDM6S5RtnF07NTvOUfpEOkWB27T4JkAIn8WgMUjrnGA+S
	NqWGLCoc3Ef6kLSOk2u2WSKhHqIcld/IZknkrybFaMokSxPmwxm507f4
X-Gm-Gg: AYBFou1CifjAybV1jHKlOOA6Hc3ufrME/7N6eZHw2zajvZ2Y084POSYmdBkGDD4/Ynj
	0iVITKC5T0kDZG2qjTI2Tqon+MwKNk4tnyTEH+pZMtMZo5gIeu/5Px0qABIy6GASn0F49TsQ4+v
	E/PAqPCj47y1llwXpMvZDi5TDHwp8NJqVhCrI+2lnEj+Js8nexZMCVqg9SmMXJMCxcBCC8UzaQD
	vJX5S2ZpjPrudAlLeRN6W3ExkmNhGFeAgP7EaTJPhyKW2TbnvFAKK6Q2ro71ss6Boj+eQJh8dJ6
	7h3HSMTdthT6IhNkX3sBtjtWarSUctP73fLuBQvvbjFbgCBxyqa3Dy5irih95k4hbLPczzMXdg9
	0cHoILBLAZ+GHgKIO07mgKIIkJdRUd25sKZGwiIST6hPFxGYlhksW0Ijx3e4SLTt9KcBKhXsYxW
	tYZcGh67DceWVcs9CfQ/fTkQddZ9Wmd0JEKwSbF2a6BmC2D6vM7wtFN+pffIiMcZFnt2CE3BHLK
	IJ4HKPQ6R3t0+DV0TN/QisB0Z8CpuNgMJUNM2FwvgLIWRbgj5ChRCfrg7EVtxMwrBtyK3V8fsIh
	JIavnu8Jw8H/6As+GrozgfkZMYGPIBuuFzd0PDf2Mx9/rGch0ad3If9wXI9q7acrcvbN7AvJGUc
	Y1l6ZgbNKOtaDjSeQynFrEJKSqp+vd936FFqGu0ja9jSyRLfVKTBfqOMD9L7UtpTFfiEPNflO9d
	XBypn8U+vgghNfUslhsd7wG6/ODr2Ae+5wZPuteD3Qq7pIz5Zef8Q6ufL5LjLugcMeWvfmWno5A
	vMv0ja5i+SKKEgA7T9YZYTJLKMMy9HJSTzozzjm5D2yl1k4yw==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr260803075e9.17.1793638995840;
        Mon, 02 Nov 2026 09:03:15 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:14 -0800 (PST)
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
Subject: [PATCH 01/10] staging: media: cedrus: free MV-col buffers in buf_cleanup
Date: Mon,  2 Nov 2026 18:02:54 +0100
Message-ID: <20261102170303.1973892-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

