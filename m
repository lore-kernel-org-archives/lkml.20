Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2065233945
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888854; cv=none; b=PbGwayWAKNd/FnvmkS+LHVcU5oBV6lrpLETorx8ac3kEChrU8sC2JH7DzgKEC8YAh+iO3JK/cv/xhDhGluNOaSSKA8nDOiSARruJl+6+VtuWYf17Knm3RZhFwRr9Rc8qCgKCHkaC8YFO9WrAqHPhJmnQIhrWrGutEtFVNDXXEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888854; c=relaxed/simple;
	bh=y7vHwpuueAqBNxpWTAevjhfY8eE7MgO8p+UmC7Eq7lc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DHf8gNadj3uOPq9DvyhOQnr1y0i2ng5RSl/48jU1l9pTOBeFXM/jjiegZECvJyVCqpbR7BcIOijocogeD5Zje6tUBXHNY7GuQYd2XTshCD8VEMRPSBIsHurtYyiV3/AyvZ+l/uYZUrNWEpzXhmEuOsuWINar3oQBrYiaXlFqL+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PD5yoXvb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PD5yoXvb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20581F000E9;
	Fri, 28 Aug 2026 03:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787888853;
	bh=m710DFyKBAhfKCuWsHObfkPb2khG82TsQpFvBA/k2JA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PD5yoXvbnJPvy0egNb788P1/kZ5UVxXwv0AbKXVrjtZaLfmWuL7VQjHYesVvQA1dF
	 ISgqaI1omZ3HE1QMqlThC+6VdlF/i3PeqHGSA8Tsf2OcOCy3BFsJaG3kUmIeOqF0RX
	 2ZgscW9XwkXja21nwKKs7zPEnpfp0BGDNuaGJ7x8=
Date: Thu, 27 Aug 2026 20:47:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Xi <xiqi2@huawei.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Brendan Jackman
 <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan
 <ziy@nvidia.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 2/2] mm/page_isolation: guard compound_order()
 against racing
Message-Id: <20260827204732.367c52ad420acb0b87bf29ed@linux-foundation.org>
In-Reply-To: <20260825120549.966271-3-xiqi2@huawei.com>
References: <20260825120549.966271-1-xiqi2@huawei.com>
	<20260825120549.966271-3-xiqi2@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 20:05:49 +0800 Qi Xi <xiqi2@huawei.com> wrote:

> The PageCompound branch reads compound_head() without holding a reference.
> A racing split or free can cause compound_head() to return a stale pointer,
> and compound_nr() reads the order from that stale head, leading to
> out-of-range shifts and making the skip distance meaningless.
> 
> Read the order explicitly with compound_order() and validate it is within
> MAX_FOLIO_ORDER before shifting. Also verify the derived head_pfn against
> the legitimate pfn: the head must not be past pfn, must be aligned to
> nr_pages, and pfn must fall within the compound page. Bail out with
> -EBUSY if any check fails.
> 
> ...
>
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -418,10 +418,28 @@ static int isolate_single_pageblock(unsigned long boundary_pfn,
>  		if (PageCompound(page)) {
>  			struct page *head = compound_head(page);
>  			unsigned long head_pfn = page_to_pfn(head);
> -			unsigned long nr_pages = compound_nr(head);
> +			unsigned int order = compound_order(head);
> +			unsigned long nr_pages;
> +
> +			/* compound_order() is racy. Cap it at MAX_FOLIO_ORDER. */
> +			if (order > MAX_FOLIO_ORDER)
> +				goto failed;
> +
> +			nr_pages = 1UL << order;
> +
> +			/*
> +			 * compound_head() is also racy, so the derived head_pfn
> +			 * needs additional checks to make sure it is valid.
> +			 * Otherwise, just fail the check. pfn comes from
> +			 * __first_valid_page() as a legitimate PFN, so use it to
> +			 * check head_pfn.
> +			 */
> +			if (head_pfn > pfn || !IS_ALIGNED(head_pfn, nr_pages) ||
> +			    pfn - head_pfn >= nr_pages)
> +				goto failed;
>  
>  			if (head_pfn + nr_pages <= boundary_pfn ||
> -			    PageHuge(page)) {
> +			    PageHuge(head)) {

Sashiko suggests that this PageHuge() test suffers the same issue?

	https://sashiko.dev/#/patchset/20260825120549.966271-1-xiqi2@huawei.com

>  				pfn = head_pfn + nr_pages;
>  				continue;
>  			}
> -- 
> 2.33.0
> 
