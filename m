Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FA74D178F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472227; cv=none; b=KIReWuIh0WKt7dxGeBggQ9u12o8fspTwnzbJti7gOFexwjALFrbXVEHSkegY8aep3Pqb1LeatL7Xc3QxV2iB/IThOs7JqecQcYF8cOe2gav4tqZ8F0XzRhipNYhtmmjKeXwarWAORf+tK4LJO1GaOSYuVCW55b+baNAh81hMe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472227; c=relaxed/simple;
	bh=hgmTeJLGjsNAKYAKa1DnaczoEbCEVo4pKCm9fY/MAdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=UYqeh2NXtiIv0Iij/u1DdvU+mGxRRcVZeyXor04noHu2z+O4HikBqFkLpL/3EcZBEmChVMb8TUg1s+RhYl9U8/sNb7N1ReVC4INxsWQwy2+02JZrkTO9xISnV04p1L0wwLAoO89SO4wbqwV/bc5VR95JmDIT0Wc9DVs16WXcDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oS54NXGn; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oS54NXGn"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261008151020euoutp0196faaa215dd53cd24a03dbf7a5f57365~cln4owqxO0031900319euoutp01L
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:10:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261008151020euoutp0196faaa215dd53cd24a03dbf7a5f57365~cln4owqxO0031900319euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791472220;
	bh=p/CEeLfN16W336hJkOodyM4bPanb1U8QuIH15EGrUS4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=oS54NXGnWESg8OmQ/iUNSPpUcdmD5JSqstt22ooyjfcQZ6rgLbtMNDxWsDsHW4cRL
	 ef7K/aHXJfROSsQ3wIhpsDNoLGTErxaTT7hzjtbGJFWAroxWeYh/ybkiMApF2lpYu4
	 oeROedwov5Apmqc4S/mHJQLCPTBDtxRXgwajMLsM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261008151019eucas1p26347f907cbb12ee37552797103387753~cln4RSRBW3092530925eucas1p21;
	Thu,  8 Oct 2026 15:10:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261008151019eusmtip2cf77e50b80cb40ed87be766138851542~cln3sJP_H2632026320eusmtip20;
	Thu,  8 Oct 2026 15:10:19 +0000 (GMT)
Message-ID: <c1f42a7d-708c-4a6c-9925-9bb9806be958@samsung.com>
Date: Thu, 8 Oct 2026 17:10:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 2/2] of: reserved_mem: allocate and map the reserved_mem
 array early
To: Rob Herring <robh@kernel.org>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, Saravana
	Kannan <saravanak@kernel.org>, Oreoluwa Babatunde
	<quic_obabatun@quicinc.com>, Wandun <chenwandun1@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261008140515.GB183998-robh@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261008151019eucas1p26347f907cbb12ee37552797103387753
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea
X-EPHeader: CA
X-CMS-RootMailID: 20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea
References: <20261008094125.3197971-1-m.szyprowski@samsung.com>
	<CGME20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea@eucas1p1.samsung.com>
	<20261008094125.3197971-3-m.szyprowski@samsung.com>
	<20261008140515.GB183998-robh@kernel.org>

On 08.10.2026 16:05, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 11:41:23AM +0200, Marek Szyprowski wrote:
>> Get rid of the static, limited-size reserved_mem array and replace it
>> with array allocated by memblock_alloc_raw() and accessed through a
>> temporary early_memremap() mapping. Such mapping is needed for some
>> architectures (like ARM64), where linear map is not yet available during
>> early boot scan. Having a single, writeable array with all reserved
>> regions removes the need to perform two step initialization introduced
>> by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved
>> memory regions are processed"), so all regions can be processed
>> directly during the early scan again.
>>
>> Suggested-by: Mike Rapoport <rppt@kernel.org>
>> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
>> Assisted-By: Claude Opus 5.5 <noreply@anthropic.com>
> Assisted-by: LLM
>
> is the new way...
>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/of/fdt.c             |   3 -
>>  drivers/of/of_private.h      |   2 -
>>  drivers/of/of_reserved_mem.c | 251 ++++++++++++++---------------------
>>  3 files changed, 96 insertions(+), 160 deletions(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index ecc923102622..a58efdcbac7f 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -1283,9 +1283,6 @@ void __init unflatten_device_tree(void)
>>  {
>>  	void *fdt = initial_boot_params;
>>  
>> -	/* Save the statically-placed regions in the reserved_mem array */
>> -	fdt_scan_reserved_mem_late();
>> -
>>  	/* Populate an empty root node when bootloader doesn't provide one */
>>  	if (!fdt) {
>>  		fdt = (void *) __dtb_empty_root_begin;
>> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
>> index 0ae16da066e2..895f868b4cfa 100644
>> --- a/drivers/of/of_private.h
>> +++ b/drivers/of/of_private.h
>> @@ -9,7 +9,6 @@
>>   */
>>  
>>  #define FDT_ALIGN_SIZE 8
>> -#define MAX_RESERVED_REGIONS    64
>>  
>>  /**
>>   * struct alias_prop - Alias property in 'aliases' node
>> @@ -186,7 +185,6 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
>>  #endif
>>  
>>  int fdt_scan_reserved_mem(void);
>> -void __init fdt_scan_reserved_mem_late(void);
>>  
>>  bool of_fdt_device_is_available(const void *blob, unsigned long node);
>>  
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 300fb236ab59..6a5e53243bb7 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -24,12 +24,14 @@
>>  #include <linux/slab.h>
>>  #include <linux/memblock.h>
>>  #include <linux/kmemleak.h>
>> +#ifdef CONFIG_GENERIC_EARLY_IOREMAP
>> +#include <asm/early_ioremap.h>
>> +#endif
> These ifdefs are the only thing I don't like. early_ioremap.h is always 
> in asm-generic, so do we need the ifdef here? Or does the arch have to 
> do something to pick it up? I don't remember.

Those ifdefs seems to be some hallucinations I missed to fix. I will send v2 in a few
minutes.

> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

