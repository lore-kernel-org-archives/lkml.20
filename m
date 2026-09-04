Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B9175A8A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788480040; cv=none; b=CRKljiW9iXgT0g5NSEktXxdUeswY9ijdze0e8TpCv6fLKeInVytM/Sa8JR7RYD/U3nTLbWBeFG2JZKL7o/E2IkUhH3UHCxzV6P4jNryW+Zo1XJfMggVDxPHMOPxPTyW5KSENoNz6l8yMr+K0gUJ6Jyj7pPbcWby/r0cAPduRs4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788480040; c=relaxed/simple;
	bh=wPTiM/2o6qRTVP7y+gB//QkkGZROWCMUah7Fb4en8rU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TrnYm5RhkUtUtc7Le4/V8dNglQk1JUEchAQcH56IzQqBm3+1T9V/D2GSmFjGK7DJDk/9LyufgHyruTqviT0OiPOf/5LSfeInUbrjC/7TaouTNBdZeUFFNxFNVIYQT86AMIQh3f4wdO1+yMXyGUpxXdf2SToRqvY3tWnpzbGNRUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei8m0uBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei8m0uBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C75F1F000E9;
	Fri,  4 Sep 2026 00:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788480038;
	bh=+5woYkXUNY0sBD8Nd9g38DB9w7LM9BkTTq7V7hAdS1M=;
	h=From:To:Cc:Subject:Date;
	b=ei8m0uBonvKXcFnDJcHgd9rBUbiEcRLvrzjehxC9ABGynj1ZJRS3lVJ+Fkvj+oUFX
	 CTrKNMzxcN93I8HycylEENMNtX6YLqQ/JHUIMVIuF1592XMFAcUof936bCNMUD9PJf
	 kOiDa7V7oBjPldYvpPlo6dnxy0wYdZ34rxnEkDpYNsYUPTucKQDefjxZHYaXOBAA8y
	 B7XGRC91T2tHAAJDf6JjyjEUl7J6Y4mzzh6Kp+3qpOQq1hmK/Xv4ZZDr+Gz74+IYt8
	 q0XPFBNdnGYv1dAXIZty/OHvQ07pZEPJHKGX0/Lm4LmAzwllUKvtF4JZlkmwaIkeUF
	 9qYR2VJA7+Qjw==
From: SJ Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SJ Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] mm/memory: fix hugetlb_zap_begin() call in zap_vma_range_batched()
Date: Thu,  3 Sep 2026 17:00:26 -0700
Message-ID: <20260904000028.149656-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during
final unmap") added zap_details parameter to hugetlb_zap_begin().  But
the hugetlb_zap_begin() call in zap_vma_range_batched() is not updated.
As a result, build fails as below.  Fix it.

  CC      mm/memory.o
.../mm/memory.c: In function ‘zap_vma_range_batched’:
.../mm/memory.c:2308:9: error: too few arguments to function ‘hugetlb_zap_begin’
 2308 |         hugetlb_zap_begin(vma, &range.start, &range.end);
      |         ^~~~~~~~~~~~~~~~~
In file included from .../mm/memory.c:48:
.../include/linux/hugetlb.h:253:20: note: declared here
  253 | static inline void hugetlb_zap_begin(struct vm_area_struct *vma,
      |                    ^~~~~~~~~~~~~~~~~

/* TODO: move below to commentary */

I didn't read the broken commit in depth.  This fix is only
build-tested.  I wanted to report the issue with this as a temporal fix,
but the broken commit doesn't have Link: tag.  So directly posting this
temporal and not very well verified fix first.

Fixes: Fixes: f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during final unmap")
Signed-off-by: SJ Park <sj@kernel.org>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index fcf893f4b55e2..151a1bf512e00 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2305,7 +2305,7 @@ void zap_vma_range_batched(struct mmu_gather *tlb,
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				address, end);
-	hugetlb_zap_begin(vma, &range.start, &range.end);
+	hugetlb_zap_begin(vma, &range.start, &range.end, details);
 	update_hiwater_rss(vma->vm_mm);
 	mmu_notifier_invalidate_range_start(&range);
 	/*

base-commit: 2d1388907095f676b59fe6dd22f244abc08408cf
-- 
2.47.3
