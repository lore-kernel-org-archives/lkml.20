Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389898;
	b=XIVLSPljQLVzo23NOHJ78iHPJbSrrXGx+6EFXfswcBYFQxSmRy68yKsR20wmkn1CepbF
	 B9u4QRxFKt1F3PWrJTQByLz66hP7dw4hzLX3d2duhy5QFFOn6NbYjywsNIvnLIa2Ixll2
	 l6HxMfS8Jwubh3LsOOmxEC9wwbnxntD33sqvuiX7k5uYgDgQ0o+tUzP/AZ7hw5FnYieK7
	 s52LDlTjpGyV9ss3fC8dC3z5XZckdQfSCrLRnhuh0K7yMUrewjtTjtjT7vLTt7it4vK/e
	 rUWI52ly39+1ZO1mGgVWkgGN3cQJN9ikuMEXWUg/HyNj5ivoWK0OAUC8frwzkAwnuZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389898;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5p/q3+WMS3ls8L+KObTnHmV8zpLfczVrwuNUj9yKsvQ=;
	b=fP/co/ghCsXlUg+HytqaH1IoVg9MBAT6CRW32g9IWJpWSYxC3tCVz8fa5G/Lzk7EwwMH
	 hkHWhGKhwEZQCPIykKdx+D9hJnoop3dYppEeG0d4gSEVyjwv/AwV5soGZR7XXRzCSNABm
	 l1LT+sPLUzcsVyHB91QQBNlOPbDRlS8lZLSKVFECIpHMOca3Aeta+G7vqyEcwvOmq5b6D
	 9y0u7gV5ZjGWtH2lNQu3B46UwIY6vzGVJkQmFznXU1BItUGvd1aauYQ+Tp1DzmZrrj52J
	 fRssma/8hbpRQX7Ysig03Zub13T8AliBTBn4qlHAvgFOk6ahO/LFjWjbKM6+mZnCPNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzR37AmC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA6606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzR37AmC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79D91F00A06;
	Wed, 11 Nov 2026 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389898;
	bh=5p/q3+WMS3ls8L+KObTnHmV8zpLfczVrwuNUj9yKsvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MzR37AmCszwGbQH+6B0ZwpFLoz/cN8Un+xeXNMhovJUZ/SghyRwpY2NP1NfcnmXLh
	 slCIxDons0PwXhP6IQbO5Q+NTv+dwJmdtafsQhv2LJQ9yRoNir8jp7il4Q8ob368ZI
	 9aiFYwL7b6Dy+Y4PfoVdvMIXAAZ9S53m/5DbrpZAEYZeAH0iBM+ofGCE5N6uY1b+wt
	 tnZCwTuG0BiN8pCnOH1DCNxPAT3lpCsEWgr8aoFBUVwOFbf4k+ewGTBFkTXceIRyTk
	 HZGac6UXuQfiCFRdcaCaEH3h8VpZjBmmr5tcc9D7AH0v8kK2vEsSfWudNIVhE3njf0
	 mOnTOJOWiAVRQ==
Message-ID: <d053c2b5-dc2b-4475-9832-db575e4b8cd5@kernel.org>
Date: Wed, 11 Nov 2026 10:38:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: only assert VMA locks if CONFIG_DEBUG_VM is set
Content-Language: en-US
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
 <20261110-tame-vma-asserts-v1-2-be293ff499a7@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261110-tame-vma-asserts-v1-2-be293ff499a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 17:57, Lorenzo Stoakes (ARM) wrote:
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

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

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

