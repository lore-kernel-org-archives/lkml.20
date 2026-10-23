Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758584;
	b=aYbjh8Kmqx5btByGjwbUad6hxAl40LdlRQOf+GqhHVm0NBot/RqtcN5s6AcNKs4yCHpg
	 Edk/UkrZDpQv6Le6YbhZzWtgmd2dNo+bT4iOldJsGaCSrpz0+y6b4zhbDQBao6V4fH/2/
	 DOGJ7bWd13lpSLSqH6gI4G0dJDcZGp99NK8+PFd+o6+1p0t+3UK4WPODh9uU5zCy0bbqw
	 R17NiA8QB0JPYreh5RXUVGKtNHUR/AKyhS2D771G2AptelSaFaO7/MDksS/6GdjTr7EKN
	 ERhHRynsdn6hX98ZswsKvW1TJe+1ku9Fkp0jCfDRd2QEcg+CN2lroDXWBYLX0YzWaHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758584;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NEJcOMfTiJZVdmiCS77heh1ShFCABv10BI4A16ZfUbc=;
	b=mXztmmR5fZFcsQCpfeAJjZjdz7xEkSYZtFarDEVQtsBUi+jQrmx9OhrwAALU2kQPK+8n
	 fdqTZSMfctl3y+bRY5vDH0vuJ4dCGq8GHc9/LsJq/7cdaU9rLY8sa+yhEHDys1SYnvdnT
	 fcNKP0NJYztIt97H1gNw3lTvaBtIYkMJXNXAiB22olIuZLTyizcUsEPYsCG4ZNksd9xw2
	 ikwVFRETO6Mq9SbHwcwA4xgxk/mTShA2DWE3mvnTKS2bbckp2qf9eVBGIFNHXye6vt8de
	 LzWvVIrmBxX7DJHkf3npNK1d8FCQaKRCsS0DWiLIPgjzklFq4V/IKMgMRYLjKcqEZvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a84UeIwZ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC21606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC21606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a84UeIwZ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A4D51691;
	Fri, 23 Oct 2026 05:29:39 -0700 (PDT)
Received: from [10.163.161.88] (unknown [10.163.161.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 615793F7B4;
	Fri, 23 Oct 2026 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792758582; bh=glJJVuo7Jj0MPAIZEvy9G1wvvfwWvftfy6C/cnUNinU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a84UeIwZiIEVxWvYmNK0k70X7sNaNvauZhafz5lN4xqtSdld7fh9Dn9aFFPi9hJ6k
	 vGcUsRNb6PgNCeNwEba6mzynHqhYbA5GwrZbP1D2NDiRewCTjIHyrLlDViZw9G+dZx
	 rWJ30/TratmPns+yAiKKVntmoHETZFB7sWsquD74=
Message-ID: <3c8d974f-55ff-455a-8676-d1ee823166e4@arm.com>
Date: Fri, 23 Oct 2026 17:59:36 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/page_alloc: remove unneeded forward declaration of
 __free_pages_ok()
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com,
 mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org,
 ziy@nvidia.com
References: <20261022124504.75642-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261022124504.75642-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22/10/26 6:15 pm, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> All remaining callers of __free_pages_ok() appear after its definition, so
> the forward declaration near the top of mm/page_alloc.c is no longer
> needed.  Remove it.
> 
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


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

