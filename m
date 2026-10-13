Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5963EB11E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884176; cv=none; b=GHQJbKjhTmtSB+sf4sPSKv7KKLwm+rr7CfQAylaxWwlgOmWJUrOph+J9Pg4YFrd56vpFtwC17E/mJKhKwItICVfdgFRqr5cYui4odjwDc69O4jljldxJ+7ugBva3yCgHh39Py4Kiz1IQjt8t+9JGYLwM1a1Smb8BPGavcnSTECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884176; c=relaxed/simple;
	bh=bSYBN0inOYfKRYiITpPuzhlLPrKLq5h/iogkgVYDOdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opUtxRNhCcRTdKmWSFwS8EFXmzzcFKvhU6WGBofFJrEGeDaCqQuDzmiqB0/rV0Eh7PgGUMQK8tvpBCjlNrLQbagdZxkcg1qU55CSte1yOtQr3TX4PmDOH6o1FP9mzdWMR8ejiIfj0zTEFEF8ETGzbEMfNBn4Wkb3TpSPJoDw8nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aAw0UjR0; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aAw0UjR0"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791884171; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tf91INvadMxOEv4mOizUmAwHCMyZFOULLoKUW7s5VsI=;
	b=aAw0UjR0Q00GkVKNB2lASq4k/GVXIlibJ/Ky8QNBqn+05nTDkKtfc/5NiGxIzF7fsysFNUXe9zzOY3ZftdlfnGKsb4Yg65kh1SrSzokIAfyaUteF0gjSXfrU55o9czwjts0FHoXl1bkl0uwnNvq9Z7DIW0yN844dahZcUBBBjaY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XClKMcb_1791884168;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XClKMcb_1791884168 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 13 Oct 2026 17:36:09 +0800
Message-ID: <405811f5-ee36-4b3c-80d0-7dc6827ab5d4@linux.alibaba.com>
Date: Tue, 13 Oct 2026 17:36:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: memory: fix truncation removing mapped folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com>
 <8245424a-f068-4be5-9e58-713cbff1f8ae@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <8245424a-f068-4be5-9e58-713cbff1f8ae@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/12/26 6:23 PM, David Hildenbrand (Arm) wrote:
> On 10/10/26 09:22, Baolin Wang wrote:
>> Ayush reported an issue that shmem/tmpfs folios are still mapped when
>> truncating them on production:
>> "
>> BUG: Bad page cache in process ...  pfn:...
>> page dumped because: still mapped when deleted
>> "
>>
>> I reproduced the issue with Ayush's reproducer [1] with the latest mm-unstable
>> branch, and I got the following crash info. From the dump message, we can
>> see that truncate_inode_folio() is really trying to remove mapped folios,
>> which is incorrect.
>>
>> "
>> [  189.171977] page: refcount:3 mapcount:1 mapping:00000000fe168ee1
>> index:0x3880 pfn:0x191647
>> [  189.171995] memcg:ffff0000cc073d40
>> [  189.171997] aops:shmem_aops ino:3c01 dentry name(?):"memfd:runsc-memory"
>> [  189.172006] flags: 0x17fffef0002022d(locked|referenced|uptodate|lru|
>> workingset|swapbacked|node=0|zone=2|lastcpupid=0x3ffff)
>> .......
>> [  189.172017] page dumped because: VM_BUG_ON_FOLIO(folio_mapped(folio))
>> [  189.172026] ------------[ cut here ]------------
>> [  189.172027] kernel BUG at mm/filemap.c:155!
>> [  189.172057] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>> .......
>> [  189.177721] CPU: 3 UID: 0 PID: 5521 Comm: repro Kdump: loaded Tainted:
>> 7.3.0-rc4+ #277 PREEMPT(lazy)
>> .......
>> [  189.183986] Call trace:
>> [  189.184124]  filemap_unaccount_folio+0xf0/0x1e8 (P)
>> [  189.184391]  __filemap_remove_folio+0x34/0x160
>> [  189.184633]  filemap_remove_folio+0x4c/0xb0
>> [  189.184859]  truncate_inode_folio+0x34/0x58
>> [  189.185087]  shmem_undo_range+0x220/0x658
>> [  189.185308]  shmem_fallocate+0x2f0/0x470
>> [  189.185527]  vfs_fallocate+0x128/0x328
>> ......
>> [  189.187078]  el0t_64_sync+0x184/0x188
>> "
>>
>> After analysis, I believe the race exists between truncation and MADV_DONTNEED,
>> and shmem's ->map_pages() merely makes the issue easier to reproduce. Since
>> MADV_DONTNEED synchronously releases the pagetable page before calling
>> tlb_flush_rmaps(), this could cause another thread's truncation to skip
>> zap_pte_range() (due to pmd is none) but still observe the folio's mapcount
>> as non-zero. A possible race scenario is as follows:
>>
>> CPU 0                           CPU 1
>> shmem_fallocate                 madvise_dontneed_single_vma
>>    unmap_mapping_range            .......
>>    ......
>>    (filemap_map_pages() remap folios)
>> 				  zap_pte_range
>>    truncate_inode_folio		    zap_empty_pte_table(pmd clear)
>>      unmap_mapping_folio
>>      ......
>>        zap_pmd_range (saw pmd none, skip)
>>
>>    filemap_remove_folio
>>      BUG_ON(folio_mapped)
> 
> That reminds me of sync_with_folio_pmd_zap() usage in page_vma_mapped_walk().
> 
> Isn't that the better approach?

I had considered this approach before, but it is not feasible. IIUC, the 
sync_with_folio_pmd_zap() is used to address the race with 
zap_huge_pmd(), and both the PMD clear and the folio mapcount decrement 
are performed under the PMD lock in zap_huge_pmd().

However, the race here is different: tlb_flush_rmaps() is under the PTE 
lock, while zap_empty_pte_table() is under the PMD lock, and reordering 
between the two functions is also possible. That is, the folio mapcount 
operation could execute after the acquire barrier (spin_lock()) of 
zap_empty_pte_table(), allowing a reader on CPU 0 to incorrectly observe 
that the PMD is none while mapcount > 0.

Also, we need to consider the possible reordering on the reader side on 
CPU 0, as discussed earlier [1].

[1] 
https://lore.kernel.org/all/1b77c2d7-acc6-476a-b5cd-547471a46409@linux.alibaba.com/
