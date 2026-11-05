Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884965;
	b=2Cceojw9Yv1PTbRI6NhHGH4MzdR20KHm4EAv/V5qvgTkqlXP1/mdoOGNiyVE+Ui9YUeu
	 ukm5w2URcXEXQcZ2zaZ3QINajuSYFUVhK2g+OV/UvmLsf9jy8WqRcIIuyO2bYua62dZg3
	 FJ/gpCvgGjao6uXBEq1jHzybcVOSFz9U01iN33Wo3Nn9ClJWKwdUaf6yoJPWEfEZG3UcB
	 JgoB4IDiaFQ8HRlMlmwHKN0sPi5eA7T7QiIuNVolX6y54CbOAL+lv7UeTVX8aizg2ioro
	 2GMZPPMG5UwqSx/b2fq1sIun1ge21oSIrlwbAlKB6LAvMZUtcJVm6ratskn+QSgl6gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884965;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2FQgCJLfUQ1tOKwvKQRjuEs7njOihBYDB9ax1aCR+eo=;
	b=T44JZ3RLgQP0ebEEB81kZOhOd6/QjzBIOkphkQeJN9N2Nu4a0FV0604dHsVRVhoxfSIb
	 4GEYyVbQCMkbqpaEzplhL/k6siuA8MXSe1cRWkuNhK9RW1Ska37SHbYK1RNQRT5JJJu/9
	 3rPkG74Vli1/pv2agzuK/Hu72Prx1v9qgk7xMTtRpoKe3sJ4gNljzkFds8fTxQcpebjUr
	 ZcVNUb0IxkJlq4fMMA7jhtYXKinA2MgvKegKp6P2FAaXYtj8FJg838HIu7+zY72Ot9v+o
	 LzBl3p6FY7DPgGpIc4bUVdrsxa2kDMEiueFx+j1YVNLR8FxlSHn3V/5aEytbJqGBdmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jzmklxEG;
	arc=none smtp.remote-ip=95.215.58.223
Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170B606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1170B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jzmklxEG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B5OzRACtslAN5zq5uXzJL2D9qtFaozSUjc8us2dI7zo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793884957; v=1; x=1794489757;
 b=jzmklxEGjSMG4vpqZMVfEd/keqZO6+mmvLCky2fgy4WPykWnI+5iFyjiBiPgr7el8wg/6wpC
 WkQQIhPQ0vcKkBZUj6wQthz07FjbtwOwPqYwdp1YJ8Km3bNcl0hKUUmX+lrHR92QfiYlYaausih
 DAJ04Kldd6FNUXy4ZhYuORGM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e01c588a92d09643;
	Thu, 05 Nov 2026 13:22:36 +0000
X-Mizu-Trace-ID: e01c588a92d09643
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
Subject: [RFC PATCH 0/3] mm/mglru: cacheline follow-ups on the reclaim hot paths
Date: Thu,  5 Nov 2026 21:22:17 +0800
Message-Id: <20261105132220.2233677-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
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

Joanne's series to reduce cacheline contention around struct
mem_cgroup_per_node [1], now in linux-next, made me look at the MGLRU
side of the same structures, and at the stores MGLRU does on hot paths,
to see whether any of them write a line for no reason. This RFC has the
three candidates that showed a measurable difference. They are
independent of each other.

1. lru_gen_use_mm() writes mm->lru_gen.bitmap on every context switch
   to a user task, although the bitmap is almost always already set.
   For threads of one process spread over several CPUs, the line
   bounces between them. Read first and skip the store: +2-3% context
   switches per CPU for a shared mm, no change for private mms.

2. folio_update_gen() and folio_set_lru_refs() always end with a lock
   cmpxchg, even when the flags do not change. During aging, a folio
   mapped by N processes is visited N times and only the first visit
   changes anything. Skip the no-op cmpxchg: an aging pass over a 2GiB
   file shared by 8-64 processes gets 18-22% faster.

3. lrugen->evicted[] and ->refaulted[] are updated locklessly on
   every eviction and refault, and the file type counters share a line
   with lrugen->enabled/gen/seg/list, which are read on every LRU add
   and by shrink_many(). Move the read-mostly fields up and give the
   counters their own lines: +4.3% fio IOPS with 24 jobs refaulting
   file pages in one memcg, no change at 8 jobs or fewer. This one
   costs a cacheline per memcg per node, and its gain needs many CPUs
   refaulting from a fast backing store, so I am not sure it is worth
   it on its own; feedback welcome.

All numbers are from an i7-13700HX (8P+8E, 24 threads, one socket) with
turbo disabled and the performance governor, on next-20261023 with the
same config for base and patched kernels. Details are in each patch.
The series is rebased onto next-20261104, which includes [1], without
code changes; the struct sizes in patch 3 are updated for it.

Limitations of the testing, where input would be welcome:

- Patch 1 does not show up in will-it-scale context_switch1 or
  sched_yield (explained in the patch), and perf bench sched messaging
  and schbench are too noisy here to resolve 2-3%. The numbers come
  from a small test that pins two sched_yield()ing threads per CPU,
  with a one-process-per-CPU control.

- Patch 2 has no standard benchmark either. In fio with many mmap()
  readers under memcg pressure, reclaim time goes to rmap walks on the
  eviction side and aging barely runs. The numbers come from triggering
  aging through debugfs with force_scan, which is the upper bound. On
  real systems the gain scales with how many processes in the same
  memcg share the hot file pages, e.g. preforked servers or Android
  without per-app memcgs.

- Patch 3 depends on the layout of the containing structs, which
  depends on the config (LRU_GEN_STATS changes the array sizes). I
  checked LRU_GEN_STATS=n only.

The test programs are small C files; I can post them if that helps.

[1] https://lore.kernel.org/20261023195417.1391216-1-joannelkoong@gmail.com


Ridong Chen (3):
  mm/mglru: skip redundant bitmap store in lru_gen_use_mm()
  mm/mglru: skip the flags cmpxchg when nothing changes
  mm/mglru: move lrugen atomic stats off the read-mostly lines

 include/linux/mm_inline.h |  2 ++
 include/linux/mm_types.h  |  3 ++-
 include/linux/mmzone.h    | 18 ++++++++++--------
 mm/vmscan.c               |  2 ++
 4 files changed, 16 insertions(+), 9 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.34.1

