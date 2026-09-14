Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2417245D939
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389120; cv=none; b=eMtEgUtOMy6OLLm5SFJkqm+3Vjbg3PpDgyCtRHYyd5ipYIJaRJZ1O4kr8I6QcblVDz4T2B8t7fZBWFZULJdIIuAOcbMz4XzbN9ZZinRDl+jC0VnsKMQlhSoNArW4cRgyHoSn7Ajx3CeCOyKOaKShoUBV4xpnNJvzxrlTuNPibsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389120; c=relaxed/simple;
	bh=O3Mn4KnTxiYaTlhEiHGB+/12dl1tDr6TCxd6G0YbQtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFu6TXzdcFQjdCe6JjLHS0AojXOVnYZ3ppD81Dk4AYu63veRiKrJ76Sk0UMR2kcruoh9GeIH/pO/ANTlGNbmwkfuzTSQlhy4RbB6HFdlLWn2a6FaRVobhB7BmEVNgDVWsil3P/G8KN+3S/w2rB+HbaamHt/5vDzdjiRoRjabmKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V+pRhF7b; arc=none smtp.client-ip=91.218.175.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V+pRhF7b"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O3Mn4KnTxiYaTlhEiHGB+/12dl1tDr6TCxd6G0YbQtw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389114; v=1; x=1789993914;
 b=V+pRhF7bePafelNnSWtdASntDuFZFJAL1WKkfdOKocMP4eA5yguWiFjSAONjB/RL+TFOvuxA
 1pUjuwHkNd53hSoL8gVGXKQiJZbxim33Be/UwgM/Yj/3zwvx/got9n4cFIQ6OFDPr0LXaNw6Jcr
 q5z6cBm8Jm0bnf1lUyAKLmIA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 849d2883d7f4742b;
	Mon, 14 Sep 2026 12:31:53 +0000
X-Mizu-Trace-ID: 849d2883d7f4742b
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
Subject: [RESEND v7 20/29] mm/madvise: skip PMD swap entries for MADV_COLD and MADV_PAGEOUT
Date: Mon, 14 Sep 2026 05:28:10 -0700
Message-ID: <20260914122950.3283997-21-usama.arif@linux.dev>
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

A swapped-out THP has no resident folio to deactivate or reclaim, which is
also the conclusion the PTE path reaches when it walks the swap entries and
skips every one.

madvise_cold_or_pageout_pte_range() gets there the long way round:
pmd_trans_huge() is false for a PMD swap entry, so it falls out of the huge
branch and tries to map a PTE table that a non-present PMD does not have.

The entry can also appear after that first, lockless test, so re-check
under the PMD lock; otherwise a PMD that turned into a swap entry while
pmd_trans_huge_lock() was being taken trips the VM_WARN_ON_ONCE() that
expects a migration or device-private entry.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/madvise.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index 70acb39b8b3dd..d3b5ed7e3cffb 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -385,6 +385,15 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 					!can_do_file_pageout(vma);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	/*
+	 * Swapped-out THPs have no resident folio to deactivate or reclaim.
+	 * Avoid descending into or splitting a PMD swap entry.
+	 */
+	if (pmd_is_swap_entry(*pmd)) {
+		walk->action = ACTION_CONTINUE;
+		return 0;
+	}
+
 	if (pmd_trans_huge(*pmd)) {
 		pmd_t orig_pmd;
 		unsigned long next = pmd_addr_end(addr, end);
@@ -395,6 +404,9 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 			return 0;
 
 		orig_pmd = *pmd;
+		if (pmd_is_swap_entry(orig_pmd))
+			goto huge_unlock;
+
 		if (unlikely(!pmd_present(orig_pmd))) {
 			VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
 					!pmd_is_device_private_entry(orig_pmd));
-- 
2.53.0-Meta

