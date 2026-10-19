Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312893BC696
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395460; cv=none; b=i0H/C3McnveVF82If29S9pksKmqzF3pfKSr9UCa2QdFwfLX3sodvLkjEzev/JsPYYrwTirJx8YqwJC6kc05TawSSNUkUN+lZYBAoWUGSlZbx7KgGMjFRZl31UvrUgse+8dFFqkK6DSx++sahQwadjQxZ+0wmh1Wxu+GtnA0n8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395460; c=relaxed/simple;
	bh=vfGm6RTLSoK7No1Pk0BzV4dF1kIF4wD7+x+fiScQFRo=;
	h=Subject:Date:Content-Type:Cc:From:Message-Id:References:To:
	 Mime-Version:In-Reply-To; b=ME9Kuc24+xEy2axq2s50D3JIB+QIixHpIAiL1yr/LrWa6pnpn4qEGy/FPRe0lezSIqHvbmytUCXR+X3oHONuQpkJP2kHj7y0kQIoG0qjhkJAVwfV4opwq63xTi3DeHCjUmsHhV+40za9LJ9P6bKWM5p8rLTiGOnlKexui04a1yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eDaRYQF4; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eDaRYQF4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792395448; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=h5Bz8p0/6fFu4pna3JkJBMFOb4VonOxLITU8io1OR8E=;
 b=eDaRYQF4vFvXhN4cvxMwBHpSFk8/KgpC6dZzbyxDDPDXKgVeIMTxttPp6bOrUGLG8pLktC
 YZtjJ0sWQdpZyZjkkWu3TXCvBIwsD6ZDr8J4KyZdbudOXmXVdBlePMLA+Gx40TFCojf/X0
 dM1SIKwkFm09fNQeNsVgnZ0utvtGMchJRX5csHJfskXXQSxWrg67FXQvEeIcr3TW3FwpdH
 65OJi+CWEDA9pc8VX0nL7jL7CSvX6OelIMElkyVG1ARbo33v+82hcFTxw2Hpxlji4csCCt
 Z5fvpzMQgNGDm5t+tf0RK/ens22CF9fble4K9ZMwF9SMsxg1e5rWbU0OSMeeDA==
Subject: Re: [PATCH 0/5] mm: hugetlb: add CMA support for PMD-sized page
Date: Mon, 19 Oct 2026 15:37:09 +0800
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: <osalvador@suse.de>, <david@kernel.org>, <akpm@linux-foundation.org>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
From: "Qi Zheng" <zhengqi.arch@bytedance.com>
Message-Id: <4a7ad39d-fee6-4390-beff-d40ecf49cbdc@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com> <FA455F0C-0A46-4B5B-AB50-E9968001D2C9@linux.dev>
X-Lms-Return-Path: <lba+26ad5c8b4+ec92ab+vger.kernel.org+zhengqi.arch@bytedance.com>
To: "Muchun Song" <muchun.song@linux.dev>, "Qi Zheng" <qi.zheng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Qi Zheng <zhengqi.arch@bytedance.com>
User-Agent: Mozilla Thunderbird
In-Reply-To: <FA455F0C-0A46-4B5B-AB50-E9968001D2C9@linux.dev>

Hi Muchun,

On 10/19/26 2:50 PM, Muchun Song wrote:
> 
> 
>> On Oct 16, 2026, at 18:07, Qi Zheng <qi.zheng@linux.dev> wrote:
>>
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Hi all,
>>
>> Allocating PMD-sized HugeTLB pages at runtime can become slow or fail
>> as physical memory becomes fragmented. Reserving HugeTLB pages at boot
>> avoids this problem, but keeps unused pages unavailable to ordinary
>> allocations.
>>
>> Live upgrades are one example: they need additional HugeTLB pages only
>> during the upgrade. HugeTLB already supports CMA for gigantic pages,
>> but reserving a CMA pool for 1 GiB pages can fail when physical KASLR
>> and other early reservations leave too few suitable 1 GiB-aligned
>> ranges. At runtime, 1 GiB allocations can also fail when pages cannot
>> be migrated out of a suitable contiguous range.
> 
> Yes, that's our use case at ByteDance. Allocating a 1GB HugeTLB page from
> the CMA pool is more prone to failure than allocating a 2MB one. To improve
> the probability of successful allocation, we typically configure the CMA
> size to be larger than our actual requirement, keeping a certain margin to
> handle cases where temporary kernel operations (such as DMA) prevent successful
> migration. For 1G HugeTLB pages, since the margin must be an integer multiple
> of 1G, the extra memory configured as headroom is also relatively large,
> making it less flexible than 2M pages.
> 
>>
>> Extend CMA support to PMD-sized pages so their backing memory can be
>> reserved at boot while remaining usable for movable allocations until
>> needed. This relaxes the reservation alignment requirement and reduces
>> the contiguous range required per allocation.
>>
>> The series adds an optional @<page-size> suffix to hugetlb_cma and a
>> separate PMD-sized pool. For example, on x86-64:
>>
>> hugetlb_cma=4G hugetlb_cma=1G@2M
> 
> Different sizes of gigantic pages already share a single HugeTLB CMA pool.
> Given that, why not let 2M pages also reuse this same pool? Would that make
> the overall code implementation simpler? And if it does make things simpler,
> should we go ahead and do it first?

Sharing the pool would simplify the implementation. My concern is that
small PMD allocations could fragment the default pool and prevent later
gigantic allocations.

32M allocations can already cause this, but 2M allocations can block
the same number of 1G-aligned ranges with much less allocated memory.

Thanks,
Qi

> 
> Thanks,
> Muchun
> 
>>
>> This reserves 4G for the existing gigantic-page pool and 1G for the
>> PMD-sized pool. Existing unsuffixed parameters and gigantic-page pool
>> sharing are preserved. The new size follows the architecture's PMD
>> size rather than being fixed at 2M.
>>
>> The preparatory patches introduce per-pool state and prevent recursive
>> CMA allocation during migration before enabling PMD-sized allocation.
>>
>> Thanks,
>> Qi
>>
>> Qi Zheng (5):
>>   mm: hugetlb: add explicit page size to hugetlb_cma
>>   mm: hugetlb: group CMA pool and reservation state
>>   mm: hugetlb: track CMA reservations by page order
>>   mm: hugetlb: avoid recursive CMA allocation during migration
>>   mm: hugetlb: enable CMA allocation for PMD-sized pages
>>
>> .../admin-guide/kernel-parameters.txt         |  39 ++-
>> include/linux/hugetlb.h                       |   4 +-
>> mm/hugetlb.c                                  |  80 +++--
>> mm/hugetlb_cma.c                              | 328 ++++++++++++------
>> mm/hugetlb_cma.h                              |  11 +-
>> mm/mempolicy.c                                |   2 +-
>> mm/migrate.c                                  |   3 +-
>> 7 files changed, 306 insertions(+), 161 deletions(-)
>>
>>
>> base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
>> -- 
>> 2.54.0
>>
