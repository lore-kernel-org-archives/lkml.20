Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751872;
	b=LbmHUwpHI7/HcQTKe8gm+GK1oW0zmS+ipi/O0GnSv2K5T/Ita5awtk+pHX5eWzEOuMLL
	 hG09Owa7Mo3k4ZOtZZprCAq3t6PT37QY5hiXus8eDB53LdhbBAz7ooUQmyERxsz6ygTCN
	 ts73mQkxf3sewS+yyqCpHjnPQr+a/G3oGJMXGodBhsIlHx70T9mSE9JAJkuhEFDo3dFhJ
	 42gIyN7x3xCjztwcrEUNcuoMLA3anagZ4ckYbpRkiro0C77pFTqDkJtUPY1EUf4jG7bkM
	 Afufa4NEIwSLbqcPfR9tt2XatfqzbAmp7apsIp+kfCNmuV8mrpdaZHk9QTQstl8jqGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=twBYW96D/454ufOiYalNWpWEiQb6CO3slFCMac5mtJ4=;
	b=DWcOIyFu82DyLthULB3zuLxdEIyVoua4TYfTsPyinXUoZ4rB5TgIRoEo3jlYuMiFZeHw
	 VJcRHZCXew1WC5yGXrqAuD5BHfmjwFYLbq+kJCiK6Mxvu1DYoRCLCZknDJnVpCWv/0AFE
	 M4a8OUscWXP1DuJmgx1QGxoCvmpNMdlfRCZc2LXVvh2PUlDREKHC/W8OLhpq2AZNnfov+
	 ivhZf1CRPT7lmQqJz9jPgAqJ86ABDnAm+49rDs8KvkhMTJIHsHvR4e9KR7TP2yn+Oa186
	 uSsNW36+ssQcicLZBmeu+2YMrkS/8egfLTVbrJn9JZ8GWszI0X9JEvFPTMtLMT3Lnxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--bingjiao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H+Wj6Iqp;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F7A606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F7A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bingjiao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H+Wj6Iqp
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so418656eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793751871; x=1794356671; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=twBYW96D/454ufOiYalNWpWEiQb6CO3slFCMac5mtJ4=;
        b=H+Wj6IqpE7vcoDRbDdjRRebWdG3M8CyxKh+oh9IQgJuSVwET4d5b6op16eczAOc7fx
         aaXUUHm+lTehAieGe8mPdoMqhGZ6IIhBx6ZymzmagZB/6OZY4FwJd6ufw7N4FvT5VbqI
         SH9BmzxjHXfs34pcFd2nJHOIn75dL8qtdEVK5F5iH3D3hdvf6SoWil8b02gAbphNwKt7
         /nuOXVMH72k2CQ1LPQskfxMlze6Rln6HzPoDaCSLkZOmj9BiKLkwG+eSpXI53oC2JRyG
         3KLQHjdahPoP9sYbu/CbAP39oCGYXCWfasdYtP6CzWCa6ZXEea+JvpEnC6qA7QU7Y7cy
         Pvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751871; x=1794356671;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twBYW96D/454ufOiYalNWpWEiQb6CO3slFCMac5mtJ4=;
        b=Xb1Q8+kJzBELRbgXfzasf2aoL0ZiHelyNmOXwOV1NS5WuGJV3BSE1oOf8dL3D+LYUa
         Dfq7xtHnj00UsoKzVjBhGD1s0eBIPwtXsh0bBKJ2iaqnsgCWbaH7pVyrLLzZAhV/qhy8
         Gqrv8gGy5KtegWXVdaouQJDF029m9ezsmlx5cQj6/3yOXc/OOwRy2EOJyNY9WiPefUXq
         QhDE+amcU8MjOPdAkhJnBNVE0jdCO4iDauUntyQVNIOUNqomUt1yGKX6Vzwme4fUUqN5
         Jug1CLL0cLBKLOtDChQyxJgT01pbSqUV9dz2WB/wrOfwRdQh6phSV0TGq6Bc/MCXtOhS
         1AMw==
