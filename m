Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377287;
	b=BovMxdcZsLl0JVzkaSlIKmypP9IBi/gQ3yuT5Z9Lq37SDOFqImFty9YVjQo24CBYmpFd
	 GbbsVC80uyuAEmDaJsEjI1XGUCGkpx9D6h1B+Zjr0Phc5kX4OA1jW4fNkn2Pzk7ytx380
	 14/p6wdT+jb/AWg31eBthaAgwxyaVEuOLKcNK2PKphb93GzKSU/uklSdv6yBwZ0IoP3XX
	 kaLtSltY/iRSOa8YGlKUdQRUUhXyYlV63T7WCfJW5bDmexpYKVn7mwHP/3ONKJbM4R0hq
	 CPrxCN/PE7EAxcK6y2BWEmqa/l8vJYSjvD0ktkoVb2y17VU7w8mkG/opin0rvb+WYow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
	b=VHUwkUN4JtrmJNcr83jP8VOaa24l3jPzshvKeV82fZfDk8d87P7t9uaBIC1wgqDS5tsq
	 obFy4MBeLgsI/YOm3BcGMJN9LM/mJE8LQYNlaDFdseC+OypwcANRkwV+we6UTqk3VU7qh
	 S8+PFi92BoFtx6EsqBTjCD0hxclfs5Y4TVDzM6pjuEkWrSQp/gU35HNRMdAeIs7QNXZz3
	 DKJL9R+VenDX5NBND5Qb8MU9wJA3j7yACplpSjv85zU3qVvvXiNDvHSCRDabuAYziyB9e
	 0LzcYIw8sWYDdL+UNAYzYXdSApjloWvwmmhh1M7yJSyCYC99VAqmmyHX5amYBToItyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9hKOIp7;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0939606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0939606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9hKOIp7
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-70b875f6f13so784947eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377286; x=1793982086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=r9hKOIp7VuGPspbF9w3Xm0rrfHlhiOaOoqydRoCGyAbB6sYHjPsIvWzs/+jM4wsOAG
         H1oBXzBF2xK+Ve0Shp/BaXArEX1Hm5zBSldNigj3HdA5MQP2qP2lkGsO1PcP2bCBKGLC
         qmQtzVXLe6onR/fapIdoHXxLvJrJdstDKxZRCvrvuB10/O7neCsea3VhZI/RKrvk1Hod
         fWwceuKmv40uTigZQyJv7jy51uZlW7IrRR2QKxPsofO/RL29NEcf+/juhWm0rr5x9+tM
         +n2Ma1ISqyVnOu+ay+vN+EQM3xyilk5SLoGrU+/xC17gvAzK1/Zlz5asQZSdjWkwPBIT
         fJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377286; x=1793982086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=HNJgXcMUr25Emrh1BVPeOGSjJI6lWjCFF80ROPzMXRstXkmEJdFu9Qk/gf57w5eqxn
         oj6s2vhRi09ho0K6zFLioTRnUH5gRkznq6MblgP8TuFix74gRSiEoe9Tpp1tIgBNGh8l
         rI934gzGnbc9mueN+BCHqg1bdClIYyc/fB6Ssd2ScN8sleHT3D3oHVqFFYRcwVlPw+Al
         3o14eMswUlrDj81CxMPItSFaINClyCSrOajbrPK97Z49X91BT4QfU+lXLhFCBX4rznfp
         /E9nskYP8WbQhcy2xGI1V7+V4rgHxsnpbP6/yjNd75IfMmMyhQYG4Z6u0InSS3BqM8c7
         N6Rg==
X-Forwarded-Encrypted: i=1; AKwUvByITvepK1nBZ7HgHZXyUuYTWXNLqYIg4BSsiWBvHNJiV5aLNInSipFB3Awvy/tSv2NtN+phpBBL6A5iW34=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVHvIjl9iABcS3LWZVv8H2OsVtP3Y4lbxaQSsOrQc5UXL1+UVZ
	A09DVYLZnotNEUQUE3NPqEZhFOZbIZik6nIyI7CTv/R7AZevz9JGhCSD
X-Gm-Gg: AYBFou3+PTcTqHkf9QQKUsdfCIhqvj0DK45CuwdIprvN8Nq2TuU66anwW+RXiID/UVS
	B/i+N2iWKfmUMqLV5dAlIWgzEx0G+f0SeS1YukJKDlghFR++e4+u+V7U9YtRoo8KtWlR+On+JGG
	Grj/0+AaXXOUnhs5PhqPqvhHPneyfyQblieB8AMVQtJg1NEvqupM4OIber0ODEBOU/r6d7uMpUf
	gJXuwW7oJuih1kLHmPTRWe1A3BVMIvqHBK7BtkWJzhRSBqlngICZtY2RJKCcVZF52CHJgCghziX
	89GafkxJRORBgUGaC1iulusbxh4DZSW9QkO+TaLCJ8v9xmO8aFqH45Zk3IjX890OsXhaH/CjBzj
	ISCspvlUjVuIzgYQGoMFmWS9PHbwYK2YLm7W8O7U70X7L98VKJOJOv7ueBq7IU92dX940VmzgoQ
	OXETkHbGQ4LZSjd7pCwEjy2anZJkr9mFnTrkShCa25Kgqyy+ckdBe8pEr17HdDM1nZSCu2gjW8V
	TKM3OCoocrG9+de5lO5YB4ZntyBGRxZw8bifS7hIkiDFM/exvbLBB5INUKtxWfVlm+OqYRmUOB5
	JnYm4t7WLjjEizvqY5b9Nuq/hJO1LUJ1Pq6h8I9eGUsv0vqJiSMv4HNhdypp+Txg0GywVoVdkrh
	8zh5qwcB/f+p5vLXvJrth0l+jYW1kWzzCBIEhsEsWjo8MCRNp5ttzc4GqFjqP1pWHqPKH4bxTee
	FYWZCdwy2JKkYvu8jqkLTqtaIioLMnIUbKtZ0l
X-Received: by 2002:a05:6820:162a:b0:709:fa95:9929 with SMTP id 006d021491bc7-714f2552f3fmr1853395eaf.62.1793377285762;
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 6/6] mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout
Date: Fri, 30 Oct 2026 16:20:41 +0000
Message-Id: <20261030162041.2998170-7-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
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

When DMA completion times out in flctl_dma_fifo0_transfer(), the driver
calls dmaengine_terminate_all() before unmapping the buffer. Since this
does not guarantee that the transfer has stopped, the DMA engine may
continue accessing memory after its mapping has been released.

Replace dmaengine_terminate_all() with dmaengine_terminate_sync() to
ensure that DMA has stopped before unmapping the buffer, which is safe
because the function already sleeps while waiting for completion.

Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/sh_flctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e48..8bf9ae7ce 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -430,7 +430,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 				msecs_to_jiffies(3000));
 
 	if (time_left == 0) {
-		dmaengine_terminate_all(chan);
+		dmaengine_terminate_sync(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
 		ret = -ETIMEDOUT;
 	}
-- 
2.34.1

