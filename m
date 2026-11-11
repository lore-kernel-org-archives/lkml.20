Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360571;
	b=qI4FqoNWzaAdVp/Ewfs3zXvLrW5aBS3XcdGKpHyDfmStVg6zTJWD6VYTffj55knuai2Z
	 hvLNbdzhBcRy/KPyqHHc/D4TEeehLAjWRtQsd0vhAazfkTt81V6RmbfBuogeeGxBHKHn1
	 zSKdGLI4AeDd1dSXHXgUOzEfNQ859KhgQpR847n7ey/dzwp7rA7ahee00s2c05Te2En1Y
	 p1Q50iKnl319ihmJWUX6x3y5mssW51AOLSfetstIJ82TSYPLOXxiYzLk/XRw27avCJXz0
	 dYwetxkwFDhkn9Poe1OkxjtQS/yQAil8JFgInQmBA+iJXACZ1W4tly6T69K8kqWxhMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360571;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=WJO9J925Zyjd9oDjnhBcl5C5X6Z/lz/HeHH0GON15bE=;
	b=U1l0hGJNpRq7Vp8GrXmc7AVqE+rXPuMP2GbS2DwXsHf/aD/BASgF2Y6AhoWEQyADVUNB
	 AXOzZDextHw0zlGC0rqfaHwtdRPH+FhwZQ0mkAjF+v6m811DH6jXEu/Jzmp2yC2ua2Pnc
	 xoT8UdJwkQYVO+g45igPJOXsnnKX9Y1GI9QHoHslgBLBTAf7Tg1CK0OEeSe2lcpuPl2v4
	 Uknz274gItAvFEKOzzqCwsOR06MORPOB2+Ow0zPAap8upQDVPo542LBkbQvik38eJkqgy
	 m29SYkTOHcyrmM3voKlMSR6l+F+eBcWz9BF54cJc6D34A1PJTJRu1paAhET+yqAlGjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="1/RpaODb";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16115606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16115606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1/RpaODb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WJO9J925Zyjd9oDjnhBcl5C5X6Z/lz/HeHH0GON15bE=; b=1/RpaODbmOCV8/voA+ETbz8wIS
	D+MaCvQiwqxGlBmsaZVcjMWo9siecOysfznzNvNxLp32tCxNP8NmbhQuvNqu0b/Ab+/ny+6DrFa/U
	QNXCMXOUZ1vY66BQIkkvwftL9xMoX6RbizU0ClULKa1/5GyZ4x9GUu/axBRuxtPJjS51a+PH4rxJo
	vhNkn/CP5C7yNkY5/zW79XGdaRneCY/yvD633z0/1cJ4KfvClFbryn0+bHAuRTbvGxppTWSzm0jiU
	0MWFg67+2eywVbIT4ZGFgHbtrKRWltpz4JvPmcqwVgKMCg2saBYPW0dASl2K3nRISJ3IvDnlS4rPE
	lvO3aOoA==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQx9W-00000005Nbn-0Ih6;
	Wed, 11 Nov 2026 01:29:30 +0000
Date: Tue, 10 Nov 2026 20:29:27 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm: only assert VMA locks if CONFIG_DEBUG_VM is set
Message-ID: <dtmgkdxvqouwm2gipfccmnxjjm33qcamkjunh4cyqrf4si6ixi@g5uussz2eqwh>
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
 <20261110-tame-vma-asserts-v1-2-be293ff499a7@kernel.org>
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
In-Reply-To: <20261110-tame-vma-asserts-v1-2-be293ff499a7@kernel.org>

