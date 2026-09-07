Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCAC499F37
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778359; cv=none; b=BcqwtWGBNk12iNZy1d3miXNvKwSsXBetBmZ3E1aJjiuzNKUpmZhJ+rJVMxir1wWdONzt/ktbcP6i2Jd1h2zgX2qp4vS8KHfiD1yHeVBobXb5Crc1A8lGwuJ/8xl9uqP1KpntuqOwRk3bZW34mJ1odcJ+y8tLhD4TQ30KWdcpAzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778359; c=relaxed/simple;
	bh=veLSlCX5ITgmXND1QxVSP8GF9ucuQEFqR09oh1MjNvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwPp3E4MjENZNqjS3RvDnv6H5RLMuftEsV20reJedw1GSR0WBT7th5f302cm6NsMJcrjUpH1y+Rv0lKzegSJ+Fo6Y5UUmE1bnSyDlZGsrbjiylJ9cCHG8ikF6sSTQE42r5bd+06ga55en4ybZnsZmRyo5eQa1rQXNnNP84c9L0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FPmqLvNG; arc=none smtp.client-ip=91.218.175.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FPmqLvNG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=veLSlCX5ITgmXND1QxVSP8GF9ucuQEFqR09oh1MjNvw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788778354; v=1; x=1789383154;
 b=FPmqLvNGSelN/rlCLIg1CFeJhLjvx/ZNnB1VtbTfOR1JatUfHPu91fAiwRam+L13YzIwllLp
 cSa9olUaOLstpW1uNAwVMAwzPu5/8kx5S3QcPK9ADFQzDf35mJfSZoft1m0Adep9ERkMPYXCU9F
 FB/A5gY31O10brAU9cAlSVEw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a4af63cff6f3130f;
	Mon, 07 Sep 2026 10:52:34 +0000
X-Mizu-Trace-ID: a4af63cff6f3130f
X-Migadu-Flow: FLOW_OUT
Message-ID: <eca414b4-9baf-4d2f-9842-373f5cc79d60@linux.dev>
Date: Mon, 7 Sep 2026 11:52:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: zswap: mark the zswap shrinker SHRINKER_NONSLAB
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
 <20260904033503.4067283-3-qinyuntan@linux.alibaba.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260904033503.4067283-3-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/09/2026 04:35, Qinyun Tan wrote:
> With kmem accounting disabled (cgroup.memory=nokmem), memcg reclaim
> never invokes the zswap shrinker: a cgroup under memory pressure does
> not write back its own zswapped pages to make room; they are only
> written back by global reclaim or once the global pool limit kicks in.
> 
> The zswap shrinker is registered memcg-aware but without
> SHRINKER_NONSLAB, so under nokmem it is treated as a slab shrinker:
> before commit 03375203e1da ("mm: do not allocate shrinker info with
> cgroup.memory=nokmem") it was skipped by the !memcg_kmem_online()
> check in shrink_slab_memcg(); since that commit it is demoted to
> non-memcg-aware at registration.  But the zswap shrinker is not a slab
> shrinker: it tracks zswap entries and resolves the owning memcg from
> the folio's objcg, independent of kmem accounting.
> 
> This was noticed by Michal during review of the patch "mm/list_lru:
> don't copy stale shrinker id from non-memcg-aware shrinkers" [1].
> 
> Mark it SHRINKER_NONSLAB so it keeps its memcg awareness and runs
> under memcg reclaim with nokmem.
> 
> [1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com/
> 
> Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")
> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> ---
>  mm/zswap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 761cd699e0a3e..8bcc2997d7719 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1263,8 +1263,8 @@ static struct shrinker *zswap_alloc_shrinker(void)
>  {
>  	struct shrinker *shrinker;
>  
> -	shrinker =
> -		shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE, "mm-zswap");
> +	shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
> +				  SHRINKER_NONSLAB, "mm-zswap");
>  	if (!shrinker)
>  		return NULL;
>  

Acked-by: Usama Arif <usama.arif@linux.dev>

