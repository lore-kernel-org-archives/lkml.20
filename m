Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6AE448D03
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761278; cv=none; b=thoJ4Sa7Pkmzzp0ZNimCDcqUQsJuJcACHKbkXHtbnJ/c0Xb3FIN5B5HHg9FtJ23JZBTog2kz7e6IZdmzLLZzlx60SUpVpoP2ZU/Eq3WpQDxRZfOpzB2Dn3TZD0PCTZomDRwwF6k/LIjZI37fElLokPPLOtNboPIpOguCDvknMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761278; c=relaxed/simple;
	bh=UxtP3UPza9uNecaw1yFqAlFi2i84AUvFpnDYRucvx+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4StO5sshbzf3BQqakhMqCJ1gd9Ishk6ljElUyi7RRWzE5nw8KdD9tPvZvtM0dRR2NUD7q07Y/U4P2vRJdJVedZlltGTD6h1r+ov81jY+TuHD0d3u3NrHOi0s5POUbzpdOswBahNryoQ+iuXL2qV8d93KALj/A7V/jJJ/tLHceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=hX5xXl7b; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e4I4TC4D; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="hX5xXl7b";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e4I4TC4D"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 09DA3EC0038;
	Wed, 26 Aug 2026 12:21:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 26 Aug 2026 12:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787761273; x=
	1787847673; bh=HbFogDQUqiCSfuewrPmwAWRl8NqcTYitqpsCtwQzicU=; b=h
	X5xXl7beBITHeeUvkfehphJkJjs7Eu+u9g3iPbV43qXhJ98ZN9gCFY8KSCXktfc4
	YVl3E312cabApWB/k/A9YPY+1tcNBEoqqfrPcR7xl5CT5pp/JADjncWSXhV3WE1r
	OlE8o8/+/dbsWyz8rLJXIe8c3qTH9qTVfg78J8re22Tp3bbTeAGhrY0ZNO0lMEmJ
	G2Nd12jg64ooxJ3FTDIAHKJESPsuwvWjrdm45M+NBmpR7Q7sjooKWeYowPWp85hb
	1/ZM1CfhNlYfOg8TkSJ0IAtEwudugAoxQb53rvJczdOHNeQjN02pIDF7w2Mz7K8w
	2qX+eCL0UPAtjarrIs/Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787761273; x=1787847673; bh=H
	bFogDQUqiCSfuewrPmwAWRl8NqcTYitqpsCtwQzicU=; b=e4I4TC4Dg6vSUTOON
	pIYNd3s5ogbZDyJ74DSfdMmNgsgwY6iIbcOvaIoQhFu/yueD+qa+WgjHvg8wlJJe
	zfiT/1TMFNDt+qiYxx7PcTs7X3hdWALAqvdgGkqdgOBhRQX0jtZV0UtmBcX55+AT
	g2+05U014BubHX4wCuM89F5o56EMLcE0BtuS4WU4l/xMy11fN5jkXR79aUTpLXuA
	K0XAOKiuqWqN85OaP5FGvkscMXqhUDZf6X7zsQgqL+aJCac9Mze1Im7gW/VINhAP
	cqL+BdqsTX5iBibZLLw/F/VGYxxeqbjceIlzPzfmE6oKWvwvJTWBBMS1ZXTSg7z1
	406UQ==
X-ME-Sender: <xms:eBKPahxzo5jPb1QBsfxOTLa4IxBkJau__lnZFaYR3ZInZi2ZOPMI0A>
    <xme:eBKPatPpF4YBocktvvNX323GTsEFnRvQkpGW673-TPZTx15ZSP3OJ_m2wue4XcW4v
    QWFTO6T_FcG3rQg2vH-MyUHq-8hKkzcqa8a6dS79Yk7wXFfsMckDw>
