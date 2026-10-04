Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCED2AD35
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 05:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092249; cv=none; b=rYa95QfGod50eAtbzoVlXB807Gt/tJPYaTdDTCCwoZBV6LuxH8dZiYFVw4SKiXmnLU40+bKB98EYX/ksuLyLsi9CzUhQOhSzO6yaocZhXfK48h4TcA+5M4sk2YUQCagc3UQRVx2KBKNZ24g84w3gh7IoeDnyz15nfdNfxJTcyBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092249; c=relaxed/simple;
	bh=fSdVC/IcZ03RDwC/hZCI1EnXmCYsj4sqEj7wvTBg8e0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GvXZxhZpZx6gpRo46zt2Zixk5pDWWgNexDTXff06qjyja5IpJzzSTS/3/r1CwLPmx1KU5YVHfas55v5VBQqWcZGbb4PSPzR4NUfg5K4PiQFFbSWzxy9FF1KLp3YfiWD/8Ybfmo+x0fgi27pwijWdAULpRUbOrPosyuTo6mgwumA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=XRJBkCMd; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="XRJBkCMd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=YZFnl3jt8OwnMFOMa73Yjd8m80iOizAeS0hopGZI1tM=; b=XR
	JBkCMdz5khA5JPh3KcwxRHjTwKX/1jgsWTJPm88IzzrNTy5WSmmUYQRG2OmPrkzNTIM2bttAIxEyI
	0YcyqpOSc9yORQ9I//RpaVdY+kpG0zGlXtvjtTSUqqpRQtrt//Oqpn8T5d3pEzzEAIofPFuObkiJo
	3AgTPStLt7tN5D3uhRGtXt+9cAR5LHV0jN2z4H6+brZcWoRteLjsKGWGBLOG1vyfYXxNThlBPrl7N
	BxKNb7c97aUED4RWUAxd4JPBIkp6GuWH4YJ4XomqD37vGXF6Jc1tCZxpr+tFVglAMRzAk2cGIzadU
	picTkq00a6OrYhHBPLvDogqbESM+MWVw==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xDEu9-00000005drD-1tGZ;
	Sun, 04 Oct 2026 05:36:57 +0000
Date: Sun, 4 Oct 2026 01:36:57 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, Qi Zheng
 <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Johannes
 Weiner <hannes@cmpxchg.org>, Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>
Subject: [RFC PROTOTYPE] mm: reliable 1GB page allocation
Message-ID: <20261004013657.03a63c4c@fangorn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The goal of this series is to keep gigantic (1GB) pages allocatable
after weeks of uptime, by concentrating non-movable pageblocks in a
small number of 1GiB-aligned ranges.

Design document: https://linux-mm.org/GigaBlocks

Code: https://github.com/rikvanriel/linux/tree/riel/gigablock-2026-10-03

A 1GB page needs a 1GB-aligned range in which every page is free or
movable; one unmovable page disqualifies the range.  Over time a small
amount of kernel memory spreads across nearly every range.  On a 765GB
node after 53 days of build and filesystem work, none of 754 1GB ranges was
free of non-movable pageblocks.  On a 253GB test host the same class of
workload mixed 251 of 254 ranges in 9.2 hours, and a request for eight
1GB pages returned none.

This series uses the separate free lists for each migrate type
in zone->free_area[] in the fast path. The idea is to satisfy kernel
allocations from the unmovable and reclaimable free lists, while
movable allocations come from the movable free lists.

For each gigablock, the system tracks whether it contains non-movable
content, or only free and movable page blocks. A gigablock can contain
a mix of non-movable and movable data.

When the kernel free lists run low, the slow path moves pages and page
blocks from inside mixed gigablocks onto the kernel free lists.

Creating kernel free memory inside mixed superblocks is done
by claiming page blocks in a mixed superblock, when the kernel
free lists are exhausted, and a non-movable allocation has to
fall back, or by compaction evacuating movable content from
previously claimed kernel pageblocks that have movable content inside.

Claiming a new pageblock in a mixed superblock is done from the
allocator path, using a bounded scan, only once the kernel free
list is unable to satisfy an allocation.  Evacuation is done by
kcompactd, and kicked off when the kernel free list falls below
a watermark.  The goal is for the asynchronous path keep the
page allocator on the fast path.

Movable allocations can fall back to the kernel free lists.
That content can always be moved later.

Region size is fixed at 1GB rather than PUD size, geometry is frozen
at boot, and a hotplug span change disables tracking for the zone rather
than resizing metadata.

The diffstat shows that this version adds too much code to page_alloc.c,
which is already too large, and should probably be split up somehow.

One candidate in this series is to split the evacuation code and gigablock
slow path into its own file, moving that out of both page_alloc.c and
compaction.c. 

Duplicating a small amount of compaction logic may be preferable to 
complicating the existing logic at this point.

This code is not ready to be merged yet. The full design document has
a list of things that still need to be done.

I am posting this in the hopes of getting feedback on the basic design,
so that can be incorporated in the next rounds of tuning and cleanups.

Specifically feedback on design concepts like:
- Using only zone->free_area by migrate type in the fast path
- Moving pages around in the slow path, to keep the kernel free
  lists stocked.
- Some amount of scanning in the page allocation code if the
  kernel free lists cannot satisfy an allocation, in order
  to claim a block in a mixed gigablock.
- Using compaction to evacuate movable content from pageblocks
  claimed for kernel use.
- The policy of restricting how much kernel allocations can
  claim new pageblocks anywhere.
- The policy of letting movable allocations fall back to the
  kernel free lists once the movable free list is exhausted

 Documentation/admin-guide/kernel-parameters.txt |    8 
 include/linux/mmzone.h                          |   83 
 include/linux/pageblock-flags.h                 |    2 
 include/linux/sched.h                           |    4 
 include/linux/vm_event_item.h                   |   48 
 mm/compaction.c                                 |  170 
 mm/folio.c                                      |    5 
 mm/internal.h                                   |  147 
 mm/memory_hotplug.c                             |    3 
 mm/mm_init.c                                    |  150 
 mm/page_alloc.c                                 | 5553 +++++++++++++++++-------
 mm/page_alloc.h                                 |    6 
 mm/vmstat.c                                     |  273 +
 13 files changed, 5015 insertions(+), 1437 deletions(-)


