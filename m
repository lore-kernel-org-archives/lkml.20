Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818631;
	b=rtNXZbPr8dsB56xe9Nf282LNs63hzjPgo48dkibPXSDI+CUx7uicvNIMS4tWmVX4qE1m
	 JM33/U3C+DKFosUMrBVACWMsF0j6++tv2ozP5JsGKc9N761wwTvpADH9orv+rACjNRPLV
	 qfmxhgVQC/PlTk6ONQVW6z+0SooWPU9wJGHxt0/dXKlZ8ZFVeEf+/jaBVlwn8WeO6oTNn
	 NA29FmPULzvrMk4WpdC3B2gzX18TEixjx2LGgVTjGFuphbGhPH6NB0ERld4d6t/3sfdTv
	 O/xDikM2P3dhYQ86eRtrXA5kHuMyDAxyC+yL3e/0f4FI++wFYHazCUeq/IaiApcIzsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iDac3SJ3sAacdSf0W+GWhjMPaQx0+h6n24uVhknSWmw=;
	b=c81fNDG6AXMQm5xr2TVE6u2hT9KTwysyx86bIMjN2TedslmtKuXM1H+4WhfB06fYvVvd
	 m4921Yo666R6Bi07Zd/U8qIRTEwXcaQCyWAuwQszuApaWs3ouRN6P8G/DKQvA+NlzN4z2
	 2/eEJ2VpLFL7bDS+anqXz7VBc1iqRZtNxc4P2TI7FczCsynkicLav/OkSsqKgEZk9zxyc
	 IUyV3Wd8gsVK2NyU1uQS0iOb8oK8B3nti3qYRKnB8kkuNRiqH9QzEt+YoUmgkNiiI8A41
	 gl6W7M2evibmJ2amkUT7fY4Sx29Y7I6F0vBFpWNSER5+AB3pK7GIIsiDZqCqm0P5Xag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iFoXpEOx;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D5660A261C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D5660A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iFoXpEOx
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9906034086cso281420241.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793818630; x=1794423430; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iDac3SJ3sAacdSf0W+GWhjMPaQx0+h6n24uVhknSWmw=;
        b=iFoXpEOxcaRNWZQZZtMnN2LMhpVdgKwyyIMkxTa8X+0CyPHcXwtbm6S5fJhVN2/IUb
         /ZnINOI03bwETH7+UOBT3RPxn+2FAFxONsZQ4d5rTKU8xs8a1mHfJfm1a4N932bFcejY
         e/xrRGhdR5rig9hTBpD1WKsH3jIrVSP57yu4z3T8IYm9UpSR2Pw2IYXyK7JxPj1M/YRS
         GJxlkGFn5/ms+78tkKVP0GGhnuzXQMS6VHylgWIUdrdn2pLC+EnhhA4ZsIGTJF3X1eGW
         0Te8d+Nn0Ly00wPl76htnevWRTAe3P/XMssLeq2OyiQRBqmeK2WXxSN0SDsqcxz/LM+W
         27QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818630; x=1794423430;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDac3SJ3sAacdSf0W+GWhjMPaQx0+h6n24uVhknSWmw=;
        b=PeBDUWlptcrJ+HqEM9ADFbTkD5hzdFXzvomJyd2sTSk3TklBHjTfumz09qdZP9Tj46
         WtJPRSRKI3y2hoOzK9KuPHHqkgtxlJMsxSJV/qpqTwrxng3lgOC78YaCgx6PiqeIV97r
         pgP570UTdjR9+D1prc8ecGswWTzlpQHf9O486r4vqym1NGUB1LCkxVJVDuhhXmDq23sO
         eyTvfGf5sVzHMSh+c57hXe5twejkmTQWm3GbsDi4Wf2EXb5C5BrZy9FkxrJnD1+gTOAN
         3anDZgYG0zTOwNf4kb5WhBQ8r370UTx26zkGn2ajFyogmXIpOlgZfjff3cmG6BFI6X+p
         IEDQ==
