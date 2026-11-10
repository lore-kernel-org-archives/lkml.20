Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324222;
	b=fdUHO+qS65HX++Q1Qo9xCfLxrsmxInci6/DRiXvTe8c0vV/Mc6z+wkbd2MslmunDqKPU
	 Ne4CN/as4rni+Y2L1G1xm6pNhNpFEMYU7GKRa1f3Ktb1rMkCGe/6jdExfT7cqHRQ7tNnj
	 GqlIrAb7c+hI4Td9M1S3XLOfcr651Jmf7XWmqS6Y/PXtcuS4VmfxLVF+eLdBx12uHAW2n
	 zyNKnBeB4+xRj6yusyVQvLzLhIi+bkGPQhDS3ZMxOdUk9fpi+cuvwgOfm6qw85HKFBoRd
	 LQbfVd/MxMYlACVodjiJS90gIyLjDVLQSvMRJtEXNhJfliSMXR6L4R2t99aUuRleU8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324222;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ol7GNy+63xj88WNy00G3u2hsfNXRSF5seB3zhJoLPRs=;
	b=VPLJ/jIsovdid0qOPGDi+N/9uU1ruYxxM4xYSEG8nT8Vz/I7LKssJpr2fBoYd7ZP2rDE
	 R3Ct2fYmjuBTv94Ub1dA99E6CNYC7DSHjzopvZ5bct4zYPKe20KWWxjjFiPR8DMahfsjN
	 pRUXtfVC0klxyU1bjqa4zoKqoO1B6I02n4IPBsU6yYLbFPPZzgZWWxyDoqhTGCCt5d43b
	 UVC4EOjhsPu3cqt2V4xucaq7kJjUCR3cq7tvBF0IENTMJ2kVALnRrtNyYuTgObTAXx2wp
	 e7mPp/WwmjMBpO0khcgPf5GDcr30YvEP0yLgVcNsD45OiUMxVvgKuOkLZLsX5kBJUDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M8XvkRLs;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B954606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B954606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M8XvkRLs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ol7GNy+63xj88WNy00G3u2hsfNXRSF5seB3zhJoLPRs=; b=M8XvkRLs89QZa2Lq7GTAk1pBcD
	4Aoq3M/qH9JrmhWSOBCqW0hW5i8dsf1R+hjeSZG26HKNKQ4xpi9otNdm0/miHHcYa5XMKSpodlcFu
	D1EYi5juV047C7gdlOwzi2N6GXUTM8o2udIwmcn2lxjA1yFX+7vIZlmswr0mw5zKzCt958a2779N3
	Ue73cYM7x/hwfMfMnctAmMIIT9N99fscyVCHIGl8LtwGeZ+rZ4IgoJutFHOlSzUvSF989UvcHyrAT
	IubOdrtKjQta07zYHDPU/q4OzI0RKlVgpKl11tyWRDm6Ai/UYlWNnO6H1dD0yDe0/8ahmfxI7W65Y
	YVNErJUA==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnh8-00000004M3C-1bpX;
	Tue, 10 Nov 2026 15:23:34 +0000
Date: Tue, 10 Nov 2026 10:23:32 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Lance Yang <lance.yang@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Seunghyun An <san55@wisc.edu>
Subject: Re: [PATCH] mm/vma: predicate vma_assert_stabilised() on
 CONFIG_DEBUG_VM
Message-ID: <lwcxgxweftxmm42ujpctfaq2mxwviv33e4ml54ln56ssvlgrfv@hnm3jhsypjih>
References: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>

On 26/11/10 03:10PM, Lorenzo Stoakes (ARM) wrote:
> I introduced commit 17fd82c3abe0 ("mm/vma: add and use
> vma_assert_stabilised()") with the intent of picking up programmatic bugs
> when debugging mm code, but kept the general practice of asserting even
> when CONFIG_DEBUG_VM is not set in line with existing code.
> 
> However, it turns out doing so can cause performance regressions,
> especially when asserted in vma_has_anon_rmap() which is referenced in a
> number of hotpaths.
> 
> Since the intent was always a debug-only assertion, explicitly check for
> CONFIG_DEBUG_VM and do not assert if it isn't set.
> 
> Really all of the assert paths need to be predicated on this, but start
> with this one only, out of caution.
> 
> Additionally, since a detached VMA is trivially stabilised (nothing to
> stabilise against), check for this case at the outset, and update
> vma_has_anon_rmap() to not explicitly need to check for this.
> 
> This also, importantly, avoids reading any VMA fields if CONFIG_DEBUG_VM is
> not set.
> 
> Target the commit which introduced vma_has_anon_rmap() for the fix, as this
> is where the issue started manifesting in practice.
> 
> Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
> Reported-by: Seunghyun An <san55@wisc.edu>
> Closes: https://lore.kernel.org/linux-mm/20261110000002.1834454-1-san55@wisc.edu/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>

> ---
> Note that vma_is_anon_rmap() was introduced in 7.4, so no need for a cc: stable,
> just needs to be sent to Linus as a hotfix. Thanks!
> ---
>  include/linux/mmap_lock.h | 19 ++++++++++++++-----
>  mm/vma.h                  |  3 +--
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 9ccbbcbd7aca..9c3a9c6525c1 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -408,6 +408,11 @@ static inline void vma_assert_locked(const struct vm_area_struct *vma)
>  	vma_assert_write_locked(vma);
>  }
>  
> +static inline bool vma_is_attached(const struct vm_area_struct *vma)
> +{
> +	return refcount_read(&vma->vm_refcnt);
> +}
> +
>  /**
>   * vma_assert_stabilised() - assert that this VMA cannot be changed from
>   * underneath us either by having a VMA or mmap lock held.
> @@ -418,9 +423,18 @@ static inline void vma_assert_locked(const struct vm_area_struct *vma)
>   *
>   * With lockdep disabled we may sometimes race with other threads acquiring the
>   * mmap read lock simultaneous with our VMA read lock.
> + *
> + * Assert only if CONFIG_DEBUG_VM is set.
>   */
>  static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
>  {
> +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> +		return;
> +
> +	/* Detached VMAs are trivially stabilised. */
> +	if (!vma_is_attached(vma))
> +		return;
> +
>  	/*
>  	 * If another thread owns an mmap lock, it may go away at any time, and
>  	 * thus is no guarantee of stability.
> @@ -454,11 +468,6 @@ static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
>  	vma_assert_locked(vma);
>  }
>  
> -static inline bool vma_is_attached(const struct vm_area_struct *vma)
> -{
> -	return refcount_read(&vma->vm_refcnt);
> -}
> -
>  /*
>   * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
>   * assertions should be made either under mmap_write_lock or when the object
> diff --git a/mm/vma.h b/mm/vma.h
> index 3fc3b47a954b..05300badd70b 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -278,8 +278,7 @@ static inline pgoff_t vmg_end_pgoff(const struct vma_merge_struct *vmg)
>   */
>  static inline bool vma_has_anon_rmap(const struct vm_area_struct *vma)
>  {
> -	if (vma_is_attached(vma))
> -		vma_assert_stabilised(vma);
> +	vma_assert_stabilised(vma);
>  	/* KCSAN gets confused about the optimistic check. Silence it. */
>  	return data_race(vma->anon_vma);
>  }
> 
> ---
> base-commit: 93d7a816a2df3e907e2719bd12b0073f1285fc5c
> change-id: 20261110-vma-fixup-debug-asserts-2d327fe27f8c
> 
> Cheers,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
