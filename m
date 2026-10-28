Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187223;
	b=VzsMdyoxzOK5U+/dKZ9aQgAz7LNWmdG4BjzhRQwj4neKsWuIl6bdmjUKwHvs6ktNtffG
	 LtDeZVnBD8dG26NZXIpD/iL/3u7V+E7JlxjSShJGtVSLBubs8392gTbT1A/WH+UYukgX/
	 v7ZXWfqNgi463zRd43qp7wQUEDDcR6m41lcEAyXmbLyU6OvEF2bMFu1w2rnM647AQhmuH
	 P44M6Lc/gDhRfD2Dtk/v0A8E/c0fBEUMK179PIarwbSXy0QoNgJjwYcWO5+q2dm6YtllI
	 T+oklX54QLGk6sPs45Al7bFw8ujLuU0Z4jv8/7csEnFPsCtKhV3gpUXjeT3v/qQ9hoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187223;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eZqrRAG8TXvwglBXLrHZsQwJkLFjvZPLEOndgDiI778=;
	b=tNw/i8eg96r1KwlCE0N8cbArqiGWHCobWQP7TNabdWLk1y4bbLuY18SU3Wu4qTV1wP3s
	 atNeVsFcO91s3Y06a40lPi5B0Qj7BdeaCzUWTdmiu0QbUPoraeHnJjRZnI1KkaU9HtL67
	 Ef0KJKUSBFwctuc9WIpCMlmohbjjDcwhvyMclSU9UxFTzOrM1MvFgxxpJaQLzQJoA1do7
	 gX+XeLSgJifpQ9WOXpJo+9LtsulUHWdKZdjgAOJH3DGlPAFkK6QEGnUx5LWTPBYZmv9ze
	 Zs8/PVV0nlj5Sd9qFOKMUYf01u2RHj/NEHumw49UqfAZaAi2bsL/bjk/RnW3kfKuYOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cJbsOXPg;
	arc=none smtp.remote-ip=95.215.58.208
Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B1B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cJbsOXPg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YIi5cqsLiN4R7MlgUKWwk2aRnfwmDatK/C8j4Mm1VPw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793187220; v=1; x=1793792020;
 b=cJbsOXPg1eiyW6Q19AS227PbMKVR1RRB6NBAsYxGXvQGcDXq8HnIJDr9nVb2pSOtFly873f8
 tYJTC8BkU6mPcj7004twsRVNb4q9MYZFEMEmOcK/I6daUo22ce8QfHqNEI9Hs4m38cPp03mQ6Fm
 vGt/eYv9zwbJ1fjV+xp68Meo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9ad0361b8284d86;
	Wed, 28 Oct 2026 11:33:40 +0000
X-Mizu-Trace-ID: d9ad0361b8284d86
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
Subject: [PATCH 2/3] mm/hugetlb: preserve CMA flag when returning folios to the pool
Date: Wed, 28 Oct 2026 19:33:18 +0800
Message-ID: <20261028113319.38544-3-kaitao.cheng@linux.dev>
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

When vmemmap restoration fails, add_hugetlb_folio() returns the folio
to the hugetlb pool. It clears folio->private and restores only
HPG_vmemmap_optimized, losing HPG_cma on CMA-allocated folios.

A later successful free then bypasses hugetlb_cma_free_frozen_folio()
and returns the pages through free_frozen_pages(). The CMA allocation
bitmap remains set, so the range is unavailable for future CMA
allocations.

Save the CMA flag before resetting folio->private and restore it along
with the vmemmap optimization flag.

Fixes: d2d786714080 ("mm/hugetlb: enable bootmem allocation from CMA areas")
Closes: https://sashiko.dev/#/bug/linux-5363eb09-9c3c-4f8b-9f3c-a998a8c4b258
Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 mm/hugetlb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4a008afaedf9..8da4bab676c9 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1437,6 +1437,7 @@ void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
 void add_hugetlb_folio(struct hstate *h, struct folio *folio,
 		       bool adjust_surplus)
 {
+	bool cma = folio_test_hugetlb_cma(folio);
 	int nid = folio_nid(folio);
 
 	VM_BUG_ON_FOLIO(!folio_test_hugetlb_vmemmap_optimized(folio), folio);
@@ -1453,9 +1454,11 @@ void add_hugetlb_folio(struct hstate *h, struct folio *folio,
 	}
 
 	__folio_set_hugetlb(folio);
-	/* Clear all folio->private flags except hugetlb_vmemmap_optimized. */
+	/* Preserve the vmemmap optimization state and CMA allocation origin. */
 	folio->private = NULL;
 	folio_set_hugetlb_vmemmap_optimized(folio);
+	if (cma)
+		folio_set_hugetlb_cma(folio);
 
 	arch_clear_hugetlb_flags(folio);
 	enqueue_hugetlb_folio(h, folio);
-- 
2.53.0

