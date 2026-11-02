Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639002;
	b=mOCBl6BObk3rTqwGU1GsG6QCtGQyHRRJxx3ai4f5gNYTWCX0TvO1/+UVGbfRbC7I04TG
	 EoecMy4FxAc6B8XVV74r2f/3gGFDmb9/Y2COroJ1SDms/Q1Lw7cq/jGEDPXuhxq1Ps9qU
	 yko9YymUhyMwn+k2PQ53ltqbje+7dxSuJHaSyzi1GAx2yYQMT6kJfxS7vZmdGRCOjUabU
	 gJtnHS5Exdp5UCxZJ478UILZh7XrNIzKIgOxn2NEHN2jsUhGypHTwvHYEY95WD1UbguXr
	 yw1Hd1hsiiPY7Ub5RAeF78Q1YNjPkEo1ouUtSlyzP4v2O65u5Z8oZQd6a1Z/RftkHnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
	b=IWK+I6MHRpIGd2K/f3rTTvFGRmVOYjdtdLAefm7k2Gic1LbWWXz6Gc5dbbtOMiiA3tWB
	 zuQ2b5o8J971VOuVWGO9nSzACwnETVR+Ic1dpY5WailKpLswTkdj1tWsOr+bgmt+4A7Dt
	 OchOa5rkAVqHPOoLNL79CjyLcjw/EilvbvEVtfDgh4AeJfc+PSZzbakbUgvxbS8pSTLq0
	 MBs7Q7h17bdsFllFMD8VxwP7ckMpJue1vwlHgHiGkYqJrhOxmjBsoi00TeKpLirWdlonx
	 x2MnwNYS7KjQXvwEjeRpKxwTS2eRjAsmGbyAonabvVedzqTJQUn3yoomq/c/mI99t9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6aJWumm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B4F606C55F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B4F606C55F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6aJWumm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so34901615e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639000; x=1794243800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=w6aJWummwrLAE6LPz8/O1lQaaO79X7S4YqjaXnc8AafaQyhqWCirkes6dHuDCbB08P
         dwb+3gn0fTKdfnX2vbAudOPCgUUF7b5asHHFj6q+Uss3YRZHvI2Hi9kZ8QQbmJ/tqNG4
         mMeqGpafKlEsUAsQ8OM35U3NgjRglsFRW/FIUBVrpsYH7L0k7boQgjlurTmZtfim50fi
         Mqg2OyT0k5cEN+6+Iaz28co48wwkqDj+9hpWxEz731/8AqA9JM1ztqTm7la1qwKxpjc0
         3l/RZrWB8/a+vmo8pBSjt38JVafbz5WmsYKixx5TiXgdJ1wXC0vz0lts4le57b3uSQsi
         pugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639000; x=1794243800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=QWl47cFjojHb4lg2LU6ruEgfjK6ND9BJYU6fuudxLtagXSY0TSfoY0wrw2i9c1XRJo
         E/V+Jse9khNP/5GQo1KMXiQRuIGGT9cQYgOyXr6J4GItpm1qTB58oiiH7rBc+yO81Uxq
         0lgdEe7wtAMaFYsw+bS8MI7LaNWxcXg5rdLbKPEr53F+2psYvEB2lle7tUUvPARl3Wz/
         CrOsP3WxTx26eyHT7yRc40OTJJmQ5hrCdKyPhyPKmjD8FYeoYAlzKk3DvVMLcEtoaEql
         i3USOaA3a37Luo85VVPec/4rl2VpQRFMrI3tcM/s0G4aYeCiImjvqUV/A5/5JjqveQN1
         YGtg==
X-Forwarded-Encrypted: i=1; AKwUvBz6/OU1/XEgSbvesWJ+GYNLWhcAH3ijiM6Q8vWRyw1PfpFSWmSmmlgYHY6g/T9WWi2bmZKGfHuK+3JUfiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIYLSJjRS7vy79vu1xcHc1G9SPpTZnnyiBqgshxXgCMNlIeD1c
	FnlBlyjWpeS0aoen1oVGAzm557Lv1WObj53fBAiFAfu+HG8SnBuFKveo
