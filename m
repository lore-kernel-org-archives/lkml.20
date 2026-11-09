Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246674;
	b=Oy1vv7vi/s1dHneMR5Z76P7qwW5Jsdek03GeXKG1OfrxeGazjXkiPO7k8UqmI5bI2kwI
	 0qINgkpjRDTe9Dood1WZL5KbqtHgNrM4oeweE9kp+A/YWGAqxdTKSO/Sq6TV9drIXZY9C
	 KWzoExAQMyInEPQZA++ys6GDPL52ifAvpJ9xsKtC/a+dAvwNEGfoGCFO+JSwOsIgnKRPn
	 rtZMU90dhyW6HeHbju5ldNFqlVGvWRBNm6Pg4podLVDrbVi8bpADnUH3xjJ+kv4gfat0C
	 y44eLfcflwKtcQzXxalfzAWjL4JePR8jhhH34/atdesnUSetFi5gDKDGoERPY/47HGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
	b=NQRIGeZHpiw6vUsn3/EoUV5LO4l9yMD9MF5Rkz0GxRmATvRWCGdZLpq3WNSa3XVd/Q99
	 mjcW3CafzoP04w9nPobYKjm9nafWL+VKKX/1NZYvhZkao8p+qjZny3EyRGSiFMxcjGFud
	 7sydPWvdlWmDeWdwr1JM6FxXKtBqXhaVElA30qgdVT1agw8b0Qy8NM5yfGwuAbECgBjoa
	 svXwUIEQ9eCbmM0sLGaIoey1x9Pa9NI27oCDsV3JJf1WgU9Om6+rH8s+A1+t/E6/crpbx
	 7yusOsdQj+HqTfuqzXaUF244E3z/DrsOde8IaK7sCVOSz1Juv38f67DUs+y2gRSB4LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moAnIuGC;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D262960A3823
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D262960A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moAnIuGC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso12748655e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246672; x=1794851472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
        b=moAnIuGC/sD2YwtcreaQOJJCH6tTrMmgzZNXQFIZa+F/p2rwXs4PRlGzvmTTl8tb+J
         R8Sr3alHVkQVnxX5Yr2u8dm+I7ILfhu7SIBaBkD1KXDIABOk8O0YNvFzkMa4orRSx7jw
         1GWQefqQV4IQcsTIcxh8c9sVJgZ25m+Z/ruu/FQ/sMp/63+hUEAvMVm5PP/BPf00JRWt
         PFOllp0c+WYJndhAeZqi2KWac3TEcX8e0IVmHL82hiuRxXQ0aIoOFHoW7vM5E0g57uPT
         kE1pazNcr/bytWFcYIAWAZAG8ryrxleurkojLZM4VINuIE6cQ4f5eBmXsdVlybPycXOw
         p9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246672; x=1794851472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
        b=xXK6zry1/IfnLZXdNLb1295OypIaA48gYvtdJnigQbs4K+Z090obPprqAG/UDEmXSh
         kajQOLavW8jd5cNdaoKddmJTZvxdCsU/Ja8P5UQt7s2FrCGuR2hhW7CkWdsafLEBPdVD
         HmeHpK0SAJ8kvQtwvrkLj8xwNSHP4H6S1N5WpbjMIm5RZC59EZLRBXr6zIEhBTM30ItL
         kuTOPE2RTTkb+muUxZ7KP/yuyuPCq101rsm2PNHxZpKD7sT2/HxIdVCzzOOd8ok1Ow35
         1az5fYcaUpuBZ9rbMsWNVC2MLRbc4lwhV3Xkab9+kbaoY8NSpRufLx6XfQTlfsSs5otK
         t7mw==
X-Forwarded-Encrypted: i=1; AL+hErEgBLCA8duUrCfvMSGnSpra58bu/MMrkjL+bbbAAOkdAIkP31K7M56E+Q4buRRrh964ksn8oj36lQn/Xms=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lnai4PasHrxbMR6efkQkblY8gAMPFKJbSdb87LMVoSalPJDNZ
	iOw5qa6CgB6/ivxGqG4GFh4vEmF6e1QKnEnuleNPxe3/kxvE+rj3QmGK
