Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466121;
	b=VMm2dTmr2eIwLIsurTVnlaczeCAq+SF3GB6GMV9SP0A85NNFo6uSo1H4ecSrrHFYT4T1
	 okRMQbnhGR9/HUZ5EA3eEA4O09/BnqdRf753dqJj6DweMZzz3PBxtP2jvxGNtQqp/YHHQ
	 55xhrAzR9phQ+/0oSH6H03kOp1nwFnIOTkTP1grV5Dtr6fzH7HLKI+BgP1+eVYt7RxwzF
	 IXM8XJdo8uvOE+darB06NMwiGXaQ9fkHyN+4SqiWYbMKHuMxEi4a0SjD+zeEspwFDrDPc
	 FpUGaqEzFSg8eBvnKL3fHbOVOE0aXrKTANjVEn17cSsfUEFrkxkaXpFqKKBps0Vyjyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466121;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LUQ//7qrgsHJhp2cav+kGCJj/I5E804GKbiJn2Jl/fc=;
	b=Q6TI26FZzi1zFsNsYbx4OIxPd6zte8DaG4pqqgb8NwgZd2yZuynDK+qtLfIb1UdRNB/y
	 l6TkKQNyd1261QW2eZpOKVYx0TddQAcxoCnf48mYqLBjtd3yf4GqgFlPCxHY5hBRSp+ds
	 Mh6OMmgs2C24yEYT+ID8P7KG59kV3Wkw7tYS2jmGL6PcEG7yr6U4y6UP6Esoch3/8YzwA
	 0Mtxywi586bEg3bnrfAhjsdUdc8FJBa6SJ6lzVI5r8ptF1rtgbjUym8Fo3ke/f6sLfNLf
	 Lw13G1H5YOWDbYOdbedA+vgLj9mP9cVa+nway35sd3VdbE6iW44jPfVaSZYRZOBjuJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b9uKCa2J;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RmWa4Q3e;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBDB606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBDB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b9uKCa2J;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RmWa4Q3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794466120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUQ//7qrgsHJhp2cav+kGCJj/I5E804GKbiJn2Jl/fc=;
	b=b9uKCa2JTFJIyPvE5jGqzr8X9LPFBL6wo63JxUokJEu8ilNQeTzvs4GzuCHiH+oroutUDW
	cpTFTDBQBqVlrKD7i6uc/SDpbicf29gw4/+49rsE+mF9s2SpLtVyR6u5TD5kwwlOGSAkDS
	3MMPVFOf58svaVaEuVgdpggoXzKao98=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-bJHU29ubMOyheoKK7ulDoA-1; Thu, 12 Nov 2026 01:48:38 -0500
X-MC-Unique: bJHU29ubMOyheoKK7ulDoA-1
X-Mimecast-MFC-AGG-ID: bJHU29ubMOyheoKK7ulDoA_1794466117
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4141954a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794466117; x=1795070917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUQ//7qrgsHJhp2cav+kGCJj/I5E804GKbiJn2Jl/fc=;
        b=RmWa4Q3ekbuK/hQnZSaDe+Yp3NGnBJZ+TESotqPJlMP7/mNoqE5+JVXG2Kh0oaz/Y0
         FyrS5C5UC0amSOuuu9T/6yPGIuGM/w8u1mdPCl8DyX/2GuGokj5XNRv41DO2pC7xrufW
         8Zf/QreyyQ9VXI3MYHixsbstCuk1DWn0KvRagl+QQVnme9RleqFBKRv4CM640d/nx2ko
         3puKbMhm/+yMMoPTO5Xa1iFCuCGWGyLbibBzFexBOUiEV+PCGDtwjvmzevWQvsJdf82W
         UFtoYKAN8jJncIJOrw0Z7UyqmtWaS+dr6t5marKe+6sjDAoUTh+rSAS0SHUQLcdsmyai
         PXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466117; x=1795070917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUQ//7qrgsHJhp2cav+kGCJj/I5E804GKbiJn2Jl/fc=;
        b=ILByNy32BCrl3pxXJbvoYCfoECBpY0bmM9MwMDZzMLTPEh3qgDZNNiB9DiiJVqDj8q
         UfQTmysyqbHIBsxyIaeH5Jv4ORaLMtwdqKa81VIUy1beko/deohzs4GFX94JF0wNmaYR
         +Qa+ynJCJ3gkxQbT5vBU8DLbFKfQQUSkSuqGiQ5jdECdd4Ro3pz87u2us826HqE2yEUg
         CLdqLOmXiDpm7Okui3HwnKBA57gL0j879ksjV4v3N3WsUINeZ/SmJKjySDEKjeYHS+xV
         CPxA8/FRjMS1KMN4nckFwbAxB37FwWG5bpzVgOl2a0HC9iEnwgLOOhCm0Vtafb1XbTzr
         LO1Q==
