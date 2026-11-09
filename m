Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246671;
	b=lMkVJ2dr4QYQbThsa0zoh5cdjYjnmC67BPTJ3q2QGZ3hjfQrGHtgmL2IIuchvZYVxhRH
	 rQ6HZ4pPCZmIl+yMeEC+k4t+s/NvvW4alHAH3SwkwzJ2vgIr/onakAsaw8ghM5uhraSUi
	 8e5KYPUkCJwoBSgjdA+dd3qDP5u/zSNCZD73W83Hg/bS5iVU81M/vEpOSvl7yoKNBse/Y
	 WzK6Yw7EIeb4lXJN+lxIj4z5IXDaqCeSsXTV9+nSPGVefpyQNqu5B/iL3bREVp+uTlPzK
	 eXq2bfgyr9Bcm6MMexwvjhxGyL+w78pZFtWXLGQWe8XsR8gFO1Ghx5iqqPyoC32zkew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
	b=r5LN+Ohgdgf6L9bZ55VmnH8QYTfRU4MzgDawdUx+jXGx/ub9HMiC+G019SAGL6WxWjSr
	 pZOIeQq+LK86JtmuBq6R19/DCrPxYT2S9E9LNamFPwjshcWvLTKxc+/NYu1ntiz8F5DQu
	 GMtwMUpRO0GNMUB7Y2DNzaJ4YXLDQN7UlMm/rLxJvo1hWupQsuL3LlcLS/sFeRAkjYVbE
	 +BAnjOTZo+YTIBm83cQC9L4qT/PP3kGUcEJlZjTaPZ2ApJiWx3bAirOCUrtL1hsHJmmyp
	 U3xQWHUWG74igt79ieFEsatxDSxi77H1nNTawWSbzyEWw2ZmiEuEOBLVIVdIOg+Y8Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vkYq3KB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6229960A263C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6229960A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vkYq3KB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso806948f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246670; x=1794851470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=0vkYq3KBgJnH92WkNlV75oKqOta2YnOms6B5exYl8Nnlir+glHt7Is9QMKBbcY7zEr
         gl5FPuqIVjAVUV2tba1ddyLVe+iYE8IA8iutq53EMZ6NhaBM7rWx6CXYCBXujJjCOVZa
         xBEQs0Jtzhg4PflluRlFiy/9PYM3cfn2CviaF+K0iUjOUEf90jVCDjwbb5eoI51oJvQg
         Bd/k3cYHbab5S59HjaY84D8ZEeyHheSG8nc8m4hrZD21EV3yIwTB9pwHKVVXON07iKjj
         P+RHbsxtyu4gZs449lsCR8xSdTGagVMDMibvi4bdWdJSM1PukzQQa8ZqpsQv6Xr3Z9qW
         fjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246670; x=1794851470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=MMxM7fZwrYfFRUumPDfDzyI/CPnyl/LVBlpCQiUO9aXgfsatQFzZM8/kYm6zhrERt6
         m4K7dMQyr4M6gXocD9u6kt89oljXeHJhcCjndRdhuUqDTzzigLh3JQ5RJJjvfidCF/de
         enJUro1PbSW/+d6DnoTdpJ5MSOD8KoHgn7vizJXIU6VJa3w6F48eNzCibSn3038nuwO7
         qk40fOAPMPibrL67Z4xPrapeMEmJWomZ/RD8+EZ2+1sdJ1v1v+fAc++3PfA0gUNSVodw
         oSs3HpqQrunVG3+49h17oZi3HsC+CZ6uIFQroVA1X6g2mpXUDDzeaxzsU77Gnx0ptYxC
         QtLw==
X-Forwarded-Encrypted: i=1; AL+hErH3TDod1q1eQw2aYY/wUvQtGFvKUk/rCBRYu25NkHpudFBLd2qiM4/n2QVT6H+tLCTZVXZipC+sbJt+dVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XZ+KwISlTzZiYJubEiZuh3nAWcd1OvLo0uBQzi4qp+53Cz4aS
	a65q3hePF9067TMCoFu72DNNNwb7rvwEdb2vXNSQkQR5pBF84yiNWHuL
