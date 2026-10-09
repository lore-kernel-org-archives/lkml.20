Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72A33B6D6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512214; cv=none; b=mUhz59Qe0f7pymx9IHEYc1ad1iii3Yakw+kX4N381Nk75IQKUe/D5zk+f9+zpjR+Xc7hRbhfLnuDBmaKOPxr3CaMEy0pb3c7Pp+1gjEQWprLjB1hAOJQEZmnJ5+towqj+pZOZ7meQLYM4Ud8YZCynbTdoD0+4c1OJmgrj8Ut98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512214; c=relaxed/simple;
	bh=RgfS304p5sNqkKLM5WXwpFaV9IC+O6sYdi07k4m47TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKOJN447l3/TO6tgLa2RRobzqTzj5PxP3AciL5NO8fp3DxwgRLvjKLuiGHEdHxo/ir8ZSnLLDH7q9LI3iUjBqoN8TcM4uMv/ab1WNoJ4vl2ocDPufpc3A2QE8olxI5e5q2LWWuJ11uilN5tPonclmJubF6zIr2y/GK7zv2pcEtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flUtDwnH; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flUtDwnH"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3a8c118e711so1214694a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791512211; x=1792117011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HzF21b7wH+OCi6BgDNq8o3oZ/2tI5ENlGWlmHfz0R4=;
        b=flUtDwnHsqUfPppsWxHIIOWVeGy04k0lXEII4Xm74a4mWqGHlcQhwq7WM5YwDSLYhT
         wTvhoXzvEfKJ7ZHYY497rYDY35GnE5qoU1R52idWPzZkP1pfry+XMtjjpk7NXGnesMI7
         F7u342Y3vhPV8LvWzVA8UKBT7RxHePsdkjO5Z0VF4713077aH+FsYfbG1Fszsw7pmvKJ
         8/xyaXzKN630pcmFCItA/u1buHHemLIUDtgg/OCHAvZWHpa4X5/81nlSYO1CHzsYoWTR
         gX8xZphgYlBOlgb0vJHoq5qt9XPG7KfYUxdg8ktRlTJh0saq0To1JwJz/wCscIg8kKl1
         nlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791512211; x=1792117011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HzF21b7wH+OCi6BgDNq8o3oZ/2tI5ENlGWlmHfz0R4=;
        b=cVNZ0VoxAtkWQZM5OqgZSLYQ0x9vTv5Bs5W9K0SwyWBEAjv7Xm0cKTGK0ficJgCxMz
         /6VTzpZVkjK47exVwa+7U4G5fOIDKo235GyDihHVYLFZYTzF1Gm1KTylexs2XHWDPi8a
         tpKXLgt30wbOcMp+gRkiGOT6EALcyaCEFxWckBFoqum3qQxo2zDXypMPTeEx6uPbRex8
         M4KpGpvAiBOJmNRZVxnj9uKr7QPEF2MYkdAFPFGDU0etMao2nzbFVmEq1nmsQcL++G0b
         0DJt2yzlI3g8teL7UCHyk6JW3lXpr/N/cg5t5Y9dsNNL8U232OYDHF9Xx/yvyDB0DjZv
         5N/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPBv0cS07bbcbmuXP9O95aQgkEn1TbZOoTUZU4Z4vNkbJ8u1t4QLMDIKb1T8Xnsb8q+xrq+Skf49EFQS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYII/xod9UPUkbxhZT7HgfibO5pW66/FQnIZAK+AM9i5H5XVYgHL
	2VmSg452NRtPRVgN4nijV+GpeASC/M+OWzkCY6/1VDcO07RfgP0MZ/BZ
