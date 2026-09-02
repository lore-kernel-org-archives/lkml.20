Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D419C233134
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319249; cv=none; b=GzYQ8oe8ZgML3T9gQtZ1ccMZjqwCxLPZchCHqABakM6hEspwKcqIX/ZWoz7xn+/YdubLsC5Pukfe4A3J3MLuCrGj9EFDKhsXxQ2lfdHeOG+8xIbgCVDiZkzq4KYE3WQAxmECkxmBrzLRmWw0PHlf8rcgiAdEcAAbnfyLA81nv1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319249; c=relaxed/simple;
	bh=FNAlI/S9fr0czLN1alCSiMKKpiLb8O0yfYwnoQH2sYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNtishsGEso1GhZgviJ08GOtKI/GbxuKy3YHojGMo+kr+F/gltxpxIZgUg0F4smXUg7kie1D0oyhilpBeMTDd21BVWjJYHZb5Yru15D26CPoZut+2dhp4YdtUnDSTnMdiH3L4V5qTLJfQrNFJA61BNfsl5nWk+0T9puMCuUDfjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uxlKOnsG; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uxlKOnsG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788319244; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=OLAjDGuF8OXoX4Kx5ZvQEJnyRPp4ec5ri2eE/T7xMg8=;
	b=uxlKOnsGyPEcJlAxP98ZEcP7Y5Ir9yOdiV/YPQNcYl2wYdxw+6F4hPltsnK01N1o7attC9Rysys/RZZrmsT9OyH9zdFzWiQCXy7574bl0cwicN8XKoLjKyNTBx/LGN0ZZrF2g+pHAaBOuJTPw6kwD4CT7uUed07HkZ3NRibVLQg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XAB4.Wb_1788319242;
Received: from 30.178.84.37(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XAB4.Wb_1788319242 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 11:20:43 +0800
Message-ID: <cc69f57b-47f3-4842-829e-df1d49158884@linux.alibaba.com>
Date: Wed, 2 Sep 2026 11:20:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Lance Yang <lance.yang@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Dave Chinner <david@fromorbit.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>, Xunlei Pang
 <xlpang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
 <20260901102913.5c571bf153bc3830905c6770@linux-foundation.org>
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
In-Reply-To: <20260901102913.5c571bf153bc3830905c6770@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi,

On 9/2/26 1:29 AM, Andrew Morton wrote:
> On Tue,  1 Sep 2026 19:51:04 +0800 Qinyun Tan <qinyuntan@linux.alibaba.com> wrote:
> 
>> With cgroup.memory=nokmem, shrinker_memcg_alloc() fails with -ENOSYS
>> for shrinkers without SHRINKER_NONSLAB, and shrinker_alloc() falls
>> back to a non-memcg-aware shrinker.  On this fallback path,
>> shrinker->id is never assigned and keeps 0 from kzalloc(), which is a
>> valid id belonging to whichever memcg-aware shrinker registers first.
>>
>> __list_lru_init() copies shrinker->id unconditionally, so every
>> list_lru backed by such a fallback shrinker (thp-deferred_split,
>> zswap-shrinker, workingset shadow nodes, superblock lrus, ...) ends
>> up with lru->shrinker_id == 0 instead of -1.
>>
>> Under nokmem the list_lru collapses to the shared per-node lists, but
>> __list_lru_add() still calls set_shrinker_bit() against the memcg of
>> the added object.  Most list_lru users are unaffected because their
>> objects resolve to a NULL memcg without kmem accounting, but the THP
>> deferred split queue holds user folios, which are charged regardless
>> of nokmem.  Since no memcg-aware shrinker can register under nokmem,
>> shrinker_nr_max stays 0 and every memcg's shrinker_info has
>> map_nr_max == 0, so the first folio added by khugepaged triggers on
>> every boot:
>>
>>   WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x99/0xa0
>>
>> On systems where a SHRINKER_NONSLAB shrinker (btrfs, xfs) did register
>> and expand the maps, there is no warning; instead bit 0 is set
>> spuriously for an unrelated shrinker.
>>
>> shrinker->id is only meaningful while SHRINKER_MEMCG_AWARE is set,
>> and all readers inside mm/shrinker.c already check the flag before
>> using the id.  Make __list_lru_init() do the same and fall back to -1,
>> so set_shrinker_bit() is never reached with a bogus id.  The stale
>> shrinker->id itself is left as is; cleaning that up is a separate
>> topic.
> 
> Thanks.  I'll queue this for test and review.
> 
>> Fixes: 03375203e1da8 ("mm: do not allocate shrinker info with cgroup.memory=nokmem")
> 
> Worth a cc:stable, I assume.
> 
>> ---
>>
>> Verified on a machine booting with cgroup.memory=nokmem and
>> CONFIG_TRANSPARENT_HUGEPAGE=y: the warning fires once per boot from
>> khugepaged, disappears when nokmem is removed from the command line,
>> and no longer triggers with this fix applied and nokmem set.
> 
> That's useful info.  I'll move it into the changelog.
> 
> 
> Sashiko thinks there's a problem with cgroup_disable=memory as well:
> 	https://sashiko.dev/#/patchset/20260901115104.2944996-1-qinyuntan@linux.alibaba.com

Yes, the observation is valid, and it turned out to be a real crash
on mm-new, not just a semantic inconsistency.

__list_lru_init() only checks mem_cgroup_kmem_disabled(), which
covers cgroup.memory=nokmem but not cgroup_disable=memory.  With the
controller disabled entirely, the lru stays memcg aware while
folio_memcg() is always NULL.

On mainline this is unreachable: the only caller of
folio_memcg_list_lru_alloc(), folio_memcg_alloc_deferred(), bails out
on mem_cgroup_disabled() first.  But the shmem unused-huge shrinker
conversion in mm-new ("mm: shmem: make unused huge shrinker memcg
aware") calls folio_memcg_list_lru_alloc() without such a guard, so
booting with cgroup_disable=memory and writing to a huge=always tmpfs
oopses immediately:

  BUG: unable to handle page fault for address: 0000000000000488
  RIP: 0010:folio_memcg_list_lru_alloc+0x41/0xf0
  Call Trace:
   shmem_get_folio_gfp+0x1cd/0x7c0
   shmem_write_begin+0x5d/0x100
   generic_perform_write+0x89/0x2a0
   shmem_file_write_iter+0x82/0x90
   vfs_write+0x256/0x410
   ksys_write+0x61/0xe0

The faulting address is the offset of mem_cgroup->kmemcg_id,
dereferenced on the NULL memcg in memcg_list_lru_allocated().

I've verified that checking mem_cgroup_disabled() in
__list_lru_init() fixes this: with the lru collapsed to plain
per-node lists, folio_memcg_list_lru_alloc() returns early, the
inode is queued on the per-node list with a NULL objcg (which the
shmem code and obj_cgroup_memcg() handle fine), and the shrinker
still reclaims via the global scan.  Same reproducer runs cleanly.

I'll send the fix as a follow-up patch shortly.  Since the
triggering commit is only in mm-new, no stable backport is needed;
it may make sense to keep it ahead of (or folded near) the shmem
series.

Thanks,
Qinyun Tan
