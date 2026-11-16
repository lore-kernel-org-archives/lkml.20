Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818314;
	b=pNLpghQ059wd3/avYbtVzZso7zdX9JVpNo0aQ59LsgGuAPMVkH3+WID7QO3rvk7F8UDD
	 QPGq8+pCd41TFF596rjtiCYBcFQBk8e2snrJoRNXrWcyR+GDp9tkaHs77o5qxlV5IWEGr
	 YrQoGSgCdRYOHBBxClW0KFPIQ9lbV44ExFDUPBz8/6KVSnyx5z2CMpZdoqPUBBHeuRthW
	 BOypitHFW66X0aD5d4hUhGocGdroq/UP+WkCdhCo1be6uY7zfU3+l121H+wTNNRju7DfD
	 Bn5cdEvl4uUig7fJmeo1bs/l5e180CpyLWN/+UI01+RXRiqIJN4jqjKG7NIsO4bJ23A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818314;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YwQjPlE5C9xr3ZrljBav55IFe0LmvzgE7fM0ikoKYZU=;
	b=czb4Jr0S6fU88IalrMA9dRbG6k5EtPRWhpmzI3B1JEHm+oJk2WXQbKczUepgoNyRVHJ0
	 DeE+GPvHcrOXlJcuJMbaNBNaLY06zK7JTK02Mg0FBUT80sGSNaVkMXIVmSqNKuR4uBdVt
	 fkASjM+l+6TtdjiOVMIhJ30Umf1d5vqSUrdOpzbqcJyWjEeKWKTKSODMR3XOLsiL7e1r6
	 tNE2Yjl0YgeY9mQFDVRhPf4lQmaulvE5ZRMCoiDaia9XGoYd+WB2BtDH6F+bQfVDU4DGf
	 GJFkmd3OmtnXmwwJBEmaf/DJcbmSg7Gl0XHMqOHhmBJ1+Zy/ghJLMC9kUgygBx3IAaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LwJ29DC/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18563606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LwJ29DC/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1E71F000C4;
	Mon, 16 Nov 2026 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794818313;
	bh=YwQjPlE5C9xr3ZrljBav55IFe0LmvzgE7fM0ikoKYZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LwJ29DC/lf644LHL68blpNQ70huLnHF0+Rl5hrrQBxHPjQodrNL/sePSpa/8y/OuR
	 B1k9NQBK+yE54apQ+9ViglwcMZ5VbY9Fqqp4dFxRwqQkHXOX5nVaOZXxv7MiYdqWDa
	 O2KZP+JDM6V5hJCXpfvn2b1WLJZraH/c5uvOWT+9dM2yUzT7YnhU4+ZBBJPpxqbW/P
	 F3szZ9hQpxWosw1naW2pWU61OffrDTugQkCv7SfHQfz5e1Sf/XOohNKZkcltu/e4ct
	 pvIdMXFwUHy6Yi2KyoC01HSNFUEr6GOmHXpk10rKhbDiCmO+NAOxpFjZc0U5icDxkD
	 3Ao6XVCcot2QA==
Message-ID: <d92f9b62-5d2a-44af-908a-ef80fc8e1766@kernel.org>
Date: Mon, 16 Nov 2026 09:38:29 +0100
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
To: Dev Jain <dev.jain@arm.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261104101747.2485913-1-kas@kernel.org>
 <28a340e0-76f5-416f-a74e-f74f4a2c2d36@arm.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <28a340e0-76f5-416f-a74e-f74f4a2c2d36@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/14/26 19:11, Dev Jain wrote:
