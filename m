Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED433C3BFE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750643; cv=none; b=sRV2bX/K6VT6ciX/YTMz9atviPpSbDHBWZXN1Tn8RDte5qyprJ8H/O6Fhzcz1qf6+G56V/TMBDj9zHsKGHukUWZtqYrDPi6oTgxpxR43D/n665YR20unxRxUzpchM8t92+HZOk3osyyEooPHuvT/fn4rQDltQOPSqALpGwX0s7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750643; c=relaxed/simple;
	bh=FpXccK/FmZ7PSUCHyyxZtaHZ1MQlP3t1C1gITimRrng=;
	h=Mime-Version:From:Subject:Date:Message-Id:Content-Type:To:Cc; b=cPEM0O3IzhZxPByc2j3qvfYI60vaMZgV+Pas+ZDQkAArZ12KX589wuS0ZvSw5C6LaV8pR57eRsbZXoxlzIGkfdMhj2Mv2lQIo/Z3sHUCEv2IRKJwqBNWY9JT85mSByvjLQGBaratiOfcmZjANY4b9LhwGAdIS+8NvoxkimM0qEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=adaj1yXP; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="adaj1yXP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790750620; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mdpGDSuoMrpnOMeORo8QVVPfWWsh5cud9+yMOi/on1E=;
 b=adaj1yXP2VFfsYRGa4FS/AHaib5803hNtnnAQJw0nToW1gadg29L9jrr7XILLrwz0vtSBg
 BMr8LZuY3QcCDwE9GjcAT6jKRXnHjF81sYSJKSWO7XfY/TDaiOAQmSw0pYuBiX8OU73lAY
 ftyqw3NMNzamF9+Zqq9BK2v1Z7fkDirpNkt0HJARIN/njckBCCjjf4s/Elc7O/OjjGjnEL
 8JXIzKBWS8MTYbgR6PbqWptcS314WETPMk/LuFYU13mck9I/7fsLsJ9s/1B2dGjIYaluLB
 d2q36FDERHdh6PJrW8JW7R6fYTl9pgJNe6OB69hsFHnZng0ZUolOcaxO9/U4zw==
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26abcaf9a+290075+vger.kernel.org+lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Subject: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
Date: Wed, 30 Sep 2026 14:43:08 +0800
Message-Id: <20260930064308.58159-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
To: <akpm@linux-foundation.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <david@kernel.org>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	<lizhe.67@bytedance.com>

huge_pmd_share() always takes i_mmap_rwsem for read before looking for a
shareable PMD page table.

That is unsafe for callers that already hold the same mapping lock for
write.  In particular, move_hugetlb_page_tables() takes i_mmap_rwsem for
write to prevent truncation races, then calls huge_pte_alloc() for the
destination address.  If the destination PUD is empty and PMD sharing is
possible, huge_pte_alloc() can call huge_pmd_share(), which then tries to
take the same rwsem for read and can deadlock on itself.

PMD sharing is only an optimization.  If the read side of i_mmap_rwsem
cannot be acquired immediately, fall back to allocating a private PMD
table instead of blocking in the sharing path.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 mm/hugetlb.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cea25773a6c95..75631101a6807 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6995,7 +6995,15 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 	pte_t *spte = NULL;
 	pte_t *pte;
 
-	i_mmap_lock_read(mapping);
+	/*
+	 * Some callers already hold i_mmap_rwsem for write, for example
+	 * move_hugetlb_page_tables(). PMD sharing is only an optimization, so
+	 * fall back to a private PMD table instead of blocking on the same
+	 * rwsem in read mode.
+	 */
+	if (!i_mmap_trylock_read(mapping))
+		goto alloc;
+
 	mapping_rmap_tree_foreach(svma, mapping, idx, idx) {
 		if (svma == vma)
 			continue;
@@ -7024,8 +7032,10 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 	}
 	spin_unlock(&mm->page_table_lock);
 out:
-	pte = (pte_t *)pmd_alloc(mm, pud, addr);
 	i_mmap_unlock_read(mapping);
+
+alloc:
+	pte = (pte_t *)pmd_alloc(mm, pud, addr);
 	return pte;
 }
 
-- 
2.20.1
