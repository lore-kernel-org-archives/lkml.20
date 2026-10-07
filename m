Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4005E27603F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339210; cv=none; b=ew9qmkheAM0oIzZ308vjB7wReb/qGiDzx1xVtQg4Ja4zroKRK/E3S7/jOFcclzg7RoRJxgHxMfa+CIUBn/58qOemzde21A4XMSoJmE3duD53sCKiOOS2+PF0Aq43gMb7DRZhbEnIYnmZ+KDr1GKNd1LSU++Nf0DjPYKsuI1SVv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339210; c=relaxed/simple;
	bh=db8TQirFGatoMQfe1FeVHj3iYoy6wI07TN8MmVIlgQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqTcjd0zRhH1kPE0rVauPASLyniH4cZK/h2A+LnrtNiZCpH+ySgoTuBKEFm7jk4Ky5nvF7y5fzQvaIC/JqXJlTFTtFd8HSU3eSZ6XH/Hzb0sMyGqrxReO9d9MVdnDFC9IDwrB0l5G/r5MujhCk47TGL8GOuhUemADfbg0QsTa+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=WaXcFB+f; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="WaXcFB+f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=0wKg5+CnFc66UiMVgZhWFbiztro7R5LMhQ/aoV5NIl4=; b=Wa
	XcFB+fjj7yO+Bt2Kujy8WyZGnMJfSjlEDry/UaGKO6NAwf/yYqPxBsXK9PF2X0hB/3Qk4K8tKV+2b
	Py8tGGmMWjPIcndQecjrneE1hu6E2STthiZaFrz/B3jEuf3a0w1HDd8o5RS4xoRqQDHWV/xKUjr2i
	OLhIR/Q7MZgkTSH0DvxR1b3LkPH3hkPIHg/Bozr63bWDaD6tP7CXfiGN+prr02ElBg+V60L7oI/7I
	GZfPCUwE7KJnd47PAg5w30YPoiAxCeoXH4Vzhz8sBi3Zzl9tgZ8EihGWLBCdiGlPkBjKpMbfs5UAT
	CXvUar4nlOoKafAqBZezHV6fX33CUplg==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xEH9M-0000000B2cT-3kLi;
	Wed, 07 Oct 2026 02:12:56 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org
Subject: [RFC PATCH 0/5] mm/page_alloc: keep non-movable pages out of movable pageblocks for THP
Date: Tue,  6 Oct 2026 22:12:45 -0400
Message-ID: <20261007021250.1665929-1-riel@surriel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last week I posted the first prototype of the reworked gigablock
page allocation code, which uses the per-migrate_type free lists
in the zone as its fast path:

https://lore.kernel.org/lkml/20261004013657.03a63c4c@fangorn/

Zi Yan took a look, and pointed out that the first patches in
the series might help with THP allocation. Testing showed he
is right.

Having this code be useful by itself changes the gigablock
merge plan. It can now be done in stages:
1) Pageblock claiming fixes & improvements, which show a
   modest improvement in THP allocation. This is the only
   code in the fast path.
2) Page compaction, evacuation, and free list threshold changes,
   which can really help concentrate non-movable allocations in
   non-movable typed pageblocks, hopefully making compaction and
   THP allocation noticeably more reliable.
3) The actual gigablock targeting. This is also a slow path,
   like compaction and evacuation.

This first series addresses pageblock claiming and stealing
policies. Current page allocation policies cause the THP allocation
success rate to collapse under sustained non-movable demand.

A single non-movable page in a movable-type page block prevents
that page block from being used for a THP, but it does not
prevent kcompactd from spending time on that block.

Three paths mix unmovable pages into movable-typed blocks.
try_to_claim_block() converts a movable block for a non-movable
allocation only when half its pages are free or compatible.
__rmqueue_steal() takes pages without converting at all, and a
bulk batch that steals once never reaches the claim path again.

compaction_capture() hands a merged movable block to a
non-movable request with no type change.

Patches 1-2 are standalone accounting fixes: guard pages return
to the counts when their buddy merges, and a merged buddy's
pages move to the merged type in the free page accounting.

Patches 3-5 make the pageblock migrate type follow the content:
convert any movable block on a non-movable claim, skip movable
blocks on non-movable steals, and claim movable blocks fully taken
by non-movable compaction capture.

Pageblocks that straddle zones cannot safely change type,
since the allocator may have locked the "wrong" zone. Those
blocks are left alone.

The series is preventive: it keeps new placements to their own
type and stops polluting movable block. The next step, for
another series, will be to evacuate movable content from
pageblocks stolen by non-movable allocations, in order to
concentrate kernel allocations in fewer pageblocks.

Measured on 64GB 8-vCPU KVM guests, THP=always, defrag=always,
khugepaged collapse off, 8GB virtio swap. The guest boots into
a fragmented base: a 10GB mlocked block flood, 36GB of aged
anonymous memory, and background unmovable allocations.

Then 8 rounds of type-pressure buildup. Each round drains
high-order free memory with a large NOHUGEPAGE touch, adds 550
pagetable-heavy processes plus 200000 slab files as unmovable
demand, and ends with a fixed 2GB 8-thread THP probe that stays
mapped while success is measured. The bursts persist across
rounds while the drain shrinks by ~2.75GB each round, so each
round's demand faces less free memory.

Measured is the thp_fault_alloc success rate, across
4 runs of 8 rounds each.

                                   patched        base
rounds with <50% success            7/31         16/31
THP alloc success rate @r4       74% (47-98)  42% (25-67)
blocks with unmovable pages @r8     43-154     1674-2131

Two rounds died due to swap exhaustion, and are not counted.

Pageblocks with unmovable pages were counted by checking
/proc/kpageflags after each round. The total amount of
unmovable pages is similar with and without the series,
they just get packed into fewer pageblocks.

Converting taken blocks and refusing fallback steals packs
unmovable pages into converted blocks, leaving clean movable
victims for the scanners: a round-2 probe on the series
kernel compacts 690 of 697 attempts at 92.6% THP where the
base compacts 47 of 376 at 4.7%.

This series is broken out of the 1GB gigablock prototype work:

 include/linux/mmzone.h |  13 +++++
 mm/page_alloc.c        | 117 +++++++++++++++++++++++++++++++------------------
 2 files changed, 88 insertions(+), 42 deletions(-)

base-commit: 67f0943b394d9
