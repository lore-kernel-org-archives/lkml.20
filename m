Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DEA175A88
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755124; cv=none; b=W0bKUWibfhEnCMMBUjZl6k/WU9EhNPKw3ogckmwxajDUE2jRreN0fmEoy9ZMo6/DNJIt7OHnE4T4KfzT6K4Kp6KMIrGruVkOiA/+X6rU/mCo8jakbZSZM+HTZsQv6MFcfmTjUySzjTxxNTlep1yHxrOb124VrP4KYkI+kU+rbY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755124; c=relaxed/simple;
	bh=wrEi0IGqv2yk5i4rOkFtPT9EzmwLrTae/tEdHh6Nk9w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UU5hi06kBnhq2DR3DRQfwVI6HOCA7nf8/Y/A3VgaHGKrRabYRytBrGautvb2DQ6Z2egHo0iWqBi/0UQG0q4VQakGOBN+pjx/Je1H2b2G6eCZtZl1Yq7+UNLgdleNFZoGy878RUerTdCfB0b0sSa0JkyWOHITg60O8VV998IuMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WFBQlWFk; arc=none smtp.client-ip=95.215.58.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WFBQlWFk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wrEi0IGqv2yk5i4rOkFtPT9EzmwLrTae/tEdHh6Nk9w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788755118; v=1; x=1789359918;
 b=WFBQlWFk8g1zRCeoeBmk7hmXMa60r3RZL8gO2UTVNs6tia88hayacYEk6ijviJA5ZJpDO9Yu
 DqW/j2YF9QNeC5qng1SDDHlgLGKirex4fbo7htz6XXYqxpTUvq3DYWSoVuxp0S+Cr8dulZIES61
 145U2E8trCQ4dkxF47QGVB3g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0a9229bad07e1de1;
	Mon, 07 Sep 2026 04:25:08 +0000
X-Mizu-Trace-ID: 0a9229bad07e1de1
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH RFC 0/2] mm/mglru: add tracepoints for aging and isolation
Date: Mon,  7 Sep 2026 12:24:45 +0800
Message-Id: <20260907042447.2450663-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

MGLRU currently has no tracepoints of its own. The scan and evict paths
reuse the classic-LRU tracepoints (trace_mm_vmscan_lru_isolate() and
trace_mm_vmscan_lru_shrink_inactive()), which predate MGLRU and carry no
generation, sequence, memcg or swappiness context. A trace of a running
system therefore cannot tell which memcg a given scan/evict belongs to,
how far reclaim has progressed through the generations, or when a new
generation is created - so how MGLRU actually operates is effectively
invisible.

Add two tracepoints on the two paths that define an MGLRU cycle:

  - mm_mglru_isolate_folios, on the isolation (eviction) path, carrying
    the memcg id, the type scanned, the effective swappiness, the
    scanned/isolated counts, and the anon/file min_seq and max_seq.

  - mm_mglru_inc_max_seq, on the aging path, emitted when a new youngest
    generation is created, carrying the memcg id, the new max_seq, and
    the anon/file min_seq.

Both live at MGLRU-specific layers with no classic-LRU counterpart, so
they neither change nor duplicate the existing tracepoints. Paired, they
make the full aging-to-eviction window observable per memcg: aging
advances max_seq (the leading edge), isolation consumes the oldest
generations, and the min_seq/max_seq pair on each event shows how the
generation window moves over time.

A sample trace, with the classic-LRU tracepoints left enabled to show
how they interleave:

  mm_mglru_inc_max_seq: memcg_id=1085 max_seq=7 anon_min_seq=4 file_min_seq=5
  mm_vmscan_lru_isolate: classzone=4 order=0 nr_requested=17 nr_scanned=17 nr_skipped=0 nr_taken=0 lru=inactive_file
  mm_vmscan_lru_isolate: classzone=4 order=0 nr_requested=17 nr_scanned=17 nr_skipped=0 nr_taken=0 lru=inactive_file
  mm_mglru_isolate_folios: memcg_id=1085 type=file swappiness=0 nr_scanned=34 nr_isolated=0 anon_min_seq=4 file_min_seq=5 max_seq=7
  mm_vmscan_lru_isolate: classzone=4 order=0 nr_requested=64 nr_scanned=64 nr_skipped=0 nr_taken=21 lru=inactive_file
  mm_mglru_isolate_folios: memcg_id=73 type=file swappiness=0 nr_scanned=64 nr_isolated=21 anon_min_seq=7 file_min_seq=8 max_seq=10
  mm_vmscan_lru_shrink_inactive: nid=0 nr_scanned=64 nr_reclaimed=21 nr_dirty=0 nr_writeback=0 nr_congested=0 nr_immediate=0 nr_activate_anon=0 nr_activate_file=0 nr_ref_keep=0 nr_unmap_fail=0 priority=4 flags=RECLAIM_WB_FILE|RECLAIM_WB_ASYNC
  mm_mglru_inc_max_seq: memcg_id=73 max_seq=11 anon_min_seq=8 file_min_seq=8
  mm_vmscan_lru_isolate: classzone=4 order=0 nr_requested=64 nr_scanned=10 nr_skipped=0 nr_taken=10 lru=inactive_file
  mm_mglru_isolate_folios: memcg_id=73 type=file swappiness=0 nr_scanned=10 nr_isolated=10 anon_min_seq=8 file_min_seq=8 max_seq=11
  mm_vmscan_lru_shrink_inactive: nid=0 nr_scanned=10 nr_reclaimed=7 nr_dirty=0 nr_writeback=0 nr_congested=0 nr_immediate=0 nr_activate_anon=0 nr_activate_file=3 nr_ref_keep=0 nr_unmap_fail=0 priority=4 flags=RECLAIM_WB_FILE|RECLAIM_WB_ASYNC

The two mm_mglru_isolate_folios lines tell memcg 1085 and memcg 73
apart, and show one making no progress (nr_isolated=0 against min_seq=4/5)
while the other evicts and then ages (max_seq 10 -> 11, min_seq catching
up to 8). The bare mm_vmscan_lru_isolate lines above carry none of that
context - they cannot even say which memcg they came from.

Sent as RFC to get feedback on the choice of tracepoint sites and fields
before proposing them as stable ABI.

Ridong Chen (2):
  mm/mglru: add tracepoint for folio isolation
  mm/mglru: add tracepoint for inc_max_seq

 include/trace/events/vmscan.h | 77 +++++++++++++++++++++++++++++++++++
 mm/vmscan.c                   | 13 +++++-
 2 files changed, 89 insertions(+), 1 deletion(-)

-- 
2.34.1