X-Forwarded-Encrypted: i=1; AL+hErFaOTdatCLvd3N3xJSq01Hn6yXVGpxZGwdr73I2+nR7P9YelLkftOlHrR12a3bKdfKQKF8Kfjb0QPIyRYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jbvWv8D039md7SzwqdIKMcKriFCYAkLojl6GOLtdyUY13Wycf
	cQk5YeMwdSPhJv6qegNM99zEbfByzz2056XKlgD9RfVaaw00WhaHwPSIUbwrOi/OlgAHnXSawO1
	6kIuyY8YikHfcea7yzYSSbp3vX8P/gMRUXNI36Jq3BFatbrY4eXhhCDXZtN2FvhyFZQ==
X-Gm-Gg: AYBFou2f15Rk9EQOcFIKnYMBextgrQBW0CAxuqQY7DSSHQzNWO/h9SmmUauWbC0rI31
	DgTHboutzs2FfCDh/8ibPGl3CIbka6Pe9akkNlDtmjsLCM8W+soRfGU/YAqWpntLuuzPriFUD0P
	8VjHmBg8ZEZ0bnP+K4eGf71Sm8HJjKE0N6ILk4Nt0BZAyrE353bbhOG1IJMMU7dRpiYdWepRefA
	LYT3HjxV6uRQNdyy6JRnbfhjQ2okqVGc8NjClIVHISKebcxdwhK/QI6jfawr8xgKeCxGAkvVU9S
	CFrAA7Sm0LAOpVeNOdiIKpVC1/PmN5NytAszhO1M4npWDOJ5Jno5BHrBz3gVv8G6251bfRq2EV5
	/1oPBXJpBxBGXbYK4uhyMK/zfgEC3uG0NLM2QX8pBRYmEy8RR5U8H9vppECkIg0/+ZkTIOFk=
X-Received: by 2002:a17:90b:1f86:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b182e6eb74mr4989600a91.10.1794466117054;
        Wed, 11 Nov 2026 22:48:37 -0800 (PST)
X-Received: by 2002:a17:90b:1f86:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b182e6eb74mr4989576a91.10.1794466116545;
        Wed, 11 Nov 2026 22:48:36 -0800 (PST)
