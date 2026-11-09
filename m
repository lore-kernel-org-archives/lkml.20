Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246677;
	b=synJi3OF6+i2vAIgkgO3XRTqJrtq2cOQF2gux9Wt1bB4pwphIc+SuNM4GidnL1sRN7wT
	 oUIYV8Oymt0Cx2mNM6GLgekVvLpnILBAY/Sf7O1PfbS+kEfZ+E3S9DFtBqgnOS0apUnIr
	 tXRBwNE+qr20peaQX6heEgT4xEEuG1Ym6lTSyExc8IvTRu1WLXvwBowaiNtpMWeWkCZ+Z
	 o/63Vun5EaV/wnhOzlt78e4JdrIH4tUN1bqMCtMSbLYd6OtmionEqq9R0fKDe1s8pztsF
	 N0cDu4gTVVa2y//MuRzJrw+Bk/HQQGzy2B++/st1uBU3HBWmtUqZel+03WN3OIrzKRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
	b=SYxoV/aiyYFVLlBEoadI3pbB4/VtsnBH/Z3ONaTMvhCwGr9urtyfjIF3kdoaFpD9Oxeh
	 uNbPdl41mm/kwWNL1Ogdq7Q4o/Ry7fuXnQZ56xPNbwDq38svsBBbyC0oL2OHCpnXxwsw2
	 gHNVy7GLAuYT+f8HsmOeNe8oRlPD2ZJf6qjLyiVKp99ORJ1GnX7NvtW0tunaRXx1meswV
	 c2AtOwk5EqdDLNvJShcwks2lXJL8GfFsnylYoD8F3kybXLmHtTZLZ1cqkA5wIBEvvqnVi
	 R1vK7HhddoEV0wBU1Klcyl65jo2L8PEsepiyAdjWmjA95uVatG2/OVhk0hzFRkiNRgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFj2wQAH;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110F60A5BCC
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3110F60A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFj2wQAH
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11478155e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246675; x=1794851475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=uFj2wQAHPEFRu5o+V9QzgKrmpmZFhpR17p1/BdPuKU3i9YXvay3sqVHBT/wPdUvMnE
         2Gq1j4i4+bGR2mMow6WeB4H0dB+W+G6Aviu8wrvTVtplioS8onpQbLUaNPFqdYHJ+6tH
         aJAEk36ooluQymg3lAf3B1MojQWzrMKiWW4SMMU/0NevIJUwI9xHXHjryFbdGL44dtX3
         FnZsIU8sckk3Lv8nGoipvQZn3tcdkLtNum027x63iPnmbzWeUmv2WCcH+Zd6b7DUyAH7
         XqlFlDmZ+qEYcKuOpSH0gOKNIJmwuahxZDtmX8y+yxayTl8vtaHn8QoDp6tEy/UdDO5t
         ErKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246675; x=1794851475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=QNyHyvSuUeHXU+MGjcWXQRKo5jd8B9IHYhVKn4iLeyI8h3MCCyaY3tBL0k++4QESaL
         Kg5xxIzKvlf+aQlk9aR1l8DW84LAxrREc4qiBKyJBTPapQ3rT05N6UXVayT/KjoZTpsJ
         YU9e7tiC4geWX2dhgoDfYofKqApv38Ht9uCeC5QPPb5kcBFjU1EGTPJ7ozkl7CjPYSko
         Ft0Uz/vmxErTHXhD5wXC+gcTm3a/8gS0YHL+Fkc4T84JVdtIZTAX2hOouP2IwIwjaXm0
         aH+a/+AjzfWaIqs/htfCOfftKB0N3mFsOKzmWkECk3qrftB5TQE/PtMjId7EctYFZGmv
         J/Hw==
X-Forwarded-Encrypted: i=1; AL+hErGS68MzU5Lrta1QsOXI6klMYIABpdBwEF/XD9x1O3hNzAsO8jNri2tZh17DbyUAbE0VkgA1kfTlx4+pCgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yyvaResFVVlEGxo+GPNfJI1cOypC1xGhyaIuGgK6t3PW8rdsP
	j8k14NPjb3/nRHf9KRJRfU7D0TtyIryZyecLsxteaDqd8zNIgCLV2ME+
