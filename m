Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607D236D9EC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788592765; cv=none; b=d7LToVEI67RD8pqe00apfCuMQcJK1mtVLPagihSrbFsOvEUqa3FnoF/lUr9Lmu78c8AjrpsPUEEQm5UH3jCl+XTQ9PjO9qHD2h6IXIAK8K5R1jC2uDg0mMUxDaEyGFw2KV7+UqZNN8NWHh6AERufFI7enDWg6sFbCf+bky6A4tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788592765; c=relaxed/simple;
	bh=6b8GbCqKZboTdKKyOVySbbcctduCni9WHEE4apbn298=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+PGx1pS/EVdrmljzX1bt4pbSaPGWofDsfld1A7D++b2b0OE2hX2o3a5XPWpCWn4KYC2bDdjOWVY87T5IEuOUDahw2QF5XGlq98vYVIeuiBnZPHrrjl7U9duTZzwQYb5LPvvcvAAeZm0aEs47UGv5Z5a/ZtxPNRsXV6qk0RAqbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcKis87h; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcKis87h"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8485b358552so1578479b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788592763; x=1789197563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kniu51pKGU1eVNIl2Gb8/92qXSKg7BhfDHviVd7hho4=;
        b=mcKis87htc0ZU/Gcm6uOUoMLdO1WnNMYBxQBHULRZMZNNn4cUktgcb6cZlCZyjC8g7
         cDkAdk4v5F8Efz7aH1thubaQgZIggKoW4GejwBhqqCTUeH9oGGSS88UZRxMrckVdGnwM
         KOf5FrFIge8F/YE4SpvM/5Ie26T90v5Nj1gQmlBlDycccuXdh0fNS11rD4Jlvyu5g8Xl
         aTJ7XFFciB69xZ4Jkdk3w3kTCC5znnN9fUyanjQS9VwcqEUHK1jhaWRPLEz9/gYOxf0N
         rvYWqcnKBF7hPztWLpNAmC4uaOS1ccPVFU+pBr+GyqxspzM/XBAewQhpyRFV7EjXX+a/
         cH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788592763; x=1789197563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kniu51pKGU1eVNIl2Gb8/92qXSKg7BhfDHviVd7hho4=;
        b=Ti4XJRzOApM0TnsQASGqVAp9mJUE7tnw4t18cN+0KMRlT1XwUg1uOwBKcc5H+WuazR
         9vCOrKU2TZU4EV1R3kf/h3r0mwIIqDzAqmytqGecbgbvfvu15jvlvuYwd6c1g3f6EWBc
         EKsbq0I1yDcpgaZ3pJPjiMVORbO8K+DcqqkXhbdxRznjNo4PnbYasyVPjpYGK7rJLjaS
         z/s1jCpZqMppJDuHRqeRv9yBbFmLxbJ/q6QTMeh+/QYN7kPmvjrd1g4nuBoLIMK1aqAP
         KknFWMEwYkrY01eMoPiM8362eOUo7+v1OyeQxNgUHb8p89LMRK443Mm/S5DyybQdR/ti
         U0ZA==
X-Forwarded-Encrypted: i=1; AKwUvBx1u5+rX6yqvEQD/M+Xjn4C+Fb8iyeOUpQJVqAH5kLzHyxhIMMROuV3CukvGFTrgH+ROVUAPltuiOILttk=@vger.kernel.org
X-Gm-Message-State: AFuF++kspYS2pxnYO9UjnWXPd+9YQ2drlPy0l3ABFA3Ej7qKX+nl38Mm
	ExUt8xpm8luOms71BKn9k3fxryqHihyKtvJKHBYqmhmJGN7AD9xT1XU=
