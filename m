Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262578;
	b=aHjvU35eTRXMIhpo+B2DWAyhxS0PVtHvNvYhPyfOXWMaUjdZa5K8+b+aJJXRmSio1Yu5
	 VeWW8tTas8W/Yu9ZOm4vm/JqLPoVQPyrD3+ooem5vpmfwARu8BqvRwZVeesQdeYl/HgJ5
	 tA2JulyCpHBTnwNAhQ9sQjHmHOjlQAU5hagV5sxURhXTeSw+LBEBGcTB7ekfEhDv5/1AB
	 keOZIN118UPAIuj7lVPqLPqoaBHzq3bgrFthhiWp9XvCr80PgtJPA8JD6bDHHfgbMxMmW
	 moY9+W9RT8oOPNne8sy/QTJy4oSzZLzOLmzXRheBMCGNHqk6GOhzFS6+6aoDA0vNsig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jOkt8eUrlOmCTGKi+IBj1g+BGAtzeO5q15Ol0c8Hric=;
	b=HBevZ4sKJJl7Lyo35ZAx+nErEF6hOKQq8FZzMOVhhEQRZJctCpmtTNgAiOUTK5SCcsFg
	 Kb2GhAIXBGXRM2YAyQTclOEwxOKP6z/mFn6haTR2ieaYKmDmC47ltGnEI/DM0eaHICeOA
	 PMGV+dkRZCRD007jsEOKMkOBRIEbGbJfbAUfQrCMAwGPfX1E981F0R1lUrqMX1RyJ+bd/
	 uq/beWKkBqAR+5RPe4uRooDcWxLXtxTUpwE0fXeZHf9paXObUp1rjxnRi3HP43V4ZO/Zi
	 eAqLdjVv3m0eckhGUxcB3E7FtNyOjH5TUL7uyphPEE3OEMr8LJqAFUOyYL/MH2mRMTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxH2Nv9w;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9D606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B9D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxH2Nv9w
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20be3b39eso1811525e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262576; x=1793867376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOkt8eUrlOmCTGKi+IBj1g+BGAtzeO5q15Ol0c8Hric=;
        b=TxH2Nv9wX4NId0No6LBCGfNvUZ2HHK0eY3XNMVsu1O+tTEDpVxoaU49a4T9NHpEg0w
         tYscu3LoXDs+XsYbGgxclZiq1cfwRkWIXGyP5/F/8RsOcgW0Po0kDwvZE+7nRiikRyov
         YBEdvhCfweiTytMstcule7eL2jqFC0pyE0hn1L0ZfcHLjr6AA8Ys/kbfbiCm+V7YWLPp
         oSPeiGoHzkL0sxeTyan88jTN4c3NXVutjRC3uSHknp+U/VjfLhBRcM7nP/LngerK58pB
         fu3Z9fBcgyRDx0Ho7D1XrlOw5r2mWdD8C3KWkM6bN0IOdScpZL05c92AgIYNw3XF0L/z
         8UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262576; x=1793867376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOkt8eUrlOmCTGKi+IBj1g+BGAtzeO5q15Ol0c8Hric=;
        b=uUIRW9Swfcrl3dzdLqE/L2eBUFBqK3WT3qba1q7Z2QJvYrZImSd1YSU1EDqnuUnYPV
         3jHwL//tLL5FKkdKHGX3Gg+h4VQI40J+O4jRF2TYIU8rffaZm0IxijzDAXyXhekvxdTd
         IIE/wPWNKtBEuoHSG+6AkzshAzFyEe+ycvWQqvX3sO5doQpeAc6Cl51kKguQvRJhMayu
         CTJfTcTVI/4YKiypiIjWDJMGf+MG9Id5u7Cx9Ub3IR5d9/mLsd4YI93JJ0IPn7FbjdCz
         CeXasfU66LIF1Xm3VROQmRvL1QhIlaU25ARF8cVpxQb0ohbYMpLVrfAmngkK3+UMfrT8
         nhyg==
X-Forwarded-Encrypted: i=1; AKwUvBx/lPQ78tguRRVfEPUxmv57PeU56tCVtKFFc2pdvgGd9JwRBnW6B9CnBidxdxojdsYTpftQw9cxWbILbFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+zhH+wnlgQ0WHYQNv07IicWRYVX5z++DqXZ4bhiMaqJwwov81
	RuXomCTFvif2OKl/Vnr+tkpLNlr3p5701lrUmDXKLExuMFEGds7ELtVG