X-Forwarded-Encrypted: i=1; AKwUvBxk4wnO7OvaOOTaunIxWZGY5M85eKFzaFxlENJVG8gRmhqvSBMxPpfgdsL6U7DIDW49CiHsQzf6gkFArK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y5VBVhEPuEQ9gXjQR/pWu8esNIaeGpOEGrPkW7M3BG48uW2BI
	FERyam8rMPADSMYV5Z3gGtszxryEPl2rp/tsumipOojd9gMVzo7PXvFisytb4H2HMXAOhkRVu3t
	dPEvOw0vwZpjfIw==
X-Received: from dli22-n2.prod.google.com ([2002:a05:7022:296:20b0:15e:bc16:429a])
 (user=bingjiao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3717:b0:166:af48:a2ba with SMTP id a92af1059eb24-1ac4fd0136dmr21174886c88.0.1793751870929;
 Tue, 03 Nov 2026 16:24:30 -0800 (PST)
Date: Wed,  4 Nov 2026 00:24:20 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104002420.433876-1-bingjiao@google.com>
Subject: [PATCH] mm/vmscan: skip lazyfree folios when demoting in shrink_folio_list()
From: Bing Jiao <bingjiao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bing Jiao <bingjiao@google.com>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Oscar Salvador <osalvador@suse.de>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Yang Shi <shy828301@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

shrink_folio_list() currently demotes lazyfree (MADV_FREE) folios to
lower-tier memory instead of discarding them. In the earlier patch
series [1] that commit 26aa2d199d6f ("mm/migrate: demote pages during
reclaim") was based on, demotion was inside the PageAnon(page) &&
PageSwapBacked(page) block with a comment to skip MADV_FREE pages. When
that commit moved do_demote_pass above the block to also demote file
pages, the PageSwapBacked check excluding lazyfree pages was dropped.

Demoting lazyfree folios during reclaim does not make sense. Userspace
already marked the contents as discardable under memory pressure. Even
if MADV_FREE is treated as a cache to avoid page allocation and zeroing,
folios in shrink_folio_list() have already aged to the tail of the
inactive LRU, and demoting them still allocates a new page on the lower
tier, copies stale data, and unmaps the PTE.

Skip folio_test_lazyfree(folio) in the do_demote_pass check so lazyfree
folios proceed to the normal reclaim path in shrink_folio_list().

Link: https://lore.kernel.org/r/1560468577-101178-6-git-send-email-yang.shi@linux.alibaba.com [1]
Signed-off-by: Bing Jiao <bingjiao@google.com>
---
Note: An earlier RFC ("mm: Discard lazily freed pages when migrating",
https://lore.kernel.org/r/20200228033819.3857058-1-ying.huang@intel.com)
proposed discarding clean MADV_FREE pages inside try_to_unmap_one() for
all migrate_pages() callers. Reviewers pushed back there because
non-reclaim migrations (compaction, move_pages(), NUMA balancing) happen
without memory pressure, when MADV_FREE pages are expected to stay
around for reuse. This patch leaves migrate_pages() alone and only skips
demotion in shrink_folio_list(), where the folio is already being
evicted.

 mm/vmscan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7db6be53f3a9..47448c47fc04 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1347,8 +1347,9 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 		/*
 		 * Before reclaiming the folio, try to relocate
 		 * its contents to another node.
+		 * Skip lazyfree folios so they can be reclaimed directly.
 		 */
-		if (do_demote_pass &&
+		if (do_demote_pass && !folio_test_lazyfree(folio) &&
 		    (thp_migration_supported() || !folio_test_large(folio))) {
 			list_add(&folio->lru, &demote_folios);
 			folio_unlock(folio);
-- 
2.56.0.455.g6c5a503b38-goog

