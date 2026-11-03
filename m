Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734691;
	b=nyGLO5NMtRqrbD71pCdv9VuUcnBR8JzqQ4vlgeLPYVRThEGLyydty2AH+1EPwuu+WIXu
	 zMcjjBuwCbjYWyGq7VfodkOMpOAjzGryltV9Dm9x9bxgIj5P8+5wVEnCxptCpcyJsr9Sc
	 K9s2Wkw5/3qhhv4nc70pSWqCIPiSDlj4A4++O4DZFHY2GLYY3NarOdF0uLd+ldw0vy7KA
	 JepvlTh0FdSkSe9cPAhyx7A48UeG7+PS+y+UrAxrOoLkoGP1naSYyAJfKDF+dLSeGHpbT
	 eO1d/qH1GTT+/2wgS6sSW63N4aFuzDblzDRiMGfrdtJyy89OUb50NR2yWm4A25xCo9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8PPx/HR4xDG+iQY+cv1KoaG7KZBkWYuC6hmVzUweW8E=;
	b=BrjMeHKpRbb4axBkhNiPMNIptaZQJ3DgbpWZ+p+yVFG/vY9PAPfAgR3tl696SLDRBks2
	 d30rl3EqPWljtiv6Tew+j3Hm4f7s0LklhaVul8A+WKXpLlzES/kQguJE4J15hXHvQMK96
	 HoaMJhd7s3daqll/6z7SMVejxsYwoMt8zOgQeqVBWlcoHp7sNWjFoBZiwWGLIqZAx4bO1
	 HIthWsR7GDjjozk0Trb0yrsVBW/xs1hSMrVvNe4V+2uVoisiBNrDT3w5JL6OUu0RwuA13
	 F//OzkGE/lE1CIgzLj+EsPTYpDZQT+bBCmeiM2ws6wQTXAlLBgHtUg+D6KOTZWPVW9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Fpvs0M3M;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49062606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49062606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Fpvs0M3M
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so34752945e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734689; x=1794339489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PPx/HR4xDG+iQY+cv1KoaG7KZBkWYuC6hmVzUweW8E=;
        b=Fpvs0M3MJhfioY9sbGDh6sQpSD9Paq/GLsra9eG2IsBCECMHqW/VdV9qY4TiuxhRrr
         cTyFX27EkNM+Kzl1cJR6W+R5Cg/eP7GdbSQPB2wa4aI5XQr4JWBXaYh7RtYF5UJjx4NY
         3VkuqRbCTUOJ7l6YaSZVQOiiAnB9YSyjVYUczbVorXCkvTMEDGUiSZXj70NDg3xhDHvn
         c+lBuNeaJ05Um34iCSb8ldNZU5474mF4yP+njoF3/NcIx/WC2oKmpdbEO9Pg4BlxSrIK
         d56ApTQNhRN6nt5+gLZz5T8FNuHz25vvI2rTl9zzKLpwN7MUJShsl+VbpL/3K67EoxKa
         C3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734689; x=1794339489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PPx/HR4xDG+iQY+cv1KoaG7KZBkWYuC6hmVzUweW8E=;
        b=Xh3V1KmIkG40muzCPft13HMFcmECyu6aSUxI6AI1+wUXpfSvfYtYJHJ9rUy1V/FhZ7
         dP/zGblx+S8puLA3GXHp2vxF1hN538VNFkzJKMvfBImNZYaVBdqhUQUjnsOcdL0GBljv
         /6wuAu81hosdd3+6VnnRBWSHveUoxCfvMk25TszFTLkKJ1gXWQcyk0DdBhZJhESpdk5z
         bHrSZUUHh5op8ZXoAv2YsANehcr3Qd+C2bOAbRwRNcvlG7taXyHUr9rAjwEszFbjhQic
         9+ivqqKDyoz7tjz1P+IJ6UyzlCqSESqH+3/rD/5CnNCf7bofTJO7JDdveD8X0sw7KxiT
         wweg==
X-Forwarded-Encrypted: i=1; AKwUvBz5W5SQ9NfNFtQmYC9H5u/2wcObLKxlQWebTMbjgLcOtjVTRNCxurigDWrP47KO72CzxI1lGKKfnIsW7qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z90J6cJfHwZRm0QxXJx1JwoZwqlMVdDrcNX2AeTmVLL4OE59+DU
	2dPP72NdInhs8VCsjlmErcVFvYmyGbB7C37+yKRoyKUYfZAIXquOIzvSFRCQSPwJoc8=
