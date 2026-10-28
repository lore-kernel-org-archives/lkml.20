Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187229;
	b=RCv7TDLIZnqhxAGjWG+xSmRRiIQ576W07sKe77Sss2vmte0yxFi5FtRLy6X8AgQdz4z9
	 WfKGlTul/7JDyimrnaODPsuwUXp0W1KQIaha0TK+2HxaPaOwlXnSsLdB26PTs1saylVNZ
	 4NwvCBpGzJGFXQ/XgjcySIP2O+99ZzoqZnokguPxknrcId7YEpubD+vyNnEXJSHbzG4w5
	 2LWHHpZh7cmAYtoWteBSag3bI7APzkuz1mCER0k2yzCmGA7Sw/liqoYmL5/TQw5fO0REZ
	 LFJIPBzsDgbi6QGoFEXjPPjlwWeyvXH0MC5WRtMpElTVJH4CuEQzcYUCrjSJaJsEUnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187229;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dDUOitKwAW+3VTNHIPufF1Hg0ej/fAOtjzL/v/aRs4g=;
	b=xG2WV8B7R9kMR9oTCgspBFtSxFQAbC0TBRKEiM+Uu20e1yIB1LHhb7o8qdHn90B/Q8Rb
	 mONL4V95H3OBH4okU2OuJlYGGCM1AJLmokKdq5+LVIujenQjzWHY8l1hzVoIz3pJNjj4e
	 /zCkAh8JrHTY7X92JmmPXh0VPAdMb0FIwH1LPA0wNPHUyx9L2ims0NvCsgMxoVcQ0mE0m
	 UDnWBpyBO027P/tE+yX9zUKImIAdFXoTwB853GrPrZzKLXk3LUMGOl3MtMltn2n+o7oaj
	 qydxqXhNet2P+yrdpwCwayyWwNVHn6bWZgH/8MsZ79DSvfJwdKxtDFQVGccmkN9ZUQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bl2ixjO1;
	arc=none smtp.remote-ip=95.215.58.218
Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E18B606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E18B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bl2ixjO1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=p43Uh4QBygC4J7FaMvkYnDy+vZa3XCqhD7uuuVVkH9Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793187226; v=1; x=1793792026;
 b=bl2ixjO1thuQ87whdtgDcso+QayHJmPNY/bHCc//DGltM+tFHbY0ABNJ1/u+IsyzLohxX5ZS
 TjnDvIzBMkcIqVidBfr/lOwIhaAZS7R06O2Jr+PcWc/UQ3xm0lYe/nE7PPcJQa4trGSk4mNQCFF
 awWlFKyefFjPa79sG5WzbBjo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ece0e52f5c4e19b0;
	Wed, 28 Oct 2026 11:33:45 +0000
X-Mizu-Trace-ID: ece0e52f5c4e19b0
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Frank van der Linden <fvdl@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH 3/3] mm/hugetlb: fix NR_HUGETLB accounting for unused surplus folios
Date: Wed, 28 Oct 2026 19:33:19 +0800
Message-ID: <20261028113319.38544-4-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028113319.38544-1-kaitao.cheng@linux.dev>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
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

From: Kaitao Cheng <chengkaitao@kylinos.cn>

free_huge_folio() unconditionally decrements NR_HUGETLB, but freshly
allocated surplus folios can be freed before the counter has been
incremented.

This happens when alloc_surplus_hugetlb_folio() rejects a fresh folio
after its second surplus limit check. It also happens when
gather_surplus_pages() frees folios because a reservation cannot be
satisfied, or because concurrent pool changes leave excess folios
after the reservation succeeds.

These paths leave unmatched decrements, causing HugeTLB usage to be
underreported and potentially underflowing the counter.

Increment NR_HUGETLB before calling free_huge_folio() in both paths
to balance its unconditional decrement.

Fixes: 05d4532b60e3 ("memcg/hugetlb: add hugeTLB counters to memcg")
Closes: https://sashiko.dev/#/bug/linux-860a3b8f-0b07-4cd5-a122-aa2288463bee
Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 mm/hugetlb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 8da4bab676c9..d564e6935e61 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2132,6 +2132,8 @@ static struct folio *alloc_surplus_hugetlb_folio(struct hstate *h,
 	if (h->surplus_huge_pages >= h->nr_overcommit_huge_pages) {
 		folio_set_hugetlb_temporary(folio);
 		spin_unlock_irq(&hugetlb_lock);
+		/* Balance the NR_HUGETLB decrement in free_huge_folio(). */
+		lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
 		free_huge_folio(folio);
 		return NULL;
 	}
@@ -2376,9 +2378,13 @@ static int gather_surplus_pages(struct hstate *h, long delta)
 	/*
 	 * Free unnecessary surplus pages to the buddy allocator.
 	 * Pages have no ref count, call free_huge_folio directly.
+	 * These pages were not accounted in NR_HUGETLB, so balance the
+	 * decrement in free_huge_folio().
 	 */
-	list_for_each_entry_safe(folio, tmp, &surplus_list, lru)
+	list_for_each_entry_safe(folio, tmp, &surplus_list, lru) {
+		lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
 		free_huge_folio(folio);
+	}
 	spin_lock_irq(&hugetlb_lock);
 
 	return ret;
-- 
2.53.0

