Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395308;
	b=FGwFoP9eE9PGBpU6sEM/srKxCnRWxGpAbz7WNBJr+hoPy9dGUIxxuwdKr4er5rNFsE2d
	 I6FpZdRuTxWbYzmZR4s4YNhfMLnEgZPRZIxbcKgI7jR5CM2JASxR8jkPPTG652L4+0ct5
	 +Mawa558LSbnLHVE7lCWE5BP4BDt7yYNbKl+gqPcdShPQw56NznS15RjmspsMcyZfGqhm
	 p9PpD/Z0Ag26LxjtcBdyQerzGWF0+GNeODxLtwMbT70oKSFEyXZRLOP52E6FXOKKBn8XH
	 lHTDnXEveo2Hk3+FsMekXE93FztKhCFEYDX1SkxQDRgLgdxyDzqosWuVCqteCElbfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=;
	b=cK/UXqihXswYFAaGVzJIodEmrtsWl7wkDf0OdSHVw/G8W6PDCPZ21OV8wz5Z6LAYkiPe
	 LQtLGaDfSK7lat0mYEDig/6Fjp62mRORO8lHLoBumnUdaR0bN4s1kMiU02g80v9qXdjip
	 94GDcWAmmhXtHEA1QE17JsugVdnkWLOWN2kId++ybUKnMMrmYDOFDnOOksSbf41SePdYD
	 bS1NWfQkjwHffLeG2jxSpvvmYcIPdINY5e3Aw9iOjRX8cS/oFbADdpAsat++TdJPvAUdR
	 BiV2VQkY/fgNdl2iGIAtyw0uFEt7cUyr78lO//8fCtaZv1RXbl1m+2T99IETaTlqQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RuJghETV;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376760A381C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F376760A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RuJghETV
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-492425d771bso1942116f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395306; x=1795000106; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=;
        b=RuJghETVeeglRlTDhW9yv6qcnhi3kpQ4YQxKe9LGrBC0p5eivBcIP2n1PGIFrWpV1L
         hlrbYMi0zgfqKZ5LpO9modY4fUHOYA6I3qZfvHocCWMLVjzLRI6mhmJ7/gESH+MdHCFA
         1bliSantHi5Xj/2TQVBO6fhlv76xKcH4wpCHYDh5eFTdwfI2B/y1j4ovP3uFUg7cN3CK
         nTMaJ9SkaoEO5VVdz7S49wY3j0iFflUJCif9x8DJHRnt8xEFsvRtnG9ehZT9yIO5FmIE
         f9bjJWkSijIclRcFn3UFjhNMCjMmnnW9qn5NGxBiowBRR31c5LkDW5zhqrBBk1PG36qG
         xwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395306; x=1795000106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=;
        b=BZNQFmIFijoBl1dfykjrqgjoaDRbSI/hAsF0jZK4iob3yYf0QfV5pUg741T3ch3B04
         LB47QL59QnHeLH7ZXHIeh+mJkJj8WhcWsiVO+VKy/9HlPbM/BcSIFbikG7EheESNvsaW
         YD9yh6EDmjLU863UyFIcOwzJhi1S6VLDQaL+FSLU9MZIVYl/D+4NN1Wjx08FApdyypE9
         iLTEItVGVdU6LTpjOB7H4MV/BC3uCkps6BfeyfTawupjQbKcgF3ekTFoH/5EMb/tUlf5
         a0j2seNn+13QDctQmzojeH9rdZeo+5YbdBv9kDYX2CGLr2Txo3fg0gD7wgpzELkQv08i
         BWCA==
X-Forwarded-Encrypted: i=1; AL+hErFPR3E2n+rK9XXmcVev31w9zq8kOWBepnmXDBGh7eXabE6vV49DPc08yLzgWZJ/uJGiqA8ISAP6nWc1bws=@vger.kernel.org
X-Gm-Message-State: APuU4Z9luNBQiBmMdYtGaJgeuay04fBDZH4rqswKVz32E74q+IF2zw6A
	zo44F4e4KSOTPXbT9cNvrD1H7bX4vdZENmBGlWJlKaA/ZtfOzdg3oAtOsqbFfUcpEzlX/h1qePN
	qJKIh5j1NPFgZETiEZVGAMw==
X-Received: from wrsb1.prod.google.com ([2002:a5d:45c1:0:b0:48c:753a:6283])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e194:0:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-499c7b1aea4mr3063798f8f.56.1794395305902;
 Wed, 11 Nov 2026 03:08:25 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:33 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-4-vdonnefort@google.com>
Subject: [PATCH v3 3/8] dma-contiguous: Expose rmem_cma_ops
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Expose rmem_cma_ops via a kernel/dma-private header so the upcoming
lendable-dma-pool reserved-memory handler can wrap the CMA callbacks
instead of duplicating them.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/dma/contiguous.c |  4 +++-
 kernel/dma/contiguous.h | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 kernel/dma/contiguous.h

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..22d6e54aea35 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -46,6 +46,8 @@
 #include <linux/cma.h>
 #include <linux/nospec.h>
 
+#include "contiguous.h"
+
 #ifdef CONFIG_CMA_SIZE_MBYTES
 #define CMA_SIZE_MBYTES CONFIG_CMA_SIZE_MBYTES
 #else
@@ -578,7 +580,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 	return 0;
 }
 
-static const struct reserved_mem_ops rmem_cma_ops = {
+const struct reserved_mem_ops rmem_cma_ops = {
 	.node_validate  = rmem_cma_validate,
 	.node_fixup	= rmem_cma_fixup,
 	.node_init	= rmem_cma_setup,
diff --git a/kernel/dma/contiguous.h b/kernel/dma/contiguous.h
new file mode 100644
index 000000000000..9b1fdbfc794f
--- /dev/null
+++ b/kernel/dma/contiguous.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _KERNEL_DMA_CONTIGUOUS_H
+#define _KERNEL_DMA_CONTIGUOUS_H
+
+#ifdef CONFIG_OF_RESERVED_MEM
+struct reserved_mem_ops;
+extern const struct reserved_mem_ops rmem_cma_ops;
+#endif
+
+#endif /* _KERNEL_DMA_CONTIGUOUS_H */
-- 
2.56.0.542.g3ef89b7020-goog

