Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99711488232
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092917; cv=none; b=oY9VxGwDXRKJXw5Hwhhd7G29H3jY70OSDID9aijNwNnNWpuHeluauMjAdS70Pab4VYlcOkx/OAY0aynsCs9667H5NpMlcM2CwFeQsYlOSVFMI8nBmGiM4C5lg6puDwGxvhCrfh6k3d7Xu1k58B7k0x4d30Mk1kgAwyYq0rYrZ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092917; c=relaxed/simple;
	bh=Co4Vhlex1cearwyoN5hiJYdG4oNfpCadCmZflk7CjbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITpGxGmCDlOiIDyrh0K7EnIGfq2A3WQWVvzQpq/RrakjMRqDgPgj5nVIw/7uM+aX5B1CFHeIPPSkzSBEBXnogVE1qE63EmR4hME/z2HtNPojHPKxjWEMbgiMxq5kronq79z7Xzr9flEFg6/KF4Vgh5nQj/GNLjOU9V+FWNSzglU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnrznvjX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnrznvjX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381CD1F000C4;
	Thu, 15 Oct 2026 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792092916;
	bh=cNCoTlXmNaYGky/I7Njc3h18v97tfn4C40H/ckxsFzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mnrznvjXTItNEN9jXEcqOhFQc/oMksjtTPK18VjDU0qZiOL5KEIs3qwrDLewQa26D
	 MulexaulrGV0kwy0/owcmF34oAYsM0SUFMIUsDq96hQfNzP8RAuH0CrAFqsT/OjpQ6
	 iqDepjQIsJ6YDDRKNQpAS6iv7XH/2/3YVl5icFXuWMt9AAUHCve3OJJ/nga/MxIaaY
	 QiB6LF+aynknXuht44UCiczdZeRZyEoSax9HZldgjJj+GI80HtNtYt/rmrR3CmDXXT
	 X3F6bkyLjwMqqQe83kH5Ol+Aa9+3z8U+PPX5hAoquZmD93Fedv6y8pgwP7F6C7yx+f
	 jNxT5CB7RL8tQ==
Message-ID: <33e26c40-45f4-44a4-bfea-1ae7ff74e4cf@kernel.org>
Date: Thu, 15 Oct 2026 21:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
To: Li Zhe <lizhe.67@bytedance.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 akpm@linux-foundation.org, muchun.song@linux.dev, osalvador@suse.de,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260930064308.58159-1-lizhe.67@bytedance.com>
 <arzVaC2IYkqSb0_U@gmail.com>
 <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com>
 <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org> <asjVUa6XBZ8ti-0_@gremlin>
 <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org>
 <86de1ee5-be14-4123-b372-b4691cea8e67@bytedance.com>
 <fedff1b6-0522-4398-a0d4-d4111a570159@kernel.org>
 <98d4a305-51e4-4374-b09d-7d251dbf166d@bytedance.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <98d4a305-51e4-4374-b09d-7d251dbf166d@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/15/26 04:40, Li Zhe wrote:
> On 10/14/26 6:52 PM, David Hildenbrand (Arm) wrote:
>> On 10/14/26 08:39, Li Zhe wrote:
>>> Hi David,
>>>
>>> I thought more about the case where the destination page table was
>>> preallocated as a shared PMD.
>>>
>>> I do not think the current move_huge_pte() handles that case very well. The
>>> reason is that it assumes the destination PTE is not part of a shared PMD
>>> page table: it clears the source PTE and then installs that PTE into the
>>> destination. That works when the destination PMD page table is not shared,
>>> because the source removal and destination install have a net-zero effect on
>>> rmap and hugetlb accounting.
>>>
>>> If the destination PTE belongs to a shared PMD, that assumption does not
>>> hold. In that case, I think we should leave the shared destination page
>>> table untouched and treat the operation as a source-side unmap. Otherwise
>>> move_huge_pte() either writes through a shared page table or skips the
>>> source-side unmap accounting. That can make the rmap, hugetlb count and
>>> folio release handling inconsistent with the actual PTE update.
>>>
>>> So I think the change should be roughly:
>> IIUC, what you are saying is:
>>
>> A) If the source table is shared, unshare it.
>>
>> b) If the destination table is shared, there is nothing to do.
>>
>> ?
> 
> Yes, mostly.
> 
> If the source PMD table is shared, huge_pmd_unshare() already drops that
> shared PMD table from the source side and we skip moving individual PTEs
> from that table.
> 
> If the source PTE is not in a shared PMD table, but the destination PTE
> is in a shared PMD table, then I think we should not install the source
> PTE into the destination page table. The destination mapping is already
> represented by the shared PMD page table.
> 
> However, move_huge_pte() still has to handle the source side as an
> unmap: clear the source PTE, record the TLB removal, and update the
> source-side hugetlb accounting/rmap state. Otherwise the source mapping
> is removed from the page table without the matching source-side
> accounting. I was able to reproduce this as:
> 
>    BUG: Bad page cache in process init
>    page dumped because: still mapped when deleted
> 
> when keeping the preallocation approach but dropping the special handling
> for a destination PMD-shared page table.
> 
> So my current understanding is:
> 
>    1. source PMD shared: unshare it and skip the PMD-sized range;
>    2. destination PMD shared: do not modify the destination PTE, but
>       still clear and account the source PTE removal.
Yes, I think this makes a lot of sense. Given that this issue has been
in the works for more than one month without a fix I tried to see how to do
it cleaner than your version:

