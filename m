Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D38488213
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395271; cv=none; b=BIKBCdcXp/gerooYWvWF6u39YWfpJv31MjJaHbbK0Ksz0o+iNVyPC9BpSalKYLzzgNzjg4gCvPB9XJaYv3zQdq2Ev1/yLLOjyq0PZRSAYhsJAYzcHoc6MZunfqvJmHlthSDDj9AKVFaJzClTsPBLkZ4dEORuHQr0t2m0hs7Oqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395271; c=relaxed/simple;
	bh=ydBll4oLJUNAaOQvHaPZ8sj7d9+L2AF/M5Oz7mjPrrc=;
	h=Subject:From:Cc:Date:Message-Id:References:Content-Type:To:
	 Mime-Version:In-Reply-To; b=Dn3ry+7Xds0i6vtpyG5gc5zZ4wuDlhWuXBaldtH28lt5c0LRyXBfTTSK6IiV7uvtCnqGGMbGd+NE4gbjV+fRrx7t9AY77aOpZaRL/k1ONhzuwDnYuusN2PJUK1gRUrXnrAVzwKvJryXdzBxEUz1LWn6k3zrEztlibsR6rIeguG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=auGD+Dyd; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="auGD+Dyd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792395150; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=a9E2/1RrbNu8/zRm5DyQP/PhhVl988xi9MIrrC75Wnc=;
 b=auGD+DydcHIOVO+QmYt0Smo9Fzkyv/WmdWjWy+UYFq3SS198lL+UTzbDeHAhA806wzz1PM
 t0SaQuSq2St9bw2m/2yJcASJ3jFmHAujSzmoSpuo3C6bmp+OZOYfwIKSfOJvD2EmLrtGq4
 HRBUnSCc3mL2v+ac9hxauYNLaWXeUHnR08zFClU8nUfE8HL6XZcCupTu5OlsvhGaHs3uJ0
 ZEtRVE0iimOSM9Kc+LbkH9GdP7rIbScgyZnyxfGWFPsVU9EQWkCvcHbtPqhpZxIGP0CK9o
 89pkETIUWOiRBkUdmqSeZWG4MokhVRIWCVLXqd+Ig9v1CwodIUQTaDyUNJv2Dw==
Subject: Re: [PATCH 5/5] mm: hugetlb: enable CMA allocation for PMD-sized pages
User-Agent: Mozilla Thunderbird
From: "Qi Zheng" <zhengqi.arch@bytedance.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 19 Oct 2026 15:32:13 +0800
Message-Id: <b8d87b71-c5ca-43d8-8050-72fc14802ae1@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com> <df6eee954b62f41d65c4d087d17a7a7cf60da791.1792136742.git.zhengqi.arch@bytedance.com> <ddb1e84f-2cfc-4a99-85c4-9a8c6415dbb1@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ad5c78c+bdfb97+vger.kernel.org+zhengqi.arch@bytedance.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	"Qi Zheng" <qi.zheng@linux.dev>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <david@kernel.org>, <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Qi Zheng <zhengqi.arch@bytedance.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <ddb1e84f-2cfc-4a99-85c4-9a8c6415dbb1@gmail.com>

On 10/18/26 3:07 AM, Jose A. Perez de Azpillaga wrote:
> On 10/16/26 12:07 PM, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Allow hugetlb_cma=<capacity>@<page-size> to select the architecture's PMD
>> size in addition to its existing CMA size. PMD pages are 2M on x86-64 and
>> 2M, 32M or 512M on arm64 with 4K, 16K or 64K base pages.
>>
>> Give PMD pages their own pool without changing the original pool's sharing
>> among other gigantic sizes. On arm64 with 4K base pages, 32M and 1G pages
>> continue to use the default 1G-aligned pool. Unsuffixed arguments and an
>> explicit default size still configure that same pool.
>>
>> PMD requests use only the PMD pool, even when their order is gigantic.
>> Other gigantic requests use only the original pool. Apply this mapping
>> consistently to allocation, CMA-only policy and boot-time accounting.
>>
>> Move CMA allocation into the common fresh HugeTLB allocation path so
>> non-gigantic pages can use CMA. Align reservations to both the selected
>> page size and CMA's minimum alignment, and use a bitmap granularity no
>> larger than the selected order. Keep the original CMA area names and give
>> PMD areas distinct names. Document the syntax and pool selection.
>>
>> Assisted-by: LLM
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> [snip]
> 
>> +	folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nmask);
>> +	if (!folio) {
> 
> boot-time hugepages= goes through here too, so hugepages=128 with
> hugetlb_cma=512M@2M already uses half of the pool at boot. would buddy
> first and cma as fallback make more sense for PMD?

That makes sense.

Buddy-first can reduce CMA migration and leave more CMA capacity
for later allocations.

I'll use buddy first and CMA as a fallback for non-gigantic PMD pages,
while keeping hugetlb_cma_only=1 restricted to CMA and preserving the
existing gigantic allocation path.

> 
> [snip]
> 
>> +	if (order != PMD_SHIFT - PAGE_SHIFT && order_is_gigantic(order))
>>   		order = hugetlb_cma_default_order;
> 
> doesn't this take gigantic PMD-order pages out of the default pool even
> when no PMD pool is set? would trying the exact order first and then
> falling back to the default pool work?

Good point. Perhaps we should use the following selector with the two
fixed pools:

static struct hugetlb_cma_pool *hugetlb_cma_pool(unsigned int order)
{
	struct hugetlb_cma_pool *pmd_pool = &hugetlb_cma[HUGETLB_CMA_PMD];

	if (order == PMD_SHIFT - PAGE_SHIFT && pmd_pool->size)
		return pmd_pool;

	if (order_is_gigantic(order))
		return &hugetlb_cma[HUGETLB_CMA_DEFAULT];

	return NULL;
}

> 
> I tested it on qemu and saw no issues, but I'm hesitant about the points
> above. I can give a Tested-by tag on the next version :)

Thanks! I'll send out a v2 as soon as possible.

