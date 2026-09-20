Received: from outbound.st.icloud.com (st-2005g-snip4-2.eps.apple.com [57.103.79.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A37338836E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789914336; cv=none; b=be1ppnTyIYwBlBvVO60NGQuFdfQUsYGAw6oq10ByFsIo8TqB22g2/MVqBwPGryiTr0gg/+LS67rJgFvRz69mr7hFHUwjtfRhywpP0QkMbHP+qUvg32lBJJZO6k0Ah3VygU7d+4CEF94RuYq2CaC/UeaqeJYzqtQeWzKa64tKQI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789914336; c=relaxed/simple;
	bh=6qsxoupjTP78GIxdHhJCYOj8CeZ1p0lb1VBzMh5O0lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkWYlXPPQJz5K1gllGMhGd9fb4qX8pdGuwLmb2x538iUJUQgK245JaPJjjdhRdk9VaoJrvLCye8vv5KVid595hOt5rbIQPTXCD03OuSBeDKPMvD1cAavr3GYhiMW+ibDgNdf0BqQmDWrLMnfSdWk9RnmCJw8yY1b/itCAhiwQ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=RsdGaTtH; arc=none smtp.client-ip=57.103.79.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="RsdGaTtH"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id E09B61800BD3;
	Sun, 20 Sep 2026 14:25:32 +0000 (UTC)
X-ICL-RepId: 01a0bf35-3eef-76f7-affb-bdfa3850bd61
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKB0MGWQReCEsEQwFbEhVdRUkERxtXAlQXXQZSEnIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXABLWhVVFw4CQh9QH0wWV0NEHxwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoCURxWDVdDVARfUFQRV1ALWQJCD0gKXwdGRB1KG1IDGhlXFlgbRwJFRkRBFEoeCFRbBhQOSVAPAF0DME0dXQ5SBUZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789914333; x=1792506333; bh=UnK6ar0vdpcJ83fX60CmWT9hJg4h0FrTaZNGdd2kMoQ=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=RsdGaTtHGC9EUPcCnhq0NmbX4P8wBR3DB70FjUI/smNOV2Cv2HPD6LPSEAqb3TA7in78d1nxZ6c4h4f27RY6TeP5k/uF8GWxTV/GDE9ctGDlL9an82BOZl0X3dVtBnCuGqTYTbYjpKnYpkoifVBgYGYGH7XZlekoXAJAILomYbpQuf1/U5XfP7ERoQ0GoI1CzQIY0ZlqnQJuzg/uuNFlJ4BIEOR98jOWLK3t0RrrTM/0gCVa0KmmVhlsHjlkEPRHndNOL6VjoVWY1317hrzDVeVhXWpLk60NOuTt/fdTp/U3G2BRywnrdXh7kJkj51MDwzg68RDxqEciBW8acEqWiA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id 507201800BCC;
	Sun, 20 Sep 2026 14:25:27 +0000 (UTC)
From: Zhang Peng <zippermonkey@icloud.com>
Date: Sun, 20 Sep 2026 22:24:15 +0800
Subject: [PATCH 2/4] mm/vmscan: extract folio reclaim freeing from
 shrink_folio_list()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-vmscan-refactor-v1-2-ec04d71cb761@tencent.com>
References: <20260920-vmscan-refactor-v1-0-ec04d71cb761@tencent.com>
In-Reply-To: <20260920-vmscan-refactor-v1-0-ec04d71cb761@tencent.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zhang Peng <bruzzhang@tencent.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMCBTYWx0ZWRfXwCqadkKbx2bn
 xuLwADAYj95SdhAGOAcXFhN62BQQ/9fuBEv2jd+WlGBR3WL9sEfXYHM3PVNKDzMtbiQABc3zCnJ
 f37RwerIpCky4Lc/rfLDwpzI2+rLUe7sa/xHDcP4Z8omIPuKR1s0G+A+hOWSC1ZZ8KFmSisIFIi
 VjVWJY8tyutDINLCooAN6ebF87ukYcZrLkvqgzqwL7gcBvldw9vzDSjM9qu4EXNasZMFzgR6Hcs
 V8Oxe4+fFTh3dKGRMTUQKjakXwknFn61xtcNH15WgbNdwA14piBRxFTsX/A7IDlO4wyf4nd+yUS
 WxzlaGjaek3E4W/EXaZrfmeHN/8rS6vyoS6OAdzTJeQMHr3MAq4wW6xGCXiEpo=
X-Authority-Info-Out: v=2.4 cv=DJaCIiNb c=1 sm=1 tr=0 ts=6aafecdd
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GvQkQWPkAAAA:8 a=g2Kr-gMdqZl5o2Fzx-IA:9 a=QEXdDO2ut3YA:10
 a=J82S1U87d15UFHHUFZS8:22 a=J6hPbylVjWXjVQVODqME:22
X-Proofpoint-GUID: mqXOafUsAJpD_o3H0FeAN_cAHp3fOALx
X-Proofpoint-ORIG-GUID: mqXOafUsAJpD_o3H0FeAN_cAHp3fOALx
X-JNJ: AAAAAAABCiLVt795WGKO9TjdGYKasr/k2G08BTTff7nTgoRri5Fadf2+CvaJwIsim1oQ3fRkUe3nSz3fuXMgumHXqu/G3I2sRagvOgnTCA5BCTvTt0YTclli6Bb6zv+/paJbqwe04vyz6ssCXz049Kmdl+eaBkiJfhSEQZ4nxnbd7SrjlA8MgK0pAUgPmIIw73uJAMul3PE20rO5ygb2TBB4iNxnxJ03/leeuq/3lcY2/Qazz0z5D17S8F9KtayTTKlhKqcr+ttP5lqT7I/31awgzDHcS3oWPAJvfALN2vmz0LqXTyL6wTU4ht4yfvtTxH8CTs1GiTuh+JvmLJs/0pUGFrgPpHoYqqFgJTbVe5hHg/PWx0f+sVeaPkTdx/JHcFDBf/s0Pe3upb4zw7zotTCQfu1//Slp+gzsLqoSlqwFKZcJrjsrtM7w3GjTJdH2Rg0NttbakwpF7PIB6ggkjy3FrJjxAEbFqO+mPPpPGn+4CmecIkc+zukw4hJI27QpNWNXjGt/rSGsXsr4Ul9luR0nt8RYk7xSDX/4pQwQKB0QFd26MjXYsP7h//NTKnIIvzNFqx35ssHyIqzG/ZCCsyjmQmHG/SW5MTwQCCb5jIW5KJELga4p1puzjS/2x0iLttSmAFQGUdsQ5qWSN2mOn5Cfkthq6+7egvu1SwElTA5oXg2cOLRe1HRKxCgrlcSQOhFyW/w/mubniGCfQFiwjTxI7DYXVcv5cl0D8P1cD42dWaIRISV+qj67m/1gmzR/TlrM+cskk2DTggZa5rbhj49ijmdXGOClha9oHOV+mvr7AcvU6tXNoqytqcgHjjPfkrWbnfyJknUGQ6DZ5zRzj28BpZTd/9WKQ+3g+MuNejp7oxrN6+wgH+YEjsx7YrpM2uIoovmkvlSiF412JEylfLf/HtxqueTUzg==

From: Zhang Peng <bruzzhang@tencent.com>

shrink_folio_list() contains a self-contained folio-freeing section:
buffer release, lazyfree, __remove_mapping(), and folio_batch draining.
Extract it into folio_try_reclaim_free() to reduce the size of
shrink_folio_list() and make the freeing step independently readable.

Return an explicit result so the caller retains the distinction between
activating a folio, keeping it on the inactive list, and reclaiming it.
The helper leaves the folio locked when it returns ACTIVATE or KEEP and
consumes it when it returns SUCCESS.

No functional change.

Signed-off-by: Zhang Peng <bruzzhang@tencent.com>
---
 mm/vmscan.c | 171 ++++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 96 insertions(+), 75 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index c6beca88079a..120085dfa2fe 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1177,6 +1177,95 @@ static void folio_activate_locked(struct folio *folio,
 	}
 }
 
+enum folio_reclaim_result {
+	FOLIO_RECLAIM_KEEP,
+	FOLIO_RECLAIM_ACTIVATE,
+	FOLIO_RECLAIM_SUCCESS,
+};
+
+static enum folio_reclaim_result folio_try_reclaim_free(struct folio *folio,
+		struct folio_batch *free_folios,
+		struct scan_control *sc,
+		unsigned int *nr_reclaimed)
+{
+	const unsigned int nr_pages = folio_nr_pages(folio);
+	struct address_space *mapping = folio_mapping(folio);
+
+	/*
+	 * If the folio has buffers, try to free the buffer mappings
+	 * associated with this folio. If we succeed we try to free
+	 * the folio as well.
+	 *
+	 * We do this even if the folio is dirty.
+	 * filemap_release_folio() does not perform I/O, but it is
+	 * possible for a folio to have the dirty flag set, but it
+	 * is actually clean (all its buffers are clean).  This
+	 * happens if the buffers were written out directly, with
+	 * bh_submit(). ext3 will do this, as well as the blockdev
+	 * mapping.  filemap_release_folio() will discover that
+	 * cleanness and will drop the buffers and mark the folio
+	 * clean - it can be freed.
+	 *
+	 * Rarely, folios can have buffers and no ->mapping.  These
+	 * are the folios which were not successfully invalidated in
+	 * truncate_cleanup_folio().  We try to drop those buffers
+	 * here and if that worked, and the folio is no longer
+	 * mapped into process address space (refcount == 1) it can
+	 * be freed.  Otherwise, leave the folio on the LRU so it is
+	 * swappable.
+	 */
+	if (folio_needs_release(folio)) {
+		if (!filemap_release_folio(folio, sc->gfp_mask))
+			return FOLIO_RECLAIM_ACTIVATE;
+
+		if (!mapping && folio_ref_count(folio) == 1) {
+			folio_unlock(folio);
+			if (folio_put_testzero(folio))
+				goto free_it;
+
+			/*
+			 * Rare race with speculative reference. The
+			 * speculative reference will free this folio
+			 * shortly, so we may increment nr_reclaimed here
+			 * and leave it off the LRU.
+			 */
+			*nr_reclaimed += nr_pages;
+			return FOLIO_RECLAIM_SUCCESS;
+		}
+	}
+
+	if (folio_test_lazyfree(folio)) {
+		/* follow __remove_mapping for reference */
+		if (!folio_ref_freeze(folio, 1))
+			return FOLIO_RECLAIM_KEEP;
+		/*
+		 * The folio has only one reference left, which is
+		 * from the isolation. After the caller puts the
+		 * folio back on the lru and drops the reference, the
+		 * folio will be freed anyway. It doesn't matter
+		 * which lru it goes on. So we don't bother checking
+		 * the dirty flag here.
+		 */
+		count_vm_events(PGLAZYFREED, nr_pages);
+		count_memcg_folio_events(folio, PGLAZYFREED, nr_pages);
+	} else if (!mapping || !__remove_mapping(mapping, folio, true,
+							sc->target_mem_cgroup))
+		return FOLIO_RECLAIM_KEEP;
+
+	folio_unlock(folio);
+free_it:
+	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
+	*nr_reclaimed += nr_pages;
+
+	folio_unqueue_deferred_split(folio);
+	if (folio_batch_add(free_folios, folio) == 0) {
+		mem_cgroup_uncharge_folios(free_folios);
+		try_to_unmap_flush();
+		free_unref_folios(free_folios);
+	}
+	return FOLIO_RECLAIM_SUCCESS;
+}
+
 /*
  * shrink_folio_list() returns the number of reclaimed pages
  */
@@ -1564,83 +1653,15 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 			}
 		}
 
