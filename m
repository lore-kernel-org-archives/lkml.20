Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275723C1088
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594453; cv=none; b=cdGJJ+26Vu476XfTfmM+EkRwL5d24FLLoZI85C2OC0FabMOV3n50DYVZbhC5hFLuT/YAovBQZhqnbdJ0/gWLsw2dy3jMQPLRrHB6iPCsZnzUJ0/fow6m4hI4+rzB//V/6DZJLUkEg/clz6lxUn54/qBIwk1DTHaEtDFuYJ0VIrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594453; c=relaxed/simple;
	bh=/DUmFgUshaIxy2hcef3/zwHcOL5WrkX2I9pNOXhsYB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZPpS277nba9jyy8xFm7P5awqi0meKB5cLA7WhVWuYI9pkJ0AhrG3FF+RSEuG9ekQpREDVxVkfZhP7nN5K2fhfEVgMeYFn6KTSnVsmFifTuiZ3iagRsEHK9df/IaFkXa7sM9x/0qB8/0lnmfnYOKWiP2HNu24+w8yBu61tHbNFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irWK5VNL; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irWK5VNL"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2125776a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 00:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788594451; x=1789199251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=py7XZS9hG76KDb+4aP7Vck11HgV2PvXOdVNmCjDkqo0=;
        b=irWK5VNL2vwvyxYUu08gsKRVIl/JwDgsBehyPvY9+tgsniKON0uh2xZamOPg2RjtvU
         ZNQ5XNfKBRLn8UJqCMRArfYTR3BTdyf32LhEF6D938gLuCPi42fV4VAkldTbaHThy9DN
         IBVYfFR6JaR+U7U2TpJyAgVEL4mncyGNH0AqGgNxyFL65WoisodF0ZXGs3velgouQXjx
         sxm3H30G/WR+gpHTvP2IqVnsxLhP8Gg4IkcixfaplqI9pKOrVuL78XvvNvpHR4u2kJKH
         O6Y1wvgQI2MxAn7/XSKcv5t+VjK5hKbOCG7KXV8cSrYY8E8wAHwJAPr0e2iOaV5dlyTw
         a7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788594451; x=1789199251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=py7XZS9hG76KDb+4aP7Vck11HgV2PvXOdVNmCjDkqo0=;
        b=QwuXrBSZIOmJP/4rNUcbj51Ahe6MgMlrHwZxG+HfeKljgbHBbmoY+EK551a+QcY0RO
         2+KAGg0PxSKKCb4K5iFtHifJn0Ru61jQWbZluPfy7U596px4oGKQe9/XKCtm5/tE6qQO
         klyU1K4RHPngrsr1zQy5pzhSz17F0jqGns76OTpMbA98ptHWX4O97UtFx91SQU+nrCI6
         gzsVE7nXEi+wE6qBLPJF0Ls8bPso+5RpksJMovdKD5MPqpsVyIdpxwxo7JPo529mJ2xk
         ppTaW9heloOfFdhjwiPpzKWcmfud976sTe1l1TvJd4TwoDJcm4Zv+kVoqvVvkqqYC586
         hqEw==
X-Forwarded-Encrypted: i=1; AKwUvBxZBRK47ssk7Lku9fBeo/KNd8s4hP1XcOQRDKWZnb+j5ezYkImFJ0BKRPH0iJdiN9e2zbyB3vm7gm5r6vY=@vger.kernel.org
X-Gm-Message-State: AFuF++l3gtw6m8L7ywAUmdhlDQIDH4++VN1v2PlCuJbkkngNIbcKnQMw
	KIOYOLtROR6AA9FefY6STH67MOi0PJdd4Hj7Zjg9feZzcrWoAdhxaxA=
X-Gm-Gg: AYBFou2UOWbAMFDn2+/UrJXRYTCqtFIsd1vHjEK9oM3gCZ0G9NU/ds0ke+nPDempom8
	aitXtjj8PeSZ/Xknc+0/9/LESANZC6ApwWEi/WDE0xKs9YlGh2xgcrpeLDrXJQidbiAZgaaB52p
	kwSp/Mki3FxygsbhVjSxHo+3dRNeNHlaSXg8f7SYV+qAswHI9qDgBiIqxd0LlC1OxPLMPuBQpm/
	FXmEDPZUfo/313K/JKVKAVF4mDrEC5azHk4gR54cbwNZCwwvh5FaS6Ht/x3EJWBusIRkGh//zXF
	zyj9FJkMa/dHdxNSP0jt/gXg8Af0OL4INhy7PwrJec/16lZ5JzZiv7rKTzOcUrxevXlxjRsKZe2
	1mWQr4vX5wYK5iYioGWv4jZkCf6Ip6A7jmLkLYrgJVx9M6oApFiHU915Q4IMu2ZOckukIFr/A8u
	YGIU3HXFMsmMwRnW4Zk1In8mrCdTIMAgNjlCKXXyoczON/rEshSJYQHkMsEG2C9VE03wK+A0Ah/
	7MHRWY/H9gIkOs=
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr19773477a91.16.1788594451255;
        Sat, 05 Sep 2026 00:47:31 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc060sm16677217a91.3.2026.09.05.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 00:47:30 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] dma-coherent: report a failed reserved memory assignment
Date: Sat,  5 Sep 2026 16:47:27 +0900
Message-ID: <20260905074727.108029-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rmem_dma_device_init() drops the return value of
dma_assign_coherent_memory() and always reports success. That call fails
with -EBUSY when the device already has a coherent pool, and the file
allows only "*one* such region of memory" per device.

of_reserved_mem_device_init_by_idx() reads the zero as success. It logs
"assigned reserved memory node" for a region that was not assigned and
records the pairing, so of_reserved_mem_device_release() later runs
rmem_dma_device_release() for it. That clears dev->dma_mem without
looking at which region it was called for, dropping the pool the device
did get and leaving it on ordinary memory.

dma_declare_coherent_memory() checks the same call and releases the
memory on failure, and rmem_swiotlb_device_init() propagates its own
errors. Return the error here as well, so a device tree that assigns two
pools to one device fails the probe instead of half working.

Fixes: 7bfa5ab6fa1b ("drivers: dma-coherent: add initialization from device tree")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Compile-tested only, with CONFIG_DMA_DECLARE_COHERENT=y and
CONFIG_OF_RESERVED_MEM=y. I do not have a board that assigns two
shared-dma-pool regions to one device; the release path was traced
through of_reserved_mem_device_release() and rmem_dma_device_release()
rather than observed.

 kernel/dma/coherent.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 45bbae947f4b..4d0266893bcc 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -352,8 +352,7 @@ static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 	    min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit))
 		dev_warn(dev, "reserved memory is beyond device's set DMA address range\n");
 
-	dma_assign_coherent_memory(dev, mem);
-	return 0;
+	return dma_assign_coherent_memory(dev, mem);
 }
 
 static void rmem_dma_device_release(struct reserved_mem *rmem,
-- 
2.53.0

