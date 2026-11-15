Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725118;
	b=bhC9ScEjFb98JtbDoOsoAQ58yqqx5azVAY7dom+pW+nKNYH/d10ATVry/yvKUHWdP0eF
	 gZlg1JLC2MNm4jBJZMVNeeheidjF6vls3hWe8ygqB2hP5TvjeAYYcq+I3KmFtEB0oy/Nj
	 bx7jVwt2LHkmMyuHVD9igaGmz+HtGowZpI2Ykx3uxS8nBvarUQ+1uFEJtxoA0qfaRAqO1
	 Lc+GnYm8AyjvSKPIX+VjB5dQuK5uiN2kOMGF4CGMEzROv25w2cJZMw3UY4m9ib3p49wQy
	 RzBsSQYpH+GLz9lGmNaI/SdbfuDkShwepWYZ3SPo95aCDZwNvQRe7BflFFe+TVXxqpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
	b=iZYznWPkfG8Zw5oRyEQtJJ3ZVKMjztF6hfDcTyagJQ8VjZFcY74sUfx7UYeLlNS4uxVW
	 4QG/mrvsw0+J0iFSgrT4YLSrlyJsv38m3sOZ/+TUQxIKW86Uhr3QjIVuvRL/FoT04qtfd
	 tYhrkKNeSoun3Q6uqjSmsIapGO8aBH0ETULfLozMAI8BOTPDzFhz5Br9fpUjJJYLP2zOZ
	 jZXx3gdyZPEOBYqMGRpI0jrtSDWtykYzUcl8TL+l9ilcoKC+UNtqZ5TTAYbHcWN/oZtrD
	 H4owIr0yxT4/SXCx0/EZ/mFVzm2OUfFPdvfNt6Pfy9n16P9gHPt9HMVTHzfzADYjbsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DU+Afu0Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECB7606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECB7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DU+Afu0Z
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55d30c054dfso4166211cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794725116; cv=none;
        d=google.com; s=arc-20260327;
        b=Z1EaBo180wefSqRWRtJTHyyJXpUDQAd8330mGzFOcy/D8TKHi5sixMCXbBg3MYAhbl
         uF8XxFCd1fofrARc61YAjlXnYYAkm5Vaq7IOc/DTlIpQVwgJztLXi0+DS2njtVZYTyUr
         iB7R3gKygbjFyatGkAUNPGqQFcolyd41hu4eZTRUZYEUKLZ7gy0Cm1dz4OssmHqP8Qjk
         GXJAzi8ex+eQUc9N5rkvJfK6kZziB8JStFzz7A4FdWrTh1DmvuRPYXrnUSvexzzwh0eA
         BB0S6baPx47OjUDglpcOQ5irjsgEneGTpPmWDVRcERqLMyF8JrHTg/9JYwjO8paqTutX
         73gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        fh=B6PPKT6QmhNB5pD1PDq9SMJHRcwQ8ePuA0bINuUFFew=;
        b=UZfI6NCWonvpFDVLuiKXKJKfgG4Ec9nJt4gFU9l7DiTB4kO43/hSf0EeUv7qypdgie
         8jT9Z81ZL3l0+XFOgFzbD/Sh4tCNbKjRs6HvU72jpd8LKUx2xmRch5UJVJJglJ2Cpqwa
         C0Rf4R1YkYmOZX4SGdNd3IDdly8ZtloH09fXXNNIc+I333dlsSug8pLEeokrv23crd3k
         88mHvdyFRbxEEdTk4+UpPvK5gUBWbmpaIfhefU5FWISQvIzMdFQy2Xcbt9KETrim5m1Q
         WGL2Jv6cuFzbmLVleIZZrD2/JvrwvnXspb9uXjaVvobZpDU/1F8TAw16E8DT48DbxZpt
         bTEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725116; x=1795329916; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        b=DU+Afu0ZgNA9yXhZ8KR4EngJKn0WxkkXbUhsa0hi50w1I2Nlbm6ZrKS/IcVN7ak5g0
         OTEmjv/GK9rwiaDcwlKuK5j5DticBoUjjbnJXaCQLmRb/Y99GX5PdGTNqwKxsXkj4CK3
         AgWTmjohjo5DX0+nj3hl0rmiPXkHlxBy+nBzggrLGqenbSlt8ycKYHz3cwycBIlAqjBi
         c+V7g9Q3mctPU9lcfl/T8mPOgL1+Z3wCkj0ach4FnurmMFNMYJaddL51x3YWfsYs73li
         PfE4eOo/ef0ivZ16/2tFQJfBSJ7+kWxxcAtmMWdKCcCT/IG5jwrEug+0yv+japjPexvM
         QATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725116; x=1795329916;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        b=rKl7n0vj9UeK4tcEIOaVPh7xNKONzsAdfZ+pXboqLIx/L62h6rAYfOPnRLHblLYWIV
         F91gjU/cljY9Vcr5RE3lUecazd/ic+ZGiOLRtyjktDp5bsDQ9VNPNqENwwAcMimcB6t0
         Dl4T5UgRxGLs/AQ46ZiOlqinkhUYHagR0R2pw2JoajgNSfwvUonGQnYSetuaWapbDJbf
         Xbs7YzBpYo/FiTUzQX9nUle12hxc4arA/IXCh58xvIAwBflkw+jh3yfrYEqukKOKfyRL
         NbunNf+Ha5iMpeS2JjfpPntQePMN3vMvPdFdReRS2iwf78ir+di3eGXXW5AML1/pVNgK
         eLUw==
