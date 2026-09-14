Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AE4472555
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389140; cv=none; b=BYyjLJg2IGzh2EcT532Mh2ts6L6+9CAzLUFbmX6CRCrjFE5c5v/MOCsGHohS7SPqwDo+VLtjXdmO0cNBqspEqtFLY3vJThXpKzJK/ejjIvrixy9yM2h06Rfsp746rxlNHpWmXl5JizJ+wYlbiF54AG2iB7SOYp5vYlir0X89sks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389140; c=relaxed/simple;
	bh=qHCwemBvEHnl6RrkodLgJVOAA4pYdgV5Aeyu0ypk9I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaMzLvP4RW7pl+zKAX9lZfbJHXI8hnBwi8ttzJ3QB13saVz5gFvElNsbgkEWO779Iiz5lpfhLWpfiz1e2qss12eGuCZXtAoTmFjD7J+ker1h0TMHIQTpLUCKPRnIGP55BHzy/NHlOO+aWYc/hVpYq6FW2r9yOuk0DduIxMZAZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=khIxBPYu; arc=none smtp.client-ip=91.218.175.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="khIxBPYu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qHCwemBvEHnl6RrkodLgJVOAA4pYdgV5Aeyu0ypk9I0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389130; v=1; x=1789993930;
 b=khIxBPYuAg5FmSdTIET+iSz+77DhfXdHs772s08vMSFKGBywDQZueERFl7DI7CK0If9efImv
 ZPyIUvWxC3N4VWON4a0G6fU74Zo7yq5wwEhIb49oMvcRbfDpYnQ7CQPzYcTGKLaeJq2Ee+1xr9Y
 7YdPKV8nQQ+GGW7CdnRoxiTk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e967df5ce3b87961;
	Mon, 14 Sep 2026 12:32:10 +0000
X-Mizu-Trace-ID: e967df5ce3b87961
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [RESEND v7 26/29] mm: don't PTE-batch a swap-in over a hardware-poisoned subpage
Date: Mon, 14 Sep 2026 05:28:16 -0700
Message-ID: <20260914122950.3283997-27-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_swap_page() checks PageHWPoison() on the faulting page, but the
large-folio batching path then maps the rest of the folio without looking
at the other subpages. A poisoned subpage that is not the one being faulted
gets mapped anyway, and the fault that would have reported it never
happens.

Skip batching for such a folio and let each page take its own fault, where
the existing check catches it. Test every subpage rather than the
folio-level PG_has_hwpoisoned: memory_failure() sets PageHWPoison() on the
subpage before it acquires the folio lock, which we hold here.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/memory.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 84e1e1c22bffa..aa1f67b378587 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5020,7 +5020,14 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	page_idx = 0;
 	address = vmf->address;
 	ptep = vmf->pte;
-	if (folio_test_large(folio) && folio_test_swapcache(folio)) {
+	/*
+	 * Scan every subpage rather than testing the folio-level
+	 * PG_has_hwpoisoned: memory_failure() sets PageHWPoison on the subpage
+	 * before it takes the folio lock, and we hold that lock, so the
+	 * folio-level flag can still be clear here.
+	 */
+	if (folio_test_large(folio) && folio_test_swapcache(folio) &&
+	    !folio_has_hwpoisoned_subpage(folio)) {
 		int nr = folio_nr_pages(folio);
 		unsigned long idx = folio_page_idx(folio, page);
 		unsigned long folio_start = address - idx * PAGE_SIZE;
-- 
2.53.0-Meta

