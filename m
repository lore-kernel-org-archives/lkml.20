Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9978D1E47CC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010447; cv=none; b=nZUMumnUPoZFHBvmszxF7D0ZAjQH7X3m0gV15fxXJsyDoMJv/WCYvc8xBH+0VI0uJIq6LZyC94k0oFOM+uGyh6k9Q9Eg+lHw9E64eMj5iWq+QDJIAfx7AOQ7p6m7ILAZ/7OYHc5EJco7MxpS8GY9leHCVsllEg+KddgVXBZ6kqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010447; c=relaxed/simple;
	bh=JGmnOx2P7JR4xiE7XoEW9TvsuFFyo62P+luEJSfI82M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKePdqu3COinOE0gEU+aplkSis3xSCadfjzWpYvvxA2S2AskSr1SCwUY1HeDISWjXRMXuyK2csnJiiK3knafndeLwMWDisjiJLa0lG+E64+l3+uWOPaOsVDo7g5QOPALeGPZQz/fajli7FHgvkwYSA12P/Od9hm0JDJHW1+6Nq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=VkHinkfY; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="VkHinkfY"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533972e0cccso52064341cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792010444; x=1792615244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZzboJ+fBHb0sZhaDRiaNRbOcPWLCVijOqfXtCDwsFU=;
        b=VkHinkfYpA0sVhGwwFzHBBQNWWjLRXCIAtvlyMQ9qgtdAGHiq63p2f5LYU96QpYgF1
         1PYQIahtemH8eWnDl53um7n57qFdoYwLWQog5a/EGkC1XDWm0VJa1zWwutE7cb08iCO6
         keTx1wjvXD4/JWKWw+Jbm3n5BugELzPROz3UFDVfTAG41xxkWVLYIbust+4cEuobEZpy
         vu0OqQLcE4K160L33UgV0TwHPMCvkw5EafdoZBOMeaWk0lAgdZhGU21meKJNZvdFbJRb
         XvB+F+kQa7TwS4LPO0JSLBUwVEwbbuaV3qA0pAfB2cEhfqKCEaoK+b1+dsQrBwl9DisZ
         092w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010444; x=1792615244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZzboJ+fBHb0sZhaDRiaNRbOcPWLCVijOqfXtCDwsFU=;
        b=VlxONgl5+T1qhJXGhsLkY2BFZFl6Ceit6gCOtGPmdqCXP6Me+fWWHDqgRCt/WfJAtU
         L7rdaqqQUtqaqabK0K1sFogKUIVXOW+9esYbox7yKpuwodaRIHxhVW0qYiDV8+MEicau
         DEAX5JKPrmvfciIB/64AyobS4MKjQ+67TQESw8dfzqBb25bK+S+n+K1Z0A/G1u/IhcrW
         1su+0WyjPAIH7ezoiueqfhS4XHRz+MNe0mQypZ+WExY6CC2pTOcRPsW0CBgmu9m7jSzb
         /UIwKQiteZHonfNZL5p6/os6vZl6jU/tlJw3K8tC27HD8v9YXINhREcfG0ObH6dQNB+9
         k8FQ==
X-Gm-Message-State: AFq9FYJ/2Y94sjMf+BDxglWo/HIrJ/r5b8lc9CTm4tfO4FWnJrj5Mjjn
	ytkFMoSgJKRmqk5Irl56etusVaOWAqA1ImJOcBRzvAMxkWbgt+KzKuTBYTTI1iqOWOE=
X-Gm-Gg: AYBFou1Zvr0F+tIW49C41lvRZ0FdTj1hzX1iABBBY2qV8nBe2FC989EaE6ykEG1FXFM
	CYb0FAEoLbgL4evWZoqGYi6tKdv8wtjUAWDpZ/3qpC2qPXGiX1Y4HEHindzkX/U1652rTIqdnWF
	WbueBZgzKUsdpwGidpCCex6oAi6pCIMYrUaBfwI5FNLy8JpZ14hfDuWF1axZHrHcRbx3mPaPiBb
	0i3ATNCJQK+J+ubnWCvr7y7/N1zfXMZLeu2MXxDvTO9b3KtIc38ykm1pCcLwlQt6dUHm49xoNui
	w3Oa75M8EmpK3ntprh4HgqR/7cpUvQj5CWwLXsoI4wr5Tcg4N6BzWwetnbyd2GPy7zpMfeuzHhH
	Q+JulYHU+LnFJxpmxlSQTuI68HwitmC67X83cnTZFsYQsaecWzOegDr3KoFx1egBhMvgdwEApHu
	Qbuvpzj1QCxgEWtUKcf/UNsq9SlUxaPk78TlPoF137OwjF2akqhuTnSIihHgpQXcMUfpz1AA==
X-Received: by 2002:a05:622a:251a:b0:532:f124:18dd with SMTP id d75a77b69052e-5359f49891emr274507121cf.11.1792010444315;
        Wed, 14 Oct 2026 13:40:44 -0700 (PDT)
Received: from localhost ([2603:7001:f100:5081:9526:3c0:45cc:5ac6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127baba0sm6256231cf.13.2026.10.14.13.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:40:43 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:40:42 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Subject: Re: [RFC PATCH 2/5] mm/page_alloc: count a merged buddy's pages
 under the merged type
Message-ID: <20261014204042.GH371161@cmpxchg.org>
References: <20261007021250.1665929-1-riel@surriel.com>
 <20261007021250.1665929-3-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007021250.1665929-3-riel@surriel.com>

On Tue, Oct 06, 2026 at 10:12:47PM -0400, Rik van Riel wrote:
> __free_one_page() merges a freed page with a free buddy of another
> mergeable type at pageblock order and above, and retypes the buddy to
> match. The buddy's pages stay counted under the old type: nothing moves
> them to the merged type in the free counts.
> 
> That is unobservable today. NR_FREE_PAGES does not separate types, so the
> missing move nets to zero there.  Any future per-type free count would
> undercount on a merge from the other side, and allocating the merged
> run later could wrap it.
> 
> Move the buddy's pages to the merged type in the count too.
> 
> Assisted-by: LLM
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  mm/page_alloc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 4658af97be010..ae38e25971559 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -993,6 +993,11 @@ static inline void __free_one_page(struct page *page,
>  			account_freepages(zone, 1 << order, migratetype);
>  		} else {
>  			__del_page_from_free_list(buddy, zone, order, buddy_mt);
> +			/* The buddy's free pages join the merged block's type. */
> +			if (unlikely(buddy_mt != migratetype)) {
> +				account_freepages(zone, -(1 << order), buddy_mt);
> +				account_freepages(zone, 1 << order, migratetype);

Reasonable on one hand, but I think at that point it would be simpler
and more robust to drop that 'single account_freepages() + __add/__del
operations' optimization, and just use the accounting add/del variants
directly instead.
