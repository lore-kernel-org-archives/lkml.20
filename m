Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639007;
	b=GacBhSEyzWXMmHXSTgwmZHU2t0GBvSgwuinnAUvnP5zs7HZhRC+WRE2cpYoLKv/lTuM1
	 cgJJJ6NprEetCuug5UuOxT7+8+Qyz4YnAOEfCqS7bniu4BFgya6cI2Vd/UaOG0EKhsQcD
	 H9q1ihcV6TKWIW744jNzOBR8bjUbc7UvYkpH0yEZb1fAiYlJ0JH93VDeXDaQABiIXIJSt
	 obBFQfHuye9gYB+II8uVuCzsZ4YmuQFfCddVy8SZLOgkh6RS/4aLC6y9bWklVEHiBOM97
	 gO71+3YC2dOds6iHTAn72Mkld+qQmjNt7IahbZHPWRYB7UaJF143Z4GSQTboJ61308g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
	b=Yj7yCvZ9ztOVIZa0n+ApAJ26wqwIE4Wbf+ii4Ug2PxaRECbc6tDWcEcJB8MEbs3coPY+
	 bZwD1xZuwlrS/sSsMf714sayH/A7+LbgqNHmgAeBZDi3hzFCoY+1NoOb4XW4uVNxJ+z65
	 rHF0TLdpnr1Bi6O+tmFYyQQZy4OXd5GlVVXlVJYq7P/iEavfWcniw6JkR4oDoFdghUnkC
	 NcsQiYJ2o/eOEBWE2WzRtsfd/ne5mA1K6xQJhrEswRgZBAxQjNKkufY3gT/jD7L88C+Er
	 VPdrSB0eJhcploiysRZzGUKy8WcyglHrdOSfl5cnqH3k6HB3M2iW51piZSsWQEUhdkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVk3pJjW;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F68606F3EF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F68606F3EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVk3pJjW
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2255551f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639006; x=1794243806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
        b=qVk3pJjWENdYxwRng4MR2O7ujCm/hvY6qCx7utAd/gfiAMP+K3FE3rVOWLCrSxbdTU
         reuh38kVNX4AvroOcx2TMCKTtTQFsf8Wsn7+khj/zzo3xIOd8W1dh8JV0fANS6p4mVQg
         Pka6wUN/So+D6yd0kpbQTrBzu7in8Sx50qlMFIreS7RFbryWOu9wMty5AL/RNBh9m2Yo
         p8TZt4lTXGgIwvzN6N9iBRlXnJbLQ8sm47kZXEGracmf+6U5JQvV5K99dze+mYDSTnLy
         1KBctuXdAkUMSTPyJXNxPphBOjbTxbScAHWDn2cwDP/MK+G9+PzxJDqSo67uFPdTvRsD
         +Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639006; x=1794243806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
        b=jjBpGoZgRVTBRbegmE6TKxB4WxElsdzQvn7KX63Bs506K5EX8FQtkRuYT07+OwOzNP
         j8/qIF8Ypr8mF9RmxmxYESM4h92nEveQi+mk9DbXMeBUOXlVBL0IrWeeVmGkyzZuQBte
         3NNAzGbb8yEfNBxodWqQNb+IVodNKqX6yrZ8jsd1Pd7IfD+vmbbnyptYnVB6Z26xMvAM
         XJ8Rk57RvKm6NGMC6egw1+yeYkUl9qy0kGvJdHVG8i+F6HPqPo0rSGixcZFrEojNwA5c
         e6uBS3DrwGqXmRX1iy7rA25RQuffzglin9aKRCTeAMvvE0FCaI6a43ty8KrpguHhhijP
         W72A==
X-Forwarded-Encrypted: i=1; AKwUvBxlzrg2anC/SFB3r9EuuxzKXdZVgG/Aqb9T/JMfl5V5l5DdAy8E4VcIHM73pqtkwM1mezHokx9hwNO47d0=@vger.kernel.org
X-Gm-Message-State: APuU4Z86TKMRymmags19iLs5zjeOehX0DdW5ZoONTzeGNMM/0fZGlV6n
	HfONJal8/5X2k6C78c6W3mnlwShawLZnaaVRa9TQM4o04U/6XsWwMtFn
X-Gm-Gg: AYBFou3Yx6m7iCOvuJy7e49t2XioUGk2moDUVzq7kKc24q4JmcsftPV3zZ6l6lzlYVq
	KUxAODs3dAKiWtP+d1mJTNpQGF7A1E7kKlufxMhIt77RR7Kbc/UMwD1BvNg6IumW4efulmRzEBp
	4AmVOawFbnqGYg2vGoLdPzqXr9B1nHK+jHZEZmfVw3zrXhiRGfs9UGTIEqJuEQSEnmm49OVxmKb
	O57bN275YUMk8QVWOJA3xgXClJu+Jbg5ezKlFdEYO4v2TECQYdpDphDxKoceRNoXYURSuewcZ7a
	2HO302sY+qvplwhmav++w7U/xcViLxLGPGsFdGk2uE73vqatXMPneqjT2iI4w9r35iDAa7z+ajh
	Yo5+EvRRcYDihd4ofQcELeSeogEdOn74Bl89yYfpFvhyrU8NOSACDVCrzvd71/Ls7KPp7E7OJuT
	lf14wxS3tcXCzKekLouk+DIQqErzP7Oga01VlwGjYQV3HLgdMScKEDIYXYLwo88YyFbQkAi8rSN
	+o21Xkw3C+33uwErI1F3UHl/cWWL/idINiKGavofBHKnlYOCb8vG7mDdGTcPpeWzL5VSPe6SOC3
	q5PqF/WK6YFXVuq89p9m6CI/aL6qLbSpOAHFnHdiuEdTjeDIw914PfMob0ByCk60ds3ORBguEpu
	aXIbysRk0teBu1ecqudQKxT9U5SWmJ5Jxw8+2qy+GexB9Db0+8d83gJBdvUz8EhdThoinbmAT8r
	5I06tHPR/XWjpczpaaVKMTONpXtvv3C+YbzK8k3yXWzzmI12RpWi+DoCddpCjjnuzcezZZRSJS8
	tSsK5NGlJ6ZHafjePgX90SluEms1cnEfOfFf2lfg5wL2yUL+w==
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48e6e4f561bmr25233093f8f.21.1793639005534;
        Mon, 02 Nov 2026 09:03:25 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:25 -0800 (PST)
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
Subject: [PATCH 05/10] staging: media: cedrus: mpeg2: derive the field order of field pictures
Date: Mon,  2 Nov 2026 18:02:58 +0100
Message-ID: <20261102170303.1973892-6-jernej.skrabec@gmail.com>
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

The hardware uses the top field first bit of the picture header to tell
the first field of a frame from the second one. However,
top_field_first is always 0 in field pictures, so userspace passes
V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
every top field first pair is predicted from the wrong reference.

Detect the second field in the driver instead: it has the opposite
parity of the previous field and is decoded into the same capture
buffer. This works with unmodified userspace.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 54f867949fba..a523b56a9b8c 100644
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
index ca66a3c6b830..4c8accee5389 100644
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
@@ -186,6 +206,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
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
@@ -203,5 +230,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 = {
 	.irq_disable	= cedrus_mpeg2_irq_disable,
 	.irq_status	= cedrus_mpeg2_irq_status,
 	.setup		= cedrus_mpeg2_setup,
+	.start		= cedrus_mpeg2_start,
 	.trigger	= cedrus_mpeg2_trigger,
 };
-- 
2.43.0

