Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719491;
	b=P0h5mLXphiecW3GPI8shXT6mp6nqU23+lNgREsK0PzqBbAm3mFq/SmyYdM7nGgExovn1
	 7wU/WSDOyaCsnsSOkeQVGMjG84EWoXj5NajRflFaQbrNnvb/R4grqa5BJD6mIn33GPJiw
	 a2w+n+yw7oJTUB/xrm6rCSOG/5nNTlE9DjeQIlft4eiSdrFbeIR1qMk8uf9tpIhwIY9nU
	 SUZxS8F2NVCk37ErCMmcYppg/v2Mtnoja+65Gu5ikEc/oCSlaNByGcPzPrWa7VJtLYbxq
	 dX6uqi478rjyy+cKq444bJJfkEqFeFtwZQ5ZDi3n+cTQJj3fIZhwrjhQhZ0uAsf82Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719491;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NhYtZrkm1A2y5gfXb/MOXR9T1Dxa9gZMQbF7Vezns8s=;
	b=B1kwiEFTvQ6XkBa86Ot9mWybv6XK/AWoKv1BpC4DzdC26KkGlXa3JQ588y4aNgUx3l7V
	 VawpNOeCMPmZUU01asxs6d7/Q/sbg6uCEtelAvmCUyCnED6BmfMfqTKE4kBXgUV5285gu
	 L184kyRTKE0PHDdqECKPfkpuqWMYw4wVGuYkXtVWxgncQc6ZsOteS/REAUBwFkyFcuzFy
	 w+eybErYT3WjhaaD6HoAyhLumBBjeZQXt7uKHm1umbNLUmBa6+Bdgvh2K5NdDeXCBx7Oh
	 LYgnwMSw1gWyws+emPR7VTSOBB3qXLKTqoQJe3JD+Cw6+BqkGEIxPgw/TmphOQ0S/1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oDOWjPdA;
	arc=none smtp.remote-ip=91.218.175.91
Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C930606A78E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C930606A78E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oDOWjPdA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uT7L6pAMqKZY5SqEVouIfWTPNvq3GQ1tPvyDPXZOklY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793719488; v=1; x=1794324288;
 b=oDOWjPdA3l9VJDLf1agEGIp1f47Azi2PCJY+Kcu8KjclzDF7O4HZPonjDgDkjy69U+YYO8xb
 ckZ+Z77ttMB4DWxLJjGv4qo6zoXCLZh/gTRZR/CnfOl3Xq+AfjQKLJE4SgrMZ45kpa6HHEkluHk
 BieINBeECAWGsUYs0kBtROQo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4abd1e9e5f610d68;
	Tue, 03 Nov 2026 15:24:48 +0000
X-Mizu-Trace-ID: 4abd1e9e5f610d68
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Lance Yang <lance.yang@linux.dev>
Cc: Usama Arif <usama.arif@linux.dev>,
	akpm@linux-foundation.org,
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
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 26/30] mm: handle PMD swap entries in UFFDIO_MOVE
Date: Tue,  3 Nov 2026 07:24:43 -0800
Message-ID: <20261103152444.2041674-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004081917.20111-1-lance.yang@linux.dev>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun,  4 Oct 2026 16:19:17 +0800 Lance Yang <lance.yang@linux.dev> wrote:

