Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617095;
	b=g9Sc4TbnpkWkQwqnwPG1+HsjwrTk2i+JS8a5ip2nU4Gzvv00aC36zOrZ2+vxjiDPcAZC
	 DacQaGg61LGUWnsJ/oe0TuDJvm/0zyqPNUx/tlUVwiR4JvVSW0bI0D9ppfWhwlXEFCsR6
	 SpyZ6bJAoQsqQgna3VY3Qa+A25SiZTTRJGvh0EG9HQ4Hnu7OOnBjhgQex2xGDfWSHDNFL
	 5hJ3s+CmFDEFpdohejEKSySDYCTEBybgvbgx75lGTF4amPPiigG8b1hKDsW/LNGZ9MbaZ
	 O5N34MvNCFpnSwlzF7eJPtK3HNGG9Qy7q5+Wfn6JIj6c+r2sF9OlgQRtl8BIzLCsTCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
	b=JQmm/lX1272CSKS2lwavHVwYH1wE10ar+xGGsQWGc1CyIzzCvpCvJ55M4o46JK9Qn36X
	 v1HhnzIdDQ7TrSLgnoWOA8BFHrS4UVropLVoaV7UyLLivVt1K3xNhyUro2fnsgWJihwnK
	 mk30NuXteUJh8YbOvOedYCe7N/tlRH0OJmhq+amZhaoWvcJTK1o0AOB61CHye+kmJ6S8H
	 aE2iQG9EI/2uofxz3QqF3aNDJFNNiAcrfCDFvqtBbtK23v7/4KyinB3IdrdB6yENPfZSC
	 czkEGyDAVzqhw5hYDYXMoOYsMUDNP4sFD+KaGb5pvjXPKc/liVBNZ82Ahx1hgEzJARg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/qAGEP2";
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7E9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/qAGEP2
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-825b40f8a26so663020a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617094; x=1793221894; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
        b=A/qAGEP2xYtqwZwBkxIDqtHEAo1qsn/j/ZnEAfXvv85+H8NdexbcJrJoZ985nhDdEk
         WxrEbcd5coJlgA0qylzImpLj7BXi9+rMJnphf4r6F6j7j9QwbYemAmP7HWvJxhDz1141
         bG18EH3dL+B92c6r6tqfwBqFWJ2XqZMfYSePATAsqnlF9x7R9PBCF+EKIaaC3MSwWypL
         KXdx4ctNpwh84XzXV5ElfTtypmd/fLes62ZtAPipo3TiUQzUmuMVotWA9Pi75BH+VOo8
         p1xrbRR/zDcCdCtuiWOIOWp5trj7PNbSFzfgu0qfPtpfNo8PNsEGanbHOh5Zgf6vVIBN
         ojWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617094; x=1793221894;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
        b=dUI81d/HKIjpktNUuD+hm3GXWP6XwG2xGmGcUrtBVulDi2BHmhYO3fvPre4Ig7kqRH
         W+25PMj8U5Z+tH1dBPD8G/uAyQmLMp5mZmMDd2aleNYbOjMIy2Uw2W+GCgr3BGEr89mw
         CGtVWS45DzaDbNQkPB9fvQj0hbPz811NhDg4fjiPGeZRDWTSO780eV4LhTTsFz7aJXT0
         3T841tEx83Ppp/3N0FKrHOQ+iulXgZH0fuX/bWeinuC3mDh1VjuQImkospP5HcUjJLGg
         Ab7dygvgz/FHlXPmjIBTiX4k5rzdwDI3YhUdcijVgpemYvuyUhAM+nMeGl7MPbL68BMK
         Qgvw==
X-Forwarded-Encrypted: i=1; AKwUvBypO+KW6vImbAsFzrkrTwjnnrau/YW2jj5wnkVr+BMHLueQQHvuf3+W/bKzZs2AmH4Wyy9Ud4GQV3NwQPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJqj6FqfIEmzdj9/VRbn/UDOXAQm1w+QUu5BpyeCKDQ/GK9S/g
	edG7fgLOd78WNCGDC35nKJoe/waS2OSUoszn+ggg9CgXcOKWDp7hRRYh
