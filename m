Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26141F5D4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341435; cv=none; b=Xk1TNyDMnbPaj/2/MtgnVp0T6wDDByMVrgvURwStxfb/2Q0prweZb90sOymurrSxVHAy0/Fhxgygt41UDqGYDEsal1WL1rVMvzBG1UG16N3oxqbNTWvzjZyY2gg9xwjjt2/N8Ei0g7n09EABH0QDjFvNxY2c43mo1m7r48LOiwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341435; c=relaxed/simple;
	bh=TryyREP/DNhIqNgA5ZbRbS4WBzUJzOVeFw/eWr2+1TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VecIfCj4sh6gu1HxlIwGLorGBTH5+ZygaSmZdPsPbUpXOAvYELaTreSa7a2IC62AndScSKd2TN9Xg7pswQ0tUiC1WDT7s6RveN2DXbms1AgJdODwAZ6kfQBcyYN+33Kz5lucxwDYqw4Nu2JEz2vDBTNL/m56RLkA2ZJXfWFgZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=oDWQ3Ww7; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="oDWQ3Ww7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788341430; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=IdGkbmMSz5JoiHdwdzHjmW+Wa0JMP2J2z+g9mX4Y2Gg=;
	b=oDWQ3Ww7oQAvirXOQ7tXgN14vdtUQ7C2A8UXvZQN1Pwg1HYosyROnVI7wK3yubQ3Ued7/GI3NHNZ4zxV3ZXTaIAIc9rWN4LVtQWMgNYwJTkT090++guPx1cNDm9aSItdWyLnWZaybO8UM/+k6lf9c9UBT5jR9p7GqfjA0jPblVE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0XACEO3k_1788341425;
Received: from 30.178.84.37(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XACEO3k_1788341425 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 17:30:29 +0800
Message-ID: <1adc7e15-c878-46a7-89e5-79469d796024@linux.alibaba.com>
Date: Wed, 2 Sep 2026 17:30:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/list_lru: disable memcg awareness under
 cgroup_disable=memory
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Xunlei Pang <xlpang@linux.alibaba.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260902032840.30250-1-qinyuntan@linux.alibaba.com>
 <ef76e85b-dc8e-40b7-9a7f-a071d54ca7fe@linux.alibaba.com>
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
In-Reply-To: <ef76e85b-dc8e-40b7-9a7f-a071d54ca7fe@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/2/26 5:16 PM, Baolin Wang wrote:
> 
> 
> On 9/2/26 11:28 AM, Qinyun Tan wrote:
>> __list_lru_init() only collapses a memcg-aware list_lru into plain
>> per-node lists when kmem accounting is disabled
>> (cgroup.memory=nokmem).  When the memory controller is disabled
>> entirely (cgroup_disable=memory), mem_cgroup_kmem_disabled() is
>> false, so the lru stays memcg aware even though no object will ever
>> be charged to a memcg.
>>
>> This is more than a semantic inconsistency.
>> folio_memcg_list_lru_alloc() trusts list_lru_memcg_aware() and
>> dereferences the folio's memcg, which is always NULL with the
>> controller disabled.  The only mainline caller,
>> folio_memcg_alloc_deferred(), papers over this with an explicit
>> mem_cgroup_disabled() check.  The shmem unused-huge shrinker
>> conversion ("mm: shmem: make unused huge shrinker memcg aware") adds
>> a second caller without such a guard, so booting with
>> cgroup_disable=memory and writing to a huge=always tmpfs oopses:
>>
>>    BUG: unable to handle page fault for address: 0000000000000488
>>    RIP: 0010:folio_memcg_list_lru_alloc+0x41/0xf0
>>    Call Trace:
>>     <TASK>
>>     shmem_get_folio_gfp+0x1cd/0x7c0
>>     shmem_write_begin+0x5d/0x100
>>     generic_perform_write+0x89/0x2a0
>>     shmem_file_write_iter+0x82/0x90
>>     vfs_write+0x256/0x410
>>     ksys_write+0x61/0xe0
>>     do_syscall_64+0x8d/0x460
>>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>
>> The faulting address is the offset of mem_cgroup->kmemcg_id,
>> dereferenced on a NULL memcg in memcg_list_lru_allocated():
>>
>>    folio_memcg_list_lru_alloc()
>>      list_lru_memcg_aware()               <- true, only nokmem checked
>>      memcg = folio_memcg(folio)           <- NULL
>>      memcg_list_lru_allocated(memcg, lru)
>>        memcg->kmemcg_id                   <- NULL pointer dereference
>>
>> Check mem_cgroup_disabled() in __list_lru_init() so that all
>> list_lrus fall back to plain per-node lists when the controller is
>> disabled, matching what the shrinker side already does
>> (shrinker_memcg_alloc() bails out on mem_cgroup_disabled()).  This
>> makes the mem_cgroup_disabled() check in callers unnecessary rather
>> than mandatory.
>>
>> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
>> ---
>> Applies on top of mm-new.  No Fixes: tag since the commit that makes
>> the crash reachable ("mm: shmem: make unused huge shrinker memcg
>> aware") is only in mm-new; no stable backport is needed either.
>>
>> Reproducer, on mm-new booted with cgroup_disable=memory
>> (CONFIG_MEMCG=y, CONFIG_TRANSPARENT_HUGEPAGE=y):
>>
>>    # mount -t tmpfs -o huge=always tmpfs /mnt
>>    # echo x > /mnt/f
>>
>> Without this patch the write oopses immediately as shown above: the
>> freshly allocated huge folio extends beyond i_size, so
>> shmem_get_folio_gfp() queues the inode via shmem_unused_huge_add()
>> -> folio_memcg_list_lru_alloc(), which dereferences the NULL
>> folio_memcg().
>>
>> With this patch the same steps run cleanly: the lru falls back to
>> plain per-node lists and folio_memcg_list_lru_alloc() returns early.
>>  From code inspection the rest of the shmem path handles the NULL
>> objcg fine (obj_cgroup_memcg() and obj_cgroup_put() are NULL-safe,
>> and list_lru_add() with a NULL memcg lands on the per-node list),
>> but I have not exercised the shrinker reclaim itself under
>> cgroup_disable=memory.
>>
>> Discussion: https://lore.kernel.org/linux-mm/20260901115104.2944996-1-qinyuntan@linux.alibaba.com/
>>
>>   mm/list_lru.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/list_lru.c b/mm/list_lru.c
>> index 36662d02ff963..f8be119351cca 100644
>> --- a/mm/list_lru.c
>> +++ b/mm/list_lru.c
>> @@ -671,7 +671,12 @@ int __list_lru_init(struct list_lru *lru, bool memcg_aware, struct shrinker *shr
>>       else
>>           lru->shrinker_id = -1;
>>   -    if (mem_cgroup_kmem_disabled())
>> +    /*
>> +     * With the memory controller disabled entirely, no object is ever
>> +     * charged to a memcg, so collapse to plain per-node lists just
>> +     * like under nokmem.
>> +     */
> 
> These comments seem useless, as the code already explains itself.
> 

Agreed, the condition is self-explanatory. Will drop the comment.

>> +    if (mem_cgroup_disabled() || mem_cgroup_kmem_disabled())
>>           memcg_aware = false;
>>   #endif
>>   
> 
> Since __list_lru_init() is also exported, I think this looks reasonable to me. With comments removed,
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Thanks for the review. I will send v2 shortly with the comment
removed and your Reviewed-by collected.

Thanks,
Qinyun Tan
