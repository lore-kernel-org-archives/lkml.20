Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61F2931FB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234808; cv=none; b=B4Ro7OlXuuNkO5lFtMSyykhM45l5igxQHpkfQAoo/M4D77yDambLt6eFI4sEF83rOd2e8c7rLOsoMEgjRyCdzZyd+pZIbiz7yIQQA5qK9fCanPDR6jKU9nHOTAJwYpxG9qNfITG0ReeZCBvdOCelidKNdeOAxvpYkWvto+BWnEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234808; c=relaxed/simple;
	bh=TIOaEomzMVcNumYoptoLvcaCB6v5SNlcY+60z2uPGdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TErRriybcwVR0H3OEPQk2mVOK5f49WgwMSggAvpqjpN42aebsVPHt/eg+UcK5h9dFI1BFIJSghGvZSUsjI5dI1BHTCNaEcDwAokpOo1KuZg1/otVDw67hWYQP5eI9LvJ86ZgS7Yc32keEoCSE/ersfLoTD4o6J3ra6QjK0Jrb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHfZfolz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHfZfolz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E22E1F000FF;
	Thu, 24 Sep 2026 07:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790234807;
	bh=vU634+Wj0kiQw2ArhkvTeThC3DE1aRI5IxZASPotl1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VHfZfolzleqbPbPN8K5KO0ppPQt0EK9ZpANQ6jYw27vrg6fRixZwA05ydbsfKEkPo
	 6nLEbD8zPAyIRgS4lapOARz5nMYfm5tKhFuYJc7PVsrOhnIQI9Ajhrl2WA4PGkx8BU
	 yQ3Xe32uy/I5+4v/3BIpZkgaYz8F85CSBm/8JcaZel3TSMZKWR0JZ9kEBNqT1Qt+yV
	 jrxn/G1WGsod1zizhKEZJALmNliX7cu73XJxUng82rF45M3n/zCfSjX/VlqOlVpa0O
	 H8G44jCwUdx3a5AUfY2zCKkhX1RSEW1CCm4e3GBElCcrLlfMbWkwBZO8wqwLEdham1
	 f+OruzL71z0bA==
Message-ID: <728a4a48-a2cc-4e0b-9c35-054ee0c31e78@kernel.org>
Date: Thu, 24 Sep 2026 09:26:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 7/8] mm, slab: add slab_tiny boot param
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
 <20260923-slub_tiny_rework-v1-7-a0e66d536eb5@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260923-slub_tiny_rework-v1-7-a0e66d536eb5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 17:45, Vlastimil Babka (SUSE) wrote:
> In order to deprecate the CONFIG_SLUB_TINY option, introduce an early
> boot param slab_tiny to control the value of slab_tiny_enabled.
> 
> As long as CONFIG_SLUB_TINY is still around and enabled, this boot param
> can also override it to be disabled.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ++++
>  Documentation/admin-guide/mm/slab.rst           | 5 +++++
>  mm/slub.c                                       | 7 +++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 33cd30996e47..0100ab00388a 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7031,6 +7031,10 @@ Kernel parameters
>  			NUMA kernel object placement which helps with slow
>  			interconnects in NUMA systems.
>  
> +	slab_tiny=	[MM, EARLY]
> +			Minimize the slab allocator memory footprint at the
> +			expense of SMP scalability.
> +
>  	slram=		[HW,MTD]
>  
>  	smart2=		[HW]
> diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
> index 0beeae71d472..6c005d3de0b2 100644
> --- a/Documentation/admin-guide/mm/slab.rst
> +++ b/Documentation/admin-guide/mm/slab.rst
> @@ -94,6 +94,11 @@ kdump kernels where scalability is not a concern, but memory has to be
>  
>  	slab_debug=N
>  
> +Note that for this purpose you can instead use an option that can achieve
> +slightly better memory savings (by not creating separate kmalloc-rcl caches)::
> +
> +        slab_tiny=1
> +
>  You can apply different options to different list of slab names, using blocks
>  of options. This will enable red zoning for dentry and user tracking for
>  kmalloc. All other slabs will not get any debugging enabled::
> diff --git a/mm/slub.c b/mm/slub.c
> index 4814f025fde5..d672809fa2f6 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -8726,6 +8726,13 @@ void __init kmem_cache_init_late(void)
>  #endif
>  }
>  
> +static int __init early_slab_tiny(char *buf)
> +{
> +	return kstrtobool(buf, &slub_tiny_enabled);

				^ slab_tiny_enabled

missed a place on a last-minute rename.

The version in git is fixed:
https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/log/?h=b4/slub_tiny_rework

> +}
> +
> +early_param("slab_tiny", early_slab_tiny);
> +
>  int do_kmem_cache_create(struct kmem_cache *s, const char *name,
>  			 unsigned int size, struct kmem_cache_args *args,
>  			 slab_flags_t flags)
> 

