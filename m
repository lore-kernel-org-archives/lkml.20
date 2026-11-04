Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806623;
	b=LEJvJx/co1q+bqnqrW0slEXG3RanDonygqDwxwbakU5oUu4UT2WCOY3Gul3rqd5BHTAB
	 U3YhPKZ9WtKHQsbdZdj2KdBT+Tinzo0LnftFYG5o3MzITziub1U99AVNJzsfR5x4oai9A
	 S3Y9pql3EK95eOju8N/ippSbD5t6sngJ1yA1Z4/bhsC2UZEEbekXZBsUxGvTEgGVGiNg0
	 47pJYwgGNn9hyaDizsRTvIeqLh0hkCx1FKHHjWp0x4vIpbn21y3m92kw3FLBbY1pjrk1+
	 G3wimztbuSwqc5EikFatZC2uaMCaaSxfdMUdO5byiWsNjE3ksjN5abvLHlceSXHR+1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lK8cPrH+g4i7tPuW2n2cVCxMFt6yPnnwaiX14m0/O74=;
	b=QFFAlJWCITM5lLBZxnxA49uukPxWDfZFohWinbG9pnRqv5buan0F+jQT6qk/MMSc5PnG
	 2ab9vt3HjFmDM3gWycJdJq+X/6RquuDu6PzCbMoQJRZBA3yLmg1ajfiPHyG9srdjr+5CN
	 w9cHg2V++t3rxMl38iDUpDxDiJFBynzli01q9yXFe77AY5KzzSZ+fFQDolQ+eFjpGllrd
	 anENPMWy7RVHHtwORX3vtE8iKdtn6PQXyDBXSQ9t0A1RPn37kNKCPTbE9B7kvw3nHuzZ7
	 09/ofWkVYhrNoTTyBgGQA+IlkjAj07/sRRazXItrj4Taby0WDXtKblmUxlVBZu2mH1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EUGsnUhP;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACE4606EE9C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACE4606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EUGsnUhP
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so5282045e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806622; x=1794411422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lK8cPrH+g4i7tPuW2n2cVCxMFt6yPnnwaiX14m0/O74=;
        b=EUGsnUhPL0/s0qNrBR+xvOF8yjFZ8IAH6dVWz70Nz2AyLxwRCvJb05GSLEAlXZBQ5Y
         c1Ey5Lf6A3zwlfjn+gRIXA2xe8M+X0WLxvJQ0IZC+9L8TufJtkImqa6S2gNsI35PHAhm
         7PoaPlA8y0/OCMCSG8NrRZE5q/6I2Q6H5pUhwk5hIbBycdbjQoH/huXr21n5zfS2QpTn
         JgriJ0+SzD7L1PBh7XlFtvxZznJwRbYsAvlwAK5awXjz2ODg7c0fVwXXHRb9cXTyGl/O
         BUXMlLB87l++GMm0sqoZGkG2D5vlwZGnke1azEkVw9l4b3hBScnBl7M5tS4My4ampUad
         wJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806622; x=1794411422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lK8cPrH+g4i7tPuW2n2cVCxMFt6yPnnwaiX14m0/O74=;
        b=047UQNgsHyCHKIzMTrbWrFlJJpeZ5o/qX6cDR+6CDSggLbXBx0QO0jLZUbckwWRouJ
         i7Lw1uAfRz7zZda0LB3szruFumRIeyh9h4V5Z/gFi5JpjGXa/eP5Rj/Y7+RaoE4YChx5
         FKjcqspnYR+q6XbpW9h6q3/ayRtvs3q6CybffKiCaOsQ7GiB4Wmm9KI6bm6R5tQ/QMsB
         xc5nIyXOD9Ycjt9YWaqbmYLXw1Yj/aWmLJzhV6WYneR0svgi/YNTDmCTCIdlLRKR5Cgd
         q1o1RDrBOTOgsWLXjeRfP3TgaCVgm3MqB5Ita/rB4QhqoHRBGvYjiRO8jt24mI7tecJ0
         n2kw==
X-Forwarded-Encrypted: i=1; AKwUvBz14zaoZysCwgRLG06ktq7RcBxLPQ1PAjIAtRibViOu9/E/6bhc9/d9gt9EOQvi+LLBPj2OW9P3gV3+Gd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fhlzVMtLwPaYAnW8RSpm3/4TkQnhMYKjhl2as8+bdsvZsA9HN
	wqEtdJHrfxrs8pJXDXoWhirvkvim57n7FTJ4LSxk5VYEF/jA9dQQVzrq5tNWyqPRAXKsXoiPrJw
	30rwVFBQ=
X-Gm-Gg: AYBFou3ARlajJEdpF6VvvPeCNxtn0WJ39PQVKocjscWsv1nQOcBODBn9H8fVsdtorc+
	hO6worlqoMG9o52z2+WUzgeOht5rWl8nLLzjWuSYh7e8GZumOTE7oHSQNcI4PYTTZ9pGK1CDo5E
	xP5xHD8bsen/P4+q3pl+riLncIgctKlTP33Tr14vgN89yEses/8//B+I4Wlr05n45FIXq53P8jt
	DmV+Cudz8JeJjb3xQQ7DlYuASJuF/N4kxuVuJ+AITbBXmlh74ohYqIRm8XykFB7aF1/ZeQF5WAK
	COTEp4rnBHUOqnpqdOixx4vTe/sHipNIpcg092QzwLcluuSF5RA+MP9wEgWW7qh5XszJvmOQrj4
	pjwcQ6XJyLpM5oc6ftADmZvq1yRW6cWmrotlIdAJyneHt9vQzuIlSxvf8tTmZdxHPMzWE2Z2UDs
	tdfui0WHMnNQ6GP9Rorlnb1/7eweUI/v30UvA4xmzMo7ANxKjCIVkccScU9C8rxBgeoulmNCQXf
	RkemOOHBj5D08tf+QGw0kwsGzuyY8UvYw49CpWebjgA7NMTFIu308YezLb9GDgAt3ePVOZN24Xk
	33aFVgIj8BN++d/s8F04lY+gQ8/lmVOj
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr369147945e9.17.1793806621789;
        Wed, 04 Nov 2026 07:37:01 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:37 +0000
Subject: [PATCH v2 6/9] coresight: syscfg: Fix deadlock in
 cscfg_create_device() error path
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
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-6-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

If device_register() fails, put_device() is called with cscfg_mutex
held. This calls cscfg_dev_release() which takes cscfg_mutex again and
deadlocks. Drop the mutex before calling put_device().

Fixes: 199380decc5f ("coresight: configfs: Fix unload of configurations on module exit")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-e07a8e2f-c34e-4609-a667-9f294c6fcf29
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 8d18cd2aa347..1ecf4e9a91c4 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1212,8 +1212,12 @@ static int cscfg_create_device(void)
 	dev->init_name = "cs_system_cfg";
 
 	err = device_register(dev);
-	if (err)
+	if (err) {
+		/* cscfg_dev_release() takes cscfg_mutex */
+		mutex_unlock(&cscfg_mutex);
 		put_device(dev);
+		return err;
+	}
 
 create_dev_exit_unlock:
 	mutex_unlock(&cscfg_mutex);

-- 
2.43.0

