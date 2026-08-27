Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8EF44236A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843204; cv=none; b=Hq+rvd6M8Sa4hBF3pfAoqIRCWN8tVVBFp431f3qkL4WjaTst8OpdoIB1ML2rFqlV2OnrlVGDk41MZP5Z+N4ZfS1pb2RQ175YpRVSw2G4tzKrQFymT9pgobmdKbE95bDJHEUlCJzR8GoGNo2I4XupwxvxVRxdAzQmLjkMfUOXx0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843204; c=relaxed/simple;
	bh=+JuCJSHEyFJZYkCsiiLUs6awMrfi2Te4XdjsIG5yNjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNWe2dmiS63zTlloLCh2O3Y5IFk16MIuEGwQBgrnkWS5MQ33nNf0OYCcO9BTJwZxrq6EpzeY+cE169r5nohk+V9bM2C3uDszyTqMmU8/f88FMVRUPz2cym6iHZ7ZeiLrF0ch6L25MAkt31t7mlCrfmsuHV2C9HPP6wusxZaMo94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ewJL9hJL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gCDpB0no; arc=none smtp.client-ip=103.168.172.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ewJL9hJL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gCDpB0no"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 6FDF713800BE;
	Thu, 27 Aug 2026 11:06:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 27 Aug 2026 11:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787843202; x=
	1787850402; bh=vyVgXPC7XqGZWzz9wNdixBWf9MizjLo93ogBCNARLD0=; b=e
	wJL9hJL68P74mIyj/2wIZ2DkbFhNV08+Ks+6er8Z5FEqevPdPnxAxWV2nG++1qrM
	2xKnV3NiO0bIOSri5WfvXMdm0yne/7P1bsRd2NvTdAaCLvKZHjwlT3dUnKqxqhfu
	mKwgvn4zPF+oAP7hMAjU2e4IzKFz4FGDt1E8NaDGM9wdQyEk9iRoya9+WsgMMtDY
	WRakX9Dfn6tmKyPlBVXxnZA6zfO0nrQvENabIdpcrvNvvcetNnBMs6+fFIyTesMk
	cVblarbQ2ffUmCJyNFDS5pA7EJs45OMjzM4kol6uingknOqVU/JcPG2zW+PcdA98
	ceOs7C2JCFLd/Z7cxjSRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787843202; x=1787850402; bh=vyVgXPC7XqGZWzz9wNdixBWf9MizjLo93og
	BCNARLD0=; b=gCDpB0noOCKmpvQ0tgbD9uUfpK/rd1Yk3BVSabI2nqhKZdArI4+
	IOncXscrh1DmFVKfWtiwNYvVoeMIRzxsZMG9sHjjiuGcAabTkVnW4v26Hc+GAjBJ
	GRFvCnF4I9+EMEzwL4XdUhyg+YgVaEP7WmA22EbZdEGGBIoTKAuz5DRmizbJruCz
	635a9K9EhZLaGq6Ou8JVxvNk1KSOGE++5lKdgVO8bzoYdO3FL/qLHkxRiHthBntV
	sHXNuVqKeXq1D76rsPJuAxydKcOVkVEnZverKIrK6oyzklxEaXgDxq7tPXK/yUhG
	/vkTD1PZ1a0cFnXIQzq8imS3thSeyfSQzMw==
X-ME-Sender: <xms:gVKQavMtxw8k3KjWdBbXWHRyLBVD3k50KTjpDv2UR5QbyJN_SszZZA>
    <xme:gVKQaobzixOI7pXDdmyzxNY3n-cOV7UaBgYtqyxz4jgAYrmTmIJ_1rCtv7Dkipg2X
    paHhjUCunThCAfMlH-4Ww4IrsS2yjHx7FT--XqFqjl8-OQlI_HZxlo>
