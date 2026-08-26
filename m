Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F8345DF43
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761277; cv=none; b=Wp0cW+3qoWj5Qshu6gFH3UDbNWkqGDYdBopWJSJw5MQkkc6WqZv9bFlppiqdaWoq1fbm811IVXBENyVOURHi0XlkJkIhvBo3IxhH/CXpKkkSsriCYtrlrcSt/IbYvzlYMEA5v5iZIL1L1dqplyfHv1NUcEF21kuck3lq7OK4MlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761277; c=relaxed/simple;
	bh=8l+SG+0GSoAWxIK2FePeoZd140FIivvIxWQd8CZzXR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWhur/7aULN99YDb1B5vmhFmnJNNQr42dfJa1rAQkXVZ+L4YMVswLYxUlNvxkcdl7IHn96NWKzmKE9cFiPJMBth7XfPrqDGgUzjQRXpvLeha2EEiJ01st3mLbYHc0R0zsamklmCf8yjONizK3Dh8q0u/xGK3nK3+mO8Xy+6vqAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=JJCT6qtw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gBuq2dbD; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="JJCT6qtw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gBuq2dbD"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 0774BEC0113;
	Wed, 26 Aug 2026 12:21:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 26 Aug 2026 12:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787761271; x=
	1787847671; bh=PZqn9LaepqaNPDOa8Shpk8ydDkhLYpgCWjChGLGqhJo=; b=J
	JCT6qtw1TNo+6ZXJEUgoeGsTvCjHGxQqp1NcbZMgFYTLMf/Ryj5Hz7icUY3Pr/sc
	+7xVeds8ASJjsQjE9FcSIIboIFBK1fcUH+ztxFTpVN+WGMclCAPu9EgPhAZk04Nn
	QyJD7Pdma5BReYyxUOCmG8y/TrFz4uo9oOP2M5M50rTYdLS2eJEdkmrrJVq6N4jj
	HpBp6dZnxXI2PSe19rDVa530BLt4FlGOZukEfNJWOQoj5KWg4ySCC5bBQd7BOgad
	z4O8phZsYRu+e4eqsFYBMDOqVVJ39gXLG6vNJjd+L2KfMxLmkyOEKIdAhboQkPM/
	t2RI71aBc3lvc7Trz8omA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787761271; x=1787847671; bh=P
	Zqn9LaepqaNPDOa8Shpk8ydDkhLYpgCWjChGLGqhJo=; b=gBuq2dbDYWOj+PqoS
	5YnH1V7B2iONpL3uJRh34zzuEmsIeJ3nN5s96n7f4n7t03BhgGANMlpwuOyzLCUd
	BWUPg7cQdp65S5pDGR5moiuMNQbI8lvDyLQvizWzPtuV4yxQJzPYCUYNGXwMatCz
	6PC0g4/c/iUVwIw9UrosYun0yt3dTs05mfNnH7L5l/mDKSv5NBUU9YB2cP9ENbhy
	86/U+d0uUq86s9v/FiiiIHUVPSFSPmFBZYU0u7qVIZBxiWahCG66G3aOdtG2xpIp
	brIyM39rjo9oXv6C5QZuKg+ggJuXmUm/etuV08zKxNR7FPvwdzkxXG2E2zc+aYam
	2eA5Q==
X-ME-Sender: <xms:dhKPaiHzC0Z3IsWLOD-tzLBL7oICTxPjbjzxmEo9V_E50h8UQkY2Cg>
    <xme:dhKPavTpNplNagd-JgowgUm1vB5WglLQXxafq6fNfun3eIW_afPWVNj35uMtVG_GK
    kHohqxqkFVtKs7IRRPu16MDZt0ihi6ph5iaBJYmpEYAsmQT_-57u2YX>
X-ME-Received: <xmr:dhKPaiRxZJoMFLYqiemS62JDvIzKWxVlVNGmsPJT8nx_qQrI2R9jFGWO3fc>
X-ME-Proxy-Cause: dmFkZTEpX8HBQysEAMlAbdyKFX4BLzWtS7+Qo1RjxAJeMJnS381384CQaxM92QA8W5J6jo
    7r0RHbsPcTs1IpTXqcOu2ofgimA8w2hMK3OeOMvPUWs2NDJNBlDL/23E29uU3eWq90a8Ny
    uayj7GqONoh0NEQ91mQ/H+TE3rTPuVZ+wfrdHbeyaEyRe40ZIUYJyXTHqnubEDskXnqfPu
    FIQsvLmT+4mxeisAsg0TmWv4Y7l9NdKef8tTMihpDmjKvNxij8lw310+ofBfGEkzSLqnuN
    AyozbfZUQr702Kz+RkXguKuGQfBCnKcQhC5EFdpLjS6L6jWqh1sGvO+4Vl+gX27JPRP8s5
    lSLckIYbxH/PtXTLtZPr2I496n1Z+5615svwkDFxhaNmgGpzGejMidUwbOUxLRdGuc2rZg
    w7EVq4D+yvMbxQ0bVxFYShdTuEeXaZWypH5RocS+FySPsN9RG8ZDbzvlUocKn67qn9YbT5
    m67TyzmbU49Yi0FJGi35Qm+jJUodzTwAIvcGJ25Find/PYmX3P1CefFAlt3ZqvUQWexH84
    GlGmeFWqYBMh43kqHoCd/fKRbITSkrbofIDfxV6HWHoS9gj+zSqQXSaqCKI329GRnYyGjV
    uuBti6l727veyF9VwljNVqtrv0A+Lea3+P/SoIQNmbyiZYUvBbW0UmRyQ0sw
