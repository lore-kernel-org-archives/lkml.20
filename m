Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500290;
	b=OKGt7QnxGshcuQ3ZT4AMe9TKC9BwfWE8JjiLxupXeNAx2o1sRasxMX6PALY3UzVA90u0
	 lManinMdo62ueiqV9jc+kHgffFHScL6dMJ0jxaUMa3xyJAI1gCXzFeUQV059qcfljAN0e
	 3OgzjAYEHmRETFs/H5TAtNBPGmZOTMpkOrDBIldcWGEWsJI0NeAjnpg9jzjMRtMvDKqYp
	 fX/4OY1oVq9lNJxIQ9SOReMXgAkqONDBU3gF/UhQ/5x6fyRDgTkc1jUGG1vYBfPCUXnxy
	 1safB65hYOwVVt10gL5VDiGNgeLuaOfonfEJgkOOaUUoCkiGLGXp64E9k3bnaz2mLXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500290;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4QQjy1ZXjch2DnnWTSXJwdzrveMs5n9IlfNyELVADAE=;
	b=glQsnakkyDn3LNdp+ya0bgfZPGoLeVo1kBnqyBaPk5KPTx3cshA0IahhCChTthDNUCB8
	 FJ98sPlmvEmkHnWzI0JKmpSeEuDb2SJqU7PemNAlFnO46wmDg9nhBgV9er21Drqy+aq8F
	 LD9Hsu82Pz0wCansQnB7Oms3Z/H4UBnruNwI2Jd0j40LOJ9qcXWWZRwqXQztO5jZ8nqrN
	 GOIvxvVrHjdUABP724Mweo8A6uGAw2dlTxQ8guFtqrqnD7EiA2RiP7ZDPZ6MP1lF/um7Z
	 QGt5GbW052PS1BuEOoXHMrCvfbhkTPeKQLIXacsrMMfSjqRiNJsPnYdBiV25I0CxZ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQ1rvgSs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2F7606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQ1rvgSs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABD21F000CB;
	Thu, 12 Nov 2026 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500289;
	bh=4QQjy1ZXjch2DnnWTSXJwdzrveMs5n9IlfNyELVADAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQ1rvgSsjdrcD1FLJt500urNClVMB19cJcS7tLNzy0snxZyoEuk5T7o9pEf86u8Ei
	 Z9Biccqvq54D0KIDA4yqbYS6VMo8cZF25pHSjrc4D2EvEa2gliVn+UkL5WqsirTJ+3
	 wtISq1nC+3juOU4Kg0f97dniVWypyNdqD06WOUuOrONrvDPuJdHyfNX/laVtprUNfm
	 xleL3VofUjD4HNfnQbnu82VXkcbPeaSmdDQxVbKd28AH+d5AgtvUV0Sw6aXroKanUz
	 zlPymZF1jj2/d53Wnm2+0ePBjSW2helQCaB87t7KaUHuyFzbmKre2uaEubgFTbxJKj
	 vkMUyRkUMYM6w==
Date: Thu, 12 Nov 2026 18:18:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] mm/mm_init: verify zones for template-initialized
 pages
Message-ID: <avXmuFQgroxxOfSF@kernel.org>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
 <20261109095807.41547-2-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109095807.41547-2-songmuchun@bytedance.com>

Hi,

On Mon, Nov 09, 2026 at 05:57:56PM +0800, Muchun Song wrote:
> Template-based ZONE_DEVICE initialization bypasses
> __init_single_page(), which means copied struct pages do not run the
> vmemmap zone consistency check.
> 
> Verify each destination after copying the template so the fast path gets
> the same validation as regular page initialization.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I'll wait for the next version before reviewing the rest.

> ---
>  mm/mm_init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index a9d848c92678..0129152b74d8 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1082,6 +1082,7 @@ static void zone_device_page_init_from_template(struct page *page,
>  		set_page_address(template, __va(pfn << PAGE_SHIFT));
>  #endif
>  	memcpy_nontemporal(page, template, sizeof(*page));
> +	vmemmap_optimization_verify_zone(page);
>  }
>  
>  /*
> -- 
> 2.54.0
> 

-- 
Sincerely yours,
Mike.
