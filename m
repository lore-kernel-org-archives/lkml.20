Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572CF43C7A4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771929; cv=none; b=rHIlzZN2/ruz89fshv4HjQKOIZKtNgkwwjCtyL+inrItbr4Xg/vGaVpHKr7s2TnZgbeRXUvyAx1l068hEfyh0gDvHmHSDvnQzsAiheFeW7gg0xWTkvXIbZUFPtDzqCE5mYASowxNfFOXGZXL6jSe2ovL+Rg2K7SqBEp2gYZ8ZJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771929; c=relaxed/simple;
	bh=UuIuOOxi8bfnc8Lb0Mu/ijec5Oa1N7wL+MXGpFAC/Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLkcJ5xqQY1bNS/T25B0gX0x8kO/qda2bV3RMWGQJaauiYquOg9kRs65Y3LqHYLhZCXPbHXrwOUkkXi62Yan74OHlHq+jOBa8dedXBMu6cgtPmx9Pb7V5mB8CkiZ8iS9Zj6RebVOk7VUcp+nYhrNeJmywDSQIeBjVZGKUR8iK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UMTDEUl6; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UMTDEUl6"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788771923; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=iXvYn9pGOWVNNZIM5zX5lrQlK0lUQ4h6ryyAL9cZz38=;
	b=UMTDEUl6Snp69Cm8KDWIa3eRoJL90tTSlSNrZKwYH6WcWjwL5FqWpSIk5LZrbWozQFxDMnuA/pxKahntGYDVodAV2JqqgYbukmoY2xs7ous9i7maK1KD4NI1lrdFP8OBRM6nfgfzz0mLsjrvEwMjjcGjdB7q4HcRVUaMOaolc4k=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XATAmni_1788771920;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XATAmni_1788771920 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 17:05:21 +0800
Message-ID: <c070e67a-4c1e-478f-aa28-09fb88f8a786@linux.alibaba.com>
Date: Mon, 7 Sep 2026 17:05:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] mm/collapse: state what a collapse may do in the
 policy
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Zi Yan <ziy@nvidia.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
 <b01681c3cc945a7f7c3c7ca1de502f7cc0e93fe8.1788533997.git.kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <b01681c3cc945a7f7c3c7ca1de502f7cc0e93fe8.1788533997.git.kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 11:10 PM, Kiryl Shutsemau wrote:
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
> khugepaged fills the policy once per scan pass, MADV_COLLAPSE once per
> call.  That is the one change in behaviour.  The max_ptes_* limits and the
> defrag setting behind the allocation mask are sampled once per pass rather
> than on every table.  A table scanned early in a pass and one scanned late
> are then judged alike.
> 
> collapse_file() also drops a NULL check on the collapse_control.  It has
> one call site, reached only from collapse_single_pmd(), which dereferences
> cc unconditionally, so the check was already dead.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   mm/collapse.h   |  40 ++++++++++++++++-
>   mm/khugepaged.c | 114 ++++++++++++++++++++++++++----------------------
>   2 files changed, 102 insertions(+), 52 deletions(-)
> 
> diff --git a/mm/collapse.h b/mm/collapse.h
> index 1c40229b9554..05282eed9a35 100644
> --- a/mm/collapse.h
> +++ b/mm/collapse.h
> @@ -48,8 +48,46 @@ enum scan_result {
>   	SCAN_PAGE_DIRTY_OR_WRITEBACK,
>   };
>   
> +/* What a collapse is allowed to do, decided by the caller that asks for it */
> +struct collapse_policy {
> +	/* Limits, stated per PMD; HPAGE_PMD_NR means "no limit" */
> +	unsigned int max_ptes_none;
> +	unsigned int max_ptes_swap;
> +	unsigned int max_ptes_shared;
> +
> +	/*
> +	 * Hold a sub-PMD window to a stricter rule than a PMD: no swapped-out
> +	 * and no shared PTEs at all, and max_ptes_none as
> +	 * collapse_max_ptes_none() scales it.
> +	 */
> +	bool strict_sub_pmd;

This is a bit confusing to me. Actually, the check for mTHP collapse is 
stricter.

How about naming it 'allow_mthp_collapse'? That way we can keep the most 
original comments for the collapse_max_ptes_xxx() functions, which is 
clearer to me.

If others have a better name, please ignore my comment.

> +	/*
> +	 * Collapse only where it looks worth doing: require some sign the
> +	 * range is in use, and leave clean lazyfree folios for reclaim rather
> +	 * than collapsing them into a folio that is not lazyfree.
> +	 */
> +	bool skip_lazyfree;
> +	bool require_referenced;
> +
> +	/*
> +	 * Finish the job rather than leaving it half done for a fault to pick
> +	 * up: map the PMD over a file collapse before returning, and write
> +	 * dirty pages back and retry once instead of refusing them.  Both cost
> +	 * latency the caller has to be willing to pay.
> +	 */

Can you simplify theses comments? I think the 'install_pmd' is easy to 
expalain. :)

> +	bool install_pmd;
> +	bool writeback_dirty;
> +
> +	/* How hard to try for a destination folio */
> +	gfp_t gfp;
> +
> +	/* Which VMAs are eligible, as thp_vma_allowable_orders() spells it */
> +	enum tva_type tva_type;
> +};
