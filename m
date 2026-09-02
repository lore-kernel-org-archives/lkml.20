Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791237FF6F;
	Wed,  2 Sep 2026 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370709; cv=none; b=STmSPgJ5qvR0x1Pc+CkqSN++K1erhtusz1/z6mTq1s167sTjjDS8EpIFPDQie1xWaUMKRZCNAZbMSq8+CjISCcANULyB3+TyWT09aG6H5YtTGP6D4rgWOhYF41yDTQctXXkTw7jgQDRSEJOqj3qhj0b+Jooor00iB+hJe7a2Sro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370709; c=relaxed/simple;
	bh=K0EZk9cwMfrs7Zwj/Iy4FJfEhquZ9oqf9xx1PPUbS2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMVm9ErZNuQA/biS6MQ+XBWcu/z6blo66rSqxvWVOeoh2RgjCZLh0qoH99374DLpZ8zcVmmrUJEWvKKIdzEbxuugmKW7ndF4xLFkxUOPXlRusYalulSqyk0NDIv0WMs5dsmMfEruzW1Xsd3HCXVx3ypxnHYkc0T+4SXxybNG/d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6Uzr4pq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6Uzr4pq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629A91F000E9;
	Wed,  2 Sep 2026 17:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370707;
	bh=fsI+nhzULsUUSIbVGLobSbdGnJMPqPjlO3ivoC99fNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T6Uzr4pq+Kb+UO4HsQ0X42ZQMwEqrNkLYI01z+d2YhKthM8zctAHyrriDmaHx4SzQ
	 aOqXsOPVcxNp5lj/SPnwfFKiaT7ZtsWIe1KheN4h+Ml8Al4W4oHiTCGKrfaq1Bw+aG
	 /vOTnHhel0XgusHtqAAQ15PacrnKnFeT6PElkPfnrsoAI71YQMp6glvP0d2VtCRYJP
	 Ikv6Em1jxZ8eUs/xdMnZmToKnAemXxHkr13Nwl/ucjDhwipTmwTr0OSYTe8se5zH/i
	 8vow2FHxR4TAQTO0V3RML/oWzxwCcFFeozjODhkhkYxpAXcQ1Ze8iSkxqp49wtEN+c
	 iRzeRHCPdTozg==
Date: Wed, 2 Sep 2026 12:38:26 -0500
From: Rob Herring <robh@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/10] firmware: arm_ffa: Introduce ffa-lend-pool
Message-ID: <20260902173826.GC1440252-robh@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-10-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-10-vdonnefort@google.com>

On Wed, Sep 02, 2026 at 11:47:11AM +0100, Vincent Donnefort wrote:
> When memory is lent to the Secure world via FF-A, fatal CPU speculative
> reads from Non-Secure can still occur as long as it retains a cacheable
> mapping to that memory. Introduce the "arm,ffa-lend-pool"
> reserved-memory CMA driver to unmap pages before lending
> (ffa_prepare_lend()) and restore them upon reclaim
> (ffa_lend_reclaimed()). Devices bind to the pool via the "memory-region"
> DT property or via ffa_lend_pool_attach().
> 
>   reserved-memory {
>       #address-cells = <0x2>;
>       #size-cells = <0x2>;
>       ranges;
> 
>       ffa_lend: ffa-lend-pool {
>           compatible = "arm,ffa-lend-pool";

Needs a binding schema...

>           reusable;
>           ll-map;
>           size = <0x0 0x4000000>;
>       };
>   };
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

[...]

> +static int __init ffa_lend_pool_setup(unsigned long node, struct reserved_mem *rmem)
> +{
> +	struct cma *cma;
> +	int ret;
> +
> +	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
> +	    of_get_flat_dt_prop(node, "no-map", NULL)) {
> +		pr_err("FF-A lend pool: node must be 'reusable' and not 'no-map'\n");
> +		return -EINVAL;

Your schema should enforce/check this.

[...]

> +static const struct reserved_mem_ops ffa_lend_pool_ops = {
> +	.node_init	= ffa_lend_pool_setup,
> +	.device_init	= ffa_lend_pool_device_init,
> +	.device_release = ffa_lend_pool_device_release,
> +};
> +RESERVEDMEM_OF_DECLARE(ffa_lend_pool, "arm,ffa-lend-pool", &ffa_lend_pool_ops);

Do you need this early? If not, you can create a platform driver for 
"arm,ffa-lend-pool". ramoops is implemented that way for example.

Rob
