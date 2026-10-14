Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06303F0A8C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997926; cv=none; b=MQXkQJPANatf6vi2r1WTjta0I3KI6wCxTwEY9VhSPB2rxgY+Ond60YScmDQMm8eHqIOUZ+IeyE82LvPcrbOliUhwbVgI3/vHyiZ4cUWOJ3ex/j2qg37pLp9GIqYu7kUbQjyHfc8kBotomTxDcifI5ASqAPxgYMi7docf+pG/Nac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997926; c=relaxed/simple;
	bh=JwPEI7B0ImoHP7PMaddlArobxwyH7uk5ipitMw9/wXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GofP7ghuCSQZEX2DwQo+dv7qu1aM9sCOIMoQez5y92yccKaiOba/wtMjiQzoWFGlVY01SacRgU6RXEmzAMu9+zwa5UqZz3puhNVwaozrGtUoBpVYacXbqNF66PUZFi93bsutdOUd2/fQzyk0dBrJmTo4ZLekK6nPGwmehS4TrUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9DHl5j8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9DHl5j8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E521F000C4;
	Wed, 14 Oct 2026 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997925;
	bh=2jWu2bDBNbsJoqDuBXroh8IkfqrOqZyO6rRTdaUBLdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q9DHl5j8BvSoV4c9RY2f9gLsNwHp2sh3YbF6coUM5uZ537VFJ9gZFk9dy8mLp/Ggg
	 0/pQM97/mC3uQsJp9Uj+Fg31KY0mEKATqodypSQVqKMhfTpTOxuVPUKnoMydqpL9U2
	 92iTTpU9qDqoyKVHGX/0iC7zT3qYmvV5rR6dYu5oK5/MXG5e+1ofK5gN0c7ZowBh5O
	 z3RyYhNmU2rdy2SWm75GwtZR/KRaNy/xBGi8h2BJt8AvSfnaD1O1QIprloYYPo7jwN
	 2Tl+xuQNiDCoi0quQsAoT57onJ6VEHNBf/DhNrMzJxT/XaXdsd02ELi1qz+j0x8Xks
	 kvY2Z8EonHj+Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 3F6451980047;
	Wed, 14 Oct 2026 13:12:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 14 Oct 2026 13:12:02 -0400
X-ME-Sender: <xms:37fPauHsrXyCfiLXXVDMNICY4nODXpFLy2U3KjfV5VwdDD8ADf91dg>
    <xme:37fParTAkB9ilm3Vunj9HyXLeqO181bpuOak7WFfjpmo_HGxOUe3fS1fGKEPbVFlw
    1fxEkoRI-XZuYsZLrnUAhNMHEL52pmEqQh_cFx4XqlCuRdXZnjO4Xg>
X-ME-Received: <xmr:37fPauRglf4CNleC4zfwsdC9fIvI7AHOq5UoBext82Jrp3BxXC2NyNKbrkg>
X-ME-Proxy-Cause: dmFkZTEOl4NfFwPDLSBmMqKx+7N39IeMIni7MK/u+VvxaGQ1bs8GfI9RPH3ayDujSspKBR
    qyKM+cOOmgGIjV1p99esKFBZjBYm+2fZxsu+dp6kV/40GtAwNmLs0lveP2Nu4w+lTJFNGX
    +PHSDDgHqCL4KFJyfY61faoRzA0h8vW6kqyfQ8QWLAhZGC4dGYbGOPKI1Rz1FZYlfQX1qS
    ZyU+Kn8XAf7cjImjIHoCIXuQM1OjXWl7zezG3uHTMAWWFgZp5y0YQrE07Fctth46IOKxOe
    Y9yLqjV8DtTpJEgGM7OnnqWtPPljjv3Jg1+LTtq+j0gFbbCdpQA4+mOsItlGLpSNkwSLhJ
    v8F/Py/LpcbqpZCdQR7pJ0113yy+no2Q6VhctIySTMzofsXWhYbTIrbcsbIg0MD+1VR3CA
    QiBRYjFWMQFOeLQmkjnjx/76Lak0U3LKh0PJcL8dKvHteSIITDl9gabom9HeXwbr2Jr7GZ
    LWx2VvBPh17x1z7cJv8p6KH2+878kWtzLgYiNeACywHWjJDDLg5Ye/gCITBkM2E29BZ0p4
    7Yii5uNfTp10+GBk76FVC+Sb0asOJJwfHH/rPaWbTVBT2+Aoc/4BXAdCJ66iNexBcDhvYF
    TDFqnXrjT4DhRBGng+IzmyjBDGtRjKtRwRn8pbdFdM57E9rU++lJXrbnl/9A
