Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009652;
	b=aj8uMpbBshcfsdk9zKQYfsDMXFUIoEKS8vwqdrkzZKtw97UCisTqQAuKJ+sJ51roVIve
	 hAqxc2BlagiXlNMLe/XraC5UGKMgCt/JeHKUWtuLDvn+SxdisCk2KQhw2jdE8t1m5PB1G
	 JRlC0V55IJDJxPL/OOk5syqsr0coG7ENCqhdL+Zuu1j2o/Defnsf+ZDzBCaKeFaAcEDKB
	 sevfnRQwgW4ywt6cGs1mPs2ATn7CZYTbEIH5HQW9h9AcxjyBr/R2UOr9yqt4xegbRLEpL
	 2jktGhhqHVYWM7dfkOloo8M7eSAcpXJjKTmFrFbUCcB6gWgApJVfjUTEIca7VvaNvAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iXaq7loiyCZXJpPum7jLAkZ150cONwu6KiaNott1on4=;
	b=sByKNgdkpdiHANgl7bGlYjXo0gk49zxipbHHwS/UX7f7icAbyVjpMV5zef6sdxKdfMoP
	 3ShImmH66FPaYOIe462Hoy1gQ14f6b5ox+Dcm5oyn7cZi6+EMvoSHEKPf1JoxAuJo5N72
	 DJ9gDWSnBJhiAQbsmwUQLwSUgOoNEe/py7wyLus/1UCDyq9qL7jBF9O3zVx8Xaz0kl3MT
	 5sN+xtx/AUOACsQ0zWdXdn1t8naDEpRdKewhTNNA2CskGTM1IQqqW+ZyjkAZ966BfMsCi
	 Una8KlS4tJ66XWXZVQ6La8eixyU3ByBA9O/WxsL0bhiQQ3xusvZBHGEJwkMT5yeqLKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TeM7Rfz7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4EC606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A4EC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TeM7Rfz7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so7465115e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793009650; x=1793614450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXaq7loiyCZXJpPum7jLAkZ150cONwu6KiaNott1on4=;
        b=TeM7Rfz7sDmJNZdou1uZ4A0v5HYZhJadfq6OCh1Bda+1K3QGRhzgfEE8G9YHoqWJhe
         omqrOdKXT19qIE0nS1B/6qqAbd9Ad3jk7O6Izkw4Au9+AVxGspnZ2UAED4VZSYewVKKi
         LD4FawKSfmySJZeRXNc3ZZEyghp+csX0yujzLtdpRwp5zIypBmfLETXrJFhmNmLk2Mmc
         Vz8sUsKI9ZohNZG/JhUXuAFLSJe+gv8CcykH2NYnyhylCJcbP501U6R8qfw/AtlFrSo5
         GPFZ8d1mnw8PzG8DedTOCWwwNbbPL0rsnEEK97JoZpHpcQ5pw04Zos8LFhzBvfnp0PPu
         PK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009650; x=1793614450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXaq7loiyCZXJpPum7jLAkZ150cONwu6KiaNott1on4=;
        b=co3J8DAl51Oi+R+JaU6XRkuXlPGzR2Yg1YOPcNwRAbydtVT7VfBWKzEi7T1Cac5H60
         w8lo2ENVnkpkbmbcB+kqhM5gSLgPg8D06Q3t/P7NtfJm+u9CfHhRLdkz+QzpDugg3Kcx
         bec8tLn38TXxM3mFY5/Tus4yKH78e+9JvsuQOiaqrHGcZwbvsl3y1Hv3bnx61cY/nGzh
         I/dZ3+G1vzaVpvF9Ewj40ApwH44NsrvulRagVP7KfkzVFhSzdwllnm0HrpC0o8Spcg1K
         ZslVLB+z5eumXfmFXSyQgi75psUuPtPpFjJ1hcYpqEUR1cMxDkMh/e9W9h1LpfAydBSA
         PTtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOWNfBryidUHgfR5gnDY2tfowqxHtOAKdOVG5ILO8Aj00ZdHvBQi3q72UPhiSn2ZOZhDC/lL6rRv0k3aU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIisz2UjLJxMJuO0oqJ0bbRgoc21ENi9UHeh/UDQOxBFds7NYs
	HpqGxNDr+Es64JcAL5Xe0WfoWsORrdl9R6UF9hRRA5RYjP0BQTbgzKDlJNZDKQ3x5YU=
