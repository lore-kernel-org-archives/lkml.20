Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA145560B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448529; cv=none; b=R0um9wxPA+Vl/TZl2QrjvSxWpLwM4SV7MlV+BTKwc40gxnrCvd3djKkSdebmxVnYMSB7ObN8zdr967TtZyylgD7QUO6rpAeDZ+lGm6bme4JlGVfTsOTonCYvhmeJUrL8pj1NekHLB4prvJ2iNynkyto2noTOk/z7YdWRKaUMKBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448529; c=relaxed/simple;
	bh=d7Kj0vaOCb2LVwyqGyIRAhDVW9Aqz/jsdCUfO2PZtPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PT+1jo8V9r+P7Qa82yEeSIABGOLSvvF6qSgoTznXSe4TmsDu17S+GNAMP7h2Udq8qvle7afA1PgetMyK/pSHD1PzHYzwk8Wnr5N6z25ZtyYjMoFfKeK9BGpWFqfPqUrS2ZIKe40pmNubYbSK+R1M+TdJg62ZB+c6Co+O3NDDupk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICJz8y+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICJz8y+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F701F000E9;
	Thu,  3 Sep 2026 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788448528;
	bh=oMud6dTUHlyEq3A7UoSwnG59ukdVv+lXzg5pPz0Fv+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ICJz8y+PaYc9HWNIiP4kSa067DXNL5pU4EhN5COf3/xrhN9XnHBgW89lgawARDaob
	 yXGs0djU+69lC0tsa/ziDIEehEqwopoCfSya9L+8gWIoUZH2coPsiYHUkmvcRz5rmI
	 RA4kdB8RxyGJ27r0+rkQ4CnJRnTaGBRt8Onk4B6FGoof0ZqJCyapAlSOOCcZila6kw
	 Em83jgfr7+3dMfaw4GvaJE6AuLhs0U5L+moC2S5jRN5JtVsoypi3kful/E3e4VwPL3
	 SECH8qntp7HgeeQuQls1W/SIrBqrh0yN4ygkjoRHTY4NNdg1l75mhkwwPDkVM9x3t9
	 UNv7To0JvsLdg==
Message-ID: <906bae9d-dcf0-463b-ac9d-81ef8cc2cc2f@kernel.org>
Date: Thu, 3 Sep 2026 17:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: refactor find_next_best_node to
 find_next_best_node_in
Content-Language: en-US
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com
References: <20260902215853.156267-1-gourry@gourry.net>
 <20260902215853.156267-2-gourry@gourry.net>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260902215853.156267-2-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 23:58, Gregory Price wrote:
> find_next_best_node() picks the next-closest node for a fallback list
> from the full N_MEMORY set. Refactor it into find_next_best_node_in(),
> which takes an explicit candidates nodemask.
> 
> This enables building fallback lists with non-N_MEMORY candidates.
> 
> No functional change: every caller still selects from N_MEMORY.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Nit:

> ---
>  mm/internal.h     |  6 ++++--
>  mm/memory-tiers.c |  7 ++++---
>  mm/page_alloc.c   | 13 ++++++++-----
>  3 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index e16f1250b25c8..18d041ff5c52c 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1130,7 +1130,8 @@ extern int node_reclaim_mode;
>  
>  extern unsigned long node_reclaim(struct pglist_data *pgdat,
>  				  gfp_t gfp_mask, unsigned int order);
> -extern int find_next_best_node(int node, nodemask_t *used_node_mask);
> +extern int find_next_best_node_in(int node, nodemask_t *used_node_mask,
> +				  const nodemask_t *candidates);

Drop the extern while touching a line.

