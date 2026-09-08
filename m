Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF685650F3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874123; cv=none; b=JXvcTkuO3ner7WsC6kF5OpsGsbIhNmDiX/GLJcsbLoGrCa1LbhzqAft8NtByj7yEWKPq6UuIRK15ikqNFvChuiPo3QrAOnLM5CVekK0geKvGscCyR7/ccgVWsugRMGNIE7X9liu9bq6HwM4c8ejBhUMSLxL4uUx3pcTRNILaAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874123; c=relaxed/simple;
	bh=SAct09KE3g4oxw9pZrvfjCez4EL74Dm3dxHgzwxyyLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSOUzScFJDOvKWcbFiCkleRtMTuHq+9m4wIJLwkIHSxbgVjNEqB+/JIJhqNtROnUVZwUxIXd69e0Y8jCGEoWGtaPrv860F0n1EnsR1vWvajMNiVq+6FQbwiwHSuEINrhgMSkfSOQxmG5JTBEdHS4dNxtZps4MQ6Rpjdgtj3yeL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=eRzvCtnI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JC68X4HO; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="eRzvCtnI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JC68X4HO"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id D6A67EC011C;
	Tue,  8 Sep 2026 09:28:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 08 Sep 2026 09:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1788874105; x=1788960505; bh=XRGPzws2sb
	+9IlW6HXf+MYksDpUmRu+6YrbXkwnjRR4=; b=eRzvCtnIT9WujyoUL86zSn0Iiu
	+jtlY65TKWG6j8D1S1gxW4Cw7mFn+hVNMri9+i3yndrEzfLTmrX3bX6HVTGf9ekN
	MyKtYLHA1mPifWp7wUxfu7xV046blBlKgVYIFk958pA8wYSZGt1J462l6ag/kdpm
	aAdeQIszxfs7tYMd6nM5mz3xFZGslPzbRQ+hfxIVT2m0fpVCARY4zKJqT9aw2OnL
	lUaeBLDAj/rjeWjKNW+l4mans+y+BkZDlP071NMpYEcJry6oPk9oRoc2keUF/Q8I
	dstCCj8ASNZ+cfYz+ttOWPFbu/iql51DhasrbEVFCQUFAmHon8qvxvvWDCrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788874105; x=1788960505; bh=XRGPzws2sb+9IlW6HXf+MYksDpUmRu+6Yrb
	XkwnjRR4=; b=JC68X4HOREoHolGlVwW95c6JK8RhKM9016RYWlO5K2MBkcHHcmN
	J8R43kK9GWsapIiVnMJRLFFVSzcKJpMe6QnKzs1BARH5TQeiNh4EKE5lI49vTbTB
	hOdT6y3nDBsrXOAmsCcs9aqg4x1XY95rhpSMhKoMW1cLS/AFtAqCZoZBhGv7LKBK
	V7snfJoT8BZDNeEeYPEBnQ1BePnjatFosf1XpwxhyvzMIwG4bGPMN+Z21PTAqIwb
	kE6Mj4vWdsHbwsx0IPRPJ0c4s2C1if9Zbcr7JPTtKhjT3iTwr+NlN2wVLnnpOASY
	PLzA0ULPIy5D58Od8ggAGM4+A4ZXCshY5jQ==
X-ME-Sender: <xms:eA2gauWIoOm-BxH17nKhSbmBnKdY1YLJJULHzvPYR72cF5mUKSW6jw>
    <xme:eA2gao_x5tDUx0VnqLHgX7raPwOX6PpxBvDLsXU4ksOEPpDeVy1ohrZrQ7mzI7rsH
    Iuevm8O_zLKaV0wrYGZFb5NwW3GWMBCEVdZxmvtk0d-d980O8IbFoAwhA>
X-ME-Received: <xmr:eA2gauYMm5w9DcLDOR2rQjw9LmFjih9jTSEM8UQCqruMQw_AFrgedOwSzLs>
X-ME-Proxy-Cause: dmFkZTFeNeMAsfC7S2yyN61sBWuwFqP6BekvQP3VemALp0/A7/88H6JQR+d7jV5Lg7u9uQ
    PDn7I1Wo6qn/TFhatIEJH0B/epMmDLlvS5YxrZwCbDsjWEABLRnUDNVkwMQrZfQZGLJzzb
    2ruAMIub5nUM8aRUsSZru2LzMu0kqf/aNAG243THYtV18G1C4XAxUMbFY2wuvSE7mEaPcc
    anq0IKqBKTIUjUqYmQFMmmUhhYBUGDgm3c6GbxuZmdNRBKo52hbAfhsvZhpFJriV2TERk3
    TU/JoUd+zwFxALYvoXobOt3jAyX9TC8x04xDgJ0yQoKmx3V7XWHi5qoYYfZjKtKaNzPTOA
    9bQPQQz/KfM3zA0zLBzuuxtIspn87uVdhGA7qxiFCnMkH2e/xzVUxKHoxfJ2cuJ07CyeIK
    NxHRBm3tNPc1SR8ZARock0ll/AK5nLhz3aVSdA3EIU129Qe+qbfa/J2Wmp1TFUo8P2DxZP
    2Bp9XcDrkTvg2+vDKHVtWx5eb/qsSK7FxkK6ua3GRLuHfb86GcAbVycQ3BZlaXkAP9vCf8
    WP0UulaZtFCyeYKL6BxbSq3/I9U675b4JnO6S4OE/eEUgduK/xf3TBxR4deTqIpCzuR3pp
    cuucGaTXntGJutUKB8HuWGrfC5mrj20x3w53lyoVtRAWbRpu0bEqWNbwo2FA
