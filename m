Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20440497380
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590002; cv=none; b=EYTRJ5yGhdABEQTlydlBpzZGdpZVeDaVVJFnEEiLbuZ0+z0J+1aIEysIFZ7AE1ixtdLVG8ZuEEGR+vod9vQ3z1MvRGkcAr74fS4XJWemT7zS9DaBxsLcF9IgZBIMmGMLwar3BWrPh9QiF1hmw0ju+TNOCkxaDW0f79ZRBDyzRhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590002; c=relaxed/simple;
	bh=SXrbRKsI93g+uCY8m0D7gRq8ewOXCxmslxlypBDoMH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkhvTMDxKhecSf4DwwsqcLKLzfSjgPa74lLpSBMD0SbukB2g3Fkw1Ja4+QK6UTYdBEcQ/PPhk0Y4kVPoWnV7OgMBTqxrgXZHa9j4SAtWbVRhKN2vSdg7Af2HA5F894MV25OFQwPFZFHtaKt0klYgU1dv4A+4JEk+DMMEbTPKbLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=sqDofRgT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p1dptg7i; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="sqDofRgT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p1dptg7i"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 4D001EC011B;
	Mon, 28 Sep 2026 06:06:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 28 Sep 2026 06:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790590000; x=
	1790676400; bh=GyGjn09ahn/3UY0Q2MnLrKdILuuBxo8mW/lM52WL7VU=; b=s
	qDofRgTSM0136aLGq9986888/biMfGUpHizdEGKj/6mH0IwDGAHRsD+5CVTpJCmf
	HfF12k/IGw32YcNgbhcp6na/YAo5vdSpysPY71TjBzUIQfbXv71aVdzoDUfYKbTC
	qgzYNPsd0QvOZKcp7LK8PEmQ0rVNmJhMblnoDvbKoNdjQujEqt9tIc2wSAgHVM0c
	3MIOB1ccVgssGSX4/HVtYIDsOjDIExt244B20DhXk7TORNX3ATEpgPN/RVGUsc5z
	4yh8nfqNAuUCE4Upf+tVpzw5TyxYBTenmKcxGVxEh4OjoLX/GdLQOtV+Oj/gBZLp
	E8hNQuO4HqSNxzT0Rc1+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790590000; x=1790676400; bh=G
	yGjn09ahn/3UY0Q2MnLrKdILuuBxo8mW/lM52WL7VU=; b=p1dptg7iRsPbXgViv
	PnHoDNOrwm3AJKxF4n41ktbjYaIr0+Soe0VIgXtx/KjRE1Ff6M9L2BfkZAHoIfqX
	8eWBIUsYf6Mw8ti6niqcwGzLwO1gBJGgCl2Xs5+a8T2lJviykFcLQQ+2ayAOUqD8
	V2jFQB6BcgKC0CE3uFxlI880SkZj37SQ50h1xz0d2+utv0yFj08Y52kCxOLcYP1o
	COpsa8HrLsfy6+iEg/9YWmbiLyZrfb/x9uWZu1mdeDkLgMX4gLl4MS05Jw6m10nm
	lRf2EUZMrF6pw93w52Dzr6ahbuIc9ycIo6m9evu/KL53ill//pi9u0H3bLnK/J5v
	Hwu2A==
X-ME-Sender: <xms:MDy6aiVxuonofH4w7-1NtxPiHLVPgcy25aA2z_K4QMSK-gr7pzbRxw>
    <xme:MDy6aqgpatMWbM6NwaA7fXyclmZiGNByt-iElWlaOUeUVsBSftUznh1SeZjOafRDA
    3WEUCiT6XwFAIbFcplazzkNavFvv7-BTIicSijvtlZGSOoEIVd35Tpk>
X-ME-Received: <xmr:MDy6ashIYj_n_Z1qKOQxzc8IdIX31Z7hBvVOCMu6ati-PPRaZ2f9gIuEKJs>
X-ME-Proxy-Cause: dmFkZTGMD42hMgRoykqOjUnjhQtIwxUkbQ7HJUm3r0v8qg4G+w5HsQqCTFJeONZOOlAoTZ
    3cCyUPpxIiSbyZ2Tu7YPa3AAj7sCTCV2iMmUuGeQ9O2nYvFx4pqQgu47FPrepCLtn5mR8Y
    TFpZu0gc0RK5+soBqa17Izn0t8458G4TUOMorf2iUNwoNcvIBqn6qB4EfUoYIj6v0KZGYR
    +H9V2caIQyvUMHhBp6HpDE9LGyk5fDiJXvaKgdPDp7u8Zi3Y25cXOb1RGde0EKV1CRBWLp
    8vgyxTPXFx2P0qBK8gg3C7juaiX7+nTPBAuBcmJzHDM+E8HDEZrS5vhGsuUSQCum3RfeZP
    1qgFo921exWSghsHzwiPbF5RsN0fhr95Ft8wi3INqf6veKgs3fYfRT4uVAaks8R00u9cI5
    v3qQ3zWj7GEl+LHXWkm0DsgxlairW9DrZigbyx6D/NkNWYBfFl7UxnT4fwigK2ZSKPHpNT
    4Lb+z1RzNZKqxDeAUMoyS5hRnxBzESu9z+BQVSDA2Nt80jWkr8MQsZ+FftDaUv6prf3Jzt
    xC2sTgzu8rmv4n8nMx1jMmzfWpOfjRY8bvSLPnY6ZtzT5M7iFfdYrv1VbDEq94AVV1fHqc
    neBxVK1krPXYyOngIh1ZGUv9l+8xqxqNVPH7XyjHYrwX5RG9MgTygfeDmomg
X-ME-Proxy: <xmx:MDy6avuFQvVsKph4AuPwkfEk8gUukiYMqpMzXh4lFlLUXiHyq5uXMw>
    <xmx:MDy6aqtA1msAlq9qLxlhDzZo-bnSgDi8gH3yMnCGQrrE820JUMMsKg>
    <xmx:MDy6aoPGH-1DeZWXg36tRZor0CkaPuwTvHeK14Dd5lrE_1EGuwMkFA>
    <xmx:MDy6akdXRGjN-CdPFKR1LqenSZIbyt2A0SD6iiAC_hN2daL7fzHI2g>
    <xmx:MDy6ag39jEAvNy91fDPFYbJJ0VG_k7N7cNf65muTtsnTUVBDhpxpECwL>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:39 -0400 (EDT)
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
Subject: [PATCH v4 03/13] mm/khugepaged: rename mthp_present_ptes bitmap to eligible_ptes
Date: Mon, 28 Sep 2026 11:06:17 +0100
Message-ID: <20260928100630.21870-4-kirill@shutemov.name>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928100630.21870-1-kirill@shutemov.name>
References: <20260928100630.21870-1-kirill@shutemov.name>
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

