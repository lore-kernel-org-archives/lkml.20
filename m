Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639009;
	b=3hrGcVKmuUhPNTjhwL8VzjcnyXkaZ0IdwRvAAf5LAcsryY+adloBgrY4awi1fz7BudBy
	 wUd8RnYw2iNPPxtTvEI3x0Q891MuZB6kLJ0ZeUNPw33znadMtjFJyZB73cokRYjL3GV6x
	 asprQaOOEu/EbYAfS3bQ0Qkx9XplnYlOvSG6s50cHNitsO2vpHycjARFXFBcJqjoeihiM
	 S+6f8Oxt12pu0pejHvolLajxgfoiTeE5eZ4gEdTp8+aYkeGr9mdhheDJsrAVu4TuKqyC4
	 r3yc7Y81uVdCfohdn83KCU8i4mVtwApmtKmnGsBHAKKtfkw8WJ3w/WvGahiLGbnMyAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
	b=p5+g6O0CxIX/Fdd76jsLzPrnHorvDSxRoBUAM1u/pxZ2S9h4UyjlhLaPQIqsW05rA2/v
	 SP7nsT1Msq+EKg82n5zvSeLVFEjW8PSg43xwHI+hN8S+yfpCCWY6ekE6eiaVzjypDl2DU
	 Z4DRnHZLljti+aoGzB1HrrzMlPokniC12CL7cdJ/nhi3fThU2vqQ73BUZ+BaWSKAGjxny
	 vukpEQEGzbh6VBCkzBUBSrsCM10hIerbSy5GrE/356VJP64mGVjC5ab4AV4N1BplI8fGb
	 KNvjm7rMW5ASJFoPSGo045wb9E1kLtDuR5K5I7L63lhkfmeUhOmZtmvpcufWHfx/oig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cm9gq9ww;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A197D607038E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A197D607038E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cm9gq9ww
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso477502166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639007; x=1794243807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=Cm9gq9wwQ4rD2aP1yck1bGsQmh+WCp6/4isOqOAaJ2qGmWw7E3QxiykK2KHnrEIfrD
         NMKWQxl7Ws4ptM2SSdrVXg4ij9oKHJhAYJT3ooOrrZ5kosrTekxPrSViZLCcDNNlBCPj
         KtrKNbRaDFbpgD/UxlVbCmk3d/NBGEKue44aOy/m5ZS2A18KXuDz632mIEs5/eJ50ISu
         RME/ypoXhy0/rpVXbKuLNGZRHm1IBS7ePvdeogu4i5GsFN9hWT7ULi/K6O3qfzfDalQR
         kMwQPZrhWy0AyFbUR2aVO+sJcJAgig7BZBlihEtG4+7bDWPkE0Hz2pVAuTp73G5sp+dj
         NVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639007; x=1794243807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=J3072VGzz91ZB9u+JRIVqTesf+9Yjg8j7oRWnuZpazQ2jOChuSj33WheUChTWDtriT
         2eDY4CHT6owV+l8S5rxgnHlzfQIhkeDd9bf+H2g5LDqxSdt4rlV9xg01wZ1xJoG5eJcU
         0WlvIUsFMUTQqVzpGIgs8j2UG19dNAtfK0CStQcHx5WYsvz8GbIWxgu2I0F9qDQSVwQm
         DgnvZETBORW297Hc1RuCWtkRjKvJNazv+UY/vftJRm08oDQa3gG3ReC3NFGSgfrSpMqe
         9pu9HbQNZFDU6jUIr60z/dqK8+WwomZom5GQuFVWoDkflVQaZGRIqOBFVbumHleXm/Ku
         /yhA==
X-Forwarded-Encrypted: i=1; AKwUvByW4FvuQMPVhyMr3DCC7sExvRjSUQ4NOslIBioi/PmNbHCspmrGuXxxzpcBMDGnJIAv9iRftmVBfrxBSa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8149/lLlvV/qJsKTUGZUxo/+Un6EJQ1jw4l5Tya9AvKv4IW0Oj
	kRKeDkkaN1WZWxmsormvyo48OKzA8ZC6nkJGFhbHQV4uksFQhPJ7bbXl
