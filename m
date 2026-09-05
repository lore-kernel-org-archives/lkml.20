Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2045043F4B3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788593348; cv=none; b=cWHW/gaa1pB2xacQygqnkYR9Zgj9CrlDb5NWnpYeO2/fsL1FZx6ZC2sC821MfJzJ3KNEKgmCS0N2swbJkripwo+pVcKMFf2RjC1DApeA0MZG6+sr7nKBSouATBjl4i8wHkHf7HEYk0jZtw3umBc24h9kWsi4/po/+EQEc3cBOjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788593348; c=relaxed/simple;
	bh=FO7uk+ZczJKUWeZKSugD0fmMxualw4LCIKgewWBGV1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HK62tkmOkcgh+9oGJZwo3f0pyVYO8ki1aYXY/tW7a67ezAsyqvtHPP8SjkHu7YvjCQw0004TWttjBOvVZozqvrIEo9yH1N73pKkZTxvdNDsKYwxID1D8zwZeGDBJFVfXBg2VtBlaqGUS2/wt0lgwHVBnG+gCROn1lo/Rs1Mt0gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v+1aQHEU; arc=none smtp.client-ip=95.215.58.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v+1aQHEU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FO7uk+ZczJKUWeZKSugD0fmMxualw4LCIKgewWBGV1E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788593340; v=1; x=1789198140;
 b=v+1aQHEU+7z/4vLhh+FgkM1jM2UCEcNhvKYSClOyo1EF4PPiORh2Pu44uQcj3BvD8MIXGA7r
 xIN41nO+qratya6eMbBV1kzlVnpgowpS+u3MDj3XaNg5nt3tDWqQQ4EKE6a/mA/cGuBpyuZeSvj
 06r3tQATIwHDAoMErun48YRo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d6a05955758b5d40;
	Sat, 05 Sep 2026 07:29:00 +0000
X-Mizu-Trace-ID: d6a05955758b5d40
X-Migadu-Flow: FLOW_OUT
Message-ID: <c3bec318-ef9d-4d96-8a98-a68717c17201@linux.dev>
Date: Sat, 5 Sep 2026 15:28:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] mm/memcg: return the memcg when putting
 memcgid
To: bingfangguo@tencent.com
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Chinner
 <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Bingfang Guo <bfguo@icloud.com>
References: <20260901-bingfangguo-memcgid-rework-v2-0-8edd7f7a7251@tencent.com>
 <20260901-bingfangguo-memcgid-rework-v2-4-8edd7f7a7251@tencent.com>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260901-bingfangguo-memcgid-rework-v2-4-8edd7f7a7251@tencent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/1 16:58, Bingfang Guo via B4 Relay wrote:
> From: Bingfang Guo <bingfangguo@tencent.com>
>
> __mem_cgroup_uncharge_swap() needs both the memcg and the id refcount
> drop.  Right now it looks the memcg up by id, uncharges it, then looks
> it up again inside mem_cgroup_private_id_put() to drop the reference.
>
> Make mem_cgroup_private_id_put() resolve the id once, drop the
> reference, and return the nearest online memcg with a reference held for
> the caller.  __mem_cgroup_uncharge_swap() then uses that memcg directly
> and drops the reference after uncharging, avoiding the second xarray
> lookup.
>
> Signed-off-by: Bingfang Guo <bingfangguo@tencent.com>
> ---
>   mm/memcontrol.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 048c9bb0fad79..f0503a1e5492d 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -4048,14 +4048,28 @@ static void __mem_cgroup_private_id_put(struct mem_cgroup *memcg, unsigned int n
>   	}
>   }
>   
> -static void mem_cgroup_private_id_put(unsigned short id, unsigned int n)
> +/**
> + * mem_cgroup_private_id_put - put memcgid and get the nearest online memcg
> + * @id: the memcg private id got from mem_cgroup_id_get_online
> + * @n: count of references to put
> + */
> +static struct mem_cgroup *mem_cgroup_private_id_put(unsigned short id, unsigned int n)

Having an API that put reference-counted resources return a struct pointer
is a very strange design. Please don't do that.

>   {
>   	struct mem_cgroup *memcg;
>   
>   	rcu_read_lock();
>   	memcg = mem_cgroup_from_private_id(id);
> +	if (!memcg)
> +		goto out;
> +
>   	__mem_cgroup_private_id_put(memcg, n);
> +
> +	while (memcg_is_dying(memcg) || !mem_cgroup_tryget(memcg))
> +		memcg = parent_mem_cgroup(memcg);
> +
> +out:
>   	rcu_read_unlock();
> +	return memcg;
>   }
>   
>   static void mem_cgroup_private_id_kill(struct mem_cgroup *memcg)
> @@ -5816,7 +5830,7 @@ void __mem_cgroup_uncharge_swap(unsigned short id, unsigned int nr_pages)
>   	struct mem_cgroup *memcg;
>   
>   	rcu_read_lock();
> -	memcg = mem_cgroup_from_private_id(id);

I think we can introduce a new helper like obj_cgroup_from_private_id(),
We can use the ID to get the corresponding obj_cgroup, and then get the
mem_cgroup.

Muhcun,
Thanks.
> +	memcg = mem_cgroup_private_id_put(id, nr_pages);
>   	if (memcg) {
>   		if (!mem_cgroup_is_root(memcg)) {
>   			if (do_memsw_account())
> @@ -5825,10 +5839,10 @@ void __mem_cgroup_uncharge_swap(unsigned short id, unsigned int nr_pages)
>   				page_counter_uncharge(&memcg->swap, nr_pages);
>   		}
>   		mod_memcg_state(memcg, MEMCG_SWAP, -nr_pages);
> -		mem_cgroup_private_id_put(id, nr_pages);
>   	}
>   	rcu_read_unlock();
>   
> +	mem_cgroup_put(memcg);
>   }
>   
>   long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
>

