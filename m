Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC1374178
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171435; cv=none; b=RQg0WxMtPZAGN79r7aKi1SqMfFu8BRmzgR2Wx2IG8Iat0YY6zY2O8EOMX7/ruSrmMp+/4D5NQ6r6/NZwtnpWnJxS6DCNX0MtxE5GxH0lNyj4GQPd8o0MUb/Arl83zZLmvd8imkix3iH71SaPZkf3CUk0Q5pbBwxogmxGu4SIQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171435; c=relaxed/simple;
	bh=pc0FDD6IR7pFOD7noF91D54mnHrzpCH4w/W7A8vQcRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=buRHnZ41zaL9LADT0L/zTCd9Ffid9EZI1DTW0lBrzjRMkQhDZcidR6VnWZRlBS5pevy1U89Qws1R03VU8Ytg3asPDu39qowL+xDt/p+wVIAMI3daneShZA36DGBwDtfaq79UMLrgIktiSVdUn8lg3C3UlHe9FvTTyY9CpCqE07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie7k14XL; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie7k14XL"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529da9so377142e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790171432; x=1790776232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SglU6SsyzFxHFyMmhSwCTOipsWKClut0lOm4koa3sM=;
        b=Ie7k14XLYXwZhS9e3z65cqdUOciSzADvJZlfnypfy5tdumIN20Y97QQIsdEdLbxlL2
         evK5A0R4gs/GYFzKwsExv8ofZNQtY910r/mQETygvg4UOGa4sQ6rgAzYbTAMajahAqnB
         dTqv77xqccDbnnv7lo0LjruUEeBQPgyZqO3O2ODMMKkawDombR44drMd7DjaQmBwtADF
         VE0x0K6n42smys2IygUpReg6FIb9ValhQ7AltsDDwh22eyhw2+i/oEyLmFmkSTPdNDfR
         SsLsba8lwwu1KIXiZj3vZZ4gxUTOgTzsprQIHhZ+Ugl2n8aX8F2zk4220+inOzgEWuwe
         4wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171432; x=1790776232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SglU6SsyzFxHFyMmhSwCTOipsWKClut0lOm4koa3sM=;
        b=UhtlMuUj3V3ITIMS9rEEDop7lpXg5Cc/RDYMFA++gL1y/owjJ3J9oIcTYtrXVmARjG
         2JAmdc0O1ucWFMDr8b9mSgttocOUmZB+kl+iFv9t0GamiIBcOux2eqSsqXOMK7SLfPVp
         PBP5RIPrWu2xfuKS5eQ+l1aBLVwNJOfq+5u0bpnscepVl63klSG+y9U089LNx2FAfWgY
         jdyDtY/Pzd7DqBW3FpdoyJvGWfufItsxYIX74Wu37rfORV3n2g7jHfSFbULqufpTKych
         tU0v49FsFeG5sHY4+ikKafckp+Sh4zZknxQjKME9zQsnVvkCLd3e8Z3VWnZ3nFFdW6Tf
         mBLw==
X-Forwarded-Encrypted: i=1; AKwUvBywXkalEkC3EvJTEVAds1oHQtLMXaEPH0pxxwB8cZSAl9+n08Rymq25yk6NitOQEkJ5RZvv3a8yqRGOmKM=@vger.kernel.org
X-Gm-Message-State: AFuF++mN7JZNJx7B2HCATvDTECCb4R5qdnZ0J6bu9xVp3KyGXM21gEil
	uXNbsUuWoaR/ZdUJenVLjlIqrrb/6pYnrvmQ3XbwsgmaOJ+Qhwm97gKn
X-Gm-Gg: AYBFou3OsL1chqCpXrSWhhwDaqTtQVffS+fNGO8Lo6RBiluTXvkeqT1zDePs5ymPrq6
	8xz0mh+QEEuXV3gzReP4MJkYZRJ51cXqoysul4DD+w9PDils5A/acc6QW4h8ffMmr/IsQgs9yDg
	Pv9t2kLf9zrtN24nef/N52D1LIXBq1QUYl3tISgk/WaPMNEVwmghVJHtOVCjyd7GUY7Vg9O8m9B
	BeCRN/QxVQBHbkRo+VwgPB30k/42DYhUhjZk52w/UhmABHrZ1NhbbfnjzpGhGgPe3Em2Bm8gg/T
	+K0WN9RV8aGz5xsSW0IETCn5SjRQtjiF6qbdG0+GrtRT/hA2s7Wt0LsuNTRuiuJJq3K10Jarrly
	fspbGYHPstGO+E89j1GRojRQJbGUOk558C/OSc8kE+zfv0JRgBZSVYqqsVf+7CCpUloXl7JBtYX
	DpXBq04IXrzvAjTpDAcW6sjZMdn90gOzy+dvSefAhR7fwI/dlNGCxXep2CNT0D6Bg=
X-Received: by 2002:a05:6122:2093:b0:5c9:a60b:e5d4 with SMTP id 71dfb90a1353d-5c9f165664amr3033636e0c.14.1790171432428;
        Wed, 23 Sep 2026 06:50:32 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c2a36sm3263916e0c.5.2026.09.23.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:50:32 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: zw@zh-kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] dmaengine: fsldma: kill the channel tasklet on remove
Date: Wed, 23 Sep 2026 10:50:21 -0300
Message-ID: <20260923135021.1858325-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_dma_chan_remove() frees the fsldma_chan structure without first
quiescing the channel's tasklet. If an IRQ fires just before the
remove and schedules the tasklet, dma_do_tasklet() runs against the
freed channel struct, causing a use-after-free.

Add tasklet_kill() before tearing the channel down.

Fixes: d3f620b2c4fe ("fsldma: simplify IRQ probing and handling")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/dma/fsldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d9..0e2f848 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1205,6 +1205,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-- 
2.43.0
