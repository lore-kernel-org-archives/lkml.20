Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84295221CD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548612; cv=none; b=OCOdg28TT08SYjiRwYeJe7ApH6apvgfLaauAQjyDEL3AwDy5JNDV08B9KY+DrNTA/OzW3zwBM3h3TIukxr8xVkdBCXcbsVu+siR5v/5OAYQ1ZKUCsjGopHP37MBsfq0zoYkPGp1XAZkhOhU40UYyU148wxt/tL21QFCUHTxtgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548612; c=relaxed/simple;
	bh=oVEK1ub0iUftt+6HmRTnW29esWqJWBJV28QP+4bkBxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkwzSgg9a1vQLWhg2XFf6VdZYyr2BhpKJJuwB4/fDn+60BBMf1GHSWbA9MB9+mUpH7amLh7OvXs1RZBDkqrL4Vff0ao1IixqbMjpezdo5cbC0kIFHWSf+aMaJsJorxEglxB1rQnD7vWTfa3GmLFTueor3hjRMEGYLtNWoh9QtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oGu+JSUE; arc=none smtp.client-ip=95.215.58.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oGu+JSUE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oVEK1ub0iUftt+6HmRTnW29esWqJWBJV28QP+4bkBxU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788548599; v=1; x=1789153399;
 b=oGu+JSUEtJP3UKO9jKJTC48Ir3WUU1DR6xuFVlyJb/1S9KROXiZvAAIZW+lVpEczDC5CRyyf
 16SSHqAuIpzZfppMkvaP1tYa1L/7lKkuZins2j2/v/z2NpM+IBlbkJUEqqgyAGPrwezEXTcQ7g6
 /qfbONIlw0ZjJUxGVjRcY16I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 679dc107f74af9c9;
	Fri, 04 Sep 2026 19:03:19 +0000
X-Mizu-Trace-ID: 679dc107f74af9c9
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 12:03:17 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: David Stevens <stevensd@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2] memcg: Don't call schedule_work when no spinning is
 allowed
Message-ID: <apsTohKZNnZuWIxC@linux.dev>
References: <20260904173145.2028377-1-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904173145.2028377-1-stevensd@google.com>

On Fri, Sep 04, 2026 at 10:31:45AM -0700, David Stevens wrote:
> Memcg charging can be done from any context, but calling schedule_work()
> isn't safe from an NMI. If memory.high is breached from a context where
> spinning isn't allowed, use irq_work to schedule the reclaim work.
> 
> Fixes: 3ac4638a734a ("memcg: make memcg_rstat_updated nmi safe")
> Acked-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: David Stevens <stevensd@google.com>
> ---
> v2:
>   - Added missing includes reported by Lorenzo and kernel test robot
>   - Added Acked-by
> 
>  include/linux/memcontrol.h |  2 ++
>  mm/memcontrol.c            | 13 ++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 8170bb8066a2..4a5ef0aba475 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -23,6 +23,7 @@
>  #include <linux/writeback.h>
>  #include <linux/page-flags.h>
>  #include <linux/shrinker.h>
> +#include <linux/irq_work_types.h>
>  
>  struct mem_cgroup;
>  struct obj_cgroup;
> @@ -219,6 +220,7 @@ struct mem_cgroup {
>  	spinlock_t	 peaks_lock;
>  
>  	/* Range enforcement for interrupt charges */
> +	struct irq_work high_irq_work;
>  	struct work_struct high_work;
>  
>  #ifdef CONFIG_ZSWAP
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 6dc4888a90f3..0e8b302ca9ad 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -62,6 +62,7 @@
>  #include <linux/seq_buf.h>
>  #include <linux/sched/isolation.h>
>  #include <linux/kmemleak.h>
> +#include <linux/irq_work.h>
>  #include "internal.h"
>  #include "swap_table.h"
>  #include <net/sock.h>
> @@ -2360,6 +2361,11 @@ static void high_work_func(struct work_struct *work)
>  	reclaim_high(memcg, MEMCG_CHARGE_BATCH, GFP_KERNEL);
>  }
>  
> +static void high_irq_work_func(struct irq_work *work)
> +{
> +	schedule_work(&container_of(work, struct mem_cgroup, high_irq_work)->high_work);
> +}
> +
>  /*
>   * Clamp the maximum sleep time per allocation batch to 2 seconds. This is
>   * enough to still cause a significant slowdown in most cases, while still
> @@ -2752,7 +2758,10 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
>  		/* Don't bother a random interrupted task */
>  		if (!in_task()) {
>  			if (mem_high) {
> -				schedule_work(&memcg->high_work);
> +				if (allow_spinning)
> +					schedule_work(&memcg->high_work);
> +				else
> +					irq_work_queue(&memcg->high_irq_work);
>  				break;
>  			}
>  			continue;
> @@ -4129,6 +4138,7 @@ static struct mem_cgroup *mem_cgroup_alloc(struct mem_cgroup *parent)
>  		goto fail;
>  
>  	INIT_WORK(&memcg->high_work, high_work_func);
> +	init_irq_work(&memcg->high_irq_work, high_irq_work_func);
>  	vmpressure_init(&memcg->vmpressure);
>  	INIT_LIST_HEAD(&memcg->memory_peaks);
>  	INIT_LIST_HEAD(&memcg->swap_peaks);
> @@ -4337,6 +4347,7 @@ static void mem_cgroup_css_free(struct cgroup_subsys_state *css)
>  		static_branch_dec(&memcg_bpf_enabled_key);
>  
>  	vmpressure_cleanup(&memcg->vmpressure);
> +	irq_work_sync(&memcg->high_irq_work);

On RT kernels, this will put rcu grace period here while we are holding the
cgroup_mutex. Easy fix would be to use IRQ_WORK_INIT_HARD instead of
init_irq_work() in mem_cgroup_alloc.

Something like:
	memcg->high_irq_work = IRQ_WORK_INIT_HARD(high_irq_work_func);

