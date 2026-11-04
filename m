Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797783;
	b=E6U7BPaMI7aPnEd3LmVLHExfA6YV2tubR7GCwLxBLiW3VUNRSQ2slIxz0/QUfR9AknDC
	 4W4UgQWSQkBNVKfWpK7WwsNIU5yGkxi2dlyo01wRQqoopY48kcZPP3yl8evo1Ni8M1ZMO
	 1WkOnX0CJu07CAs6VsmN82UXrGJU2kAkjT9xYBTDWKOzrVwRLTgEd6YcQRCu6Go6gQdtg
	 AtmdjsofGppdXYmv/ecKb0T/6K99Ok4jEXvFxmkiamMcebXjlH3bq/xjj6nRAUeJt0zIY
	 HoJ9BzCAtL9eCpfZRmnCXaNIrqUfrwezfPGWJDNHVEmZytQ8ezLZZlkSJwzKrg9nXsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797783;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/skrqwzRK+TZos5jaK0kk6gfuh7AaBo1C+sjf52eRmg=;
	b=TeJ+5kcnhgGnHIVNhXJ0+hyt9NmlRaD2GXJqIcniI1cX8/Ay6O2LmCxJDwKMDVFIzcg+
	 +Mz7bELQFI44beEQWjiA3Rg11YrPkYgHvhztBTky3l2szwteOD+NBPF9dtsrrJ+accqEh
	 QgY8ROEUKB4EvnVNLXttSJmEifLgtWCMK2mbIrknRaN4wDlckLLk+0nX5+xazCRYAShIp
	 OqKvgoLC4SPi6chcBFHDg88lceu5ZxTSOm0r1Js2qXNIA21WoYfu3MjDN7SLPJ97yn7Z0
	 vDbwDVPj7YBQ+/F/9pGES65pd2Thl5IuOeDR4l/I+hOr8V5gm1sxFdtsvWWsbd2M04A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u3sT4TQK;
	arc=none smtp.remote-ip=95.215.58.67
Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF28F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u3sT4TQK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BhhCNdEPFhDh2jcXNzE075CGbKlWzBkBRN9ZyvytWak=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793797781; v=1; x=1794402581;
 b=u3sT4TQKLly9ve/kb9PH5h8o7jQanqSgoSF3/6vA8FejFXjhdhl4AfXxrZ0a7qQC1pC74eIC
 8wrKJ8VbAdR+r3yDqxRNa0wA0ozZ07zU6XJQZBiO5rQRFF7gcUl/D7+0QXB61ufM+O6WHMt4z35
 +Unsgyfi273FNmXcSZQF9Fdo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 377ccbf39b602cda;
	Wed, 04 Nov 2026 13:09:41 +0000
X-Mizu-Trace-ID: 377ccbf39b602cda
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Dave Chinner <david@fromorbit.com>
Cc: David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Muchun Song <muchun.song@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	cgroups@vger.kernel.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	bpf@vger.kernel.org (open list:BPF [MISC]:Keyword:(?:\b|_)bpf(?:\b|_)),
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v7 5/7] mm/mglru: add tracepoint for scan_folios()
Date: Wed,  4 Nov 2026 21:08:15 +0800
Message-Id: <20261104130817.849089-6-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104130817.849089-1-ridong.chen@linux.dev>
References: <20261104130817.849089-1-ridong.chen@linux.dev>
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

MGLRU's scan_folios() emits the classic-LRU tracepoint
trace_mm_vmscan_lru_isolate(), which predates MGLRU. It reports the
scan/isolate counts and the LRU type, but carries no generation or
memcg context, so a trace of an MGLRU run cannot tell which memcg a
given scan belongs to, nor how far reclaim has progressed through the
generations.

Add mm_mglru_scan_folios next to it, reporting the same counters plus
nr_sorted (folios moved to a younger generation by sort_folio()) and
the context the classic tracepoint lacks: the node id and memcg id of
the lruvec, and the max_seq, tier and min_seq of the type being
scanned.

Now that struct scan_control is visible to the trace header, pass sc,
lruvec, type and tier straight in and derive everything else in
TP_fast_assign(), so nothing is computed at the call site when the
event is disabled. The int fields are grouped at the end of the entry
to avoid padding on 64-bit.