X-Gm-Gg: AYBFou0B9qEMg8dgLgHsqpN0w8eBrKEH/IyQAKQHgTLWfbj1PprSX5zSSFqosDggtrH
	viPsC9lP0wefsjBv2HiQ3vlIjZIynoiESXLCZVoRgtkskVP5QwlkrwvmUGATP7rpR+7W74ING9S
	HJLRVFb6idk00x7NeUvAFc3Fg859ZVIRbASePIZOgW0sD04Cc+vRATnYHO7LUNQs5bI4DTovVLQ
	h9LEL7Pa+nndIsCRHmcM7lSvbZiD/jMDX/S3gSO3VCWsCiQfaaF1aoYvz6g7b2lF/fvaAVj6k0t
	/m220KaZ3XiQQP7efeDql1eSud2Z/kk1SQizQzi7WvxR1VY9gwVjkoogN0LiOjKr1+FInAf8Szx
	lGwKIIbE6i4LBFueVY4CTBqDP78KA2cji2ppEdTXhdMjQHpz9/LWDqdpY3TdS6hTuj792BmDFlJ
	PdE3uz1FWs5n5zTVQQGeRUi6dyF+WxpQ0nCUIHykUmcg8EC0tktdJm92BDVNxD8Ym2Mc91Ap5MD
	L4+D1oob4BWJr2mm8VwLB3IuhVxOIRJtcHDhBQaUeDlg7ZQuLaLjoW7ETm77OgsVUsH44kg1O0s
	MQO9IDfR04xdMiEDh6yvK4i0U4SikoHTWJSyyUYaUw9XASOigLbSQwElDkxfwpxcUMoavI9iXIn
	5Kx8zGts8DqYkwxe19ZbmWdDOA6LvPY8WuMfXRTNITjAYehIrkmFpLEM+oaFQ4Lb2zLM3GMCsfe
	/w/7UQI7NVBPxSWuZ+XxiS78+CjBlNG41xYKdI8LHYG4S0Q/R79y7UZfkqWXEEAeRIEFoeuA5uX
	E6hmtKUHwq226Q7MT+PIOq7Op+KepgTWUvuhM4QQ8X6xuet9gI=
X-Received: by 2002:adf:e184:0:b0:495:b427:1e6f with SMTP id ffacd0b85a97d-4982e920d55mr359034f8f.0.1794246669666;
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
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
Subject: [PATCH v2 03/11] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  9 Nov 2026 18:50:08 +0100
Message-ID: <20261109175016.42061-4-jernej.skrabec@gmail.com>
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

The frame info of a reference has a reference type for each field, in
bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
long-term reference. The driver never sets it, so the hardware handles
long-term references like short-term ones, also where they differ, like
in temporal direct and implicit weighted prediction. The vendor library
sets it.

Set it from the DPB entry of each reference. When the second field of a
pair is decoded into the buffer of the first one, the entry of the
output buffer keeps the reference type of the first field.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 24 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index e8229c60d3f5..97958ceee8d1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,19 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				u32 ref_type,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -83,12 +89,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 	pic->mv_col_bot_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 1));
 }
 
+static u32 cedrus_h264_ref_type(const struct v4l2_h264_dpb_entry *dpb)
+{
+	if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM;
+
+	return VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+}
+
 static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 				   struct cedrus_run *run)
 {
 	struct cedrus_h264_sram_ref_pic pic_list[CEDRUS_H264_FRAME_NUM];
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
+	u32 output_ref_type = VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
 	struct vb2_queue *cap_q;
 	struct cedrus_buffer *output_buf;
 	struct cedrus_dev *dev = ctx->dev;
@@ -117,8 +132,13 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		position = cedrus_buf->codec.h264.position;
 		used_dpbs |= BIT(position);
 
+		/*
+		 * The second field of a pair is decoded into the buffer of the
+		 * first one, which keeps its reference type.
+		 */
 		if (run->dst->vb2_buf.timestamp == dpb->reference_ts) {
 			output = position;
+			output_ref_type = cedrus_h264_ref_type(dpb);
 			continue;
 		}
 
@@ -128,6 +148,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    cedrus_h264_ref_type(dpb),
 				    &pic_list[position]);
 	}
 
@@ -174,6 +195,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    output_ref_type,
 			    &pic_list[position]);
 
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc548ab..961fe023bb43 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -616,6 +616,14 @@
 #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
 #define VE_AVC_SRAM_PORT_DATA		0x2e4
 
+/* Frame info word of a frame buffer list entry in the AVC SRAM */
+#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
+#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
+#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
+
+#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
+#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
+
 #define VE_VP8_PPS			0x214
 #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
 #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, 28)
-- 
2.43.0