X-Gm-Gg: AYBFou2atc6ixD2kjqQRQeoKkMkfw4wHCNYS75Ao07/nRvNHa6O81h3tZs/WPm9jzsW
	DS20rIWIZq+POVPC2R1o+uYMjYeQQNGPSIePQf9oxz+oswipIwrNFlGmfWPmyqHTBbuQYgd33/k
	G4zXzzUEuU4B/6lG3btMWumqRyh/k3A4rEW0i6u/Bxpa9617/kzctJkpCwRqE57GECFtvYNesjH
	PFqmA33P08zz1aDvU1S/SnyY0vMnMQ7ECoPO713TN56mgSUegAavu+AZDfHJZmaJhTO0KhnYLoF
	R0c4GZNe0HO6z6Ejbm6/+HOVphs6qWWj8gL7J3IkdXd+IseZvb65gNjFCxXYRK+Rbd7MuQNSLNE
	rNp2e79d+4QynZx816bJmCMLivAiwC7L648vZxDuex/eJ6TUoVpj8GivGzfoFzlC+HB15DIY5r8
	68S0vCR15BS799NrUuRnl2+UJxPWGfgM0QtPKzFOkRaFCBr1Po0SfhBV/gGosYF9rxmdupzwv4E
	BCpXQ==
X-Received: by 2002:a17:90b:1d4f:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ab3ac7912fmr583653a91.53.1791512211401;
        Thu, 08 Oct 2026 19:16:51 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm1605868a91.6.2026.10.08.19.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 19:16:50 -0700 (PDT)
Message-ID: <a8ac6daa-e721-4cba-bef3-3333643db23d@gmail.com>
Date: Fri, 9 Oct 2026 10:16:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mm@kvack.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20261008152403.766439-1-m.szyprowski@samsung.com>
 <CGME20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331@eucas1p1.samsung.com>
 <20261008152403.766439-3-m.szyprowski@samsung.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20261008152403.766439-3-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/8/26 23:24, Marek Szyprowski wrote:
> Get rid of the static, limited-size reserved_mem array and replace it
> with array allocated by memblock_alloc_raw() and accessed through a
> temporary early_memremap() mapping. Such mapping is needed for some
> architectures (like ARM64), where linear map is not yet available during
> early boot scan. Having a single, writeable array with all reserved
> regions removes the need to perform two step initialization introduced
> by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved
> memory regions are processed"), so all regions can be processed
> directly during the early scan again.

One concern about the ordering here: the new memblock_alloc_raw() for the
reserved_mem array runs *before* the static ("reg") regions are reserved,
so the array can be allocated from inside one of them which makes the
subsequent static region reservation fail.


Best regards,
Wandun

