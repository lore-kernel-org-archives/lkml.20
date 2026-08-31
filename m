Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F28339AD2A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210823; cv=none; b=L2L4j9N/SviXcUrjKzbCfH0ot1sHyAKvECwopBSvFIFGmHwpfW85i9esKHh55tXBJCFuvRMZkqLxLk4RUOQ8vDsmOczOQGurQ+5kKFGEROlKuECYV/8E2xivg1yqFqIKa1ccxTGDOZ8zoEsZULZy959gVc3XlR0fzRyHVsrypb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210823; c=relaxed/simple;
	bh=VvbFU0orbGq5GXqsfJRwdLZgjt+B5oLCdGxqVHcumTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsNumJSsRS0qvCNBFEopuRNoWHTJdLsC4mLef5D5ekaIfThr0ugeswwqlCbVaMoZIalVVGybAM2vcmcMlJA6wcycTY2EiASYfoaP3csBIaxjHAesj6n3ynF0ZiAVJoMZyXx7FJsMgohquZdf5RomfAmrWXzd3PcD8OoVe6Alwh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJzV4knU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJzV4knU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so29351955e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210820; x=1788815620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riHBGvJnWFIgnSmmlcRlU+TLt6jZpAQGsDXIjBsIX48=;
        b=pJzV4knUwfAuEZhtt76oWbFQ7lIAwZ34o3n2Nrb5LejywTCehUTQw1x98iG2T49gAV
         rdD5tP85Q9sLZXGd2kuV08awnLnDHlsbWFD6uaes5pM2YL75zy1RbtD4iiHPCfX5prIl
         +QiuLeg8cmuNo05KMhW9/1u8tg582PIds7+rHlgEQd0ZKaLGSqBf9AwMTnn3vJK3u0kH
         bkRAPqKODjuM8jhMTF+Vm4xDwJzSquLrROd60Mv9y2VLo2Mahd1ZoyognPZRq2pLSLCm
         XVO8vmCXxzdEmvTU4EEEZrIWlp3k5hFgOZJfZzT4OJIPygVYdZdLVZZ5S548HnFMN+Dp
         Mvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210820; x=1788815620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riHBGvJnWFIgnSmmlcRlU+TLt6jZpAQGsDXIjBsIX48=;
        b=B5cRTdQptQqOf1uOUfj7/8ZcHw40qWE2N6/MGHJJDiCZC3SKzvP8Y7R8sQpiC+dBgq
         UtU1W1no/xBjJn45jETHdFAmAnmd18NqOY7oFCn6BOCN2lEecwufjNK2eURxL04j9ca7
         3K93LgcbXZRTmOyvUy0TjTjYZZ8EPMr1KcSmCmfyvX2We0M2WQU665jwQN4NNm0WK13s
         lVlo5+mlPF/Qddyx5zlwYlFBnHc9B+ZAt31GyBI93eOcXJ/+3ag9Ld48tqZ4ZeYNJcX/
         D+Vf7qvkXcGplCVjf9IBC7EEXLJskL+UH88+D03UU2R5CJ1yKyRD/U9HfgRg4warQW+W
         lk2g==
X-Forwarded-Encrypted: i=1; AHgh+RowULyEynkaGHOZnfEAUUDGBneuydO6xw5Of+7tnNWc9ckI8SDv/8R6L3EcnCAJjQOkfRyO8OxLiKmgCog=@vger.kernel.org
X-Gm-Message-State: AFuF++kTNbTfIsPiCkWyt4WYt88dNwP5+gx1+b0BbNaZ/ie887990nRo
	lJVVck+/+7NE5cXik6tJg5qR2GUI1Oxka8dsdgo2qLpyzlLBJgF7tK1X
