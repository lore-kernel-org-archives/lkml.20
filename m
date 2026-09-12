Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED2347887F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228007; cv=none; b=goNuBI+kIx/7RCDEYvc5TLLa1BlrsnuWq+DUHlfbOWI8ZXzBDwaguI7I/1Sq+f0u0i2FoCSFqe7ZDCLW1Asb3wZUvbW322DnHuurFfbcvFjicJSVfgWzvHzFMb0jU2WgXa8+YgCcFw+/LwDYNcN9muTT1PF4hrEtNcETY6R0GS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228007; c=relaxed/simple;
	bh=LkZk7eDOgro1jEZi3/1gCjcZxD/PbBiJGk1sivjx/Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q+gFIQaRRODJ6q8xD5/sdcybdDvFxbbhrJi9OX4zA8QcHUo4Przqlrldr10lj6O5PKr8qFEl/+yVGzJD4uTDXNRexNs/Uu+Flz+eS+YlcO3gmn+pkuJe1NVqC3enGOaheQG8eowYBCSMIGwiVC+8GQ+hs66B8FBEDjKvwNGGSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsGkoY1I; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsGkoY1I"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso548136a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789228002; x=1789832802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/YDrfc3Xwk7gOrxAX9QzohKyWwy1OWumC+p49dj5dE=;
        b=qsGkoY1I3TK6hmq2NxBYIMBjSPX2U7xAW+8UcsfFprr5CF/xo9ystJcWg39QEY8LBL
         LqL08KUoYHmY0Q/ZqV+AITS+2ChpfjVI9aUZZ7RIj7Lpv7vVJqkEIW5qDRtnVphyHhTU
         tu8BK/de0eBqchuNpHPIEGKz+jQAhF4te37L0JpSiKWVXyrKqoAsLAtadgMjzdDBxuxG
         CFB6desXClM/Rafxl8+NpzoJiMvHiTawD+0hLUq4O27eoZJymDiTU1k6HZHcUsXUZ9rV
         OjJQ1LZ8MceGhIyX0JiuqeOjIzFOwKT54BPFjZ66XcPi+TTm6z7qewDSssjCIo79b1EG
         eJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228002; x=1789832802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/YDrfc3Xwk7gOrxAX9QzohKyWwy1OWumC+p49dj5dE=;
        b=p82Sowxgyw2SVR/SF9Cdspiot3jatIKM35FkO7M/ctniAH60YJ6i1ZQ3UbfH8l0P9X
         OGlqS5FbdFqH2i3XgGklwsT9MLnuPOKKbUwYd3aCc7oqNd0GmaDu3V1x20F3Cu3t65CF
         xH+Gt3NSXGdVgWxAE5CJu+9hMFbh6ulc3G1Zg5nYO+hPrx+gAsMLLLcDRHFgNddiB0ed
         DScu6Vr8rRnXEQAJOup70ONMpgczISjMoEH5RkIGvuKeqZR917et0BSXr6AUwVngSZ6W
         q+gb+50OZiDdKRUKFOMJwhVmZ3LxzkFjYg5hXXx/z6wa4BxsOEr6eXWAlECHLBCAv9NX
         8z5w==
X-Forwarded-Encrypted: i=1; AKwUvByEU5t84WQ/kQcE7306mJ+KKH5H/JsCsnMMSaNFreAhYxFU1sIuQ4mmTn7jxCwnzEVDBHjGbtWUv3GYp74=@vger.kernel.org
X-Gm-Message-State: AFuF++mYZRA/pbgijTIBg1AiNjGSE/Stz4TSybxJ+AM6UFxJJSL5+Py1
	U2SbhMKmRH1msHCJu/H4QuC4JFHGTIvqX2mOtobmi73OPCWYLDcv8RhD
