Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAE2489FAB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053430; cv=none; b=eOcBS/m0Oxw9JAfakp2K4yySgREdXrapWneulBMxYzqJmC/DmWESoMo1AOz08rUO7gePhtDxomtjhuHglf76PYgUrwhxYmClajCruRf86It+4CsG0VUzW7Mda9efHVLfB5c3r2KbFXTClMhJkGd1hphQ905H4B/SWcZfxMyIw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053430; c=relaxed/simple;
	bh=VI/S3NQ/JV7pZ/H4ER2/muIbmReg9pMFowO5ie7zaa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiyUNnWPDbTQ5NWlA8LH0RvvLmOp3w9X57adDLJ4do6JIP7CqivjXuBs3aX7QXCk+EZOa+ciRMKiXlXEU3Mu3WzZZSj/5N1Olwcarfr5vO6LTYlgrqneTHiWUQUvkZQVmZlaFfNMmgLynswJ+nzgWIkmZE83R6Uz/SgQxb4oQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceFJqAFL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceFJqAFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1BB1F000C4;
	Thu, 15 Oct 2026 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792053424;
	bh=NLcSuJO4U8vjtpBw9Dd1guU9F3I58AzL7EvX+dUZ0Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ceFJqAFLM7g4NE9wZsEJoybbeHVCVxchnM7ejTiim3IUlIFyU3ctm4G9tESzMQMla
	 DtM5RNVSK1/JVG2PJqbDaMrJtDeUiCNnpI7BbLZkgoooSQUevs8vV++LK021vfv2cV
	 2pdkgAjUJy8kcL1c/QXjLltJq619Z1+4uE0gOSXKSgBn9+sAjWca4ng0iBZb/Wj+HF
	 DoQgKlj4SpKEMEYFJaqRJssFTt18waBVfOXf1eOWjRYA2znJ1KOFyqgCAu6Qk1i1kL
	 LzSTCa3+D34hc8AKJVAg7VQxtm+MGSw+6K9TtN/GxtwaY4A1HRstooBKVORn402cMK
	 YJKOUb/qL/qqg==
Date: Thu, 15 Oct 2026 11:36:58 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Bing Jiao <bingjiao@google.com>
Subject: Re: [PATCH] kho: do not reserve empty per-node bootmem areas
Message-ID: <atCQqghin0KOyx63@kernel.org>
References: <20261014131547.259138-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014131547.259138-1-pratyush@kernel.org>

On Wed, Oct 14, 2026 at 03:15:44PM +0200, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Some nodes do not allocate any early boot memory. An example is
> hotpluggable nodes with movable_node enabled. So the scratch size for

                          Let's use the new naming please ^ ;-)

I'll fix it up when applying.

> them ends up being zero. Zero size allocations normally don't play well
> with memblock. Memblock returns an address, but then doesn't actually
> reserve anything. This address ends up being recorded in kho_bootmem
> with a size of 0. In case of hotpluggable nodes with movable_nodes, the
> allocation on the node actually fails because memblock refuses to
> allocate there, and so KHO fails to initialize.
> 
> Skip bootmem reservation for such nodes entirely.
> 
> To keep the code more robust, avoid overloading kho_bootmem_cnt. use
> max_nr_bootmem to store the size of kho_bootmem array. This ensures that
> the location of kho_bootmem_cnt assignment does not affect the cleanup
> paths.
> 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Bing Jiao <bingjiao@google.com>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  kernel/liveupdate/kexec_handover.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 7018e25e4eda..6f1f55fe3181 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -831,8 +831,8 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
>   */
>  static void __init kho_reserve_bootmem(void)
>  {
> +	int nid, i = 0, max_nr_bootmem;
>  	phys_addr_t addr, size;
> -	int nid, i = 0;
>  
>  	if (!kho_enable)
>  		return;
> @@ -840,8 +840,8 @@ static void __init kho_reserve_bootmem(void)
>  	bootmem_size_update();
>  
>  	/* FIXME: deal with node hot-plug/remove */
> -	kho_bootmem_cnt = nodes_weight(node_states[N_MEMORY]) + 2;
> -	size = kho_bootmem_cnt * sizeof(*kho_bootmem);
> +	max_nr_bootmem = nodes_weight(node_states[N_MEMORY]) + 2;
> +	size = max_nr_bootmem * sizeof(*kho_bootmem);
>  	kho_bootmem = memblock_alloc(size, PAGE_SIZE);
>  	if (!kho_bootmem) {
>  		pr_err("Failed to reserve bootmem array\n");
> @@ -882,6 +882,9 @@ static void __init kho_reserve_bootmem(void)
>  	 */
>  	for_each_node_state(nid, N_MEMORY) {
>  		size = bootmem_size_node(nid);
> +		if (!size)
> +			continue;
> +
>  		addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES,
>  						0, MEMBLOCK_ALLOC_ACCESSIBLE,
>  						nid, true);
> @@ -895,13 +898,19 @@ static void __init kho_reserve_bootmem(void)
>  		i++;
>  	}
>  
> +	/*
> +	 * Nodes that needed no bootmem were skipped, so fewer areas than
> +	 * initially estimated may have been reserved.
> +	 */
> +	kho_bootmem_cnt = i;
> +
>  	return;
>  
>  err_free_bootmem_areas:
>  	for (i--; i >= 0; i--)
>  		memblock_phys_free(kho_bootmem[i].addr, kho_bootmem[i].size);
>  err_free_bootmem_desc:
> -	memblock_free(kho_bootmem, kho_bootmem_cnt * sizeof(*kho_bootmem));
> +	memblock_free(kho_bootmem, max_nr_bootmem * sizeof(*kho_bootmem));
>  err_disable_kho:
>  	pr_warn("Failed to reserve bootmem, disabling kexec handover\n");
>  	kho_enable = false;
> 
> base-commit: e1fe7daedae7a4a23aca6dbd58e1746750b632dc
> -- 
> 2.56.0.385.gd3acb90ef8-goog
> 

-- 
Sincerely yours,
Mike.
