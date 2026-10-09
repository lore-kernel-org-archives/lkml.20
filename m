Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004104F3ED2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569122; cv=none; b=DOQzp1TakUS9bdWDBMpwD3tzycYeWSTOx6VvFobp0tC9V5r9emFZeu8m7iUUx5N/rqWWOnXOXUc4ws0FrqSwcrnYq+iabCeg7USBKtKsanC0V/+9RTkp12oy8mT+ExNmGXfdAPilEPffLU85c6oDdZrjTSoRd0m5NWMNDF/QKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569122; c=relaxed/simple;
	bh=si334WCVwj1yQ+s6d1lKducAmYLBcj1iekwRL1qoJKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8LRKhSe/3vbNk3/rLZoVKdtyO3HCv6pV2y5i/ydpLCTSHcsIUG1p/V8hnkK+/pYLiX7seM/6D9vkk62Mt1wFWdg7yslRmX9vIBoRntY9D8btzW6EGvACQxMYZ6IcllqSYJ+55wyTPaL8Eiv2LpZmSpXGBpqC00ixzcTRiTfVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3qLqNhV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3qLqNhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555DD1F000FF;
	Fri,  9 Oct 2026 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791569120;
	bh=hpQ3dp10EQMwRCwD3eHi09l9cQIxAnlp034y5giT03s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=L3qLqNhVtAqtRoH4KUKA4HjzDT34jcPjxFQtiO1J8Nz81ipPOTkmO7dW5K25SPdWj
	 sxkVyQLqCCRKN1anhjgC3Xg3gLLqyYnweHUAgNKkgIt86WoenigAEg8fz4nIIGDKll
	 o8E7rTbSWXn9ksG7T+4KM+oB+h4hZMyJUqptZrQcA70sdLLPiuLLkRnP3YwTEh8A/B
	 QvuEjRjT3Y2XSofKnX0MzECCYwPHhCkW7ymdx43djTrsdE0la4fqB5kEP6FLP1UZ9Y
	 yHwY+3/cIY3HqzeqbYe+nF/+sanQcHq3pNQfMjHPYFajDavk5rX5rlwbQB0M65KmnC
	 UqcDlhX7aQgRA==
Message-ID: <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org>
Date: Fri, 9 Oct 2026 20:05:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, akpm@linux-foundation.org,
 muchun.song@linux.dev, osalvador@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260930064308.58159-1-lizhe.67@bytedance.com>
 <arzVaC2IYkqSb0_U@gmail.com>
 <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com>
 <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org> <asjVUa6XBZ8ti-0_@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <asjVUa6XBZ8ti-0_@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/26 13:52, Lorenzo Stoakes (ARM) wrote:
> On Mon, Oct 05, 2026 at 11:25:01AM +0200, David Hildenbrand (Arm) wrote:
>>> David mentioned that Oscar was planning to send a proper fix for this
>>> issue, so I will wait for that patch instead of moving forward with this
>>> trylock fallback approach.
>> @Lorenzo, if Oscar is too busy, I guess we can paste the overall idea for the
>> fix here as well (publicly)?
> 
> Yeah I don't see why not! I don't think there's anything that needs to be
> private here.

Li, see below, can you work with the below?


----8<----
From 9e1c0676ea6c9cbcabf91cd8badf81a9d88fd3ef Mon Sep 17 00:00:00 2001
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 29 Jul 2026 18:33:08 +0100
Subject: [PATCH] fix

---
 mm/hugetlb.c | 103 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 79 insertions(+), 24 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index e93c4d2456aa..88ff2c4ad483 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5077,6 +5077,79 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
 	spin_unlock(dst_ptl);
 }

