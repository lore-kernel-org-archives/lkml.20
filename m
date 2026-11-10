Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279971;
	b=35jiBqT8VUVlt7GGmNn+BOkGUN7bjXuDDIebwpXDt+kgzuGwrQHr8Lhm3zisdfL2AOcW
	 pUCb0R1sfxUxfkAE8kf4XrVMK0pL86b5cYKvKZ8B9rBHDFJggL2LWbcCUFCpSIDkoub+X
	 bfKgRl20ENURUSzGov6ePKv7FuaSisx7caJmOeBVxEycMft5an1RBPKm/3u9PQCX3Zay9
	 o31hsChs5zCNXS2fHfCzVCAbvzOzKrjm64oDkpAYIOXKHSwmyDCrC1DE3KVco3WTee652
	 nxgNbUGF2JbgfXgn3GUrf20LYBz6+L4LqDOygO16oHsXr9m3QcxFtndcacoBFviGvzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ug8MJwHaWSiOw+BHVNavljfyb011DwYiwgVO7CXvMeM=;
	b=vSXbBrSirwA1yxOwinMPtAT5K/5yE4LZl8YVUfTQpgaAZWyJRH3puR8Y1BrMTFOhgT7W
	 neFL1ef4BglPXb2JvDRFBBmdwO48gnmtcwbx8soJcS5kDANpm6PcosV4fscSR5gxLyf7K
	 h+ZGfWYKfYuX+5p7hKneR186RCWco5YEci37VbcacCdtJ10HjZ7SefceTez3xv/Av5/Vy
	 OPN5sS79uOsUoq+ZUc3hJbTVWDvEE/tfSy+Hdk8HGD8oEQrykWQh7oRpC4kTqdjgbvzwo
	 xE7M2NcqGz1IIUjZg7ZQwoM1/XdOSeaV7RBw7rzZCoHDs5hMp8IlmKnXsuYWM3tNE9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZyMi+v0;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E16606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E16606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZyMi+v0
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad881b6517so1022246fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279970; x=1794884770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ug8MJwHaWSiOw+BHVNavljfyb011DwYiwgVO7CXvMeM=;
        b=rZyMi+v0oKscy2pU4t8gYjWoNwxZilFVMTHC8+tcJcyZostJ591xlb+hLBeDrb/THp
         iYDmv+BfCrhxV0+XlJb6dBGMocU6QxVeETOJTDH70UInX1IQ7q5R69IKrYJJ2LmGXl9W
         6qyWQJcIN7QDkfSkj8OcKzRV5WR7qvMqvyyUUce1rd5q2KfBePo256DE2O5tS2wrB5YR
         Y2vzT6K90SQdl+ejItDiZR9InYP7ZpUZ01irosYt6PIIwjnFUs2vTEUIx2nMul9BlrIx
         0SqpkS7++Xapujd4kghet1dc5y/K4G1sxwXwD8hJY5cR7LiOwsa9tKwkr6VfyMjsS+gP
         PJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279970; x=1794884770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ug8MJwHaWSiOw+BHVNavljfyb011DwYiwgVO7CXvMeM=;
        b=bojQ49q3/WxWm3/oV/pQY1DroRwryTmdB1O98CjmMh51DyCtGdn3WFPSeQlvcmolo0
         zxVrvoztfjr4mFuAJHcxTPx8Fp3NyfVit1X5IHFG65pwelnO40eu7ZDgkxsaL0YPqTfI
         WgLnHc/T3nWH4B5K8KynGELtGOPkQKNi0fDStW2FtJ9gEIpNTqEdjbBmKQwYgUirwJQ+
         iLR8pBjig7Hf1dQ2ZcQBXkh/FkuMtm9xDfaK4Nh0Tu+z8CA7pAiTVnHzSSwQ5hf4g/fD
         jFLMIuVCBRA9wp5X71C7amBODiHBy/3Y7A8Suj0orTH4aLFdWonpLY64NNqYCsU4eo6O
         YDTA==
X-Forwarded-Encrypted: i=1; AL+hErGynJ8T54PcyHYbNhnmb78RmpLF8SV6l4kyQyj95ikTLLxMU53uNyAnhKTxALzh/rjyQAnTbyidFZci5vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5E3rh+jERXINYdZzLsgN0vduZHh/AmIilUErUXKs64K/UUWyH
	tUyRKcv/I8OLCOoy4BE+DcyctPEnGykCWa/nDeGjJ5P0bFTjsDblP6Gv
X-Gm-Gg: AYBFou1mzFx2EmHQDS4Ls9CS8quJgupVsIvg0JmXhEssN8TTC5GlXewibQggoM85I4P
	UMa+w31/nkO9vSdbrCMOB3tR0o5iCU0UVjswM3ipL8pei484llFVp00aLsW7iAmyajOGRMOInit
	NZe7S0yhtk5Vn695Oa//6vQdN7m4j6idcPHIxErjejlgWbYT4VXUt+qYpKW+U9pSFO2X+dlKFK2
	8itka0OJkkAsfEzNW52O036hNn3EN1buvUsdvRYarNNunYPyA9R/3SMlO20y8AH/u7QZqMxL/qh
	wO7GoFvOapfYbI/DQ8+CbAUYqXrRhTREGUwcDbYkSqjLEJWFcgsuHYFF+4be4Ba5jXWYnCOPOB1
	w0+mwGxzuVkvg42RBKnE6H8H/ODlK5jgHqqOIqUJKRVASXjgV5u/WRQUnCX4Cgie/V21+2lEoci
	E7goSZFR1rsyfeY+xW+2T+OuZSgtPhlWBYbq+uxUG74os2fnui7CMB6q63cEMHm4uf/FpQ0RK+F
	kdJ53e7k5wQB/6Q9+feM9XEriuUBK0gVODWhXAwGX0++1UomeTx9nMaNpYtqcORZdQA+a939yAW
	AVnIY1EhRm+IBSk+7FMhyCpQUbLlbVfc1D0NKNzVzogqyv3ENK2qOs803z27dszTL5/VKRxv/Je
	arsLhEW3rxtVvz+NfGU/iQE4udz4vhYTmA8yi/tYGrTI4nv8yqyOKkZYILP2/NpoilVKXq2f1YJ
	1xFt+Z8nuIhyU5atFXlC1O5nTQJgZEmBRvVDNGwtf0W6uHmNQrxShvnw==
X-Received: by 2002:a05:6870:5ba8:b0:47b:7709:5568 with SMTP id 586e51a60fabf-4ae225909a7mr825584fac.10.1794279970242;
        Mon, 09 Nov 2026 19:06:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fcdc93sm683389fac.10.2026.11.09.19.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:06:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:06:00 -0700
Subject: [PATCH v2 1/3] dmaengine: dw-axi-dmac: poll the correct enable bit
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
Message-Id: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-1-64adc48df793@gmail.com>
References: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
In-Reply-To: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
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
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..457ab9c47ceb 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1181,16 +1182,15 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
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
+	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan, enabled, !enabled,
+				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
 	if (ret == -ETIMEDOUT)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));

-- 
2.53.0