X-Forwarded-Encrypted: i=1; AKwUvBweDd3HtKfF68ST3KxUHzy3EM38d6vdttFPUqMt00t1XbwxByzmkM7oj1aXE4OXkwfrU5CCKZrLK1FjvcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X+NK5raWoBh/3JH5X8vHYwFnM5Qq3Bu+tpTJyNPw34g8Q5u9H
	qR5pTvq8lynL0D9sJ2x3iP36vfmnrGAtAWHqgCwKpEJ7O1nhP1qpJdtBnRQqwNB9Cnc=
X-Gm-Gg: AYBFou33uLkweIX30/HxzH5cbTrpZd49Ofh6w2Q9UtdqYUrWzST+OticZsllwCLDaE+
	zs8Q6KMocIaIefIRuFXfLuHSTE/RK3oZfETKFYvJCp8LcyCK23XFFYhjuf0BlyZFm/0wEvXLP5D
	VZOxsq0hejYM38+bAidxzNz9m/f2+AeU4ZMpkT6fX3lH1enCLyxaK5/3xFOXS8T3tcwlcMO4pG5
	U0h6rSTNFE6ymNOoYxXUiAwfLy8InazqTkR2/1GmSV7KTQeAwJJ3l977M9yda402ZdckZrmUuiP
	+0kMTp0TSSHHo2CPLTreMfBUG3U24fITkPgtd1Vw2TZpG+w7ZoGTcpNGT10jLVCbHIucFjuldyf
	zmZD8+OxgO6ryp8W34KIAXQc4Njt9ayqeFs4eLx8lcrKHe63aV62BNbDAdWawGMy7HX6A0tv1wb
	cOsnvtTdYHXY+fUwluFcTVH556Hs76W+dj3nW1jnS6l19Vv7AZnIA0xAtCfor8ODrYy+TU0tMuv
	Ql+OVi9lJdViL9xPrivCszCCh5YPius5hVyWdnyMq2pvoyXsa9OhRZRSOa6uorvxrKrqBPQdj6H
	4dxymij6j3BjH/lGFQlEIec9T4x/okwblUl/gse7QbdHU6MUfM70PhPHuQO2QLfEScFv9rlsv03
	QjwVD5X8S/5vGssxHU4BtM3hJRmRZapAADJdzgD5c8A7c
X-Received: by 2002:a05:6102:3f8b:b0:7b5:4700:3a6a with SMTP id ada2fe7eead31-7d07267f972mr6534578137.26.1793818629622;
        Wed, 04 Nov 2026 10:57:09 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-999f3006224sm736210241.9.2026.11.04.10.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:57:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/3] kho: fix bootmem sizing
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
Date: Wed, 04 Nov 2026 13:57:03 -0500
Message-Id: <179381862329.2089669.11972657670874869389.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6733;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=8NqiYICk6wvIGUqgp0gIb5QmvDxLmCEuClGbEqhbbDE=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq64ACI6dHufVqtKRAfASZU9NnRUoz33nR3D/hW
 5PGUMiqqByJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauuAAgAKCRC7dyhM23N6
 3q47D/460EB5pARhfkcmCTGOpBx3BVr9a19rLtkQ6IrAevVjF5Usw/TPnwMpU8Ix3kYcbE2HpHO
 g/wizPi9m2UDvdGZX+7Z/UfLYhxq0nc8wtN95e8YGoDhxZUT6qrSX9Uy8bQE2roqYWqsSF1LJgr
 ZJDQBstGnNLSC8oc36m1rwMPmaewALX69WBBsjBiYxjfscHWjSaiLLhL7g1FMDNf9RxWf79NR7d
 daUDV1DoFeNVbe/o+AcvafKPuZfrbfxtikuln4wO6d/0xM+cOy7o31nTslA1XtaWA9DpqlpyifJ
 bV1NjvAMnKfmwiGFYPH1HBAd6BbWxOEhR4I2aJfD9DT9AhwSqrgZMN+H04cflhGprYEIg2Axsdi
 mWLd/R7OYvsdqeZOOKgL5SUHJ6fzeg1pfefjwn2KFervJjfpBqonfzHoR0+bNG5NPYqmNluH0D5
 wlKiEhcRbG33gj6aQuOrXZeYXyXnn6GMogLZgahuIydGI6HBaCWj2P40bbD7sEK8N+QcRCu7GQT
 6tyG+UwuSRYLuUHCe1BYooIhGvmF+tMXM1kQZpvDfZbaAccsD+sgjbXfA7MrvdyTBxcjNS/nl2y
 5SnK4Y4e909G3Z1kx2p6aqysRv3f0nT0ytC4EmB1JStQWhVaLQHJGiYuNbf2GDPCNn0A84Lvcpr
 zcKUMYSVpL4L+ug==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Bootmem areas are sized from overlapping views of the memory reserved in