+/* Returns last address processed */
+static unsigned long prealloc_or_move_page_tables(struct vm_area_struct *vma,
+		struct vm_area_struct *new_vma, unsigned long old_addr,
+		unsigned long new_addr, unsigned long len, unsigned long sz,
+		unsigned long last_addr_mask, struct mmu_gather *tlb,
+		bool is_prealloc)
+{
+	unsigned long old_end = old_addr + len;
+	struct hstate *h = hstate_vma(vma);
+	struct mm_struct *mm = vma->vm_mm;
+	pte_t *src_pte, *dst_pte;
+
+	hugetlb_vma_assert_locked(vma);
+
+	for (; old_addr < old_end; old_addr += sz, new_addr += sz) {
+		src_pte = hugetlb_walk(vma, old_addr, sz);
+		if (!src_pte) {
+			old_addr |= last_addr_mask;
+			new_addr |= last_addr_mask;
+			continue;
+		}
+		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
+			continue;
+
+		if (is_prealloc) {
+			if (!huge_pte_alloc(mm, new_vma, new_addr, sz))
+				break;
+			continue;
+		}
+
+		if (huge_pmd_unshare(tlb, vma, old_addr, src_pte)) {
+			old_addr |= last_addr_mask;
+			new_addr |= last_addr_mask;
+			continue;
+		}
+
+		dst_pte = hugetlb_walk(new_vma, new_addr, sz);
+		if (!dst_pte)
+			break;
+
+		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte, sz);
+		tlb_remove_huge_tlb_entry(h, tlb, src_pte, old_addr);
+	}
+
+	return old_addr;
+}
+
+/* Returns true if preallocation succeeded across range, otherwise false. */
+static bool prealloc_hugetlb_page_tables(struct vm_area_struct *vma,
+		struct vm_area_struct *new_vma, unsigned long old_addr,
+		unsigned long new_addr, unsigned long len, unsigned long sz,
+		unsigned long last_addr_mask)
+{
+	unsigned long old_end = old_addr + len;
+	unsigned long addr_end;
+
+	addr_end = prealloc_or_move_page_tables(vma, new_vma, old_addr, new_addr,
+			len, sz, last_addr_mask, NULL, /*is_prealloc=*/true);
+
+	return addr_end >= old_end;
+}
+
+/* Returns last processed address. */
+static unsigned long __move_hugetlb_page_tables(struct vm_area_struct *vma,
+		struct vm_area_struct *new_vma, unsigned long old_addr,
+		unsigned long new_addr, unsigned long len, unsigned long sz,
+		unsigned long last_addr_mask, struct mmu_gather *tlb)
+{
+	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
+	return prealloc_or_move_page_tables(vma, new_vma, old_addr, new_addr,
+			len, sz, last_addr_mask, tlb, /*is_prealloc=*/false);
+}
+
 int move_hugetlb_page_tables(struct vm_area_struct *vma,
 			     struct vm_area_struct *new_vma,
 			     unsigned long old_addr, unsigned long new_addr,
@@ -5088,9 +5161,9 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long old_end = old_addr + len;
 	unsigned long last_addr_mask;
-	pte_t *src_pte, *dst_pte;
 	struct mmu_notifier_range range;
 	struct mmu_gather tlb;
+	bool preallocated;

 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, old_addr,
 				old_end);
@@ -5106,30 +5179,12 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	last_addr_mask = hugetlb_mask_last_page(h);
 	/* Prevent race with file truncation */
 	hugetlb_vma_lock_write(vma);
+	preallocated = prealloc_hugetlb_page_tables(vma, new_vma, old_addr,
+			new_addr, len, sz, last_addr_mask);
 	i_mmap_lock_write(mapping);
-	for (; old_addr < old_end; old_addr += sz, new_addr += sz) {
-		src_pte = hugetlb_walk(vma, old_addr, sz);
-		if (!src_pte) {
-			old_addr |= last_addr_mask;
-			new_addr |= last_addr_mask;
-			continue;
-		}
-		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
-			continue;
-
-		if (huge_pmd_unshare(&tlb, vma, old_addr, src_pte)) {
-			old_addr |= last_addr_mask;
-			new_addr |= last_addr_mask;
-			continue;
-		}
-
-		dst_pte = huge_pte_alloc(mm, new_vma, new_addr, sz);
-		if (!dst_pte)
-			break;
-
-		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte, sz);
-		tlb_remove_huge_tlb_entry(h, &tlb, src_pte, old_addr);
-	}
+	if (preallocated)
+		old_addr = __move_hugetlb_page_tables(vma, new_vma, old_addr,
+			new_addr, len, sz, last_addr_mask, &tlb);

 	tlb_flush_mmu_tlbonly(&tlb);
 	huge_pmd_unshare_flush(&tlb, vma);
--
2.55.0

-- 
Cheers,

David
