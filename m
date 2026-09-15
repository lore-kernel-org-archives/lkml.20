Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8056741F353
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489679; cv=none; b=pzcSyTARyLA4V9rB3WCnIjeL9V5T85dYlvp58SjeRU3Osx5h+t5EBBfu+eIdgRN/VXXYC/LGP7FUwLCDVR2n6RtRP8fAegTbLORWX0GGD/eiwggkQuPjF5XQrQjeKheoYlxxu8jCnVXlCpNxQ/c2SPGq2rYzQW8eL2mzSbNlLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489679; c=relaxed/simple;
	bh=5aAOwXTYMykx5gxXWRId8scEdWimaCHbC2wDxGMxApw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pk7FcyXgv4jOC7MHZTlB1bbIrlP0GaehhdP+/QgY37S6Tn5I9MtuNDvD7BA1APZJsqs92RX4ww7ltyCG7ubR50Noj0b1GhVq6VJ4okdnHjyZbNFQDackWxo1rDC+ORpaV6FvPd4E4542/6KaRukVtWMe5ouH47Q4GzmoxQzANJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aaDciXGj; arc=none smtp.client-ip=91.218.175.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aaDciXGj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5aAOwXTYMykx5gxXWRId8scEdWimaCHbC2wDxGMxApw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789489675; v=1; x=1790094475;
 b=aaDciXGj//CpMTkGjwOYER+DQTexXuFR5qvdm2eqrq8Vfq1ZkZ/0Umej2dtR4wcwuPR3egUY
 r/cER8O0q+sJ8+FYJCXYpev06UMAqgDTgp+mLVL8nB/Oo32AI3proogaeAM8qgUzo2iPdx8S9x0
 x7QOsp53q1REMDl+Krh8hH0o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7bfd351e13a25abb;
	Tue, 15 Sep 2026 16:27:45 +0000
X-Mizu-Trace-ID: 7bfd351e13a25abb
X-Migadu-Flow: FLOW_OUT
Message-ID: <9568025b-7a99-4404-a371-65f26a29a411@linux.dev>
Date: Wed, 16 Sep 2026 00:27:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mm: refactor zonelist constructors and iterators
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org,
 ziy@nvidia.com
References: <20260912030424.2889731-1-gourry@gourry.net>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260912030424.2889731-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/26 11:04 AM, Gregory Price wrote:
> find_next_best_node() picks the next-closest node when building a
> fallback list, and hardcodes N_MEMORY as the set it picks from.
> 
> Refactor it into find_next_best_node_in(), which takes the candidate
> set explicitly.
> 
> This makes the existing behaviour explicit at both mm/memory-tiers.c
> call sites - they select demotion targets in fallback order from
> N_MEMORY - and lets callers narrow that set.
> 
> Then extract the per-node construction loop out of build_zonelists()
> into build_node_zonelist(),i parameterised on the candidate nodemask
> and destination zonelist index.
> 
> Together these allow a zonelist to be built over a candidate set other
> than N_MEMORY, into a zonelist other than FALLBACK, and iterated in
> fallback order over a caller-defined subset.
> 
> These are prerequisites for generating a private node zonelist (nodes
> unreachable by default), but are otherwise general improvements to
> the existing interfaces so I'm proposing them separately.
> 
> No functional change intended - purely refactor commits.
> 
> Verified on x86_64:
> 
>   - find_next_best_node_in() compiles to the same 319 bytes as
>     find_next_best_node().
>   - Both mm/memory-tiers.c callers grow a single instruction - the
>     added argument.
>   - Boot-time fallback orders are identical on a 4-node guest with an
>     asymmetric distance matrix.
> 
> Gregory Price (2):
>   mm: refactor find_next_best_node to find_next_best_node_in
>   mm/page_alloc: refactor build_node_zonelist() out of build_zonelists()
> 
>  mm/internal.h     |  6 ++--
>  mm/memory-tiers.c |  7 +++--
>  mm/page_alloc.c   | 74 +++++++++++++++++++----------------------------
>  3 files changed, 38 insertions(+), 49 deletions(-)

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui
