Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6743AE6FC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668877; cv=none; b=Xm3nh+x70bviyAPv+ywGhnejyFtlfEy6yUn0bhhmBCZxg/W2gVITRW/y4siKDe8Dtc2Cz8hB4M/PQHiJeawn+MhhtujLNfHKtqa9l6x4YOfVChBlnJB76xvXzktTV7M/ECifvmMeq89kxITJ5HaJUnBCinlvcYD8KwnZj66VSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668877; c=relaxed/simple;
	bh=YV/SA1BURlusuRjw0zXsp8za2UA1g76XW98XgjEGiZk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=sJ81JjvLZ4zlGUwuj7/E5n2m239YWlPbKn2e2qYjW5XaMamHGWzB9cTw0jiDpX3YA0pGGh4KkODn2U/dRbyRHIxtbz5Sh/mSOBfkb39o1s1Gv5OJW+pk256iFXY5GtQtUkS7iog+aEHofrxry7vbxuyQ6y7HKHsIBd+aY4limgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=nzCRKd+I; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="nzCRKd+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790668865; bh=ly3nDUIqD4kXn9hZ6TwQqfmz9JPC5wf0TiGErgoezks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nzCRKd+I1gC+yrl5fT9gQVbTqyVXL/cVii/SRCM3ZIT8qcQGQjz8Hon0i8kQG+Pp0
	 NEkMr00pi5Glmi+2bJ8byyLTOCfykmOSPWV/YUJP7tebeOqyMQgz2gqtf9s+WetAh6
	 aZ6mtGDjLWLY3MWG5ZyVLVNTibOWSd2aGaR4Ias8=
Received: from lzk-B860M-AORUS-PRO-WIFI7 ([2409:8a28:a83:5ba1:514f:5353:e14b:594e])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 4008050; Tue, 29 Sep 2026 16:01:00 +0800
X-QQ-mid: xmsmtpt1790668860ty55e9eiy
Message-ID: <tencent_6DE2E1B379FAD189CEFE60DBA83A4C1DF005@qq.com>
X-QQ-XMAILINFO: Nqv6BipjixTcZeYFyZves1ffgjsrPWdKwazucvA0eWb4ZVNnUHqqop4zQM+6k4
	 LLteYgw7z9J2uOtTLEJmoQjP2PL18GG+AbqHfFnxXl4i85TgNFDW31qkb7yoI3ztps/+Cfn5Dc/q
	 4uxewVTeEfX4QSAhSEx9tuBa9TT4WF+bAHlKlGOoDNxzUjq75jRAA3klYnXUa+LWzYRtAX0Cd3kn
	 M0/jj33lIDGKvSGQgn4Ab/QLkO8rcRuxvUzEkCl0S0UKb+Jn7bsvEAabNk6W/liwUwCYBLC4FyQC
	 +nR90nSDg3RMpL1zzgy/f/x9Ba+ee5WJ3h1UIGVJ0aKlDcw0seRkhdSMVJjd2FtKCUd+CFowQu9K
	 dQ24gtWV5ZB81VhS+frGNjLbbU9YuxDQHdxDJrrF8+65KmLNoLc2H5rCpvNyAldlvs1EUK8nDUkR
	 taJ3D4dYLxF/TGVPrr+SLXD3bM1pyUrkXiKwZ1hdbpAVhlUlL8a39Ddz7SZCutATSLZgYHrC6cNI
	 /i5mXOjenx8zwaP3g6eIlrGtgUrqiP+E73caWkFebYWTsCgYNt61b/Qa3YPsEqDgz4m1v3dp4l1l
	 5fKsD1PUM+xGoSuvyS0Kys54dSObSPo2bcOhM1l43hu7BHRiQDozipIEWDXQvRr3J7jMccftljWf
	 uuqkmnxZJ474KRYNUmPNAmExQvO4lDvatE6ySI0Nnux9RN6KPDUNID253TC7wwGqDVFblMWXdsuA
	 IhmmfKdgwoCjdDVV01d4nF63rc7mzljcRdb7GopOGEelGn1QUdfmccBmKA1+rnNpR/5rbBsWIhXs
	 JFUfLVhG2Bew0vpY5pZdUPybEHTxN0qAHQjyh8aHtMnVUfkpIlyCQ/UuNIwmi2P4k5I0TJMYCkNY
	 KETKpK+v6Rparr7WZmNDRVPwV3MGUbBW5iURyFBaDh2PZwtGxulXJs/kv4ycrOjiheau0BO8voAf
	 HclfTAOsmoaauMVw479d/16STszxFO9IYE6IWzCROTUMVa1y55XlwBBq78L/gbWWkmurVrus8u/v
	 jDyb7hVrjd5KxQL4Rrkz7As84+SP+M+TIEZlznqnc5p6MTnzhhqma7LNSRvHscC2TXhe/adCHIgK
	 tAcSePkZWskaSejlDNo8Zbt9QuECFY53OLOUo/enw4FniVWNvkA2bDMyy7lsRRJSg1Dxc8QmxLnU
	 ZpWczCei0ibF9U76iqEikyJLsQV1c735NcwAM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Zongkun Lei <leizongkun@qq.com>
