Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246678;
	b=ppVawIp4Xa2bGkeNTIS6oeTxj0oMk/f1GwyzM0D09XAMpn89ac7x55lQktgIPlwyHTB5
	 8JHCyLT68xz6KyxI0zTOjOF4m5dx+F6/zLlRGE6CrSZn039fkbj1wpRmAUvtA6G9P9UCc
	 wZUMQnJFH2VS083tNygUFOR/J9u7+V4fY74fplU5TdS+blPYMQhW6/xBPOHDjTuM6MXGS
	 r3vN9niuJmxZNUMt9YfbdS7Crs3Zo0kz8fUhUbqWLk6DuMdgZkcM/c+rRj9FDJsWTF83t
	 1EExIKzDH8kLiMbKocbxKgmZFDuaiXFbwkNuUGOXcsKQ1Or++KRsB1dYxNbFvOJgUbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
	b=x9WVvQDZS0vFPK93aHCZc30o2IzyluWl+dvQPpfe+LxaT4UZBeiCoLkursQwCoG1g6O7
	 UQkBkAepCGYNTidVnvnQH1R4cw2hK6beig3uqWEM9XfmfDht0SY8IrYbKp/vN61OcFWgv
	 rFn8ChYX7jho2rdKCzdywgyrEIORI/elTmCWMUTlK61DDVnOXCUdMhoMJh4JVxK8e06Q3
	 Zt90Zbp0O9G/fR4dTkVxPA7WFqbgcgpD6hJyqxxMMyKo390ZcWVqwrwu/7pXwOgwB6Ew1
	 kscqGDt5qtED/b9XWvyF/bykqYSG9v7fQjeukrFH/qcNN0nAUElcYmi6M+dEPPgAeKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhCW4MjD;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC2060A5BEB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC2060A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhCW4MjD
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so783103f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246676; x=1794851476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=UhCW4MjDrB2Jx44R2tgdeRC22xvRx3LIYCPL1fI900FRNGaM4YP4XcM1Qwt4JqeZ1M
         B/BAxGogYx/l546Sx67OBuhsR0xVeM1JLt4MXZQIhKnUqLNQUW2L0OpGZh7iasgt4rah
         V6gF8Bd3NfZiH4vybKbWuXgcUn5C+5tFoZ1uvXTMKwIq3U9+Wy0C1wnMCStFD7UOTd0h
         wu1yRsXxBAhKk6iXkf1mCUhDU5IGdKwJTHQ0kcpQxYup8vlhSmj5aiAHXHld9bWcJ7aa
         esuFhvbUjSV0fRbcBFnKd44KaHyjLrZJVjefpf4UylNJHeRJcRSpFnRIklUxqYiSzuZP
         tfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246676; x=1794851476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=WEL5W9LQ99J+qVyLpDd7AI6mHetMKeYVF6JqOhxvuemZov99XKlKRhLoUwYfddv5as
         ocROVfr2Zgb1FeMe3rFRFdh7K4WLYh4uhxInFIezHkaxhsVkZe/mGKzw2JPE0bdW/1Y5
         rUfO0oyWO1NK6lAGTR7+WBgUcgXHC+cyO9MkWZy4xpUHwc49WIJuJ0FgE6XnZUSZuKEl
         5DDlJiH3NaEcOpoXXNukeoHkr2iBxCkEXJDeDxuJJeWg0JTZ3SPLc+jbS/65L5BHdIBr
         zW7ckjNLL8MIDAcQi3l1KTgGF239HIDBhoxC1SQHZSRb6pLzN6D9UwkxOGpHHKn/+PAV
         GLQw==
X-Forwarded-Encrypted: i=1; AL+hErFPMlk0A83lfYi7D+Q7ToW+d3vEMhlQulMNxuNi4unDHgcCHMyjHgHlPmW9+wnfjQKgx9mHoiZmO7ZjAGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aRpz/O9Y+1GjNckTc3bZ2qKkZ8WRP5FgDE4GUWFCOhYvrq86k
	6zxsdGONGRmspeTUwCvapO61SLNx7NlOdcyN2LpxkB6jfwhxDJ4IzGvc
X-Gm-Gg: AYBFou2PFGgMkjy2EjZJxVI0vrTHDdtpquhtlNxu2DOW+7VVdkA/G3nnudBnGg3NNPq
	cSlqhrfOMu+eIoAlNqDABeOV5JQXnIkHmGXR10pFQUVZRppcGxm500h+KDc//2OBUt3NUOS4Wwe
	SiTYmE1TKk7pjrv3prF1Kf0q5//95j0zbn/trc5pZgkFAtO1PSkYP5h7DcWYpNYkyANK5fcImeY
	y4N/o+vjDrIgQugncPLvm2TXrzYDPiLodDF93PULHrrv5SDRMErEKDMmBV51lzF9EHLf9Zca9Q4
	Bo2bfz3LabfSP4eVqwoYzLFzWMezP5tvV5mj2DFaw+jbOau1oG8qgdnDGsQC3LRFV/X7x6SSmih
	yK3XQIa4uZIiL49IrT95/TbliKtkQiKeAvc5dM96HzRr30j1RIYAqX1hFM7SG9wXyA7F60t1NRt
	egv+wEaMI8hBcnSgzmS6k+0yEtnqLRkJJKXvCJo2hnGlpOESGg0Dn5+x7bOXGaNLWG5Yi34QFt7
	qVrV7D01vt5TPfqs6eSp4DAeBO1oeen53Vpo3hztf2MSPxIDAhM0Xm7+geaj1WuV3kwRpWqyEzc
	kqRQNr1Q+uY0Ur4/MYdAIvv1d9Qvwp8JpHGv7I+2dl2ZeujupxLTXXtLnVLXljRNKi2lzv+Z2UV
	Ewjxfyjlg/rE+ml8CEORjIT77rgqY742v9BpKnmSyFHwQlqvjikpIjdGTLyMKu7KJ3EfZ+koqO7
	bRcBEI9NcTNyggJ/S9CALwijPgyAOJzv+/6CnHhDsB7GK8BayvJQm8g/re11zoxAlT8OhnXDZh1
	jeOWRFLuOYS7Sur7gqPrCsmZRwv7vrUCgQPCBYlOJGhin0tZ58=
X-Received: by 2002:a05:6000:29d9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4982fd3e550mr237732f8f.26.1794246675934;
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
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
Subject: [PATCH v2 08/11] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  9 Nov 2026 18:50:13 +0100
Message-ID: <20261109175016.42061-9-jernej.skrabec@gmail.com>
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

The driver allocates the VP8 probability table with 0x2400 bytes, which
is the size the old Allwinner A10 library uses. All newer vendor
libraries allocate 0x5400 bytes and never write the area past 0x11b0
from the CPU. The hardware uses that area as scratch space, most likely
for the segment map, and its usage grows with the frame size: a
3840x2160 stream makes the hardware access memory past 0x2400 and
causes IOMMU page faults.

Allocate the table with 0x5400 bytes, like the vendor libraries do.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index fecca343bd92..84bf18fd231d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -25,7 +25,7 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
+#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
 #define VP8_PROB_HALF 128
 #define QUANT_DELTA_COUNT 5
 
-- 
2.43.0

