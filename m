Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323723;
	b=sdEZc5wZYs965ry62Jl6sml9xsHqD+jjNTVJjYZ81Xm3WbxF12EzOeuBzJRz5Ldap/Iv
	 XpLKKKPw+aiRuu+G2N4vZWHbKpqBfRqSlZe0dX3UNS2ejdFC336CMVDLPjTnu6m1eI76a
	 A8wNTaodUee2pu9Jx4EAjjyTimxMUlR3LJVJyY2T7pm1uuTyvaxKr8T3+WDdJzAuEWyOM
	 P0oJRyKTdbC1g2gHN02KpXdGIY+xEMET/BrUf/Wm6qUZHSqXwg1yXtmd+4CaWLrZFWRDu
	 3T/Hv/TfGnwLug5OK7yIfi9gQTT4Gb6a5Rm2NhTlIGcdNM5QOGz/w44nP0qn/gdDAQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323723;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EDKPQGe+tcB83Gs3w6L12JnJZcjoeeHi9cz6bG12yVY=;
	b=WQDyLJKN1no+meJDxZGiQL1aIkk1GTHLVH1X/K9lHWBzt7uMPokLb2jXpPAZ8CqUvEo8
	 sFBlpSSWM3Y6fInbSqCwg46ebcznKtCUEoPeQyWz1nfqOL+ZAWrBw7pX7PKdft1Y8exg/
	 afWjhHzzbMPzbZFsxgR2Yw2F/bJIJmWtGTriqrS3qKXE9dcQDi/eHs44hUNtNs9nVtDrI
	 NHm0QjjVYCVIAP3xNIHbDQD/QPU0IP1ksrvCUax2MTLRVSM9d6agICoOitITkx5OsV7+7
	 ZVQ5wQJXVjg6bIdAhCtSyG2XCcVU+KuQNX/bQe1n37wiCsKh+tKZaNNyboxMrnkf7Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgheBFY3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B7606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgheBFY3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7AE1F0089F;
	Tue, 10 Nov 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323722;
	bh=EDKPQGe+tcB83Gs3w6L12JnJZcjoeeHi9cz6bG12yVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgheBFY3GQOc/VIc4WFDSA+6EXBzYHSGFEpP2p9ihpidCpJN1y1AGj3uWpUGA2atu
	 LjVtZg5CrpOdgJgxaI1HSlchN3kJIeZxl4qAbVDtpZmqVvq/kDbGsBRAkp0LnanRaH
	 d0YlnHjI9Eq8DFMW4nFOY9naqiPWRetATDUUK9KkKVi93MJzjfAY9g8aDOXvZ7pyfJ
	 ndYnyFpUyKD84G63bnGdwAnGS+HxAg+aHiTsAa8M2RmgDV6nGNDJSC2GV0KlCUsN86
	 GlpeEG1Bv09QsznI0CtSahkW+zo+z0IrlchZUgwm4l1oB+DTtw3w7PiYSm4Jrlhrc4
	 AHOO47KqfLGrQ==
Date: Tue, 10 Nov 2026 15:15:09 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@techsingularity.net, 
	mingo@kernel.org, vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, ying.huang@linux.alibaba.com, 
	matthew.brost@intel.com, byungchul@sk.com, apopple@nvidia.com, jannh@google.com, 
	pfalcato@suse.de, hannes@cmpxchg.org, osalvador@suse.de, raghavendra.kt@amd.com
Subject: Re: [PATCH v5 7/7] mm: use VMA flag helpers in NUMA balancing
Message-ID: <avM0EbXsE7WyIPJE@gremlin>
References: <20261110150446.2452975-1-gourry@gourry.net>
 <20261110150446.2452975-8-gourry@gourry.net>
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
In-Reply-To: <20261110150446.2452975-8-gourry@gourry.net>

On Tue, Nov 10, 2026 at 10:04:46AM -0500, Gregory Price (Meta) wrote:
> Use vma_test() instead of accessing vm_flags directly in the NUMA
> balancing code touched by the preceding fixes. Keep the existing flag
> predicates unchanged.
>
> No functional change intended.
>
> Suggested-by: Lorenzo Stoakes <ljs@kernel.org>

What a legend! :P

> Link: https://lore.kernel.org/r/aq1FDhy00epXXtgd@gremlin
> Assisted-by: LLM

This tag is no longer required, in fact I think checkpatch should moan about it
now.

> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Of course, LGTM ;)

This clashes with my latest VMA flags series, but the resolutions should be
trivial.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  kernel/sched/fair.c | 2 +-
>  mm/internal.h       | 2 +-
>  mm/migrate.c        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 279bf12b74b64..cf3e3657e9533 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4378,7 +4378,7 @@ static void task_numa_work(struct callback_head *work)
>  		 */
>  		placement_scan = balancing;
>  		if (placement_scan && vma->vm_file) {
> -			if ((vma->vm_flags & (VM_READ | VM_WRITE)) == VM_READ)
> +			if (vma_test(vma, VMA_READ_BIT) && !vma_test(vma, VMA_WRITE_BIT))
>  				placement_scan = false;
>  		}
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 6e7c247781a16..7fc34d084697e 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1248,7 +1248,7 @@ size_t splice_folio_into_pipe(struct pipe_inode_info *pipe,
>
>  static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
>  {
> -	if (vma->vm_flags & VM_SHARED)
> +	if (vma_test(vma, VMA_SHARED_BIT))
>  		return false;
>
>  	return atomic_read(&vma->vm_mm->mm_users) == 1;
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 50a0a2e11a353..796d98d1c116c 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2715,7 +2715,7 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
>  		 * See folio_maybe_mapped_shared() on possible imprecision
>  		 * when we cannot easily detect if a folio is shared.
>  		 */
> -		if ((vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio) &&
> +		if (vma_test(vma, VMA_EXEC_BIT) && folio_maybe_mapped_shared(folio) &&
>  		    (!folio_numab_promotable(folio) || !node_is_toptier(node)))
>  			return -EACCES;
>
> --
> 2.53.0-Meta
>

--
Cheers, Lorenzo
