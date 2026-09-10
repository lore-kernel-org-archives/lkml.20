Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9533F594
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073189; cv=none; b=mIZdpG4xWkwUGlIFQHgpx0PMI7IpPbktpBLYwqVGc8tvrrg3u9+5WPwffO4yZQtO5tDuf2yqfRAvBNqIHvJZJi5v0+RH42saFy60s/PMN5girV0kKiv4MSvBsbX14UWg3IB6kID1kK+FEqB1410mr9b3JSIzJNRaK3pBlJlFZ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073189; c=relaxed/simple;
	bh=lzV2GCpFj14QmF4NRzZkeUqmBn932QHppgumDndrz2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFO+HD4flTXG7kqAkd8D6X/Fq+64O2T+dBMCbG9lnJ284MLe0XRTJg3CP9O2Mv0zswrXw56zd211SuBoez5cTVESsgAsou6Uce/pR4/ZoA1vbX9JqiPmUTJenjhj5KETUVrliCNHTQubfjGe6hGIaMXa0hyB3D39VI6hBWIj8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipMIb5l0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipMIb5l0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8f265cbe6so1555955ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073187; x=1789677987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5NzLm00d+6PWFDYExUVxG0yq7opmcUTWEJmvWiRjsQ=;
        b=ipMIb5l0LpDsQuqpIWaa0fSGg4advAEpuKKdE1y+kM3+XK8t9NZEWxxDlMLIuXjr8Q
         0dEOJIIPlB2oYpbUgVxfIKiNEQyb0VoHlXFDZfTp8M7AgJy5l2OcS7yPU/e98XgUxQUl
         lusMFWIJDvnaGRIaY8v/twEDUZYDXj4WS0SwltSIflbO+D3P6gPNC1EM3L/3z1qZkcZx
         eogRNyUN6zYOU4Hgs2X1Mpc7twuMHWlKIQSmv/+mHZ9aeSBOEj1CB9vvQZ7opYp0HlII
         7Xgzzkai+lqPmT0JwTZq5C/O0Bbbr/M+Ws7o0gLBZ9GiTY+wgka+GB+4CwHe/oOxgu3r
         Xckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073187; x=1789677987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5NzLm00d+6PWFDYExUVxG0yq7opmcUTWEJmvWiRjsQ=;
        b=rUgmE3ksceYO+TRpXjn05YQX57T9k3lcRG22W0NqDwgCr3q46eGO1T4pq34JcAQuOg
         VDdcw4GKQ3NRPkzI0Hj8IVxY2IssCtlCTVVL8p5WrPSbwlg+5+DCW6jNQM/gWrHXAvHc
         3Fz2qKbpkgomT5KrU47LcU69VwU6sCmLIqao5z0wCGHMqpbM2ewf0T0xw3PZ3ochhpuP
         7y8PuIuDZEuijMfSkGXiS7g2rl7bKBgALKhQsMq6H+vIeeX5J0qCBw9LzTFPkaWzMY6n
         t6z8q+vWDEEfalm5lxMlnu314RPyhRETPhwl+Hb4KWHpMKlDNL4Ndoi08Y1OnQ9rcpI7
         0GYg==
X-Forwarded-Encrypted: i=1; AKwUvBxFkLJH2vHjjZv789gFB+pi4iBEm0r40RlW0LdJN9keuKXBdLV1Gd3gBzzCIzG3T/MpxsdyCNi2dyLDScs=@vger.kernel.org
X-Gm-Message-State: AFuF++kMa0A//MMigvVr7Dsb7yJ88iSwflduMgnHVTgMpKoR8JtZiiPO
	J0w13ZgG1d6Oj5y9BWvIN8HF9yNcbu/XkU9ua8SWqJc0ztmqzEeUn8Cy
X-Gm-Gg: AYBFou2CPgPpLZW3HjfS7znav0/WBYP1+yESHb2ZeH6Apss1xioGwRmPVgW/eXcnAFv
	HsZa1n3+XoC0UXG4ZDdKs81oebqv9ET4jLkaIcP6BuP7KD6Z5xFvAOAZpn2QwGeZiGIh0TvuWvF
	GCn/KkAwAbpZgKy17Suhn+V2uhu0HMu4W6WCoJWBG3rupkmWnBtxB9W/9jNJxTB/O65GFRH8stG
	ru0d2VY2Xe3YdoroqtPUPU8yt1voacZGkw5oj8rnXxLdftNR7vN4nwzPRD31Tbzux0X6d1XHfeG
	f2fklR1ndCQj9v1jFoPjKJsC4mp7Y4Fn/57eaDhON92JZkv3y8NXGd3RW4h2nGuIALsNqv8vqnh
	zl3R7GG1kztBYv/WerknPaCRzVgtnBaHvXnMKOFTr7gF2yCMevEiuP10Y91GRVoVO1dSG8uzQJi
	tZdqH6+DIL9JpIgFvy0j6px7ucXbypjz/ck5PFUqCz95CEnl3fY3B+2lUjVePWaZwyjvRcQJ/ME
	RN8LFe/MqRQ+FjD++wUWRbmSIHmgfEAhNwLE82MePWmhtzqS7r9Og/H00eY6ui9Mcx48AeTjhEt
	1SEAmC1RfEWWpyozpysoJsmjJ7zE7fq+qw6vJXkhmO7kUx9CZg==
X-Received: by 2002:a17:90b:3c89:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39d9c35047emr828915a91.21.1789073187174;
        Thu, 10 Sep 2026 13:46:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm1261016a91.6.2026.09.10.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:46:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsldma: convert to platform_get_irq_optional()
Date: Thu, 10 Sep 2026 13:46:25 -0700
Message-ID: <20260910204625.55367-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional when absent
and the driver falls back to per-channel IRQs. The corresponding
irq_dispose_mapping() calls in the probe error path and remove function
are removed.

Moved before anything else in order to handle -EPROBE_DEFER and to avoid
doing extra work. Simplifies the if statements as well.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: move to the front of probe.
 drivers/dma/fsldma.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index fb19c60540be..9ee8ae1aaf40 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1224,8 +1224,13 @@ static int fsldma_of_probe(struct platform_device *op)
 	struct fsldma_device *fdev;
 	struct device_node *child;
 	unsigned int i;
+	int irq;
 	int err;
 
+	irq = platform_get_irq_optional(op, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
+
 	fdev = kzalloc_obj(*fdev);
 	if (!fdev) {
 		err = -ENOMEM;
@@ -1246,7 +1251,9 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
-	fdev->irq = irq_of_parse_and_map(op->dev.of_node, 0);
+	fdev->irq = irq;
+	if (fdev->irq < 0)
+		fdev->irq = 0;
 
 	dma_cap_set(DMA_MEMCPY, fdev->common.cap_mask);
 	dma_cap_set(DMA_SLAVE, fdev->common.cap_mask);
@@ -1308,7 +1315,7 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
+out_iounmap:
 	iounmap(fdev->regs);
 out_free:
 	kfree(fdev);
@@ -1330,7 +1337,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 
 	iounmap(fdev->regs);
 	kfree(fdev);
-- 
2.55.0