X-ME-Proxy: <xmx:dhKPaiddQKIj37r_RakJb_-6ElPjFy0OR-u-ArK74qG17tMTafJS9g>
    <xmx:dhKPamdmzKedlfm6rrLJEChFZc-HJZPw0SYE4vlNZkOFTX1uq5fhew>
    <xmx:dhKPao-_JGxzGUylsIv3T4VYrdJ7I52r51lN-TdJ3AtTpPItm_Ddkw>
    <xmx:dhKPamMpM_ThHrwvuNcTpXjsCsubtDpaWzPa2MPdbH0wGQ3RanJxcw>
    <xmx:dxKPamO-VYWwj7r7ldMJSWsuH7fx-Zbo9LskAzojuJzBfZ7KXrKiCQl->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 12:21:10 -0400 (EDT)
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
Subject: [PATCH 2/5] mm/huge_memory: dequeue the deferred split after the split freeze
Date: Wed, 26 Aug 2026 17:20:58 +0100
Message-ID: <20260826162101.1314941-3-kirill@shutemov.name>
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

__folio_freeze_and_split_unmapped() takes the deferred split list_lru lock
across the freeze. It is only there to stop deferred_split_scan() from
touching the folio under split.

With deferred_split_isolate() fixed, the workaround can be dropped.

Unqueue the folio after folio_ref_freeze(), the way
__folio_migrate_mapping() does: folio_unqueue_deferred_split() needs a
zero refcount and a memcg still set, and both hold there.

If the split is called from deferred_split_scan(), the unqueue is a
no-op -- the folio is already removed from the list. But
PG_partially_mapped is still set, so it has to be cleared here or
MTHP_STAT_NR_ANON_PARTIALLY_MAPPED never comes back down.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/huge_memory.c | 44 +++++++++++++-------------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 6281ed993243..c84e8cbc986d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3931,41 +3931,27 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 	struct folio *end_folio = folio_next(folio);
 	struct folio *new_folio, *next;
 	int old_order = folio_order(folio);
-	struct list_lru_one *lru;
-	bool dequeue_deferred;
 	int ret = 0;
 
 	VM_WARN_ON_ONCE(!mapping && end);
-	/*
-	 * If this folio can be on the deferred split queue, lock out
-	 * the shrinker before freezing the ref. If the shrinker sees
-	 * a 0-ref folio, it assumes it beat folio_put() to the list
-	 * lock and must clean up the LRU state - the same dequeue we
-	 * will do below as part of the split.
-	 */
-	dequeue_deferred = folio_test_anon(folio) && old_order > 1;
-	if (dequeue_deferred) {
-		struct mem_cgroup *memcg;
 
-		rcu_read_lock();
-		memcg = folio_memcg(folio);
-		lru = list_lru_lock(&deferred_split_lru,
-				    folio_nid(folio), &memcg);
-	}
 	if (folio_ref_freeze(folio, folio_cache_ref_count(folio) + 1)) {
 		struct swap_cluster_info *ci = NULL;
 		struct lruvec *lruvec;
 
-		if (dequeue_deferred) {
-			__list_lru_del(&deferred_split_lru, lru,
-				       &folio->_deferred_list, folio_nid(folio));
-			if (folio_test_partially_mapped(folio)) {
-				folio_clear_partially_mapped(folio);
-				mod_mthp_stat(old_order,
-					MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
-			}
-			list_lru_unlock(lru);
-			rcu_read_unlock();
+		/* Take off the deferred split queue while frozen and memcg set */
+		folio_unqueue_deferred_split(folio);
+
+		/*
+		 * deferred_split_scan() takes the folio off the queue before it
+		 * splits it, so the unqueue above finds an empty list and
+		 * leaves PG_partially_mapped set.
+		 * Clear it here: the flag does not survive the split.
+		 */
+		if (folio_test_partially_mapped(folio)) {
+			folio_clear_partially_mapped(folio);
+			mod_mthp_stat(old_order,
+				      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
 		}
 
 		if (mapping) {
@@ -4067,10 +4053,6 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 		if (ci)
 			swap_cluster_unlock(ci);
 	} else {
-		if (dequeue_deferred) {
-			list_lru_unlock(lru);
-			rcu_read_unlock();
-		}
 		return -EAGAIN;
 	}
 
-- 
2.54.0