X-Gm-Gg: AR+sD11qnAGoj9wriM4Z+K84aKThixnWpyI9NTOtbGxKHljbVxn9NhyxzBNoMyzt86j
	TP5xfEpEwLg4/enjQYxCZrDkM33/qnF4xZ/vvjMoZEIUIw6Tft+Gg9fbHFEeCZPtG7+LJY6ThO4
	Sk5kC94kcidbQGjhdrszJTIiWqX8+3tTBpdgnQz293dbYcEITMntjjIqD6gTF7pRvYYK0q6bvl4
	wtkBW5ygCdVx8Zkpgs2ZFrCIEJkXRuozZnEMH8EgW9Pu23ZvbcZ1aH4nYGO6+IR9jE/b/l+w+4y
	RM8KDwg1u9I/EJIBYR8vdconv37bT6Ioj6us0rX9oyaN6e5ESeMTyihtkgG/jJuTAPMtsJXAE6g
	axdbr8QZm6H89wgCCQVK4dKTChtElNoybg2YS4Hxk/W8GmOmXeu+wAmw26mk3QlaFAPjsx3VAyJ
	LJP2/7o3gKws24JGwU8NAstggZG3P6hQa0TxGj0bYpXRRQV76kDLcBUY0NBRnJrxbWN8mzwXAgx
	zDL8pijY3a3WNH3r+nUbmIcxTLD7XAD7IoakBLBiHd0gYltDy3lPNxbbbY9uinCuuwJhpQFfYh9
	+eph6XNKOUaBH27E4uEUY1960PCTE1LodxS0/aFb3fB11jqshy7a3WiQLmBDM69pUhpdJDo/kPN
	g4LnyD2CbRbO2+wdSOlAy9VM9
X-Received: by 2002:a05:600c:1d99:b0:49c:cee0:e7c0 with SMTP id 5b1f17b1804b1-49cdc560282mr73922345e9.16.1788210820205;
        Mon, 31 Aug 2026 14:13:40 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1754csm17695925e9.10.2026.08.31.14.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:40 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 31 Aug 2026 23:13:31 +0200
Subject: [PATCH v2 01/11] iio: temperature: iqs620at-temp: make headers
 conform to IWYU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-kernel-header-removal-v2-1-b92b580ef5eb@gmail.com>
References: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
In-Reply-To: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788210818; l=1382;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=VvbFU0orbGq5GXqsfJRwdLZgjt+B5oLCdGxqVHcumTw=;
 b=WiPTtq7oDQ3FSUPaMivMtWGdM+4RcQB455yli8n6KYYihW3s3KaBSecl3ttFOUTMNsFS8Riql
 QzKB6zcUL79A3bINAWKeZl9PvWzVEpKmgl6w2/cJipNrvyGjULWSzdj
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the catch-all kernel.h header and add the missing headers to
enforce IWYU.

Additionally, separate the IIO specific header from the generic
<linux/*> headers.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Header changes explained:
Added:
- <asm/byteorder.h>: for endianness helpers
- <linux/array_size.h>: for ARRAY_SIZE()
- <linux/bits.h>: for GENMASK() and BIT() macros
- <linux/types.h>: for fixed-width integer types (u8, u16, etc.)
Removed:
- <linux/kernel.h>: catch-all header no longer needed
---
 drivers/iio/temperature/iqs620at-temp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/temperature/iqs620at-temp.c b/drivers/iio/temperature/iqs620at-temp.c
index e2f878d57af7..3a3b1f256585 100644
--- a/drivers/iio/temperature/iqs620at-temp.c
+++ b/drivers/iio/temperature/iqs620at-temp.c
@@ -5,13 +5,18 @@
  * Copyright (C) 2019 Jeff LaBundy <jeff@labundy.com>
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/device.h>
-#include <linux/iio/iio.h>
-#include <linux/kernel.h>
 #include <linux/mfd/iqs62x.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <asm/byteorder.h>
+
+#include <linux/iio/iio.h>
 
 #define IQS620_TEMP_UI_OUT			0x1A
 

-- 
2.55.0

