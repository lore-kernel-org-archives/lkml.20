Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EE62DC32C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181469; cv=none; b=o1Cy3Ci8ICSpo34/wHNWisYe5utZIy/WaLRSNvH9WxjRR/m+7dfJqYVEFPCYqE/8XzNDRBzahLKdo51JscE5qd6skB2NHGL2stBFfeuthIqplqAdX3tzpDrljqatnEEB6QyTxci+S45LOEmXLb6Q0S9+ZfH9gKkyydeGsZdDGAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181469; c=relaxed/simple;
	bh=F0et+Fz9Kt0Eyd9zG1eiBwM5AK8eogkOJdk/QflmSLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I062HyyTo30Z+qUPQbnhyfCnpkPM99PaGRY8al58sOF8NGE00Cg0H64Ta90pyKkL2ECb8HFIjQrY5xcwTGwGDDiCd25mH+T2No8H1teW6fipgbI4LCPrU2ia/HM2mE5xtstbdQK9Zhxng1J9oFiWZZxHKFGXFfqf6QpPQBaWawI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBz1tz0e; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBz1tz0e"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396bf83d458so1279703a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181467; x=1788786267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXjjK4cQByHA+0LozWy93yMgZYx3/ZFKSUZa+XbHMGg=;
        b=tBz1tz0exWP7SufPOV8YXu5XsfODPRDsAj5e/pjGxWk5NAZrde1wvOcmwYw5TxQOi7
         jYsYjeP32HyBbtYqUObRi50dXxg0anIAPC05v6s/GfpPSkIr3b4Sl1Uv0mdXLNJOOIFh
         KomGxnQFzBw/NF67kA1x8j8fWXf5LkcuUSRoMww2S9cVwQMQGcgD3fXuDACtcbZHIUjA
         VDfL35mcyCxTv9grKMKHs8jaHaurSYlXf4hgjv8nCFgamKKOS/81mDRnQpyKQxqLdXmD
         ItRfYzy5nnNfgcQuCImYkBEbFN4BNb0RY4k54XNLgsDLHw99VABfZBkgIs0PRzWCW8bV
         qOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181467; x=1788786267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXjjK4cQByHA+0LozWy93yMgZYx3/ZFKSUZa+XbHMGg=;
        b=Y9KeanG98hz+KImndYjc2xcfkfAYIUyVcSeFm5K90LI/6Mlwm+pNvyBmlX+XcTPtL2
         jbPAvQxFHIoQ1TU2jMA0MbcrlOBloaGbrU+npBLDbY1VoBhZ+OtDmtFN9z9WgPp4SCmX
         wuhMhwvcJwxe+zrHh0pH/QQpB3klrFrWs+V9Iu1vHDO70CbzraJxCSFKzLbVUAAEzUlf
         l4B9tTRYN3F3ifw/08MHQjYkaYEr5DtWBAfepm8SkyianIBHBrmU51DhAyeU1ioX/5FZ
         OTym+cHzUH+eplSJqdGPLSXJD/1ZfkdVjPy5yqjGyaIPZBMa853GC2pOMQR2e8yF4Jqv
         OsNA==
X-Forwarded-Encrypted: i=1; AKwUvBwL6V9OEPcTzTr0ViaVKok3LNtlsoM4Q5jF0ClOiKdbcVWTaRqU9T8uuEIU9ekerpfQwSyK3zHOACTQC0I=@vger.kernel.org
X-Gm-Message-State: AFuF++m1p7B9P0sAMhFuAwoaxVRuTVNP54tStQv0icb3wmyFiKaNFbF2
	1/T0HNpEtwrq7Rh2HMtu6BLbATYTKw13PwF6ZruGRsid/ULlWO+rd3Og
