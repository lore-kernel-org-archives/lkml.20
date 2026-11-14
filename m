Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679914;
	b=QRfngYmYrAZRIx0uuR7PhvTWkNK5stltLiI+QHsPuGANTGUSS5OIpZr1ZerfGO4AnOEq
	 DX0nTvmjz6hVRwsE85x790RC3P1sBBQrQvwePBXLlZ12y5mLVSwCso7e29SDWpfw8zGtd
	 CSKZID1Z8sKyPvDzjbP6qmiQeXnF/KCQbQGpk0AIUYMozl/0eJ3tw3FPVXlbpmll4S3fQ
	 e6SlnFfWti2Iht1tPKygiwKTQFabdgvOwU+rQrn49VXo3+O79+NjeIkgdJTBIGs28fZic
	 6AbJYGQR8sjbKnQueawXKSN7CKCgKtyg6SPyjtBkefWbDAInTBbNWFIQ59Mj3lgjz1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679914;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7Z6kVyng+edrJn16r9HBEkiQxk4z+4fLliDv7QvLeZ4=;
	b=qE7ihC2ZQPcrwQLJ3zJWeTaLJA4XEwXcYuR38wKuMtNXpz3iT4ezBAA6URUv+N5Q+tUg
	 wD9OAkMmvhSM0zVl8ejMT/IVaKesu2s93WrhAMZKMiPcc0gbSXTTsD+iLL9FLBPnOM4pE
	 AFOpsmP/JujQjxmfYrhntcDe6ztmaXfq6mmVsYzc34QuLxPK4RSO4Z+sHJUIDUTtxwX7c
	 AxA7e7aIVZQj2aAIUOl1n47vYOeV4DkRGe0N1jney6VPqCmDkU8uD8zS97i85tyqY9e1Z
	 Pu+mJZJlI/FAVwXddJcXNJoIxAtvsPZCQEwwjgAg3rSv3Lnxj2/FnNDbdH5iFTDrxAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HqpIC1mz;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29384606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29384606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HqpIC1mz
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07C74143D;
	Sat, 14 Nov 2026 10:11:49 -0800 (PST)
Received: from [10.163.159.227] (unknown [10.163.159.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9B623F632;
	Sat, 14 Nov 2026 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794679912; bh=xDsiiU8GWWJ/pQq9t2dTAxHzPfy05fd8pgLnjvQ2Ib0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HqpIC1mzY1Ev+xlyk5jniXI7ipxiEJBO4kOkrFV+Zq4gzs3MU4V/PxGnAfB/i4Uxa
	 zWpy/kvkAV3JOoGbIDprum2RzcPRavJKyTCU9yjQfKymhqpb+E2PfOiQ3iCNP5/g+1
	 XHWlussL2t485cJJ1CNvYzY3uR8fYEnx8a2Mmk9U=
Message-ID: <28a340e0-76f5-416f-a74e-f74f4a2c2d36@arm.com>
Date: Sat, 14 Nov 2026 23:41:44 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/compaction: sample empty pageblocks again from a
 random offset
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261104101747.2485913-1-kas@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261104101747.2485913-1-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/11/26 3:47 pm, Kiryl Shutsemau (Meta) wrote:
> Once the free scanner finds pageblocks with nothing to isolate, it checks
> only every stride-th pfn of the next block.  The stride doubles with each
> empty block, up to COMPACT_CLUSTER_MAX, and async compaction starts at
> the maximum.  A block that gives nothing is marked skip, and the cached
> free pfn moves below it.
> 
> The samples sit on a fixed power-of-two grid and alias with any layout
> that repeats at a power of two: when the free pages sit off the grid,
> every sample misses them.  With one free page in eight, all at
> pfn % 8 == 4, a stride of eight or more sees no free page at all.  The
> free scanner runs into the migrate scanner, and compaction fails with
> most of the free memory in the zone untouched.
> 
> Tasks then stall in direct reclaim, and huge page faults fall back to
> small pages, while gigabytes of memory are free.
> 
> Real memory is rarely this regular; the test below builds such a layout

That is where it gets hairy: will this be observable in real workloads?

Suppose stride is 32 and the pageblock has 100 non-free pages. What is
the probability that 512 slots are filled with 100 objects such that
x = 0 (mod 32) is filled? It is

C(496, 84) / C(512, 100) = 1.6 * 10^(-12), very improbable.

So the chance you have a sparse block and you are missing out by not
looking at other offsets is very low.

If stride = 32 and #objects = 400, the probability comes out to be
1.8%.

Keeping #objects fixed, lowering the stride lowers the probability
exponentially. (This is relevant since we start with lower strides)

On the other hand, what happens if you are scanning over fully filled
memory? (there is no way to tell whether a pageblock is sparse)
You are going to repeat the scans unnecessarily.

IOW I think the probability this patch is going to have a downside is
more than that of upside.


> on purpose.  On a 32G VM it:
> 
>   1. fills memory with anonymous pages and pins one of them in every
>      pageblock;
>   2. frees one page in eight, 3.6G in total;
>   3. creates a million files on tmpfs with defrag_mode=1.
> 
> Direct reclaim entries (allocstall) and the time to create the files,
> 10 runs each:
> 
>                            allocstall
>     free pages at          median    max      time, s
>     pfn % 8 == 0                0      0      4.6-4.8
>     pfn % 8 == 4               86   1544      4.8-5.6
>     pfn % 8 == 4, patched       0      1      4.6-4.8
> 
> Sparse layouts hit a milder form of the same miss: at async compaction's
> stride, a block with only a few scattered free pages usually yields
> nothing.
> 
> Keep the aligned samples: the head of a free page of the stride's size or
> larger is visible only there.  When they find nothing, sample the block
> once more from a random offset.  A random offset is the usual cure for
> aliasing: no fixed layout lines up with it, and one free page in eight is
> found again within about eight blocks on average.
> 
> The second pass at most doubles the samples taken from an empty block.
> Pages scanned by the free scanner stay within run-to-run noise, both in
> the test above and in an mTHP fault benchmark.
> 
> Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/compaction.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index f1b2060eb201..475b3a645122 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -23,6 +23,7 @@
>  #include <linux/freezer.h>
>  #include <linux/page_owner.h>
>  #include <linux/psi.h>
> +#include <linux/random.h>
>  #include <linux/cpuset.h>
>  #include "page_alloc.h"
>  #include "internal.h"
> @@ -1797,6 +1798,26 @@ static void isolate_freepages(struct compact_control *cc)
>  		nr_isolated = isolate_freepages_block(cc, &isolate_start_pfn,
>  					block_end_pfn, cc->freepages, stride, false);
>  
> +		/*
> +		 * Free pages of the stride's size or larger start on a sample,
> +		 * but order-0 free pages spaced at a power of two can all fall
> +		 * between the samples. Sample a block that gave nothing again
> +		 * from a random offset.
> +		 */
> +		if (!nr_isolated && stride > 1 &&
> +		    isolate_start_pfn == block_end_pfn) {
> +			unsigned long pfn = block_start_pfn + 1 +
> +					    get_random_u32_below(stride - 1);
> +
> +			/* The block can be shorter than the stride */
> +			if (pfn < block_end_pfn) {
> +				nr_isolated = isolate_freepages_block(cc, &pfn,
> +						block_end_pfn, cc->freepages,
> +						stride, false);
> +				isolate_start_pfn = pfn;
> +			}
> +		}
> +
>  		/* Update the skip hint if the full pageblock was scanned */
>  		if (isolate_start_pfn == block_end_pfn)
>  			update_pageblock_skip(cc, page, block_start_pfn -
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

