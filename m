Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA0B3AE1BB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669535; cv=none; b=myDTQsTOYiza7Xh6KAgo5uy6rJW7GiO0JfDiKVURqqKHxdCLj/8n/0kh6QjYWmWY+MSWsoCSZSp8OU2R6hNQXnrN6NQ3Ojut11P0hKuiQkIaZSf9iqeTbvwKnA85jKXpKYEuSf24H4aGUxdXztKJgT38A/oFK3VBm9PlFp9atCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669535; c=relaxed/simple;
	bh=W9ZqftaXV1OaE+vVxkmSRocer3troXNnXrIgDnpdsWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMM/9ajfOpxd7MoHdZ2qrfVJOTB+yaLkdfkfeeZWZR2FQLFviPxKt+87/wRfLvr0HQJzEgEEGaEnfrHoHLZScWMdaB1XSQjJzpO9Iw07sCEbPmIAx4Z6KVQKlyKZmGwJbk23eH/lESc//9oKq1vElqO4pkWFHCS9zCxpNZKNERM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Ggm5OcqJ; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Ggm5OcqJ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790669527; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=jZvOcQbNwGkg9vO+2V5t5LeOYPL7QIELv6/Cs3Ys1xY=;
	b=Ggm5OcqJUzdZunHBfAZRdX7rEcDeV1XdZ3RUGiEfcY5lF6pfM7zsptYGLdz3I/jkmxX7JqQDio0qctHvPd9O1mWRbfHo9tyFspH8vLkB5B3LZEn6BmYOvgJE5cQPvay4jbO/zzfSELOQOT5EvlbrfV89Xxl1m6MVOikl2pVD35E=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XBsUzwy_1790669524;
Received: from 30.74.144.142(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBsUzwy_1790669524 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 16:12:05 +0800
Message-ID: <200efe18-5570-43b7-bbb5-7fdd2ce7b4a9@linux.alibaba.com>
Date: Tue, 29 Sep 2026 16:12:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] mm/collapse: state what a collapse may do in the
 policy
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-6-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260928100630.21870-6-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/28/26 6:06 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> Tests scattered through the collapse path decide what a collapse is
> allowed to do by asking whether khugepaged started it.  Between them they
> settle:
> 
>   - which VMAs are eligible, and how hard to try for a folio;
>   - how many empty, swapped-out or shared PTEs a window may contain, and
>     whether a sub-PMD window is held to a stricter rule than a PMD;
>   - whether a range has to look used, and whether a MADV_FREE'd page is
>     left alone;
>   - whether the PMD is mapped as part of the request, and whether dirty
>     pages are worth writing back and retrying.
> 
> None of those is a fact about khugepaged.  Each is something the caller
> decided before asking, and the collapse code should not have to look up
> who called to find out.
> 
> Add struct collapse_policy for the caller to fill: khugepaged from its
> own settings, MADV_COLLAPSE from the fact that a user asked explicitly.
> Every test becomes a read of a field, and cc->is_khugepaged goes, having
> no reader left.
> 
> The PTE limits come as two sets, one for a PMD-sized window and one for
> anything smaller, so that the helpers pick a set for the order and read
> it.  khugepaged takes no swapped-out or shared PTE into a sub-PMD window,
> and empty PTEs only when the knob says all or nothing; the warning for a
> knob value in between moves to where khugepaged fills its policy.  The
> fields only one side reads say which: anon_ or file_.  David Hildenbrand
> asked for both.
> 
> khugepaged fills the policy once per scan pass, MADV_COLLAPSE once per
> call.  That is the one change in behaviour.  The max_ptes_* limits and the
> defrag setting behind the allocation mask are sampled once per pass rather
> than on every table.  A table scanned early in a pass and one scanned late
> are then treated alike.
> 
> collapse_file() also drops a NULL check on the collapse_control.  It has
> one call site, reached only from collapse_single_pmd(), which dereferences
> cc unconditionally, so the check was already dead.
> 
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   mm/collapse.h   |  41 +++++++++++++-
>   mm/khugepaged.c | 147 +++++++++++++++++++++++++-----------------------
>   2 files changed, 118 insertions(+), 70 deletions(-)
> 
> diff --git a/mm/collapse.h b/mm/collapse.h
> index b115034d9018..dcd117071955 100644
> --- a/mm/collapse.h
> +++ b/mm/collapse.h
> @@ -45,8 +45,47 @@ enum scan_result {
>   	SCAN_PAGE_DIRTY_OR_WRITEBACK,
>   };
>   
> +/* How many PTEs of a window may be missing, swapped out or shared */
> +struct collapse_limits {
> +	/* Counted over a PMD-sized window; HPAGE_PMD_NR means "no limit" */
> +	unsigned int max_ptes_none;
> +	unsigned int max_ptes_swap;
> +	unsigned int max_ptes_shared;
> +};
> +
> +/* What a collapse is allowed to do, decided by the caller that asks for it */
> +struct collapse_policy {
> +	/* Limits for a PMD-sized window */
> +	struct collapse_limits pmd;
> +
> +	/*
> +	 * Limits for a smaller window.  Its max_ptes_none is either 0 or
> +	 * COLLAPSE_MAX_PTES_LIMIT, the latter meaning all but one PTE of the
> +	 * window whatever its order; any other value counts as 0.
> +	 */
> +	struct collapse_limits sub_pmd;

Much better than before. Thanks.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
