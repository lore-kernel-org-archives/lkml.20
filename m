Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25538D3F4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022418; cv=none; b=YzaOaxJorklLp3uj0iM4+ckNi3QL1a4eJ8faJri7IWNPJXR0jSvi6UlgWqIv9OwwGAWmT6ABobCeGRs5O/nxxYlmgqGSi1gO4FML0qdiUQUFaIqX/FYb4BBv/giHwHIqGv29fvkCPxOWcHZDvTFOJNU8MKfRVZmca6VgsYa2Q7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022418; c=relaxed/simple;
	bh=oYclOY1YwnIQR+tcV+KQns6iO0ESNNsEZx76cGgf2yw=;
	h=Mime-Version:References:From:Subject:Date:Content-Type:
	 In-Reply-To:To:Message-Id:Cc; b=sNGnNha75m7LnfmNUt222QCel7JuzxW2AnC541bX0fWZLa8yzl3l2cMmZ5e7cckb/mTNLNAW3mlvLzDboA51N15bxd1fN+EamqCO6Exc33seEacC+obAyw4A6yfcsA/BupmzNZMtU+ArXRceiPgIChM7i6l4FYax0C0vX13VaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kLIRIzzw; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kLIRIzzw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789022398; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mhx/dsFP2CMObhPGokTuIC/TPYYGoTzzepENJHonJ3Y=;
 b=kLIRIzzwapaOW1qFNrO6YDGrFCDgjf0nTTV9CD9AESNRfVMbp/edJxskNzTyVIw1670ZvF
 YTxZi1lEsmKHpkdxvFjngBZp8HbdWQQ1i6uhAGu3cwGVeothz9E3SVZD0gZrjW8pD/k8/r
 gI5SA/KXUKXeKMjtfwELvdKQUUYl62D0zCWOsgDb4O8cLmaLo0ithgJkx3AHY1yKHkgCxJ
 3xfk6/6wcRqfWNGxlunrlL/GkbezF2NQNkZJBWs8R3pTMa0rHMSgkjYUH3YLHRnP8y8HH5
 qdfxiLmeWpr7VGeGr6Zk1vJv0mbi7Ha22uacrJOl/U5H7WICgvhjPwt2Rb/EsA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831091023.66581-1-lizhe.67@bytedance.com> <20260831173220.72ab28190a44a305dacf4d04@linux-foundation.org> <47a6817e-e98e-4a00-8e2c-6a66d15ddb37@kernel.org> <874e7793-877a-40a5-97ce-11dd5b9ee9ba@bytedance.com> <d1ede193-bc56-46de-9d0d-fc037ddf835d@kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs
Date: Thu, 10 Sep 2026 14:39:29 +0800
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <d1ede193-bc56-46de-9d0d-fc037ddf835d@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Andrew Morton" <akpm@linux-foundation.org>
Message-Id: <ab3d20db-380b-4b37-8a8f-2a0d9a6f7d6e@bytedance.com>
X-Lms-Return-Path: <lba+26aa250b2+623d63+vger.kernel.org+lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Cc: <muchun.song@linux.dev>, <osalvador@suse.de>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, <aiqi.i7@bytedance.com>

On 9/10/26 12:59 AM, David Hildenbrand (Arm) wrote:
> On 9/8/26 09:09, Li Zhe wrote:
>> On 9/7/26 11:29 PM, David Hildenbrand (Arm) wrote:
>>> On 9/1/26 02:32, Andrew Morton wrote:
>>>> Thanks.
>>>>
>>>> So a modest performance improvement?
>>> Is that worth the complexity, though?
>>
>> That is a fair concern.
> In you setup, are the page tables ever being shared? I suspect you just r=
un a VM
> with no other processes actually sharing the memory?


Yes. In the tested setup, there is only one QEMU process mapping the
hugetlbfs file for the VM. The hugetlb page tables are not actually shared.