X-Gm-Gg: AYBFou14IRl9PPPeFiIwLdcoeycRs7sqllrHoH/JEuL6u7bCbFSMm+SMlp9tQ9Q7g4n
	+8GaF22+EAZvS0k3WSm3SHhZm7W1XVbH3qjc1lKFpOUb9ELXftSC8ZxD27Be6NVuLRuNCNBL5zy
	S7xdQgnRiC9wALuZ342MiJv0ZM03ENnUstE4RGc42P2W0hgOnBVALM2OYZVGNfoAt7Q8i3AquUo
	L4pRohr3T6m2GJhKHm+cpdfEGPpZZj7TP9UntGXjZ2J7kRZ3B3B3/AAO+q9yChFX6ip61oqLgFM
	U5E6QyrwctpLzcxN1J5jIaediJtAzln81a8Ed7/htcwz1wKhGgI9gzgF8v0QIMz/duzfScKH9ig
	0VcKWZuKIUT6HSuuPQ0AZvUcx+2ePjga0CRXYULC/YwAJN6dlk/K+daxutmiuUyIvv5QLBczt9x
	+7W0rN2WXx41+tL1si2717sREOR0qc9djcJJBQDeM5uBO3ILy4Y/BXctiOMeyVV3wuXHe+ZXMkV
	uO2dxzYgFlzK6M=
X-Received: by 2002:a05:6a00:3008:b0:857:3b70:209 with SMTP id d2e1a72fcca58-86167aa9918mr14558768b3a.1.1788592763408;
        Sat, 05 Sep 2026 00:19:23 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-861520404f7sm2033047b3a.16.2026.09.05.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 00:19:22 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] dma-mapping: don't trace the DMA address when the allocation fails
Date: Sat,  5 Sep 2026 16:19:19 +0900
Message-ID: <20260905071919.30784-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_alloc_attrs() passes *dma_handle to trace_dma_alloc() and
debug_dma_alloc_coherent() without checking whether the allocation
succeeded. No backend writes it on failure: dma_direct_alloc(),
iommu_dma_alloc() and the dma_map_ops instances assign it only on the
path that returns a buffer. Callers usually pass an uninitialized
automatic variable, so with the tracepoint enabled a failed allocation
records whatever the stack held, next to the virt_addr=(null) that marks
the record as an error.

The device coherent pool path is the same: a non-zero return from
dma_alloc_from_dev_coherent() means the request was handled, not that it
succeeded, so cpu_addr is NULL and dma_handle untouched once the pool
runs out.

Split both sites on cpu_addr, as dma_alloc_pages() and
dma_alloc_noncontiguous() do further down the file, and pass 0 for the
failure case like the two error paths already in this function.

Fixes: 038eb433dc14 ("dma-mapping: add tracing for dma-mapping API calls")
Fixes: 68b6dbf1f441 ("dma-mapping: trace more error paths")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Compile-tested only, with CONFIG_DMA_API_DEBUG=y and CONFIG_TRACEPOINTS=y
so that both changed calls are built. The claim that no backend writes
*dma_handle on failure was checked against dma_direct_alloc() and its
helpers, iommu_dma_alloc(), iommu_dma_alloc_remap() and every in-tree
dma_map_ops .alloc implementation.

 kernel/dma/mapping.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index bf2651a70b7c..098cd57e1157 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -656,8 +656,12 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		attrs |= __DMA_ATTR_ALLOC_CC_SHARED;
 
 	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr)) {
-		trace_dma_alloc(dev, cpu_addr, *dma_handle, size,
-				DMA_BIDIRECTIONAL, flag, attrs);
+		if (cpu_addr)
+			trace_dma_alloc(dev, cpu_addr, *dma_handle, size,
+					DMA_BIDIRECTIONAL, flag, attrs);
+		else
+			trace_dma_alloc(dev, NULL, 0, size, DMA_BIDIRECTIONAL,
+					flag, attrs);
 		return cpu_addr;
 	}
 
@@ -676,9 +680,15 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		return NULL;
 	}
 
-	trace_dma_alloc(dev, cpu_addr, *dma_handle, size, DMA_BIDIRECTIONAL,
-			flag, attrs);
-	debug_dma_alloc_coherent(dev, size, *dma_handle, cpu_addr, attrs);
+	if (cpu_addr) {
+		trace_dma_alloc(dev, cpu_addr, *dma_handle, size,
+				DMA_BIDIRECTIONAL, flag, attrs);
+		debug_dma_alloc_coherent(dev, size, *dma_handle, cpu_addr,
+					 attrs);
+	} else {
+		trace_dma_alloc(dev, NULL, 0, size, DMA_BIDIRECTIONAL, flag,
+				attrs);
+	}
 	return cpu_addr;
 }
 EXPORT_SYMBOL(dma_alloc_attrs);
-- 
2.53.0