> 
> 
> On 04/11/26 3:47 pm, Kiryl Shutsemau (Meta) wrote:
>> Once the free scanner finds pageblocks with nothing to isolate, it checks
>> only every stride-th pfn of the next block.  The stride doubles with each
>> empty block, up to COMPACT_CLUSTER_MAX, and async compaction starts at
>> the maximum.  A block that gives nothing is marked skip, and the cached
>> free pfn moves below it.
>> 
>> The samples sit on a fixed power-of-two grid and alias with any layout
>> that repeats at a power of two: when the free pages sit off the grid,
>> every sample misses them.  With one free page in eight, all at
>> pfn % 8 == 4, a stride of eight or more sees no free page at all.  The
>> free scanner runs into the migrate scanner, and compaction fails with
>> most of the free memory in the zone untouched.
>> 
>> Tasks then stall in direct reclaim, and huge page faults fall back to
>> small pages, while gigabytes of memory are free.
>> 
>> Real memory is rarely this regular; the test below builds such a layout
> 
> That is where it gets hairy: will this be observable in real workloads?
> 
> Suppose stride is 32 and the pageblock has 100 non-free pages. What is
> the probability that 512 slots are filled with 100 objects such that
> x = 0 (mod 32) is filled? It is
> 
> C(496, 84) / C(512, 100) = 1.6 * 10^(-12), very improbable.
> 
> So the chance you have a sparse block and you are missing out by not
> looking at other offsets is very low.
> 
> If stride = 32 and #objects = 400, the probability comes out to be
> 1.8%.
> 
> Keeping #objects fixed, lowering the stride lowers the probability
> exponentially. (This is relevant since we start with lower strides)
> 
> On the other hand, what happens if you are scanning over fully filled
> memory? (there is no way to tell whether a pageblock is sparse)
> You are going to repeat the scans unnecessarily.
> 
> IOW I think the probability this patch is going to have a downside is
> more than that of upside.

Agreed. This seems to all be based on a hypothetical scenario, only
constructed artificially to demonstrate it. A real-life motivation is needed.

> 
>> on purpose.  On a 32G VM it:
>> 
>>   1. fills memory with anonymous pages and pins one of them in every
>>      pageblock;
>>   2. frees one page in eight, 3.6G in total;
>>   3. creates a million files on tmpfs with defrag_mode=1.
>> 
>> Direct reclaim entries (allocstall) and the time to create the files,
>> 10 runs each:
>> 
>>                            allocstall
>>     free pages at          median    max      time, s
>>     pfn % 8 == 0                0      0      4.6-4.8
>>     pfn % 8 == 4               86   1544      4.8-5.6
>>     pfn % 8 == 4, patched       0      1      4.6-4.8
>> 
>> Sparse layouts hit a milder form of the same miss: at async compaction's
>> stride, a block with only a few scattered free pages usually yields
>> nothing.
>> 
>> Keep the aligned samples: the head of a free page of the stride's size or
>> larger is visible only there.  When they find nothing, sample the block
>> once more from a random offset.  A random offset is the usual cure for
>> aliasing: no fixed layout lines up with it, and one free page in eight is
>> found again within about eight blocks on average.
>> 
>> The second pass at most doubles the samples taken from an empty block.
>> Pages scanned by the free scanner stay within run-to-run noise, both in
>> the test above and in an mTHP fault benchmark.
>> 
>> Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")
>> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>> ---
>>  mm/compaction.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>> 
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index f1b2060eb201..475b3a645122 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -23,6 +23,7 @@
>>  #include <linux/freezer.h>
>>  #include <linux/page_owner.h>
>>  #include <linux/psi.h>
>> +#include <linux/random.h>
>>  #include <linux/cpuset.h>
>>  #include "page_alloc.h"
>>  #include "internal.h"
>> @@ -1797,6 +1798,26 @@ static void isolate_freepages(struct compact_control *cc)
>>  		nr_isolated = isolate_freepages_block(cc, &isolate_start_pfn,
>>  					block_end_pfn, cc->freepages, stride, false);
>>  
>> +		/*
>> +		 * Free pages of the stride's size or larger start on a sample,
>> +		 * but order-0 free pages spaced at a power of two can all fall
>> +		 * between the samples. Sample a block that gave nothing again
>> +		 * from a random offset.
>> +		 */
>> +		if (!nr_isolated && stride > 1 &&
>> +		    isolate_start_pfn == block_end_pfn) {
>> +			unsigned long pfn = block_start_pfn + 1 +
>> +					    get_random_u32_below(stride - 1);
>> +
>> +			/* The block can be shorter than the stride */
>> +			if (pfn < block_end_pfn) {
>> +				nr_isolated = isolate_freepages_block(cc, &pfn,
>> +						block_end_pfn, cc->freepages,
>> +						stride, false);
>> +				isolate_start_pfn = pfn;
>> +			}
>> +		}
>> +
>>  		/* Update the skip hint if the full pageblock was scanned */
>>  		if (isolate_start_pfn == block_end_pfn)
>>  			update_pageblock_skip(cc, page, block_start_pfn -
>> 
>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> 