> Hey Usama,
> 
> On Fri, Oct 02, 2026 at 02:52:40AM -0700, Usama Arif wrote:
> [...]
> >+static int move_swap_pmd(struct mm_struct *mm, struct vm_area_struct *dst_vma,
> >+			 unsigned long dst_addr, unsigned long src_addr,
> >+			 pmd_t *dst_pmd, pmd_t *src_pmd,
> >+			 pmd_t orig_dst_pmd, pmd_t orig_src_pmd,
> >+			 spinlock_t *dst_ptl, spinlock_t *src_ptl,
> >+			 struct folio *src_folio, swp_entry_t entry)
> >+{
> [...]
> >+
> >+	moved_pmd = pmdp_huge_get_and_clear(mm, src_addr, src_pmd);
> >+	if (pgtable_supports_soft_dirty())
> >+		moved_pmd = pmd_swp_mksoft_dirty(moved_pmd);
> 
> Shouldn't we clear the source UFFD marker here?
> 
> 	moved_pmd = pmd_swp_clear_uffd(moved_pmd);
> 
> just like move_swap_pte(), no?

Yes, good catch, Thanks! I have added clear for next revision.

> 
> >+	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
> >+	if (userfaultfd_rwp(dst_vma))
> >+		moved_pmd = pmd_swp_mkuffd(moved_pmd);
> >+	set_pmd_at(mm, dst_addr, dst_pmd, moved_pmd);
> 
> static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
> 			 unsigned long dst_addr, unsigned long src_addr,
> 			 pte_t *dst_pte, pte_t *src_pte,
> 			 pte_t orig_dst_pte, pte_t orig_src_pte,
> 			 pmd_t *dst_pmd, pmd_t dst_pmdval,
> 			 spinlock_t *dst_ptl, spinlock_t *src_ptl,
> 			 struct folio *src_folio,
> 			 struct swap_info_struct *si, swp_entry_t entry)
> {
> ...
> 	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
> ...
> 	orig_src_pte = pte_swp_clear_uffd(orig_src_pte);
> 	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
> 	if (userfaultfd_rwp(dst_vma))
> 		orig_src_pte = pte_swp_mkuffd(orig_src_pte);
> 	set_pte_at(mm, dst_addr, dst_pte, orig_src_pte);
> ...
> }
> 
> Suppose the source is an exclusive swap PMD carrying a UFFD-WP marker, and
> the destination is an empty hole registered for synchronous UFFD-WP without
> RWP. We haven't write-protected the destination, but a successful whole-PMD
> MOVE carries the source's UFFD-WP marker into it.
> 
> On swap-in, that marker is restored in the present PMD, leaving it
> write-protected. The write fault then reaches
> handle_userfault(vmf, VM_UFFD_WP), even though we never write-protected
> the destination ...
> 
> That would be quite a surprise for userspace, and could leave the writer
> stuck if the unexpected WP event goes unhandled :)
> 
> vm_fault_t do_huge_pmd_swap_page(struct vm_fault *vmf)
> {
> 	struct vm_area_struct *vma = vmf->vma;
> ...
> 	bool exclusive, stable_writes, rwp_restore = false;
> 	bool write = vmf->flags & FAULT_FLAG_WRITE;
> ...
> 	pmd = folio_mk_pmd(folio, vma->vm_page_prot);
> ...
> 	if (pmd_swp_uffd(vmf->orig_pmd))
> 		pmd = pmd_mkuffd(pmd);
> 	if (pmd_swp_uffd(vmf->orig_pmd) && userfaultfd_rwp(vma)) {
> 		pmd = pmd_modify(pmd, PAGE_NONE);
> 		rwp_restore = true;
> 	}
> ...
> 	if (exclusive) {
> 		if (!rwp_restore && (vma->vm_flags & VM_WRITE) &&
> 		    !userfaultfd_huge_pmd_wp(vma, pmd) &&
> 		    !pmd_needs_soft_dirty_wp(vma, pmd)) {
> 			pmd = pmd_mkwrite(pmd, vma);
> 			if (write)
> 				pmd = pmd_mkdirty(pmd);
> 		}
> 		rmap_flags |= RMAP_EXCLUSIVE;
> 	}
> ...
> 	vmf->orig_pmd = pmd;
> ...
> 	if (write && !pmd_write(pmd) && !rwp_restore) {
> 		vm_fault_t wp_ret = wp_huge_pmd(vmf);
> ...
> 	}
> ...
> }
> 
> vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
> {
> 	struct vm_area_struct *vma = vmf->vma;
> 	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
> ...
> 	if (vma_is_anonymous(vma)) {
> 		if (likely(!unshare) &&
> 		    userfaultfd_huge_pmd_wp(vma, vmf->orig_pmd)) {
> 			if (userfaultfd_wp_async(vmf->vma))
> 				goto split;
> 			return handle_userfault(vmf, VM_UFFD_WP);
> 		}
> 		return do_huge_pmd_wp_page(vmf);
> 	}
> ...
> }
> 
> So, clearing the source UFFD-WP marker before the destination RWP check
> would match the PTE helper and keep the RWP re-arm :)
> 
> Am I missing something?
> 
> >+	src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
> >+	pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
> >+
> >+	double_pt_unlock(dst_ptl, src_ptl);
> >+	return 0;
> >+}
> >+#endif /* CONFIG_THP_SWAP */
> >+
> 
> [...]
> 
> Cheers, Lance
> 