X-Gm-Gg: AYBFou0lQXpysUCpbYwhcgYTmvqO+TMgjG12yrHPCOI56nHZv9daTg+6U4ylLkUKjDf
	fVWnX2VteJ8EPFpT34QpwNrhWExVG4fkYTYsiEkLJPyIKAT5xdeB22fOUmnpuBIgsrAgRA0fBLQ
	4PJiD/Cl++P72HA4kgvIC9BhnDiPiDkRH8qGPm+VwnH48y4xWZiQQYYQgX4DU8KvvGz+gQysS4Z
	NAzmYA4X2ednr/pb/6WAbtCHblcpp7z/dRDK8ZghuDTNFKc63wPw9XzdF7hHP+MyVYRPnnolZxr
	sYFmVRDx725mhWABts7AW233u5su9DY0FbY0ytIytEr6xqliOzGKxUAKt/TkRDy2zTIBxj39Pjr
	ltYXY0RQw4c7yx/FlLD4Yc1/T6dFwkMLlzM51D6tIaPWQKoxZ7zTPSAVdeQa2HwXat7WE7w+e8t
	4Q8oQIbqObQgW+Z5uFPShuUC50gZXXdRSVFpL2FF6PCIgOmQ1NGw2Px/w6hmcs8RA36dDZ3EajS
	W2/YmNABhoYTqAlxg0ccMszKXedyJVMjNm0LM08Uc8AhSTimmbs47tHVUl6Ek85W+kcgW58g4OO
	+RD2cC04Ccvvk5sJM+vKNYeips3W+rZ1idjsMDJPw8N7eYMxOTBuN9AbHcCOBRsB+QA7fPjQYaB
	N70jh29u3IPL8oAOGdjXB2JqhGyLkwaDDP4QS05OEoynZmqbp8Wa8nDxqvfFEaNPWc/321kQjXg
	V9QPQ=
X-Received: by 2002:a05:6808:1645:b0:4f7:a3f2:d8b4 with SMTP id 5614622812f47-5536055db95mr2302438b6e.65.1792617094073;
        Wed, 21 Oct 2026 14:11:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b583fd57sm2806628b6e.8.2026.10.21.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:11:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:11:29 -0600
Subject: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
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
Message-Id: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN3Q6CMAyFX4Xs2kY2IlFfxXCxnwrVrJB1EhPCu
 7vJVfOdnPN1U4KJUNS92VTClYRmLqBPjfKT5RGBQmFlWtPr1miQj4uUy+GeIEQLAcUnWvKcIFp
 5w6qhuzjXXbW7dcaqYloSPun7//IYDi6aF/pc1bXhrCC4ZNlPNSpe5JEYz8du33+vDdddqQAAA
 A==
X-Change-ID: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
chooses the memory zone from the device address mask, rather than accepting
zone-selection flags from the driver. These flags can also reach the pool
metadata allocation and trigger a slab allocator warning, as observed on
H616 when preparing the first UART receive-DMA chain.

Set a 32-bit coherent DMA mask before creating the descriptor pool and
remove GFP_DMA32 from its allocations. The driver does not encode the
extra descriptor-address bits supported by some variants, so descriptor
links must remain below 4 GiB. Keep the streaming mask unchanged for
variants with wider source and destination addresses.

Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical addresses")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..0ef6ed1f936e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 	if (!txd)
 		return NULL;
 
-	v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+	v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 	if (!v_lli) {
 		dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
 		goto err_txd_free;
@@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 		return NULL;
 
 	for_each_sg(sgl, sg, sg_len, i) {
-		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 		if (!v_lli)
 			goto err_lli_free;
 
@@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 		return NULL;
 
 	for (i = 0; i < periods; i++) {
-		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 		if (!v_lli) {
 			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
 			goto err_lli_free;
@@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(sdc->rstc);
 	}
 
+	/* This driver uses unextended 32-bit addresses for descriptor links. */
+	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
 	sdc->pool = dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
 				     sizeof(struct sun6i_dma_lli), 4, 0);
 	if (!sdc->pool) {

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

