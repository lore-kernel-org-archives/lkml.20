Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BFB3DA5BB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167729; cv=none; b=VF16b/bYDOeyUGPpYrbqeAwHQs3+HWDwCIb/RSJZT7j7sUDcxVqInpk7V41iBKJDvFytbBdbpAVqKCB/LSDqsf0Q184iuZg2iYdNQ1ZznmQKMBsVkDvpf0a1QqWydmZs8+GXBxgidQTrd4BR0iswQuXWO2iGrtPJEOClmyzcl14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167729; c=relaxed/simple;
	bh=+BpqImKEl1d4SWGfqnqr24ZoQWoNxtcDa4nM5DrwYyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlXFoC7XYo0BCyIiVYp3x5Ngb4dXVmxxkV9wSs+lnMbSddtKY/5LI/1wpgNNebdzO0aJBA96wvUldn1/qQ8xBU2tPDmoiNLWjcMyS37dRDxbvioqA02oC4ZrGR8wxKPE3X3rpH1gklop3dxzhgd2YR5ZeC5xp1/D8PSfo5nAcCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=fcR2jm6C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CJMTJzfo; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="fcR2jm6C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CJMTJzfo"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 217C61D0014D;
	Mon, 31 Aug 2026 05:15:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 31 Aug 2026 05:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788167726; x=
	1788254126; bh=NqgofFrqJs4ETWj8xuLHj9ApbqMz50mEmPNwk6wgLEE=; b=f
	cR2jm6C/V4IY41xHS15IKG85ZwcrUh4pMEmRpp7f5ZsZum9kSL3GbyHp455QuhJJ
	o9TwRn9j4m9gPQbKRxpyjOopxlmh1UV1Rg8BS0eSNu64vkd93PB1F/vcszmeiBVy
	HD93vBM8bX+gBBK9nK6zeBIOeGb4o5vwhkABLJUWikBPWOYosxamvcIoNn2CKqni
	KKxSrmDxmtZaX14/kesLYFhZpq0CejLfoMzMzsVNv4vtzwc0GX/RGZbjgwA0fCc3
	XlAHKmymyRgr4Dg298a/692LZh3DCsM+0vgw/llfNLcTCbFznL6udofH7R84AaWc
	tW0+BkOE3VVcf1Vjq7yKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788167726; x=1788254126; bh=N
	qgofFrqJs4ETWj8xuLHj9ApbqMz50mEmPNwk6wgLEE=; b=CJMTJzfoTt8s0MKKy
	l9ZKf9Oo4H9FY3L7CAbsTs4wy+hyy081aK6wMye3AGUswKbgFl268KKetpJiXm6C
	61mL1T3X2I1iosbQklkoC/tIc5YvY+f38bkv5TPHRNa9vEwwRn6miWJCs9Y2C8a9
	HcCJkkip/a8q5eYh9HkSUiWN6x4LuCX13fMTFFNbLz7JCkmXNvVAUSrYaqwu77m6
	LK8HbOPvSoRBh0ZCEBZRbvZtmDKCR7H2yzxDFZzei5hUmIeI4G0rzA8xYB/3sUyL
	q81J6HMb823HiolflMUi/6mhfJ92uITOWS4aeb8KTrSh+gN5GbHYf7RH78SShWXq
	Cp+xQ==
X-ME-Sender: <xms:LkaVap6h4Diuxa70wKf6Zk3pBDNNlW0fz2WvXaGCv41qdz98rHZTBw>
    <xme:LkaVaoRbm2yEY7rpCPPllcxTj_JuaWwyp31KJtTRNv9CVyvJQq-Mic7X0000tXnbA
    4d3ddWytV0hTtKk2j0w_oQhTc7inEwZaSpeQQaGzLodcp-XdZpU7z7x>
X-ME-Received: <xmr:LkaVaptOxUNsMJGHDW9yaRfu76LfMW9XJ4h5BCn7acVaQ0OyIw8xQu43KcM>
X-ME-Proxy-Cause: dmFkZTFcRUhM3Zr++qTeuXqzgqev2iSO2i3tJr7sWTfimjNXLwxwezbYkPtS3Skrw4wCeu
    hB+0iGeyBWtjggCSoc35QjhhmS00JMKmOgJEut4Ct++NOWC10REp1NN/4IOqY5dsO4l1f4
    gP1FV6kPMNVEQ8onKucrSpXYJK74vXqQKGY4uqa2gnPNr+/ROvtSYsfrIeGHPnmAnfaS6E
    V1ORiZ9KPZkcHkdT6umNxe9a4/CPUzYo6r+8m18f3Z8ECaah2X43+YqjWClkPctYm6Kc3C
    P5xq4exik83xGj+e6EawFlEeUuXwSaeQP0argW/Ekam3If5jN1Tfq7ZvbPo6Gfhahv9TbF
    sA6MfcoJ0GcJiMzbXWPdxL5YUcw7LWL8ZQtNgswhm7B+1VWee+/C6+iERjEZ7vqRs48h+x
    la1PySOF2Jn4GVrHGYdqfeuxJ33L1aR0igXP1pyrWKg4k7Z8G2mWVhaj4JdhYo9sW3MRjJ
    xHqSfyHhLARwZ8e6NKnCirhAJbg+26k220y7ZigCb1buJasE8RYuE4c2Z+Zti2LL9kvoPY
    ISF+0aWKBiqKM3BBz2oGE90vijlie4BZDpG45V6B5vmqnQU8WlUUnlzMAAV/l/P3XDhIUe
    LOv9EUOU79DP+aEXDvkDbx4XWDPWmNugmrr+KF2axqNGhaAOuRiqm3f8BrOg
X-ME-Proxy: <xmx:LkaVaqZwfARpFkPtwNRj0zRoiuUyenVZh90o6P8wm_hgI8LbCYvvyw>
    <xmx:LkaVaj8k35icYBSfm9OD23K0sdEve7-rCrUMxmt-kKDAr9gmLvdcSg>
    <xmx:LkaVampmirLyayBxn6dFAEQHeD6pyAO1jK6xBtd8gA-c03-yE0eLyA>
    <xmx:LkaVamEpmGTJL2V2BRn2V9w9oKp93NTp-PeURSu2CGcRTk2cl8Sf1Q>
    <xmx:LkaVapPTAWTzIGJSS-1Jus9MTLcuEZ80kvMebydujEz6KA1xS9SFBGb6>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 05:15:26 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hannes@cmpxchg.org,
	usama.arif@linux.dev
Cc: lance.yang@linux.dev,
	ziy@nvidia.com,
	kasong@tencent.com,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	balbirs@nvidia.com,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm/huge_memory: dequeue the deferred split after the split freeze
Date: Mon, 31 Aug 2026 10:15:14 +0100
Message-ID: <20260831091514.1879786-3-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831091514.1879786-1-kirill@shutemov.name>
References: <20260831091514.1879786-1-kirill@shutemov.name>
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
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
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