X-Gm-Gg: AYBFou022cEHorhDjAw6P9dLrl6VPtcqTqBdP398ztmXCqv1AuHZlghqkvniGPV1Y+L
	X3kBnbfh9b4U5kzaMNx9IKpY33JXSMr46QSYB7SJ259zrFnFbArOQRp+DUuJ+mqjptxyrVOOZYd
	5XxzGW02o+rMg10Sd0dEL7F9xHPYfz6OJ0LQx/DfeOhhrDtMq5Km9amOe+M+n6QFOWDOzN9xJYk
	VPOSWhL4Ns3mwYFpa1Bo8DMiLbzZqiUqy9Dg84UpN67H/EtKZ+Uq4uJzaEaKWVEjPs0AZBSFi3v
	vjqUxwYbw2fHSZcOBT6ppvbqlEAlKOLgWykyC9WISpVzZ9C4x96HCtIrZy3B3I7c1Tj9pg+drol
	uGkuXKISmbk78h0P4EMjW0n/vc0gcPWsC+J35Ntu9rkGMm06lM7Sse6VNikmNWVjEQMUh0/1bL2
	9VvgaGXCpvjUb98OUTMq9QmjeyFdPrh2V1ohxL1l+QtkhAfKyZShTPSVJRTzJzbyjT0Gagz9nyl
	EMsUFo6zP7bdmzbHVXJVKG0SxRfKnE/RT+0dlJMOFvXkKWbmsbb/L3OQ86wYv+Pa5TPsgB0M25Z
	dkmcN/bNPiZkfFbBzyq2cak8OQxkQow5qXUO74xtyiIGHcZePNU=
X-Received: by 2002:a05:600c:c3cc:20b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a96179c9d9mr77845395e9.0.1793262575720;
        Thu, 29 Oct 2026 01:29:35 -0700 (PDT)
Received: from thomas-precision3591 ([2a04:cec0:10c7:3c2b:5f0f:ba7f:8641:d1f0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm55170455e9.7.2026.10.29.01.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:29:35 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org (open list:QCOM IPA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net,v2] net: ipa: Fix double free of the interrupt structure on  config error
Date: Thu, 29 Oct 2026 09:20:55 +0100
Message-ID: <20261029082100.17722-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Since ipa_interrupt_init() allocates struct ipa_interrupt in ipa_probe(),
the structure is owned by ipa_probe() and released with
ipa_interrupt_exit() on its error paths and in ipa_remove().  The error
path of ipa_interrupt_config() still frees it with kfree().  If
ipa_interrupt_config() fails (called from ipa_config() via ipa_setup()),
ipa_probe() unwinds through err_interrupt_exit, which frees the same
structure again.

Drop the kfree() from ipa_interrupt_config(); it should only undo what it
set up itself. Drop the leftover initialization and cleanup of
ipa->interrupt now managed in ipa_proble() and ipa_remove() of ipa_main.c.

Fixes: ad1be80d7582 ("net: ipa: introduce ipa_interrupt_init()")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1->v2:
  - Drop ipa->interrupt initialization and cleanup.

 drivers/net/ipa/ipa_interrupt.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 131b9cc94201..766b094eb069 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -260,10 +260,8 @@ int ipa_interrupt_config(struct ipa *ipa)
 	interrupt->enabled = 0;
 	interrupt->suspend_enabled = bitmap_zalloc(ipa->endpoint_count,
 						   GFP_KERNEL);
-	if (!interrupt->suspend_enabled) {
-		ret = -ENOMEM;
-		goto err_kfree;
-	}
+	if (!interrupt->suspend_enabled)
+		return -ENOMEM;
 
 	/* Disable IPA interrupt types */
 	reg = ipa_reg(ipa, IPA_IRQ_EN);
@@ -289,8 +287,6 @@ int ipa_interrupt_config(struct ipa *ipa)
 		goto err_disable_wakeup;
 	}
 
-	ipa->interrupt = interrupt;
-
 	return 0;
 
 err_disable_wakeup:
@@ -299,8 +295,6 @@ int ipa_interrupt_config(struct ipa *ipa)
 	free_irq(interrupt->irq, interrupt);
 err_free_bitmap:
 	bitmap_free(interrupt->suspend_enabled);
-err_kfree:
-	kfree(interrupt);
 
 	return ret;
 }
@@ -311,8 +305,6 @@ void ipa_interrupt_deconfig(struct ipa *ipa)
 	struct ipa_interrupt *interrupt = ipa->interrupt;
 	struct device *dev = ipa->dev;
 
-	ipa->interrupt = NULL;
-
 	dev_pm_clear_wake_irq(dev);
 	(void)device_init_wakeup(dev, false);
 	free_irq(interrupt->irq, interrupt);
-- 
2.53.0