X-Gm-Gg: AYBFou20Tl/xAit9tFfcSgEIqskBpTTI4Ri2MOASDLbR6Mkh/UBLbdDDGgIw3Jc/bzJ
	e1tqloNUQQnYzwEj4AD0h7PvhnLpEyT2uxf/+v4Qyhr6unUmoyL8In7Zbk+jmVcdXJte8zT2ZeE
	bxErqTIkJ/6yg1/nhhjhdTd+v4C467Ur3Uu5bhMQ/V8kyR2NmR3JVSQ/UE/qaxC+MnNSBJB3v2F
	43T8mAGYtnHWGGeU4bAmNZa7SLNeEqPP+gjsweqo5j4FsYM4/15+LAlenA2mqD+2e9q/WWuYPWp
	+Y7x3nr1NJRC3pXTFSy+1I0nPa6P/WTpMGhOVx+5uwxabDozdHK5MaKuA0dZf9XXkKyvq8HquAs
	wyaPNJIMALdF0M+N9ySfa6DrPT1LmNYeFUwpYsnignqFrWAS0xQTOsyU2Sqxh22zwQZsclwoLk0
	ClFiIfG0rRw3rhMzT/k6643957EWbLT5WyRe2YKw/2sKWwdpABEKNSTNoQTHNlVA+mYG1Mv62pd
	60x0Azu02fWVUrWPjGhMErFfhKFDG4Dlc4UU/1AfuIX8vAhIWK1Inj3bwAV
X-Received: by 2002:a05:600c:37c4:b0:4a2:ebb:397b with SMTP id 5b1f17b1804b1-4a35ac7f0e8mr106124935e9.11.1793009649890;
        Mon, 26 Oct 2026 03:14:09 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48fasm15523708f8f.31.2026.10.26.03.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:14:09 -0700 (PDT)