> 
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
> Assisted-By: LLM
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/of/fdt.c             |   3 -
>  drivers/of/of_private.h      |   2 -
>  drivers/of/of_reserved_mem.c | 247 +++++++++++++----------------------
>  3 files changed, 92 insertions(+), 160 deletions(-)
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
> index 300fb236ab59..8d8fa7242d4a 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -24,12 +24,12 @@
>  #include <linux/slab.h>
>  #include <linux/memblock.h>
>  #include <linux/kmemleak.h>
> +#include <asm/early_ioremap.h>
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
> @@ -59,56 +59,46 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
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
> + * On some architectures (i.e. ARM64) the linear mapping is not yet usable when
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
> +	if (IS_ENABLED(CONFIG_GENERIC_EARLY_IOREMAP))
> +		return early_memremap(__pa(array), size);
> +	else
> +		return array;
> +}
>  
> -	if (!total_reserved_mem_cnt)
> -		return 0;
> +static void __init reserved_mem_array_unmap(struct reserved_mem *map, size_t size)
> +{
> +	if (IS_ENABLED(CONFIG_GENERIC_EARLY_IOREMAP))
> +		early_memunmap(map, size);
> +}
>  
> -	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
> -	if (alloc_size == SIZE_MAX) {
> -		ret = -EOVERFLOW;
> -		goto fail;
> -	}
> +/*
> + * count_reserved_mem_nodes() - count the nodes that might need an entry in the
> + * reserved_mem array
> + */
> +static int __init count_reserved_mem_nodes(const void *fdt, int node)
> +{
> +	int child, len, count = 0;
>  
> -	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
> -	if (!new_array) {
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> +	fdt_for_each_subnode(child, fdt, node) {
> +		if (!of_fdt_device_is_available(fdt, child))
> +			continue;
>  
> -	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
> -	if (copy_size == SIZE_MAX) {
> -		memblock_free(new_array, alloc_size);
> -		ret = -EOVERFLOW;
> -		goto fail;
> +		/* static regions use 'reg', dynamic ones use 'size' */
> +		if ((of_flat_dt_get_addr_size_prop(child, "reg", &len) && len) ||
> +		    (of_get_flat_dt_prop(child, "size", &len) && len))
> +			count++;
>  	}
> -
> -	memset_size = alloc_size - copy_size;
> -
> -	memcpy(new_array, reserved_mem, copy_size);
> -	memset(new_array + reserved_mem_count, 0, memset_size);
> -
> -	reserved_mem = new_array;
> -	return 0;
> -
> -fail:
> -	pr_err("Failed to allocate memory for reserved_mem array with err: %d", ret);
> -	reserved_mem_count = 0;
> -	return ret;
> +	return count;
>  }
>  
>  static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
> @@ -169,6 +159,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
>  
>  	if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
>  		fdt_fixup_reserved_mem_node(node, base, size);
> +		fdt_init_reserved_mem_node(node, uname, base, size);
>  		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
>  			 uname, &base, (unsigned long)(size / SZ_1M));
>  	} else {
> @@ -381,143 +372,89 @@ static void __init __rmem_check_for_overlap(void)
>  	}
>  }
>  
> -/**
> - * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
> - * memory regions.
> - *
> - * This function is used to scan again through the DT and initialize the
> - * "static" reserved memory regions, that are defined using the "reg"
> - * property. Each such region is then initialized with its specific init
> - * function and stored in the global reserved_mem array.
> - */
> -void __init fdt_scan_reserved_mem_late(void)
> -{
> -	const void *fdt = initial_boot_params;
> -	phys_addr_t base, size;
> -	int node, child;
> -
> -	if (!fdt)
> -		return;
> -
> -	node = fdt_path_offset(fdt, "/reserved-memory");
> -	if (node < 0) {
> -		pr_info("Reserved memory: No reserved-memory node in the DT\n");
> -		return;
> -	}
> -
> -	/* Attempt dynamic allocation of a new reserved_mem array */
> -	if (alloc_reserved_mem_array())
> -		return;
> -
> -	if (__reserved_mem_check_root(node)) {
> -		pr_err("Reserved memory: unsupported node format, ignoring\n");
> -		return;
> -	}
> -
> -	fdt_for_each_subnode(child, fdt, node) {
> -		const __be32 *prop;
> -		const char *uname;
> -		u64 b, s;
> -		int ret;
> -		int len;
> -
> -		if (!of_fdt_device_is_available(fdt, child))
> -			continue;
> -
> -		prop = of_flat_dt_get_addr_size_prop(child, "reg", &len);
> -		if (!prop || !len)
> -			continue;
> -
> -		ret = fdt_validate_reserved_mem_node(child, NULL);
> -		if (ret && ret != -ENODEV)
> -			continue;
> -
> -		of_flat_dt_read_addr_size(prop, 0, &b, &s);
> -		base = b;
> -		size = s;
> -
> -		if (size) {
> -			uname = fdt_get_name(fdt, child, NULL);
> -			fdt_init_reserved_mem_node(child, uname, base, size);
> -		}
> -	}
> -
> -	/* check for overlapping reserved regions */
> -	__rmem_check_for_overlap();
> -}
>  
>  /*
>   * fdt_scan_reserved_mem() - reserve and allocate memory occupied by
>   * reserved memory regions.
>   *
> - * This function is used to scan through the FDT and mark memory occupied
> - * by all static (defined by the "reg" property) reserved memory regions.
> - * Then memory for all dynamic regions (defined by size & alignment) is
> - * allocated, a region specific init function is called and region information
> - * is stored in the reserved_mem array.
> + * This function is used to scan through the FDT and count the number of
> + * reserved memory regions, so the reserved_mem array can be allocated with
> + * the exact size. Then all static (defined by the "reg" property) reserved
> + * memory regions are marked as reserved, memory for all dynamic regions
> + * (defined by size & alignment) is allocated, a region specific init function
> + * is called and region information is stored in the reserved_mem array.
>   */
>  int __init fdt_scan_reserved_mem(void)
>  {
> -	int node, child;
> -	int dynamic_nodes_cnt = 0, count = 0;
> -	int dynamic_nodes[MAX_RESERVED_REGIONS];
> +	struct reserved_mem *array, *map;
> +	size_t array_bytes;
> +	int node, child, cnt;
>  	const void *fdt = initial_boot_params;
>  
>  	node = fdt_path_offset(fdt, "/reserved-memory");
> -	if (node < 0) {
> -		total_reserved_mem_cnt = 0;
> +	if (node < 0)
>  		return -ENODEV;
> -	}
>  
>  	if (__reserved_mem_check_root(node) != 0) {
>  		pr_err("Reserved memory: unsupported node format, ignoring\n");
> -		total_reserved_mem_cnt = 0;
>  		return -EINVAL;
>  	}
>  
> -	fdt_for_each_subnode(child, fdt, node) {
> -		const char *uname;
> -		int err;
> +	/* First pass: count the entries needed for the reserved_mem array */
> +	cnt = count_reserved_mem_nodes(fdt, node);
> +	if (!cnt)
> +		return 0;
>  
> -		if (!of_fdt_device_is_available(fdt, child))
> -			continue;
> +	array_bytes = array_size(cnt, sizeof(*array));
> +	array = memblock_alloc_raw(array_bytes, SMP_CACHE_BYTES);
> +	if (!array) {
> +		pr_err("Failed to allocate memory for reserved_mem array\n");
> +		return -ENOMEM;
> +	}
>  
> -		uname = fdt_get_name(fdt, child, NULL);
> +	map = reserved_mem_array_map(array, array_bytes);
> +	if (!map) {
> +		pr_err("Failed to map memory for reserved_mem array\n");
> +		memblock_free(array, array_bytes);
> +		return -ENOMEM;
> +	}
> +	memset(map, 0, array_bytes);
>  
> -		err = __reserved_mem_reserve_reg(child, uname);
> -		if (!err)
> -			count++;
> +	reserved_mem = map;
> +	total_reserved_mem_cnt = cnt;
>  
> -		/*
> -		 * Save the nodes for the dynamically-placed regions
> -		 * into an array which will be used for allocation right
> -		 * after all the statically-placed regions are reserved
> -		 * or marked as no-map. This is done to avoid dynamically
> -		 * allocating from one of the statically-placed regions.
> -		 */
> -		if (err != -ENOENT || !of_get_flat_dt_prop(child, "size", NULL))
> +	/* Second pass: reserve and initialize the static regions */
> +	fdt_for_each_subnode(child, fdt, node) {
> +		if (!of_fdt_device_is_available(fdt, child))
>  			continue;
>  
> -		if (dynamic_nodes_cnt == MAX_RESERVED_REGIONS) {
> -			pr_err("too many defined dynamic regions, skip '%s'\n",
> -			       uname);
> +		__reserved_mem_reserve_reg(child,
> +					   fdt_get_name(fdt, child, NULL));
> +	}
> +
> +	/*
> +	 * Allocate the dynamically-placed regions only after all the
> +	 * statically-placed regions are reserved or marked as no-map. This
> +	 * is done to avoid dynamically allocating from one of the
> +	 * statically-placed regions.
> +	 */
> +	fdt_for_each_subnode(child, fdt, node) {
> +		int len;
> +
> +		if (!of_fdt_device_is_available(fdt, child) ||
> +		    (of_flat_dt_get_addr_size_prop(child, "reg", &len) && len))
>  			continue;
> -		}
>  
> -		dynamic_nodes[dynamic_nodes_cnt] = child;
> -		dynamic_nodes_cnt++;
> -	}
> -	for (int i = 0; i < dynamic_nodes_cnt; i++) {
> -		const char *uname;
> -		int err;
> -
> -		child = dynamic_nodes[i];
> -		uname = fdt_get_name(fdt, child, NULL);
> -		err = __reserved_mem_alloc_size(child, uname);
> -		if (!err)
> -			count++;
> +		__reserved_mem_alloc_size(child,
> +					  fdt_get_name(fdt, child, NULL));
>  	}
> -	total_reserved_mem_cnt = count;
> +
> +	/* check for overlapping reserved regions */
> +	__rmem_check_for_overlap();
> +
> +	/* Switch to the permanent address of the array */
> +	reserved_mem_array_unmap(map, array_bytes);
> +	reserved_mem = array;
>  	return 0;
>  }
>  