X-ME-Proxy: <xmx:37fPaufxfMeABLU3MONsanFzUU7GHARjRor1C8TsjoQH8P-G2Z2kgw>
    <xmx:37fPaic8PJE84ZhdMGTK1x-QmIj5gGvZNouw1MATXIwHZMXN3km1_Q>
    <xmx:37fPak9CzdfrL6F0661BijnRiJmSEl1VVHvmnUhPpsCZk-v2pOaejA>
    <xmx:37fPaiNVaznRL47Cwjod288nFyt8UZNeXwmpkz8qdl-t3TD1LGcO4Q>
    <xmx:37fPaiVJjxniS0tibohpu1NvsL53znIspCLgtu9xoELk2KWHMNfKj29a>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 13:11:59 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v5 3/9] mm/khugepaged: rename mthp_present_ptes bitmap to eligible_ptes
Date: Wed, 14 Oct 2026 18:11:36 +0100
Message-ID: <20261014171145.3292736-4-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014171145.3292736-1-kas@kernel.org>
References: <20261014171145.3292736-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name says less than the bit means.  A set bit means not only that the
PTE is present, but also that it passed the other checks: uffd,
lazyfree, anonymity, sharing.  The PTE can be considered a collapse
source.

mthp_collapse() then reads the bitmap starting at the PMD order, so the
bitmap is not specific to mTHP either.

Name it for what a set bit means, and update the comments that named it.

No functional change.

Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4979a93e3648..081f705cfca2 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -115,8 +115,8 @@ struct collapse_control {
 	/* nodemask for allocation fallback */
 	nodemask_t alloc_nmask;
 
-	/* Each bit represents a single occupied (!none/zero) page. */
-	DECLARE_BITMAP(mthp_present_ptes, MAX_PTRS_PER_PTE);
+	/* Each bit marks a PTE the scan accepted as a collapse source */
+	DECLARE_BITMAP(eligible_ptes, MAX_PTRS_PER_PTE);
 };
 
 /**
@@ -627,7 +627,7 @@ static void collapse_control_init_scan(struct collapse_control *cc)
 {
 	memset(cc->node_load, 0, sizeof(cc->node_load));
 	nodes_clear(cc->alloc_nmask);
-	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
+	bitmap_zero(cc->eligible_ptes, MAX_PTRS_PER_PTE);
 }
 
 static void release_pte_folio(struct folio *folio)
@@ -1482,15 +1482,15 @@ static unsigned int max_order_from_offset(unsigned int offset)
  * mthp_collapse() consumes the bitmap that is generated during
  * collapse_scan_pmd() to determine what regions and mTHP orders fit best.
  *
- * Each bit in cc->mthp_present_ptes represents a single occupied (!none/zero)
- * page. We start at the PMD order and check if it is eligible for collapse;
+ * Each bit in cc->eligible_ptes marks a PTE the scan accepted as a collapse
+ * source. We start at the PMD order and check if it is eligible for collapse;
  * if not, we check the left and right halves of the PTE page table we are
  * examining at a lower order.
  *
- * For each of these, we determine how many PTE entries are occupied in the
- * range of PTE entries we propose to collapse, then we compare this to a
- * threshold number of PTE entries which would need to be occupied for a
- * collapse to be permitted at that order (accounting for max_ptes_none).
+ * For each of these, we count the eligible PTEs in the range we propose to
+ * collapse, then we compare this to the number of eligible PTEs the range
+ * would need for a collapse to be permitted at that order (accounting for
+ * max_ptes_none).
  *
  * If a collapse is permitted, we attempt to collapse the PTE range into a
  * mTHP.
@@ -1499,7 +1499,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 		unsigned long address, int referenced, int unmapped,
 		struct collapse_control *cc, unsigned long enabled_orders)
 {
-	unsigned int nr_occupied_ptes, nr_ptes, max_ptes_none;
+	unsigned int nr_eligible_ptes, nr_ptes, max_ptes_none;
 	enum scan_result last_result = SCAN_FAIL;
 	int collapsed = 0;
 	bool alloc_failed = false;
@@ -1514,18 +1514,18 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 			goto next_order;
 
 		max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
-		nr_occupied_ptes = bitmap_weight_from(cc->mthp_present_ptes, offset,
+		nr_eligible_ptes = bitmap_weight_from(cc->eligible_ptes, offset,
 						      offset + nr_ptes);
 
 		/*
 		 * Swap PTEs accepted during the scan are counted in @unmapped,
-		 * not in the present-PTE bitmap. Account them for the PMD-order
+		 * not in cc->eligible_ptes. Account them for the PMD-order
 		 * candidate.
 		 */
 		if (is_pmd_order(order))
-			nr_occupied_ptes += unmapped;
+			nr_eligible_ptes += unmapped;
 
-		if (nr_occupied_ptes >= nr_ptes - max_ptes_none) {
+		if (nr_eligible_ptes >= nr_ptes - max_ptes_none) {
 			enum scan_result ret;
 
 			collapse_address = address + offset * PAGE_SIZE;
@@ -1731,8 +1731,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 			}
 		}
 
-		/* Set bit for occupied pages */
-		__set_bit(i, cc->mthp_present_ptes);
+		/* The scan accepted this PTE as a collapse source */
+		__set_bit(i, cc->eligible_ptes);
 		/*
 		 * Record which node the original page is from and save this
 		 * information to cc->node_load[].
-- 
2.54.0

