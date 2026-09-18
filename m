Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5714137A2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719745; cv=none; b=FyUByKX11Oq48q1o8TtU9tWUIH9RCIcd3xlfF88PPbLE2AAftyA3n2FdhE3rv9SgG8SV+K/7A3ZUnkKImIYaKngV3hSCvglM3oRJ6Pv8r26ydm27GuHCDJw4y0QLnnSStp485FAPjUKmd5CVFcGleSHwIjK+/LPzFkVzAiiN5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719745; c=relaxed/simple;
	bh=b7SZRiTdPjaH75CaQCp3RCsjKZl29SheZjvophXkDdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXJwK3RBpUcSSxYdSOb/05ea/YA9EzHFdBqpNMuOkL2ZCiAmVziqrQjaxsIHgW7yHHC1E2ffViXpD0KfekrpEIJ9QTfk+bxsb1ag+s6H/3d5hwiQzfXYChO6AQqoDmtw0UfQVuAt03P7y7+84ICXuk1YLDhC6Uro7RtwNTgWlTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3kyv6bk; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3kyv6bk"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6fbdc8772so2518695ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789719742; x=1790324542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjigVRuOlpSLvwuFF0kw47lERwh/eIzaGM/o/mwNyVQ=;
        b=h3kyv6bkfvOurMS8Vxjiyw950RnY3q/94qxxzKLE2N4qEcfv03k+v3o99egdd6mL81
         5+gXGi7PlYYpFi0cakG8fwYYxrtkM/KEBeucGHbfTpzHLaIRS4BGYaVHToMvBejEjIJT
         co9EVCVju1WQvtOFHwHmV9MlRtGu35aD/M/QvGH5dbGK6wWORoyVuUsCrbB/U/tdG4EY
         850jC98Ywxk19rX6nzgwn2iGYP7blboWbXLj64WV7oknzH5ydQY5K73y/iuQivEpa1nl
         r/CbD+qBSvmEYNfHAZSmR/dhzVW+UkrzgjMuJzAbE+5ckheOBugMJdHv6ULWm0fq9lSW
         iWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719742; x=1790324542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjigVRuOlpSLvwuFF0kw47lERwh/eIzaGM/o/mwNyVQ=;
        b=WHZFmPbYQvDJXF5vmeYmhVoySzzXi8wmqwqt9TG78Hm6l4DoXpJQNMjW+lQfF/ruyn
         n84JxG4gNyyIohjcLpoFhh1DMxqxNit/P6Q93W6UAyrPT4C3UB2pTNIfV3Rq/4eUPVli
         J8XqVqgR/IY8kiumERQgXuYFx/w045RiRMuM0VnxcwS6qNKPJMdu2p6K6VtvQvYqwz04
         ETJufLvPSQqiL/pzpmDb/pwI+bDPpUUOgN4zF1Hc2ZlZbEg473QPQJYmmueO0/mXvxlj
         kSoNHLyLLnrBcFmuzdRGUKdt1DOKnp9KsxWxgSt+lCXdOVtpI2tr1CWb27dGRVryaNrh
         A3AA==
X-Forwarded-Encrypted: i=1; AKwUvBy28ZXmRX9EzRZfNR5vSht0BZiRY/VFu6YbsxGHEa2SQPyzMa4yuFoBpEpgO+Z03GYf2VI58mbuHVBdOmw=@vger.kernel.org
X-Gm-Message-State: AFuF++mNGud6AjC7YbKzeKRDaNGpwuROj4libqxkq8VSy8qN7Kn/WmEU
	WX8M6JGuVdgcTfF0f5KV89OkO7Kn1b+8C9oR69L696cu2OQfnX6YEE2F