Message-ID: <e159d724-d311-4341-b58e-794915d01c21@linaro.org>
Date: Mon, 26 Oct 2026 10:14:07 +0000
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
Subject: Re: [PATCH] Revert "perf/aux: Allocate non-contiguous AUX pages by
 default"
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Michiel van Tol <michiel.vantol@arm.com>, Dev Jain <dev.jain@arm.com>
References: <20261025-perf_revert_prefer_large_alloc-v1-1-5fb431bbd624@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261025-perf_revert_prefer_large_alloc-v1-1-5fb431bbd624@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/10/2026 16:24, Leo Yan wrote:
> This reverts commit 18049c8cff9cc89daadc4df6975f7d9069638926.
> 
> The original commit claimed that contiguous AUX pages unnecessarily
> exacerbate fragmentation for SPE, TRBE and ETR. This is not generally
> valid: larger allocations can keep pages with the same lifetime
> together, while order-0 allocations can scatter them across large
> blocks and prevent free pages from coalescing [1]. The follow-up
> discussion [2] has not established how forcing order-0 allocations
> addresses the reported problem.
> 
> TRBE and SPE write to virtually addressed buffers. The TRBE L1 TLB
> has one entry on Neoverse V2 [3] and two on Neoverse V3 [4]. Small
> mappings increase translation pressure, and TTW stalls can contribute
> to FIFO overflow and trace loss on TRBE.
> 
> Larger allocations provide contiguous, aligned chunks for PMD or
> contiguous-PTE mappings with the proposed vmap() support [5].
> With the proposed vmap() support already applied, the tests in [2]
> showed that preferring larger AUX allocations reduced L2 data TLB
> refills by 99.68% in the TRBE test and 34.74% in the SPE test.
> 
> Restore the previous policy of trying higher-order allocations first.
> The allocator already uses __GFP_NORETRY and falls back to smaller
> orders, including order 0, when larger allocations fail.
> 
> Remove PERF_PMU_CAP_AUX_PREFER_LARGE, since the restored default
> provides that preference. Intel PT retains its existing allocation
> behaviour, with no functional change.
> 
> [1] https://lore.kernel.org/all/aPjrRkjiIt6HmXmT@casper.infradead.org/
> [2] https://lore.kernel.org/linux-arm-kernel/20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com/
> [3] https://documentation-service.arm.com/static/633fe1ec4c59b30b517730b8#page=52
> [4] https://documentation-service.arm.com/static/67361bd2c7fc0d1f211da382#page=54
> [5] https://lore.kernel.org/linux-mm/20260715120813.3609949-1-jiangwen6@xiaomi.com/
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   arch/x86/events/intel/pt.c  |  2 --
>   include/linux/perf_event.h  |  5 ++---
>   kernel/events/ring_buffer.c | 29 +++++++++--------------------
>   3 files changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
> index 49349afee6119fb6fad815c847cb3cd9daa97604..3782af40f0832a874a7f0b60961d6652513de241 100644
> --- a/arch/x86/events/intel/pt.c
> +++ b/arch/x86/events/intel/pt.c
> @@ -1896,8 +1896,6 @@ static __init int pt_init(void)
>   
>   	if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
>   		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_NO_SG;
> -	else
> -		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_PREFER_LARGE;
>   
>   	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
>   					   PERF_PMU_CAP_ITRACE |
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index eb3f7bab498ca9bee9ce7193744943b24ab2e0c5..b8d8b005f5c8a7c1def7cad02230bf9ffb876bd6 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -304,9 +304,8 @@ struct perf_event_pmu_context;
>   #define PERF_PMU_CAP_AUX_OUTPUT		0x0080
>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
>   #define PERF_PMU_CAP_AUX_PAUSE		0x0200
> -#define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
> -#define PERF_PMU_CAP_MEDIATED_VPMU	0x0800
> -#define PERF_PMU_CAP_SIMD_REGS		0x1000
> +#define PERF_PMU_CAP_MEDIATED_VPMU	0x0400
> +#define PERF_PMU_CAP_SIMD_REGS		0x0800
>   
>   /**
>    * pmu::scope
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 64d4dbdc6c071b72b670dd044616f52981206ae8..95f4fbdfd2764de5b72d901d778c46302f525fad 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -684,15 +684,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   {
>   	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
>   	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
> -	bool use_contiguous_pages = event->pmu->capabilities & (
> -		PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_AUX_PREFER_LARGE);
> -	/*
> -	 * Initialize max_order to 0 for page allocation. This allocates single
> -	 * pages to minimize memory fragmentation. This is overridden if the
> -	 * PMU needs or prefers contiguous pages (use_contiguous_pages = true).
> -	 */
> -	int max_order = 0;
> -	int ret = -ENOMEM;
> +	int ret = -ENOMEM, max_order;
>   
>   	if (!has_aux(event))
>   		return -EOPNOTSUPP;
> @@ -702,8 +694,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   
>   	if (!overwrite) {
>   		/*
> -		 * Watermark defaults to half the buffer, to aid PMU drivers
> -		 * in double buffering.
> +		 * Watermark defaults to half the buffer, and so does the
> +		 * max_order, to aid PMU drivers in double buffering.
>   		 */
>   		if (!watermark)
>   			watermark = min_t(unsigned long,
> @@ -711,19 +703,16 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
>   
>   		/*
> -		 * If using contiguous pages, use aux_watermark as the basis
> -		 * for chunking to help PMU drivers honor the watermark.
> +		 * Use aux_watermark as the basis for chunking to
> +		 * help PMU drivers honor the watermark.
>   		 */
> -		if (use_contiguous_pages)
> -			max_order = get_order(watermark);
> +		max_order = get_order(watermark);
>   	} else {
>   		/*
> -		 * If using contiguous pages, we need to start with the
> -		 * max_order that fits in nr_pages, not the other way around,
> -		 * hence ilog2() and not get_order.
> +		 * We need to start with the max_order that fits in nr_pages,
> +		 * not the other way around, hence ilog2() and not get_order.
>   		 */
> -		if (use_contiguous_pages)
> -			max_order = ilog2(nr_pages);
> +		max_order = ilog2(nr_pages);
>   		watermark = 0;
>   	}
>   
> 
> ---
> base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
> change-id: 20261025-perf_revert_prefer_large_alloc-a0177d6379f6
> 
> Best regards,


Reviewed-by: James Clark <james.clark@linaro.org>