X-Gm-Gg: AYBFou2nfkRrMiMa8Mi1s5Z6Ckm3G7cKubbHzCqZ7Jb2RImgZjYSTxnz4IZH2iXSRSl
	upOeTQdJyMo8oyATGQGOMP7odf+8xe1iSi+nwewme5gTwVOhC/zvHC9z+7ddiFRRLkpFDLZg/ht
	Lt2Y2STzqnv1axTYyif6qCK3uFmLxWjFMoamj5R2P3N63ZKCux5R1iot5QWY9rQ+rU6XuF5wyVn
	kGQhuxkM9CWPAxsnM97O8NkETVpb32b4EBwXRB9E1d+/Yxu4R+tTxX/KBWNKVdTBMhyeaaXRc8d
	mq8aR+Etmcnn0bd+kcKL/lsFdvOrTCP/fcwmwpDJGXjKqaq7RPqq4+g5sgWxkUZJ5femFQkU2kv
	drNekqtUcrkiOwkzj9rmQhg4niwP/ZLfxTsMPYVFxOxpUyc8xSnyVMe1h2mBAWK2+ehqFjspBld
	sdv3QD8kQEwL5fSbjzw6STmaykItVwg2qjLCh7TYSR49OjGS6g7CC2sfvouCgGJTLBucvM9gZRl
	kwxAC8hsYyuGKJzBqd/sAhLOcRkaXFZB4pcb33jRlznuIXt2OKX3VIQgYV59nEKaFOEnJfchpVs
	ppeXa7gMv6rCU5PpomfKcADEwEN2/N0Lp6lq2WWpnlrzb7UsYr6QvIWx2GeRA54jP6WVObcng0B
	QM0BCWvGXIEJ2VZCc/uQ6YZnPGtEafxsxmQVxSIZlP905hqV5/bMtljw+Nnd33XmpWgbTkt5Mft
	s3LIR/gSnlZyUngiTdrHrccJsEsYWBpgOl/dU83bEM+68LQDTmUSywY60tLmX7PtOP2lnySzZWd
	PSM3TkbMrpXiFuW2h4a6mMxz6J0/+41nnfMC7NSorUjsXFDZg==
X-Received: by 2002:a17:906:ef0a:b0:c3e:cb50:b7c8 with SMTP id a640c23a62f3a-c4ca7a1997amr921711866b.12.1793639006912;
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
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
Subject: [PATCH 06/10] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  2 Nov 2026 18:02:59 +0100
Message-ID: <20261102170303.1973892-7-jernej.skrabec@gmail.com>
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

The second field of an I or P frame can be predicted from the first
field of the same frame, which the hardware takes from the backward
reference. The driver programs the backward reference passed by
userspace instead, which doesn't point to the frame being decoded, so
the second field is predicted from the wrong picture.

Use the current frame as the backward reference of I and P pictures,
like the vendor library does. Also fall back to the current frame
instead of address 0 when a reference buffer is missing, so the
hardware never reads from an invalid address.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 4c8accee5389..0a2f8e77fb29 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -56,6 +56,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	struct cedrus_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
+	struct vb2_buffer *fwd, *bwd;
 	const u8 *matrix;
 	unsigned int i;
 	bool field, tff;
@@ -147,15 +148,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-	/* Forward and backward prediction reference buffers. */
+	/*
+	 * Forward and backward prediction reference buffers. As the vendor
+	 * library does, I and P pictures use the current frame as backward
+	 * reference: the second field of a frame predicts from the first one.
+	 * Missing references also fall back to the current frame.
+	 */
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	cedrus_write_ref_buf_addr(ctx, vq, pic->forward_ref_ts,
-				  VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_FWD_REF_CHROMA_ADDR);
-	cedrus_write_ref_buf_addr(ctx, vq, pic->backward_ref_ts,
-				  VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_BWD_REF_CHROMA_ADDR);
+	fwd = vb2_find_buffer(vq, pic->forward_ref_ts) ?: &run->dst->vb2_buf;
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B)
+		bwd = vb2_find_buffer(vq, pic->backward_ref_ts) ?:
+		      &run->dst->vb2_buf;
+	else
+		bwd = &run->dst->vb2_buf;
+
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 1));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 1));
 
 	/* Destination luma and chroma buffers. */
 
-- 
2.43.0

