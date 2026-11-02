Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639012;
	b=qYp4U7AmYFdxi7vCilXO2mstm+8wJsXwOWAqnx26+TPg2uzbdKZPyeMwsf1IPS0AeCQX
	 8nFRdi9GoxIlbWxnylQ1WsFxs2zDI+dz+3eVAqwu3fp+RlqYL1zqtauC42QSwN87EvPLO
	 MVDGMPdsgz15k/4HTqA4l9Vtlf9UYKG+ta4WfV0FlS0YwZ8rO4eiaQahxV8f0/iOrIi8l
	 Kws45GORkhEI61muNOoGQo8SHIZ+q8cOGRVQH0YZacphknDL9IhSHOmJUiSWa/3FA9S5M
	 a3ubw8lLhuF46AYp9xHRMmDdVksBkJlOCa840EySg4y3KsduK1pV6eMjz0/IwY/yKqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
	b=REU07mYWlmqKFpB1NfKz1wxEaWM2q1FyzZnHhldhcRddt+AEPIEzd+ygukLsJE+TbEZJ
	 oXrZxHluB6HconDi9WpsHxiiLgPo5A7rb2aynM2jASvycFCw6paCYce6Op54G7d7LlJlJ
	 M9HrRwO7E6qTfjtmGP/6hwZaPVFo6Cu0MJ3C5JkL5yRWDzU4naRG5jnRN/oiKF8yPSiRN
	 Cs5j056piSYMSko/COrvEWy++XxzXexRnhgka4fz+HdXBQ8aX9VbKNowWI60h4FhytoqQ
	 dJrddpQHEQb0Nvxngcpu09K34M4jmXRGsN7tSALsVMey9sLaxDPVysNtuylLp+vttfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DbEWp/2Y";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2D4607BDEB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2D4607BDEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DbEWp/2Y
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e04773687so968993f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639010; x=1794243810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=DbEWp/2YUl23e2pSfhLpgKRsYyNC7+f4JUbIMUu/MXWYL2RJPUzDIdQpWVhZ2F2mWK
         ScLXkde2FGTstuEBHjhABpOGrvHoMm0YNGZtn5MzhJQEkUGH9Rzmffq6oIAPOXUS6UZF
         VWhhy+eSZzSfxVZDwBamFZYszH6Q1xCNbLtKnCstP1neyHafQhW1Z4VIv8eRWIxic56q
         B0ewcMTlpb038pfVV+MKR+in394dYIkKut+OA1hZOA7G4tm382X+2McJl86Y8Eqgn7P2
         71LMkcHymtQjDr7Zl+07ZTUfzv3kyyY9O0bdDjpdOu77oqUcZS+VRWhSsii6u4uIx1nU
         BQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639010; x=1794243810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=lBWNnbm09EIsvNs6cvfnJmZyGrFFdZxO59UFN+28SfEeu4S3XfBweOpEZquZv2NEXE
         Lj/tPVZKBQdcGm92VKTCP+wg9lk51AfqnqzG71MeAMAiYxoSSMMOyy5oG6Vlvpmymo9d
         gILKJTT3j/x0Rdspe4myfmuIOS9ivMAQosfjzpt8NqvhNbOUsFgb+LhErvVQYjVfRUr+
         qP11a2XCmnx0CmjAmxsh5A2QqoxOkV3oVqX/ujynQVEjVp9Wg3xr14CSnuB/ySX7frvS
         466dPvf4uBR7ql9ub78JePB6lfBxohSvjDtxTAZmyzs0bucvP+kdlz9insXxBKGZyfvK
         PJPA==
X-Forwarded-Encrypted: i=1; AKwUvBxEctH3S2QoVT0x+36v2NT/Oh2HOp0xSwrL9onXtbYHlr8AlSZIeviC3OA1R9uNPzjnQBNP9ESHP/cq03A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vNeBRyqvCAjyot7AHgz1mTkkFSj1pr5JKbgKYyYndD65IPD4j
	3lV8a4MeRpdWNx8IHY+P5GP4Pf9sHLsgOxDD7Jh3y9+Uuo0W2HuhSAQo
X-Gm-Gg: AYBFou1JqBYwwOILZYTh6iG1SiMNrXqgb3kVhBtao+yNHjax2BGGW1lxbH05cnmkaF0
	fIrAnrYeNzg4jY/9n/jUgg+L+jJ26IGLDnK1inHSE+c1r24VC74XQ6EIZmDKNBy715SdHGsSC1m
	GUbNHkRWQDNMoKkHb8oRE3GflnalX/lpHTZyHnCP6JGJ19okNdIDRRv9zubXh2hvzRBhXl0zrXl
	i25s3EN7gh0ekDFmb9rsEy6nZ+Fhr5bD1MUTDnFUuxssqIWfjgsupoZUkHJblgFTTk36gaVxe0M
	VDVXH54uUcQ8bQ+Wu5tBKRj4jfdAaGrs20U30rCQ+2wO1xn+pipJHo7C9wBdZj3evnOYBd/Ym9G
	m+EpYPE7W0nkALngB7FnI5yLGkDKBVCaPogMLeABpJpIRJwJhD4yYBDrcuew/3DeuoBvhPwJpBL
	K8Y4f+g7FFVH+oGGaWMg68T5PP+WcgO/FU0F2Rdq9Vujv/D0xwxcasJr7RXd86zQzLxdv6Ajp4i
	Ru7xravj8bvKHkNnR86Mi7vI+eKiJt0L2iLAuxV72B5d54GaW12QsK9Kc8KoBOdON1V1R0xWZd1
	GIYVq0Y4qhgX0q1EQazd3kN8i2h2xoSEvxM6JAnhQqB62sRJ1qMiyWYLAlTWzD3pL3xXRBhYVMX
	VwyxCTASxeJiuLNAqgWEMsph3ketYjcP8OITr6NHdsgFMZ+TmVqxbd5LxxASkDHHXw8HUn1QqfB
	m8LoqpT/xee8cmgszPhRdl5Ww4TeUR0RjYm3KaFZjTWAhwbRwYSG1UM2sih8RN+uy6iY3fpwFRO
	d9fJRamHV9l6LRmqXk4qkgKigsHKUGQWFZ5emXRra9B5ky22A==
X-Received: by 2002:a05:6000:4b08:b0:48e:7508:bc20 with SMTP id ffacd0b85a97d-48e7508be83mr18919618f8f.2.1793639009894;
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
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
Subject: [PATCH 08/10] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  2 Nov 2026 18:03:01 +0100
Message-ID: <20261102170303.1973892-9-jernej.skrabec@gmail.com>
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

The driver allocates the VP8 probability table with 0x2400 bytes, which
is the size the old Allwinner A10 library uses. All newer vendor
libraries allocate 0x5400 bytes and never write the area past 0x11b0
from the CPU. The hardware uses that area as scratch space, most likely
for the segment map, and its usage grows with the frame size: a
3840x2160 stream makes the hardware access memory past 0x2400 and
causes IOMMU page faults.

Allocate the table with 0x5400 bytes, like the vendor libraries do.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..6b00efa77c22 100644
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

