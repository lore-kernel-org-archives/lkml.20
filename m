Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353959;
	b=zy06ld8nXP95ZVjWAnNSgEgBHGPCYk7usvb4BKz3DwupkBlqS4UhNeIVZFKGjwrxMV2n
	 /ksV42cf1Yz2dCSLjSAyCCehFbfXTzLNakXngLb4gKjKkOT2SrNQnOPmsnmad+DXvrmuY
	 Ek+mazu5JCqbJK3pA4MmUWtMycTcv/6SwHVAZ4aNdyZ3k99ldgbnUfpJGwrvj7lK8KQ3F
	 UuuZ+oU5rEmiTvY1zsbd5Vp8Xps9nkHME/I55ZSm4WYsrvZ3/QyILD7mgEcbQ+gWJBPDW
	 FxwepyCktB4lYWy+mDiw3pxpYHp7O5tVDe1WI8gKly1qV+xk8ibfXrDcndQ0JJek+bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353959;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=H3pdNgV2kIMazb8X+rUUMyHlKbuV+ZiZTksRXL4D6lI=;
	b=LDaAtpAEF7RMVeOVK007/bRiVcf1JXgtvszCdbJbYDoa3DfHzEfYd+gJUXfopaP3UDyK
	 F8llPUk7nxd+tRgtCG3bbndtE4E4pS11/3Tgu5KGVVA7bG9KnlvV0XkRnIOle6s6CCsa3
	 A5RlbocDt6NPToPSXwxc8h/9ed9J25Gvbx62xsztPNN/MvWVeOHXPLlnGz+9uJy/8FH8s
	 DeSOKOcvnRfu5mSNUULJNCv6Dtwb7tx1uLWhtoPAuYH75fB/VcYD3wvdg7Ig+MAifoX2a
	 BTfyjFC9ohree9WC2Zaq2sec2wVrnvpD1pM49mn3Nu2dJkYqTDtTdsML9s1idh6A3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.111
Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988CC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1p2vPcKyuahPiXCpBK1Tm8nVn5slemcow3+ebdFu0mI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793353954; v=1; x=1793958754;
 b=SpdV53gaDoeTngFa7y6FaAQdRKpkiOm5tM2wSWFWy98yAZlWdEwaGoxv4LBdM+RWAGrANlvb
 jaLhxCYw+uLQN2JZdWAMIunuToWU5dp1rASctC1jrhuZIe0Q/BBG5joTMcQuFpqypHLbE4Wbxub
 DpYTALbNaUUDx7OaSPdt4JaQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id df75d9a41b4a335a;
	Fri, 30 Oct 2026 09:52:34 +0000
X-Mizu-Trace-ID: df75d9a41b4a335a
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-mm@kvack.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	David Hildenbrand <david@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH mm-new v1 0/2] mm: vmscan: skip anon folios zswap would refuse when writeback is off
Date: Fri, 30 Oct 2026 17:52:16 +0800
Message-ID: <20261030095223.325309-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

memory.zswap.writeback=0 is what we set for latency sensitive services:
their cold anon pages may go to zswap, but never to disk, a swapin
from disk is a latency spike they cannot afford. Such a memcg can only
swap into zswap. When zswap stops taking its pages, because the pool
hit max_pool_percent or the memcg hit memory.zswap.max, reclaim still
goes through the motions on its anon LRU: every folio it picks gets a
swap slot, is unmapped, is refused by zswap_store() and is activated
again. Nothing is freed, the folio now sits in the swap cache holding
a slot, and the owner takes a minor fault on the next access.

memory.reclaim below is just the easiest way to trigger it. The same
loop runs whenever the memcg is reclaimed: when it hits memory.max, or
when kswapd walks it under node pressure. Neither is something the
service can opt out of.

Patch 1 is a refactor so the memcg zswap check can be reused from
reclaim. Patch 2 adds the check to shrink_folio_list(). It cannot go
into can_reclaim_anon_pages(): zero-filled folios never reach zswap
and must stay reclaimable.

Numbers from a 16-CPU, 32G QEMU guest on mm-new, zswap with
max_pool_percent=2 (~640M), a memcg with memory.zswap.writeback=0
holding 3G of 2:1 compressible anon. The pool fills up after ~300k
pages. Then 5 x "echo 512M > memory.reclaim", and the task walks its
3G once:

                     minor faults on the walk
                     MGLRU        classic LRU
  before             786,454      786,452
  after              301,168      301,158

The ~300k after the patch are the pages that really are in zswap
(stored_pages was 301,133 / 301,165), swapped back in once each. The
other ~485k before the patch are pages zswap refused: unmapped, left
in the swap cache, mapped again on the next touch.

Jiayuan Chen (2):
  mm: memcontrol: split mem_cgroup_may_zswap() out of
    obj_cgroup_may_zswap()
  mm: vmscan: skip anon folios zswap would refuse when writeback is off

 include/linux/memcontrol.h |  5 +++++
 include/linux/zswap.h      |  5 +++++
 mm/memcontrol.c            | 26 ++++++++++++++++++--------
 mm/page_io.c               | 15 ++++++++++++++-
 mm/swap.h                  | 12 ++++++++++++
 mm/vmscan.c                | 17 +++++++++++++++++
 mm/zswap.c                 | 11 +++++++++++
 7 files changed, 82 insertions(+), 9 deletions(-)

-- 
2.43.0

