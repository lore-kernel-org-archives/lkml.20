Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97707145A1F;
	Thu,  8 Oct 2026 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468317; cv=none; b=YKwnBWXLtPSKUjCw85l+Zs7zfEyUnDeJB76r9RLstzYdNBnAfYuSaNizR/sCNFqqMBVY7Nozq/arsiBjyMiseq3BfxPEoEHG1koVa5Wf7zyMQUSv42IEE1eyawLNfOPi7h0QI+gHaYyw+b1fgmPaowEbjyPO8avaZXdEzdcnly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468317; c=relaxed/simple;
	bh=MZ5zqXuZnKHZwgGqsZj++OEjOvwT4+6kEkQbAjDSELs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipb4qWTxl++lq/7TQEPhT/5uFw00ti3ebtlxBQ9yvjoyIlXaSp54+EpuM+VmnUuTNAsg88tuunVjydUNA++RU5dI5IQOOznN25HKu7OcxQyWQmjN46fyK6rb9f74PrUr2TioaBcYU4wui61v9paGF9OjkPUyrG6gQ4VFOCztYZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0vKNlzI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0vKNlzI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A1A1F000FF;
	Thu,  8 Oct 2026 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791468316;
	bh=M069Iw3bXdsC/3DZgadjO0BbzRw+5tuAHetlY3tELmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I0vKNlzIbSpIXeaVg9TodK8mLrShglenOa//I6LaHYDz3kU1ir8IZGKTZZ3+iKdr5
	 uAyilIT2FXIA0A1WLwjQB88BDj4lFlNkw17wf54WrpH/PNvOg1Pjy6gLhxFvnELX9Y
	 RkLJ8m/VF1ZPG7Flv4Zj6aMAG3YsUK0XWtVdelVv02rlfP1IQMnJVoJlmK8+PvPr27
	 24YjJd5gFtcnGCmpiN52eSRDBfwAtXFg2+1opFXOiGwKcC2jAlzKozlJTc2CuiHL8C
	 CJOUZLK2w0dIQoEuPsCUkq3NQUcLNIT9wNFiqdO90vxbTvTihALPhCjdTmw8EW9WjB
	 dOdNWM6O6ZFrg==
Date: Thu, 8 Oct 2026 09:05:15 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] of: reserved_mem: allocate and map the reserved_mem
 array early
Message-ID: <20261008140515.GB183998-robh@kernel.org>
References: <20261008094125.3197971-1-m.szyprowski@samsung.com>
 <CGME20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea@eucas1p1.samsung.com>
 <20261008094125.3197971-3-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008094125.3197971-3-m.szyprowski@samsung.com>

On Thu, Oct 08, 2026 at 11:41:23AM +0200, Marek Szyprowski wrote:
> Get rid of the static, limited-size reserved_mem array and replace it
> with array allocated by memblock_alloc_raw() and accessed through a
> temporary early_memremap() mapping. Such mapping is needed for some
> architectures (like ARM64), where linear map is not yet available during
> early boot scan. Having a single, writeable array with all reserved
> regions removes the need to perform two step initialization introduced
> by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved
> memory regions are processed"), so all regions can be processed
> directly during the early scan again.
> 
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
> Assisted-By: Claude Opus 5.5 <noreply@anthropic.com>

Assisted-by: LLM

is the new way...

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/of/fdt.c             |   3 -
>  drivers/of/of_private.h      |   2 -
>  drivers/of/of_reserved_mem.c | 251 ++++++++++++++---------------------
>  3 files changed, 96 insertions(+), 160 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index ecc923102622..a58efdcbac7f 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1283,9 +1283,6 @@ void __init unflatten_device_tree(void)
>  {
>  	void *fdt = initial_boot_params;
>  
> -	/* Save the statically-placed regions in the reserved_mem array */
> -	fdt_scan_reserved_mem_late();
> -
>  	/* Populate an empty root node when bootloader doesn't provide one */
>  	if (!fdt) {
>  		fdt = (void *) __dtb_empty_root_begin;
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index 0ae16da066e2..895f868b4cfa 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -9,7 +9,6 @@
>   */
>  
>  #define FDT_ALIGN_SIZE 8
> -#define MAX_RESERVED_REGIONS    64
>  
>  /**
>   * struct alias_prop - Alias property in 'aliases' node
> @@ -186,7 +185,6 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
>  #endif
>  
>  int fdt_scan_reserved_mem(void);
> -void __init fdt_scan_reserved_mem_late(void);
>  
>  bool of_fdt_device_is_available(const void *blob, unsigned long node);
>  
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 300fb236ab59..6a5e53243bb7 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -24,12 +24,14 @@
>  #include <linux/slab.h>
>  #include <linux/memblock.h>
>  #include <linux/kmemleak.h>
> +#ifdef CONFIG_GENERIC_EARLY_IOREMAP
> +#include <asm/early_ioremap.h>
> +#endif

These ifdefs are the only thing I don't like. early_ioremap.h is always 
in asm-generic, so do we need the ifdef here? Or does the arch have to 
do something to pick it up? I don't remember.

>  
>  #include "of_private.h"
>  
> -static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
> -static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
> -static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
> +static struct reserved_mem *reserved_mem __refdata;
> +static int total_reserved_mem_cnt;
>  static int reserved_mem_count;
>  
>  static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
> @@ -59,56 +61,48 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>  }
>  
>  /*
> - * alloc_reserved_mem_array() - allocate memory for the reserved_mem
> - * array using memblock
> + * reserved_mem_array_map() - make the freshly allocated reserved_mem array
> + * accessible during early boot
>   *
> - * This function is used to allocate memory for the reserved_mem
> - * array according to the total number of reserved memory regions
> - * defined in the DT.
> - * After the new array is allocated, the information stored in
> - * the initial static array is copied over to this new array and
> - * the new array is used from this point on.
> + * On some architectures (i.e. arm64) the linear mapping is not yet usable when
> + * the reserved memory regions are scanned, so the array has to be accessed
> + * through a temporary early mapping.
>   */
> -static int __init alloc_reserved_mem_array(void)
> +static struct reserved_mem * __init reserved_mem_array_map(struct reserved_mem *array,
> +							   size_t size)
>  {
> -	struct reserved_mem *new_array;
> -	size_t alloc_size, copy_size, memset_size;
> -	int ret;
> +#ifdef CONFIG_GENERIC_EARLY_IOREMAP

This could at least be:

if (IS_ENABLED(CONFIG_GENERIC_EARLY_IOREMAP))
	return early_memremap(__pa(array), size);
else
	return array;

Assuming the header can always be included...

> +	return early_memremap(__pa(array), size);
> +#else
> +	return array;
> +#endif
> +}