> memblock:
> 
> * the global area is sized from all reserved memory, including memory
>   allocated on specific nodes, so on NUMA systems everything allocated
>   on a node is accounted in both the global area and the area of that
>   node.
> * per-node sizes are calculated after the lowmem and the global areas
>   are reserved. With CONFIG_NUMA=n all memblock regions belong to node 0,
>   so the lowmem and the global areas are accounted in the size of node 0
>   area and scaled once again.
> 
> As a result, bootmem is about twice bigger than it should be on NUMA
> systems and about four times bigger with CONFIG_NUMA=n. On small systems
> reservation of the bootmem may fail and then KHO gets disabled.
> 
> Make the areas cover separate parts of the reserved memory: the lowmem
> area covers allocations below ARCH_LOW_ADDRESS_LIMIT, per-node areas
> cover allocations above it on each node and the global area covers
> allocations that are not bound to any node. Calculate all sizes before
> reserving any of the areas.
> 
> With CONFIG_NUMA=n the global area becomes empty and it is not reserved.
> 
> If ARCH_LOW_ADDRESS_LIMIT covers all memory, as may happen on arm64, any
> area can serve lowmem allocations, so don't reserve the lowmem area.
> 
> Bootmem sizes in MiB in x86 QEMU VMs, before -> after:
> 
>                      CONFIG_NUMA=y     CONFIG_NUMA=n
>   1G,  1 node         176 ->   92       320 ->   80
>   4G,  1 node         508 ->  332      1264 ->  316
>   16G, 2 nodes       1268 ->  704      2944 ->  736
>   32G, 4 nodes       2296 -> 1224      5196 -> 1300
>   64G, 4 nodes       4344 -> 2248      9664 -> 2420
> 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Kexin Liu <liukexin@kylinos.cn>
> Reported-by: George Guo <guodongtai@kylinos.cn>
> Closes: https://lore.kernel.org/all/20260904025101.9959-1-dongtai.guo@linux.dev
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Closes: https://lore.kernel.org/all/20260922131217.698809-1-sourabhjain@linux.ibm.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 5b1797d1289c..c4b697a612f6 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -685,6 +685,7 @@ static unsigned int bootmem_scale __initdata = 200;
>  static phys_addr_t bootmem_size_global __initdata;
>  static phys_addr_t bootmem_size_pernode __initdata;
>  static phys_addr_t bootmem_size_lowmem __initdata;
> +static phys_addr_t bootmem_size_node[MAX_NUMNODES] __initdata;
>  
>  static int __init kho_parse_bootmem_size(char *p)
>  {
> @@ -754,29 +755,58 @@ static int __init kho_parse_bootmem_size(char *p)
>  }
>  early_param("kho_bootmem", kho_parse_bootmem_size);
>  
> +static phys_addr_t __init reserved_mem_size(phys_addr_t limit, int nid)
> +{
> +	return memblock_reserved_kern_size(limit, nid) -
> +	       memblock_reserved_hugetlb_size(limit, nid);
> +}
> +
> +static phys_addr_t __init bootmem_scale_size(phys_addr_t size)
> +{
> +	return size * bootmem_scale / 100;
> +}
> +
> +/*
> + * The lowmem area covers allocations below ARCH_LOW_ADDRESS_LIMIT, per-node
> + * areas cover allocations above it on each node and the global area covers
> + * allocations that are not bound to any node.
> + *
> + * The reserved memory on a node and the total reserved memory include
> + * lowmem, so it is subtracted from both.
> + *
> + * If ARCH_LOW_ADDRESS_LIMIT covers all memory, any area can serve lowmem
> + * allocations and there is no lowmem area.
> + *
> + * All sizes must be calculated before any area is reserved, otherwise the
> + * areas reserved first will be accounted in the sizes of the others.
> + */
>  static void __init bootmem_size_update(void)
>  {
> -	/*
> -	 * If fixed sizes are not provided via command line, calculate them now.
> -	 * Remove HugeTLB allocations from it because they never get allocated
> -	 * from bootmem.
> -	 */
> +	int nid;
> +
>  	if (bootmem_scale) {
> -		phys_addr_t size;
> -
> -		size = memblock_reserved_kern_size(ARCH_LOW_ADDRESS_LIMIT,
> -						   NUMA_NO_NODE);
> -		size -= memblock_reserved_hugetlb_size(ARCH_LOW_ADDRESS_LIMIT,
> -						       NUMA_NO_NODE);
> -		size = size * bootmem_scale / 100;
> -		bootmem_size_lowmem = size;
> -
> -		size = memblock_reserved_kern_size(MEMBLOCK_ALLOC_ANYWHERE,
> -						   NUMA_NO_NODE);
> -		size -= memblock_reserved_hugetlb_size(MEMBLOCK_ALLOC_ANYWHERE,
> -						       NUMA_NO_NODE);
> -		size = size * bootmem_scale / 100 - bootmem_size_lowmem;
> -		bootmem_size_global = size;
> +		phys_addr_t low_limit = ARCH_LOW_ADDRESS_LIMIT;
> +		phys_addr_t lowmem, global, size;
> +
> +		if (low_limit >= memblock_end_of_DRAM() - 1)
> +			low_limit = 0;
> +
> +		lowmem = reserved_mem_size(low_limit, NUMA_NO_NODE);
> +		global = reserved_mem_size(MEMBLOCK_ALLOC_ANYWHERE, NUMA_NO_NODE);
> +		global -= lowmem;
> +
> +		for_each_node_state(nid, N_MEMORY) {
> +			size = reserved_mem_size(MEMBLOCK_ALLOC_ANYWHERE, nid) -
> +			       reserved_mem_size(low_limit, nid);
> +			bootmem_size_node[nid] = bootmem_scale_size(size);
> +			global -= size;
> +		}
> +
> +		bootmem_size_lowmem = bootmem_scale_size(lowmem);
> +		bootmem_size_global = bootmem_scale_size(global);
> +	} else {
> +		for_each_node_state(nid, N_MEMORY)
> +			bootmem_size_node[nid] = bootmem_size_pernode;
>  	}
>  
>  	/*
> @@ -785,24 +815,9 @@ static void __init bootmem_size_update(void)
>  	 */
>  	bootmem_size_lowmem = round_up(bootmem_size_lowmem, BOOTMEM_ALIGNMENT_BYTES);
>  	bootmem_size_global = round_up(bootmem_size_global, BOOTMEM_ALIGNMENT_BYTES);
> -}
> -
> -static phys_addr_t __init bootmem_size_node(int nid)
> -{
> -	phys_addr_t size;
> -
> -	if (bootmem_scale) {
> -		size = memblock_reserved_kern_size(MEMBLOCK_ALLOC_ANYWHERE,
> -						   nid);
> -		/* Do not count HugeTLB pages. */
> -		size -= memblock_reserved_hugetlb_size(MEMBLOCK_ALLOC_ANYWHERE,
> -						       nid);
> -		size = size * bootmem_scale / 100;
> -	} else {
> -		size = bootmem_size_pernode;
> -	}
> -
> -	return round_up(size, BOOTMEM_ALIGNMENT_BYTES);
> +	for_each_node_state(nid, N_MEMORY)
> +		bootmem_size_node[nid] = round_up(bootmem_size_node[nid],
> +						  BOOTMEM_ALIGNMENT_BYTES);

Nit, but I prefer to avoid multi-line indented statements without 
braces. Just put a braces around the above.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

