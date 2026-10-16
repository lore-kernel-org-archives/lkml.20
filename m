Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C8386C12
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165580; cv=none; b=HM1PnbW2bL9y286VSwyLrjUFWdQI6CiG3bPQyPvJhRv6N4D1fk8OFU2IQqWH/L9vvf3noFrP0CoPEYSZZBgcoj7NrZThuNH1Va59pFHT83G+GRrNV05QRCSM1q5hdJIZ+5+gPTMVzNpRZOmiSIUyz5SFc4ji3K2/dut4wuJzhY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165580; c=relaxed/simple;
	bh=5FtKuSURTM4kxW+akMwa6RkHDHbDh09By27q3sbhM6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF3mdiTjY3fZqVu/4o5f/L3Z4B4PHyKQFtOJdNHz1DhUPT/qEe0ftiuZw9nbm8QpZgoCPYJFm4ZkVeFFGCRwF/rF6u1JdF1NF+ym7FHIaYK5B8O8sWnYAR8kf+zetLm6JZCIKd4Yb1n3P8w3fg6s8hoihqZk4wndNCbLMmX62sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVx9EcwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVx9EcwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072DA1F000C4;
	Fri, 16 Oct 2026 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792165578;
	bh=fOMjyU7CzLbJbrCap44c243pX9ytDZamFQgQxTNQj6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iVx9EcwDbQvJp23ILFFq2HZCwgXzZHcIy0UKZgg4oGXtCd85a4qcPZjkUVgYSBLtA
	 e9mu58EHFYY9UU3H7dsBpgA2meOv66XkOBrciW4bAOJeda5E3clShcTG8h6L7WB8zf
	 UUYFbWBzif4NGJEiVuhnpCRPBrqcLMSsw9itZrd+ZTPtbnhhPDTC2dmquB5L92xOiW
	 V1VZ3y+AxSYW87drIyMHaXbSX/tc5KtiZHqh2HqbOMyWTkX+AY8CYo0rQkEh5hc14p
	 2Fc7kmhQQmXfJgA1PbfTbHuueg1++87CbNNz/Rx0EZXVncC5FM9DXhmr/YPe2Cs5Iu
	 deA2WG6tvfi4g==
Date: Fri, 16 Oct 2026 16:46:16 +0100
From: Harry Yoo <harry@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, Vitaly Vul <vitaly.vul@partner.samsung.com>
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array
 after concurrent resizes
Message-ID: <atJBK6hWYh2AqXwK@thinkstation>
References: <20261016132510.789715-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016132510.789715-1-nickolai@csail.mit.edu>

[+Cc Christoph Hellwig and Vitaly Wool ]

On Fri, Oct 16, 2026 at 09:25:10AM -0400, Nickolai Zeldovich wrote:
> mempool_resize() shrinks a pool by dropping pool->lock around every
> free_fn() call and, once the pool holds no more than new_min_nr
> elements, stores new_min_nr into pool->min_nr.  new_min_nr was only
> compared against pool->min_nr before the lock was first dropped, so that
> store assumes nothing changed meanwhile.  The kernel-doc allows
> mempool_alloc()/mempool_free() to run while a resize is in progress and
> the grow path also copes with concurrent resizes ("Raced, other resize
> will do our work"), but the shrink path does not: while its lock is
> dropped another resize may shrink the pool below new_min_nr and a third
> one may grow it again to a size between the two, replacing
> pool->elements with an array of exactly that size.  Storing the stale
> new_min_nr afterwards leaves pool->min_nr larger than the elements
> array.
> 
> Interleaving on a pool with min_nr = curr_nr = 10:
> 
>   CPU A: mempool_resize(pool, 8)
>     takes the lock, 8 <= 10 so it shrinks: remove_element(), drops the
>     lock, calls free_fn() and is preempted there
>   CPU B: mempool_resize(pool, 3)
>     completes: curr_nr = 3, min_nr = 3, elements still has 10 slots
>   CPU B: mempool_resize(pool, 5)
>     completes: elements = kmalloc_objs(5), min_nr = 5, curr_nr = 5
>   CPU A: retakes the lock, 8 < curr_nr (5) is false, stores min_nr = 8
>     while elements has 5 slots
> 
> Every later mempool_free() sees curr_nr < min_nr and add_element()
> stores the returned element at elements[5], [6] and [7], past the end
> of the 5-slot kmalloc allocation: a heap out-of-bounds write, i.e. slab
> corruption, a KASAN report, or a crash in whichever unrelated object
> sits next to the array.  The invariant that breaks is that pool->min_nr
> never exceeds the size of pool->elements; every other path that changes
> min_nr or elements keeps it.
> 
> An in-tree caller can hit this: fs/smb/client resizes the global
> cifs_req_poolp from cifs_demultiplex_thread() (grow, when a TCP session
> is created) and from clean_demultiplex_info() (shrink, when one goes
> away).  The two are coordinated only through the atomic
> tcpSesAllocCount, so mounts and unmounts racing on one client run the
> resizes above concurrently; pool->free is kmem_cache_free() there and
> the window is a preemption inside it.  The other callers
> (block/blk-zoned.c, drivers/s390/scsi/zfcp_erp.c) serialise their
> resizes.

The bug looks valid in theory, not sure if how easily it can be
reproduced in practice as resizing should be quite rare.

(A bug is a bug and should be fixed, but no need to hurry in this case)

> The shrink path has stored new_min_nr unconditionally since
> mempool_resize() was introduced, while the grow path has always
> re-checked pool->min_nr after reacquiring the lock.

So it's Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") ? 

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=6892188b54d484098b79b0c9813c20e543124e2d

...from a historical commit before git era, 1da177e4c3f4.

> Re-check new_min_nr against pool->min_nr under the lock before storing
> it.  If a concurrent resize has shrunk the pool below new_min_nr in the
> meantime, keep that resize's min_nr (and whatever array it installed),
> as the grow path already does; otherwise the store is unchanged.  The
> elements the loop has already freed stay freed, which is right either
> way because the pool's limit is now below new_min_nr.
> 
> Found by formal verification of mm/mempool.c against the kernel binary.
> Reproduced with a userspace build of the affected functions in which the
> free_fn() callback drives the interleaving above: before the fix min_nr
> ends at 8 with a 5-slot array and the next mempool_free() writes past it
> (AddressSanitizer heap-buffer-overflow); after the fix min_nr stays at 5
> and the element is handed to free_fn().  Not reproduced on a running
> kernel, where the window is a single preemption inside free_fn().
> 
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>
>  mm/mempool.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mempool.c b/mm/mempool.c
> index cb74e718b2c6..95533e2975ce 100644
> --- a/mm/mempool.c
> +++ b/mm/mempool.c
> @@ -378,7 +378,9 @@ int mempool_resize(struct mempool *pool, int new_min_nr)
>  			pool->free(element, pool->pool_data);
>  			spin_lock_irqsave(&pool->lock, flags);
>  		}
> -		pool->min_nr = new_min_nr;
> +		/* Raced, the array may now be smaller than new_min_nr */
> +		if (new_min_nr <= pool->min_nr)
> +			pool->min_nr = new_min_nr;
>  		goto out_unlock;
>  	}
>  	spin_unlock_irqrestore(&pool->lock, flags);
> 
> base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
> -- 
> 2.53.0
> 

-- 
Cheers,
Harry / Hyeonggon