X-ME-Received: <xmr:gVKQalabVcIrMl-2XNx6Z4y0acPO7pbxJG1jHCiUOTe1Z3rFL_oSPep6FPE>
X-ME-Proxy-Cause: dmFkZTF7rqhqgfgNccL2sR2hyItVdmKcKUadzZgok63Pcy2lXH7+X0fqLqVk/pB6WyGIcu
    9MKe0/eXeV6rQomO1IDumtZ+ROQyHaLQNO7F7ESHBVIiKgzH7eB36INx8ifcAzbkCcSdkB
    YXe8izaqA9Tu9pLIGfNoVjSfZ7NYAM16xvUNys0rpUr7BNMNv5LWriUueN07q9PkXbN1PY
    z/jN03V+4Y7LxsDv9S1aleZ98TWWU6Q/jICVYj5QwMPZibdeIs8AJwzmOI4UTadWt4XDoN
    Hjrf9ky6tKoR3muqanBE99vi72fMYN6yuXLmY2h11OWHxrAczFjbbAcpGNkWE6y4rw3vrJ
    0O5w6kI6akqRYcAZbkqFXHJydzE09h14qyHoB7jYHLvPHE69ubfyHCqxyGD2960LEPm6CK
    YtGRCjPD47qD80CBT5p12LcwsskywfRwkX5q0SD8lsIBBFy+r27ubi747GPv6VeeKgdLkt
    rzKFECsqKX3K4ZzpJ5kTpOPIJhVj9laABHGVdmPIRHo77elfFGr53m8w6/qdOrYpMjERI7
    2EOrckafIsqTmJ6+pQ8GGTT7+4w33pYjSChh7RO2PCVH3aY9wsQ3dKgBMggRK8ipVry7lE
    eVOb7fh6V5TxGyP7iGYYVTUrCn8aiQN0CKYyg05yT/6hlbcfbLQG72JsgWRw
X-ME-Proxy: <xmx:gVKQanQchSGT3stTABorYgGNj7W6EUWDfqxL8AGWp65CpbGpDTPs_A>
    <xmx:gVKQaq1xEdIuxeXo3rYRCF4Lgfv-e24WDVrkKpjhiBI4PFoIigYLhw>
    <xmx:gVKQatWJrLl0-g20grYx8-G2znDUaPUjXvsTg_3U2aenTIStxCyLwA>
    <xmx:gVKQarzA1lJ_hn3De-IGB-6SlAl9WsBzMGgFh9hUjDsXgzsAn0e8uQ>
    <xmx:glKQailPGULPrI2iArVtdv2LLjyCLa7JAkpNMxDpl_vIDIbxvVp08R0g>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 11:06:40 -0400 (EDT)
Date: Thu, 27 Aug 2026 16:06:40 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v3 05/18] mm/huge_memory: rename __split_unmapped_folio()
 to __split_frozen_folio()
Message-ID: <apBQqJZ89MHZi2RJ@thinkstation>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-5-9b43f5163238@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-swap-thp-cleanup-v3-5-9b43f5163238@tencent.com>

On Fri, Aug 21, 2026 at 02:55:18AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The helper splits a folio whose refcount is frozen: the frozen refcount
> is the state it relies on, while unmapping is arranged by the caller
> beforehand. The old name caused confusion and people may try to call the
> helper on non-frozen folios.
> 
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

This patch is fine:

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

> @@ -3989,8 +3989,8 @@ static int __folio_freeze_split_unmapped_anon(struct folio *folio, unsigned int
>  	if (do_lru)
>  		lruvec = folio_lruvec_lock(folio);
>  
> -	ret = __split_unmapped_folio(folio, new_order, split_at, NULL,
> -				     NULL, split_type);
> +	ret = __split_frozen_folio(folio, new_order, split_at, NULL,
> +				   NULL, split_type);
>  
>  	/*
>  	 * Unfreeze the post-split folios and put them back to the right
> @@ -4053,8 +4053,8 @@ static int __folio_freeze_split_unmapped_file(struct folio *folio, unsigned int
>  	if (do_lru)
>  		lruvec = folio_lruvec_lock(folio);
>  
> -	ret = __split_unmapped_folio(folio, new_order, split_at, xas,
> -				     mapping, split_type);
> +	ret = __split_frozen_folio(folio, new_order, split_at, xas,
> +				   mapping, split_type);
>  
>  	/*
>  	 * Unfreeze after-split folios and put them back to the right

But now you have *unmapped_anon/file() call *frozen_folio().

Given that you introduced *unmapped_anon/file() in the previous patch,
why not give them the right names from the start?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
