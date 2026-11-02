Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639005;
	b=3MR07R+qNqwi1TP1yxTk2l3ZvhEm2uLxRe8iwsY9WoQ7WE19cwJGWV/oIdbxik6jlnl0
	 iuhVhzDUGBEcKdBPfMipvMlccJpaD6xxt3PyHDlWIX7DeMzl/+ZqA/lPB4WEPrFjq7wcU
	 7RnWuarEYnY5DxM1RJ6FAVdd2cl96mkrYcj87c8oj6EQUgaBzg2nP6sX1w4/LSP2aP7S9
	 7T+oW/9mXkGjtK7OhogmJoMP2CM76A7tOZjPewiVDWOdF9bc/dPPC/kGhbpSy4teKIfZY
	 D8N1jOxo/eiFn25pwXNxsmDnLsfHNFibbdGyiFMwOuupmtV+hlFH7iJ3hso1jrQsbog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
	b=jpnhs9kqVCINmQ9XcRMss2PW/TEirGjMRqZSDymFCquaFao0AKQ6QiXV4M8j4H8GskRv
	 78DEHt88icpCan8qYpLqsRIivnK3RwKTgfMpAeUz1UiXaxEyoJjpvJit6fqu68dX7U4vT
	 GIosO3XSBsnMXiQcV6nzny5A/Eol0yyzNXRNVGFiD6eJmLa47VKdzH/FsNOogBU4FEUa7
	 EFUlMOYGqBTywWBKtB5wyit6lEH+oGjdmvX11QS6vjmLrVV3rSlETkJhWDkbZ+OTaTtdT
	 0iCSwtuMuVaGlUv8xWH8U/BsA7SKr3g9lzQsgR7+3A5NYti1FsBI5+NhBWEksB/Z0xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHD5DiNN;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04754606E017
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04754606E017
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHD5DiNN
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so29247945e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639003; x=1794243803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=PHD5DiNN9OyBHDVUDQq2mIiaIN+DFmKlv6retY//5yQQuurl7OKoeKlXzPsyzkWg+9
         thhAV8W+yoH5X7GX53NOfyiM6Q2pNLKj/2OVMFqVgMUjy0npgwyzKTJOuyT5+bhTvxdv
         4Nbw40DpldE+m8upOAOQIPPUOZZOm++4b/bHx03656wukTB4GUzzrj+WHt5rNG1qqPhr
         Fb3MjhHfTEhE1yv8xQm3X1qEssG8gR9CfvyxmebnVhEd4FV4UGFhfTplf8zlAd/bKInK
         7tQ7lc40Cixfbv+VkOgmR4fHz6O+3JxwRJdOcL8uSYhWlf87L0ROR2Iy6dgtjsQLTN/x
         TdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639003; x=1794243803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=EwfKK944yMtCNp+RAJI1eakByQk0THf1nFIuqf4WWajGqMHQXSUSDUSNvpmduRhmyd
         ROrDNQOSBrsvWFPaPSDGWkDSSi+G+/6itV3wR6ZIaMqy2hopvJaxFsXy7rnyD3LPiklv
         ThIuzNmJ6cx2bk/P3wjOkdwciamZauroNcUpkSdwV+AbxHrAK5NY0r0X4rZMOigwY82z
         DiNbMsdkK0Jc9cLQ8yQ/4uZfpsvgCLxxYMo+3nD3gsjcFbS1dA5kFiE4Un9Jlvi4eL74
         qIVMHF7N3qkXafgoVDmir+oCSFuyEUht1B4pClXepqj7R68xsidqwE75LCUucgQgdqVh
         imng==
X-Forwarded-Encrypted: i=1; AKwUvBwdG8GxG7fZHZoOjPMsYf3GoVaTfMpkm/bezFS6Fy4LDU+2NkGsSiWybHXXgjzeZFFJqbJMzmYkBj0B5hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9pjAd0rjr/GvZKFosj183stedoeTcqtNhWz4pZDWNjGRFAwHA
	9Us8tjkoHXKWAgpM3BlopB244dWWT5OlRHO8wvz1z9NWu5V/nnYyiDn4
X-Gm-Gg: AYBFou1olDCWfjkqFQ8nbdXQ+pHjrUexOijo8zpY60ntedmFzPA4O6niB2D5x1XGndc
	jn95mS0ouQFF/VCRcZGNG2Gwls9H9SlqYH0tyqOU9I0b9aAU+5Z/EI3fHsnjY7vJ1MXQ5HneJcM
	4qEWZ8/lM+eVzVihWZfh+NgAeUOsKquYouVf/rMdR9guVNPCzsdrxzHLKUpJG5wMZOLIm+1qk4d
	kC8WlbrTKbjcAHVSFMf6BZr1TW7JIxP7DjnV12z/eScwQQCimyZn16TLtXPKfXTenLfz7Mfug1F
	cz9B3e/NHOMJnFgBYMOsY1VUDm3wiKVrEEeOuANqMGHkYW6g9+2VyWrE9QWwVLJzrswvYanSwDl
	nlFbSh+iYWtJIcNvNNDxAhIoCIYuxlqlmTWDtAUN6RWYhMWwfW21NI7ZhfYBdmng3lMF6gSc7FR
	IHjnHkbIaVMhidJ6J42P+fkahoSy7ivKX2ISn55VXAvHVLja4UxVYZHSd03mgZHBCIF82kXsTmU
	QWWgqz76DnG9lxMF9i1XluXixgDurKjIx5BL7ppAX4nVkRbqAXHDFKrznozleTKcVdS109eT94j
	thfXzz8W/NQrO4zVAW5qVpG4wzoitH4uUwepm11fErV6k7SE5BFUj2NCMFQgiyWWy76+yQrxyBj
	cER2xPfdlQROhCOln3gaUOz3k2J9CVRQHbAPS4pPhvWjewvuaBQq3RFXHaqZmSa0EgFZ/thG/Ue
	vXoukC5F+bqwVoHUPT4m3Kfn//vAKPM9L99MqwG2ikCowFh/CuLoiFzBzKLvUwcFoyR+0DS6jRQ
	y4DPyGBIW8/swnffb+3NfTKlXxmwqkL6ROw8v/OV5LKayPSLA==
X-Received: by 2002:a05:600c:a012:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ac17b2ce18mr241875865e9.27.1793639003332;
        Mon, 02 Nov 2026 09:03:23 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:22 -0800 (PST)
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
Subject: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  2 Nov 2026 18:02:57 +0100
Message-ID: <20261102170303.1973892-5-jernej.skrabec@gmail.com>
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..ca66a3c6b830 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height.
+	 */
+	field = pic->picture_structure != V4L2_MPEG2_PIC_FRAME;
+
 	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
+			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
 	reg = VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
-	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height / 2 :
+						   ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0