X-ME-Received: <xmr:eBKPahe9p9_mSA3PIoQbVTOoq9THPYkoeksPNIg8taLWYOsCAXTe-NvinYc>
X-ME-Proxy-Cause: dmFkZTEpX8HBQysEAMlAbdyKFX4BLzWtS7+Qo1RjxAJeMJnS381384CQaxM92QA8W5J6jo
    7r0RHbsPcTs1IpTXqcOu2ofgimA8w2hMK3OeOMvPUWs2NDJNBlDL/23E29uU3eWq90a8Ny
    uayj7GqONoh0NEQ91mQ/H+TE3rTPuVZ+wfrdHbeyaEyRe40ZIUYJyXTHqnubEDskXnqfPu
    FIQsvLmT+4mxeisAsg0TmWv4Y7l9NdKef8tTMihpDmjKvNxij8lw310+ofBfGEkzSLqnuN
    AyozbfZUQr702Kz+RkXguKuGQfBCnKcQhC5EFdpLjS6L6jWqh1sGvO+4Vl+gX27JPRP8CC
    ZugFusXp6cdUu6aFxt4ihsFEeQsHpfMqFD2WIyBRpBjs6vrkwLZjumNr704QfNAegyDXmb
    bgnCWGCyShfc6lI47NAlmD6PpdSizmJYpB5q0a47cWEcF3kilhPKSlsjtHoo9AJr3IDvFd
    1sCkNxb2bff5/nwxJwcRaywBnBLxIAIZ81NuUz38JVQtnxO4LoZvAAok+FmHFucDeP8dIy
    N6NNUe64csqK7I4cW7OnfmkW0SdkkRFZdnZAMaUGoxKcPHERVQ9iQyylfckgeVEPUG7KYi
    wzTYPjg7q9hDjaxJEJ2uw1hx6/Lk+6DXyOhwd0C+szYvJz2/t8qGBrLU4rZw
X-ME-Proxy: <xmx:eBKPap4FKFRGN3qCZV980bFsDhYj16t6A2r4kKXsa7IaQga_DDiGmA>
    <xmx:eBKPahILfgj2l3sleaQGacwaTbq4c6kLY-tuYJz09OrexjK5hWskuQ>
    <xmx:eBKPal5-XUmvaJQwU8uKzXJtA9BP-iXBBpsdwL_QPUvjP8bOci5Zhg>
    <xmx:eBKPaoZhnonbcfHxPCCUrwJAfO6iJmfZC3v0qGJ0nLPEnUlf0zsoyw>
    <xmx:eRKPapYYnbV28KYkcKas-4UpW908Qo0ubyXNK3SyH_AhtbsNtRzt1DLh>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 12:21:11 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hannes@cmpxchg.org,
	usama.arif@linux.dev
Cc: lance.yang@linux.dev,
	ziy@nvidia.com,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	balbirs@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 3/5] mm/huge_memory: reduce indent level in __folio_freeze_and_split_unmapped()
Date: Wed, 26 Aug 2026 17:20:59 +0100
Message-ID: <20260826162101.1314941-4-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162101.1314941-1-kirill@shutemov.name>
References: <20260826162101.1314941-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

Trivial cleanup: short-circuit the function if folio_ref_freeze() fails.
It save an indent level for the whole function.

