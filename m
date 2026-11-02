Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639003;
	b=CtZm/DpS260HhdZgim6tYJF9FkcEIZl6J5SQIJjJ2lMwA/lcLJ0VWuWl9yEKwmJUGbiI
	 MeHSzrx2y3UoWsdnl9Htk3F8nX/czO+wd6j8c9FYyuglHOkfSHXIhtl4Zbxba3HYYo295
	 aBu5UrqaD87rmkgTBwaMM+oLBHz6vSf+/uro+JHPmXWUcRStA3MEFzWDmf415e5gFCHwt
	 9PaAKmv7ziFl72BG/AS73D8SShckiYAc5SiTCz4F3pdVo7gEcYnvuhqK0M8DN/vcNGrdS
	 GnNQfhrlYp8OKQiO5gKA6SX3+r0CjqWTzOXLj1Y4yxmyfdTR/MwjBr7irOSNLbVaRpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
	b=rwYTfqhoEnFGCBIIrSerNbH27zQuQkClfzNW6WkPsNYnT1oJiq57gU+kKh7pkyolrX2S
	 j4BaMPvZYuyX7vXW5W15ws7j7Bxfg/Nki3s2puGCWuslYX2+hu2pqXddkp7VvGAsgAekj
	 wGZo3OoNnvxLgoXb4vJKO2UypcuVXi3by4pzSWm7+DEj92TIDEOcXq8fptFf6YYBNm+C/
	 1mejnxctSVf+CEdi/RAChBRYhKf8hM8IlUsQMN1AwcZXyHKoFTE+mrQyHB8L6kMFFpikc
	 7XB4PmnzwY0y86pVmS2rHDuAdgtkD7m6R7Q0jEJJKzTimVSExdEKRmJS3MfLDVDh+SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXnOaR9o;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA8606C56B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAA8606C56B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXnOaR9o
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1645233f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639002; x=1794243802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
        b=uXnOaR9otSvJ3PSwNxNxelHyqqYoHbOVSwZPsrIc01AGLza2N6pHQTf/NUGBlsM6Ew
         ijflrTWnlHkb2JIoyOTdM3Jgrxw/mExt0ZDQqBOB3kCHX3aTdufNf2gjl7c7ZLSEdiGh
         yiylvt77GjBJ9Q/BqxIqGSSXTXzNcuLlCGn4qbPoAU5g7lPhL6eKObqH1gfLi5lZGU/Z
         c5SclH9Rk2scYbN4eUrdh1P0vqp3ukF0IaVv8DkqSBW0Nk9A8ADdDmNCSc5oepwRU59Z
         CyfCnFp1ihNsmNUtpy6OugnJ2k76k9JhB2E7rL8lwesByEz+AoKYEDgvW2OYhJ7SSySx
         BQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639002; x=1794243802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
        b=Oa+7sKml2YYJIQh+oGcFWQl4vTyO6PpaHr7IWxhKgMYj3Q+la01xGWqjKowQZJVSnk
         Br7/XlMA/wXplQwL5fOEc5PeadQd494GBnkU2/RQFCQ5NDthv4D91RkPVkApIK4Q0fNu
         5pbww/gHPsfPUtKu+Fb3/jN6ZbknQKyAqMdUH40xQcFVyT18aX7TIDsbi2xBM2v8a7dq
         jz+OkvY+zJf+ZJvMtup3w2eg5naMqDOmgiFJIDelAje7Ql4RLInu+LlFcFKdP1wUlnli
         e6viXrvuNDmR5gF+kLa3diBva3bxvp0aXDp8X5x8i0FqGnoRLDOanLPaFC+q/ZkyDUVh
         zuoQ==
X-Forwarded-Encrypted: i=1; AKwUvByYJ6shIzSIh/4DElghlmjNL/BTLn5W1VPFpkfbSemCZyVSEEhxD9E8py3WF8OCQCIGlycEr7XB2dFZY6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AqRo5iabcO9gs1orgQRy0JmRKW1Q4GyPOOLGi5xkLt+/wiYGE
	rHjYEu7uQ2JV5Gi8s9ihg276lkn2gMyDiRaXc6enChApE89P/0a81pcF
X-Gm-Gg: AYBFou2O5nY78pzD16sAXWp3VNG/5EpnRrpYA+EAar08yDy1x/hFhK4GYvmVG8jcteu
	OsNVPTbmYxP7vCux3923hItRE+XbCB7YM4gNuPyXTRumuZgsM8MKwrR5r8R1LQ5ajFmCQt5Pm1H
	mB3EV4GjcGWlYjUgvEbR4wSjHCHJRfG/+sRILuyV9mRDk7Eo+41Jq3uIKXHTKVVCuuiMgF+hUJq
	QF1aOsT3yq4C39XPYlzTve01frZQq8CPm8xyslDgRfV99TtcKSTjvcaMOYCuI8FiCz/poksZ5K5
	EJlWrYdq8TrVAzuBX5optSrEGDRRdgy8uSKuSuaPKVoA3MsZcDAqj/xawgDl/GQhrSu+O6LaWur
	G7F1gj4t44XSf1ER6QkgUzF7NHBgn1DQBIYvAFW46SIDaz6pfLSrIXqa3Ifq9BPFsdNFXoEOcTd
	ImFEKgErFLcLYB1wC+q7NNBdMhYPtsUftmAanUsbp60eY1IY24aieNfYsLYH6Hv2FRQSbuBkeN/
	FV/xRa2qGFtHFf8id7pdM7MK9ivEjvxUYQ0/jVQjx1uGvbneWsrQmD/cenKMN3dfS18NvV5n/hx
	lw4/BZNwsK2qMpF3pANeeqd04WXk9+re6Qjj3/zBuCHk/jnoeIvfk7ZdIbAZfVtzzYxmlEF4r38
	v2fAmU/utIxqvLZuclCjWubSJ4+ilvRFwKbKsK5zLvbIFDotKnyskFLanAvBHpGCnhJOHsAo1dd
	5quC/AM0WxIXFebcbVu5Eq3gl1xcvTtV6wRTrxnoqb3gl854wqHLKjJ9VA2+5tC8MrP14lcCTO/
	3H1MxheGUqv/6FJigRhdUCgxP4y4XRJb3UnrnzyarBowRAHqqbinAn1hihSRUT6FvtOeJE=
X-Received: by 2002:a05:6000:1acb:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-48e6e4f56dbmr22985553f8f.41.1793639001832;
        Mon, 02 Nov 2026 09:03:21 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:21 -0800 (PST)
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
Subject: [PATCH 03/10] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  2 Nov 2026 18:02:56 +0100
Message-ID: <20261102170303.1973892-4-jernej.skrabec@gmail.com>
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

The frame info of a reference has a reference type for each field, in
bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
long-term reference. The driver never sets it, so the hardware handles
long-term references like short-term ones, also where they differ, like
in temporal direct and implicit weighted prediction. The vendor library
sets it.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 892193c12b2f..a716955655f7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				bool long_term,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info, ref_type;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	ref_type = long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
+			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
 				    &pic_list[position]);
 	}
 
@@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    false,
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

