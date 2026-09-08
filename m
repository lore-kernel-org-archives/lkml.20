Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9558B6CA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890116; cv=none; b=RAOK78IOzOPICDPhCm9O2iLlSMfiQh3xwUtWJtcnTEua0Kcxq0zjONsqGmeb+fbot96DDyMFUIlgUvk8kO7DRiT2jRX90AQG0cYTuhg/gzlRsDQlOt5yYLfMKF1WjEhkSRS5RLRU/RJsQIenmHtex1q8bqbv6319KsTLhIuw6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890116; c=relaxed/simple;
	bh=Hy/Te7Pip3ioEuVMdVc35RsOXd3jxVjPwmDOSLCYcI0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FVYMtbIj9fKawOe9gCTzh41aFYPOJPyJ53iWxJAYJc818cPARvwgjTcOhdU3AWjbmg7puezyp4PJ2HUhyljdXBb0UzJWnlQFFqVeIUii/baUH/hU+p/yE4r1SqOFrjr4DpI41WlRZVm4QfuHztHDsbaPqfnhKPlkEr//aNHcoi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hVzMVnSW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hVzMVnSW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703FE1F00A3A;
	Tue,  8 Sep 2026 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788890114;
	bh=gBAuJhW7S3ZXQ2qvDNf9JatkhBim/pKGvLVV7RlONSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hVzMVnSWPNFrjH8TWsZOHxRl0Old2NxIqVPRlGr2uN94NqWa7kezMsS/g0wy4UcGS
	 UtnZwWRgJJenERfATUGgoXTtmS+YyDkVLwdKouJCYBrNjcAty6d+qSlcrdxRWgLtn9
	 ZHsMfwRfPDq+5GrIQa7o17bWgKDLvrbv6j4vVFcc=
Date: Tue, 8 Sep 2026 10:55:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng
 Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, David Hildenbrand <david@kernel.org>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance
 Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl
 Shutsemau <kas@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel
 <riel@surriel.com>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo
 <harry@kernel.org>, Jann Horn <jannh@google.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Chengming Zhou
 <chengming.zhou@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/8] mm: remove page_swap_entry()
Message-Id: <20260908105512.8854d7972c82b6b6f417b0f8@linux-foundation.org>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 08 Sep 2026 11:16:30 -0400 Tal Zussman <tz2294@columbia.edu> wrote:

> A folio in the swap cache occupies folio_nr_pages() contiguous swap
> entries starting at folio->swap, so a page's swap entry is just
> folio->swap plus the page's index in the folio. The swap entry is
> folio state, but the only helper for it is page-based:
> page_swap_entry() takes a page and recomputes the folio its callers
> already hold. Several callers avoid it by open-coding the arithmetic
> on folio->swap instead.
> 
> Add folio_swap_entry() and folio_page_swap_entry(), convert all users,
> and remove page_swap_entry(), with a few other cleanups along the way.

Thanks, I'll queue this for testing and further review.