No functional change intended.

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/huge_memory.c | 233 +++++++++++++++++++++++------------------------
 1 file changed, 115 insertions(+), 118 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index c84e8cbc986d..36e90756e83b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3930,132 +3930,129 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 {
 	struct folio *end_folio = folio_next(folio);
 	struct folio *new_folio, *next;
+	struct swap_cluster_info *ci = NULL;
 	int old_order = folio_order(folio);
+	struct lruvec *lruvec;
 	int ret = 0;
 
 	VM_WARN_ON_ONCE(!mapping && end);
 
-	if (folio_ref_freeze(folio, folio_cache_ref_count(folio) + 1)) {
-		struct swap_cluster_info *ci = NULL;
-		struct lruvec *lruvec;
-
-		/* Take off the deferred split queue while frozen and memcg set */
-		folio_unqueue_deferred_split(folio);
-
-		/*
-		 * deferred_split_scan() takes the folio off the queue before it
-		 * splits it, so the unqueue above finds an empty list and
-		 * leaves PG_partially_mapped set.
-		 * Clear it here: the flag does not survive the split.
-		 */
-		if (folio_test_partially_mapped(folio)) {
-			folio_clear_partially_mapped(folio);
-			mod_mthp_stat(old_order,
-				      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
-		}
-
-		if (mapping) {
-			int nr = folio_nr_pages(folio);
-
-			if (folio_test_pmd_mappable(folio) &&
-			    new_order < HPAGE_PMD_ORDER) {
-				if (folio_test_swapbacked(folio)) {
-					lruvec_stat_mod_folio(folio,
-							NR_SHMEM_THPS, -nr);
-				} else {
-					lruvec_stat_mod_folio(folio,
-							NR_FILE_THPS, -nr);
-				}
-			}
-		}
-
-		if (folio_test_swapcache(folio)) {
-			if (mapping) {
-				VM_WARN_ON_ONCE_FOLIO(mapping, folio);
-				return -EINVAL;
-			}
-
-			ci = swap_cluster_get_and_lock(folio);
-		}
-
-		/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
-		if (do_lru)
-			lruvec = folio_lruvec_lock(folio);
-
-		ret = __split_unmapped_folio(folio, new_order, split_at, xas,
-					     mapping, split_type);
-
-		/*
-		 * Unfreeze after-split folios and put them back to the right
-		 * list. @folio should be kept frozon until page cache
-		 * entries are updated with all the other after-split folios
-		 * to prevent others seeing stale page cache entries.
-		 * As a result, new_folio starts from the next folio of
-		 * @folio.
-		 */
-		for (new_folio = folio_next(folio); new_folio != end_folio;
-		     new_folio = next) {
-			unsigned long nr_pages = folio_nr_pages(new_folio);
-
-			next = folio_next(new_folio);
-
-			zone_device_private_split_cb(folio, new_folio);
-
-			folio_ref_unfreeze(new_folio,
-					   folio_cache_ref_count(new_folio) + 1);
-
-			if (do_lru)
-				lru_add_split_folio(folio, new_folio, lruvec, list);
-
-			/*
-			 * Anonymous folio with swap cache.
-			 * NOTE: shmem in swap cache is not supported yet.
-			 */
-			if (ci) {
-				__swap_cache_replace_folio(ci, folio, new_folio);
-				continue;
-			}
-
-			/* Anonymous folio without swap cache */
-			if (!mapping)
-				continue;
-
-			/* Add the new folio to the page cache. */
-			if (new_folio->index < end) {
-				__xa_store(&mapping->i_pages, new_folio->index,
-					   new_folio, 0);
-				continue;
-			}
-
-			VM_WARN_ON_ONCE(!nr_shmem_dropped);
-			/* Drop folio beyond EOF: ->index >= end */
-			if (shmem_mapping(mapping) && nr_shmem_dropped)
-				*nr_shmem_dropped += nr_pages;
-			else if (folio_test_clear_dirty(new_folio))
-				folio_account_cleaned(
-					new_folio, inode_to_wb(mapping->host));
-			__filemap_remove_folio(new_folio, NULL);
-			folio_put_refs(new_folio, nr_pages);
-		}
-
-		zone_device_private_split_cb(folio, NULL);
-		/*
-		 * Unfreeze @folio only after all page cache entries, which
-		 * used to point to it, have been updated with new folios.
-		 * Otherwise, a parallel folio_try_get() can grab @folio
-		 * and its caller can see stale page cache entries.
-		 */
-		folio_ref_unfreeze(folio, folio_cache_ref_count(folio) + 1);
-
-		if (do_lru)
-			lruvec_unlock(lruvec);
-
-		if (ci)
-			swap_cluster_unlock(ci);
-	} else {
+	if (!folio_ref_freeze(folio, folio_cache_ref_count(folio) + 1))
 		return -EAGAIN;
+
+	/* Take off the deferred split queue while frozen and memcg set */
+	folio_unqueue_deferred_split(folio);
+
+	/*
+	 * deferred_split_scan() takes the folio off the queue before it
+	 * splits it, so the unqueue above finds an empty list and
+	 * leaves PG_partially_mapped set.
+	 * Clear it here: the flag does not survive the split.
+	 */
+	if (folio_test_partially_mapped(folio)) {
+		folio_clear_partially_mapped(folio);
+		mod_mthp_stat(old_order,
+			      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
 	}
 
+	if (mapping) {
+		int nr = folio_nr_pages(folio);
+
+		if (folio_test_pmd_mappable(folio) &&
+		    new_order < HPAGE_PMD_ORDER) {
+			if (folio_test_swapbacked(folio)) {
+				lruvec_stat_mod_folio(folio,
+						      NR_SHMEM_THPS, -nr);
+			} else {
+				lruvec_stat_mod_folio(folio,
+						      NR_FILE_THPS, -nr);
+			}
+		}
+	}
+
+	if (folio_test_swapcache(folio)) {
+		if (mapping) {
+			VM_WARN_ON_ONCE_FOLIO(mapping, folio);
+			return -EINVAL;
+		}
+
+		ci = swap_cluster_get_and_lock(folio);
+	}
+
+	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
+	if (do_lru)
+		lruvec = folio_lruvec_lock(folio);
+
+	ret = __split_unmapped_folio(folio, new_order, split_at, xas,
+				     mapping, split_type);
+
+	/*
+	 * Unfreeze after-split folios and put them back to the right
+	 * list. @folio should be kept frozon until page cache
+	 * entries are updated with all the other after-split folios
+	 * to prevent others seeing stale page cache entries.
+	 * As a result, new_folio starts from the next folio of
+	 * @folio.
+	 */
+	for (new_folio = folio_next(folio); new_folio != end_folio;
+	     new_folio = next) {
+		unsigned long nr_pages = folio_nr_pages(new_folio);
+
+		next = folio_next(new_folio);
+
+		zone_device_private_split_cb(folio, new_folio);
+
+		folio_ref_unfreeze(new_folio,
+				   folio_cache_ref_count(new_folio) + 1);
+
+		if (do_lru)
+			lru_add_split_folio(folio, new_folio, lruvec, list);
+
+		/*
+		 * Anonymous folio with swap cache.
+		 * NOTE: shmem in swap cache is not supported yet.
+		 */
+		if (ci) {
+			__swap_cache_replace_folio(ci, folio, new_folio);
+			continue;
+		}
+
+		/* Anonymous folio without swap cache */
+		if (!mapping)
+			continue;
+
+		/* Add the new folio to the page cache. */
+		if (new_folio->index < end) {
+			__xa_store(&mapping->i_pages, new_folio->index,
+				   new_folio, 0);
+			continue;
+		}
+
+		VM_WARN_ON_ONCE(!nr_shmem_dropped);
+		/* Drop folio beyond EOF: ->index >= end */
+		if (shmem_mapping(mapping) && nr_shmem_dropped)
+			*nr_shmem_dropped += nr_pages;
+		else if (folio_test_clear_dirty(new_folio))
+			folio_account_cleaned(new_folio, inode_to_wb(mapping->host));
+		__filemap_remove_folio(new_folio, NULL);
+		folio_put_refs(new_folio, nr_pages);
+	}
+
+	zone_device_private_split_cb(folio, NULL);
+	/*
+	 * Unfreeze @folio only after all page cache entries, which
+	 * used to point to it, have been updated with new folios.
+	 * Otherwise, a parallel folio_try_get() can grab @folio
+	 * and its caller can see stale page cache entries.
+	 */
+	folio_ref_unfreeze(folio, folio_cache_ref_count(folio) + 1);
+
+	if (do_lru)
+		lruvec_unlock(lruvec);
+
+	if (ci)
+		swap_cluster_unlock(ci);
+
 	return ret;
 }
 
-- 
2.54.0

