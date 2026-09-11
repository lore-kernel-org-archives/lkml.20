Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5869F2F87B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116451; cv=none; b=rbj5DLARZxFjIWcMPDBEaNM2isS/HIIw6eFBeXhux89Gt4b0O+gKNVlKo/6XTZuE0NY4FZxes77VEA2YCMPaL1fMtwtclfNUSEyONmNuGBN4InZl4NM1/j/qSpN7a7BMso4XN5DAeEbhkDD0gIvUCoV9w3BrhrzEQSH2OEkH4NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116451; c=relaxed/simple;
	bh=KVpt2AM3o8kh2u/Q3BuMO6otZCyaDc2fsG+IIfLMSnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H2g6oLN7BrxDEprwggRrOGZ2vOPUW4wdO0rqstDzvxQGpmWhqjE956kIJ6jMWIlxlpq1NyJWBhuB01oK/+zyR8X+8r9WpGriFlE+ZqMiAwH5LHyk9Umah2X6FA/GfU92SvcleHcN4nIUo38jZGjOtJVHEUXiqTaqYVIxUyQFp/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xLmZn2Pm; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xLmZn2Pm"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1yUwcX3UlLnLfoIr8zYfqVUEOK/MbgYFGnxLAsHWgYE=;
	b=xLmZn2Pm+KYM1D0O+8lYHWWOWQ4Nw5UyxR8dYeNs7mSlCC2k7VR40D6an0jzMPdDsfLYAl4vK
	SCkgk5duhFud3ex0ylNZ1vS7gtFa47Ash4T5y96Kpoa+yY0nDPhLVib0lkQ435H0jJrf20Uulpw
	PGCvbiXg5nhT1rPjoECxGj0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hh7Dr42npzmV98;
	Fri, 11 Sep 2026 16:36:28 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 4BF1040573;
	Fri, 11 Sep 2026 16:47:24 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 16:47:23 +0800
Message-ID: <40c0c081-d636-407b-898e-f40f3d5d38cb@huawei.com>
Date: Fri, 11 Sep 2026 16:47:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] mm/ksm: use per-VMA locking for find_mergeable_vma()
To: <xu.xin16@zte.com.cn>, <akpm@linux-foundation.org>, <david@kernel.org>,
	<liam@infradead.org>, <surenb@google.com>, <rppt@kernel.org>,
	<ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>, <nico.pache@linux.dev>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
	<chengming.zhou@linux.dev>, <usama.arif@linux.dev>, <gourry@gourry.net>,
	<harry@kernel.org>, <vbabka@kernel.org>, <peterz@infradead.org>,
	<borntraeger@linux.ibm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/9/11 16:04, xu.xin16@zte.com.cn 写道:
> From: Xu Xin (ZTE) <xu.xin@linux.dev>
>
> KSM scans VM_MERGEABLE VMAs and currently protects each scan with
> mmap_read_lock(). Per-VMA locking allows KSM to read-lock only the VMA
> it is actually interested in, so that unrelated mmap()/munmap() activity
> in the same mm no longer blocks ksmd.
>
> This series is organized as follows:
>
>    Patch 1 removes an unused 'vma' member from struct folio_walk.  It has
>    never been used since its introduction and is pure cleanup.
>
>    Patch 2 adds a 'walk_lock' member to struct folio_walk and extends
>    folio_walk_start() to assert the required locking mode.  Existing
>    callers are converted to pass PGWALK_RDLOCK, so there is no functional
>    change.  This prepares folio_walk_start() for callers that hold a
>    per-VMA read lock instead of mmap_read_lock(), which is needed by the
>    Patch 4. No functional change.
>
>    Patch 3 tranforms the boolean 'lock_vma' into the enum 'page_walk_lock'
>    without any behavior changed, which is prepared for the Patch 4 to use
>    per-VMA locking. No functional change.
>
>    Patch 4 introduces find_mergeable_vma_locked(), which uses the
>    universal per-VMA locking helper vma_start_read_unlocked() to look up
>    and read-lock a VM_MERGEABLE VMA without taking mmap_read_lock().  All
>    KSM call sites that previously used find_mergeable_vma() under
>    mmap_read_lock() are converted to the new helper, and the locking in
>    get_mergeable_page() is switched to PGWALK_VMA_RDLOCK_VERIFY so that
>    folio_walk_start() can verify the per-VMA lock is held.
>
> A microbenchmark was run to measure the time KSM takes to merge a
> victim region under mmap_lock contention. Under interference from 4 churner
> threads, the merge time of the per-VMA KSM-optimized kernel is
> significantly reduced by 50%.

Hi.

During task exiting, __ksm_exit() uses mmap_write_lock() to synchronize with ksmd.
see the comment of ksm_test_exit().

void __ksm_exit(struct mm_struct *mm)
{
   ...

	if (easy_to_free) {
		mm_slot_free(mm_slot_cache, mm_slot);
		mm_flags_clear(MMF_VM_MERGE_ANY, mm);
		mm_flags_clear(MMF_VM_MERGEABLE, mm);
		mmdrop(mm);
	} else if (mm_slot) {
		mmap_write_lock(mm);
		mmap_write_unlock(mm);
	}

}

When ksmd currently is scanning the exiting mm, we should guarantee the mm pagetable
still valid (i.e., mm_users > 0). However, ksm_mm_slot only holds mm_count, which only
guarantees the mm_strcut isn't freed. So, __ksm_exit() uses mmap write lock to synchronize
with ksmd.

IIUC, vma_read_lock cannot be exclusive with mmap_write_lock().

>
> Xu Xin (4):
>    mm/pagewalk: delete the unused member
>    mm: make folio_walk_start()'s locking asserts scalable
>    mm/ksm: make break_ksm() more scalable
>    mm/ksm: add find_mergeable_vma_locked() to use per-VMA locking
>
>   arch/s390/mm/fault.c     |  4 +-
>   include/linux/pagewalk.h |  2 +-
>   kernel/events/uprobes.c  |  4 +-
>   mm/huge_memory.c         |  4 +-
>   mm/ksm.c                 | 85 ++++++++++++++++++++++++----------------
>   mm/migrate.c             |  8 +++-
>   mm/pagewalk.c            | 10 ++++-
>   mm/rmap.c                |  4 +-
>   8 files changed, 79 insertions(+), 42 deletions(-)
>
