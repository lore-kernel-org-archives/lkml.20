Received: from mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D492E03E4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342907; cv=none; b=DmST5B1BZg84p99ZL5a+GizYnrehvatijQNUl2qY1Kwt/IPLA3UnqRLNLurfu6QUFcoKLXIH0HRCx+jS7AMq2dfdmEkUO9klRhRd9DsJbgb5I9JID7U9P2fljLkqCU0OZ08Eie1lty48fcYz5HFoD1V1cbbcu9Ri+nkZu8IfQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342907; c=relaxed/simple;
	bh=KBJNJZ99wqa5tNb5ZwQjjrE8HikWsGszb2RQSZ1VdK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Shj4c7i4Vz3u1pxtR/pdKhpwOVjp8YHd49he/0IyV4N+p2b4MiEV8iTPEiRPiUd2PsoNQcFw0Wa1AfhDTFQU0FvhX7hmVxVpJG2uRO7IFCE7XJlYlVdANJmqAV4gcaP5nxCnXfxpWcvp6Gq1gCyqXzioHbEZf9PmwkLLvvYE8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HmVTdxry; arc=none smtp.client-ip=95.215.58.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HmVTdxry"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KBJNJZ99wqa5tNb5ZwQjjrE8HikWsGszb2RQSZ1VdK0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790342902; v=1; x=1790947702;
 b=HmVTdxryUavcKgddH3EhuweynIhT/yU1A8AQNhdrcdakjXxUPXdoRy5ujE/EzzZYK49pE2jl
 JYUHgxAXSefqSgRVAKfjGPG9fl3t84OMnVW1A4vW7e/keFsB4icYYlI0cSUI3EhcANGkUoW1sB5
 /uYoDoW2HE8aoMWDjzFPz0Qg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bbd36d2360a9889a;
	Fri, 25 Sep 2026 13:28:21 +0000
X-Mizu-Trace-ID: bbd36d2360a9889a
X-Migadu-Flow: FLOW_OUT
Message-ID: <856c4436-8328-4561-a399-2df292c08b35@linux.dev>
Date: Fri, 25 Sep 2026 14:28:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 15/29] fs/proc: account PMD swap entries in smaps
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-16-usama.arif@linux.dev>
 <e375b500-be0c-4ad2-b59c-ce1d4d58bb10@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <e375b500-be0c-4ad2-b59c-ce1d4d58bb10@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/09/2026 21:37, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:28, Usama Arif wrote:
>> smaps_pmd_entry() derives a page from a non-present PMD and gives up if it
>> cannot. A PMD swap entry carries no PFN, so a swapped-out THP is accounted
>> nowhere: its bytes show up in neither Swap nor SwapPss, and VmSwap silently
>> loses them.
>>
>> The slots of a PMD swap entry can have different swap reference counts, so
>> SwapPss has to be computed one slot at a time rather than divided once.
>> Factor that loop out of smaps_pte_entry() and call it from both levels,
>> then return early: a swapped-out THP is not resident and must not be added
>> to AnonHugePages or Rss.
>>
>> pagemap needs no equivalent change - it already emits PM_SWAP and
>> type | offset+idx for a PFN-less softleaf entry - but its
>> thp_migration_supported() gate answers a different question than the decode
>> requires, so use pmd_is_valid_softleaf() there instead.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  fs/proc/task_mmu.c | 42 ++++++++++++++++++++++++++++--------------
>>  1 file changed, 28 insertions(+), 14 deletions(-)
>>
>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>> index 24425e2308951..aa3f4d54a8580 100644
>> --- a/fs/proc/task_mmu.c
>> +++ b/fs/proc/task_mmu.c
>> @@ -957,6 +957,27 @@ static void smaps_pte_hole_lookup(unsigned long addr, struct mm_walk *walk)
>>  #endif
>>  }
>>  
>> +static void smaps_account_swap(struct mem_size_stats *mss,
>> +			       softleaf_t entry, unsigned long size)
> 
> Wouldn't consuming nr_pages be more consistent with other functions that consume
> swap entry ranges?

Yes, done. mss->swap += nr_pages << PAGE_SHIFT; below in the next revision now.


> 
>> +{
>> +	unsigned long nr_pages = size >> PAGE_SHIFT;
>> +
>> +	mss->swap += size;
>> +	do {
>> +		int mapcount = swp_swapcount(entry);
> 
> While at it, can you please call that swapcount?

Done.

> 
>> +
>> +		if (mapcount >= 2) {
>> +			u64 pss_delta = (u64)PAGE_SIZE << PSS_SHIFT;
>> +
>> +			do_div(pss_delta, mapcount);
>> +			mss->swap_pss += pss_delta;
>> +		} else {
>> +			mss->swap_pss += (u64)PAGE_SIZE << PSS_SHIFT;
>> +		}
>> +		entry.val++;
>> +	} while (--nr_pages);
>> +}
> 
> 
> [...]
> 
>> @@ -2000,7 +2014,7 @@ static int pagemap_pmd_range_thp(pmd_t *pmdp, unsigned long addr,
>>  			flags |= PM_UFFD_WP;
>>  		if (pm->show_pfn)
>>  			frame = pmd_pfn(pmd) + idx;
>> -	} else if (thp_migration_supported()) {
>> +	} else if (pmd_is_valid_softleaf(pmd)) {
>>  		const softleaf_t entry = softleaf_from_pmd(pmd);
>>  		unsigned long offset;
>>  
> 
> Interesting, the function already seems to do what we want. Weird that we
> indicate PM_SWAP for migration entries ...


> 
> Also, are device_private PMD's handled correctly? *doubt*
> 
> [maybe there were patches, not sure]
> 

Not in smaps.  smaps_account() documents device-private
as fake-present and smaps_pte_entry() does it, but smaps_pmd_entry()
never did, so a PMD-mapped device-private folio got PSS charged
undivided and landed in shared_* even when mapped exactly once.
I have folded the fix for the next revision
