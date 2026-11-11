Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366921;
	b=CL8Q5j08N+qANxhqAedAlOEnH144ikkYv3Uy3QjZgkB3yYoItKQJSrbmQGJ3XdLgKcie
	 iCr4UB8nyPx/KKORxSsXuTuJsccx6eCSO5Jvz48kcPm9SE9hfYZHoK9M+IY5eWGRgVWCN
	 9X9S4eFm6HyiaKcZul5JZaT66eZYkyMuZ4zUsQyHEt8t1iKZmafG1mFiPncwwFSxHCO+U
	 azVcT9RrrQAjsIs78dJz9V1F7eLDtwz8Gb+5Qug9MkOYqjGkWbmL8kHNSM9cLEUh3lklX
	 BqnK1+BL4ctbY7o/S8DXdZ7JbYECi5cQxV13eUXLlXLkj6TT6dZLE4wiPHeLKuhJE7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8XcBdNuRMoaATT6u8r4a89AF/r4EjhS8wcxyVTrRvag=;
	b=RL021aW6y+SofhSk+lkBS9180c70EBEZ23Wsr3lg546dP3lK8i4YfmpJevS7PSl33hB0
	 g05x1EUD1En+v/GfEyUGrXE/a4L2PB8nnAf78FwJf5MBvsyKep8Xn3d0WlNlXRHHDLeVE
	 bUyGpoZJM1YQCCJwrXOT7iOYFz09CiKpXwXL9KJrDzK5B2p4oEjfK88yaXhTEpHEqKwEW
	 hG0Xl4WywqsWc8dDJDkH1SGdriMF4wxE7kNuen2tXPEeX2jaersXi86NyWnxYf8s8Lsn9
	 q5bDMKB/APW69XwDGvQK339ZD8rSH4Z908mIpG7C+9tvw6auoAZITWB/8TJYk/M4xcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5z5a6Ih;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10560A260B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A10560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5z5a6Ih
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53ec92375d2so1066655b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366920; x=1794971720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XcBdNuRMoaATT6u8r4a89AF/r4EjhS8wcxyVTrRvag=;
        b=Z5z5a6IhtHWs0lSoIePVq1kSkSmClUqbm8oKEoa6pn4/nKodNgvJ2ufjUnu3DaLn6j
         Gb5B/fKhn5BOM3BM9T+JBYHQ2y0oRPvvPGUUHG7qwpXc2slSdG5070NT7yflE/TObnGS
         d4iQIUSmQzQyIiE5uYGt8KM06wkb1aTSjyCc61Ja0gZVGsHERbJWWaxDx04V7YN1g1Gt
         TOKikNbAmPIYmlC8BoLjwp48gQZ6QKL4uoxJj5rHABmZwFApWg/ijgBwd0jUDmZzQDtl
         rn9AZOaI6zjYtrENcRzj5GhRHf6LKwNNgckiBf09+YqM8nj7JGDrlMjNEOicLILn2qtH
         7j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366920; x=1794971720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XcBdNuRMoaATT6u8r4a89AF/r4EjhS8wcxyVTrRvag=;
        b=yW9nKeHUUJIXfLRd3f9vFVYjabKSstQZkiEU7WblJNK/ypoc8AhSSLwoac4v/1tI4y
         L83EMJV3sXto6c1Ntmxu5ARIdPB07k3EkxtYt1KQGT7AR9ou5XzDSmqdevFnEsisVIcq
         lSi0/MS4Z1BDupzQAP8112sPttDPySKLXNYRPQapSBWUR5rdjdqzdzkWfPjK5FwnXKVB
         qwQYwKlDR0GHP8jcWXEJLbv9cFmpLkDCfG0Nro9dRX+GPVB/bgSQDE66ti7ZLaV944oP
         +AeIBIncNoAA4dgJRwrV4sGYgtkL31kd0zpngqEk//6Fr3/KdtICcHVE7VF5iI6yHrkt
         Dbnw==
X-Forwarded-Encrypted: i=1; AL+hErHxW3bR+MUO2iojJEzDaxo6Mrw2cA82QreD/01P2C+fuBWr1Ii/anzh3ddvO1f1SXXzj/+fe/Ggy1+wBcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6BtPdNFpfkuRUVULoU/Serhdv6nsFVZvcvgrNPE0ZNSGlz8uo
	I0I5LBXj2bWw3uGLfFC5rrMwasaaf7AbIOtkXW69juamiCdFQcWgBOi1dXUo/yZ6
X-Gm-Gg: AYBFou3D/7rFRX6+7OCiZY0D0I1yx/I2e3/3EaU2XzcLWY+5KToLA6xTJKrS+HSFbXO
	mMHAbt/F5zd0Urb5n1DxPuiG5roxOe9ZWtc1b6j4+8Frcz93ae3ZG8egLdVHhuTjC6RhcTUvnlU
	E8PyqjdslHYTYLxetXjhROtwfkIcdPxkTdPqw0wylGhZBAa2HBD+nexax+RqkU+xhDmjrtfPeca
	mFFMxwlI4rRgf8ugRE2BKO6Ala97Ld9gf0UDYoqYiSbyf3m1rrRncQAyxkngodSdN3g5hxRBSp7
	Fp9ATEe9c+9Z33+TWEkvGrwYi+PUJDGphqH1iQ98demTuy/OSvko0AWE4DoSeeL4mCQNa+sGhRR
	rbNN5iZtFQJjshJoAyv60ZyBdMuL2X+3KyWF8FUy60qa3j+a7WwheD4sixypvIyjM8Uqa5TG6Lq
	uQbF9w/+5WCISYjBdLtYxmE0D/3bRVK/TM1Fm7G9T03lDKun/BEk0XTw0uZsoU0YaqmwwCZrvgE
	u4dOU67lKK8xWTJ8M0qWHZIpJ0blsrt2Ob2JMPgWkz+V+vBHir2idEyUUQXSLzpv6cgCoS56TqV
	xkpFucRfZGWLqAfdOvgGcIbzATzjl2uQtPSq/IMveBz97M+cRZUOX1z0B/Po4yxfTZJU9bfp/zD
	xg2SWGZzgYGv8YlQyZ8CAtPVVfqfKC42MmSql3oHG0IATJRhrZ0GdjWqzaNOapn3CbHQJQQcKIy
	y63JzTtXRMM+KitMFO2BvPFahccEeCQ7oKMr2hLK1HMgRqLNhrushw9KSisuSF5UN6oc9L0Ipk
X-Received: by 2002:a05:6808:191f:b0:4ed:7045:d3bc with SMTP id 5614622812f47-56b97507aebmr1037132b6e.32.1794366920529;
        Tue, 10 Nov 2026 19:15:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3999345b6e.3.2026.11.10.19.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:15:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 20:15:14 -0700
Subject: [PATCH v3 3/4] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
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
Message-Id: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-3-35fdfba8b61d@gmail.com>
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

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use readx_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index a9a87589324d..bb305ab94d02 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1222,7 +1222,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1253,12 +1254,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
+					status, status & DWAXIDMAC_IRQ_SUSPENDED,
+					2, 40);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1266,7 +1264,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

