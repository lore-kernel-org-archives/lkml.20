Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038B747F788
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397796; cv=none; b=XXOpHGMxx8dyQTqtnXQTg5HWl772TCs28zRm9GSHhv+dnrE1RpLDunK4kQr5vEcw9crPoT4RGK9X2LZq2q7IymnAF2lVQ5XXiCYOMaHvI+26jwsmczII033/b3+MWqjdMPVl3LCxWAy6YCm/uxyrQDvjQ191xKw4dO7qUMeuNz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397796; c=relaxed/simple;
	bh=nlhYXQoSE1olSovgv5KZ/URGMPfgJ2GfotO4nK1kDGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLbRJqKmN7KUAPYVtNCjX9TJE8nPMIqxWresq3KaCmT2c3A9EG7qL5O7zD81GyZqgWDWVb9NxYBVuC1CQbKHP8y1xBN6+uEJbDvrITckxI1dtYb2EMBFeLkxmQOJb6xPV2D7z9yLQ/731H4UWjWYQIxD3/bB1wkG5Z9PA/zZZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elOH0inv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elOH0inv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8EB1F000FF;
	Mon, 14 Sep 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789397794;
	bh=F7lWGf8L7967Moc9puwQRf+mWEjOoW229rtR8NZffW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=elOH0invuuhKBmLJyo17T5vPdD4BWx9gY9GIpEETdazFh9fzbL6NrkxFMRy7qTq84
	 W+GFuduX9Z+YzonDV4Q13BqBo9uGm/SP4HP7cHeILofrqI8+/Nt4BmKIDgqJ4uoeSa
	 zKFhJPjqyjaWYv4A1kW1LfxWPPxeIGfC1MMfnRuWH2mdjLOP33I4LYheS3RDUFak5Q
	 lmnWyr9TRHt2rPOdX4FN+I0C85jXLdCbkDN5DHM56xG5Pb8GzhH/CsqRoHrnNBK6vZ
	 xP5CaJt8mc15KxeYxUVCVonHJO/pwZLfXkq/DI1WUET7WhG5n/zcApe/6PB39CG8sL
	 1cw1gj0CSMDYA==
Message-ID: <7e247c67-ea51-4c2e-b02d-8e5ed31cc5e6@kernel.org>
Date: Mon, 14 Sep 2026 16:56:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Content-Language: en-US
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260912030424.2889731-3-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/26 05:04, Gregory Price wrote:
> Extract per-node fallback-list construction into build_node_zonelist().
> Build each selected node directly into the destination zonelist so no
> intermediate node_order array or node count is needed. Print the fallback
> order as each node is added.
> 
> This lets us build new zonelists from candidate nodemasks instead of just
> the default N_MEMORY node state list.
> 
> No functional change: build_zonelists() builds and prints the same FALLBACK
> list over N_MEMORY with node_load updates as before.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>

Nice, glad this way of refactor was feasible.

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  mm/page_alloc.c | 63 ++++++++++++++++++-------------------------------
>  1 file changed, 23 insertions(+), 40 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 7efce139d562..d1888d5630e0 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5857,31 +5857,6 @@ int find_next_best_node_in(int node, nodemask_t *used_node_mask,
>  }
>  
>  
> -/*
> - * Build zonelists ordered by node and zones within node.
> - * This results in maximum locality--normal zone overflows into local
> - * DMA zone, if any--but risks exhausting DMA zone.
> - */
> -static void build_zonelists_in_node_order(pg_data_t *pgdat, int *node_order,
> -		unsigned nr_nodes)
> -{
> -	struct zoneref *zonerefs;
> -	int i;
> -
> -	zonerefs = pgdat->node_zonelists[ZONELIST_FALLBACK]._zonerefs;
> -
> -	for (i = 0; i < nr_nodes; i++) {
> -		int nr_zones;
> -
> -		pg_data_t *node = NODE_DATA(node_order[i]);
> -
> -		nr_zones = build_zonerefs_node(node, zonerefs);
> -		zonerefs += nr_zones;
> -	}
> -	zonerefs->zone = NULL;
> -	zonerefs->zone_idx = 0;
> -}
> -
>  /*
>   * Build __GFP_THISNODE zonelists
>   */
> @@ -5897,20 +5872,24 @@ static void build_thisnode_zonelists(pg_data_t *pgdat)
>  	zonerefs->zone_idx = 0;
>  }
>  
> -static void build_zonelists(pg_data_t *pgdat)
> +/*
> + * Build one zonelist ordered by node and zones within node. This results in
> + * maximum locality--normal zone overflows into local DMA zone, if any--but
> + * risks exhausting DMA zone.
> + */
> +static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
> +				int zlidx)
>  {
> -	static int node_order[MAX_NUMNODES];
> -	int node, nr_nodes = 0;
> +	struct zoneref *zonerefs = pgdat->node_zonelists[zlidx]._zonerefs;
>  	nodemask_t used_mask = NODE_MASK_NONE;
> -	int local_node, prev_node;
> +	int local_node = pgdat->node_id;
> +	int prev_node = local_node;
> +	int node;
>  
> -	/* NUMA-aware ordering of nodes */
> -	local_node = pgdat->node_id;
> -	prev_node = local_node;
> +	pr_info("Fallback order for Node %d: ", local_node);
>  
> -	memset(node_order, 0, sizeof(node_order));
>  	while ((node = find_next_best_node_in(local_node, &used_mask,
> -					      &node_states[N_MEMORY])) >= 0) {
> +					      candidates)) >= 0) {
>  		/*
>  		 * We don't want to pressure a particular node.
>  		 * So adding penalty to the first node in same
> @@ -5920,18 +5899,22 @@ static void build_zonelists(pg_data_t *pgdat)
>  		    node_distance(local_node, prev_node))
>  			node_load[node] += 1;
>  
> -		node_order[nr_nodes++] = node;
> +		zonerefs += build_zonerefs_node(NODE_DATA(node), zonerefs);
> +		pr_cont("%d ", node);
>  		prev_node = node;
>  	}
>  
> -	build_zonelists_in_node_order(pgdat, node_order, nr_nodes);
> -	build_thisnode_zonelists(pgdat);
> -	pr_info("Fallback order for Node %d: ", local_node);
> -	for (node = 0; node < nr_nodes; node++)
> -		pr_cont("%d ", node_order[node]);
> +	zonerefs->zone = NULL;
> +	zonerefs->zone_idx = 0;
>  	pr_cont("\n");
>  }
>  
> +static void build_zonelists(pg_data_t *pgdat)
> +{
> +	build_node_zonelist(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK);
> +	build_thisnode_zonelists(pgdat);
> +}
> +
>  #ifdef CONFIG_HAVE_MEMORYLESS_NODES
>  /*
>   * Return node id of node used for "local" allocations.