X-Gm-Gg: AYBFou0GY9v9+7mMuSvh+guBvz+FnGAfyDNrcredM9Pff5ZER4Wr0IoPcuhB8Gfrw/N
	KNytPesQD2TGIhwSeQRcRCz4n7u8e+18c+A2lB/1pUaPMKRUcIdoBkPCHSRD+eCVvgGo9Me6Whr
	cjMG8KLDomGQHmhYZlLVuZn0D/KVBH6JNva5SUNGhzzd3k7aR4tsyyCi13iEY2cz35WOV3VC8Bu
	Hb6y4FWXPO72kPqRKRkbqz1F+OHS2x3s9YzBILIGP5cSzj45NL52cvfcWQPy09ZQ36o0NxdYNIC
	t1lu9UTgifjSstIhKLYT+YuDkF0FTwvsVf/3uJoys5KRzMVa0htGNXUnM0T5jDXNk9U80qIR8Kz
	NY498t3mVGuCBT2mQLb+CZ29PlnnBoHCu/wDDtyhztWNXJims9s0QC6hnDb6dTedWSUDaQcNcrh
	sAqNOPSmhp59RHKf9UwFETuOytmIMRrKCRTvhuuBu4dO2jIKvzkrNkAhZuAMpxEfDCfXXtlfbhs
	W6F3A==
X-Received: by 2002:a17:90b:2888:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39907ab0ea1mr1000718a91.4.1788181465569;
        Mon, 31 Aug 2026 06:04:25 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d6d29de3sm4981354a91.2.2026.08.31.06.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:04:24 -0700 (PDT)
Message-ID: <af87036b-0809-4880-b088-545780b4d963@gmail.com>
Date: Mon, 31 Aug 2026 21:04:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] of: reserved_mem: skip init for regions whose
 early reservation failed
To: Marek Szyprowski <m.szyprowski@samsung.com>, robh@kernel.org,
 saravanak@kernel.org, rppt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <CGME20260818092438eucas1p20115e5d33908e32ef4433cb246da8098@eucas1p2.samsung.com>
 <20260818092420.2859026-2-chenwandun1@gmail.com>
 <72074a49-2963-4f96-b939-79bf95a829cb@samsung.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <72074a49-2963-4f96-b939-79bf95a829cb@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/26/26 21:14, Marek Szyprowski wrote:
> On 18.08.2026 11:24, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> __reserved_mem_reserve_reg() discards the error from
>> early_init_dt_reserve_memory() and returns 0 unconditionally, so the
>> caller counts the node in total_reserved_mem_cnt and the late scan
>> initializes it without checking whether the early reservation actually
>> succeeded. A region whose reservation failed is then handed to a
>> device assuming the memory is protected.
>>
>> Propagate the error so failed reservations are no longer counted, and
>> record the failed nodes so fdt_scan_reserved_mem_late() can skip them.
>>
>> Recording the failed nodes explicitly is necessary because
>> fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
>> tell from memblock whether early reservation succeeded.
>>
>> The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
>> of static regions is not bounded by it, so on overflow the extra nodes
>> fall back to being initialized, which is the current behavior.
> 
> I'm not very keen on such partial solution. Indeed we have no place to
> 
> store the result of the early init call, but we can check if the given
> 
> region has been earlier marked in memblock as reserved or no-map in
> 
> fdt_scan_reserved_mem_late(). If those attributes don't match the
> 
> region can be simply skipped then.

Considering the later patches that reject reservations for overlapping
nodes, checking the memblock state in fdt_scan_reserved_mem_late() may
produce false positives.

For example, if region A is reserved first and region B is a subset of
A, reserving B will fail because it overlaps with A (in patch 02/03).
However, during fdt_scan_reserved_mem_late(), B will still appear to
be reserved because its range is already covered by A. As a result,
B would be initialized even though its own reservation failed, which
is contrary to the intended behavior.

Best regards
Wandun