X-Forwarded-Encrypted: i=1; AL+hErFqLSx1l1Nk+Heli7PljFK6zYj5s0X0s6K85IKVZ+diV/cp3nd5+SZRPizLQ3HUJzsqYdnmTAKMYEDWB2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZW9qfjVcg3nUQleeMYHc2TWGTAIlfP/j6X6YI/wsIj/PtdNEE
	ZnGLaFl1f/5IPlDSWyoRHf4BHbd4rKtoJ4cvbRTix9d0tU1gRpupuVlvKtgUNGwW8A/YNk2629S
	JafxEN/mywe2LaMNW1EkyxesRR3GUmdU=
X-Gm-Gg: AYBFou2szIni1bWP4kubZNnCan7UcKGBLQdPyM7QYmFArq2nG5d8us9jjjYKBn7y4hS
	WT9W/qFrLwhMKy98pYvqfMADOZ5dCQKdnE0BRhEyGsf6/WGk7wEaHgeoYr3otFGmfcScwSgj+hO
	VDTL/UpREMXNlaTsDguF7e275VtR00pSHcqQjbtUH9btyZkZsBcr61TrTzoDSjs6KzU4fKwsKMj
	X3HeSTTWyzTMEGGZ0aAuPaEtG2+tgVcpECXdqB+/MsV3Kcy0Uhiv3nIbn6JO1KHtUX3Hjd0xa+8
	QkaE/cggsgFGOdS59vQW6aq+pmJlGnxLeWn6/IOjnJze9JlgfjGtOEs+dAVRaNHC7W3tLS3/kKk
	FBuan2h5x1yrWPhECoTjrfeXdq9CuVudrFhs/+5CQVE8cKYfS3SgRghNw4Z9c4dWO1JVx
X-Received: by 2002:ac8:5746:0:b0:535:a5fb:644f with SMTP id
 d75a77b69052e-55ac9877608mr106957761cf.73.1794725116540; Sat, 14 Nov 2026
 22:45:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sun, 15 Nov 2026 14:45:05 +0800
X-Gm-Features: AclHuK-2co-82s-DL-Ir9lk3bEMvqaIe8ZDqkSHlEPOMFzGbM_JIO5KSnIMrJc8
Message-ID: <CAAi4Z-d5eV8FM5sYJj1gqudWyioF++fG8P6uGX_LxbiKSXjekw@mail.gmail.com>
Subject: [PATCH] dmaengine: owl: Check IRQ lookup result
To: vkoul@kernel.org, afaerber@suse.de, mani@kernel.org
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

owl_dma_probe() passes the result of platform_get_irq() to
devm_request_irq() even when the lookup fails. The request can replace
the original error with -EINVAL.

Return the lookup error before requesting the DMA interrupt, so a
deferred probe can be retried.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missing IRQ check in tegra_qspi_probe").

Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for arm64.
No hardware test was performed.

 drivers/dma/owl-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 31a6c6e01a75..daea82718229 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
         * simplification.
         */
        od->irq = platform_get_irq(pdev, 0);
+       if (od->irq < 0)
+               return od->irq;
+
        ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
                               dev_name(&pdev->dev), od);
        if (ret) {
--
2.43.0
