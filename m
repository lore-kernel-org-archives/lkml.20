Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186525;
	b=ZMnIZj++Jjw7iHuolfmVTARC+JFusDwNz1rx7Gck4ZGTkLhJJEUvNKJiYPkt66/nrdLp
	 +H9Ngeeg0uZMWsgXgnHpqIhfhxQs85AncP/NYDeOnmHcgQ0urE1DG0EPEyjh8I2R5BDsA
	 b2iDaO1otJuYavr8GmYaqZeixvQc4NYGNX/6sbvWWWpKQ/rS0lJo8PLDe93PIyUeKch1Y
	 hyiE1gCjUIFIKvReZOsz7HTfv0Wu5w1tKbJWxU+HAeBBkVXCezVNXWYituaeMRu+6gZQD
	 AYq/x/yP55hTug/u/2pKDEG0ox+a/AAuDWPxdqc5+9Lmut+1Nmw43GSXKARcxM6V9Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
	b=J0F3g8R7bD/Gnlx1Q0yAwHonIKtLnK9LwakMkNi6X3s1a8E0QL9PF/ps4h2n9uZC+nBI
	 +G1RhmN9skB2G4sPzj/k+pPdRzkR9G3TxUYxqLRhE7uEP2lCcKnmFykmlkf7EXfOyEGOX
	 xd/MNwgkEmfEW++af0wkGqngnzKXgOYcC8ZEBhQ3RHDfBafw5SOpM2lL2k2HmKoIoggZi
	 8HOZsSrH1hT8Y5aDiGHuaf5tiBcuP4TSu/ygLKx5jIWIS6juH85V1MssL4iP83orqXTLB
	 wrZ9nKrgsUhAn5lZOAop43ewTImPGDrcwk2GfLZ2eF28jMm28h/jJH0IWLx9b7Xn0qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFE7gnnk;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3330E60A2608
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3330E60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFE7gnnk
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ea63087d6eso455765ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186524; x=1793791324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
        b=GFE7gnnk+aBcA/fY+gjb1rhv6bm5tQcGawDxJLAQDvyPZguCQUnJCA427/FEmgdDvN
         ytjIDVnc3oDX9ZXpiEKvfuHYdiwcvhnjRsX//WWbhiBJh9THbFTgklSW2U3pAjuZ0Dqx
         04YMUw0dYaFyLrzsr08V8/cMcuvS0mpnXDOoJrxAipGyqaWVfHMKaE2erbfuRc3f/1Hz
         DSwa8YQNUZ7pJ/gDgZ9vGhCISJh95iGv193gO5kihWAVvQYk/ZbclW7kpdVZpRieXCV0
         5MejiaTvIKa5PwgyW1ODXS0hG6iZzhSC/IomVRB44oDKG8Ng2dTwPys/2Q+ntPIybWU+
         dnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186524; x=1793791324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
        b=D5uZI404U4nv8zD5z14tLUBm6uqFWNSvr/JUFMGYBcujDjxBKwMfDW2fZMgeCyW5Pq
         BMQb1Z5v/WvVm5d1dti0hEalvDhFlu9kdDND+EAUSSuXQULJGoqQgNQKIqEqcyFxcNr3
         E3zWwc9eYZmP6lolAAFy9fQJxam5P9xX0cjjMZr0ZX/I+RrqCL0lqMM5XzNLHlngMWoO
         ASY9LzYp/n4BKPTRzrDvK9lkx43+sscjW3NmgJ72+d7uYWPdSk7dk/GB475MOGbmMyLC
         inqd/HS2yOtQofLHn4Vq53WqidEV0BI5RHF622JeR5CvzD/pTxgCD3RPGeO6HUjL+Yct
         CKRw==
X-Forwarded-Encrypted: i=1; AKwUvBy2KHdnBVeDRrobOX+TYen3KiOI+s4bnrQdpxssFKS/YPoADicZVq9pn4d4bbSzmNI8Tvkk5WWXaVTNu8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9N+PxTD/F7FJ6mcM+GGpJL1exImvzhVLer5DEUSYYXctUnDAt
	Uzi53PCVvkzTiaZbx8QTnACbgN+BqQJuCHnftweaH47AZxMNQ3u/U7r4
X-Gm-Gg: AYBFou2JXECfrNy9/V+4m7a99oIG9lh1jSu26mI8VV8mM33Igs1myMXoBO6VRTuAPfi
	Mzl/Vwq9l6iZnmRXPSaTpJBOvj+oMXo1k5V1quxHmq3eMJuaVvoxqMxkr8YihAW3wY8fCgz0Qb6
	gkHkkuCLJXEMiipRVoQ34XWT+dOlJcwQkkz66+ONy/u8e8Rlu1BlZ+oomNBn/yK7u++4KkJc78p
	23MjKno25h+k9mCdzasD45tFy/7lDd311aZctJl7WF4swCsuAPrNB2BXHYUudShttE4aXIq9fQV
	xFGJQxQctwhMPpx0w94GpddXLFJdOQw0gkz41nyD2RUH6jv0y4BMCtUoIjkMwa/ifszbBB+ACQG
	3ciT0P+Hlkz+xjnv2RwfxS5S2PD+E0XqaFSUw4QOyw/5vkZIXwNsb1rYS/ZMw6rE/twyjxOOu5d
	rPZ0oQgKtWHgv5kyxrKfv0QrEFUJrpcqHQTXXH5ek3yi8kNVfvUOZdCnPII1k9g/D2OqOnuEIYv
	byY8GxdL00W5AonFyz2xU2vjp7V5fnsMQFxBRt7uuiLRiruvXUPcUqsGwI1ycCbt7ST/EfBFnA9
	yBMVmPa0BBsbG4tKJPY1+xzXVPIhgElhrhqU1Z5MxtPxaUUsmyIasCuh6KCn6ERds9mZxKTBjEj
	U+XJ3Vkyu+qJ82DCYvpsi9oyDjOAGgVBk04e/mE2nkZmIrZH2l4amZJuCjgZhLnEa7be6kqCDj4
	fzEDfNEEu/xhnmNR9AuqU=
X-Received: by 2002:a17:903:2c6:b0:2e2:d09f:d772 with SMTP id d9443c01a7336-2eaffca66e4mr32450105ad.0.1793186524518;
        Wed, 28 Oct 2026 04:22:04 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:03 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/9] media: i2c: ov7251: Fix link frequency index
Date: Wed, 28 Oct 2026 20:21:47 +0900
Message-ID: <20261028112154.855185-3-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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

ov7251_check_hwcfg() stores i, the index into the firmware's
link_frequencies array, in link_freq_idx, which the driver then uses to
index its own link_freq[], pixel_rates[] and pll1[] tables. The matching
driver entry is j. Store j.

Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
and the pixel rate and PLL registers are off the same way.

The 319.2 MHz table this selects ran its PLL outside the datasheet
range until the previous patch, so do not apply this fix without it.

Fixes: cc125aaa5a78 ("media: i2c: Provide ov7251_check_hwcfg()")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/ov7251.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index f429de5f1f7c..1f30a01c85b3 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1523,7 +1523,7 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 		goto out_free_bus_cfg;
 	}
 
-	ov7251->link_freq_idx = i;
+	ov7251->link_freq_idx = j;
 
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.56.0

