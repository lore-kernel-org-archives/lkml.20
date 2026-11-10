Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323833;
	b=io4bRdOgaq6CLhPgyFByEQJFb3N6GavbQeeqYi/OeRjZndgO0qedU3E2XnpYGt2bSaqd
	 f+N/xPP/VXKW3JT905I+WZNRJldt4kQIotvpismPIa8HKWB+QvL5AVEweouP7R8PrS1Ik
	 dm70UyYnxRXm1oMZr8VhYXzH02Pt5utUYE/+XPi0I72bJjI930L8jIZxL67vDf0dqEDHH
	 kcmFGH2nJ4H36GS8okxCRMJbGBwyNgoilS93JMzDbVFcB92X1vCY4/kav2vJE81gus3S4
	 LFO8ydK5Qg2Z9osMDD7H3DNPwjBb5MU6wtCZzwr2G7bVdWPrLKnxz4vzJJIqi1SzaVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323833;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DrnlJCczTM/MuGJVa3hJuzHOi7kI8idb71E/ayOYKUU=;
	b=ZWSmUpO/rLKQXkiF+40+zzRkSzTTV+paXlTBD3AWb07I81XiM3vwerTKdxT5jwzC5jiY
	 4cSU16CxkH4kvot9gYwgq0aBAo6wsNxMcULxWJ8vX2RCqynJhigSMi/fJ0Z2asE1SI/MP
	 GfSGRKIQ6cpXMsos0OtxrD13SaTZwvXed79EFG6mQAXbARW4BtERG3EF1aV55IfjDu3V0
	 TE2Uqo79zFqzfK3GEvjvT/JCfvQ2vnHa89I/fPhMWrqhhVvGjgX9XEv6G/yJNC5hFNmDS
	 9WbaOkfpl82ZWLmc06Uc5rIfuQc+xPX3cfiJGCgR5gjyWSJR3utpW5lp2ojW807d+UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YI6k6/kp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F5606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YI6k6/kp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C2F1F0089F;
	Tue, 10 Nov 2026 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323832;
	bh=DrnlJCczTM/MuGJVa3hJuzHOi7kI8idb71E/ayOYKUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YI6k6/kpdsOZXv6TVGy+1NgyuveofbEgWqWrX8bvrAXNAz2RP6yNfZCwNBpusDfqo
	 3VVbO7y9AmERmV4cR66tvWcbuAQvZjn7e1+KIl1FsvO32qXVKHhxbs7xRE/RwlYsQy
	 cf+0bvO0hyA7Yr7hPCbqbc1DRxor9IYmCJ9cMegkWVcXrhdph95lruauvRixTRwxux
	 4NQOTOpU+31DqIaBudOyc1XsDStPZqgCxoEnCaDGb8vXbZhkJwlBgm9Rx40dOSlZmk
	 p0TgXiSnvffuH3ilakdF3E6gzIQgb6Q1npb9zKoaSGLe2fHk+3Y5liFSpyZOaaHUrE
	 KK4TxbZKj0Dyg==
Date: Tue, 10 Nov 2026 15:16:59 +0000
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
Subject: Re: [PATCH v5 6/7] mm: use BIT() for change_protection() flags
Message-ID: <avM1ZOdjf3w7yJjl@gremlin>
References: <20261110150446.2452975-1-gourry@gourry.net>
 <20261110150446.2452975-7-gourry@gourry.net>
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
In-Reply-To: <20261110150446.2452975-7-gourry@gourry.net>

On Tue, Nov 10, 2026 at 10:04:45AM -0500, Gregory Price (Meta) wrote:
> The MM_CP_* flags are individual bits expressed as open-coded shifts.
> Use BIT() consistently for the complete block.
>
> No functional change intended.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Link: https://lore.kernel.org/r/9b5e1573-6fd8-48a5-a274-a6e7ff83d2fe@kernel.org
> Assisted-by: LLM
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/mm.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 55817dea7307f..da22750faddbd 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3572,21 +3572,21 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
>   * because something (e.g., COW, uffd-wp) blocks that from happening for all
>   * PTEs automatically in a writable mapping.
>   */
> -#define  MM_CP_TRY_CHANGE_WRITABLE	   (1UL << 0)
> +#define  MM_CP_TRY_CHANGE_WRITABLE	   BIT(0)
>  /* Whether this protection change is for NUMA hints */
> -#define  MM_CP_PROT_NUMA                   (1UL << 1)
> +#define  MM_CP_PROT_NUMA                   BIT(1)
>  /* Whether this change is for write protecting */
> -#define  MM_CP_UFFD_WP                     (1UL << 2) /* do wp */
> -#define  MM_CP_UFFD_WP_RESOLVE             (1UL << 3) /* Resolve wp */
> +#define  MM_CP_UFFD_WP                     BIT(2) /* do wp */
> +#define  MM_CP_UFFD_WP_RESOLVE             BIT(3) /* Resolve wp */
>  #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>  					    MM_CP_UFFD_WP_RESOLVE)
>  /* Whether this change is for uffd RWP */
> -#define  MM_CP_UFFD_RWP                    (1UL << 4) /* do rwp */
> -#define  MM_CP_UFFD_RWP_RESOLVE            (1UL << 5) /* resolve rwp */
> +#define  MM_CP_UFFD_RWP                    BIT(4) /* do rwp */
> +#define  MM_CP_UFFD_RWP_RESOLVE            BIT(5) /* resolve rwp */
>  #define  MM_CP_UFFD_RWP_ALL                (MM_CP_UFFD_RWP | \
>  					    MM_CP_UFFD_RWP_RESOLVE)
>  /* Whether a MM_CP_PROT_NUMA change is for promotion only */
> -#define  MM_CP_PROT_NUMA_PROMO_ONLY        (1UL << 6)
> +#define  MM_CP_PROT_NUMA_PROMO_ONLY        BIT(6)
>
>  bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  			     pte_t pte);
> --
> 2.53.0-Meta
>

--
Cheers, Lorenzo
