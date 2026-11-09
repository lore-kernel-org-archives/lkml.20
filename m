Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246675;
	b=K9T59NmJEXeNkFbeAHdWoU/zi9MTsCmUrdoiEQp/8VvrRO6veZGKU+2H/9b41wNhdkxv
	 DM6T0otTI2/am4F0sx7PN9j9J2Mxsc41cj0ZGM9hr4/xKPyOz1G3ogJO5LoWCN6xmMImR
	 mD1rsvKKgRDzexBZ1SfWcfgjiUf/Jik9UD+OVpuL84q92nb+OpoynTeXsqhWVfE4nsJd6
	 IXyeSD0hGiBN93NEq7pAEDarGrr8q6BuXp0xQKBGWxkEaR4nXJEbpY7F4vNdkPCLeu5bZ
	 pFjFF4yl5gvlma3TN4mYdgCQ1Nsoy3RiwOvBrtQWsSHuFZwO+o4/m0Ha404JtlQyRRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
	b=FuZzYv2Pu6uT0XE47y8nLrpjmzTve26Q95fRVIXbd6OsOWcb0M53lqLafBMoS01IoGBZ
	 76CEmJ1oRXIDkLEOAslc5h2VHSmChXrOO0FfiHQz215jqN1LaPtnzr8spfr8mTqx5dt/i
	 5yRRQgXFeFnloPDgF5AfsvJDgK6gPGOFQOer3o6LrjXm3BQmvXgT+0FfdwdQ2jhKT/9r+
	 +quYKDRhdTGBghelEZUa3rXox7RQcGILnMf4cXi7bhOv7jkGEgQyonwVQgb125eyQu2yZ
	 M/kl3LzyZ3Jawi/eHJZ8kyUY0HOogfkk0L/3bgGAWRnUeAPsgBtVrbIQwr+0HXrqMDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNwFi5bv;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD9C60A3821
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD9C60A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNwFi5bv
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so804429f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246673; x=1794851473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=UNwFi5bvqg8g0A7o/oMros+kexO1RF8OHo7g/3U4dUv9E+x4kQX/Qbu2m62JqX7bOx
         CHW02LA+DN+Iy5DWJY51d8yxHqfxsBKnQ76vE5anT+0fOghiD7zCn7XOTmChmQf3f3cR
         iukuxPzMC/yHFdxMVdbpA53spr9PKot6wWQYrKFGNeW8wnK0DO5HOM6zaGq6dbprndL9
         C9gQE6DYOsF0/pHY45Hmgtzdw2aGdowG5LsC0y/oaHE/ten9PB4cT3i6ijQOutkSWYga
         vCacieylPS6M+IqcL+Pj1uaUDfFae5qkW0upI6pR1hs01o0e/+u2InhsbWhytYntasVl
         zY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246673; x=1794851473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=dJtZ5baHdwjmJY/OEJiwNY84e/ky7hkCyFpgAC2Hdw3A8MwVmTJ2bfrnZCkCY2OL26
         z37SF3x0E0gCVQDzyVSSvLqke5SD0B2W89CqV33PCLte/tLGbczF1+GSaxmi0FMtKPrj
         g+F86TsT+kFiQtmXl+a2TMJWsENXGMpfhsKS+Pc/SzlC1gu51qFIyodm0vl19k1X9HjR
         +8Yex2gOHZA15si8zxdMUlqQ6MCXEZwXYuGS9uBMWfhyL2CgmyedhrOpLWqLaTPM8OGa
         OSBXQNGs3Fy0S00CeNwkjdvY0dlU0/w7ahvRG2nJ7z+SfR+wkt+vMpbr7uJqVuKSOv18
         Ox9A==
X-Forwarded-Encrypted: i=1; AL+hErEJWk54TxO71/1j0II2DBuGxwglKH1w0sAI9BcV31FFzDlZdwXrh0BDXV5Qf+y4Ay/1UntCMAy69cJDGsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MZpOcgsIELa2jkqTRt/S6Tc4/HUCcHI83/OD2nvaPS5nhlmX5
	WaJPqj6wb9ScTIltWncjNQ67kXMjbTw08RHGoI/XB2PhWv5IKfKo7x/w
X-Gm-Gg: AYBFou1A9kEWil0RXzoN9dC+YwVjWe5UOHAngwWSu45COhJBJR338+r/PeShb3YzBqV
	i3rXLhehMJEB9g6HM5F2v79M9xdjYT7W9ZLcDsa93OnCs5YAfTRBHTbDbPdQuD2v5s5ziEFnaQo
	GcasF+VyB0MnJXHyMGfaQTz/226PbDlJpygKhsPxljVezhCXPRc+epoKe6q74VikNfbSM6AyzTM
	ztfyBOqjo9A5S9fBr8x7joERqHYU7x4xa6/uXNIytBfwBoJZoDH2MQT3rZoRIWToVj2fAGICdWp
	dUYW23SazWxwsXIbbLIfezne3IfMHK3Lgl/MBmrN1h+2oddtuIaPMvFH4IpzUDiCQin1LmJ0CMA
	vk1614/O+IqOPhAfa/n+F7O8a0Cpsc5JD6e1nxLM/+IqG3NOUVWQ5kMDsl63uwbyqQi2zG1QMOw
	hvoDK2DRdjpvGtIRlZv3370VFqhyln24J3Bj4uppP0OG56kEJSm8Mm4qW78YuCC+DzIh1CsUY/a
	isd5N1UROW5z0MPCzcV20QiN9X6GNO8KFkv7WD0gbZ/WNC9Zxyl4ZkXnprnJjS3ewQ/Mwkj0XO0
	BntlnDqrhBoHbbler5hgHqIM/ubg9iyK0Bhm90PACgheg2cZuYM9iw1Zb/dvDkwkso0NY/Vt41J
	mmnHdB2S7t8t/vk0/eoWoFbSe6lzxktm1dFn6QmQEIq7MOufXz1Yf+/QPYhwEt1Imha2HuIbeFc
	1nDxyY6EC0AFjVpzd/Kkr9YhJipN5PoXeqCbZexYG+Q9cpkIpQGiXwr31bAwBk8T6A+m9lFjUtj
	3Py0cmwbSHD+50puTqAQLWdBt/G/9vfYA4nZwmEgu337AihkJ+5c8Ddcr2wfvqJZzUIh17Q
X-Received: by 2002:a05:6000:230b:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4982b28a797mr485950f8f.3.1794246673337;
        Mon, 09 Nov 2026 09:51:13 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
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
Subject: [PATCH v2 06/11] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  9 Nov 2026 18:50:11 +0100
Message-ID: <20261109175016.42061-7-jernej.skrabec@gmail.com>
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
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 315b0e5b3c88..9bd7f3ded83a 100644
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
@@ -149,15 +150,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
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