X-Gm-Gg: AYBFou1X902YEtQ8JicpYultyyhPkg2EqwJKeOvnkBEAM+nFLq6+kR4WdelNYQU6MFy
	xXFzg97XiexPJ1EcJOamizT0AldqbCFtPTxrC5LnZlgREmpQRmPnpbxdP2GII66gqK6tFv5qJ+c
	SnOWLBEQpRvKNSVHC/KCZ2gM8JMnsgpZzwdhRSpAVI7tmmC0yjmmhUKpmWqmuCntQvvpn9Kzkdz
	D3AInItzUu06QixTq6woy28oTQktcBE85Jh/8x8JDE/cHcPzOq2r75zywbw17LP2bWhQEPSK6Jz
	lZFqslPOUcIFk238vUfa0XBTQinbBZNlWTgJ7JRvYwhaaANCt5qxoqWycNhBZlctTTKSXe+mgoy
	vS7HZTjbfMomEGupfP4KxiyPV5zzPhLfKredMauYYwikhgZR1wyFwNN3KwCfJwYXRuQgw2V0hrO
	pZxu7unRLN+bEreMHbAGdPIaBYI7v+dLG3AA/vX0vC5Y4NA2lp43hARMM4KqQIALNK
X-Received: by 2002:a17:90b:586f:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d9c386bacmr17219294a91.24.1789228002294;
        Sat, 12 Sep 2026 08:46:42 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm12214069a91.5.2026.09.12.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:46:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Ludovic Barre <ludovic.barre@st.com>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: st_fdma: fix potential use-after-free in vchan tasklets
Date: Sat, 12 Sep 2026 23:46:29 +0800
Message-ID: <20260912154629.1021632-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

st_fdma_probe() allocates the channel array with devm_kcalloc() and
initializes an embedded virt-dma tasklet for each st_fdma_chan through
vchan_init().

The interrupt handler calls vchan_cookie_complete() or
vchan_cyclic_callback(), which may schedule the tasklet. However,
st_fdma_remove() only frees the IRQ and does not kill already scheduled
tasklets.

devm_free_irq() prevents new interrupt handlers from running and waits
for an in-flight handler to finish, but it does not flush a tasklet
that was scheduled by a previous interrupt. Since fdev->chans is
devm-managed, the channel array is released after the remove callback
returns.

This leaves the following possible race:

  CPU0 (driver removal)                 CPU1 (IRQ / softirq)
  ---------------------                 --------------------
                                        st_fdma_irq_handler()
                                          vchan_cookie_complete()
                                            tasklet_schedule()
                                        return
                                        <tasklet pending>

  st_fdma_remove()
    devm_free_irq()
    ...
    return

  devres cleanup
    ...
    kfree(fdev->chans)                  // FREE
                                        vchan_complete()
                                          vc = from_tasklet(...)
                                          spin_lock_irq(&vc->lock)
                                                       // USE -> UAF

The pending tasklet is embedded in the devm-allocated st_fdma_chan.
Once fdev->chans is released, the tasklet and the virt_dma_chan
containing it point into freed memory. A later vchan_complete() can
therefore dereference the freed channel and cause a potential
use-after-free.

Kill all vchan tasklets after freeing the IRQ. This prevents new
interrupt handlers from scheduling them and waits for any tasklet that
is already pending or running before the channel storage can be
released.

This issue was found by manual code inspection.

Fixes: 6b4cd727eaf15 ("dmaengine: st_fdma: Add STMicroelectronics FDMA engine driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/st_fdma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..23071cbf1866 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -846,8 +846,13 @@ static int st_fdma_probe(struct platform_device *pdev)
 static void st_fdma_remove(struct platform_device *pdev)
 {
 	struct st_fdma_dev *fdev = platform_get_drvdata(pdev);
+	int i;
 
 	devm_free_irq(&pdev->dev, fdev->irq, fdev);
+
+	for (i = 0; i < fdev->nr_channels; i++)
+		tasklet_kill(&fdev->chans[i].vchan.task);
+
 	st_slim_rproc_put(fdev->slim_rproc);
 	of_dma_controller_free(pdev->dev.of_node);
 }
-- 
2.43.0

