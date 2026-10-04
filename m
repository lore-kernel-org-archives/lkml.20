Received: from mta1.migadu.com (out-158.mta1.migadu.com [95.215.58.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403FF15746F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791101968; cv=none; b=hR/9KIAGAOC9G18lyLAH0rwbHfdZJDpIYgrc8607PAnlFlc46DjJHa8dCPlM2iIZeli4MGwCBIhhKmEbZ7bciEA56spKsyuK4ZgKhZ6Sn/Hw/znrMK4p4XzoC9SAKBdusfeyTG8Wu3j1AhHNetXvrnujBqlGiOe8X9AkWsaZaaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791101968; c=relaxed/simple;
	bh=N1P1P3jMKJo9ggmNihU/EA7zpJLYlMm+cg9cdHhLxxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/c91nXwXjnVLhVM2oKN6eb31YDGlHZVJCBqOirMTqV9yqtn09J/Hs3rfTO43/tUU+xHrpmpPchVs9XbkEXRpjZ40JAEsLA+6EiRih6OFhkFuabZfRCaAv82c6ino0a+i0hW9joNoGSGc89VQ2EXCySch5saSDlUTgtbC5kv7Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o2rBWC/S; arc=none smtp.client-ip=95.215.58.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o2rBWC/S"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=N1P1P3jMKJo9ggmNihU/EA7zpJLYlMm+cg9cdHhLxxg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791101963; v=1; x=1791706763;
 b=o2rBWC/SDVjK7JddP7bOJWlREDAr3IkA4FsCyfKM73m/XoBLGBSgEZqJEVwliuhxaLgKNE0G
 GXZFzmMeXAN0/em2cjxGkcChj5bMuI0BU/VBYZig02vHSzEyZCGY37lI1OhqlcI6knhWnAppRUE
 kN7HAmpyWkh9/6BBMVpDSPoo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e992c55305e9727b;
	Sun, 04 Oct 2026 08:19:22 +0000
X-Mizu-Trace-ID: e992c55305e9727b
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: usama.arif@linux.dev
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	baoquan.he@linux.dev,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	liam@infradead.org,
	ryan.roberts@arm.com,
	vbabka@kernel.org,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 26/30] mm: handle PMD swap entries in UFFDIO_MOVE
Date: Sun,  4 Oct 2026 16:19:17 +0800
Message-ID: <20261004081917.20111-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261002095503.3585565-27-usama.arif@linux.dev>
References: <20261002095503.3585565-27-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey Usama,

On Fri, Oct 02, 2026 at 02:52:40AM -0700, Usama Arif wrote:
[...]
>+static int move_swap_pmd(struct mm_struct *mm, struct vm_area_struct *dst_vma,
>+			 unsigned long dst_addr, unsigned long src_addr,
>+			 pmd_t *dst_pmd, pmd_t *src_pmd,
>+			 pmd_t orig_dst_pmd, pmd_t orig_src_pmd,
>+			 spinlock_t *dst_ptl, spinlock_t *src_ptl,
>+			 struct folio *src_folio, swp_entry_t entry)
>+{
[...]
>+
>+	moved_pmd = pmdp_huge_get_and_clear(mm, src_addr, src_pmd);
>+	if (pgtable_supports_soft_dirty())
>+		moved_pmd = pmd_swp_mksoft_dirty(moved_pmd);

Shouldn't we clear the source UFFD marker here?

	moved_pmd = pmd_swp_clear_uffd(moved_pmd);

just like move_swap_pte(), no?

>+	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
>+	if (userfaultfd_rwp(dst_vma))
>+		moved_pmd = pmd_swp_mkuffd(moved_pmd);
>+	set_pmd_at(mm, dst_addr, dst_pmd, moved_pmd);

static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
			 unsigned long dst_addr, unsigned long src_addr,
			 pte_t *dst_pte, pte_t *src_pte,
			 pte_t orig_dst_pte, pte_t orig_src_pte,
			 pmd_t *dst_pmd, pmd_t dst_pmdval,
			 spinlock_t *dst_ptl, spinlock_t *src_ptl,
			 struct folio *src_folio,
			 struct swap_info_struct *si, swp_entry_t entry)
{
...
	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
...
	orig_src_pte = pte_swp_clear_uffd(orig_src_pte);
	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
	if (userfaultfd_rwp(dst_vma))
		orig_src_pte = pte_swp_mkuffd(orig_src_pte);
	set_pte_at(mm, dst_addr, dst_pte, orig_src_pte);
...
}

Suppose the source is an exclusive swap PMD carrying a UFFD-WP marker, and
the destination is an empty hole registered for synchronous UFFD-WP without
RWP. We haven't write-protected the destination, but a successful whole-PMD
MOVE carries the source's UFFD-WP marker into it.

On swap-in, that marker is restored in the present PMD, leaving it
write-protected. The write fault then reaches
handle_userfault(vmf, VM_UFFD_WP), even though we never write-protected
the destination ...

That would be quite a surprise for userspace, and could leave the writer
stuck if the unexpected WP event goes unhandled :)

vm_fault_t do_huge_pmd_swap_page(struct vm_fault *vmf)
{
	struct vm_area_struct *vma = vmf->vma;
...
	bool exclusive, stable_writes, rwp_restore = false;
	bool write = vmf->flags & FAULT_FLAG_WRITE;
...
	pmd = folio_mk_pmd(folio, vma->vm_page_prot);
...
	if (pmd_swp_uffd(vmf->orig_pmd))
		pmd = pmd_mkuffd(pmd);
	if (pmd_swp_uffd(vmf->orig_pmd) && userfaultfd_rwp(vma)) {
		pmd = pmd_modify(pmd, PAGE_NONE);
		rwp_restore = true;
	}
...
	if (exclusive) {
		if (!rwp_restore && (vma->vm_flags & VM_WRITE) &&
		    !userfaultfd_huge_pmd_wp(vma, pmd) &&
		    !pmd_needs_soft_dirty_wp(vma, pmd)) {
			pmd = pmd_mkwrite(pmd, vma);
			if (write)
				pmd = pmd_mkdirty(pmd);
		}
		rmap_flags |= RMAP_EXCLUSIVE;
	}
...
	vmf->orig_pmd = pmd;
...
	if (write && !pmd_write(pmd) && !rwp_restore) {
		vm_fault_t wp_ret = wp_huge_pmd(vmf);
...
	}
...
}

vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
{
	struct vm_area_struct *vma = vmf->vma;
	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
...
	if (vma_is_anonymous(vma)) {
		if (likely(!unshare) &&
		    userfaultfd_huge_pmd_wp(vma, vmf->orig_pmd)) {
			if (userfaultfd_wp_async(vmf->vma))
				goto split;
			return handle_userfault(vmf, VM_UFFD_WP);
		}
		return do_huge_pmd_wp_page(vmf);
	}
...
}

So, clearing the source UFFD-WP marker before the destination RWP check
would match the PTE helper and keep the RWP re-arm :)

Am I missing something?

>+	src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
>+	pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
>+
>+	double_pt_unlock(dst_ptl, src_ptl);
>+	return 0;
>+}
>+#endif /* CONFIG_THP_SWAP */
>+

[...]

Cheers, Lance
