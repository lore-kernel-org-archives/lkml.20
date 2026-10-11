Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AC4B640
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739730; cv=none; b=jeXwP2UAriJ930IMgQFf2LJfGe6J243cv0cWb8r8TWl6rXlvn35KjnebfSMNlCAME5BZxCn7rwJSXGhQ/7W1+dki3XoNPmgJlfo0KGkj+PV39igKuzP6hesQ/+bkQ8mijRonJ3fk2ruiCamHz14GVHzj04A+E27UyQrhIzwXeLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739730; c=relaxed/simple;
	bh=MI7LMwrl97b6i73iVI7u88+57sLGUKgyb2/wfD4KW0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OO1UO14sMOMIGltjmn2nYtZVawayG0hKXHFhMSowdo3i2EHNcng2RCNb6lD7eXmfebRMXQcyEotGI9M907bCbQK6a74RfA/Dz3MHqekP60D4lp2b1KItI2z6bU1TbR/2tfsdlxQH/fEQ6yyxafRvjkHWcjqlx0E7sAEtJ6LDY+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e5i5ed4y; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e5i5ed4y"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BB781682;
	Sun, 11 Oct 2026 10:28:38 -0700 (PDT)
Received: from [10.163.146.225] (unknown [10.163.146.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70BF03F673;
	Sun, 11 Oct 2026 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791739721; bh=MI7LMwrl97b6i73iVI7u88+57sLGUKgyb2/wfD4KW0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e5i5ed4yeGKLd8XXvpMve9XQf9OE36u6gKWXUn8hs8RNJ8mDOugFUGMY+UJhssT1K
	 6T7eIoA8lkMm1Cc+GA7VJURQuqfc1NFvwGTmadPfq3XGvamCF7G4dQ+/U4YC/zjMmb
	 vqlCzDr583JwWnHkFjKYEUCKjtwmlN3W6flfTfrY=
Message-ID: <55adcc67-e545-4bf5-93ba-7e4180f1b523@arm.com>
Date: Sun, 11 Oct 2026 22:58:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PROTOTYPE] mm: reliable 1GB page allocation
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>
References: <20261004013657.03a63c4c@fangorn>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261004013657.03a63c4c@fangorn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/10/26 11:06 am, Rik van Riel wrote:
> The goal of this series is to keep gigantic (1GB) pages allocatable
> after weeks of uptime, by concentrating non-movable pageblocks in a
> small number of 1GiB-aligned ranges.
> 
> Design document: https://linux-mm.org/GigaBlocks
> 
> Code: https://github.com/rikvanriel/linux/tree/riel/gigablock-2026-10-03
> 
> A 1GB page needs a 1GB-aligned range in which every page is free or
> movable; one unmovable page disqualifies the range.  Over time a small
> amount of kernel memory spreads across nearly every range.  On a 765GB
> node after 53 days of build and filesystem work, none of 754 1GB ranges was
> free of non-movable pageblocks.  On a 253GB test host the same class of
> workload mixed 251 of 254 ranges in 9.2 hours, and a request for eight
> 1GB pages returned none.
> 
> This series uses the separate free lists for each migrate type
> in zone->free_area[] in the fast path. The idea is to satisfy kernel
> allocations from the unmovable and reclaimable free lists, while
> movable allocations come from the movable free lists.
> 
> For each gigablock, the system tracks whether it contains non-movable
> content, or only free and movable page blocks. A gigablock can contain
> a mix of non-movable and movable data.
> 
> When the kernel free lists run low, the slow path moves pages and page
> blocks from inside mixed gigablocks onto the kernel free lists.

Did you consider a design to introduce MIGRATE_POLLUTED: simply
have another migratetype which stores polluted pageblocks.
This idea can work in general, not sure how relevant it is
for gigablock concept.

 >
> Creating kernel free memory inside mixed superblocks is done
> by claiming page blocks in a mixed superblock, when the kernel
> free lists are exhausted, and a non-movable allocation has to
> fall back, or by compaction evacuating movable content from
> previously claimed kernel pageblocks that have movable content inside.
> 
> Claiming a new pageblock in a mixed superblock is done from the
> allocator path, using a bounded scan, only once the kernel free
> list is unable to satisfy an allocation.  Evacuation is done by
> kcompactd, and kicked off when the kernel free list falls below
> a watermark.  The goal is for the asynchronous path keep the
> page allocator on the fast path.
> 
> Movable allocations can fall back to the kernel free lists.
> That content can always be moved later.
> 
> Region size is fixed at 1GB rather than PUD size, geometry is frozen
> at boot, and a hotplug span change disables tracking for the zone rather
> than resizing metadata.
> 
> The diffstat shows that this version adds too much code to page_alloc.c,
> which is already too large, and should probably be split up somehow.
> 
> One candidate in this series is to split the evacuation code and gigablock
> slow path into its own file, moving that out of both page_alloc.c and
> compaction.c. 
> 
> Duplicating a small amount of compaction logic may be preferable to 
> complicating the existing logic at this point.
> 
> This code is not ready to be merged yet. The full design document has
> a list of things that still need to be done.
> 
> I am posting this in the hopes of getting feedback on the basic design,
> so that can be incorporated in the next rounds of tuning and cleanups.
> 
> Specifically feedback on design concepts like:
> - Using only zone->free_area by migrate type in the fast path
> - Moving pages around in the slow path, to keep the kernel free
>   lists stocked.
> - Some amount of scanning in the page allocation code if the
>   kernel free lists cannot satisfy an allocation, in order
>   to claim a block in a mixed gigablock.
> - Using compaction to evacuate movable content from pageblocks
>   claimed for kernel use.
> - The policy of restricting how much kernel allocations can
>   claim new pageblocks anywhere.
> - The policy of letting movable allocations fall back to the
>   kernel free lists once the movable free list is exhausted
> 
>  Documentation/admin-guide/kernel-parameters.txt |    8 
>  include/linux/mmzone.h                          |   83 
>  include/linux/pageblock-flags.h                 |    2 
>  include/linux/sched.h                           |    4 
>  include/linux/vm_event_item.h                   |   48 
>  mm/compaction.c                                 |  170 
>  mm/folio.c                                      |    5 
>  mm/internal.h                                   |  147 
>  mm/memory_hotplug.c                             |    3 
>  mm/mm_init.c                                    |  150 
>  mm/page_alloc.c                                 | 5553 +++++++++++++++++-------
>  mm/page_alloc.h                                 |    6 
>  mm/vmstat.c                                     |  273 +
>  13 files changed, 5015 insertions(+), 1437 deletions(-)

