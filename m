Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2479F486BB5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551134; cv=none; b=npMVRKjIGW3D5c/Sjbcl+NylnLsEVNxw7NhSxODi2ZhytBRND+r+wZQYljGGnvoAD66CvIPvKsZEnBoWwCrgqubwX2s4TC7Y5aR0Qtna6jIiH7I5W0GkdXrYXrh5wn/jtWeTRboff7MrXhl5QwhqRaht+NlVIstjpGe8ma3mtcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551134; c=relaxed/simple;
	bh=FPRlk/3xXD2hlJWAg1kKXQRCO2yol8H3vn6v3bTyCKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDBmJlOuEjYBQ1f2uILUeKRYV9z3hxd4/h3m+hqt3XvG0Flq6NhE7DEa+VB5FT+gv5k4Ub21yUXCzNlJrBC8uin1vVcwjDFl9kDYRzGeDjdXKxD68pEuGO06JhMJEr791oqDps4ge61Rx+ix9Ic40PeCr7EXGQxOFXxA+Jz8ZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=YJYr34CC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F44WgGMx; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="YJYr34CC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F44WgGMx"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id E0E381D000C6;
	Wed, 16 Sep 2026 05:31:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 16 Sep 2026 05:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789551116; x=
	1789637516; bh=n4UhpKBn4QA7xtpBWtOXdoBNDcNab8zz8WQs3EPLY2Y=; b=Y
	JYr34CCNqrZHl7Q6SppINXitbMkf1ZCY/c4ikwCXM4iDuFnpvAs6l1Rcr67jD9by
	/9ELVNnPHn+j/ziAVMCjQx6mO3ZCxGDn/bkYzgen3oQ4s2M72PP7VK8k6i6slmLQ
	zHu0wmqaj/TYs0UfOjibMDe5h4t5vULnlatOJu5s9ePMCwyjpnVl+Xr+E3kmW8zQ
	TNGpW6K26//aKsD7psRsslmfQ99KTRcCPj2NSEJFFLD3JQgoKxhFVrHS6yOIqiu1
	wxh5gNN17GmIO43KqQxbUQ6PxRuw59zZQP/t7ZlwfOjhigSnOuC+kXWgQT4viqMa
	WPPnRihMYKgVQltDDeGmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789551116; x=1789637516; bh=n
	4UhpKBn4QA7xtpBWtOXdoBNDcNab8zz8WQs3EPLY2Y=; b=F44WgGMx9aAyFLuAd
	DX3sYkckpCW6T+iZKaJ30Vzo+fE5FCIrjlZ56ZuvLWYmxLGD05tCWXB9CwQJ++IK
	2iNQYh1Df0PlLP3UR2PN24AB6DRyY0BuqnmWVY6O851JgNjz2aDRMlDLmY1NYNDs
	WbzTSW7rdfay6p2B9Z4mipH6P2BjIg9zDu/TF9kaJG5KRr5owNTUKKy2ey1i7q6X
	QuwpHfjYbGxqoRrblImV//Ag340T4vmLd3FwkqiezJimnZvGs7c8ewFcwB6JpjaI
	T+7JCadGB1Ihcmsuta0c/UcuJzVJMQOGBNkwHZAiLMo8UeVjnEyv/yHXAL2FeQDR
	I4+wg==
X-ME-Sender: <xms:DGKqapEPfK4LX3w22w-oH3t7ANi5ausQ6cRn9x7gffdhyWVr5UAQuQ>
    <xme:DGKqaqSlvyG898IaonIaPYk0HCZvYgPh5Dra52XjkFe0RxNWCsZzTNs-k8LuaJ4rG
    Fq4xp5kr2BSe7ZpqMEf7uec3588R8xr2uYLmXmag4WaYCOu9O1jGVLE>
X-ME-Received: <xmr:DGKqahR7fDuqVlw5cQ-N0VydiiKM9d4ObQ-l6D8thT43dxYTMu1dmfObzHs>
X-ME-Proxy-Cause: dmFkZTEOpyDQEfQMjLyldXBPAs1OiAaYjuycA/zprc2XA0sZE/gLY53LzRl6wisjmJsNcj
    shXh7L3amtO3W7Dj4gJ1brhV8efHSvbbvvisq8qNCVrU/hVVqWW2fJ8EDoeL9EfJt8J4fa
    r63UA+S0A+UN3c16swmwWrTj5sK0gOy7RYH1CN+xe4D6TTQ1ncSXBFkweWqSBfk0S52Say
    Dntsl8DI3TlZwS0igZd1iO+ltDo9n3qHIbwcYcvcbVUlu6Rxag/XK6s48+7ZTTYlI2aJe4
    hkL/jN/KxntOAh39VLdXeraBW39brB+PkStvfnz0wMlwqVlAhF3nsCCzTv21LQWeSF/iAB
    j2t+mXQn775ggvsPtC4n/CdAcpez2fjdkufQ13BoA0ie4gIaTNYLvpt3LO3C6eCly80Oe+
    5R8zcSqP7U+gnF8pyUj+uxBT3U9ceWIQJP0IB2oB5XmmJ1JQkegWkF5kmptEc2b29KTCtv
    YjEWiAlQ0F9yfOMFkAl3mL0XjabDpETvdumd8hWbEDShtaI7+foqMekZsxpJfWYszrTzrB
    wgrjD2ilfIfDinaWQgOTVnD+2/QhvZcLmdHcrXaSkRhMjU7RBfePy3+Ur23kphaUVzlgBC
    moMrk23PR1LJaTeUfHPRh2RGi3a3ZnhUy9KuWiFHCdriFlphP8AnaSUI1ypg
X-ME-Proxy: <xmx:DGKqalc4qhtbewyOYgDWM12k-J0rJkhTco5doz_bd_V7Nl3YH1BbGQ>
    <xmx:DGKqatfZCyUCXAxNUDSO5VyCm6vgQ3yfHzby8Fp3lEei3cLNpsa4_g>
    <xmx:DGKqaj-GH01q8h03LuDZ8FMEdWN6hdDvSNrWCGkSAl9-1GUasg-xFQ>
    <xmx:DGKqalPiu9fLV71tve3wVjsZMFoMpQVSa1aQpDq3oxF9Ou_0ksX21Q>
    <xmx:DGKqapmhdr_-A9_kMbcYSnVeYhASbz3-2LbkW0iZSNZJt2PsZcgD5yXx>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 05:31:56 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
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
Subject: [PATCH v3 03/12] mm/khugepaged: rename mthp_present_ptes bitmap to eligible_ptes
Date: Wed, 16 Sep 2026 10:31:30 +0100
Message-ID: <20260916093145.4022188-4-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916093145.4022188-1-kirill@shutemov.name>
References: <20260916093145.4022188-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The name says less than the bit means.  A set bit means not only that the
PTE is present, but also that it passed the other checks: uffd,
lazyfree, anonymity, sharing.  The PTE can be considered a collapse
source.

mthp_collapse() then reads the bitmap starting at the PMD order, so the
bitmap is not specific to mTHP either.

Name it for what a set bit means, and update the comments that named it.

No functional change.

Assisted-by: LLM
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

