Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246673;
	b=v/0K8BZ1heiCb+VI168zo9/EnsUQepltEPDXT7OZ1HJkLgtlweMN1SpR8qOKosvO+EFG
	 96YAGObmZ3bWM77SiIknBQuPOK1LpF4ZSxEHSo2KmfZbuDgOXhw/fiDDtAEbcWPVhdAdw
	 Bc19gIKVwaDNWIsrPZX+dglR+JpnBnAOnzCmUQkb+Kn0Z6XU5zYJJKseRoGIQyD+xz8Ga
	 Q0YwVvo6GhRN5koh/J8yA2xhlU9wIkVNnSL8yqdCPUuGMQ8zlF10gre/OgyEMu0pfTbU6
	 +15BQmu/fFZnE/mH1UHf+xuNB4cUljju0LDxRpCYrQDZB2MzghB+U5QlcKRmeW6hTJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
	b=L/GRXEnwM5Ry8zLpyAJvw403ibBdGTjj8HZG7foznA+57rWWRJKBoWuEI0J5cmyrkrpI
	 dci6MiuVJLsO4LdFt2MIJfMJbaL3sfYx5eHXws+w0NwfKjJfLTbWB5iI1gx+KFc/u5R+2
	 47KuDCoeMrzA13U9BxoIVtv0AY3sXjs2+8uIWoM2MO5hXlQ84pzhV3riJsErMU2tFjUFW
	 anu2ufuiTwgmfKuGfPoTNdlcxxQ/CDl7k4t2N7LYf4ejyD2ezBMLda0frTq2IcDzNe1r4
	 eo4Gyd43MJrKHQJH3h3D6FPPIchB8an2/HntXh38vYjOcBZHuTUIqKHfBxDExq7Jddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFoT3MIm;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9899D60A3815
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9899D60A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFoT3MIm
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso848872f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246671; x=1794851471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=HFoT3MImIc+l1SW4Qf8O4relKIrSxk1oxC+wvPSODNKAcXcBPkCeNNf1FaPOVno7TI
         BNLRoJxHqu8t/iDvyHeGPNd840xq/Zjz5e6QjaDbSNp99nv33ephDn/p/0GEoeuvSg9h
         OhKeKbcyCflkbhfZOygjtIwR9oQN5zxROVIUJ9FkP5ysgw0wHvcrlpS0zbgoU0NJGyDo
         OFcoTsZx61aoSX6GHwwfeV9wvKDW2MN5sylApc+6SOkfYJ/7u58FfuOyoyOYTqTDNWCF
         8+5gPdmRuTrPQfJqziaAsxOUop/fPJuQNDBY360FfASj/masiHkKuu6LsqV8/GWCclOX
         mcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246671; x=1794851471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=fytrxySTbgCKNQgjQmVel81uU99sI1eF1AzRsNmViIUqZtMvsckKojsU0Sa5Hp+paf
         ukhtZ5vrk01DVWgsBbKLJH95g9+55L4qavhM6YTicjvivOt7cZkJgd787+SzO7bkFc76
         /p8hzanWOT50hJ34e+3SkjZyG3V+BGMH8vzmurZrmoCl2jRvtatc/fYfQI0OPeqJGLSX
         dVowmccAxOn/Q+K+nmoixslIFXPFq3b3Wh705pVAtIYT0Nsqtxj4n11BTDBpvWN7Kv3h
         fKua3FtMt5Srxq9L7rLMfl72vZncM12TPyQFqgvoO7zYcxujxc7LIjPJGjjlo60Coqb1
         76SQ==
X-Forwarded-Encrypted: i=1; AL+hErH0xLMEhZwuT/ZjYHyghS8l2h5wmLnjd/ASK3Mb2E7aLgncFixPImCWTizSIG7QhNcpD2ANvHPpNLd37jE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l5AgVIGyAh0ufo3e4Hd4zHDKxmzWQvNiCA4akZQE3O6Nex7XT
	o/SZu/ClL2qeztra9bKSw94/O+91o1bthJMwHlwFmPUQoe1HdLpo0xHy
X-Gm-Gg: AYBFou2Ho8iGTuq29PskuxtcBXjh4sFt7oUPErAXFWIVufxUe0pKUapRxxw4kRdOui/
	4Uo06z/l1J/gWfc5GskWnIUyX0K6WvaDfIlz0qZbtfQrOVr0xxrWKmH/okxFL1oCuTrnIrGA8iN
	7YGMVHKFoV81tLf/RgGTg+KeOr/HyNCuXZ2pZSAZrfWk0A1mH9GawIKtKGXb6PmQq9g08uJzFfs
	rveoIH8wd2JCwKgafgv4tn/H62235ReGwjvp2NqabBT11AGhxcf13410UsJL84d6uvOGDqMcT9W
	kGfMyVY01m7XdHE1ZEwxPZT3kXBjVAPUc/cVmlsHj/WGobKxupFls/3oN16HEW8YIcX0d/JsT6A
	1NdYRBTxNEMcOJiENAfrbAAdxeq9xMU7Uh5gH64jS66sV53k0w79gG8nEm2vBLmvzixoSSaCL2m
	wUsw40a7at28Pn80PMq3UcJXfhTXqn3MachbSRSJH6KMYAfeJb72DhKvgH2EZbI1AKAM72/3EAF
	n1BXj8KhrcshqPvLzph3T8c64nV7ZEbohBHftry556uqg8VDgenA/OZvje3ZxeLua0hResQSHJx
	j3TYWsHRfK0ygBOfg4pL/MyI9I1CpIeMh/QswXy4EJGNRVv6LwpOFAOJmonZEkOH1Z/N2U5AEVc
	fB6/eKYm6dSXEkaB73wx2nv7IUgCt0nIxaKtQqq0FjzKZCjISg8M4UmA2JdL6ReRneNP5zEGcAM
	xlb/XrCeqwxkz9TdvuaR4Sb9alUF3JNc6y9sInnK6xDp7RYaZ7CUNHtZ2ZijJ5uhU7sFizhoKjw
	Yc90965RnvdkyxwjSd18uwCjZRcKD2L7eiSXdvog9PmB4eSWRw=
X-Received: by 2002:a05:6000:29cd:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4982ecf64f9mr225642f8f.17.1794246670969;
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
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
Subject: [PATCH v2 04/11] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  9 Nov 2026 18:50:09 +0100
Message-ID: <20261109175016.42061-5-jernej.skrabec@gmail.com>
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does. Like the vendor library, halve the boundary height after
aligning it to whole macroblocks, so that the boundary of a 1080 line
picture covers all 544 decoded lines of a field.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..8252a47994aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,23 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height, the
+	 * latter aligned to whole macroblocks.
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
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ?
+			ALIGN(ctx->src_fmt.height, 16) / 2 :
+			ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0

