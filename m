Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8DF367F26
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611241; cv=none; b=QMl/3o4ryG/aoJGZPUFEQhcpqtvgnLFfEFgge2VMIrsYrQKEeYZusPvxJ9povS2AVbUlVkH/CVUwRby8F9LM3yl7d1cofz+JOJT0ULCXQtDXQ4sh3W3L0Y7+s1j8QdxldGAV4MeTMRUT4uiOvbuLKgF208BHrW3dmiQF3T9kNqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611241; c=relaxed/simple;
	bh=Gk2xkJZGPeVEKBCrhgUGRQs7SjKsgX5bshchPAfWK4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpxTFkusfayzk/RpD1iNuuv/MrONUI850Bnj5VhNvrjJJ8nMxxjoDFrrH4Zis4Z6Fnqc/haIVduBFD63FO66k2hhbO+NuyfgzUVlCRAX1BJ6DEiBbewlYMxc//nRirz4h0dBWEKZIvDrh4gPdn7ieqSRmKfj7t89EVWYAc0uBU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xxh5DmGQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xxh5DmGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD4E1F000FF;
	Mon, 28 Sep 2026 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790611239;
	bh=W6eGbi4h94EROe2FvU3gHfkuY65w4Ck4RppvNoXrrGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xxh5DmGQ/V3AQE5TqtcfppYnymChdn1KQezAimXBQ9NzTpf38wanjTsUBcC2xsLrB
	 q3KAfjYz1hS7deetbUlAEh9Zf1COn4l5weayXaOtUZRUEQArEm+EQUJKRZeX2jjygk
	 +jK5SW8f2MLqPoH/psACmui9jhQ0GzcFtyBOrDF7XMtkjpjdnwVsjnhE5GgSu/fkSW
	 b+xDgGf2/+3ctlnoS2A+TI/NVHC5aM3suqBzpv8WwpKN1mul8+9f2YMQVAEi9oFAYl
	 g3sjtfF5W6v2T6AXD1LK0P2IZTJ63llfRU7UpNIl2Qz3D3CTWYbR1IKx7FXS3berQ3
	 GmdI+zzMw9oeQ==
Date: Mon, 28 Sep 2026 17:00:37 +0100
From: Harry Yoo <harry@kernel.org>
To: Seongjun Hong <hsj0512@snu.ac.kr>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] tools/mm/slabinfo: report percpu sheaves and barn
 statistics
Message-ID: <arqNTeIsjXCcYyxp@thinkstation>
References: <20260927-tools-mm-update-slabinfo-v1-0-a4ea0d4dc136@snu.ac.kr>
 <20260927-tools-mm-update-slabinfo-v1-2-a4ea0d4dc136@snu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-tools-mm-update-slabinfo-v1-2-a4ea0d4dc136@snu.ac.kr>

On Sun, Sep 27, 2026 at 05:57:28AM +0000, Seongjun Hong wrote:
> Since commit 2d517aa09bbc ("slab: add opt-in caching layer of percpu
> sheaves") sysfs provides the statistics of sheaf and barn, but slabinfo
> did not utilize this information. Display perf, API, and sheaf allocation
> counters on slabinfo report(-r).
> 
> Example slabinfo report output:
> 
> 	$ slabinfo -r kmalloc-1k
> 
> 	Sheaf capacity             12 objects
> 
> 	Sheaf Perf Counter    Success     Fail
> 	--------------------------------------------------
> 	Barn get                    4       43
> 	Barn put                    4        0
> 	RCU sheaf free             34        0
> 
> 	Sheaf API Counter        Fast     Slow
> 	--------------------------------------------------
> 	Prefill                     0        0
> 	Return                      0        0

You mean "Prefilled Sheaf API Counter"?

> 	Sheaf Objects/Allocations

This doesn't make sense to me.

Perhaps should be separated into
"Sheaf Allocation/Free" and
"Sheaf Refill/Flush" ?


> 	--------------------------------------------------
> 	Objects flushed to slabs             0
> 	Objects refilled into sheaves      516
> 	Sheaves allocated                    7
> 	Sheaves freed                        0
> 	Oversize sheaves for prefill         0
> 
> Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
> ---
>  tools/mm/slabinfo.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/tools/mm/slabinfo.c b/tools/mm/slabinfo.c
> index 84359d628f2e..dbc72582ffab 100644
> --- a/tools/mm/slabinfo.c
> +++ b/tools/mm/slabinfo.c
> @@ -574,6 +582,39 @@ static void slab_stats(struct slabinfo *s)
>  	}
>  }
>  
> +static void sheaf_stats(struct slabinfo *s)

Perhaps let's fold this into slab_stats()?
I'm not sure why this should be in a separate function.
These files are part of SLUB_STATS files, that are related to sheaves.

-- 
Cheers,
Harry / Hyeonggon

> +{
> +	if (!s->sheaf_capacity)
> +		return;
> +
> +	printf("\nSheaf capacity       %8u objects\n", s->sheaf_capacity);
> +
> +	printf("\nSheaf Perf Counter    Success     Fail\n");
> +	printf("--------------------------------------------------\n");
> +	printf("Barn get             %8lu %8lu\n",
> +		s->barn_get, s->barn_get_fail);
> +	printf("Barn put             %8lu %8lu\n",
> +		s->barn_put, s->barn_put_fail);
> +	printf("RCU sheaf free       %8lu %8lu\n",
> +		s->free_rcu_sheaf, s->free_rcu_sheaf_fail);
> +
> +	printf("\nSheaf API Counter        Fast     Slow\n");
> +	printf("--------------------------------------------------\n");
> +	printf("Prefill              %8lu %8lu\n",
> +		s->sheaf_prefill_fast, s->sheaf_prefill_slow);
> +	printf("Return               %8lu %8lu\n",
> +		s->sheaf_return_fast, s->sheaf_return_slow);
> +
> +	printf("\nSheaf Objects/Allocations\n");
> +	printf("--------------------------------------------------\n");
> +	printf("Objects flushed to slabs      %8lu\n", s->sheaf_flush);
> +	printf("Objects refilled into sheaves %8lu\n", s->sheaf_refill);
> +	printf("Sheaves allocated             %8lu\n", s->sheaf_alloc);
> +	printf("Sheaves freed                 %8lu\n", s->sheaf_free);
> +	printf("Oversize sheaves for prefill  %8lu\n",
> +		s->sheaf_prefill_oversize);
> +}
> +
>  static void report(struct slabinfo *s)
>  {
>  	if (strcmp(s->name, "*") == 0)
> @@ -613,6 +654,7 @@ static void report(struct slabinfo *s)
>  	show_tracking(s);
>  	slab_numa(s, 1);
>  	slab_stats(s);
> +	sheaf_stats(s);
>  }
