Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC53376A1F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789273053; cv=none; b=NCP6xQYuZFulKIace4TVS2wCzGAelmjJnV/pjwmdS9+5RWQ3mDYPDlNRZGKEA8Pk+cAI9qKOn39fC8LKncFJ12oYcmAhgo/IWWWGNRK7YtvrzTMRY+iwPaM+9/9Q1jtIASj5qNKeGnzAk9LJ9lF9DNolH2MvHYCdzqc3L1jbWKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789273053; c=relaxed/simple;
	bh=UUbgR3sGv7Zndqwk/3bgm8TnbGOvLs1aYYNDFC/OApw=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=K6MLt32BRhZBVv6Ocs0zv69jpG3FL2MnWL+CmC4Yx58qHTmKE71+KXoatMcGKWPxgAez+iUEbm52epzM1uIoTSO6KnIKavu6pYgeJXSfzxy+1BzljYIsWYqF9vjqbOqQRkuInjlQ7+AMnsy4rN2mappumUM5yDwmgbqZ4yq1jjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hjFNw44jmz55RGh;
	Sun, 13 Sep 2026 12:17:20 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 68D4HGPL048449;
	Sun, 13 Sep 2026 12:17:16 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 13 Sep 2026 12:17:16 +0800 (CST)
X-Zmail-TransId: 2afb6aa623cc7ea-c3dd5
X-Mailer: Zmail v1.0
Message-ID: <20260913121716693wiN5osmShywgtitghSm7G@zte.com.cn>
In-Reply-To: <40c0c081-d636-407b-898e-f40f3d5d38cb@huawei.com>
References: 20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn,40c0c081-d636-407b-898e-f40f3d5d38cb@huawei.com
Date: Sun, 13 Sep 2026 12:17:16 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <tujinjiang@huawei.com>, <akpm@linux-foundation.org>, <david@kernel.org>,
        <liam@infradead.org>, <surenb@google.com>, <rppt@kernel.org>,
        <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
        <nico.pache@linux.dev>, <dev.jain@arm.com>, <baohua@kernel.org>,
        <lance.yang@linux.dev>, <chengming.zhou@linux.dev>,
        <usama.arif@linux.dev>, <gourry@gourry.net>, <harry@kernel.org>,
        <vbabka@kernel.org>, <peterz@infradead.org>,
        <borntraeger@linux.ibm.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAwLzRdIG1tL2tzbTogdXNlIHBlci1WTUEgbG9ja2luZyBmb3IgZmluZF9tZXJnZWFibGVfdm1hKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68D4HGPL048449
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 13 Sep 2026 12:17:20 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA623D0.000/4hjFNw44jmz55RGh

> >    Patch 1 removes an unused 'vma' member from struct folio_walk.  It has
> >    never been used since its introduction and is pure cleanup.
> >
> >    Patch 2 adds a 'walk_lock' member to struct folio_walk and extends
> >    folio_walk_start() to assert the required locking mode.  Existing
> >    callers are converted to pass PGWALK_RDLOCK, so there is no functional
> >    change.  This prepares folio_walk_start() for callers that hold a
> >    per-VMA read lock instead of mmap_read_lock(), which is needed by the
> >    Patch 4. No functional change.
> >
> >    Patch 3 tranforms the boolean 'lock_vma' into the enum 'page_walk_lock'
> >    without any behavior changed, which is prepared for the Patch 4 to use
> >    per-VMA locking. No functional change.
> >
> >    Patch 4 introduces find_mergeable_vma_locked(), which uses the
> >    universal per-VMA locking helper vma_start_read_unlocked() to look up
> >    and read-lock a VM_MERGEABLE VMA without taking mmap_read_lock().  All
> >    KSM call sites that previously used find_mergeable_vma() under
> >    mmap_read_lock() are converted to the new helper, and the locking in
> >    get_mergeable_page() is switched to PGWALK_VMA_RDLOCK_VERIFY so that
> >    folio_walk_start() can verify the per-VMA lock is held.
> >
> > A microbenchmark was run to measure the time KSM takes to merge a
> > victim region under mmap_lock contention. Under interference from 4 churner
> > threads, the merge time of the per-VMA KSM-optimized kernel is
> > significantly reduced by 50%.
> 
> Hi.
> 
> During task exiting, __ksm_exit() uses mmap_write_lock() to synchronize with ksmd.
> see the comment of ksm_test_exit().
> 
> void __ksm_exit(struct mm_struct *mm)
> {
>    ...
> 
> 	if (easy_to_free) {
> 		mm_slot_free(mm_slot_cache, mm_slot);
> 		mm_flags_clear(MMF_VM_MERGE_ANY, mm);
> 		mm_flags_clear(MMF_VM_MERGEABLE, mm);
> 		mmdrop(mm);
> 	} else if (mm_slot) {
> 		mmap_write_lock(mm);
> 		mmap_write_unlock(mm);
> 	}
> 
> }
> 
> When ksmd currently is scanning the exiting mm, we should guarantee the mm pagetable
> still valid (i.e., mm_users > 0). However, ksm_mm_slot only holds mm_count, which only
> guarantees the mm_strcut isn't freed. So, __ksm_exit() uses mmap write lock to synchronize
> with ksmd.
> 
> IIUC, vma_read_lock cannot be exclusive with mmap_write_lock().
>

Nice catch. Thanks for pointing this out. Indeed, the original exclusion between
__ksm_exit() and ksmd relied on mmap_write_lock() blocking mmap_read_lock(),
and per-VMA read locks do not provide that exclusion.

A possible approach to restore the necessary guarantee is to pin mm_users while
ksmd is walking the page tables:

Before scanning a given mm, try to take a reference with mmget_not_zero(mm).
If it fails, the mm is exiting, so we skip it.

Hold that reference for the entire duration of scanning that mm (not per-VMA),
and drop it with mmput() when done.

On the fallback path where we need to acquire mmap_read_lock(), drop the mm_users
reference before waiting, to avoid delaying an exiting mm.

This directly guarantees that mm_users > 0 while ksmd is accessing the page tables,
so __mmput() cannot reach exit_mmap() and free them. It is more precise than the
old mmap_write_lock() synchronization and should not introduce noticeable delay,
since the reference is only held for the scan duration.
