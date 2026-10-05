Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202436657B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182507; cv=none; b=fezXe4rMFVNO73+kzCKLx2mfxk5ZP3mhX/GTV7S+JcOEBFeMWI0kO1US3vvrQ6oiT9203frJJaAm1/JhdvhgqLDOYscQoJIJI9ZSsjm2st2M2vUWIX4Vd47GdLvV6aJzUTuOyuVdbDdR+2Lp4uLRe6PwMNqj+dKEq1PW/xrGuKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182507; c=relaxed/simple;
	bh=XMV0SKIvktN+WQZqgWaotOelQ5GC4dKvyGVuDdg18/0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=izMe7Pg87qWz+WhwOVYpHfLe94FiSUxT74q8IcS4u0xuNxSjvDfgBj5d/MZmktwii6ZnI1EvFywR3O02j6eysAMKNCs5uqiy/Ru2BEVI5y2PsQ2jPI33iVg6YosXgmc4t0zLm3+hnWnwki7cxwfe/9/tJSy3qGa37m/Xk4mWXvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X31bpEyj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X31bpEyj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so576074f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182501; x=1791787301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxYiwprUwInDcUC2IvTN3Wf8gv1RPqxCXCBp6IgMI3M=;
        b=X31bpEyjPsb2ZA0OCglgGvpsZEwlazd/KMrRU5eDnisj8a0ficG5aBaCkRIcCuRepi
         g2/thgHOg7LS+L87d3sba8ui74Qw/HHsdvpCg0U+fp+fKOZkFiuKsW4s022o7HZkv5AD
         2UFxJ8XJTZNZJVPBrS9edri3iBLYEs1oMU1X52BdRr3KNr4N9J98fCnWqdzj7yHbEfQ9
         WDcd/8n2HBzmHztlYIckRqP9nfZ8DLDvfKmXDunFS+7Tu+3oUfnKTz0Tj9pR+pr1rZRq
         nR+UIHwspFsptIniqbnbsgUGOCYVfR79EePVoISR3VnCLmiivrwar9vFhqXOiPCfMXDp
         y2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182501; x=1791787301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxYiwprUwInDcUC2IvTN3Wf8gv1RPqxCXCBp6IgMI3M=;
        b=HD76T1JNGKkH9USmIErH9PdEFZgAZNnU1g+Ab+9iys0aP2JZtbw4o1qLjh7WtEYnZw
         LpnRXBYWIpD25b0jCK7YajOVGZSFSKHl8pEPPGFeIyxYcVFoxT2pfCatg5NdDHcX/u7p
         YjsxqrBsM378PZ+r5fLsoLZ9KX5ar/1zrbKtQ4Au5R6GPRrsqmQufO1i/jCkRfzwq35a
         uHigm8sosExAbkXwxdiFHfk/jt7hgYqCnC3FD0AqdyWlUSrN3otb95x3v2PIPH2LBTom
         21d+3k3tgFQlE+ykz68gSHDGCwwjpr2FJsZw7emARgZVVqer+0bPtQpqhmNwJvyq5mow
         /zqA==
X-Forwarded-Encrypted: i=1; AKwUvBzqlNziICZ5tjs8gZEOsc7h7MUXTaBB12ig2hUH6F8X605EkHY13fKjfixEACM05TnCcv4K87RBD9BKXYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl/5GIjWgNIwODZb1bD4k71tnP1eZE69dI7UEMm/qJpNCjkDOM
	2SfbYeOEy8kPrOGunnnoUMvmlXgLK9iIY89KV4lFKf0KAzAF6oblL/Vr
X-Gm-Gg: AYBFou0Ue80qYcBL5GU51wYDHOAQFAkyIhexduQPmA6MhbRbV/ZmfEmULlWPUBkoK7d
	j8xcBBe/lonT6g1sOl2dWWmeGpZg+oE12exueRMglSU5J/88UbpIGm3udkPAq0fJxsgnJuF7JDK
	eIA1wRZUAD+I1mhXtOBWVhFfBxOne+wOXmUC0oP0SLK0vC+uaYSySU4gy+LIrNnL3slyz5CoWC8
	iSd/ZdHHxAy2lzdPsiZ0TuBy+qwERT2jYndQZm8lLEUmShxXcvZyqHu2sBya9j8hKLbISebM+0z
	j5cHVyPCZiHgEoyVclVsuG1yNQ5LmXID3ar0O4bD54AdKJnFMnjrSPzIzB6WGQMcFUJw6zoENmm
	7abJtzbwviOenyd3QFxSuaD3/17wE//ALJ43jD3fLY54nrEMuzDbVp+hDkTtBzI6qp+I/QyhZcb
	lf8024Up7iWRbMuHajyvVzRKI58bkbjiOUEdvSOkGex3CEwVycGOB08Trqh8Idpq2IeFPeZ0rq+
	LC2GsyKDikHpNnYhlRzLL6eittSz6Imlqdc9eB1XDLhDlUrO5qpD4fzbkT4oY3JC1Krp4lD3kvJ
	NAP1x8D6UELd+w1osOzFIFYhfwZVZj4pjQU0iA1m8bnYbVjUowJAhzftg5xaG8NjcGjczkqFwEg
	r78JM0YCo3dgI
X-Received: by 2002:a5d:5e84:0:b0:48a:f52d:ca47 with SMTP id ffacd0b85a97d-48b1275c366mr16227419f8f.22.1791182500905;
        Sun, 04 Oct 2026 23:41:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62289b62sm1666871f8f.20.2026.10.04.23.41.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:41:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dma-buf: keep the DMA flags in the DMABUF_DEBUG copy
Date: Mon,  5 Oct 2026 08:41:31 +0200
Message-Id: <20261005064133.7305-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005064133.7305-1-kmehltretter@gmail.com>
References: <20261005064133.7305-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With DMABUF_DEBUG, dma_buf_map_attachment() hands the importer a copy
of the sg_table that keeps only sg_dma_address() and sg_dma_len(). The
dma_flags (SG_DMA_BUS_ADDRESS, SG_DMA_SWIOTLB) are dropped.

The flags describe the DMA side of an entry, which is the side
importers may use. Copy them as well.

This is not a bug fix. No importer reads the flags today. Their only
readers are dma-iommu, dma-direct and iommu_map_sg(), which are not
supposed to see an importer's copy at all. The warn mode added in the
next patch keeps its marker in dma_flags and lets importers that do
get there continue. They should then see the same flags as without
DMABUF_DEBUG.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Built alone on x86_64 with NEED_SG_DMA_FLAGS=y (dma-buf.o, W=1). The
    KUnit test in patch 3 checks the flags in the copy. It passes on x86_64
    under QEMU in strict and in warn mode.

 drivers/dma-buf/dma-buf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 4c9add51f9ef..b3d311acb883 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -904,6 +904,10 @@ static int dma_buf_wrap_sg_table(struct sg_table **sg_table)
 		sg_assign_page(to_sg, NULL);
 		sg_dma_address(to_sg) = sg_dma_address(from_sg);
 		sg_dma_len(to_sg) = sg_dma_len(from_sg);
+#ifdef CONFIG_NEED_SG_DMA_FLAGS
+		/* the flags describe the DMA side, e.g. SG_DMA_BUS_ADDRESS */
+		to_sg->dma_flags = from_sg->dma_flags;
+#endif
 		to_sg = sg_next(to_sg);
 	}
 
-- 
2.53.0

