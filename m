Received: from mta1.migadu.com (out-197.mta1.migadu.com [95.215.58.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E7C2F39B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034582; cv=none; b=YzUTX3nGr5+6EPg+cuDEPn077gz6mg8fLT7Z4oSChUUiX7O5P/YR3zk/94FaGwwdvwzKZjJ3Pi8DNHwyq++MORobzilaYcbwbC/3D/Z5lbfUqb0oBC6wWBRL4oj82MIRcM+0vVq/Lwt+dElDXA8gPdwIUoooC9MfT/bGDyToHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034582; c=relaxed/simple;
	bh=VGKrExJNYUUNySmqOW+kH+JnNYhJHPQ4iY4gAWKFLeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXjs/bFoU87+zsAFQoq4r1nxCDA7v3VCze08mPQ4ji0Ex4atwJgchSqBDnK/LU4YIs1mQqh+i/ZfYAiWTv0aeFnVJc/0w9CuZb79J7Pk+Bp4DpARMTTL+/tYhNrYj1k41pQb129pL15ItKD7OGEkff7mKJhjYA5N6OgDpoBpevU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BZDCNpRT; arc=none smtp.client-ip=95.215.58.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BZDCNpRT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VGKrExJNYUUNySmqOW+kH+JnNYhJHPQ4iY4gAWKFLeM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792034577; v=1; x=1792639377;
 b=BZDCNpRTSJjS5/BcTJRe6SW2OKJ7Dp93m+naChrsAjHQfNxvpVZtrJHwtkrs9jMKW9qNdJGF
 QBaHKkhEhdkhvT/AsFmaV4SruuyI9vaISCk5PFucGbbOdt/F48htTtOoJ2SLzCT5N8EfjKtVyyF
 NxpBPJrQtfon4lI7amwnp0QY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5105a6205c935dd6;
	Thu, 15 Oct 2026 03:22:56 +0000
X-Mizu-Trace-ID: 5105a6205c935dd6
X-Migadu-Flow: FLOW_OUT
Message-ID: <53329003-de19-4a9e-b337-0b1e15190c91@linux.dev>
Date: Thu, 15 Oct 2026 11:22:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <20261014160235.29a39f19ccd19aec47b63008@linux-foundation.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261014160235.29a39f19ccd19aec47b63008@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/15/26 7:02 AM, Andrew Morton wrote:
> On Wed, 14 Oct 2026 17:08:19 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>
>> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>>
>> On our production hosts we saw swap cache only pages keep growing for days:
>> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
>> swap slots were held by folios that no process mapped any more, charged
>> to cgroups whose workloads had long exited. The only way to get them
>> back was swapoff, and with other services actively swapping on the
>> same host that is not an option.
>>
>> Such a slot has swap count 0 and an unmapped folio pinned in the swap
>> cache, left there after a process exited or did MADV_DONTNEED. No page
>> table holds its swap entry any more, so nothing comes back for the
>> slot; LRU reclaim drops it eventually, and the allocator only reclaims
>> such slots once swap is half full. The growth stopped exactly there:
>> at 50% of the device, where vm_swap_full() becomes true.
> That's a pretty nasty problem - thanks for working on it.
>
>> Options considered:
>>
>> 1. Fix it on the readahead side: after the read, check the swap count
>>     and free the slot. Covers the lock, not writeback, and the
>>     asynchronous read path unlocks in the bio completion where the slot
>>     cannot be freed. Two places to patch, neither clean.
>> 2. swapoff/swapon clears it, as does memory.reclaim on the right cgroup.
>>     That is a workaround, not a fix.
>> 3. Have the side that gives up come back later. This patch.
>>
>> The zap runs under the PTL and the fault path takes the folio lock
>> before the PTL, so waiting there is out; a worker has to do it. On a
>> lost trylock or a writeback refusal under TTRS_UNMAPPED,
>> __try_to_reclaim_swap() schedules si->sweep_work. The worker walks the
>> in-use clusters and, for every slot with swap count 0 whose folio is
>> unmapped, calls __try_to_reclaim_swap() with TTRS_WAIT, which takes the
>> folio lock and waits for writeback instead of giving up.
>> free_swap_cache() now calls __try_to_reclaim_swap() as well, so both
>> paths give up, and wake the worker, in the same place.
>>
>> For now the worker scans every in-use cluster of the device; marking
>> the clusters that need it can reduce that later.
> It's a substantial patch.  There's no quick-n-dirty fixup we can
> prepare for backporting into older kernels?


I couldn't find a small one. I tried the other options listed in the
changelog, and each was either incomplete or spread over many places.


The zap can only trylock, and the folio can be held by many things at
that moment: readahead (sync and async reads), writeback, zswap
writeback, reclaim, migration, folio split and so on. Fixing it on that
side means patching each of them, and missing one leaves the leak. This
patch fixes it in the one place they all have in common, the zap that
gives up.

As for older kernels, I found this on 6.6 and I'm happy to do the
backports.

>>   include/linux/swap.h |   1 +
>>   mm/swap.h            |   1 +
>>   mm/swap_state.c      |   9 ++--
>>   mm/swapfile.c        | 101 ++++++++++++++++++++++++++++++++++++++++++-
>>   4 files changed, 104 insertions(+), 8 deletions(-)
> Sashiko had a few things to say:
> 	https://sashiko.dev/#/patchset/20261014090821.227366-1-jiayuan.chen@linux.dev
> 	


Thanks. The large folio split and the offset step are real and come

from TTRS_WAIT.


The swap_cache_get_folio() race is pre-existing, I could reproduce it 
and will send a separate fix.

