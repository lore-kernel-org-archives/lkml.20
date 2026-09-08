Received: from sg-3-111.ptr.tlmpb.com (sg-3-111.ptr.tlmpb.com [101.45.255.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5693E38E100
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851413; cv=none; b=UoBKSqwos4XRFWZgIKw7Ujz+/WWtloI+RgmYPLKkk2noTDNgdGG1jGBebHw9tirNtqAF1TX/qN4/u1BtkEyH4vlskLhBRa3f1qHxcdBgQClRd6FyOQYJhUtvum7vNqc8Fw99at8PEwvLeeUdVIneeE1gP+X7HRCISzutvGPqMa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851413; c=relaxed/simple;
	bh=gMcPkkrsYFrDaf7KtGiUZKZ4igekg8qNltXw9MzJMyk=;
	h=References:Cc:From:Subject:In-Reply-To:To:Date:Content-Type:
	 Message-Id:Mime-Version; b=KyFU/sQWg67w1LNAbWHYJWfFJRRKQgLPGDLWRgUzxnLcAMLYa0aqFphDYy6SnTtG70NuqMUoYteHeULsWOiBV/3G5sPe5LYUtw9k7Kc2jPn3lKt+IXivzNjVmHtybAv74YEQKTHMVkLWqbaeGHiX1VrvyS2WKRvNHcEh/YFlMqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ESgXK0oL; arc=none smtp.client-ip=101.45.255.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ESgXK0oL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788851364; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=gMcPkkrsYFrDaf7KtGiUZKZ4igekg8qNltXw9MzJMyk=;
 b=ESgXK0oLUWANrK/Bcrbi66n7tfJXymtEu4XyoFluXLU4Q1JRGst+BTf1cna9B/OJBvAKQ7
 gT06CW/P1tH3kDbETPuP4N087LjFjR6nnhE7dVM7KgU+y6rY0XUDhm0lUy1e/rXu3FbRlC
 xggPP4P9kvNXxaNxd6LDG9XuWNQ3WSK9bDvhed9KQWpkGhdzH99P7cAZWi0AvTJIvWn1pa
 4fnUBGi2a2R0++dNyycYleJQhDT/8zTlzlOvRNsoADYezX9QIo0PCzuKrRNTiEL7Gh76Ni
 Q7j1VhK1sijPCp2SHxTIwj9jFCgDO9cZ02WjS0vtiz4Wwooc4++I+You/OFbyg==
User-Agent: Mozilla Thunderbird
References: <20260831091023.66581-1-lizhe.67@bytedance.com> <20260831173220.72ab28190a44a305dacf4d04@linux-foundation.org> <47a6817e-e98e-4a00-8e2c-6a66d15ddb37@kernel.org>
Cc: <muchun.song@linux.dev>, <osalvador@suse.de>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, <aiqi.i7@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <47a6817e-e98e-4a00-8e2c-6a66d15ddb37@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Andrew Morton" <akpm@linux-foundation.org>
Date: Tue, 8 Sep 2026 15:09:04 +0800
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26a9fb4a2+32e61f+vger.kernel.org+lizhe.67@bytedance.com>
Message-Id: <874e7793-877a-40a5-97ce-11dd5b9ee9ba@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/7/26 11:29 PM, David Hildenbrand (Arm) wrote:
> On 9/1/26 02:32, Andrew Morton wrote:
>> On Mon, 31 Aug 2026 17:10:23 +0800 "Li Zhe" <lizhe.67@bytedance.com> wro=
te:
>>
>>> Hugetlb currently expands MMU notifier ranges to PUD boundaries wheneve=
r
>>> PMD sharing is possible. That is only needed when huge_pmd_unshare()
>>> actually detaches a shared PMD page table, because clearing the PUD
>>> invalidates the whole PUD-sized virtual address range.
>>>
>>> For hugetlbfs hole punch and MADV_DONTNEED, a shared mapping can pass
>>> the "PMD sharing is possible" range test in function
>>> adjust_range_if_pmd_sharing_possible() even when the PMD table covering
>>> the target 2M page is not shared. KVM then receives a 1G invalidation f=
or
>>> a 2M operation and zaps unrelated secondary mappings, so the guest has =
to
>>> fault them back in.
>>>
>>> Fix this by using the existing cheap "sharing possible" test only as a
>>> gate, then inspect the candidate PMD tables under the locks held by the
>>> hugetlb unmap paths. The notifier is expanded only for PUDs whose PMD
>>> table is actually shared, while the other callers keep the existing
>>> conservative expansion.
>> Thanks.
>>
>>> On a Redis-in-VM workload that punches cold 2M hugetlb pages, this
>>> patch improves P99 QPS stability while punching pages, reducing the QPS
>>> degradation ratio from 7.09% to 1.45%.
>> So a modest performance improvement?
> Is that worth the complexity, though?


That is a fair concern.

I tried to simplify the approach. Instead of computing the exact PUD
sub-ranges that contain shared PMD tables, this version keeps the
existing adjust_range_if_pmd_sharing_possible() logic unchanged and only
adds an actual shared-PMD check as a gate before it.

So the behavior becomes:

 =C2=A0 - if no shared PMD table is found, keep the notifier range unchange=
d;
 =C2=A0 - if any shared PMD table is found, fall back to the existing
 =C2=A0 =C2=A0 conservative PUD-sized expansion.

This should still avoid the unnecessary 1G KVM invalidation for the
common unshared-PMD case, while keeping the range expansion policy
unchanged when a shared PMD is present.

The resulting diff would look like this:

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 816dde7..7a61fc3 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5355,10 +5357,12 @@ void __hugetlb_zap_begin(struct vm_area_struct *vma=
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (range_has_shared_pmd(vma, *start, *end))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjust_range_if_pmd_sharing_poss=
ible(vma, start, end);
+=C2=A0 =C2=A0 }
 =C2=A0}

 =C2=A0void __hugetlb_zap_end(struct vm_area_struct *vma,
@@ -5397,7 +5401,9 @@ void unmap_hugepage_range(struct vm_area_struct=20
*vma, unsigned long start,

 =C2=A0 =C2=A0 =C2=A0mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, v=
ma->vm_mm,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start, end);
-=C2=A0 =C2=A0 adjust_range_if_pmd_sharing_possible(vma, &range.start, &ran=
ge.end);
+=C2=A0 =C2=A0 if (range_has_shared_pmd(vma, range.start, range.end))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 adjust_range_if_pmd_sharing_possible(vma, &ran=
ge.start,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&range.end);
 =C2=A0 =C2=A0 =C2=A0mmu_notifier_invalidate_range_start(&range);
 =C2=A0 =C2=A0 =C2=A0tlb_gather_mmu(&tlb, vma->vm_mm);

@@ -6958,6 +6964,52 @@ void adjust_range_if_pmd_sharing_possible(struct=20
vm_area_struct *vma,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*end =3D ALIGN(*end, PUD_SIZE);
 =C2=A0}

+static bool range_has_shared_pmd(struct vm_area_struct *vma,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned lon=
g start, unsigned long end)
+{
+=C2=A0 =C2=A0 unsigned long v_start =3D ALIGN(vma->vm_start, PUD_SIZE);
+=C2=A0 =C2=A0 unsigned long v_end =3D ALIGN_DOWN(vma->vm_end, PUD_SIZE);
+=C2=A0 =C2=A0 struct hstate *h =3D hstate_vma(vma);
+=C2=A0 =C2=A0 struct mm_struct *mm =3D vma->vm_mm;
+=C2=A0 =C2=A0 unsigned long address;
+
+=C2=A0 =C2=A0 if (huge_page_size(h) !=3D PMD_SIZE)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
+
+=C2=A0 =C2=A0 /*
+=C2=A0 =C2=A0 =C2=A0* First apply the same cheap test as
+=C2=A0 =C2=A0 =C2=A0* adjust_range_if_pmd_sharing_possible(). Only the PUD=
-aligned
+=C2=A0 =C2=A0 =C2=A0* intersection can contain shared PMD tables.
+=C2=A0 =C2=A0 =C2=A0*/
+=C2=A0 =C2=A0 if (!(vma->vm_flags & VM_MAYSHARE) || !(v_end > v_start) ||
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 end <=3D v_start || start >=3D v_end)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
+
+=C2=A0 =C2=A0 start =3D max(ALIGN_DOWN(start, PUD_SIZE), v_start);
+=C2=A0 =C2=A0 end =3D min(ALIGN(end, PUD_SIZE), v_end);
+
+=C2=A0 =C2=A0 hugetlb_vma_assert_locked(vma);
+=C2=A0 =C2=A0 i_mmap_assert_write_locked(vma->vm_file->f_mapping);
+
+=C2=A0 =C2=A0 for (address =3D start; address < end; address +=3D PUD_SIZE=
) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pte_t *ptep;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool shared;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptep =3D hugetlb_walk(vma, address, PMD_SIZE);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptep)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(huge_pte_lockptr(h, mm, ptep));
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shared =3D ptdesc_pmd_is_shared(virt_to_ptdesc=
(ptep));
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(huge_pte_lockptr(h, mm, ptep));
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shared)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 return false;
+}
+
 =C2=A0/*
 =C2=A0 * Search for a shareable pmd page for hugetlb. In any case calls=20
pmd_alloc()
 =C2=A0 * and returns the corresponding pte. While this is not necessary fo=
r the
--=20


Does this look like a more reasonable tradeoff?

Thanks,
Zhe

>
