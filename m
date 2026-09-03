Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A64E3ED9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449859; cv=none; b=OcuaUfadZsA+tDhszcYM7KPZeDtDIBthA8RMXQmn8SG2/X0Sw8avAF1nOe/Y20qI/15KFR2e9Ieyrbqx63p9UK1JS8YhbsbblAFgvpvzz+XQzchThZHycX3hsDLm4U14zATFi9yxg56WlDX854zMdXFvhZMCs1eRu+gO8kyf6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449859; c=relaxed/simple;
	bh=AC6m4U7iNqEMPUbp6Jh+8AXrCxPJ51XZjA9Q/0NExg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdmFpMZGKXIPQtumZ/Xj0q8VdZ2EM22/dq4veWBwvagexmpJYIBpbKIesfsCF7M2+EcX+HcCzLGMz0eU6Bdvfks0mWBGYzXvGPwwN4eP/Aei//Ldoh8aYA+ifppXThf5C/9YAswDfNgg1UbIfOBESzcgZ+KFkcFT25mam0hKAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwbiNMYl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwbiNMYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1A21F00A3A;
	Thu,  3 Sep 2026 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449858;
	bh=SAaGuiuwmKSEyoiV8Zah8K/3km4skoA5hchj++a6j6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XwbiNMYlFIe5noAKSrlUGhYbLna2L+uP8lSXziXkAW62TAf8hQPWn9u+lWp6iYyo4
	 2406vNU8X6hwJGPli4Z0q2ege3NMjGMxsocs4c0PQ+1U/F7zAodiC1YypWAr0O5cy4
	 JvFisieON+V/L86uWXU8vC5wKcx8Q6Qq/rjmneZl4FpCLZj/CgxrhuDEI0TmUN61y9
	 jlbnpKu3/KYACkoWnURxOuutOBHRIFQ+cB9Qf1djpVCrt86thiQG0Qgm/le+dZBfqH
	 JTXDJXvobCVYMvtofNtJ6HRcgwWaVWeQ/J7GSBdP4bQ81ERzGbrHQfpvFQcV0FeHCi
	 uM0wXamhjq7Sw==
Date: Thu, 3 Sep 2026 15:37:35 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v2 06/14] f2fs: stop using PG_private
Message-ID: <apmUP1p1TPDOaBe_@google.com>
References: <20260831-remove-pg_private-v2-0-3668159cd9e8@nvidia.com>
 <20260831-remove-pg_private-v2-6-3668159cd9e8@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-remove-pg_private-v2-6-3668159cd9e8@nvidia.com>

Let me take this patch in f2fs tree, which looks like a clean up.

On 08/31, Zi Yan wrote:
> f2fs sets its PAGE_PRIVATE_* flags in page->private and checking
> page->private != NULL is equivalent to checking PG_private. Change
> PagePrivate() to page_private(). Meanwhile, in set_page_private_##name(),
> page->private is first set to 0/NULL before an PAGE_PRIVATE_* flag is set,
> but it can cause confusion when PG_private is removed and
> page->private != NULL is used instead. Change it to initialize
> page->private to PAGE_PRIVATE_NOT_POINTER instead and retain the original
> semantics.
> 
> It prepares for a future commit that removes PG_private.
> 
> No functional change intended.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Codex:gpt-5
> To: Jaegeuk Kim <jaegeuk@kernel.org>
> To: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  fs/f2fs/f2fs.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9940a6cecf1a2..2f7ab5888b078 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2691,7 +2691,7 @@ static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
>  }									\
>  static inline bool page_private_##name(struct page *page) \
>  { \
> -	return PagePrivate(page) && \
> +	return page_private(page) && \
>  		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
>  		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>  }
> @@ -2710,9 +2710,9 @@ static inline void folio_set_f2fs_##name(struct folio *folio)		\
>  }									\
>  static inline void set_page_private_##name(struct page *page) \
>  { \
> -	if (!PagePrivate(page)) \
> -		attach_page_private(page, (void *)0); \
> -	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
> +	if (!page_private(page)) \
> +		attach_page_private(page, \
> +				(void *)BIT(PAGE_PRIVATE_NOT_POINTER)); \
>  	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>  }
>  
> 
> -- 
> 2.53.0
> 
