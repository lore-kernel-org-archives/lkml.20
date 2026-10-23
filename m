Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753883;
	b=roOnfyVqnQpA7BNkILNlHd1D+WkXpjEVTTuoCYS/B6pK2s9MmHiLwpehtbU3mlkBZlZG
	 0miYKdRt23sKpU5TtUv7nHY7ysjwhZBlvQNzP1LcGEjX5SACMcn4VH5hsqBkXiTbHhkxj
	 PHRA+82zUdiTzfeyxN2rdiEC7uB24hIWPkyCmnzOEptzYoAv+CWKzILg1vdmSlhzuxP9i
	 5B2Mc+Xh+v/PAutDp9TqneapEdZqdtkEhod4i+2TXkemCcyV7FqzebaLEHAn/ClCYBXTL
	 /JH3ww8ScVh8WLPZ0gtQtJYhfGiGWprxDZeEuHRGRqyQhKcCzUw/k69qvmSSIs0Skcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753883;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2ZZkxyap/7dlUZUT4UQ++G0HXHd1yXMsqlTCYWXzFUY=;
	b=L25FSr+vNPJdCskU/cFC9tAblpHdoMDnVUI3McPhDL93Le46PuoQTVtOvYTSKcAyLs1r
	 AO7FuVCvUIKjzYGXbv+bxsWdSkONBTPV7SbxvigqQhxx5+XKF3Re+gQkkZQWiDt8U9Xas
	 evP5hsxJNLSFJeKveNsdvI4edVC1R9lpTDOid4bd0vRtNkbsnq/2TWy0a1i2AIxYLYAGr
	 7aUaI6q+LJqme/AcQsW8XMNT85auQ/roeH+CewJs/DzJUSW4i7+dG9QwGDQueURf8Eio7
	 ttDzn2KKrYMgcNlydUPiDRh5D8U+wgKeazNF988VCEYqN4xLK5Ua2vy5BeBXSQDleyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FAsL8Mng;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98198606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98198606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FAsL8Mng
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C531814BF;
	Fri, 23 Oct 2026 04:11:18 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4412A3F7B4;
	Fri, 23 Oct 2026 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792753882; bh=hzRNH5SZs+yfGxmNNryzFab0nRLdeJhjiE2/+3MJwO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAsL8Mng6IPldGvEH5YqSMzj8yEY55gdPl7o0JRr8UygQWqYXKEqqLJRMkMes2F3P
	 f/74bNgaYi5YsKmwTGXnUNMbkCXA6grYyfnlKbN5HA98X0W6pyiVkCYRQaAdpED+gX
	 ZXz7xocv6h+KEyyYLQ1EUq8TGqQFTD+mCQNECWrw=
Date: Fri, 23 Oct 2026 16:41:18 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com
Subject: Re: [PATCH] mm/page_alloc: remove unneeded forward declaration of
 __free_pages_ok()
Message-ID: <e3s4abh434i5osy2jkhy7aifhtytzwnkbvdben5zaeesq23vgn@7cupaxhi2ao5>
References: <20261022124504.75642-1-zenghui.yu@linux.dev>
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
In-Reply-To: <20261022124504.75642-1-zenghui.yu@linux.dev>

On Thu, Oct 22, 2026 at 08:45:04PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> All remaining callers of __free_pages_ok() appear after its definition, so
> the forward declaration near the top of mm/page_alloc.c is no longer
> needed.  Remove it.
> 
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  mm/page_alloc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 0396c50b96f0..6db90e0aa929 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -216,8 +216,6 @@ gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
>  unsigned int pageblock_order __read_mostly;
>  #endif
>  
> -static void __free_pages_ok(struct page *page, unsigned int order,
> -			    fpi_t fpi_flags);
>  static void reserve_highatomic_pageblock(struct page *page, int order,
>  					 struct zone *zone);
>  
> -- 
> 2.56.0
> 
