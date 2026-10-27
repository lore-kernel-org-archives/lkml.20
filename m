Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112806;
	b=ZxaGTjdD2XatvEVrTTB8kYY7c5cw38edEn/7uWgVODXN1U9NMOZfBCCpKJ+xThICzYJ9
	 09k6Y2s6zcfB9n6cwMXRZ0rGJRhUDFDZjY7+NgYDzQ/BdsIIC17H1V/mWhRX0lrgXQRW4
	 z4LzwfDu93UwUB8gJqTFlj6YEtfXu3agNTFz2yMSmbpwW9m5Nt5Gh2kjNJCW5JxpPqbgY
	 gcHwSAwQJ5RwN5TAhXkCwrNUhB09jn9NxMS2kwFH48MAQ/UoWpALPA2WhxJGiioKmu0kS
	 bTCcX0le2ug9HqDRyBgsBAu4eRL0DKgyvmFeCgt745EGSXLQ5IsfqKrtlt80iC3Gggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
	b=KHvktPIUs3rVbXq6nf1er5VrrkUF3Ey+J1BneXEFxE5QaZ1u7lguf+mFxd7yxog4NSIS
	 OaE9bh5UBuQj4YROpd6mPiLdy3HFjMXCWXIv7vNB/c5JYh+xUQstzN2CCXlxwxSiiv9R3
	 F/XoXs7AJHLUolD66YsUDgceXugKmoPzWwxFL9Uju5dGdrhhbSAT1OGiJkCZXoR4RWN2l
	 k7+0uy1q3edpvJZ15pHxWWtLKgFr49zB/oFGJdRk05M2uOMzp07AXHsMQnUYCzfTzPvL7
	 CZr73dYE9rOr6r9+K27duEsEJptO+Gs2dtMQAW+9vtuooXzbfNRuw1pTgnB5wpuJPNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PL0uNvOF;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED69606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED69606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PL0uNvOF
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso4006a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112804; x=1793717604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
        b=PL0uNvOF6KtmytVx/LyM6gB7gFM05V7MDTXiIU/jNVGVrb8h0a4YBmqrVAgfzJYkM/
         XIIlEJw0YrfmwpzCxmxqRPuPBrSO/A+mN3FRztpVogzN5DyzY3Sq8CWDatzUvbLI2rzi
         PEoaPyAY2SHhTTr0iu4XDHOxPytwusNn66/D7hbTLGkaFvARqeP3wSVvxPrg+czWBFbi
         RvThogGY40pn9hSgBkEgfoaZM+UFVgqyOpQbxAV+BfMI+qMCM7/3D1R4tD+tval28tEb
         ebUXb/xw8hrtyeGU568eNfHW+R/Qs73nxMAMBtE4IOYI4JVt4Tzz/h41aFppjGK698YZ
         ta7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112804; x=1793717604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
        b=t8kLkdH6kcWzlT1q65ri0YM+yZDlR7TSA6WjTcmVnaYY9QdoCAEL+OLg0zTRe7ugqe
         2SWKG05TICRStwkMNIMvWwMKog4vU1+UzpZ1PV2f6ClmSqd+CSNBRZnOYCYMUBRATnXz
         rRIs6jvkILEWRg3VY6GrPnvSchOmL9wWi8wvsdoXney1ptsmUwoxfPBjY/yKR3AiYeAJ
         zaaZ+UgIKdy+N+C0ZepCni+zFQizOLBlk9nqpwDEHQU6FUw0C0Pkibm+jmxXxeSErVZG
         iN5yMbTLAW5RjI1f6wOFpyCTibgFFnhlx19jo2NXry42AwkKJzcGb0jBEsqU6Wd79pxv
         bbow==
X-Forwarded-Encrypted: i=1; AKwUvBxOsHF83LjrJtdJY28IjVOYEQ1WchvP8ILSCQ0a+NDgLPN2YTXXUEsrtO+ms81k4QA+MO0i8HVqNgdkmyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz9UtFrO6zfXJd4SS4Y8Os4H12W5q5fB4yZPJ2h5m9PzVcU5s0
	+ZJ/KfUxQ/8oZWoWxOzOZfgWLQXThU0EjsPrFkuCNxUylzZ1JGad1NnX
X-Gm-Gg: AYBFou1yqodJ9u4hgbG9gzpG1zS5NecJJXIZs1hUKNhRwSCXmTO6eA+OSlD3yRVe7SQ
	hQEcylt23wNb2rI+21IdXLKc162sI8OjQMv162GOfXADevnPTMyvxVqWKmoMMc87vP1GhveU3qn
	tWnj2AMMKFioa9BvbMsqITbLtFZCHOW7+WfEB4ckYXLmbRP7wPETK0zeGgXAXnqKrOrjqWSK/D+
	R3Ukgpz+QXVBDq6xTf/wUwIKyp0AaM6m+I+7BYlFgjM0SxN6g/0xKGbyeC8uWpB2sFZ9MJOXza6
	0UAVNTFjarsdDOF8l3a9lgJt/HQGETHV842FKsCYWzj3wFF0RIaz9VT3H3q4B/75//EvlvDFo21
	Irpvb9ZTfxs9vibE0x1IA4v9fnB71jHY3CLZlWBqx/teDxrNDaPlgF/5suF27IdTD9ZCwRZBGUN
	h/XDZq33osutXrYO5GUmSGCg1n4YpN0MKN0/WCbCLM2ZB7tvZfiLxJxNQ08VoZeC7gy5/GVYEOO
	6Mc3Scar8gzkdc8Gmy9W32ZhQwDjnThR/RJJPG/wdTx8M+Rmvxa7g==
X-Received: by 2002:a17:90a:b896:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3adead4dce8mr5470253a91.46.1793112804486;
        Tue, 27 Oct 2026 07:53:24 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm4093349a91.3.2026.10.27.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:53:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: exynos4-is: fix DMA memory double free
Date: Tue, 27 Oct 2026 22:53:13 +0800
Message-ID: <20261027145313.136305-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
DMA address does not satisfy the firmware alignment requirement,
but leaves is->memory.vaddr non-NULL.

Because firmware loading is asynchronous, this error path may run
after probe has returned successfully. A later remove can then
attempt to free the same DMA allocation again.

Set is->memory.vaddr to NULL after freeing the buffer so the
existing NULL check in fimc_is_free_cpu_memory() skips the
already-freed allocation.

This issue was found by our static analysis tool under development.

Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index b7d9bfedd590..9fdc352abfe4 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -346,6 +346,7 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
 			(u32)is->memory.addr);
 		dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
 				  is->memory.addr);
+		is->memory.vaddr = NULL;
 		return -EIO;
 	}
 
-- 
2.43.0

