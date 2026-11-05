Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884983;
	b=V+x8JgSLtPdtYdlYVLNqFBoJbT9S+9pXlKIHoPpMP1i5syRa62wGSz4vMgxGqE16bLHk
	 1ODXZ11ivDA7Pbqa3YzI8OOob35i0eXUiZlBs2iMFOk/FMaJHytfNruEafHeYsaCNOGMV
	 E22l/FXzeTN4lips+kyWKXs4xNUSamNufAzEwBFwqOIKU/MBsx8Pkuzg504s2oXgnr85C
	 tsZA2qWuhMUEMOGpWKhtvJmT62xRS5s1vSBH6OUTFjtOGcDnnjMtH2Cifl3T6N+7tJ7fp
	 3S0ytd7up/ltVjJzjQjU6Lt6I+a6LKIGIqLBkKpJBo5C/J0NYtRx4bqQNBijscusZtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884983;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iOupAXTYNfoednpq0XsVSpZ+gvJVRJ03mA/cqdjPBdI=;
	b=HGSl+qH8VC53bqkhyxGgCNTErpVzU3HuCmk1+h9L5v9MJDGRT5NaNfXeNjs3c/AXd9qV
	 vXIkpqUTBQ/gExapdDnN+jGh6NKJL8EEBE55JbxuvF/OtSBQuE/ZWBhXMIkRknLyUGPTF
	 8Lbok8iVgXArNwcP1eWIbnS6fZbGjcciT2YxgQI67fcv0E9cdMtKjoED/3HfhIJDo9spB
	 zVIzACzexiC4k6L92klM2FJ+VY3fQF3U11o2tBDj2UILLjzMkg3oHwBD/JbiB2Z4up/R5
	 o1xlgpUCatnC0hDrvSTnGLQhPxrvUxzBP86C2o8F2N4hcTOsw+yrtxMZ8AnchUEJ3Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ed6ednr4;
	arc=none smtp.remote-ip=91.218.175.2
Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6035606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6035606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ed6ednr4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gedQzs9cofqnO/3Mo6G1fafF6KlRIBhBesFXSxuBcbg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793884981; v=1; x=1794489781;
 b=Ed6ednr4nfdPMGN/KpjaFwJKHYmNrMTRbel0Q89Dd3UnLBKbi2v/fBNZYYPG0K4j1ZzG56pr
 lV9/Op4phvY9Alu9pePz3ifHmgyJMyf65D4REoemzVAV+2QjlukOVgwangNmmYHPuV5QoEw//2M
 2NwL9zNJpTliTJtF0HtMDNM8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cca60b9dfeddce6e;
	Thu, 05 Nov 2026 13:23:00 +0000
X-Mizu-Trace-ID: cca60b9dfeddce6e
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [RFC PATCH 2/3] mm/mglru: skip the flags cmpxchg when nothing changes
Date: Thu,  5 Nov 2026 21:22:19 +0800
Message-Id: <20261105132220.2233677-3-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105132220.2233677-1-ridong.chen@linux.dev>
References: <20261105132220.2233677-1-ridong.chen@linux.dev>
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

From: Ridong Chen <chenridong@xiaomi.com>

folio_update_gen() and folio_set_lru_refs() always end with a
try_cmpxchg() on folio->flags, even when the new value equals the old
one. The locked instruction still takes the struct page cacheline in
exclusive state.

That is common in practice: a folio mapped by many processes is visited
once per mm during a page table walk, and after the first visit it is
already in the youngest generation with refs cleared and PG_workingset
set. isolate_folio() and the eviction paths also call
folio_set_lru_refs(folio, 0) on folios whose refs are already zero.

Break out of the loop when the flags would not change. The result is
the same as a successful no-op cmpxchg. The only difference is that the
full barrier implied by the locked instruction is gone on that path.
No caller relies on it: the eviction and isolation callers run under
the LRU lock, and the others (page table walks, folio_mark_accessed(),
lru_gen_clear_refs()) only care about the resulting flags value, which
is already in place. Note that lru_gen_inc_refs() already returns
without any atomic when refs is at LRU_REFS_MAX and the folio is in
the workingset.

Tested on an i7-13700HX with turbo disabled and the performance
governor. N processes map the same 2GiB tmpfs file (huge=never) and
read every page, then one aging pass is triggered on their memcg
through /sys/kernel/debug/lru_gen ("+ <memcg_id> 0 <max_seq> 200 1").
Time per aging pass in ms, median of 5 runs of 10 passes each, averaged
over 2 boots of each kernel:

  processes    base   patched
          1    32.9      31.7   -3.5%
          8   195.1     160.2  -17.9%
         32   755.8     592.2  -21.7%
         64  1597.2    1260.6  -21.1%

With one process, every visit changes the generation, so there is
nothing to skip. Before the patch, perf annotate attributes 53-58% of
the walk_update_folio() samples to the lock cmpxchg in the inlined
folio_update_gen() in this test.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 include/linux/mm_inline.h | 2 ++
 mm/vmscan.c               | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index b3d85fe91385..4ba9079f4dc8 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -244,6 +244,8 @@ static inline void folio_set_lru_refs(struct folio *folio, unsigned int refs)
 	do {
 		new_flags = old_flags;
 		lru_set_refs_flags(&new_flags, refs);
+		if (new_flags == old_flags)
+			break;
 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
 }
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 50c352e9ffef..3fa76715382d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3398,6 +3398,8 @@ static int folio_update_gen(struct folio *folio, int new_gen, int *type,
 		lru_set_gen_flags(&new_flags, new_gen);
 		lru_set_refs_flags(&new_flags, 0);
 		new_flags |= BIT(PG_workingset);
+		if (new_flags == old_flags)
+			break;
 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
 
 	*type = folio_flags_is_file_lru(&old_flags);
-- 
2.34.1