X-Gm-Gg: AYBFou2WaKZUWqJUDyldarGK6GAHrqicOjS4ITnu4ExxgLGUULLZhCHbuRVO2+uYHNd
	YzUCqObYmjh/HvzQmy43RSqby/2Vx/DYpkkHUg8/9ahjJF27li+YGcm3wKDCZpWfu+GB0qXL14M
	wOEB9PMGjPGeQ+8xjqtpsjO4RUbLgc66CEtuibf50tAEFCJ+gZranL2fjB03DYtPWQPyusBK+M/
	Ug9mr98usbwWkhmgf8vHTqYnBmSwb6oPlGcmqhY8gvvAWA0N0mVMXr3daIqKIvKxNh0hywROdh5
	653OT5jufswI6KZFG5cGeLiCNqL+SV8i3nyDV+mMVqhTYucqtrDiEz74w6UzwwnJ1qKFf5Cjbki
	XHiYKg+RGYzUalnlFGYAM5P75Tfi07pFoJ79RhYjFsl+Bp1DmdiiunGGgG+sdFQbwG4ByQMB+jc
	W8HtQIb1vH3MOetO9zvtbYh9eBpYYyb0XPYXVpwvK6sGkJbPnxT06grF2AS0AjfaFDqf1aJl4I1
	aI1SEqAuBdua8XxCbe7hRmUBk4Yew/HUvRgNeazGH74ah6FZHiJFjNtLIWoWQawLI5Gx1xlbdDV
	WaBNbNtVAcfS7muW0jtUEzH9guC+BdCQOICn3MvM7ILG0gNvdWHDY3GhtxKJVU5JG1cvjXUN6BX
	gXSmYugVIGDP1paL3xYjto3zXa0lwSSFrttEczM0qoGbKYfmfUmqCjVrNlrtrtvdm5ZyyC8DPyG
	0Gh1nxZQffgEFzBaobcA31xerWcAxMIuW3vv32NAEe9msPXPzLRq5vZm5L+Q74oCnLtO1AXLcNX
	WkPBSYsBxNnKtZSyME0SW6AoUXDgN3IxzCfb9cVCt70TMW98Q==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr248056415e9.27.1793639000058;
        Mon, 02 Nov 2026 09:03:20 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:18 -0800 (PST)
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
Subject: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Mon,  2 Nov 2026 18:02:55 +0100
Message-ID: <20261102170303.1973892-3-jernej.skrabec@gmail.com>
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

The hardware decodes whatever picture size the SPS describes. An SPS
beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
are allocated, makes the hardware overrun memory and hang. On H616, the
JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
4216x528) leave the hardware wedged, so that every following job times
out until reboot.

Validate the SPS picture size in try_ctrl. Move the size limits to
cedrus_video.h for that.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c3331b4f3f02..45deebddb630 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,10 +28,38 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+/*
+ * The hardware decodes whatever picture size the bitstream headers describe.
+ * Reject sizes beyond the hardware limits, or beyond the capture buffers once
+ * they are allocated, instead of letting the hardware overrun memory and hang.
+ */
+static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u32 height)
+{
+	struct vb2_queue *vq;
+
+	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
+		return -EINVAL;
+
+	/*
+	 * The hardware decodes whole 16x16 macroblocks, and all capture
+	 * formats pad the buffers to at least 16 pixels in both directions.
+	 */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (vb2_is_busy(vq) &&
+	    (width > ALIGN(ctx->src_fmt.width, 16) ||
+	     height > ALIGN(ctx->src_fmt.height, 16)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 {
+	struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
+
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+		u32 height;
 
 		if (sps->chroma_format_idc != 1)
 			/* Only 4:2:0 is supported */
@@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+			height *= 2;
+		if (cedrus_check_pic_size(ctx,
+					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
+					  height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
-		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
 		unsigned int bit_depth, max_depth;
 		struct vb2_queue *vq;
 
@@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
+		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
+					  sps->pic_height_in_luma_samples))
+			return -EINVAL;
+
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index adc7f255d7cf..2521315abdb7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -29,11 +29,6 @@
 #define CEDRUS_DECODE_SRC	BIT(0)
 #define CEDRUS_DECODE_DST	BIT(1)
 
-#define CEDRUS_MIN_WIDTH	16U
-#define CEDRUS_MIN_HEIGHT	16U
-#define CEDRUS_MAX_WIDTH	4096U
-#define CEDRUS_MAX_HEIGHT	2304U
-
 static struct cedrus_format cedrus_formats[] = {
 	{
 		.pixelformat	= V4L2_PIX_FMT_MPEG2_SLICE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
index 8e1afc16a6a1..367e52158f01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
@@ -22,6 +22,11 @@ struct cedrus_format {
 	unsigned int	capabilities;
 };
 
+#define CEDRUS_MIN_WIDTH	16U
+#define CEDRUS_MIN_HEIGHT	16U
+#define CEDRUS_MAX_WIDTH	4096U
+#define CEDRUS_MAX_HEIGHT	2304U
+
 extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
 
 int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
-- 
2.43.0

