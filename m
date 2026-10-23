Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742680;
	b=lwjdGLA4q2fa+p/E5pauifhLVV1C1536TDmtOf+z7KLdPgmzQyK9nUBQ5sJMTqtMbN/X
	 Uc2DbDyqYyicspQKXnaNmLKlc9BbWcl3ad9lKZioWnTP3ojUtZsap8DXHhxAEvSkeQSDV
	 bH3EpIREABEKhEi2qeYno9sCTkXiNpPtGjtjjNwNMGFk8/mywO4LhrCu2X4AaMESLoKGe
	 7RdQI4QbjQ6Z328U+gEdMWJjoRP6RV0e5UGdw+xp1GkaL/OI613FqKt0dIijZJgqTIxVp
	 bXsxSWTDT9iQ8QEudYCJNq0WJMAo5DRX8u73ToSyffru38YmAsKS6rChjpJoaxjjwzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742680;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1aER1x8VPZMKUcSsoignSKfToUokcEBP6tnK+zyf6o0=;
	b=3K9APiZ0Z2SnxmEJ+9EXMNwoUp4KuoeE8tXckZPcBjMsr4GxBmquP8TXyRBSe/y47ay0
	 AU520kMpv1uhcdoS8iN3Gy9YVd0MgnXub0KUhOI5ext0TRlDW4/ru1iPzSaWhLBE2MHec
	 uY7QcIakgcYAUqtNqFPHb5Ajvu14WvIweI2hTE3g/y4a20u2lyvx3Pgj63rFzisQr/Cdz
	 gb6oxb/rzOvpM6tUjJNwhv99ZB6znxSVkF940AKbLnC2LU7b2XbNx4ZexZkltkKhl78w1
	 ZiIyhEUif9SYrTQdnBsOoPyin+q1aZFt4JAmunFmKidiDXc01ex3DwwiSq+5Ed5RtBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nAzBZwsg;
	arc=none smtp.remote-ip=91.218.175.122
Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5717B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5717B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nAzBZwsg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wjMZ4gCT6bzoDVek/8Cu8ceb5A5pr2WKbPw8oouSwcE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792742677; v=1; x=1793347477;
 b=nAzBZwsgeopV6uQ+/Fn0Kx/w+ClYMIN84t4plX6nr/fcM67GO0JuTQEaboP92JQsLx5q/Cs6
 xyjRvNAbPabgq8bJ9cqIX5FQf9eQkxRJGIFgh1dWIqYi91F0mACjm02MEDCvRUftXYW4UCUHyON
 eIjWD82mwJDMPprCAB8DeNFw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 521efba9aa20a663;
	Fri, 23 Oct 2026 08:04:37 +0000
X-Mizu-Trace-ID: 521efba9aa20a663
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
Subject: [PATCH] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
Date: Fri, 23 Oct 2026 16:04:29 +0800
Message-ID: <20261023080430.465305-1-hui.zhu@linux.dev>
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
clearing anything.

A MADV_FREE folio therefore keeps the refs and PG_workingset it had
before madvise(2).  lru_gen_folio_seq() places it one generation younger,
and PG_workingset puts it in the last tier, so sort_folio() promotes and
protects it instead of evicting it and charges it to lrugen->protected[],
which read_ctrl_pos() uses to balance anon against file reclaim.
__folio_inc_gen() clears the refs but not PG_workingset, so this repeats
every time the folio reaches the oldest generation.  If the folio is
redirtied first, ttu_anon_lazyfree_folio() keeps it and
lru_gen_eviction() packs the stale state into the shadow entry, so a
later refault is promoted to the youngest generation.

Clear both flags here instead.  lru_gen_clear_refs() only reports whether
the folio is already in the oldest generation, which lru_lazyfree() does
not need, and moving the call up would still miss the folios that are on
the classic LRU while lru_gen_enabled() is true.  Use
folio_clear_referenced() rather than folio_set_lru_refs(), which is not
defined without CONFIG_LRU_GEN; PG_referenced gates LRU_REFS_MASK, so
clearing it zeroes the refs count as well.  PG_workingset is cleared only
while MGLRU is running, which leaves the classic LRU unchanged.

Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 mm/folio.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/mm/folio.c b/mm/folio.c
index 47a437e0f7fd..03be101334eb 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -599,10 +599,16 @@ static void lru_lazyfree(struct lruvec *lruvec, struct folio *folio)
 
 	lruvec_del_folio(lruvec, folio);
 	folio_clear_active(folio);
-	if (lru_gen_enabled())
-		lru_gen_clear_refs(folio);
-	else
-		folio_clear_referenced(folio);
+	folio_clear_referenced(folio);
+	if (lru_gen_enabled()) {
+		/*
+		 * lru_gen_clear_refs() skips an off-list folio, which
+		 * lruvec_del_folio() has just made this one.  Left set,
+		 * PG_workingset keeps it in the last tier that sort_folio()
+		 * protects from eviction.
+		 */
+		folio_clear_workingset(folio);
+	}
 	/*
 	 * Lazyfree folios are clean anonymous folios.  They have
 	 * the swapbacked flag cleared, to distinguish them from normal
-- 
2.53.0