X-ME-Proxy: <xmx:eA2gaoe4_hNzTq9FNulk5EqsRd59-rb0HTf2E5vw0yi5CwxcvwDKOg>
    <xmx:eA2gagr9e5UjuG4yuIPhb3JBFNledu3yHsZHaII6UXi74EN6aSgpjw>
    <xmx:eA2ganBtaMbB0nLPrZ0u232MJVie4wIy_SwPQifgfZxQT3Myu5BLNA>
    <xmx:eA2gamVGw86l5pzMku1SsCU6ktKuD4UD2snWQZcQxAUNttASl-KemA>
    <xmx:eQ2gaiP-g920ppcxJH2BmuAMMUobh-1INqKnfuLIRltdm4m48Ww5Labu>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 09:28:23 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Balbir Singh <balbirs@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Hugh Dickins <hughd@google.com>,
	Gladyshev Ilya <ilya.gladyshev@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v2] mm/huge_memory: add folio_reset_partially_mapped()
Date: Tue,  8 Sep 2026 14:28:21 +0100
Message-ID: <20260908132821.1517475-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

__folio_unqueue_deferred_split() and __folio_freeze_and_split_unmapped()
both clear PG_partially_mapped and take the folio out of
MTHP_STAT_NR_ANON_PARTIALLY_MAPPED with the same five lines.

Move the block into folio_reset_partially_mapped() and call it from both
places.

The helper asserts what both callers rely on: the folio is frozen, so
deferred_split_folio() cannot set the flag again under it, and the folio
is already off the deferred split queue. The list check sits behind the
flag test because order-1 folios have no _deferred_list.

folio_order() is safe to use at this point in the split process: it
still shows the pre-split order.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
v2:
 - Comment that the folio must be frozen above the refcount assert
   (Lorenzo)
 - Assisted-by tag in the format coding-assistants.rst asks for (Lorenzo)
 - Collect tags
 - Cc Ilya Gladyshev, whose refcount series would be the home for a
   folio_is_frozen()

 mm/huge_memory.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index dd66c6ad5af1..fae959633279 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3972,6 +3972,25 @@ static unsigned int folio_cache_ref_count(const struct folio *folio)
 	return folio_nr_pages(folio);
 }
 
+static void folio_reset_partially_mapped(struct folio *folio)
+{
+	/* Folio must be frozen. */
+	VM_WARN_ON_FOLIO(folio_ref_count(folio), folio);
+
+	if (!folio_test_partially_mapped(folio))
+		return;
+
+	/*
+	 * Order-1 folios have no _deferred_list. The flag is only ever set
+	 * on folios that do, so the list can be checked after the flag.
+	 */
+	VM_WARN_ON_FOLIO(!list_empty(&folio->_deferred_list), folio);
+
+	folio_clear_partially_mapped(folio);
+	mod_mthp_stat(folio_order(folio),
+		      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
+}
+
 static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int new_order,
 					     struct page *split_at, struct xa_state *xas,
 					     struct address_space *mapping, bool do_lru,
@@ -3980,7 +3999,6 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 {
 	struct folio *end_folio = folio_next(folio);
 	struct folio *new_folio, *next;
-	int old_order = folio_order(folio);
 	int ret = 0;
 
 	VM_WARN_ON_ONCE(!mapping && end);
@@ -3998,11 +4016,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 		 * leaves PG_partially_mapped set.
 		 * Clear it here: the flag does not survive the split.
 		 */
-		if (folio_test_partially_mapped(folio)) {
-			folio_clear_partially_mapped(folio);
-			mod_mthp_stat(old_order,
-				      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
-		}
+		folio_reset_partially_mapped(folio);
 
 		if (mapping) {
 			int nr = folio_nr_pages(folio);
@@ -4516,11 +4530,7 @@ bool __folio_unqueue_deferred_split(struct folio *folio)
 	memcg = folio_memcg(folio);
 	lru = list_lru_lock_irqsave(&deferred_split_lru, nid, &memcg, &flags);
 	if (__list_lru_del(&deferred_split_lru, lru, &folio->_deferred_list, nid)) {
-		if (folio_test_partially_mapped(folio)) {
-			folio_clear_partially_mapped(folio);
-			mod_mthp_stat(folio_order(folio),
-				      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
-		}
+		folio_reset_partially_mapped(folio);
 		unqueued = true;
 	}
 	list_lru_unlock_irqrestore(lru, &flags);

base-commit: e3fc12b08aadde9cec7b3799ac0e0c9a1aa245c4
-- 
2.54.0

