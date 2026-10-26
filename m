Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004050;
	b=2Un+lZgalU0cNj4Sjd+45pFfSe1AeT9AYJW2v7Gu5eog5aTANdqpWlHkq9BRp5qpaNLt
	 2OlMb/qc3TqNut5A/wHOxShSUk1OOAevMuIL6HKI2857hCAXpik6EDzaYvA9ICZbP75MY
	 K7gSADQzEOG5i8H9Z61rjwmPjTv4GmwoA058sJlIkEhc9HU0RPAXh/Ht8hvf1NPCW8YCA
	 cpZrv4oKdlrdYBGkG1wfG3EuhJGucQeSNczzMuLmsa8q3HYQVLgCuqDMVDW2QJHSxq6cP
	 JCliQLsS9p0d7ryItCDf72pNt2pmS3/3Ri39+MZgNAHnC+odcc6Wsh0U+NinSaRTUFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004050;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IVuwUZCiZVCcOzmALM/+anMvBSOFJqql17OFoN+/rok=;
	b=sBEfZVf6dICsd1KN1p+q+0AYhguZ2FjcCJo/zJI07XN7fTsQ3LScHHe6j36cBSuI5RM2
	 hALESPcSSehurGiZ9u8qnI0t3m6fz0SUERGQay5CefzahNt0UC97z4bOQqyi2++6TABXD
	 cbMEdOFn2FObUJBXxrS8vDRItnXB1v7Xk2uwRlWOAt34QH4/10/9FueKv6ahW6n1feQpB
	 o/Fk4L8rEDlRfdkVVPK7ZoPr4bzsKHs8v3azYuxJ/s2g90Ks0rlFVIN3hiDMpUhokcJ2Y
	 9RUnFfxu67OUlKCTBnZJlWZSPJrqtq/p2sQ2tgILIr5b7YiwisMuFqsKQV24fMUMXRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RCN03E1x;
	arc=none smtp.remote-ip=91.218.175.197
Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B463C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RCN03E1x
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/Hf66diN7HgXIle5bCAln5FJ1fGnhiHCivfIINozcnI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793004046; v=1; x=1793608846;
 b=RCN03E1xlgO4yK4Ob1U8xBojil4CjKxYZZDKnJ8RZj2Ib0zamVlG5Qwct8U35ijGvEZ0OL68
 mTxMvUY4Sx300ppEZrXXrea0VSAssc93NUJycxcoF5iqN1PgTNVfERjONz9iVP/K7K9h7V0QpKN
 IADB/tVqIzczUeGPbLtGXcSM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 126a90acec0e74e9;
	Mon, 26 Oct 2026 08:40:39 +0000
X-Mizu-Trace-ID: 126a90acec0e74e9
X-Migadu-Flow: FLOW_OUT
From: "Hui Zhu" <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Yu Zhao <yuzhao@google.com>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
Date: Mon, 26 Oct 2026 16:40:35 +0800
Message-ID: <20261026084035.535989-1-hui.zhu@linux.dev>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hui Zhu <zhuhui@kylinos.cn>

lru_lazyfree() calls lru_gen_clear_refs() after lruvec_del_folio(), but
lru_gen_del_folio() has already cleared LRU_GEN_MASK, so folio_lru_gen()
returns -1 and lru_gen_clear_refs() exits at its "gen < 0" check without
clearing the refs or PG_workingset.

A MADV_FREE folio therefore keeps the state it had before madvise(2),
even though madvise_free_pte_range() has already cleared the accessed and
dirty bits of its PTEs.  lru_gen_folio_seq() places it one generation
younger, and PG_workingset puts it in the last tier, so sort_folio()
promotes and protects it instead of evicting it and charges it to
lrugen->protected[], which read_ctrl_pos() uses to balance anon against
file reclaim.  __folio_inc_gen() clears the refs but not PG_workingset,
so this repeats every time the folio reaches the oldest generation.  If
the folio is redirtied first, ttu_anon_lazyfree_folio() keeps it and
lru_gen_eviction() packs the stale state into the shadow entry, so a
later refault is promoted to the youngest generation.

Call lru_gen_clear_refs() while the folio is still on the generation
list, as deactivate_file_folio() and folio_deactivate() already do.  Its
return value only says whether the folio is in the oldest generation,
which lru_lazyfree() does not need because it re-adds the folio below.
Keep folio_clear_referenced() unconditional: the classic LRU needs it,
and it also covers the folios that lru_gen_clear_refs() skips.

Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
Suggested-by: Barry Song <baohua@kernel.org>
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
Changelog:
v2:
Call lru_gen_clear_refs() before lruvec_del_folio() instead of
open-coding the flag clears; drop the lru_gen_enabled() branch and
the comment (Barry Song).

 mm/folio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/folio.c b/mm/folio.c
index 35e242b48870..ea3adb6a89d7 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruvec, struct folio *folio)
 	    folio_test_swapcache(folio) || folio_test_unevictable(folio))
 		return;
 
+	lru_gen_clear_refs(folio);
 	lruvec_del_folio(lruvec, folio);
 	folio_clear_active(folio);
-	if (lru_gen_enabled())
-		lru_gen_clear_refs(folio);
-	else
-		folio_clear_referenced(folio);
+	folio_clear_referenced(folio);
 	/*
 	 * Lazyfree folios are clean anonymous folios.  They have
 	 * the swapbacked flag cleared, to distinguish them from normal
-- 
2.53.0