> 
> 
>> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  drivers/of/of_reserved_mem.c | 65 ++++++++++++++++++++++++++++++------
>>  1 file changed, 54 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 8c9d6395d6a3..c6e73d710ee1 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -32,6 +32,30 @@ static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
>>  static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
>>  static int reserved_mem_count;
>>  
>> +static int reserve_failed_nodes[MAX_RESERVED_REGIONS] __initdata;
>> +static int reserve_failed_nodes_cnt __initdata;
>> +
>> +static bool __init reserved_mem_node_reserve_failed(int node)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < reserve_failed_nodes_cnt; i++)
>> +		if (reserve_failed_nodes[i] == node)
>> +			return true;
>> +	return false;
>> +}
>> +
>> +static bool __init record_reserve_failed_node(int node, const char *uname)
>> +{
>> +	if (reserve_failed_nodes_cnt == MAX_RESERVED_REGIONS) {
>> +		pr_err("too many failed regions, '%s' reservation failed\n", uname);
>> +		return false;
>> +	}
>> +
>> +	reserve_failed_nodes[reserve_failed_nodes_cnt++] = node;
>> +	return true;
>> +}
>> +
>>  static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>>  	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
>>  	phys_addr_t *res_base)
>> @@ -141,7 +165,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>   * first entry in 'reg' property
>>   */
>>  static int __init __reserved_mem_reserve_reg(unsigned long node,
>> -					     const char *uname)
>> +					     const char *uname,
>> +					     bool *should_record_failed_node)
>>  {
>>  	phys_addr_t base, size;
>>  	int len, err;
>> @@ -149,6 +174,8 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
>>  	bool nomap;
>>  	u64 b, s;
>>  
>> +	*should_record_failed_node = false;
>> +
>>  	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
>>  	if (!prop || !len)
>>  		return -ENOENT;
>> @@ -167,14 +194,20 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
>>  	base = b;
>>  	size = s;
>>  
>> -	if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
>> -		fdt_fixup_reserved_mem_node(node, base, size);
>> -		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
>> -			 uname, &base, (unsigned long)(size / SZ_1M));
>> -	} else {
>> +	if (!size)
>> +		return -EINVAL;
>> +
>> +	err = early_init_dt_reserve_memory(base, size, nomap);
>> +	if (err) {
>> +		*should_record_failed_node = true;
>>  		pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
>>  		       uname, &base, (unsigned long)(size / SZ_1M));
>> +		return err;
>>  	}
>> +
>> +	fdt_fixup_reserved_mem_node(node, base, size);
>> +	pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
>> +		 uname, &base, (unsigned long)(size / SZ_1M));
>>  	return 0;
>>  }
>>  
>> @@ -306,10 +339,14 @@ void __init fdt_scan_reserved_mem_late(void)
>>  		base = b;
>>  		size = s;
>>  
>> -		if (size) {
>> -			uname = fdt_get_name(fdt, child, NULL);
>> -			fdt_init_reserved_mem_node(child, uname, base, size);
>> -		}
>> +		if (!size)
>> +			continue;
>> +
>> +		if (reserved_mem_node_reserve_failed(child))
>> +			continue;
>> +
>> +		uname = fdt_get_name(fdt, child, NULL);
>> +		fdt_init_reserved_mem_node(child, uname, base, size);
>>  	}
>>  
>>  	/* check for overlapping reserved regions */
>> @@ -349,6 +386,7 @@ int __init fdt_scan_reserved_mem(void)
>>  
>>  	fdt_for_each_subnode(child, fdt, node) {
>>  		const char *uname;
>> +		bool should_record_failed_node;
>>  		int err;
>>  
>>  		if (!of_fdt_device_is_available(fdt, child))
>> @@ -356,9 +394,14 @@ int __init fdt_scan_reserved_mem(void)
>>  
>>  		uname = fdt_get_name(fdt, child, NULL);
>>  
>> -		err = __reserved_mem_reserve_reg(child, uname);
>> +		err = __reserved_mem_reserve_reg(child, uname,
>> +						 &should_record_failed_node);
>>  		if (!err)
>>  			count++;
>> +		else if (should_record_failed_node &&
>> +			 !record_reserve_failed_node(child, uname))
>> +			/* Keep a slot for the untracked node's late initialization. */
>> +			count++;
>>  
>>  		/*
>>  		 * Save the nodes for the dynamically-placed regions
> 
> Best regards

