Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BC4430CD9
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297225; cv=none; b=TxHVe5mEXFpwMgnrtM2sqArveuOf+rWcV87wWb/KwoEHBpdIs4sGyZs73kgeSjIIvgoGpRoOvWPPCBNayqDy8hGJFRM5HjQnKQEsZ1VpTJrvDSgxygRC5bHprExcPfoOIP2Z2QlUqcS8KWF0i1U7O0/Smuh0RPwD0f2smoSZpX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297225; c=relaxed/simple;
	bh=AHtQESmUQDbfBJupwFyXgqeFpsKsAMO/Fmo8tcPAIdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uuAUFjDsIeeHMpPgH45BRtFc0iOCD0IdAgIGIIS9RQABOoO/JSYho6N/hg0FDkpvY6s8f+8b011uB1VeZ6V97J/Baacgw4BKm9Z1E8l7NEDZI6VsIABGidhOdoKNivUC5z85cjIGu34BxT9vauHM31gvpWlfxubi+yTrEnNEiW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=po8pjY2m; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="po8pjY2m"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afbfe4247so371597f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791297222; x=1791902022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=szrJLEgfWw06ca3u4MTw98CHDldHiWIyomp/y7G6TPI=;
        b=po8pjY2mGMvZXbwyWm0Zmyl/d3iFN6Wsd0vxmD/icroU0EyutOxuWfDfEXhQH+Z0Kq
         +QHkzjcYh/HAHd6ae5z4wnIP3V4mdiKsB4jADf67jo2kH97vUVwxf9eqChWjcWKOrBnb
         V4SEwjBAdqI9iYX42iTJKUhP9nzY9EISYsanPILJg+LBnpxDQem3rDuFMxrAGgl5PrD+
         HQ6T4qda2YnR4OX9UVFMjC40WuFm8By3PwtaIysiZK2gvDltFqmZ0EceBCgoy1dNsaAX
         FTGIy9bNkgcfW18Y6sBJyXzVkJSLFR5FEgChOIlxCZh+2dLbzXF70sWqsjydEfkdt/Ok
         NDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791297222; x=1791902022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szrJLEgfWw06ca3u4MTw98CHDldHiWIyomp/y7G6TPI=;
        b=Ke0Awvt6dUEtuIbDnHyrV3CUjbB7VTzVwCDOblARDpIln2yoZBM03EyqYUVpBAKCsv
         EK+2Xv1Bb2BJI7aV5l2eJqO2uPU6gV/0l8Pcs2aBBLav9mLKAk+bsS3TL8k3T0vMAoom
         Wp8PbrQh+m4NrUVr8wYcnaXEcaWqrULmOuBI1Qqy0wJfUUUMlJMK+w1WcGnR2A5gqUHr
         rF1W6rAH/pbisUQjmadm3XynekJhwpcWtEgQkjtV5jVdg7yHtb0qMHFFyA+5+88wZKNe
         G1nE6XbSvxIBMmn4QRT/8cQ0/5M6lzK6+XkS8IyKuu/Wx8uNzrT+yWrpc4loNNqIrd2E
         9zMA==
X-Forwarded-Encrypted: i=1; AKwUvBwZkJUFXH8iDQ1PpbbhF7wVmwLKQEKSHcDNnIb8PFh/C6ToGJzzr1A27CH/B39AWm3eWpTo1kGO6+VpSpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSrDaD0d+4HzJ8hxRt9vj/gRFYYkFxWCGRsrsN0nXT2SZlnBCI
	x1OZiFPQ1oCp2pPR1UZ3re+gY1e82z283iMPHk2kccMUnVNMiCiY8W+B
X-Gm-Gg: AYBFou3rbgUDdVnPCZ3CSM2TDRxVCQ9H3n1z8fd5YUujW853SKaetW5G/yYdQajATdR
	FQ03pMdJasNxWEdopNclhDMKfrEh6EEXblYKWjSqlVFFaGlIzFGG7AQYaFVglJdkPlkfALjr4CA
	WaXdKb5QFh5Z4M0qg+5z8QDRgICVJtRGRCf9cGxaTWgftpUWRwNNRd4NyfFu9rAsUK2zfEBS3LS
	mwt+koL3vbR+uXkKMFxiuKe1nRZS5RFj/t0I4igcIbYcuIbYJ+yB95LsqMUJLFnwz8YUAeED+MJ
	xIhcJeAByGMEdA8Cgq49F52vG+PlEi9GQiIv71rtcNzKJ1M5cKAvqShmNL0HDGRxbg2k0RpLCbW
	cAaHDkDBYUVDYBTr1yflunUevA86FPDEDEKO9eYJxTohwoJg5PojujFmAW12P21zF6CEnz3KrRL
	nbU0YDquuAKO3B2bh3EuJvzylF9RtnYPR8nqY6n/oqArv4MOeGrdCFuXxpLB+yY0na+Vx0BtHhI
	QRwnhahprfBKcWKRDc8q/9Z4RLGW708q/4C9jWSghwGU8eluJGB3YCiYiVBxpIJ198=
X-Received: by 2002:a05:6000:2586:b0:48a:f3d0:5dbc with SMTP id ffacd0b85a97d-48b12711a15mr25744347f8f.4.1791297221448;
        Tue, 06 Oct 2026 07:33:41 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48c62289b62sm10911048f8f.20.2026.10.06.07.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:33:36 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeff Garzik <jeff@garzik.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ethernet: i825xx: Fix dma_alloc_coherent() size
Date: Tue,  6 Oct 2026 16:32:40 +0200
Message-ID: <20261006143247.54724-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sni_82596_probe(), the lp->dma buffer is allocated with
dma_alloc_coherent() and with size sizeof(struct i596_dma), and possibly
freed in the error path with the same size. However, in
sni_82596_driver_remove(), the same buffer is freed but with size
sizeof(struct i596_private). This error may leave the freed buffers
mapped, leaking a resource and allowing the device to access freed
memory.

Change the length in sni_82596_driver_remove() to
sizeof(struct i596_dma).

This patch was compile tested only, and found by hand.

Fixes: f2ec8030085a ("Ethernet driver for EISA only SNI RM200/RM400 machines")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/i825xx/sni_82596.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/i825xx/sni_82596.c b/drivers/net/ethernet/i825xx/sni_82596.c
index baa598988f47..73e1e153cb78 100644
--- a/drivers/net/ethernet/i825xx/sni_82596.c
+++ b/drivers/net/ethernet/i825xx/sni_82596.c
@@ -159,7 +159,7 @@ static void sni_82596_driver_remove(struct platform_device *pdev)
 	struct i596_private *lp = netdev_priv(dev);
 
 	unregister_netdev(dev);
-	dma_free_coherent(&pdev->dev, sizeof(struct i596_private), lp->dma,
+	dma_free_coherent(&pdev->dev, sizeof(struct i596_dma), lp->dma,
 			  lp->dma_addr);
 	iounmap(lp->ca);
 	iounmap(lp->mpu_port);
-- 
2.43.0

