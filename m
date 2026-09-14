Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C1CA6B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355048; cv=none; b=Xeq3N2VaaPErS/Fry7V/WoOW7Ea/W25EqqPvTXN4kZJUUjNSC1RPH/5MOB3qJlxMFyiai9Y9qKk9NJDtANRc+EjrglYpjm/YfayBAz1VQnRoZOBHjHpx3h02Kgssh1x1F2cRKCrZ6UbHsAOA123UqZ/drDq58Lz7nuezQD8M+J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355048; c=relaxed/simple;
	bh=f1vCNE7l71bIbNZ3My4mGjSC0gaHmeZP+zxL5LaNBHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nozTzQclSEDu3x/ot3fGtGKUq/QNCDIjP45HCEjZAY1g3dNWEDi0Y49h78lP4YgFAC0/kMiAquWCva/j1pYNGEF06+QN7f01XKBmnkEC54wXD/J4MX/AufVDTafWC6VHtuXAyvvVozUpOLJQnTXMCqWJ1FlyJeribeSpf8n8MHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=AWQVK5l2; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="AWQVK5l2"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QbEkjRvDTT9Ap9hbZxOwJdBfJpMC1NbhJsmL6dREPI0=;
	b=AWQVK5l2K6Dpg0gktWDL2TJvnP5Ac0hQYTpF5TUw9YTxGcbFv2O2SvIIxShFtx6UWLkKTYsAa
	+V/nj3qjjhqxQP4g3ap+H+yDLiMZhmRWiOeUgGhcWOG8NgkRXke+5Io8BC0dB9ayefXkhG/rV1G
	tIkK3g5vXP6BxnAuPXq1OWk=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hjqSM4PQQz1T4JM;
	Mon, 14 Sep 2026 10:52:19 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id D9B3040537;
	Mon, 14 Sep 2026 11:03:57 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 11:03:56 +0800
Message-ID: <a19a0c1d-d2bf-4c40-9308-e815f925f87a@huawei.com>
Date: Mon, 14 Sep 2026 11:03:56 +0800
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
References: <20260913121716693wiN5osmShywgtitghSm7G@zte.com.cn>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <20260913121716693wiN5osmShywgtitghSm7G@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/9/13 12:17, xu.xin16@zte.com.cn 写道:
>>>     Patch 1 removes an unused 'vma' member from struct folio_walk.  It has
>>>     never been used since its introduction and is pure cleanup.
>>>
>>>     Patch 2 adds a 'walk_lock' member to struct folio_walk and extends
>>>     folio_walk_start() to assert the required locking mode.  Existing
>>>     callers are converted to pass PGWALK_RDLOCK, so there is no functional
>>>     change.  This prepares folio_walk_start() for callers that hold a
>>>     per-VMA read lock instead of mmap_read_lock(), which is needed by the
>>>     Patch 4. No functional change.
>>>
>>>     Patch 3 tranforms the boolean 'lock_vma' into the enum 'page_walk_lock'
>>>     without any behavior changed, which is prepared for the Patch 4 to use
>>>     per-VMA locking. No functional change.
>>>
>>>     Patch 4 introduces find_mergeable_vma_locked(), which uses the
>>>     universal per-VMA locking helper vma_start_read_unlocked() to look up
>>>     and read-lock a VM_MERGEABLE VMA without taking mmap_read_lock().  All
>>>     KSM call sites that previously used find_mergeable_vma() under
>>>     mmap_read_lock() are converted to the new helper, and the locking in
>>>     get_mergeable_page() is switched to PGWALK_VMA_RDLOCK_VERIFY so that
>>>     folio_walk_start() can verify the per-VMA lock is held.
>>>
>>> A microbenchmark was run to measure the time KSM takes to merge a
>>> victim region under mmap_lock contention. Under interference from 4 churner
>>> threads, the merge time of the per-VMA KSM-optimized kernel is
>>> significantly reduced by 50%.
>> Hi.
>>
>> During task exiting, __ksm_exit() uses mmap_write_lock() to synchronize with ksmd.
>> see the comment of ksm_test_exit().
>>
>> void __ksm_exit(struct mm_struct *mm)
>> {
>>     ...
>>
>> 	if (easy_to_free) {
>> 		mm_slot_free(mm_slot_cache, mm_slot);
>> 		mm_flags_clear(MMF_VM_MERGE_ANY, mm);
>> 		mm_flags_clear(MMF_VM_MERGEABLE, mm);
>> 		mmdrop(mm);
>> 	} else if (mm_slot) {
>> 		mmap_write_lock(mm);
>> 		mmap_write_unlock(mm);
>> 	}
>>
>> }
>>
>> When ksmd currently is scanning the exiting mm, we should guarantee the mm pagetable
>> still valid (i.e., mm_users > 0). However, ksm_mm_slot only holds mm_count, which only
>> guarantees the mm_strcut isn't freed. So, __ksm_exit() uses mmap write lock to synchronize
>> with ksmd.
>>
>> IIUC, vma_read_lock cannot be exclusive with mmap_write_lock().
>>
> Nice catch. Thanks for pointing this out. Indeed, the original exclusion between
> __ksm_exit() and ksmd relied on mmap_write_lock() blocking mmap_read_lock(),
> and per-VMA read locks do not provide that exclusion.
>
> A possible approach to restore the necessary guarantee is to pin mm_users while
> ksmd is walking the page tables:
>
> Before scanning a given mm, try to take a reference with mmget_not_zero(mm).
> If it fails, the mm is exiting, so we skip it.
>
> Hold that reference for the entire duration of scanning that mm (not per-VMA),
> and drop it with mmput() when done.
>
> On the fallback path where we need to acquire mmap_read_lock(), drop the mm_users
> reference before waiting, to avoid delaying an exiting mm.

We should avoid holding mm_users ref too long. Otherwise, when the task being scanned
by ksmd is OOM-skilled, even though the victim task has responsed SIGKILL signal and
exited, the mmaps aren't released due to mm_user > 0.

We should check whether the mm_user has dropped to 1 during scanning, like what
ksm_test_exit() has done.

>
> This directly guarantees that mm_users > 0 while ksmd is accessing the page tables,
> so __mmput() cannot reach exit_mmap() and free them. It is more precise than the
> old mmap_write_lock() synchronization and should not introduce noticeable delay,
> since the reference is only held for the scan duration.