On 26/11/10 04:57PM, Lorenzo Stoakes (ARM) wrote:
> Similar to the mmap lock asserts, we have also asserted VMA locks
> regardless of whether or not the kernel is a debug build or not.
> 
> Similarly, these are asserting basic assumptions about kernel code which
> should never assert in production code.
> 
> Since all such bugs are generally asserted using VM_WARN_ON_ONCE() or
> similar, it creates an odd and inconsistent situation where some
> programmatic asserts are only checked under CONFIG_DEBUG_VM and some are
> always checked.
> 
> Since the intent is the same as any VM_WARN_ON_ONCE() check, do not assert
> if CONFIG_DEBUG_VM is not set.
> 
> Implement by updating vma_assert_attached() and vma_assert_detached() to
> use VM_WARN_ON_ONCE() rather than WARN_ON_ONCE(), and gating
> vma_assert_[write_]locked() and vma_assert_can_modify() on CONFIG_DEBUG_VM.
> 
> nommu loses its CONFIG_LOCKDEP asserts if !CONFIG_DEBUG_VM in
> vma_assert_[write_]locked(), but this doesn't seem to be a problem.
> 
> In addition, there were already inconsistencies - vma_assert_write_locked()
> uses VM_WARN_ON_ONCE_VMA() and performs no actions if CONFIG_DEBUG_VM is
> not set, and vma_assert_locked() looked up vma->vm_refcnt but also only
> asserted if CONFIG_DEBUG_VM was set.
> 
> Therefore simply update these functions such that they're predicated on
> CONFIG_DEBUG_VM and update their kdoc descriptions accordingly.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

One nit, but not worth holding things up for.

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>

> ---
>  include/linux/mmap_lock.h | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 9367430ee53c..bada7a03ddf4 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -354,9 +354,14 @@ int vma_start_write_killable(struct vm_area_struct *vma)
>  /**
>   * vma_assert_write_locked() - assert that @vma holds a VMA write lock.
>   * @vma: The VMA to assert.
> + *
> + * Assert only if CONFIG_DEBUG_VM is set.

These are stating what the code does at the very start of the function
and I'm not sure the kernel docs needs to state the debugging behaviour.

>   */
>  static inline void vma_assert_write_locked(const struct vm_area_struct *vma)
>  {
> +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> +		return;
> +
>  	if (!IS_ENABLED(CONFIG_MMU)) {
>  		mmap_assert_write_locked(vma->vm_mm);
>  		return;
> @@ -369,11 +374,16 @@ static inline void vma_assert_write_locked(const struct vm_area_struct *vma)
>   * vma_assert_locked() - assert that @vma holds either a VMA read or a VMA write
>   * lock and is not detached.
>   * @vma: The VMA to assert.
> + *
> + * Assert only if CONFIG_DEBUG_VM is set.
>   */
>  static inline void vma_assert_locked(const struct vm_area_struct *vma)
>  {
>  	unsigned int refcnt;
>  
> +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> +		return;
> +
>  	if (!IS_ENABLED(CONFIG_MMU)) {
>  		mmap_assert_locked(vma->vm_mm);
>  		return;
> @@ -480,12 +490,12 @@ static inline void vma_assert_attached(struct vm_area_struct *vma)
>  	if (!IS_ENABLED(CONFIG_MMU))
>  		return;
>  
> -	WARN_ON_ONCE(!vma_is_attached(vma));
> +	VM_WARN_ON_ONCE(!vma_is_attached(vma));
>  }
>  
>  static inline void vma_assert_detached(struct vm_area_struct *vma)
>  {
> -	WARN_ON_ONCE(vma_is_attached(vma));
> +	VM_WARN_ON_ONCE(vma_is_attached(vma));
>  }
>  
>  static inline void vma_mark_attached(struct vm_area_struct *vma)
> @@ -549,6 +559,9 @@ struct vm_area_struct *lock_next_vma(struct vma_rcu_iter *rvmi,
>  
>  static inline void vma_assert_can_modify(struct vm_area_struct *vma)
>  {
> +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> +		return;
> +
>  	if (vma_is_attached(vma))
>  		vma_assert_write_locked(vma);
>  }
> 
> -- 
> 2.56.0
> 
