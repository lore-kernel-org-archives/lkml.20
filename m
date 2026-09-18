Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9983A5453
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720468; cv=none; b=ADWreWzfV4Oadee1Aby2M9JOxGaISDQd7KBChHNSUevtl4R0AlDBT856QDvfgy9oEyPIx2wUL1KolHi55hsYuY3XcxyTqzd1oozie+lKmCsZYRnESEiassSKtfCyY+gRdvDDluKzJXF01WOtJK+jTUf21sFdQao6mGVAucuIx30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720468; c=relaxed/simple;
	bh=/ZOtUMA9yO0D3BNU0UQopLjFzKN7eZUaphdnwnk5D1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M7mH8Sy5ZHjFBrvJnMp1K3By+gnv/SgZ9wtyqhJUbsYmkPsvCqSNm8X4dAL1OUmG+GZkAc7tIvP2MOgah4htDpO5wp2/BVut2PKxi4eFzmObwpohEDmoh6GWBltWQmq0WXUIUF86e9fTiiiwm/6Smedcv4GXsGlRNhDuQA75dpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uRXQDTWy; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uRXQDTWy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789720463; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WWLXM9j2Xl4HSK1CsuZG/egpI0kp+xihUtRUm8SGEIE=;
	b=uRXQDTWyZ3hGeAydYuWbycpjtTuhpIfliLCndz5nqHNCkBRN6hTZBkcdxjmgF3qclbZs6olycAcOa7nd1cfXIboAp1l7wa/V0guC841GBHU5ZE3BKdz/XPqdgXNAxW76pQyZbReMhwxnln2kIF8OtbTfs+dLhzh0DDVhR9MthuE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XBAfAEz_1789720461;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBAfAEz_1789720461 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 16:34:22 +0800
Message-ID: <a93d4942-8e21-4205-9f5a-395b8038ee4f@linux.alibaba.com>
Date: Fri, 18 Sep 2026 16:34:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/huge_memory: simplify pgtable deposit detection
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 david@kernel.org
Cc: ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 usama.arif@linux.dev, kas@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260917054015.23553-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260917054015.23553-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/17/26 1:40 PM, Lance Yang wrote:
> Whether a PMD has a deposited PTE page table only depends on whether the
> architecture requires deposits or the VMA is anonymous.
> 
> Implement this rule directly in vma_has_deposited_pgtable(), avoiding
> mistaking a non-anonymous raw PFN PMD for one with a deposit and attempting
> to withdraw a page table that was never deposited.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