>  #else
>  #define node_reclaim_mode 0
>  
> @@ -1139,7 +1140,8 @@ static inline unsigned long node_reclaim(struct pglist_data *pgdat,
>  {
>  	return 0;
>  }
> -static inline int find_next_best_node(int node, nodemask_t *used_node_mask)
> +static inline int find_next_best_node_in(int node, nodemask_t *used_node_mask,
> +					 const nodemask_t *candidates)
>  {
>  	return NUMA_NO_NODE;
>  }
> diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
> index 54851d8a195b0..25e121851b586 100644
> --- a/mm/memory-tiers.c
> +++ b/mm/memory-tiers.c
> @@ -370,7 +370,7 @@ int next_demotion_node(int node, const nodemask_t *allowed_mask)
>  	 * closest demotion target.
>  	 */
>  	nodes_complement(mask, *allowed_mask);
> -	return find_next_best_node(node, &mask);
> +	return find_next_best_node_in(node, &mask, &node_states[N_MEMORY]);
>  }
>  
>  static void disable_all_demotion_targets(void)
> @@ -450,7 +450,7 @@ static void establish_demotion_targets(void)
>  		memtier = list_next_entry(memtier, list);
>  		tier_nodes = get_memtier_nodemask(memtier);
>  		/*
> -		 * find_next_best_node, use 'used' nodemask as a skip list.
> +		 * find_next_best_node_in, use 'used' nodemask as a skip list.
>  		 * Add all memory nodes except the selected memory tier
>  		 * nodelist to skip list so that we find the best node from the
>  		 * memtier nodelist.
> @@ -463,7 +463,8 @@ static void establish_demotion_targets(void)
>  		 * in the preferred mask when allocating pages during demotion.
>  		 */
>  		do {
> -			target = find_next_best_node(node, &tier_nodes);
> +			target = find_next_best_node_in(node, &tier_nodes,
> +							&node_states[N_MEMORY]);
>  			if (target == NUMA_NO_NODE)
>  				break;
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index c4dc61ec663ee..4dde1cbe2fd43 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5779,9 +5779,10 @@ static int numa_zonelist_order_handler(const struct ctl_table *table, int write,
>  static int node_load[MAX_NUMNODES];
>  
>  /**
> - * find_next_best_node - find the next node that should appear in a given node's fallback list
> + * find_next_best_node_in - find the next node that should appear in a given node's fallback list
>   * @node: node whose fallback list we're appending
>   * @used_node_mask: nodemask_t of already used nodes
> + * @candidates: nodemask_t of nodes eligible for selection
>   *
>   * We use a number of factors to determine which is the next node that should
>   * appear on a given node's fallback list.  The node should not have appeared
> @@ -5793,7 +5794,8 @@ static int node_load[MAX_NUMNODES];
>   *
>   * Return: node id of the found node or %NUMA_NO_NODE if no node is found.
>   */
> -int find_next_best_node(int node, nodemask_t *used_node_mask)
> +int find_next_best_node_in(int node, nodemask_t *used_node_mask,
> +			   const nodemask_t *candidates)
>  {
>  	int n, val;
>  	int min_val = INT_MAX;
> @@ -5803,12 +5805,12 @@ int find_next_best_node(int node, nodemask_t *used_node_mask)
>  	 * Use the local node if we haven't already, but for memoryless local
>  	 * node, we should skip it and fall back to other nodes.
>  	 */
> -	if (!node_isset(node, *used_node_mask) && node_state(node, N_MEMORY)) {
> +	if (!node_isset(node, *used_node_mask) && node_isset(node, *candidates)) {
>  		node_set(node, *used_node_mask);
>  		return node;
>  	}
>  
> -	for_each_node_state(n, N_MEMORY) {
> +	for_each_node_mask(n, *candidates) {
>  
>  		/* Don't want a node to appear more than once */
>  		if (node_isset(n, *used_node_mask))
> @@ -5893,7 +5895,8 @@ static void build_zonelists(pg_data_t *pgdat)
>  	prev_node = local_node;
>  
>  	memset(node_order, 0, sizeof(node_order));
> -	while ((node = find_next_best_node(local_node, &used_mask)) >= 0) {
> +	while ((node = find_next_best_node_in(local_node, &used_mask,
> +					      &node_states[N_MEMORY])) >= 0) {
>  		/*
>  		 * We don't want to pressure a particular node.
>  		 * So adding penalty to the first node in same

