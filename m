Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432169;
	b=BYgKo2hdsbqGqxOZPWcdgisQvoV5wB0IU2tT3jHPZi62HXdFjZ1rWuAEqAWmJT4fITwQ
	 e+Zd0qe/IIA9Oem8HL8lvUHohiUOGfxKoI/Ww7f3Ra3EiYsdrP8KhIAgwpX0xFFinHFyc
	 H/HwTc4rWSLqr97zEx2gTyUu8JWbCg1tjXRJ4pAnOBkiE8CTT9LxVy3kWsd6aPfSfRjQ7
	 H0inKy7aEUqOlXVJaMAQ08vNEeoKuutWrmj5aQ9w9rdYFpNjasS47kB28WiCxi+2xvi/R
	 lCs0kxZ2Y4IxKW6fagC9vMHfmwXWnaFrFtTw1K5lJliD0PJ5MO3NPscKbOOhZ3BiHLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432169;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=84vZokJdy1G2Wp0ECYuYujiRQot5ob2MnqXlmNb25mQ=;
	b=tguOddrZHL650Oip1Dtg1J5VwdDZmL8vyfiywLu+YOlsRTAcEnrVsbbTqcCIcsKLCkUV
	 EFCoUUtTgBav9zWAzfm0fiy6zDiclIB/RJqDDOffRuXvnnyuwEUVmQnRi4I1QccNUrOhW
	 mxTRMwKW/eB7evYlGXkOT8txDZ8mxVAFManmpvPzdUPYxTT6xnq6900dpoRrAznq8odv8
	 s+NbP9BpJDU8+RYbfjRIsLARhD7PIMSDfMNQSqnKyJnL9ysoYW+PNfBR9w8N4O1GueEW8
	 b0NnKckLZD/D2AysA70VYXtF193msVzyjiL70CAWEhIZdNyn8dfOWHcPNSYjydQLWlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M5ZEqEz+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE0E606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M5ZEqEz+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E051F000C4;
	Mon, 19 Oct 2026 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792432168;
	bh=84vZokJdy1G2Wp0ECYuYujiRQot5ob2MnqXlmNb25mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M5ZEqEz+0N8eLpvUxe5VAvH52RopY+l1Q2dtq/dgjRTIT5zyLGqAynY3wXGzxPxdV
	 ynoZvlXZm6uUe4LjEjw9qEJgcpCIVREb7qyvEq2KQWPjqrjhn/yJ4XzkCvSv0czel/
	 7kfOXqhCAOdCXq0W9ad+68B7nra4FtCSmHbH6xKBQG7ZtKctlq2cUoPqlEK/R/MGZD
	 LiGqowNpethjEgsQt4zzThq0G6BwcvZhPltZW5pz4lF/ltN3nJKHGQQOg5GJzVbuOK
	 Qu2K9VddvwVGPJejoaqk6u6dRqZFq6AJW9t8D8Lh50YaAUVNlG61nbmp/2s2MjjZvJ
	 b8TGdBo5D8tYQ==
Date: Mon, 19 Oct 2026 18:49:26 +0100
From: Harry Yoo <harry@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] mm/percpu: clean up callers of pcpu_obj_full_size()
Message-ID: <atZWW7V0MI--HOke@thinkstation>
References: <20261019162803.281810-1-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261019162803.281810-1-joshua.hahnjy@gmail.com>

On Mon, Oct 19, 2026 at 09:28:02AM -0700, Joshua Hahn wrote:
> The size of a pcpu allocation can be interpreted in two ways:
> 1. The size of the allocation attributable to a single CPU.
> 2. The total size of the allocation across all CPUs, including the
>    allocation overhead (for obj_cgroup membership).
> 
> In most accounting paths for percpu memory, we need the second
> definition (total size). Make this more obvious by coalescing the
> callers of pcpu_obj_full_size().
> 
> No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---
>  mm/percpu.c | 39 +++++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/mm/percpu.c b/mm/percpu.c
> index d7883507dc151..76848e096caee 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -1623,7 +1623,7 @@ static bool pcpu_memcg_pre_alloc_hook(size_t size, gfp_t gfp,
>  	if (!objcg || obj_cgroup_is_root(objcg))
>  		return true;
>  
> -	if (obj_cgroup_charge(objcg, gfp, pcpu_obj_full_size(size)))
> +	if (obj_cgroup_charge(objcg, gfp, size))
>  		return false;
>  
>  	*objcgp = objcg;
> @@ -1642,11 +1642,10 @@ static void pcpu_memcg_post_alloc_hook(struct obj_cgroup *objcg,
>  		chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = objcg;
>  
>  		rcu_read_lock();
> -		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
> -				pcpu_obj_full_size(size));
> +		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B, size);
>  		rcu_read_unlock();
>  	} else {
> -		obj_cgroup_uncharge(objcg, pcpu_obj_full_size(size));
> +		obj_cgroup_uncharge(objcg, size);
>  	}
>  }
>  
> @@ -1662,11 +1661,10 @@ static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)

Perhaps it's better to rename 'size' parameter to 'full_size' in those
memcg hooks to make it clear it's expecting total size?

Otherwise LGTM!
Thanks for cleaning this up.

And it might be beyond the scope of this patch, but I think
trace_percpu_alloc_percpu_fail() should take full_size instead of size.

Wdyt?

-- 
Cheers,
Harry / Hyeonggon
