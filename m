Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1882701B8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393871; cv=none; b=QL80NV5y9TzU+WkYvGoK/vQIScv/fXTivBq+Z7cM6yGSkZ3qOPl8Texhu/uTj1R9G5NPMtsNWEDUYEHQaKpgW/msZlX+GrlrWHdHi2mgg86PdN31VnB6aRCPKZQUkt8tuEXYeDwTnAiDyltcKOy+VSUq1CJUUFl/vL5cEN8wuLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393871; c=relaxed/simple;
	bh=oqimCLVgz/o8GpIucRoOPUuoH44Ba2QAp45QgclHUd4=;
	h=From:Subject:To:Cc:Date:References:Message-Id:Mime-Version:
	 In-Reply-To:Content-Type; b=GPNsFdfl95LIrrUmuaX46FXBhIj9gbX63hWjZU7tUlnTqlPX2gZdxXaw3d6hT/YojL0Z7ohzuBWgZ9hSwZsrQcr2pf8DWa3P78Vx3CfW+DBvfOW00MjC/zq+vAFv5/iPxyQ7VClHsstAOVgT/fiecwTgNGUc1IdFJfBPQ73ueV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kYdDaaBI; arc=none smtp.client-ip=209.127.231.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kYdDaaBI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792393858; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=nHPmq2WlguBeJi/Zj2mPBIP3oN0WpTMEjCrzt8cxejQ=;
 b=kYdDaaBIfWRuIzxcg9Q27am+d8SfQhR1+Xe5N7UeU1EaXVHXxZUNOkF7LNGv53aB5xbtRV
 eViyCiVMIITcqGOSPEExrLjWvhSAiXXWPYz+Tgp2l0fV5ou8Ck1UaP3WWJTntjEUrzKrfD
 DvRfb4mMf1BV8ki11qC9P874LcVg0Y6FeagbNoqAZ/tGH603z/vZ9BsCZzPBn0Ze1gmTPx
 NSjmt6NsCbIuB1KKat/+c/17oxlKWpsXHmVQUCtJUJK6j9oGUhZr5VyurRqzpW/PYieIQm
 8NXZWiseRxlbjYXAPSF+dGGdmxB3h1yRbi3Zhdj0kIvv85p0RgwJzhgweSX15A==
From: "Qi Zheng" <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH 3/5] mm: hugetlb: track CMA reservations by page order
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	"Qi Zheng" <qi.zheng@linux.dev>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <david@kernel.org>, <akpm@linux-foundation.org>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 19 Oct 2026 15:10:40 +0800
References: <cover.1792136742.git.zhengqi.arch@bytedance.com> <57cd5cac5e2749cba24c502bcd9682ad8b9f2bcd.1792136742.git.zhengqi.arch@bytedance.com> <ac34f212-2e51-4298-a281-9380fb0d073c@gmail.com>
X-Lms-Return-Path: <lba+26ad5c280+b8a6c3+vger.kernel.org+zhengqi.arch@bytedance.com>
Message-Id: <61c88ac2-43e9-4e78-98c4-a1879da6f79e@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ac34f212-2e51-4298-a281-9380fb0d073c@gmail.com>
Content-Type: text/plain; charset=UTF-8

Hi Jose,

On 10/18/26 2:41 AM, Jose A. Perez de Azpillaga wrote:
> On 10/16/26 12:07 PM, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Prepare for a separate CMA pool for PMD-sized HugeTLB pages by organizing
>> CMA areas and reservation parameters into pools identified by page order.
>>
>> Select the corresponding pool for allocation, CMA-only checks and
>> boot-time allocation decisions. Release folios through the CMA area that
>> owns their physical memory, including after demotion.
>>
>> Record each pool's successfully reserved capacity. Remove
>> hugetlb_cma_validate_params(), since the per-pool CMA-only check already
>> handles missing or empty pools.
>>
>> Continue accepting only the architecture's existing CMA page size and
>> preserve the default pool's use by all gigantic sizes. PMD-sized pool
>> support will be added in a subsequent patch.
>>
>> Assisted-by: LLM
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> [snip]
> 
>> +static struct hugetlb_cma_pool hugetlb_cma[HUGE_MAX_HSTATE] __ro_after_init;
>> +static struct hugetlb_cma_config hugetlb_cma_config[HUGE_MAX_HSTATE] __initdata;
>> +static unsigned int hugetlb_cma_nr __ro_after_init;
> 
> the commit message prepares for one more pool, the PMD one, and
> hugetlb_cma_pool() folds every gigantic order into the default pool.
> would a fixed pair work instead of an order-keyed array?

Do you mean keeping two fixed pools, like this:

enum {
	HUGETLB_CMA_DEFAULT,
	HUGETLB_CMA_PMD,
	HUGETLB_CMA_POOLS,
};

If so, I agree. That is sufficient for this series and simpler than an
order-keyed array.

Thanks,
Qi

