Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE2377015
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806030; cv=none; b=A9IC1R6kx0IlE3pVGMfDPY55MKf/b04U/2xuxy06b8lWgT2iALTShRV8Y4UbkIfLR3sD4oJ0Fj6PMHAXZhUzzwsKatTUPnTmhi/l86EHqXPn2nYgPvdhQhHBKol2jR4WGAUOONUDt1URvsxcf91JgdzfC15DiltsTrBFDwhTpFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806030; c=relaxed/simple;
	bh=rq6xSq1MGREKDU1Qmv7HEWUHFLvttzwgd7k266cL8S8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jc9YHiYVyKxIrjrt0+IZnd6CrjxIp+O/qbvoXjhG8TiftwaLiHnXsMHRDdZw/LxMuFzqykxdLnAOEijgyT5VlClTQYvIrGSVSfTYn1dysnFhCE/zCSwFgNtRG6zCa6ySkKquYpp13Pjgt/SEzw0HpKkloZ0x6Mb2LMx/2+CIqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=bBtFq1qE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hYl/dw46; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="bBtFq1qE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hYl/dw46"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CC7F27A0096;
	Mon,  7 Sep 2026 14:33:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 07 Sep 2026 14:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1788806026; x=1788892426; bh=BXtFYHJPAK
	f7ySUW3H9RvkuC80wSwao0DDfxfWpC290=; b=bBtFq1qEPlbUh7PdgXvR4k9Ic5
	12H+YJWYrwFahJdTX2YAqCGYG/GvzypDugTok+bFEuhwU1s1906Ny3AIv2q5d7C2
	PvUynxt8CguhPQSwpWufHxWazxBW0Rm62byks93U4CxVIf/SCtK/SAP82M4xwYbc
	DhAvB/MelmhmTXmG33oKDvM/0EuYZEe4gjDqbs8e/ItcCYZATbz8XTZbNiJA8UL3
	870fIIEuh7Hig1+pKZCh4RaaPuVoMPqNnPut5SoctRWeGmy0fUFZAA38LaYcN2q4
	7BUfzZ2fxnEe4R3Yfm6+rgO8sHZCMtr5hM+gmQ9WP+bLEA+g2XbyroC4123w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788806026; x=1788892426; bh=BXtFYHJPAKf7ySUW3H9RvkuC80wSwao0DDf
	xfWpC290=; b=hYl/dw46E9CNgxkp4DO9C3pI3k2WifzwuiFZ9EM6y7JU+yg0PN2
	n8mXEnnAk8c+mJZR2Enwcz62VRIny++P5cpR15hvoF39XVJHFzAz50K1zardOjA+
	7iY+tguykZA1BEE+QkK3pO9f5TlGXlFQdlUIHiaVjIeOMCWEWKzplWrNceyjc7vo
	Tz+zdUVje28UBqb3Cp297CN5Me8lkyR8bZLmDS0Og5IL0Swu5aEVFBxBrIKKv3Yp
	ElQSdXv4zwkKO4ZepQPNemyiBFvmXc1uNOohhDQtZ6lAREkJE8mRXUFbm84Nxnyv
	SZQF09u+CgMYqVmupKKqnuvcQu+f7USb4mg==
X-ME-Sender: <xms:iQOfaqT-O7TraHAT43xDGd_j2-wdE2vuRzzrRfT9heOBLGYQpZmWXg>
    <xme:iQOfavD7OMCIjdX8uHkKzVZ-BNQje7uzB-8OIqVaYnYtw9ZmCaV9yklSFWuFBmWeZ
    dg9omhVcG6MJPDeEyQttDB66N3troxpOV_8DnPaoalTr-VNUSyUNnop>
X-ME-Received: <xmr:iQOfaqrZO4Z7BJCulYQT6TrG60HiZlzFRDXyy8a0K6RmhQCnb71PaKsiOkY>
X-ME-Proxy-Cause: dmFkZTGqQC2Jf5uTmbrZ9IHMpLKMHTwTf8vZgahv+dbqM86a7GIADhyzyBKn+8z30hGxYi
    JdDYvnWJ1aShMrgwyCTEnmGqMb6tYFf750DVdCmSYTFOLx+Tr1yyG804g5VwXxu336yI6l
    6zVycKw68iUkXrefSacpJZvyFqpqN/zm7t3kC7vP4Q0H+B0U5TcLwi3Kb5oTxqwASil8yR
    yPsRAGvocXU2rV25Q6e2Zq2n+VpPsGujc/6lxq2CTx4orAXd34KmW5x0fBxGrwQoGpVG8d
    vq7W7xjZcTSZysP0Gwt5lGEw2lw7jGloKTLphiy6JNtlttF/KQb46faFXQDeP5KgdBeCn6
    70x7HItBLj+zqtRIJ8W/FRQu3zx+HeJdagMUVLQhLfG7esTNc9Uj0E97K/T+cG2u7KPu9z
    tDob6FASpCXCFDIavXHZugbOWHarPWT37AEabf6QgnweU87KCWMrmuWHG+kisA+F1la/QS
    LpFd7GAV3g7eybbOVOqRqLG3yLoUwdpFTNBixqEr4C0whuO7rPQQUkwHUFSaeZE4/iQ+Pf
    a+bOzP89N13YqRE7Ysf83Au4Fk2zxwapCi/uEEoKu7Y8+t3sw79xwnO8dXcAvofGGGrsxr
    /S3gyqKGeYXVRWuZ7hOb0OGyJ/LyC+e272N2k/VWtxLHA7Brlny4IKkToTug
X-ME-Proxy: <xmx:iQOfathAlH7BY-TLmTqCoPt8mVaOqIgTOdEVVV_2WK-OydFOrKJiJg>
    <xmx:iQOfanz0zWFgeDVICnJc5EmizxL6_F0B9Wa_C1DKXSH6eDS_KOOBmw>
    <xmx:iQOfarLPq3R1iQRaEMvvDKXA3DCtwjNNu2vfKbk0g_O_KqYg3Nst2Q>
    <xmx:iQOfas1B7eZjGVd8_iYJIcXidTBeOGWg8tNngjVbY_PxD43U5S3Jbw>
    <xmx:igOfasA-HIbX9cUeXjwgv7lo5N9Hqd43vnMiCxwIOpPgkRxDzXZV9yQg>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 14:33:44 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	hannes@cmpxchg.org
Cc: ljs@kernel.org,
	usama.arif@linux.dev,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	kasong@tencent.com,
	hughd@google.com,
	balbirs@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH] mm/huge_memory: add folio_reset_partially_mapped()
Date: Mon,  7 Sep 2026 19:33:40 +0100
Message-ID: <20260907183340.1446132-1-kirill@shutemov.name>
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
Assisted-by: Claude-Code:claude-fable-5-1
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/huge_memory.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index dd66c6ad5af1..23ef22c2b5db 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3972,6 +3972,24 @@ static unsigned int folio_cache_ref_count(const struct folio *folio)
 	return folio_nr_pages(folio);
 }
 
+static void folio_reset_partially_mapped(struct folio *folio)
+{
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
@@ -3980,7 +3998,6 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 {
 	struct folio *end_folio = folio_next(folio);
 	struct folio *new_folio, *next;
-	int old_order = folio_order(folio);
 	int ret = 0;
 
 	VM_WARN_ON_ONCE(!mapping && end);
@@ -3998,11 +4015,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
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
@@ -4516,11 +4529,7 @@ bool __folio_unqueue_deferred_split(struct folio *folio)
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