X-Gm-Gg: AYBFou3wsak773KN5+4uwCPaF1cb+Kz47YV7oUPnGoiMKnSV7E01K8uzyey2+MtuYAP
	kyb2PW0Yg/7URwU1ZX4BfN3SWIL7N77jW2uB9TddEoNgA5eNxQ42XZUPvTFlrVcVrRxlftizE0a
	ZEyoo9NQ0bWfpK6lC0aW3hVEXXW7qdzDz3Te2ZP95hmkTXNZVEtUBbgb6STTgzBbv6vEgyMBRHo
	Kh3FKMdks+T4zcjhn66yDRqoAlISBCuFtJtedSx8x4y/eCjqaEgvL0zOArauFXN8cq5zc2zqZWY
	T1hYygh7+WnbNhiaTqeIlBfQtWlYMUfUNdgQFfqqH0sQ9OmCcfeGvbGeXoSTLT/6H39XFOlDRoc
	zVmyRZLnOYcBLlqyZoMqZuGggc2SodfanNFnN/rvTQcSspy+Rdx0I7o2QOo9naB0XwM31IyH46L
	sRAbnojlW1IlNVeySIAeKwxuIBEHgvwr5aDJRTmp6nImiycF/pax9P1XZPZEwhTzL73QD6Bvr4R
	9DYUxXriUzS6ouQ4kIMWmRKHN+pHlFhUQLQ+FmIhckeyBhxL3FN4Wl207H/dpfn/7wMiDmjDm1N
	bOMboDlLIGcoZwdN+AkQQhbQMQ==
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4ac17d16afbmr327136595e9.8.1793734688513;
        Tue, 03 Nov 2026 11:38:08 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b41297c16asm5880115e9.3.2026.11.03.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:07 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 20:37:28 +0100
Subject: [PATCH 1/4] dmaengine: ti: cppi41: Use td_queue to restore
 DMA_TDFDQ
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
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-1-d7213446c5f5@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; i=msp@baylibre.com;
 h=from:subject:message-id; bh=B/woc6BJx2wq+Pk4aPkNjANUiNT1MPY10g3hs4IO0Lw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFlyRG8zuTBTpWpAlxTx3WtnpBxcO69g8tjr4bdF+e
 4NuL4FVHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR+kuMDN++hwdM3JT0Tyz0
 942/oX37VxlO3nTyqs631XPZrW4d3sjA8IeLazrbguufuTwsdxSqh5uFz7nr4+m+Unp74tcVSVn
 tS7kB
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

In init_cppi41() td_queue.submit is used to setup DMA_TDFDQ. In
suspend/resume the same value is read, stored and restored.

To get rid of the suspend register access, use td_queue.submit in resume
as well to restore the value.

Cc: stable@vger.kernel.org
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/dma/ti/cppi41.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 88756dccd62c..458d20b12462 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -146,9 +146,6 @@ struct cppi41_dd {
 	struct list_head pending;	/* Pending queued transfers */
 	spinlock_t lock;		/* Lock for pending list */
 
-	/* context for suspend/resume */
-	unsigned int dma_tdfdq;
-
 	bool is_suspended;
 };
 
@@ -1174,7 +1171,6 @@ static int __maybe_unused cppi41_suspend(struct device *dev)
 {
 	struct cppi41_dd *cdd = dev_get_drvdata(dev);
 
-	cdd->dma_tdfdq = cppi_readl(cdd->ctrl_mem + DMA_TDFDQ);
 	disable_sched(cdd);
 
 	return 0;
@@ -1195,7 +1191,7 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 
 	init_sched(cdd);
 
-	cppi_writel(cdd->dma_tdfdq, cdd->ctrl_mem + DMA_TDFDQ);
+	cppi_writel(cdd->td_queue.submit, cdd->ctrl_mem + DMA_TDFDQ);
 	cppi_writel(cdd->scratch_phys, cdd->qmgr_mem + QMGR_LRAM0_BASE);
 	cppi_writel(QMGR_SCRATCH_SIZE, cdd->qmgr_mem + QMGR_LRAM_SIZE);
 	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);

-- 
2.55.0

