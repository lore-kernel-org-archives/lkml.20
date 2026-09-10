Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AA61F12F8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789001312; cv=none; b=VhZPORgA8L+ZuLTUGlzBBXXvkb3vRKphklhHFtfknx6zdkj6EpTYNuuHUetJdz4QQpCWw+a6M4JTUcYDr9fKpjji1zrHnqsV/EOT44KiPChd+ilVcUH9YztlUOKRrhjD+XAhocsdObuTwpLFIawr5cFbHlgOtIJfceKs1M64AfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789001312; c=relaxed/simple;
	bh=RVXOd5koXZRyVyXj2NvuqG/Ppv2HLn3EI1bwrBkCgrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0GE3bdn8FS+vUPg5kuyWsSMwV/Yv7DfNKdsLULhWBxLPIBytcSNk8ZjsVObhzlVWQqx+RiLwjyr7lEu6sljcuxuTCYgVQXFqSdurhj4M/O+riAKiEXm/4zhiiJ+NgZbjS5hkYDuVzeBikuViTdBnNiRBPMp5h3BY9Kzt9LSrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U3F6o9ue; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U3F6o9ue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=nq8vLjHk5vP6E4/mvbpyGkWBdIX3aI/IOS8rGp1uTP4=;
	b=U3F6o9ueRtzWPUHauNFS00Qv0nhsUsuvxkyAegc8UGRmpFCPBoGd89gMk+53QS
	k9rQQJu5VmVPRQl2LVfRujXDTfGmEXLY84bm6VnD+8Z3Kg3SO7CLkha2kyHTB7xl
	kuyBOVZ1cZnqQbU2fMcZcSMdHX86P598n6YAtfJzH9iRE=
Message-ID: <5cd47bc3-bc3d-473c-80d0-8be8b7b79881@163.com>
Date: Thu, 10 Sep 2026 08:47:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/ksm: trylock the mmap lock in the unstable tree
 walk
To: xu.xin16@zte.com.cn
Cc: akpm@linux-foundation.org, david@kernel.org, linux-mm@kvack.org,
 chengming.zhou@linux.dev, linux-kernel@vger.kernel.org,
 xialonglong@kylinos.cn
References: <20260909110228828hKTCgUeuZkOujOBaVtUcL@zte.com.cn>
From: Longlong Xia <xialonglong2025@163.com>
In-Reply-To: <20260909110228828hKTCgUeuZkOujOBaVtUcL@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnr08q_qFqdB8LBg--.771S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxury3Ww1ftF18JrWrZFy7Jrb_yoWrAr1kpF
	W2ga4jkF4kJr13u34Iv3WkuFyF93s7KrZ8G34rta43Ar98JwnrGFW3tFy0gFyUur1Skws0
	vr4jvFyq9FZ8XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uh18QUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC2xbPyGqh-ja3AAAA3+

Thanks for the review.

在 2026/9/9 11:02, xu.xin16@zte.com.cn 写道:
>> From: Longlong Xia <xialonglong@kylinos.cn>
>>
>> Every node that unstable_tree_search_insert() descends through is
>> revalidated by get_mergeable_page(), which takes the mmap_read_lock
>> of the mm the node's rmap_item belongs to. These are taken while
>> ksmd holds ksm_thread_mutex, so a single mm whose mmap lock is
>> being written to - a process busily mmap'ing or munmap'ing -
>> stalls the whole scanner, for every KSM user on the system.
>>
>> Use mmap_read_trylock() instead. The trade-off is that pages of a
>> contended mm may need more full scans to merge; in return, ksmd
>> latency no longer depends on unrelated mmap activity of the
>> scanned processes.
>>
>> Testing, on a 4 vCPU QEMU x86_64 guest with ksmd at
>> pages_to_scan=100000 and sleep_millisecs=0, 5 runs per kernel
>> (median reported; baseline is the parent commit):
>>
>> 1. A contender process registers a 64 MiB MADV_MERGEABLE area of
>>     unique pages and runs two threads looping mmap/munmap of
>>     256 MiB, so its mmap lock is held for writing much of the
>>     time.
>> 2. Once that churn is running, a quiet victim process registers
>>     32 MiB of 2048 unique pages duplicated 4 times.
>> 3. Sample /sys/kernel/mm/ksm counters and ksmd's /proc stats
>>     every 0.5 s for ~2 min of churn, then stop the churn and
>>     sample until the victim finishes merging.  The same phases
>>     run without the churn as an uncontended control.
>>
>> Results (median of 5 runs):
>>
>> - contended ksmd scan rate: 11,473 -> 58,397 pages/s (5.1x)
>> - contended victim merge time: 10.4 s -> 1.7 s; the contended
>> - contended ksmd CPU per scanned page: 13.4 us -> 3.5 us
>> - ksmd time in uninterruptible sleep under churn: 78% -> 57%;
>> - uncontended (control): merge time 0.65s vs 0.62s, scan rate
>>    259K vs 247K pages/s and ksmd CPU 3.9 vs 4.0 us per page,
>>    unchanged within ~5%.
> Sorry, I'm not fully convinced by this approach. The performance numbers
> indeed show improvements with trylock, but I'm not sure they translate
> into real user benefit. Users typically care about how many pages KSM
> actually merges and how much memory is saved, not just how fast ksmd scans.
>
>> Assisted-by: Zcode:GLM-5.3
>> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
>> ---
>>   mm/ksm.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/ksm.c b/mm/ksm.c
>> index 49d48d1e0998..3cfb09a926ff 100644
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -820,7 +820,14 @@ static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
>>   	struct folio_walk fw;
>>   	struct folio *folio;
>>   
>> -	mmap_read_lock(mm);
>> +	/*
>> +	 * We trylock because we don't want ksmd to wait for an mm that is
>> +	 * busy changing its memory layout: we prefer to skip this page and
>> +	 * let the next full scan retry it, like the folio trylock in
>> +	 * try_to_merge_one_page().
>> +	 */
>> +	if (!mmap_read_trylock(mm))
>> +		return NULL;
>>   	vma = find_mergeable_vma(mm, addr);
>>   	if (!vma)
>>   		goto out;
>> -- 
>> 2.43.0
> Sorry, NACK
>
> Also, this change feels a bit too blunt to me. In scenarios with even mild
> contention (far less than the heavy churn in your test), ksmd could end up repeatedly
> failing to acquire the mmap lock and thus fail to merge any pages for a long time.
> That could hurt KSM's effectiveness for ordinary workloads, not just the contended ones.

Indeed —— further testing confirms that repeatedly taking and releasing 
the mmap lock slows down the victim process's merging.

> Besides, there are lots of mmap_read_lock in one page's searcing and merging of ksmd, such
> as try_to_merge_with_zero_page, try_to_merge_with_ksm_page and so on...
Right — in my other tests using trylock, the difference was far less 
pronounced.
> I'd prefer a less aggressive solution that avoids stalling ksmd without starving page
> merging entirely. Maybe considering it together with smart scan? Need to see other
> suggestions from other maintainers like David.

Thanks for the suggestions — I'll explore this further.

>
> Thanks,
> Xu Xin


Thanks,

Longlong


