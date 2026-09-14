Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677C45FFDE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389131; cv=none; b=U8FDN20R4vjmFqJ1g6H5xphWtPHxWeMh3Ude9Y/9u2p946rWKK/2iedF/LieQeySN9COpJeA0M3xWlyIX6aFNOxfBeJk2vOwyfaCqPc496aT9hOPFkAqLp04xhdLtTAl+2ka9vw0IZevTwcNGX6KbEorOs9WU2JLUCKSNeaIS0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389131; c=relaxed/simple;
	bh=PmpEBPMCGBePeR65tGhRvp39CU+cDN/bw2BxnAbshOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cz0ka5oY0uGk+NEHhfBBu8HfNpMhPGYdqjkOLkNbu7Sraa8+zbW18oElnITq30OLJjXqGIl9HMnL8DZnG6URqFkKDDj+S+8/DAq1leh3Twl8cAj83eny1gSYEzbEZ9U18qPzuuSZ/NfbWnjbeO6RVu8IcfmzIDKu72JMMqGkxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a5EMW5Ki; arc=none smtp.client-ip=91.218.175.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a5EMW5Ki"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PmpEBPMCGBePeR65tGhRvp39CU+cDN/bw2BxnAbshOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389118; v=1; x=1789993918;
 b=a5EMW5KiIJFHiP6RUSv5DT9A/vgiXnUcIICfNI+cQRPfyIMq2ORlllHe6vsKWhdx5Qmf2Gq0
 DIC7HekNqovFX23Oyc9X69qQgZ3KmS3t+tEqB8ACeDX+lFyVp0NQBURGhP+8jO3LOYB14rqr2At
 szJXH2ygEQg9uOEU+v3+34Es=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id abc9569ad6a47579;
	Mon, 14 Sep 2026 12:31:57 +0000
X-Mizu-Trace-ID: abc9569ad6a47579
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
Subject: [RESEND v7 21/29] mm/madvise: keep PMD swap entries whole for MADV_GUARD_INSTALL/REMOVE
Date: Mon, 14 Sep 2026 05:28:11 -0700
Message-ID: <20260914122950.3283997-22-usama.arif@linux.dev>
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

Both callbacks test bare pmd_trans_huge(), which is false for a PMD swap
entry, so they return without consuming the PMD and walk_pmd_range() splits
it - only for the PTE callbacks to find the range populated and abort, or
to find no guard markers and do nothing.

Both already short-circuit at PMD level for a present THP. Do the same for
a swapped-out one: it is just as populated, and just as free of guard
markers.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/madvise.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index d3b5ed7e3cffb..64019668d69fb 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1269,8 +1269,12 @@ static int guard_install_pmd_entry(pmd_t *pmd, unsigned long addr,
 {
 	pmd_t pmdval = pmdp_get(pmd);
 
-	/* If huge return >0 so we abort the operation + zap. */
-	return pmd_trans_huge(pmdval);
+	/*
+	 * If huge return >0 so we abort the operation + zap. A PMD swap entry
+	 * is a swapped-out THP: also populated, and splitting it here would
+	 * only demote it before the zap.
+	 */
+	return pmd_trans_huge(pmdval) || pmd_is_swap_entry(pmdval);
 }
 
 static int guard_install_pte_entry(pte_t *pte, unsigned long addr,
@@ -1409,8 +1413,12 @@ static int guard_remove_pmd_entry(pmd_t *pmd, unsigned long addr,
 {
 	pmd_t pmdval = pmdp_get(pmd);
 
-	/* If huge, cannot have guard pages present, so no-op - skip. */
-	if (pmd_trans_huge(pmdval))
+	/*
+	 * If huge, cannot have guard pages present, so no-op - skip. The same
+	 * is true of a PMD swap entry, which must not be split just to discover
+	 * there is nothing to remove.
+	 */
+	if (pmd_trans_huge(pmdval) || pmd_is_swap_entry(pmdval))
 		walk->action = ACTION_CONTINUE;
 
 	return 0;
-- 
2.53.0-Meta

