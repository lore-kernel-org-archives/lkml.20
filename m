Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366919;
	b=HMW9V+cIcx/SfSh7Pdshc0qJjzm9VqmyWwodDdkyvYr2m+UR4s0+XxoiwK2w81mg3zpt
	 Rk04RaEUT/DiFTqHNTOnBTPHUQgGagujn2n35TdbYIl3N3qEjajf8vNyLVjJ+CTEpRNvK
	 uikIZJra1LO34sabvkND7YQbE7T37kIHdw9aLtYh1b83AOC5Gfp+cz8Mym6GPZYz72MvD
	 Unz5AFXBP11w493yPs67hqEeQCpJ/Hq1WyGoOc0JxC8ak2MXMUW8eV+NAvL0B+uXHz07h
	 4/JwSshO1nrHPcZnv7LRYPn2NuOEhs8vaU23Ygs4GOaHmECGJwuMTpTD7tSXV9WM/Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xNfeFAhewK30cMhIlYuw1thd6KiIfjfyu0K7WwqCHvM=;
	b=EfFesILTzLTSaLSZIa5V7rLl+NgUpjMgRLli7rWIRahDCTR0+6EvB+iRAoV3cmmO6lXR
	 /vPA1sZai599tAyzMSaqx7ze3Ek53pOBxkoHjfDmSSGkfkPjTrNWYr2QiymPaF2f2KBMJ
	 PmYB7G6RPYhz+thvc2PKQkmRtksMtSWkFUoIDQd7G33xDmyN8A6XJgNt38F/WNCyuE4n7
	 WYoIClmxE6zPjdFHPRul/nEcOwyufU9jHdMPWUkCxJ9WFBnDncK32RrVYX4kZETDdPepA
	 p4kwxLJ7NYgzw4I0MsBp3hoPOPG3k03JPlfTYStgjiDRGQwcB7dFlhnfwiEUhT/ch9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAXbaY1f;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3265606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3265606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAXbaY1f
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4af173320f9so1539139b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366918; x=1794971718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNfeFAhewK30cMhIlYuw1thd6KiIfjfyu0K7WwqCHvM=;
        b=bAXbaY1fqjx39f3SUdMC2J3pHKYtYCin5S0DQBWyHTM491GWOKpa7aES29NJP9yUva
         tf2RSMf7dGOOraZFeDU5dfQYM+QMTwVy0cMCcEHtu0lzwEL1bK+ojIbZD3h7I2Echid9
         7zt7gx8EDSbmc3MF1I00A3jlVd+f47Kf6yCAjGzrdiPlXlNnD9fOmfBgLT2o8nGIClwH
         60IfHN82xaTGQFw0YYkBulu1uMz5z2VgIhWMtj9g9iljXWs14BIjPsx1YUynmzxm8geq
         G3okIjI6eQqio+aXcsoe7DR5r/Ql0tVhf86rDEf/bZG19lNkFaNmTo5tC+ZLbFqTFxKi
         gPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366918; x=1794971718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNfeFAhewK30cMhIlYuw1thd6KiIfjfyu0K7WwqCHvM=;
        b=0z19Xenk3W8YJOFnQh6xg/CAfsKpsmvgVXWkcKNWNWFtOxPqhz656FtbeZHfBmBYZw
         NLJK6G5Tra/X6a/Pmyxwgc+FpbVZtmkLF2QMWe06UikX7TOsjt/uRikMWS8Iq2RTerLB
         cS7j3JR/3w34kEEtilCBpFQemYoOKgbM2WS0o4xoClY4/XxMy19xiFGhAR/sA6hBvvlU
         RRAxw1zQqVFO2HkvI0iDr8GbQFYwGorOqiVRaac6o4qzH23VyWMyQPnvHjdG1ixpJHkh
         0SphE14nUaIwmf8RXzXVal1XpU4e7Oqy1oty6B0J85JGG08awwm48PzE3krxeFpMxcit
         mtGw==
X-Forwarded-Encrypted: i=1; AL+hErEPd57NrkCq1ldcGODXvGGHwRbFAKeTTgkRfq8cdDz8T5OqUr9NHSwYUVFTvIMWvd2HXTJnWoVwP+21bhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9slk+7VffQhonZIhhuR+WQ/+29AgEVvTirAO4ZW+naeX24oAVT
	h985w902EyN92rKlP/ACKC7ovRgag4Pq6VL/7womcH+ffzG/J5/XF44gilSFeJxy
X-Gm-Gg: AYBFou3+1fuj/oEqJaGJUPH38qkipwvVchZZTB+BDi2SwyYcb6OBaPu5ZFapAsMdBMH
	AgpdcNQ7NhqEWuZL7fpqUwXKWGzgW3eMCqBSnJLl7SA4TPfZK7PID8Hbqkgi9ZbXhug0mMWzNhg
	FayFojD7ff+Dhww+iJL4sn5wtIoZYD8RY4BJiu84xyyzoTKjftnDBTRsU9g9hjTmXzCW1jCWOPo
	1LMxnAIUm42HYaTJnb7kf4+P1VZWM5xA+fI58LVb2DuA3wn/nmSrWNQ82Y5jv7y7kO3cfcjIpWW
	NI0KiGCph00On4c4JpuqIxLfeGl3tYaE65MqiLIazIcy8qUHF+7embIDx/Ch+4OaG2ppnuiYqjM
	evFEwxE8iGthb/IYnxNRt80fDkmdMr7N84tXWIEmvFu4M9LXmJpLYEM/A6dxkcxJwiK0mQzOfEe
	HabuGWQDXmEt1xSfL8AjQ4he+cWORj2mSFzyD2PUkbWea9iabrQiPNYMalYrLqQptrox5WocFWQ
	xMPUCRv9NzO7hXxZlFhWrWbqT4mTaETQfV1K6zQzEY661EjIWonwuJTAexjvulCKQSB/Ajtr4zV
	qqW/z6OgdODCDJ6ez+91eB0jfMFtcFVzcQ3BJ//a5qcluT8gLe07ofJWF7Z8Si/9uYXpee7vgEk
	SINwqXId6gNj15Ud6VciXbxhbaU4J+eoHTYlyGGprAaOv6Rt9vqVEK0Ny9Hv1XOWQhcTYRj1oBV
	qT8jGrfEItXI7rftJgXO2Dm0mR7KT5K9/XVu5KkT0s3nMcL+cIS+A=
X-Received: by 2002:a05:6808:1a10:b0:4b9:e88f:89dd with SMTP id 5614622812f47-56b970ec98fmr844578b6e.43.1794366917929;
        Tue, 10 Nov 2026 19:15:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3999345b6e.3.2026.11.10.19.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:15:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 20:15:12 -0700
Subject: [PATCH v3 1/4] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-1-35fdfba8b61d@gmail.com>
References: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
In-Reply-To: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..2c2435c36ab7 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1181,17 +1182,17 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	u32 chan_active = BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
 	unsigned long flags;
-	u32 val;
+	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
 	axi_chan_disable(chan);
 
-	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 50000);
-	if (ret == -ETIMEDOUT)
+	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
+					enabled, !enabled,
+					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

