Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326876;
	b=nB5ffUCJzhuQpZ12mM7U0/jFD5IYylEk+c3nQ20hG6Rhn7Dapg+LpImngP3Ajkstvo9Q
	 qJTCIb4G6EV3XrDzbHGNj/mo1+ZeiqWGEjW+gF98Sw0L7blftcTPSjlLeg6NN8+ucJxC6
	 jyLDS/nS7AAH2oVfDDV8f6wXDFNTYDiVgLXYZ7gF5bQn6ND/dgtiKZPJT8R4h/wuXVnZy
	 aJzRIz4iUd0VJH0e7SZZg56hnV/K9+AGOQC0OSPNg5djec72tRpKlaw9RWyV9eIiV4WAc
	 fm8rqy9TYYlC9nt3/eYk+8nFfRI3eW9BN3ddL/FntaqOwK1MJgaWyK/6YSQB3l7sBPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326876;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rr13xWGGj4cOXcLlAfFPEFlHdCgyfIdPwKJSNmQ6jxY=;
	b=v6PVmOgxi6zZkLd557LcnD/+tD+cKNRiMzEbcSjElfHC75VSo+XOJJLO8JllnevhfVvV
	 eodYEW3SOWzmgwHWRv2L6NldQF0pQkmUhJ8PmS98hYxoefR5LgoAVrgImHmmcXhwAk1st
	 NwvYgjtOwLBFlFxsOAb8hzfgusKf/WvLm27OABHJWAZcjSnKmOMFoySMK9er5WMMU4cN9
	 PwstkbjLPkaJH2xNSRoetk1p3mtIAXBvFZ2Ljy0/iGyeg7Slu8iriqvXPLeBj6H3g/H8G
	 Trao3Mss0v+dgnBLE/K3Wn3mnnD0SG7XJmBKa6x1lgGCEjM3kN3ln4CBlsxMm1CcfFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kGmKf3wz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF33C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kGmKf3wz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FF81F008A1;
	Tue, 10 Nov 2026 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794326875;
	bh=rr13xWGGj4cOXcLlAfFPEFlHdCgyfIdPwKJSNmQ6jxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kGmKf3wzt805VYWVqW+MBTOqTcI2w/6HR9x6GkPSmTCdbAUjCe7+Z3P5pTARCwOga
	 Bk/dTss4NZSdI1RYw+3X+W/fa9/HuDdOEs7s7J6YRjnbDqezTif77ZVL5IL2pdZ6E/
	 JYGDJ5RpojShPsM7QTag6v84N8sVFsAEBmUT8JduC4F/4x7lmfdZ3eCs9cmZOi3373
	 JYCVRas0ydcZWDZHfCEFev3VVz2haiC4hxXFIhFgDr2PKcHX54IJYC8dnkHAw6vWkA
	 Vq3CLVtBmSl9if5/PlhFrSYaT/6R1K6SJvphYSU4WkRjAGgGJYgH2QYU7JhC2xyJgn
	 puVlfPI9XQP+A==
Date: Tue, 10 Nov 2026 16:07:48 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Lance Yang <lance.yang@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Seunghyun An <san55@wisc.edu>
Subject: Re: [PATCH] mm/vma: predicate vma_assert_stabilised() on
 CONFIG_DEBUG_VM
Message-ID: <avNAgtDzM0MYevV8@gremlin>
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

Andrew - could you update as below?

Thanks!

On Tue, Nov 10, 2026 at 03:10:40PM +0000, Lorenzo Stoakes (ARM) wrote:
[ ... ]
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 9ccbbcbd7aca..9c3a9c6525c1 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
[ ... ]
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

Actually I think this should be:

	if (!IS_ENABLED(CONFIG_DEBUG_VM) || !IS_ENABLED(CONFIG_LOCKDEP))

So we keep the lockdep asserts going regardless if lockdep is enabled (you'd
expect most users to enable both together but still :)

> +		return;

--
Cheers, Lorenzo