-		/*
-		 * If the folio has buffers, try to free the buffer
-		 * mappings associated with this folio. If we succeed
-		 * we try to free the folio as well.
-		 *
-		 * We do this even if the folio is dirty.
-		 * filemap_release_folio() does not perform I/O, but it
-		 * is possible for a folio to have the dirty flag set,
-		 * but it is actually clean (all its buffers are clean).
-		 * This happens if the buffers were written out directly,
-		 * with bh_submit(). ext3 will do this, as well as
-		 * the blockdev mapping.  filemap_release_folio() will
-		 * discover that cleanness and will drop the buffers
-		 * and mark the folio clean - it can be freed.
-		 *
-		 * Rarely, folios can have buffers and no ->mapping.
-		 * These are the folios which were not successfully
-		 * invalidated in truncate_cleanup_folio().  We try to
-		 * drop those buffers here and if that worked, and the
-		 * folio is no longer mapped into process address space
-		 * (refcount == 1) it can be freed.  Otherwise, leave
-		 * the folio on the LRU so it is swappable.
-		 */
-		if (folio_needs_release(folio)) {
-			if (!filemap_release_folio(folio, sc->gfp_mask))
-				goto activate_locked;
-			if (!mapping && folio_ref_count(folio) == 1) {
-				folio_unlock(folio);
-				if (folio_put_testzero(folio))
-					goto free_it;
-				else {
-					/*
-					 * rare race with speculative reference.
-					 * the speculative reference will free
-					 * this folio shortly, so we may
-					 * increment nr_reclaimed here (and
-					 * leave it off the LRU).
-					 */
-					nr_reclaimed += nr_pages;
-					continue;
-				}
-			}
-		}
-
-		if (folio_test_lazyfree(folio)) {
-			/* follow __remove_mapping for reference */
-			if (!folio_ref_freeze(folio, 1))
-				goto keep_locked;
-			/*
-			 * The folio has only one reference left, which is
-			 * from the isolation. After the caller puts the
-			 * folio back on the lru and drops the reference, the
-			 * folio will be freed anyway. It doesn't matter
-			 * which lru it goes on. So we don't bother checking
-			 * the dirty flag here.
-			 */
-			count_vm_events(PGLAZYFREED, nr_pages);
-			count_memcg_folio_events(folio, PGLAZYFREED, nr_pages);
-		} else if (!mapping || !__remove_mapping(mapping, folio, true,
-							 sc->target_mem_cgroup))
+		switch (folio_try_reclaim_free(folio, &free_folios, sc,
+					       &nr_reclaimed)) {
+		case FOLIO_RECLAIM_ACTIVATE:
+			goto activate_locked;
+		case FOLIO_RECLAIM_KEEP:
 			goto keep_locked;
-
-		folio_unlock(folio);
-free_it:
-		/*
-		 * Folio may get swapped out as a whole, need to account
-		 * all pages in it.
-		 */
-		nr_reclaimed += nr_pages;
-
-		folio_unqueue_deferred_split(folio);
-		if (folio_batch_add(&free_folios, folio) == 0) {
-			mem_cgroup_uncharge_folios(&free_folios);
-			try_to_unmap_flush();
-			free_unref_folios(&free_folios);
+		case FOLIO_RECLAIM_SUCCESS:
+			continue;
 		}
-		continue;
 
 activate_locked_split:
 		/*

-- 
2.55.0