X-Gm-Gg: AYBFou2giN7O8Qcx6M1bIplLvedJ8f8ERYMWb/Zd+nKQOHd8TeqW8vk3h0tn+XB8TMY
	MukqyBc8dNT1afwflfdmOvijjJdTKkaCYCBAUzd2Xb6b7CdisjJTAyrCRS/MEPRy1z1J933muDx
	i+z6QXxlKUm/bO/z6QTjWw9IhXFInZgAa5AuE1x3VDUq7l97r0rVA6E1Rh5g19BHDBFR8JIhtdj
	bdR7rBHtYh91Ohn5L3JQ+W7SAriZ7cEGUn40hTRMVrsDA+w+grBZ4yOwF6sfGS1QfqkQ8zCXYgW
	xIgZqUdC6UmdvXiGvY6vDz5L5fJdQ6h33Wlka3j4YgA6BqdFB9I0aNJpUkv8jpBo1RTaioYfY8l
	OYksWT88Ui9VmzMcNAXOPS5XvRqSB+AqmM25MB1m+zvcrRXauJrrcFu/U3F1Gzs7mKbMSn/jLap
	PPHG0wCjQm6HKwWBhUqGA0x+bKBd0+u5jov1MzthtUaqK08Pj7yB0fKV72mxh0lUl5X4ErTRqwR
	rLAgg==
X-Received: by 2002:a05:6a00:4196:b0:874:708d:b637 with SMTP id d2e1a72fcca58-874df800839mr3426122b3a.35.1789719741686;
        Fri, 18 Sep 2026 01:22:21 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e79f1sm541488a12.30.2026.09.18.01.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:22:20 -0700 (PDT)
Message-ID: <bc6cf467-84d1-40a0-b570-1b5256a6e2e2@gmail.com>
Date: Fri, 18 Sep 2026 16:22:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
To: Baoquan He <baoquan.he@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-7-chenwandun1@gmail.com> <aqzxavL91icLw-Xv@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aqzxavL91icLw-Xv@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/26 16:08, Baoquan He wrote:
> On 09/02/26 at 03:31pm, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Add MEMBLOCK_NODUMP to mark regions that should be excluded from
>> kdump vmcores.
>>
>> The flag is meant for reserved memory that carries no data useful for
>> crash analysis. Reusable reserved regions such as CMA may hold useful
>> data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
>> patches wire this up for /reserved-memory and /memreserve/ entries.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
>> ---
>>  include/linux/memblock.h |  9 +++++++++
>>  mm/memblock.c            | 16 ++++++++++++++++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
>> index d62db9e776cf..b2fcf11fba2b 100644
>> --- a/include/linux/memblock.h
>> +++ b/include/linux/memblock.h
>> @@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
>>   * kernel that we know is good to use. It is the only memory that
>>   * allocations may happen from in this phase.
>>   * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
>> + * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
>> + * for crash analysis (e.g. firmware carveouts).
>>   */
>>  enum memblock_flags {
>>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
>> @@ -63,6 +65,7 @@ enum memblock_flags {
>>  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
>>  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
>>  	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
>> +	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
>>  };
>>  
>>  /**
>> @@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
>>  int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
>>  int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
>>  int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
>> +int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
>>  
>>  void memblock_free(void *ptr, size_t size);
>>  void reset_all_zones_managed_pages(void);
>> @@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
>>  	return m->flags & MEMBLOCK_KHO_SCRATCH;
>>  }
>>  
>> +static inline bool memblock_is_nodump(struct memblock_region *m)
>> +{
>> +	return m->flags & MEMBLOCK_NODUMP;
>> +}
>> +
>>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>>  			    unsigned long  *end_pfn);
>>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index f2952d725c10..2e87f39826dd 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
>>  				    MEMBLOCK_KHO_SCRATCH);
>>  }
>>  
>> +/**
>> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
>> + * @base: the base phys addr of the region
>> + * @size: the size of the region
>> + *
>> + * Mark the region as not to be included in crash dumps.
>> + *
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
>       ~~~~~~~~~~~~~~^
> Is it impossible to use at runtime even thought it claims to be generic?
It is currently only used during initialization, so I added __init_memblock.

If other modules need to use this function in the future, this annotation can
be removed.

Best regards,
Wandun>
> 
>> +{
>> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
>> +				    MEMBLOCK_NODUMP);
>> +}
>> +
>>  static bool should_skip_region(struct memblock_type *type,
>>  			       struct memblock_region *m,
>>  			       int nid, int flags)
>> @@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>>  	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
>> +	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
>>  };
>>  
>>  static int memblock_debug_show(struct seq_file *m, void *private)
>> -- 
>> 2.43.0
>>

