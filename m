Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542AD4DB54D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534639; cv=none; b=ZMk0mvbnn0xvbz7CPed5e7PbZZ1WXB3LOyLLLTUlrLwifPnLwFmGeaKagctKf0Vbjh02mQt4kFqtorZanDdgI82G0QWnrYTlMENtMFQvk7w/S1Jrn+6K4OY0wltHqC4pcrscFRITw5i0Ypfvvr6+DZFeuhwY4GzjpcuN8Y5gmMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534639; c=relaxed/simple;
	bh=jL/f54IMG5VmysE1ZlLv1NWtDbPe2S6xW+fhY41T6gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwnqdB5WfNLQHVbqk0dEcTmYOQ3sWTyJbi6IL/be3CjUC92zvM0OH3rDKi1ufZBzcOG+PgM9RhCcsgfHeQsQ3UbPkL5cFUGXU+NWw3PVI1E9mjM/veJS2hJghehH6U0StxkJMZ2qzBBmfFJiHTCUq8BYgXXSom3DFj0cLPVtLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=UeQYIDSD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TbxokLAR; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="UeQYIDSD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TbxokLAR"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 26F08140011C;
	Fri,  4 Sep 2026 11:10:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 04 Sep 2026 11:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788534636; x=
	1788621036; bh=YY32sTxGw5u22cQhPIzHWlsuJTNCMKfMNjS6KMgVuVA=; b=U
	eQYIDSDnH5OvngSpvGHvVo3gjlzcllo+eRqgriAT4qaUdR6byVr4t3cUEMw+MS92
	2MXf8VXpVmVRnK3fxA8i5Ui6gOMB5bljDM3QIj2+lISJBh2GjJ7shINU0h3CI4oN
	j0B+MdUpZvN4cPoHW+XcKLS/43zigUAEIvWDiyNCNrzAkBjcRPjdkBRGFDqrE/00
	h+ULUrlS+pjvaHTEmxlsG2PyITKgFpUxF6YzDzICmhNSh1o1res4UkjW1f7wztDj
	+bZgCZEmSJBmQ8UQXn3b7gTzNicBHfc/BSvTOktu33K09iCznyKkP8DLpOg6npBO
	Stp85hdL+5fDLM5mCR/oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788534636; x=1788621036; bh=Y
	Y32sTxGw5u22cQhPIzHWlsuJTNCMKfMNjS6KMgVuVA=; b=TbxokLAR+WGQjP10e
	MH2CLKul/0MB9TxdSvyFhHKSB1veiP7eJzxXBUwxm2yQ1a3bF5HtuXiuOYY3XR4o
	TmZi7FeDN9sBhK5gydL7H7JEhXl69+pU/OJXDHskXtD5V3h5X5vQRPoeXEWpR/dc
	Zrx2MXE2RoSM/wxssYawghAvBmpHF5U1xagG+ObRRISgz5hqDV6UvOc3WQBc5gfR
	yuY/GxgiGdrjNb+wo1iPY5pVQ6fBKc93Jd6JwOYcGVIlEmJcI5sWXygRKS2668fp
	5q2WXie3TN2m8rxBe2Ozm11BGMxH6j0mTR4jPgAzJsfNaPaEa37ylleQ6y8xkFXl
	GAzyg==
X-ME-Sender: <xms:a9-aauiNEZ_vz6yLQjGipogDjVQmSX5QL1rHcI0yAhLwAxqbkVe32A>
    <xme:a9-aagh4uURtQEUXkgdouMdff4u6jkS-vbpcLY9gws05SQr7uZH319DycENxPGcU1
    mH7Xs_i47NYoW4hOHx4vjvMofU1sVXAXQ2IbWgeEgbeffDMajifYu-T>
X-ME-Received: <xmr:a9-aajsk1Z7gt9a8gZJAUsib8Cu57PNxCEdVno0OUZcXB7F33H7B3motgW0>
X-ME-Proxy-Cause: dmFkZTFdOocfRN4jOpcQf0AqfSai/YCGo+xlO94MLvzn7lqitof50EENUNEgJzLPt2H+RQ
    DWgrwJL5dg2BaLkWQfjz0w8mX09EzID7A24sM1R0CcrzJ0aCsxP+pgO1accdG5RnvXKoNP
    Qi2+ranCgsFBQlrx3RUM64Xgm9l9zr2TPWbzFNtan3mUwkVlJ/gBEGXolzLuuMZ3CJ6e8L
    gmzum6oDDF3av5ecJE/wINba64+XlYa/U9oL8c0Dkr16eu3wp8w8wOsHTRTsCgO4oV0meO
    0fb7rtZliPO8XPlA3k/rGcTv+01JWMnSe6fG3OACTE4UctUjoP9cM2YnBbUckeF0hhckN2
    IulBVu1pSPD4k7hx5yDYEsMaz/SErjERf9GO6dSsa5y3Y99AOOolJH9jARZNZeHimVdXjA
    4YclnFCUC+U/t6wU7LYHopP4G/HV07ttDttUc/oRFksnZw752uJJ2/3C9D3bESssdeF9fW
    WRCGTCnLL0HxFbtT3gGrFWAUtIg/5ry9onTV5dKzanRUQXzh1NOSOI2MD6lWx6z1HjLhEF
    heeP30UM6YbYHN2RWXbT2QWzph3LUMiV5gc5+OU9iC5milImg4V6UerIkxU5boAlpMFhUV
    b7RXy/WOhJw9CkjjYyUArotiZ8q/DcBeqCEkOzEoZYQFCDauvcdoWIZf3NqA
X-ME-Proxy: <xmx:a9-aaushcbya6a53NKZ-VUr1CGcj35Q7RUdEyeEYqqwEluudXySyCA>
    <xmx:a9-aasMucYwrC3NPaE8Lzwo2TMy3oIsx5hRiLnM4IzqHYk_s1qZBIg>
    <xmx:a9-aaoc6l_yLfqQCgNrK_xoL5hNaQDaelPQZZsra3Tb95sQ9aujdXw>
    <xmx:a9-aarnMh9OOog34KmI6UGv80VWWaMi5L_g3gfgWar70o2HJuvm-vw>
    <xmx:bN-aanq90I8sDwxn0_gfSrpk0hFjXdifVmfc9PEjPLSrbqAlIAT6d4pz>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:10:35 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 03/12] mm/khugepaged: rename mthp_present_ptes bitmap to eligible_ptes
Date: Fri,  4 Sep 2026 16:10:17 +0100
Message-ID: <aeed00c71bab856afb18c12c8e9b904f82185942.1788533997.git.kas@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788533997.git.kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
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

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a6dfd8cddc50..6a437d6fe016 100644
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
@@ -1482,8 +1482,8 @@ static unsigned int max_order_from_offset(unsigned int offset)
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
@@ -1514,12 +1514,12 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 			goto next_order;
 
 		max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
-		nr_occupied_ptes = bitmap_weight_from(cc->mthp_present_ptes, offset,
+		nr_occupied_ptes = bitmap_weight_from(cc->eligible_ptes, offset,
 						      offset + nr_ptes);
 
 		/*
 		 * Swap PTEs accepted during the scan are counted in @unmapped,
-		 * not in the present-PTE bitmap. Account them for the PMD-order
+		 * not in cc->eligible_ptes. Account them for the PMD-order
 		 * candidate.
 		 */
 		if (is_pmd_order(order))
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