This is what I came up with quickly, using existing helpers by refactoring them.

Is this what you had in mind? I didn't actually test this yet. If it makes sense,
could you test it and possibly clean it up further?

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index fb51f7d02cebf..0c3aebea7a2f8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -124,6 +124,9 @@ static int __huge_pmd_unshare(struct mmu_gather *tlb,
 		bool check_locks);
 static void hugetlb_unshare_pmds(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end, bool take_locks);
+static void hugetlb_unmap_range(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, unsigned long start, unsigned long end,
+		struct folio *folio, zap_flags_t zap_flags);
 static struct resv_map *vma_resv_map(struct vm_area_struct *vma);
 
 static inline bool subpool_is_free(struct hugepage_subpool *spool)
@@ -5172,6 +5175,8 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	for (; old_addr < old_end; old_addr += sz, new_addr += sz) {
 		const unsigned long offset_to_last_entry =
 			(old_addr | last_addr_mask) - old_addr;
+		const unsigned long offset_to_last_dst_entry =
+			(new_addr | last_addr_mask) - new_addr;
 
 		src_pte = hugetlb_walk(vma, old_addr, sz);
 		if (!src_pte) {
@@ -5188,6 +5193,23 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 			continue;
 		}
 
+		/*
+		 * Don't try to install a shared PMD table and move stuff into
+		 * them. Instead, just zap the source PMDs and share the PMD
+		 * table later lazily.
+		 */
+		if (sz == PMD_SIZE && want_pmd_share(new_vma, new_addr)) {
+			const unsigned long unmap_size = min(old_end - old_addr,
+							     offset_to_last_dst_entry + sz);
+
+			hugetlb_unmap_range(&tlb, vma, old_addr,
+					    old_addr + unmap_size, NULL,
+					    ZAP_FLAG_DROP_MARKER);
+			old_addr += unmap_size - sz;
+			new_addr += unmap_size - sz;
+			continue;
+		}
+
 		dst_pte = huge_pte_alloc(mm, new_vma, new_addr, sz);
 		if (!dst_pte)
 			break;
@@ -5207,9 +5229,9 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	return len + old_addr - old_end;
 }
 
-void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
-			    unsigned long start, unsigned long end,
-			    struct folio *folio, zap_flags_t zap_flags)
+static void hugetlb_unmap_range(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, unsigned long start, unsigned long end,
+		struct folio *folio, zap_flags_t zap_flags)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	const bool folio_provided = !!folio;
@@ -5227,13 +5249,6 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	BUG_ON(start & ~huge_page_mask(h));
 	BUG_ON(end & ~huge_page_mask(h));
 
-	/*
-	 * This is a hugetlb vma, all the pte entries should point
-	 * to huge page.
-	 */
-	tlb_change_page_size(tlb, sz);
-	tlb_start_vma(tlb, vma);
-
 	last_addr_mask = hugetlb_mask_last_page(h);
 	address = start;
 	for (; address < end; address += sz) {
@@ -5362,6 +5377,15 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		if (folio_provided)
 			break;
 	}
+}
+
+void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
+			    unsigned long start, unsigned long end,
+			    struct folio *folio, zap_flags_t zap_flags)
+{
+	tlb_change_page_size(tlb, huge_page_size(hstate_vma(vma)));
+	tlb_start_vma(tlb, vma);
+	hugetlb_unmap_range(tlb, vma, start, end, folio, zap_flags);
 	tlb_end_vma(tlb, vma);
 
 	huge_pmd_unshare_flush(tlb, vma);
-- 
2.43.0



-- 
Cheers,

David