X-Gm-Gg: AYBFou3bQI50ZiYjBLXEmR0JyTEzuyaZjYp0bxRFsUnaLxNrhPu/3uFnX/4/HJ8yv9p
	p/TkB6fsIczqzlKJbzmdezL7SLIqa7o2LmxZLPTSaUqVpA/KTOAf5gWUXuEA84UvySMsLp5EGLH
	SyFaSNeiHSuIth104Q+kvh2vJOLJhNUpWt1+GezQ+Quk2abQiv3j9rWP3YcDupdHrrg+jXJUGJd
	j8UOHASQOqdChsX61xFbA6D9TgxEGtnSV1Fqt8dly/nzm8jyOECCzCPLbOZQrzMa2NJL/LeTHOF
	vvAqSWJD9XfnjyQnl3r+rBggYnso5yaZN1rmd2JP+NB77fv5A449NXolKmFrkpI0WWnIo9ou+NW
	BWs3QF5c8DOXVTFK3as1bx4+h55H2BwNNdFC13dqa+djmew3zLYNeH5wGpJ9gB1ZKjFDSYfOGWC
	I0/t5CiwO96/1Nc9KgnqK+w6Ww+/+MqMGiiZ4guO2YC08fbD/GhVGy+LFFHHnsq+K6qEsFXkGHw
	j0RnjQS4P2uPOcRClTYjTsWZ/PJYIJTruwR+NdiUKuPg6qGhyhNUBZQ4r1KPLE8U410+/AOTUqP
	OwsBKJKYF0B7g3Z/YIDdSFoDhWaZqLMRFUpfhO3FxJScnywOntXRLvL3LC1aBXg6sMEqDdRQpkl
	auVb7d+oxXIbxTyoQGbLbfNYHKhhzNJ7mZAqb9sLwWsld40EuQHfJo64SwRFMaxamJna1o/BeU1
	Nf4Okzsx7qiQ/mmfSaIY904rcn1jUmE70rHdrh5VdzNoSVPEbqPLk2+fIz+p27R+FEFLqT9CAUP
	rM+BfIXV9jyKHxnSdwEd1S7Bfio/Ev/EFtMX+mi5iHxFkJeooY=
X-Received: by 2002:a05:600c:4ec7:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4b963c8591bmr96421945e9.15.1794246672153;
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:11 -0800 (PST)
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
Subject: [PATCH v2 05/11] staging: media: cedrus: mpeg2: derive the field order of field pictures
Date: Mon,  9 Nov 2026 18:50:10 +0100
Message-ID: <20261109175016.42061-6-jernej.skrabec@gmail.com>
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

The hardware uses the top field first bit of the picture header to tell
the first field of a frame from the second one. However,
top_field_first is always 0 in field pictures, so userspace passes
V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
every top field first pair is predicted from the wrong reference.

Detect the second field in the driver instead: it has the opposite
parity of the previous field and is decoded into the same capture
buffer. This works with unmodified userspace.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c2318521d7e5..572e70a94b3f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -144,6 +144,11 @@ struct cedrus_ctx {
 			void		*entry_points_buf;
 			dma_addr_t	entry_points_buf_addr;
 		} h265;
+		struct {
+			bool		pair_pending;
+			unsigned int	pair_dst;
+			u8		pair_structure;
+		} mpeg2;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 8252a47994aa..315b0e5b3c88 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,7 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
-	bool field;
+	bool field, tff;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -87,6 +87,26 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
 	}
 
+	/*
+	 * top_field_first is always 0 in field pictures, but the hardware
+	 * uses this bit to tell the first field of a frame from the second.
+	 * A field is the second one when it has the opposite parity of the
+	 * previous field and is decoded into the same capture buffer.
+	 */
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME) {
+		tff = !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+		ctx->codec.mpeg2.pair_pending = false;
+	} else {
+		bool second = ctx->codec.mpeg2.pair_pending &&
+			      ctx->codec.mpeg2.pair_structure != pic->picture_structure &&
+			      ctx->codec.mpeg2.pair_dst == run->dst->vb2_buf.index;
+
+		tff = (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) != second;
+		ctx->codec.mpeg2.pair_pending = !second;
+		ctx->codec.mpeg2.pair_structure = pic->picture_structure;
+		ctx->codec.mpeg2.pair_dst = run->dst->vb2_buf.index;
+	}
+
 	/* Set MPEG picture header. */
 
 	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
@@ -96,7 +116,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_structure);
-	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(tff);
 	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
 	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
@@ -188,6 +208,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	return 0;
 }
 
+static int cedrus_mpeg2_start(struct cedrus_ctx *ctx)
+{
+	memset(&ctx->codec.mpeg2, 0, sizeof(ctx->codec.mpeg2));
+
+	return 0;
+}
+
 static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -205,5 +232,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 = {
 	.irq_disable	= cedrus_mpeg2_irq_disable,
 	.irq_status	= cedrus_mpeg2_irq_status,
 	.setup		= cedrus_mpeg2_setup,
+	.start		= cedrus_mpeg2_start,
 	.trigger	= cedrus_mpeg2_trigger,
 };
-- 
2.43.0

