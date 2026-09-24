Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6437F33F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248847; cv=none; b=qPoBs4vAY2mxngHpD421qC8F6+P14Vs8wXAb7MvHpbUaUWudWmiFzGGSNOW4BpSwHrsB0IHXD8TLlxjbf1eZAp04Fr/NkrxYkbYNXuzU0Mo6Mc+eSpxh7FZqeext0lFzR71tu3bAwt7o7dFoHAFMWAlVnydZc32JNku+AAX+WVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248847; c=relaxed/simple;
	bh=2ObzkTUR2MT6hgOq6WkJvQc/IYSMc6ABw6/YFMb349Y=;
	h=Cc:From:Mime-Version:In-Reply-To:Date:References:Subject:To:
	 Message-Id:Content-Type; b=gP4wjdu9EqdcOhFh/fI5CcO2PB8qc9WMVKlrZc7MywD8EgufN5Lpelw4IrlQj8rMXPglWN6xwRtjIeIGPSvaJHMqWhhGueojvw/J3NsQmXElMPFfPH42PWtleTZ53r/BMdQulE4JwhX0vGj/6uW6jtzEMA3MzGtWYBRgtFBQPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dZ68cN26; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dZ68cN26"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790248837; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=2ObzkTUR2MT6hgOq6WkJvQc/IYSMc6ABw6/YFMb349Y=;
 b=dZ68cN264+z34BUy7Fyo6XhZy7uZEk6e42CWSql3+I8sAvFUv7bB7i9QtYZSUGALi3+dFX
 T27/3rcdBZ9f7Yd/rxGjhojYSUv37FNmFwKGgqHB1czBy18gnX61hAjr9PRCAHR0VsQxAe
 qHCBN20lBfz5wHi5I1eFHUL30KbZYpFVdzfGFLAC2/NJXDPwACcEXHIro133OlytcW3ixl
 f8LlFi/j3EQEAsGsFMUY4p9tM4BGbBW0htc3zL2tUHzqvZFQOI7dhP9OqAN3q16b+5oKv+
 RsK1DrJfKZb9pjmMPYntTEyHhthG42Wiv3D2shGGHCjy3f2VpbwOvS91YCkcvQ==
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	<aiqi.i7@bytedance.com>, <akpm@linux-foundation.org>, <david@kernel.org>, 
	<osalvador@suse.de>
From: "Li Zhe" <lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <76ee3d7a-cee9-4ff3-9d4c-068a46883e30@linux.dev>
Date: Thu, 24 Sep 2026 19:20:20 +0800
References: <20260924082004.82450-1-lizhe.67@bytedance.com> <76ee3d7a-cee9-4ff3-9d4c-068a46883e30@linux.dev>
X-Lms-Return-Path: <lba+26ab50782+3999de+vger.kernel.org+lizhe.67@bytedance.com>
Subject: Re: [PATCH v3] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: quoted-printable
To: "Muchun Song" <muchun.song@linux.dev>
Message-Id: <83eefc56-cdb3-4e9b-9a2c-13819493afaa@bytedance.com>
Content-Type: text/plain; charset=UTF-8

On 9/24/26 5:51 PM, Muchun Song wrote:
>
>
> On 2026/9/24 16:20, Li Zhe wrote:
>> Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
>> PMD sharing is possible. That is only needed when huge_pmd_unshare()
>> actually detaches a shared PMD page table, because clearing the PUD
>> invalidates the whole PUD-sized virtual address range.
>>
>> For hugetlbfs hole punch, and similarly for other hugetlb unmap paths,
>> a shared mapping can pass the "PMD sharing is possible" range test in
>> adjust_range_if_pmd_sharing_possible() even when the hugetlbfs file does
>> not currently have any shared PMD page tables. KVM then receives a 1G
>> invalidation for a 2M operation and zaps unrelated secondary mappings,
>> so the guest has to fault them back in.
>>
>> Avoid this by tracking active PMD-sharing attachments per hugetlbfs
>> inode. The count is incremented only after huge_pmd_share() successfully
>> installs a shared PMD table, and decremented when __huge_pmd_unshare()
>> actually detaches one. Since huge_pmd_share() can run concurrently under
>> i_mmap_lock_read(), use atomic operations for the count. A zero count is
>> used to skip the conservative notifier range expansion only after
>> excluding concurrent PMD sharing with the mapping write lock.
>>
>> On a Redis-in-VM workload that punches cold 2M hugetlb pages, this patch
>> improves P99 QPS stability while punching pages, reducing the QPS
>> degradation ratio from 7.09% to 1.45%.
>>
>> Reported-by: aiqi.i7 <aiqi.i7@bytedance.com>
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> ---
>> v2:=20
>> https://lore.kernel.org/all/20260922090749.24905-1-lizhe.67@bytedance.co=
m/
>> v1:=20
>> https://lore.kernel.org/all/20260831091023.66581-1-lizhe.67@bytedance.co=
m/
>>
>> ChangeLogs:
>> v2->v3:
>> - Rework the sticky state based on Andrew's feedback: use a per-inode
>> =C2=A0=C2=A0 counter of active PMD-sharing attachments, so files can ret=
urn to the
>> =C2=A0=C2=A0 no-active-sharing state after PMD sharing ends.
>>
>> v1->v2:
>> - Rework the implementation based on David's suggestion: remember
>> =C2=A0=C2=A0 whether PMD sharing ever happened for a hugetlbfs file, and=
 skip the