Received: from [192.168.1.102] ([117.207.221.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm2902565a91.15.2026.11.11.22.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 22:48:36 -0800 (PST)
Message-ID: <9b290d87-1413-4981-a296-9d37552e8913@redhat.com>
Date: Thu, 12 Nov 2026 12:18:28 +0530
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
Subject: Re: [PATCH v2 2/3] kho: skip zero-sized lowmem and global bootmem
 areas
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mike,

On 04/11/26 10:20 pm, Mike Rapoport (Microsoft) wrote:
> The lowmem and the global bootmem areas can have zero size, for example
> when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
> either of those areas is explicitly set to zero with kho_bootmem=.
> 
> For a zero-sized allocation memblock returns an address without reserving
> anything, and that empty area is recorded in kho_bootmem. If there is no
> memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
> fails and KHO gets disabled.
> 
> Extract a helper that checks for zero size and allocates memory from
> memblock, and use it to skip empty areas the same way as empty per-node
> areas are skipped.
> 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Chen Pei <cp0613@linux.alibaba.com>
> Closes: https://lore.kernel.org/all/20261026131851.9942-1-cp0613@linux.alibaba.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  kernel/liveupdate/kexec_handover.c | 66 +++++++++++++++++---------------------
>  1 file changed, 30 insertions(+), 36 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 2ac5d94f33fd4..5b1797d1289c8 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -829,6 +829,26 @@ static int __init kho_bootmem_cmp(const void *_a, const void *_b)
>  	return cmp_int(a->addr, b->addr);
>  }
>  
> +static int __init kho_reserve_bootmem_area(phys_addr_t size, phys_addr_t end,
> +					   int nid)
> +{
> +	phys_addr_t addr;
> +
> +	if (!size)
> +		return 0;
> +
> +	addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES, 0, end,
> +					nid, true);
The low memory and global areas are reserved with NUMA_NO_NODE, but
kho_reserve_bootmem_area passes exact_nid = true for them as well.
memblock only uses the flag for a valid node So Pass
numa_valid_node(nid) instant of true.

Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

> +	if (!addr)
> +		return -ENOMEM;
> +
> +	kho_bootmem[kho_bootmem_cnt].addr = addr;
> +	kho_bootmem[kho_bootmem_cnt].size = size;
> +	kho_bootmem_cnt++;
> +
> +	return 0;
> +}
> +
>  /**
>   * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
>   *
> @@ -840,8 +860,8 @@ static int __init kho_bootmem_cmp(const void *_a, const void *_b)
>   */
>  static void __init kho_reserve_bootmem(void)
>  {
> -	int nid, i = 0, max_nr_bootmem;
> -	phys_addr_t addr, size;
> +	int nid, max_nr_bootmem;
> +	phys_addr_t size;
>  
>  	if (!kho_enable)
>  		return;
> @@ -861,66 +881,40 @@ static void __init kho_reserve_bootmem(void)
>  	 * reserve bootmem area in low memory for lowmem allocations in the
>  	 * next kernel
>  	 */
> -	size = bootmem_size_lowmem;
> -	addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES, 0,
> -					 ARCH_LOW_ADDRESS_LIMIT);
> -	if (!addr) {
> +	if (kho_reserve_bootmem_area(bootmem_size_lowmem, ARCH_LOW_ADDRESS_LIMIT,
> +				     NUMA_NO_NODE)) {
>  		pr_err("Failed to reserve lowmem bootmem\n");
>  		goto err_free_bootmem_desc;
>  	}
>  
> -	kho_bootmem[i].addr = addr;
> -	kho_bootmem[i].size = size;
> -	i++;
> -
>  	/* reserve large contiguous area for allocations without nid */
> -	size = bootmem_size_global;
> -	addr = memblock_phys_alloc(size, BOOTMEM_ALIGNMENT_BYTES);
> -	if (!addr) {
> +	if (kho_reserve_bootmem_area(bootmem_size_global,
> +				     MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_NODE)) {
>  		pr_err("Failed to reserve global bootmem\n");
>  		goto err_free_bootmem_areas;
>  	}
>  
> -	kho_bootmem[i].addr = addr;
> -	kho_bootmem[i].size = size;
> -	i++;
> -
>  	/*
>  	 * Loop over nodes that have both memory and are online. Skip
>  	 * memoryless nodes, as we can not allocate bootmem areas there.
>  	 */
>  	for_each_node_state(nid, N_MEMORY) {
> -		size = bootmem_size_node(nid);
> -		if (!size)
> -			continue;
> -
> -		addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES,
> -						0, MEMBLOCK_ALLOC_ACCESSIBLE,
> -						nid, true);
> -		if (!addr) {
> +		if (kho_reserve_bootmem_area(bootmem_size_node(nid),
> +					     MEMBLOCK_ALLOC_ACCESSIBLE, nid)) {
>  			pr_err("Failed to reserve nid %d bootmem\n", nid);
>  			goto err_free_bootmem_areas;
>  		}
> -
> -		kho_bootmem[i].addr = addr;
> -		kho_bootmem[i].size = size;
> -		i++;
>  	}
>  
> -	/*
> -	 * Nodes that needed no bootmem were skipped, so fewer areas than
> -	 * initially estimated may have been reserved.
> -	 */
> -	kho_bootmem_cnt = i;
> -
>  	sort(kho_bootmem, kho_bootmem_cnt, sizeof(*kho_bootmem),
>  	     kho_bootmem_cmp, NULL);
>  
>  	return;
>  
>  err_free_bootmem_areas:
> -	for (i--; i >= 0; i--)
> +	for (int i = kho_bootmem_cnt - 1; i >= 0; i--)
Check the First patch comment on this.

>  		memblock_phys_free(kho_bootmem[i].addr, kho_bootmem[i].size);
> +	kho_bootmem_cnt = 0;
>  err_free_bootmem_desc:
>  	memblock_free(kho_bootmem, max_nr_bootmem * sizeof(*kho_bootmem));
>  err_disable_kho:
> 

-- 
Regards,
Mukesh Pilaniya

