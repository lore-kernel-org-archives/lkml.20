Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38712FB97B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816134; cv=none; b=DUyTa3q96dkkHj31Xg/uXN3ftrQLp29MTT2ml0OQvXPmCgfVVfm5Dw27PKf5tQxyclGBeXbBs3mw8XVMz4/u8yoRA2aDFTI1C41DWTTlxdE+4pyb3FEl/OdQSEt+qQJM8An+A1eS0gCGVD8q+kzcKSq5TXgWN/0w3U5GZSEN7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816134; c=relaxed/simple;
	bh=+dXHZAnWHvh64AXgLBJwYPUDSramc8ppWBFezOc1Sp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VlbEcKVzE3sVBHJIS39GpAYPTk/YNIN/CKZEfzjhql8f35l+id6vXaLVM+L/oK5Wn7tMzeWavHNxJiDxT+tigs9THNXstJt8xbFuZ/UFb45rCggdib/lGGPundO+wTpaS1ywmIuhl2Nx99lE1VpXM97FnU5Oa2TrURt+wVddbKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZpay+0/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZpay+0/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823C61F000E9;
	Thu, 27 Aug 2026 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787816132;
	bh=nL4Ln7o3L3IwaxI7h6hlZoYQGbFSaz6OPobG3bCfCTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PZpay+0/KaEIqQP15SEKPTm5Fk3ioRb/SL1/MOWCWmeA48skcWKwCM3rYAuw/kq1v
	 4nQCIUNBDJ7WEHwVaiEeIZSuy7Dc0oJ9+yRXLHkNzvSR3ASB+kS5NANaqcp3piOSCh
	 fMXwr1yEKtbdMHDAMgKrTBDNrDOEyqZvGhbsc2Q7jVeOJSVIDKMl/bdAEDYcU5Rvtw
	 WAMRfjGKc4Fcs6FN/Hji+RgFEricEu8K0z8+kM9UZ3z/gENvgIkiFlHioc1u2cqMuP
	 Pg85fhnzJ+s6SG/2JRuaposCZ5kTaFalhWIRecU0GwVC12j9+xu7Lq3VCV0A4MTlJO
	 K5qyQHwUqrmGg==
Message-ID: <cbc344a4-77b7-4282-9bdd-004822642ab5@kernel.org>
Date: Thu, 27 Aug 2026 09:35:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: remove out-dated document of __GFP_NOFAIL
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev,
 hannes@cmpxchg.org, ziy@nvidia.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Baokun Li <libaokun1@huawei.com>
References: <20260827030548.16631-1-richard.weiyang@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <20260827030548.16631-1-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 5:05 AM, Wei Yang wrote:
> Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
> with __GFP_NOFAIL") remove a warning on allocating large folio with
> __GFP_NOFAIL, which is adjusted by commit 903edea6c53f ("mm: warn about
> illegal __GFP_NOFAIL usage in a more appropriate location and manner").

"which is adjusted by commit" sounds as 903edea6c53f came later than
ee040cbd6e48, but it's the opposite. Maybe say "which was placed there"?

> While in that commit, it also documented this behavior which is
> out-dated now.
> 
> Adjust the document to align to current code, and adjust the comment
> while at it.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> Cc: Baokun Li <libaokun1@huawei.com>
> ---
>  include/linux/gfp_types.h | 2 --
>  mm/page_alloc.c           | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> index 190191411009..24fde8eb73df 100644
> --- a/include/linux/gfp_types.h
> +++ b/include/linux/gfp_types.h
> @@ -243,8 +243,6 @@ enum {
>   * used only when there is no reasonable failure policy) but it is
>   * definitely preferable to use the flag rather than opencode endless
>   * loop around allocator.
> - * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
> - * not supported. Please consider using kvmalloc() instead.

I'm not sure if we want to simply remove the lines, or rather say it's
discouraged (instead of not supported) and still suggest kvmalloc() if
possible.

>   */
>  #define __GFP_IO	((__force gfp_t)___GFP_IO)
>  #define __GFP_FS	((__force gfp_t)___GFP_FS)
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index ab385bc252cc..146f7e0a9462 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -4804,7 +4804,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>  
>  	if (unlikely(nofail)) {
>  		/*
> -		 * Also we don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
> +		 * We don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
>  		 * otherwise, we may result in lockup.
>  		 */
>  		WARN_ON_ONCE(!can_direct_reclaim);