To: linux-mm@kvack.org
Cc: Zongkun Lei <leizongkun@qq.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/6] mm/memory-failure: handle swapcached hugetlb folios
Date: Tue, 29 Sep 2026 16:00:57 +0800
X-OQ-MSGID: <11b04f7647e730e74d7eda8d29acc6d5fb762e57.1790663399.git.leizongkun@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790663399.git.leizongkun@qq.com>
References: <cover.1790663399.git.leizongkun@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Anonymous hugetlb folios can now sit in the swap cache (swap-out
writeback window, cached copy after swap-in), a state memory failure
never had to handle before.  Two gaps:

1. try_to_unmap() routes every hugetlb folio to
   try_to_unmap_poisoned_hugetlb_one(), which requires TTU_HWPOISON.
   But unmap_poisoned_folio() clears TTU_HWPOISON for a dirty
   swapcache folio -- its mappings must be replaced with swap entries,
   exactly like for a 4K swapcache folio, so the swap accounting stays
   intact and the fault path gets to kill the owner.  Routing such a
   folio to the poisoned handler fires its VM_WARN_ON_ONCE and would
   install hwpoison entries on top of live swap state.  Route hugetlb
   folios by flag instead: TTU_HWPOISON set -> the poisoned handler;
   cleared -> try_to_unmap_swap_hugetlb_one().

2. me_huge_page() has no swapcache case: a clean poisoned hugetlb
   folio in the swap cache falls into the truncate path, which evicts
   it (the swap address space has no error_remove_folio).  The folio
   is never returned to the hstate pool (a silent 2M pool leak) and
   the poison marker is lost, so a later fault would swap possibly
   corrupt data back in.  Mirror me_swapcache_dirty(): keep the
   poisoned folio in the swap cache and return MF_DELAYED, so the
   swap-in path sees folio_test_hwpoison() and kills the accessor.

Signed-off-by: Zongkun Lei <leizongkun@qq.com>
---
 mm/memory-failure.c | 19 +++++++++++++++++++
 mm/rmap.c           | 32 ++++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index a8b03e2920ba..0c31c8ab5542 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1151,6 +1151,25 @@ static int me_huge_page(struct page_state *ps, struct page *p)
 	struct address_space *mapping;
 	bool extra_pins = false;
 
