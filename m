Received: from outbound.st.icloud.com (st-2005k-snip4-8.eps.apple.com [57.103.79.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808EF37CD20
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789914354; cv=none; b=gdM6aD2VpOGHLBWlX9COlIeqAz47RQ8e1WKCgUJTHsaiiu4nc5/yRKqBtayfBeMVAyYiv3GiplMclzNz9TsedFCJ1h1VVZjlhX7xgPZ0wEqTdMuVlt2fWDiD6mBJ2U4iWfUno/RW7jw9/S890tCfPScCEAeOrO9MC3KIKckn6K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789914354; c=relaxed/simple;
	bh=tEo6bVXi8ijmfaQJGFgnvFbO3uAtkG5mOc5M7f9AKhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GYwO2fmn9clNrxJwBzw2rm8zz7CJMUmVkmTx/cSPyYecRfGaluGV2mZi2s0RsIQagDtW4Ng5g3ZHuHA2MEPs2iGrl8ZPNU6Xw3Z4iywQRPxGjaWv+tpa4jPiz1TIRltU5OnO0DT5bMXivmPAgBu1L6CT4sGlxrg1onHp5FHnMLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=0DjttDuk; arc=none smtp.client-ip=57.103.79.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="0DjttDuk"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id DAFC81800298;
	Sun, 20 Sep 2026 14:25:51 +0000 (UTC)
X-ICL-RepId: 01a0bf35-88f9-7723-a13b-ddac2a20e3f7
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKB0MGWQReCEsEQwFbEhVdRUkERxtXAlQXXQZSEnIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXABLWhVVFw4CQh9QH0wWV0NEHxwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoCURxWDVdDVARfUFQRV1ALWQJCD0gKXwdGRB1KG1IDGhlXFlgbRwJFRkRBFEweCFRbBhQOSVAPAF0DME0dXQ5SBUZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789914352; x=1792506352; bh=y+4LxcE0ZNzlIfE6jsP/r+Z9z994JbQce9sXcvnyNA8=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=0DjttDukd+i3mo1A1I2YF7SyteZe/7bum5j+GBddC5P0ROkasuWaAkywRCpHku72oPNSZz2SGxUjajVIRh7JommRICypJYrbZNZG3lfJOGAm9fUQOLwfUv5LaWMD31LtCShooxE0IuBz7ckhptCUtDuH7wCV/fMflXMKwWwN1zLbXTR6wDnVtYgvsLzKaon53p5qhDBy0tJYFvhmydaSPJ9I2CuaP6snHI4NwiXOMe7Ao0m0PMLSs6/Q58OVs8Zwmy7LRHlJN+1z+WcZyERmm9OmloBj59F4LQI+gA+zCCcwUqhtWlNONp0gIDxZTvp9NBiLOwdKyBcnWJRk8t+IlA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id AE6C618002AE;
	Sun, 20 Sep 2026 14:25:41 +0000 (UTC)
From: Zhang Peng <zippermonkey@icloud.com>
Date: Sun, 20 Sep 2026 22:24:17 +0800
Subject: [PATCH 4/4] mm/vmscan: extract folio unmap logic into
 folio_try_unmap()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-vmscan-refactor-v1-4-ec04d71cb761@tencent.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMCBTYWx0ZWRfX7qNKLx881oKO
 Bp+LChKGf2VW5KvHE+LIrzqNhgkEFk+8+IT8an4O1FJ7uX+mrx7XS3BSa9pvZZrRFo0ujF3KTr7
 PfYqGylSL61VuAq1uHGnPvG8GJVhl9cTlTs3h1rNsx3KDgyXy9eAQ8g5Y8IQhH1DXKZhWGgRfkh
 wnqHg1ZriRyjUdeHm/1FtRTUHY6jfPg1d6PFEdpCxFkIEfnPZ6ME+r1boiadHkzu6yVr7F8DAx2
 7yePeiwa+eH5ONJJRiVMrpblmeQKWgtVeWcJADZbQDqDOg8dsRQydpYTYyp46SOg5bTMTkzE/dz
 LD1EjemTVVxJkwLMAgI4un8rxYU/d/N2WNQ7wssnZrkpHx6ZpN3X/mK0g8XBNk=
X-Proofpoint-GUID: hsmcGXTx_XoKWvLdLUk8nhQZ7yr68fs8
X-Proofpoint-ORIG-GUID: hsmcGXTx_XoKWvLdLUk8nhQZ7yr68fs8
X-Authority-Info-Out: v=2.4 cv=aOr9aL9m c=1 sm=1 tr=0 ts=6aafecf0
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GvQkQWPkAAAA:8 a=VwQbUJbxAAAA:8 a=Oe3AU6d8b7fpH-gKf6sA:9 a=QEXdDO2ut3YA:10
 a=J82S1U87d15UFHHUFZS8:22 a=J6hPbylVjWXjVQVODqME:22
X-JNJ: AAAAAAABexOQ5G1UmVTm5NChbqSVvjY4dKgF+1/+LdvMSuutUNKOVn8DqWDfmzPGkYwCgcYUrOXT1Zy/EUORdYYUYEV1GN5Rhh/0Sh02N+/PV12GIHCgjZcr4DQx8cUi32GomQIUICU6YR2OVOy7coC8/rEX3AmQS3WV62G+EGBQjP1lY3rO/solOdeBJyyPZBBBSktw7jjhGkSJpXm5G1Cogosjl3kDnbRRYMUeVXtJvVIkhO6P12Onk76bZD0LK04/9Atv2qGO1hbAnTJmGr+iQqPDLOTTmUfxX+4qsMGPHFLaSIlylxdYTQ/9fuKmnvVVdhddWZMx8ZR5PRH1RQE4crSD7oa81BgtUolF0pLrnMJ1KaYo6gwr4zj0ChxqQFyvskztMJ+BOmRXdHp6J2YYuQ/e9quypXxktlpwLghBzV8z3cvXwBwhWdC6i08ixkMB5ciyFILygON0h7NWockcRamEEiDBw+UZKQdVloz5+jBfBM0xb1BgAfXPWjCa6cSy+dcnCiL+CXtoxrM5ggNQG34oOsEcuA5kz80kGcpnf0Ynj0/mq+QQTkPeHem4xQiQ/JBffPCXW5q0UA6GnMOvfpS2qNxMx8+qN8dSJ8n0FPkqQX0yVrjSRQjvk9USiSzUqswCSKJDxvSqUwAmQZCiYioAwaYbGo6N4aAhhe+RmBPDldebg6O2nuzyM9kzr6HhaJWBC8LJpRw7MnXsPlrZrZw2rHgqzmdu7E+E6uHd/Mi+HXyNOloE8cKthcuI12xpTu8vvbKrRuNHyMbUcybvC/LSdBmdS7Ons+Auduerqu7BQxUeeNYNMIHprLp7BV1AYALfnQNfp1K831zocdUElwxySKmJvm1+pmUqQKfONVJX6gf0g0NUJDwH8zJlszWn/wYb3L5kNbVgP9EViUve1L3ZpEs=

From: Zhang Peng <bruzzhang@tencent.com>

shrink_folio_list() contains a self-contained block that sets up
TTU flags and calls try_to_unmap(), accounting for failures via
reclaim_stat. Extract it into folio_try_unmap() to reduce the size
of shrink_folio_list() and make the unmap step independently readable.

folio_try_unmap() is only called when the folio is actually mapped;
the !folio_mapped() check stays in the caller, keeping the function's
semantics clear: it tries to unmap a mapped folio and returns whether
the unmap succeeded.

No functional change.

Reviewed-by: Barry Song <baohua@kernel.org>
Signed-off-by: Zhang Peng <bruzzhang@tencent.com>
---
 mm/vmscan.c | 65 +++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3bce7ff89293..71b507011603 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1318,6 +1318,38 @@ static enum folio_pageout_result folio_try_pageout(struct folio *folio,
 	unreachable();
 }
 
+static bool folio_try_unmap(struct folio *folio, struct reclaim_stat *stat,
+		unsigned int nr_pages)
+{
+	enum ttu_flags flags = TTU_BATCH_FLUSH;
+	const bool was_swapbacked = folio_test_swapbacked(folio);
+
+	if (folio_test_pmd_mappable(folio))
+		flags |= TTU_SPLIT_HUGE_PMD;
+	/*
+	 * Without TTU_SYNC, try_to_unmap will only begin to hold PTL
+	 * from the first present PTE within a large folio. Some
+	 * initial PTEs might be skipped due to races with parallel
+	 * PTE writes in which PTEs can be cleared temporarily before
+	 * being written new present values. This will lead to a large
+	 * folio is still mapped while some subpages have been
+	 * partially unmapped after try_to_unmap; TTU_SYNC helps
+	 * try_to_unmap acquire PTL from the first PTE, eliminating the
+	 * influence of temporary PTE values.
+	 */
+	if (folio_test_large(folio))
+		flags |= TTU_SYNC;
+
+	try_to_unmap(folio, flags);
+	if (folio_mapped(folio)) {
+		stat->nr_unmap_fail += nr_pages;
+		if (!was_swapbacked && folio_test_swapbacked(folio))
+			stat->nr_lazyfree_fail += nr_pages;
+		return false;
+	}
+	return true;
+}
+
 /*
  * Reclaimed folios are counted in the return value.
  */
@@ -1596,36 +1628,9 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 		 * The folio is mapped into the page tables of one or more
 		 * processes. Try to unmap it here.
 		 */
-		if (folio_mapped(folio)) {
-			enum ttu_flags flags = TTU_BATCH_FLUSH;
-			bool was_swapbacked = folio_test_swapbacked(folio);
-
-			if (folio_test_pmd_mappable(folio))
-				flags |= TTU_SPLIT_HUGE_PMD;
-			/*
-			 * Without TTU_SYNC, try_to_unmap will only begin to
-			 * hold PTL from the first present PTE within a large
-			 * folio. Some initial PTEs might be skipped due to
-			 * races with parallel PTE writes in which PTEs can be
-			 * cleared temporarily before being written new present
-			 * values. This will lead to a large folio is still
-			 * mapped while some subpages have been partially
-			 * unmapped after try_to_unmap; TTU_SYNC helps
-			 * try_to_unmap acquire PTL from the first PTE,
-			 * eliminating the influence of temporary PTE values.
-			 */
-			if (folio_test_large(folio))
-				flags |= TTU_SYNC;
-
-			try_to_unmap(folio, flags);
-			if (folio_mapped(folio)) {
-				stat->nr_unmap_fail += nr_pages;
-				if (!was_swapbacked &&
-				    folio_test_swapbacked(folio))
-					stat->nr_lazyfree_fail += nr_pages;
-				goto activate_locked;
-			}
-		}
+		if (folio_mapped(folio) &&
+		    !folio_try_unmap(folio, stat, nr_pages))
+			goto activate_locked;
 
 		/*
 		 * Folio is unmapped now so it cannot be newly pinned anymore.

-- 
2.55.0

