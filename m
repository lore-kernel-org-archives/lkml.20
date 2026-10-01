Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A382C3E5EFB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895748; cv=none; b=PfrmVfzSNgdSyJvIGOOuaX81N4M0fKiy/fBc0exYurWTol40rAL74c/B6nATOr3nvvTwR7vH71yOh+EXndyvv9cVr0eK2ZqMcPFSstzhFqFqsZk8yoqBfcaIdL6/Lu5g3UZbP0W8ooDwhhdttp9N9Uv7IeSgC6PvHOfZ97CG0x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895748; c=relaxed/simple;
	bh=b0LqwidoXUIgErtyzH3nlRE6aoVTPgwdD6FRCMAe8Oo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dztRchr1I1Yrk0vSvDlm+eqLvalJpOOVs33cwbMQLbyEzLg/YxZbUHvp1NfGh+ZN3AqE60wSwwFSIUKMEUQ37O3x2iXMU/e1DeX6XSGUhWeWliFlCWGjPK0rwy43m7AOHhTrPW4N3YieB/1GKizEQpKx2qdMLbFK+qajdeuWx30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QbEc4NUX; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QbEc4NUX"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so8478412a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790895746; x=1791500546; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbwONChgIm9toIIBcyyDgkpchsmR3qTw1sfEfErlET8=;
        b=QbEc4NUX0R2vJlNKMYP051uQaryJfTY1RTWUQ96oSLo9IaGfmINtzs8RvaC7Onjwv9
         T+R6KWNCyerurqWV9Mr3tZFG0aVjWe83b4t8mhIyKA2Mp0Tmo6+OloaVqdojm7JUFSbU
         KPnqNupCZ1VlsrqE3fGFf6K0RbR32cSzkcCWbIy0lbokOa+q1Kz3tWjwYXb3gWAkWs82
         r2ep+Qfh/JP6I7hLULb3c2DwoRuoX6AGwHZ/aGHWvptU6aq35/wBlWmaZUZHE8pd8KcH
         9CJiYU1Xgmh7i4V77Ostg6cjCq5+Tc9Wc8Sq3xp4XdDxRivFVLaa6TQ5bjDyhs6i87bS
         d5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790895746; x=1791500546;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbwONChgIm9toIIBcyyDgkpchsmR3qTw1sfEfErlET8=;
        b=FyLNQy91AUtmoGXxNXTeb0KaXIESoNTcRTcHbOFYMytxJXFG+fWcH1j4ZG04I//YUI
         obP1i8wOFnDhIRnRwBNK64SriASbtRFe9Vb0khrtyLEZX7tHOd3QfR2m8nO7SHh6WdRC
         rlSBjrjkM/poemXsQbeFix4p1qFaPLwL90H3ehOmsXwL+JbNmRkQwz8Y2rh9tJ5pADdh
         S20K7DL/7QDnEcSI6Qu3oJTAm0/X4YJnozdjoZ7BlX8eivtFOYcBT6RvIKy5fZwFPV1i
         T6JV4RQ+iFbTuNW92+htkn7jWQYYZXGzxTk5ZjWGUqpf2ECNi+mtrTT5RNMrKnjbWumy
         o4nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRanomXGQo3zzykIYYXP4tsUtAXV57t702uOqC3Kuh3JleKTWKkEggM8L5CM7wIuEF/WduSaAtb0z1HGA=@vger.kernel.org
X-Gm-Message-State: AFuF++ls+D+g+E7EM2b5+v9wYh+8h1pq3OeNSmccnq9BV7vyXAVJuNfH
	elj9A4gps3r7ihLsPlUCZ7b+22Rb7OIz8XIWvEkwTX1RGEJ3SJ6o/Az+K636fsHl+wXuB3n5lV2
	3XA==
X-Received: from pgbcr6.prod.google.com ([2002:a05:6a02:4106:b0:cc7:b09a:fe3a])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5491:b0:3de:140a:3e31
 with SMTP id adf61e73a8af0-3e0bd228817mr867758637.49.1790895745421; Thu, 01
 Oct 2026 16:02:25 -0700 (PDT)
Date: Thu,  1 Oct 2026 23:02:15 +0000
In-Reply-To: <20261001230219.818128-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001230219.818128-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001230219.818128-2-praan@google.com>
Subject: [RFC PATCH 1/5] iommu: Add reclaim_list xarray to struct iommu_domain
From: Pranjal Shrivastava <praan@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Mostafa Saleh <smostafa@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Logan Odell <loganodell@google.com>, iommu@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce struct xarray reclaim_list to struct iommu_domain. This will
serve as the O(1) storage where the fast path stores empty directories by
their associated IOVA. IOVA is required by the shrinker to perform a
top-down tree walk to safely locate and prune the parent pointer. While
xa_store requires a localized spinlock, this path is only triggered when
a directory reaches a completely empty state, keeping the vast majority
of mapping operations lock-free.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/iommu.c | 2 ++
 include/linux/iommu.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ede9a..5d814854d825 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2074,6 +2074,7 @@ static void iommu_domain_init(struct iommu_domain *domain, unsigned int type,
 	domain->owner = ops;
 	if (!domain->ops)
 		domain->ops = ops->default_domain_ops;
+	xa_init(&domain->reclaim_list);
 }
 
 static struct iommu_domain *
@@ -2126,6 +2127,7 @@ EXPORT_SYMBOL_GPL(iommu_paging_domain_alloc_flags);
 
 void iommu_domain_free(struct iommu_domain *domain)
 {
+	xa_destroy(&domain->reclaim_list);
 	switch (domain->cookie_type) {
 	case IOMMU_COOKIE_DMA_IOVA:
 		iommu_put_dma_cookie(domain);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ac43b8b93f14..b9611631ea80 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/iova_bitmap.h>
+#include <linux/xarray.h>
 #include <uapi/linux/iommufd.h>
 
 #define IOMMU_READ	(1 << 0)
@@ -249,6 +250,8 @@ struct iommu_domain {
 			struct list_head next;
 		};
 	};
+
+	struct xarray reclaim_list;
 };
 
 static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