+	/*
+	 * A hugetlb folio reaches the swap cache only via hugetlb
+	 * swap-out.  Keep a poisoned one there so that the swap-in
+	 * fault path intercepts folio_test_hwpoison() and kills the
+	 * accessor.  The truncate path below would evict a clean one
+	 * (the swap address space has no error_remove_folio), losing
+	 * both the folio (it is never returned to the hstate pool) and
+	 * the poison marker, so a later fault would silently swap
+	 * possibly-corrupt data back in.  Mirror me_swapcache_dirty().
+	 */
+	if (folio_test_swapcache(folio)) {
+		folio_clear_dirty(folio);
+		folio_unlock(folio);
+		/* The swap cache pin is intentionally retained. */
+		if (has_extra_refcount(ps, p, true))
+			return MF_FAILED;
+		return MF_DELAYED;
+	}
+
 	mapping = folio_mapping(folio);
 	if (mapping) {
 		res = truncate_error_folio(folio, page_to_pfn(p), mapping);
diff --git a/mm/rmap.c b/mm/rmap.c
index 2ce54cb5ff20..a88c911e8463 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1991,8 +1991,9 @@ static bool try_to_unmap_poisoned_hugetlb_one(struct folio *folio,
 	pte_t pteval;
 
 	/*
-	 * The try_to_unmap() is only passed a hugetlb folio in the case
-	 * where the hugetlb folio is poisoned.
+	 * try_to_unmap() routes a hugetlb folio here only for memory
+	 * failure with TTU_HWPOISON set; a poisoned folio kept in the
+	 * swap cache is routed to try_to_unmap_swap_hugetlb_one() instead.
 	 */
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hwpoison(folio), folio);
 	VM_WARN_ON_ONCE(!(flags & TTU_HWPOISON));
@@ -2199,8 +2200,10 @@ static bool ttu_anon_folio(struct vm_area_struct *vma, struct folio *folio,
  * with a swap entry covering the whole folio; for a file-backed folio the
  * PTE is simply cleared, the swap anchor lives in the hugetlbfs page
  * cache instead (shmem-style).  Called from the hugetlb reclaim path
- * (hugetlb_reclaim_pages()) with the folio lock held; an anonymous folio
- * is swapbacked with its swap slots allocated.
+ * (hugetlb_reclaim_pages()) and, via try_to_unmap(), from memory failure
+ * for a poisoned folio that is kept in the swap cache (see
+ * unmap_poisoned_folio()); the folio lock is held in all cases, and an
+ * anonymous folio is swapbacked with its swap slots allocated.
  *
  * Keep in sync with ttu_anon_swapbacked_folio().
  */
@@ -2567,13 +2570,30 @@ static int folio_not_mapped(struct folio *folio)
 void try_to_unmap(struct folio *folio, enum ttu_flags flags)
 {
 	struct rmap_walk_control rwc = {
-		.rmap_one = folio_test_hugetlb(folio) ?
-				try_to_unmap_poisoned_hugetlb_one : try_to_unmap_one,
+		.rmap_one = try_to_unmap_one,
 		.arg = (void *)flags,
 		.done = folio_not_mapped,
 		.anon_lock = folio_lock_anon_vma_read,
 	};
 
+	/*
+	 * try_to_unmap() is passed a hugetlb folio only by memory failure.
+	 * With TTU_HWPOISON the mappings are replaced with hwpoison
+	 * entries.  Without it the folio is a poisoned folio that is kept
+	 * in the swap cache (unmap_poisoned_folio() cleared TTU_HWPOISON),
+	 * so the mappings are replaced with swap entries, exactly like for
+	 * a 4K swapcache folio: the swap accounting stays intact and the
+	 * fault path gets to kill the owner.
+	 */
+	if (folio_test_hugetlb(folio)) {
+		if (flags & TTU_HWPOISON)
+			rwc.rmap_one = try_to_unmap_poisoned_hugetlb_one;
+		else if (WARN_ON_ONCE(!folio_test_swapcache(folio)))
+			return;
+		else
+			rwc.rmap_one = try_to_unmap_swap_hugetlb_one;
+	}
+
 	if (flags & TTU_RMAP_LOCKED)
 		rmap_walk_locked(folio, &rwc);
 	else
-- 
2.53.0