>> =C2=A0=C2=A0 conservative notifier range expansion while it has not. Thi=
s avoids
>> =C2=A0=C2=A0 the per-unmap page-table walk.
>>
>> =C2=A0 fs/hugetlbfs/inode.c=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 include/linux/hugetlb.h | 43 ++++++++++++++++++++++++++++++++++++=
+++++
>> =C2=A0 mm/hugetlb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 13 ++++++++++---
>> =C2=A0 3 files changed, 54 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
>> index 7611a8470ea26..78e27ce0a6f63 100644
>> --- a/fs/hugetlbfs/inode.c
>> +++ b/fs/hugetlbfs/inode.c
>> @@ -921,6 +921,7 @@ static struct inode *hugetlbfs_get_inode(struct=20
>> super_block *sb,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 simple_inode_init=
_ts(inode);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->resv_map =
=3D resv_map;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->seals =3D F=
_SEAL_SEAL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hugetlbfs_pmd_sharing_init(i=
node);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (mode & S_=
IFMT) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 init_special_inode(inode, mode, dev);
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 16c4c4caa126c..6b4f92b7f7ae4 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -12,6 +12,7 @@
>> =C2=A0 #include <linux/page_ref.h>
>> =C2=A0 #include <linux/list.h>
>> =C2=A0 #include <linux/kref.h>
>> +#include <linux/atomic.h>
>> =C2=A0 #include <linux/pgtable.h>
>> =C2=A0 #include <linux/gfp.h>
>> =C2=A0 #include <linux/userfaultfd_k.h>
>> @@ -509,6 +510,9 @@ struct hugetlbfs_inode_info {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct inode vfs_inode;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct resv_map *resv_map;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int seals;
>> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>> +=C2=A0=C2=A0=C2=A0 atomic_t pmd_sharing_count;
>> +#endif
>> =C2=A0 };
>> =C2=A0 =C2=A0 static inline struct hugetlbfs_inode_info *HUGETLBFS_I(str=
uct=20
>> inode *inode)
>> @@ -516,6 +520,45 @@ static inline struct hugetlbfs_inode_info=20
>> *HUGETLBFS_I(struct inode *inode)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return container_of(inode, struct hugetlb=
fs_inode_info,=20
>> vfs_inode);
>> =C2=A0 }
>> =C2=A0 +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>> +static inline void hugetlbfs_pmd_sharing_init(struct inode *inode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 atomic_set(&HUGETLBFS_I(inode)->pmd_sharing_count, 0=
);
>> +}
>> +
>> +static inline void hugetlbfs_pmd_sharing_inc(struct inode *inode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 atomic_inc(&HUGETLBFS_I(inode)->pmd_sharing_count);
>> +}
>> +
>> +static inline void hugetlbfs_pmd_sharing_dec(struct inode *inode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 atomic_dec(&HUGETLBFS_I(inode)->pmd_sharing_count);
>> +}
>> +
>> +/*
>> + * A 32-bit counter can theoretically wrap, but doing so would require
>> + * billions of active PMD-sharing attachments to the same inode and=20
>> is not
>> + * expected in practice. Treat any non-zero value as active so a=20
>> wrapped
>> + * negative value still takes the conservative notifier range.
>> + */
>> +static inline bool hugetlbfs_pmd_sharing_active(struct inode *inode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return atomic_read(&HUGETLBFS_I(inode)->pmd_sharing_=
count) !=3D 0;
>
> Testing for non zero covers the negative half of the cycle,
> but the 2^32nd increment changes the value back to zero.
>
> The inode-wide total is not bounded by PID_MAX_LIMIT because
> one mm can have an attachment in every PUD-sized part of a
> large mapping.=C2=A0 For example, a 4-level x86 mm has about
> 131,000 user PUD slots.=C2=A0 Roughly 32,769 child mms can therefore
> create more than 2^32 attachments by faulting one address in
> each PUD of a single large inherited MAP_SHARED hugetlb VMA.
> This also does not require one backing huge page per
> attachment: huge_pte_alloc() installs or shares the PMD table
> before hugetlb_no_page() attempts to obtain the huge page.
>
> At the zero value, an unmap can take i_mmap_rwsem for write,
> observe no active sharing, and issue only the original narrow
> notifier.=C2=A0 Its subsequent __huge_pmd_unshare() can still
> clear a PUD and decrement the counter from zero to -1, leaving
> the rest of the PUD-sized invalidation unreported.
>
> Could this use a 64-bit or saturating counter so an active
> count can never be mistaken for zero?
>
> Therefore, I recommend using atomic64_t.
>
> Thanks,
> Muchun


Thanks for the detailed explanation.

I did consider that such an extreme case could theoretically cause a
problem, but I expected it to be practically unreachable. But since we
can cover this corner case simply by using atomic64_t, that is definitely
better.

I will switch the counter to atomic64_t in v4 and drop the 32-bit wrap
comment.

Thanks,
Zhe

>
>> +}
>> +#else
>> +static inline void hugetlbfs_pmd_sharing_init(struct inode *inode) {}
>> +
>> +static inline void hugetlbfs_pmd_sharing_inc(struct inode *inode) {}
>> +
>> +static inline void hugetlbfs_pmd_sharing_dec(struct inode *inode) {}
>> +
>> +static inline bool hugetlbfs_pmd_sharing_active(struct inode *inode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return false;
>> +}
>> +#endif
>> +
>> =C2=A0 extern const struct vm_operations_struct hugetlb_vm_ops;
>> =C2=A0 struct file *hugetlb_file_setup(const char *name, size_t size,=20
>> vma_flags_t acct,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int creat_flags, int page_size_log);
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 4f6f58bf3db6c..cb27c06d1f7a7 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -5361,10 +5361,12 @@ void __hugetlb_zap_begin(struct=20
>> vm_area_struct *vma,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!vma->vm_file)=C2=A0=C2=A0=C2=A0 /* h=
ugetlbfs_file_mmap error */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 adjust_range_if_pmd_sharing_possible(vma, sta=
rt, end);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hugetlb_vma_lock_write(vma);
>> -=C2=A0=C2=A0=C2=A0 if (vma->vm_file)
>> +=C2=A0=C2=A0=C2=A0 if (vma->vm_file) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i_mmap_lock_write=
(vma->vm_file->f_mapping);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (hugetlbfs_pmd_sharing_ac=
tive(file_inode(vma->vm_file)))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adju=
st_range_if_pmd_sharing_possible(vma, start, end);
>> +=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> =C2=A0 =C2=A0 void __hugetlb_zap_end(struct vm_area_struct *vma,
>> @@ -5403,7 +5405,10 @@ void unmap_hugepage_range(struct=20
>> vm_area_struct *vma, unsigned long start,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmu_notifier_range_init(&range, MM=
U_NOTIFY_CLEAR, 0, vma->vm_mm,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start, end);
>> -=C2=A0=C2=A0=C2=A0 adjust_range_if_pmd_sharing_possible(vma, &range.sta=
rt,=20
>> &range.end);
>> +=C2=A0=C2=A0=C2=A0 i_mmap_assert_write_locked(vma->vm_file->f_mapping);
>> +=C2=A0=C2=A0=C2=A0 if (hugetlbfs_pmd_sharing_active(file_inode(vma->vm_=
file)))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adjust_range_if_pmd_sharing_=
possible(vma, &range.start,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &range.end);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmu_notifier_invalidate_range_start(&rang=
e);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb_gather_mmu(&tlb, vma->vm_mm);
>> =C2=A0 @@ -7006,6 +7011,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm,=
=20
>> struct vm_area_struct *vma,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pud_none(*pud)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pud_populate(mm, =
pud,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (pmd_t *)((unsigned long)spte & PAGE_MASK));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hugetlbfs_pmd_sharing_inc(fi=
le_inode(vma->vm_file));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_inc_nr_pmds(mm=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptdesc_pmd_pts_de=
c(virt_to_ptdesc(spte));
>> @@ -7037,6 +7043,7 @@ static int __huge_pmd_unshare(struct mmu_gather=20
>> *tlb,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pud_clear(pud);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb_unshare_pmd_ptdesc(tlb, virt_t=
o_ptdesc(ptep), addr);
>> +=C2=A0=C2=A0=C2=A0 hugetlbfs_pmd_sharing_dec(file_inode(vma->vm_file));
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_dec_nr_pmds(mm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>