X-Gm-Gg: AYBFou2c/eaywMa4xj9E2MKJZpTigSqeFfG8uM9QZh6xcPhRyltTaQulJ/mlJV0TuKD
	1WBycWipJg82wKa9YXj0YM/pG5FfY/zwL7XIaKKktoTjGBRUq0poEXjujEa3y8i8UZN07h7hiCO
	Q9RqmIV5L93Loz8qItR8j07OUmjzsUPZOCluixwYuvoizNGgbyL0vOeH/7VrP06Fyr9mkbzed2G
	udqTF8bIo7vMR3iTWEujsrrrE6pAs/RQWrOOShVw0u2wRtS2nKo4bfNWHtp0nke0G75+PxkBj7u
	o4E0ybyt+5fUHJYSFJP6CDUceR+gqufJ4LtjSsdvVMv6X/K77jscYH/hsqwOy8aOstM/rGbtf4U
	s2xGcbj9JBLnkaNy5LpdSvpozmfZvsRr1XIzCERpzwkiDTeMDzJA9t8qIG93jlQKzfdi9xxnddn
	6nZMEWi1CQQ3k3bsWVd34q25Unxo+HH418Z4sBExIpzkjZQ0oa7Cf2LB/D907r/3u6zubVLx813
	NdVIcsqkPX53YCjVXC1R8n/S3UzSdqPKeLe0VQOdwPNis7CLUZF+pvgTnl4UPqLsMQJHUKoW+Kb
	zbKEKCLMBKdV4mF+iX9c7Xpm9/bLR4BDl3O4e8G+mmTOPUwlhzoc33+rt+oCjoMzlWqhCbBkOe+
	uQPDRYTfMLMsP0Ds6F3MNXDvZjkwvqwtmLAq89tf0goy3AUffW3QM8q9Al5EUwkxCZZhT+1f/xe
	87UupQhTqJOs5sYh/IVVg0ZG+Id8NhY4tu2rQlO0iTC20l6zI06B1ZPnOaA9pcTkYd+coAKcItQ
	utDD2ezGbjJ3YqZKexwMh/vdvDRz8DwrIqoGfzr9phel391TEI=
X-Received: by 2002:a05:600c:1d08:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4b963c8156fmr85596545e9.28.1794246674551;
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
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
Subject: [PATCH v2 07/11] staging: media: cedrus: validate VP8 frame size
Date: Mon,  9 Nov 2026 18:50:12 +0100
Message-ID: <20261109175016.42061-8-jernej.skrabec@gmail.com>
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

A VP8 key frame can change the frame size. If userspace doesn't
reallocate the capture buffers, the hardware writes and reads past the
buffers, which shows up as IOMMU page faults and decode timeouts.

Like for the H.264 and HEVC SPS, reject frames beyond the hardware
limits in try_ctrl, and fail the job in the setup callback if the frame
doesn't fit the buffers. The VP8 frame size register holds the size in
8-bit macroblock counts, so VP8 frames are limited to 4080 pixels in
width.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c     | 10 ++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 197213911bf7..6c6aa45f5f96 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,8 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+#define CEDRUS_VP8_MAX_WIDTH	4080U
+
 /*
  * Reject picture sizes beyond the hardware limits. Whether the picture fits
  * the buffers is checked when a job is set up, see cedrus_check_pic_size().
@@ -54,6 +56,13 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
 					       cedrus_h264_sps_height(sps)))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		/* The VP8 frame size register holds 8-bit macroblock counts. */
+		if (!cedrus_pic_size_supported(frame->width, frame->height) ||
+		    frame->width > CEDRUS_VP8_MAX_WIDTH)
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
@@ -248,6 +257,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..fecca343bd92 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -662,6 +662,9 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	int header_size;
 	u32 reg;
 
+	if (cedrus_check_pic_size(ctx, slice->width, slice->height))
+		return -EINVAL;
+
 	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
-- 
2.43.0