scan_folios() is the MGLRU-specific layer where folios are actually
scanned, so it has no classic-LRU counterpart. The existing tracepoint
is left unchanged.

Tested-by: Barry Song <baohua@kernel.org>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/trace_vmscan.h | 66 +++++++++++++++++++++++++++++++++++++++++++++++
 mm/vmscan.c       |  2 ++
 2 files changed, 68 insertions(+)

diff --git a/mm/trace_vmscan.h b/mm/trace_vmscan.h
index b2ad83e5f25e..8148b8224422 100644
--- a/mm/trace_vmscan.h
+++ b/mm/trace_vmscan.h
@@ -392,6 +392,72 @@ TRACE_EVENT(mm_vmscan_lru_isolate,
 		__print_symbolic(__entry->lru, LRU_NAMES))
 );
 
+#ifdef CONFIG_LRU_GEN
+TRACE_EVENT(mm_mglru_scan_folios,
+
+	TP_PROTO(struct lruvec *lruvec,
+		 struct scan_control *sc,
+		 unsigned long nr_requested,
+		 unsigned long nr_scanned,
+		 unsigned long nr_sorted,
+		 unsigned long nr_skipped,
+		 unsigned long nr_taken,
+		 int type,
+		 int tier),
+
+	TP_ARGS(lruvec, sc, nr_requested, nr_scanned, nr_sorted, nr_skipped,
+		nr_taken, type, tier),
+
+	TP_STRUCT__entry(
+		__field(u64, memcg_id)
+		__field(unsigned long, nr_requested)
+		__field(unsigned long, nr_scanned)
+		__field(unsigned long, nr_sorted)
+		__field(unsigned long, nr_skipped)
+		__field(unsigned long, nr_taken)
+		__field(unsigned long, max_seq)
+		__field(unsigned long, min_seq)
+		__field(int, nid)
+		__field(int, highest_zoneidx)
+		__field(int, order)
+		__field(int, lru)
+		__field(int, tier)
+	),
+
+	TP_fast_assign(
+		__entry->memcg_id = mem_cgroup_id(lruvec_memcg(lruvec));
+		__entry->nr_requested = nr_requested;
+		__entry->nr_scanned = nr_scanned;
+		__entry->nr_sorted = nr_sorted;
+		__entry->nr_skipped = nr_skipped;
+		__entry->nr_taken = nr_taken;
+		__entry->max_seq = lruvec->lrugen.max_seq;
+		__entry->min_seq = lruvec->lrugen.min_seq[type];
+		__entry->nid = lruvec_pgdat(lruvec)->node_id;
+		__entry->highest_zoneidx = sc->reclaim_idx;
+		__entry->order = sc->order;
+		__entry->lru = type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON;
+		__entry->tier = tier;
+	),
+
+	TP_printk("nid=%d memcg_id=%llu classzone=%d order=%d nr_requested=%lu nr_scanned=%lu nr_sorted=%lu nr_skipped=%lu nr_taken=%lu lru=%s max_seq=%lu tier=%d min_seq=%lu",
+		__entry->nid,
+		__entry->memcg_id,
+		__entry->highest_zoneidx,
+		__entry->order,
+		__entry->nr_requested,
+		__entry->nr_scanned,
+		__entry->nr_sorted,
+		__entry->nr_skipped,
+		__entry->nr_taken,
+		__print_symbolic(__entry->lru, LRU_NAMES),
+		__entry->max_seq,
+		__entry->tier,
+		__entry->min_seq)
+);
+
+#endif /* CONFIG_LRU_GEN */
+
 TRACE_EVENT(mm_vmscan_write_folio,
 
 	TP_PROTO(struct folio *folio),
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9fc2399d63bc..379ac3b148e1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4801,6 +4801,8 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	trace_mm_vmscan_lru_isolate(sc, nr_to_scan,
 				    scanned, skipped, isolated,
 				    type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
+	trace_mm_mglru_scan_folios(lruvec, sc, nr_to_scan, scanned, sorted,
+				   skipped, isolated, type, tier);
 
 	*isolatedp = isolated;
 	return scanned;
-- 
2.34.1