>
> One idea would be to just remember whether any sharing ever happened for =
a
> hugetlb file.


I reworked the patch based on your suggestion. Instead of walking the
page tables during unmap, this version records, per hugetlbfs inode,
whether PMD sharing has ever actually been established for the file. The
flag is set only after huge_pmd_share() successfully populates a shared
PMD table.

For the hugetlbfs zap/unmap paths, the conservative PUD-sized MMU
notifier expansion is skipped while the file has never seen PMD
sharing. Once PMD sharing has ever happened for the file, the code falls
back to the existing conservative behavior.

>
>> I tried to simplify the approach. Instead of computing the exact PUD
>> sub-ranges that contain shared PMD tables, this version keeps the
>> existing adjust_range_if_pmd_sharing_possible() logic unchanged and only
>> adds an actual shared-PMD check as a gate before it.
>>
>> So the behavior becomes:
>>
>>   =C2=A0 - if no shared PMD table is found, keep the notifier range unch=
anged;
>>   =C2=A0 - if any shared PMD table is found, fall back to the existing
>>   =C2=A0 =C2=A0 conservative PUD-sized expansion.
>>
>> This should still avoid the unnecessary 1G KVM invalidation for the
>> common unshared-PMD case, while keeping the range expansion policy
>> unchanged when a shared PMD is present.
>>
>> The resulting diff would look like this:
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 816dde7..7a61fc3 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -5355,10 +5357,12 @@ void __hugetlb_zap_begin(struct vm_area_struct *=
vma,
>>   =C2=A0 =C2=A0 =C2=A0if (!vma->vm_file)=C2=A0 =C2=A0 /* hugetlbfs_file_=
mmap error */
>>   =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>>
>> -=C2=A0 =C2=A0 adjust_range_if_pmd_sharing_possible(vma, start, end);
>>   =C2=A0 =C2=A0 =C2=A0hugetlb_vma_lock_write(vma);
>> -=C2=A0 =C2=A0 if (vma->vm_file)
>> +=C2=A0 =C2=A0 if (vma->vm_file) {
>>   =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i_mmap_lock_write(vma->vm_file->f_ma=
pping);
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (range_has_shared_pmd(vma, *start, *end)=
)
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjust_range_if_pmd_sharing_p=
ossible(vma, start, end);
>> +=C2=A0 =C2=A0 }
>>   =C2=A0}
>>
>>   =C2=A0void __hugetlb_zap_end(struct vm_area_struct *vma,
>> @@ -5397,7 +5401,9 @@ void unmap_hugepage_range(struct vm_area_struct
>> *vma, unsigned long start,
>>
>>   =C2=A0 =C2=A0 =C2=A0mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, =
0, vma->vm_mm,
>>   =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start, e=
nd);
>> -=C2=A0 =C2=A0 adjust_range_if_pmd_sharing_possible(vma, &range.start, &=
range.end);
>> +=C2=A0 =C2=A0 if (range_has_shared_pmd(vma, range.start, range.end))
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 adjust_range_if_pmd_sharing_possible(vma, &=
range.start,
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&range.end);
>>   =C2=A0 =C2=A0 =C2=A0mmu_notifier_invalidate_range_start(&range);
>>   =C2=A0 =C2=A0 =C2=A0tlb_gather_mmu(&tlb, vma->vm_mm);
>>
>> @@ -6958,6 +6964,52 @@ void adjust_range_if_pmd_sharing_possible(struct
>> vm_area_struct *vma,
>>   =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*end =3D ALIGN(*end, PUD_SIZE);
>>   =C2=A0}
>>
>> +static bool range_has_shared_pmd(struct vm_area_struct *vma,
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
long start, unsigned long end)
>> +{
>> +=C2=A0 =C2=A0 unsigned long v_start =3D ALIGN(vma->vm_start, PUD_SIZE);
>> +=C2=A0 =C2=A0 unsigned long v_end =3D ALIGN_DOWN(vma->vm_end, PUD_SIZE)=
;
>> +=C2=A0 =C2=A0 struct hstate *h =3D hstate_vma(vma);
>> +=C2=A0 =C2=A0 struct mm_struct *mm =3D vma->vm_mm;
>> +=C2=A0 =C2=A0 unsigned long address;
>> +
>> +=C2=A0 =C2=A0 if (huge_page_size(h) !=3D PMD_SIZE)
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
>> +
>> +=C2=A0 =C2=A0 /*
>> +=C2=A0 =C2=A0 =C2=A0* First apply the same cheap test as
>> +=C2=A0 =C2=A0 =C2=A0* adjust_range_if_pmd_sharing_possible(). Only the =
PUD-aligned
>> +=C2=A0 =C2=A0 =C2=A0* intersection can contain shared PMD tables.
>> +=C2=A0 =C2=A0 =C2=A0*/
>> +=C2=A0 =C2=A0 if (!(vma->vm_flags & VM_MAYSHARE) || !(v_end > v_start) =
||
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 end <=3D v_start || start >=3D v_end)
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
>> +
>> +=C2=A0 =C2=A0 start =3D max(ALIGN_DOWN(start, PUD_SIZE), v_start);
>> +=C2=A0 =C2=A0 end =3D min(ALIGN(end, PUD_SIZE), v_end);
>> +
>> +=C2=A0 =C2=A0 hugetlb_vma_assert_locked(vma);
>> +=C2=A0 =C2=A0 i_mmap_assert_write_locked(vma->vm_file->f_mapping);
>> +
>> +=C2=A0 =C2=A0 for (address =3D start; address < end; address +=3D PUD_S=
IZE) {
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pte_t *ptep;
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool shared;
>> +
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptep =3D hugetlb_walk(vma, address, PMD_SIZ=
E);
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptep)
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
>> +
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(huge_pte_lockptr(h, mm, ptep));
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shared =3D ptdesc_pmd_is_shared(virt_to_ptd=
esc(ptep));
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(huge_pte_lockptr(h, mm, ptep));
> I really don't like this piece of code to optimize something that is alre=
ady
> questionable in practice: overcommiting hugetlb folios for VMs.
>
> Can you share some more details which mechanism ends up zapping hugetlb f=
olios
> for the VM?
>
> If it's virtio-balloon's free-page-reporting, you should likely disable t=
hat for
> the VM.


It is not virtio-balloon free-page-reporting.

The setup uses a downstream, out-of-tree QEMU/KVM reclaim mechanism for
hugetlb-backed VM memory. KVM maintains hot/cold information for guest
memory. QEMU then asks KVM to select cold guest ranges and releases the
corresponding hugetlbfs-backed host ranges after taking care of the
required device-side unmapping.

The release path uses PUNCH_HOLE on the hugetlbfs file for 2M hugetlb
pages.

This is the case where the current conservative range expansion becomes
unnecessarily broad.

Does this patch look reasonable to you?

The updated patch looks like this:

---
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7611a84..1e24b8d 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -921,6 +921,9 @@ static struct inode *hugetlbfs_get_inode(struct=20
super_block *sb,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0simple_inode_init_ts(inode);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->resv_map =3D resv_map;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->seals =3D F_SEAL_SEAL;
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info->pmd_sharing_seen =3D false;
+#endif
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (mode & S_IFMT) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0init_special_inode(inode, =
mode, dev);
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 16c4c4c..8f1f899 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -509,6 +509,9 @@ struct hugetlbfs_inode_info {
 =C2=A0 =C2=A0 =C2=A0struct inode vfs_inode;
 =C2=A0 =C2=A0 =C2=A0struct resv_map *resv_map;
 =C2=A0 =C2=A0 =C2=A0unsigned int seals;
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+=C2=A0 =C2=A0 bool pmd_sharing_seen;
+#endif
 =C2=A0};

 =C2=A0static inline struct hugetlbfs_inode_info *HUGETLBFS_I(struct inode=
=20
*inode)
@@ -516,6 +519,27 @@ static inline struct hugetlbfs_inode_info=20
*HUGETLBFS_I(struct inode *inode)
 =C2=A0 =C2=A0 =C2=A0return container_of(inode, struct hugetlbfs_inode_info=
, vfs_inode);
 =C2=A0}

+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
+static inline void hugetlbfs_set_pmd_sharing_seen(struct inode *inode)
+{
+=C2=A0 =C2=A0 HUGETLBFS_I(inode)->pmd_sharing_seen =3D true;
+}
+
+static inline bool hugetlbfs_pmd_sharing_seen(struct inode *inode)
+{
+=C2=A0 =C2=A0 return HUGETLBFS_I(inode)->pmd_sharing_seen;
+}
+#else
+static inline void hugetlbfs_set_pmd_sharing_seen(struct inode *inode)
+{
+}
+
+static inline bool hugetlbfs_pmd_sharing_seen(struct inode *inode)
+{
+=C2=A0 =C2=A0 return false;
+}
+#endif
+
 =C2=A0extern const struct vm_operations_struct hugetlb_vm_ops;
 =C2=A0struct file *hugetlb_file_setup(const char *name, size_t size,=20
vma_flags_t acct,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int creat_fl=
ags, int page_size_log);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7857728..e370960 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5359,10 +5359,12 @@ void __hugetlb_zap_begin(struct vm_area_struct *vma=
,
 =C2=A0 =C2=A0 =C2=A0if (!vma->vm_file)=C2=A0 =C2=A0 /* hugetlbfs_file_mmap=
 error */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;

-=C2=A0 =C2=A0 adjust_range_if_pmd_sharing_possible(vma, start, end);
 =C2=A0 =C2=A0 =C2=A0hugetlb_vma_lock_write(vma);
-=C2=A0 =C2=A0 if (vma->vm_file)
+=C2=A0 =C2=A0 if (vma->vm_file) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i_mmap_lock_write(vma->vm_file->f_mappin=
g);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hugetlbfs_pmd_sharing_seen(file_inode(vma-=
>vm_file)))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjust_range_if_pmd_sharing_poss=
ible(vma, start, end);
+=C2=A0 =C2=A0 }
 =C2=A0}

 =C2=A0void __hugetlb_zap_end(struct vm_area_struct *vma,
@@ -5401,7 +5403,9 @@ void unmap_hugepage_range(struct vm_area_struct=20
*vma, unsigned long start,

 =C2=A0 =C2=A0 =C2=A0mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, v=
ma->vm_mm,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start, end);
-=C2=A0 =C2=A0 adjust_range_if_pmd_sharing_possible(vma, &range.start, &ran=
ge.end);
+=C2=A0 =C2=A0 if (hugetlbfs_pmd_sharing_seen(file_inode(vma->vm_file)))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 adjust_range_if_pmd_sharing_possible(vma, &ran=
ge.start,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&range.end);
 =C2=A0 =C2=A0 =C2=A0mmu_notifier_invalidate_range_start(&range);
 =C2=A0 =C2=A0 =C2=A0tlb_gather_mmu(&tlb, vma->vm_mm);

@@ -7004,6 +7008,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct=20
vm_area_struct *vma,
 =C2=A0 =C2=A0 =C2=A0if (pud_none(*pud)) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pud_populate(mm, pud,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pmd_t *)((u=
nsigned long)spte & PAGE_MASK));
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hugetlbfs_set_pmd_sharing_seen(mapping->host);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mm_inc_nr_pmds(mm);
 =C2=A0 =C2=A0 =C2=A0} else {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptdesc_pmd_pts_dec(virt_to_ptdesc(spte))=
;
--=20


Thanks,
Zhe

>
