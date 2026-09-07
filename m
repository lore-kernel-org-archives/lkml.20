Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185E9485CF1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778334; cv=none; b=qqc/LPScH9gscgKG44qfPIXOThEHSW3crH/91AokwHjwvI9AfrnULHow9dzUtdhNPy5EuQi6VQMi4SdS3ZnCX57OEWWm95UciVGTXK0a+7ZYh5Ray3Iam5UJCAZvIne0Emlos5TGv63+2JFontG9tvHSBC+SeglQJoSjwOOfo34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778334; c=relaxed/simple;
	bh=kIs7OO2Nz8gSyLnqYZsS6sd9DA4Hzm9SNGUNUFTSoCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKqVV2Nv2uffNE4isDC8uaf/Yidnx2Gd2MZE2WL6yHm5YNipJY0q/xVziOwDoeDRlw+rHSGwy6F3c4Ugu3shG509N1ICm8P1jkSl97c7UhJgaVNMv/VagjDM5LH36Hojf3vM2Ax5Bwi+upOa/eoEb27gNvPAg7brCVEjSRUJL8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EhO2ieRZ; arc=none smtp.client-ip=91.218.175.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EhO2ieRZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kIs7OO2Nz8gSyLnqYZsS6sd9DA4Hzm9SNGUNUFTSoCY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788778327; v=1; x=1789383127;
 b=EhO2ieRZ2O4YEVpxN/0PD59C0RgiTOl9GGy/gBa7S8zbgwOG6/I1vOlVN0fEN45DjQsQctdK
 CcaRX+rG0XelhcHcOg85AxkDmm5MPoGMN1xCRyJnZvH4vONiRIu8qmmRKreXBWceIaICD2ZTG9Q
 9G7JzQg+fEcUjJDZIIMNNfHM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49a947ce0a393c76;
	Mon, 07 Sep 2026 10:52:07 +0000
X-Mizu-Trace-ID: 49a947ce0a393c76
X-Migadu-Flow: FLOW_OUT
Message-ID: <a0277c83-6beb-4e65-a892-37eace21fc0f@linux.dev>
Date: Mon, 7 Sep 2026 11:52:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: thp: restore SHRINKER_NONSLAB on the deferred
 split shrinker
To: Qinyun Tan <qinyuntan@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 Kairui Song <kasong@tencent.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Xunlei Pang <xlpang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260904033503.4067283-1-qinyuntan@linux.alibaba.com>
 <20260904033503.4067283-2-qinyuntan@linux.alibaba.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260904033503.4067283-2-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/09/2026 04:35, Qinyun Tan wrote:
> On a system booted with cgroup.memory=nokmem, the deferred split
> shrinker is quietly demoted to a non-memcg-aware one.  As a result,
> partially unmapped THPs are only split under global reclaim; memcg
> (limit-induced) reclaim never splits them, so a cgroup under memory
> pressure keeps its underused THPs intact.
> 
> This is a regression from commit fafaeceb89a5 ("mm: switch deferred
> split shrinker to list_lru"), which re-registered the shrinker without
> SHRINKER_NONSLAB.  The shrinker had carried this flag since commit
> 0a432dcbeb32 ("mm: shrinker: make shrinker not depend on memcg kmem")
> precisely so it would keep working with kmem accounting disabled.
> Without the flag, shrinker_memcg_alloc() fails with -ENOSYS under
> nokmem and the shrinker loses its memcg awareness.
> 
> This was noticed by Michal during review of the patch "mm/list_lru:
> don't copy stale shrinker id from non-memcg-aware shrinkers" [1].
> 
> Restore the flag.
> 
> [1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com/
> 
> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> ---
>  mm/huge_memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 644d6905b49cc..16f9aa5b2d077 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1022,7 +1022,8 @@ int folio_memcg_alloc_deferred(struct folio *folio)
>  static int __init thp_shrinker_init(void)
>  {
>  	deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
> -						 SHRINKER_MEMCG_AWARE,
> +						 SHRINKER_MEMCG_AWARE |
> +						 SHRINKER_NONSLAB,
>  						 "thp-deferred_split");
>  	if (!deferred_split_shrinker)
>  		return -ENOMEM;

Acked-by: Usama Arif <usama.arif@linux.dev>

