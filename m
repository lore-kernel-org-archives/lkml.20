Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468111;
	b=c3htYt9FXk0V2OcY1xnqOpfMVLjk7jETCVZaVvKNQ50DPpIXUBE1Q4+UUn6IQios+sCY
	 s0aBXHrpu1lFUMp2bPX6+UZL5fq50HrHfQdX9zozfT8FfZC7OL/9UWIMaZ2C0E8LTEMVl
	 CnD4CW725IZ6EtKzn59uwqlYXhRFoKqvJd/l5A12g035ID28K20UmZwB0AZukUUALvjDY
	 5nYxxbemfCoregBv+LyS1uP8oCcqgs2rHR0m4LzY2M6sPuliPrbQM2dh76ESUhbPtnVYL
	 ZdcUCYa4adIW4tNf3t3Ud6U1DIwVC1Vbw4F1EHaf9ua/sq9P+i4HFOrVsV2XiHzv4zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468111;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1b6A2kvQgpqKkzxc5p2W/1olpXK4SEEz0O9LviTyyRY=;
	b=RDTA8I+eHSrwI/jSHljDBaHPexY8yHBTYBO3rAMellxizKVC6kF/w4bXk0NmZ+P12ud4
	 AyaEAsq2nwp09xKY5DSWQWkMdllYrbtqfMW9MIj3m2+V18NJCahwcSx/yBqVtE7bmdI6W
	 Wb7JSFQbMB2oA4vTwRO6CpgU+q8R8jFe6sh2hiy+d7A7346LBMFzt6p+uKWghWIQH1Gbs
	 SET289qHvQMjHfnm1Tr1bRdGY0eEp+JLqfuLYhSwM8b44xonhtzGffS8mM9fm/XgJKB+E
	 YA6uc2IMAbTlba5U3/sQnO0fGfVHWedZuj1FlhuxhPEy6jsvuttcvDg6LWNVbcZEATQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KmKFLwam;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a4Tvvwq+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68513606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68513606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KmKFLwam;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a4Tvvwq+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794468110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1b6A2kvQgpqKkzxc5p2W/1olpXK4SEEz0O9LviTyyRY=;
	b=KmKFLwamsFcabz30kspuI1sgxCuBodO+FdRuTn2P5ordb4h9H+T1cdZbD5SKhywzoub53J
	cS6Ee3jbQQNYwk1WsmbiIO7ug+Ekhq4pXecYs5egyZWgnmdqH112BoRfzvdjCZM2Ns8hHF
	b9RSxrDJoT+7Gh+4EzKfuHbHZqS2a+A=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-z-asppnqM4a5UfkkuIvdOQ-1; Thu, 12 Nov 2026 02:21:49 -0500
X-MC-Unique: z-asppnqM4a5UfkkuIvdOQ-1
X-Mimecast-MFC-AGG-ID: z-asppnqM4a5UfkkuIvdOQ_1794468108
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so256875c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794468108; x=1795072908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b6A2kvQgpqKkzxc5p2W/1olpXK4SEEz0O9LviTyyRY=;
        b=a4Tvvwq+VczrJ5GAI8Xd3P0l34dBi3+Z8qNdTpZaLt2LY6BcqJb6sUCSar4/SNK8UA
         +0hHpUCFsdInyJAv/dkVNwfGdE5KQ0StTFXv6+b21g07v5ebnQjDq94onq85lb8/gGin
         H08RoRvxYGna4Qb4xXS/Bf7OVcS9CogGVLzyLQskGXtUgkf8HZPvN1mfoEWDVNMykook
         cXIxpjoGgQJ3OdVLfhww9RNhEhULwf6MXqEIfvmt7Jt4+74SsOauiMHhdxUSyVAH+QPx
         2IBMOQgpIEDT7iaeatSVeCUr8oV7Gy0Eq1vaNoFGNDUh7v8ag3j0JEwt+yWVxgXNYsEA
         9euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468108; x=1795072908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b6A2kvQgpqKkzxc5p2W/1olpXK4SEEz0O9LviTyyRY=;
        b=TzZ21envQmhJqtHDDBczuFn+Fj3PlfJDYw8bksKKpC+VhalseoCzWMDb4pS2Et4apZ
         HWc4Vtilu5Xf9r0e8v/ni9vY/f7iNnPKxa42z16ovY1e6kWQ3kfFFbR4ihTFATI7+6nR
         Gz45gYcUqxhqUsKpdscqx3sXmOnFSrSyeKSugPTUv9IfPMhWU97bG/ka6VDv3J/b1w9u
         075sasBaOffXfMiYchl1pZ43UhT+m86whd7sh6LPFcn2Uj+qc6v/fk06SILwUzambkp+
         V2e3T2uMl94Qs+ylwxlfOToCgsN35Xq5AeadB8hvVT8secOt9A+aKuD1zOJKa3o8ETyr
         8CHQ==
X-Forwarded-Encrypted: i=1; AL+hErHhEiVpNC1QG+Y1KN/cmH5fn8hjmHsxZ1LaWHTzpKVNiHTJM9QNEXXeFETdLIgZBoh/6kvHhneh+SKmw7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9dh5PyrlbYE7f/YiRRoN/53AaMJpLZorgyNTe+8BOaN47pgj3
	OQzpzh2lUvot2rAoBhd6fHxqnt7M/pKcCxkTPVvJ7uVFD59l1b5VGEsBwP/vyMiokfFYBrh3E8g
	ZYz94pnf7SvJE3qPDc1j9hCfYJ1tadq4p5AM+g/LnQDzZW8BXLY2/DuOf/YT3m4Rphg==
X-Gm-Gg: AYBFou0I+qSrXvr94FnZV8cfgFjgH0ncrmQFlDRqtgPxjmMeU5qbp6Rx4lDMd/IFs+n
	Mn3lv8Bt+aRQfuwKaaB/AjzA3qgBRY53ls9iik+74kITJDIZ/arbyAOiUslkOnxOh33N5/2s/Lx
	0sXU0kKbcyXbh8lc6SzarH3tMQzbJvQttjKc277gJB6FPD8pExE8kmp5YXDkkuY0i8SKO/nMgLj
	x7B+IKyEOlb0rclUpjfLlrP2xxEZ+pvWrKw0QTMbZcC1iU/VvJ4OmvUPzPWV/oWw2Gkm6oGUwzc
	9eeY3XUK9W84UYw120/DnZNX/UK5//WWJXl8Gl6yrjPoZL3g1ajvQNqDKifBc30Kr9yjtvjeIK1
	68GS6Hs6cS2V9lSkPtfdgfTdj6EdFsgCOKhc11nPky5CcArEKv7HRxpuBEm2cbwljijJlmyI=
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b3c02f06bdmr4131962c88.9.1794468107358;
        Wed, 11 Nov 2026 23:21:47 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b3c02f06bdmr4131931c88.9.1794468106682;
        Wed, 11 Nov 2026 23:21:46 -0800 (PST)
Received: from [192.168.1.102] ([117.207.221.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm22991575c88.9.2026.11.11.23.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 23:21:46 -0800 (PST)
Message-ID: <6c57f062-345d-4bb4-9af9-213ef2912d76@redhat.com>
Date: Thu, 12 Nov 2026 12:51:38 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] kho: fix bootmem sizing
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mike,

On 04/11/26 10:20 pm, Mike Rapoport (Microsoft) wrote:
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
The documentation still describes the old layout says __there is always
a boot memory region per node plus one for node-less allocations__,
which stops being true as soon as the global or the lowmem area is
empty, and the lowmem area is not mentioned at all. So please update the
documentation as well.

Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

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
> ---
>  kernel/liveupdate/kexec_handover.c | 93 ++++++++++++++++++++++----------------
>  1 file changed, 54 insertions(+), 39 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 5b1797d1289c8..c4b697a612f67 100644
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
>  }
>  
>  bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
> @@ -899,7 +914,7 @@ static void __init kho_reserve_bootmem(void)
>  	 * memoryless nodes, as we can not allocate bootmem areas there.
>  	 */
>  	for_each_node_state(nid, N_MEMORY) {
> -		if (kho_reserve_bootmem_area(bootmem_size_node(nid),
> +		if (kho_reserve_bootmem_area(bootmem_size_node[nid],
>  					     MEMBLOCK_ALLOC_ACCESSIBLE, nid)) {
>  			pr_err("Failed to reserve nid %d bootmem\n", nid);
>  			goto err_free_bootmem_areas;
> 

-- 
Regards,
Mukesh Pilaniya

