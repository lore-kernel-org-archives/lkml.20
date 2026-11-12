Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495663;
	b=gW5ghqh4nxyeAqjIQjneE47kBRE8sccNgXy9PFEHfBXxgYtxIxDNjtg5Aep20uZ7Da/E
	 KSd/0AoHvbHGgjcpx2yTVIjJcfEgmPp5k5UYQoYzmAiScGN4iwhpR0iwYW8Y2vQqqCc2A
	 9E3Jp41SLPUz6TuLR3zV07k/aKYgINKrz0KnCuWojCGlC1RXW/fZ8rijHy1MTjnBXTLlH
	 J7Dvp6z58rZozrjL9HD4RtTqyOXwZ/liZPcegrHrHWw5CPGGSM0UPM9139qm+W7/nyQyl
	 LiXOwUCqYzVSPG/mqIJNQZwVrVZj5keRvjCBmntgKqQPtwWMc9cE7ag975quUWxX4Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495663;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XWzzX2bCOjZE8Fke1tFaOhIuXhTbcbQFXwLZVTqEnEI=;
	b=lBCj5aJQOLelxDtvs5PsUdCDJeBCSZ2u5ULZkpBVN1RHnjtLl3R5Vzqe9y/bHfT8P5CB
	 Pbw2YF8Y+Ay0wwVuxut6opaUSrb8E8of6GePLD1C6o9yKXO6+co7vo9K4niAnvUGH+9Nv
	 UoRkBLPoz1L9JISm88nBb21BZSMm3pXNNWCYuj7lp4c6HewC53oDzfANGg7Z9jZT9v4dh
	 2ZPxV5U5mtnEgPoBn2bjMQkFTT+EBA2f4pWj9ON1zxBiowYzmF+Yj4KcMlgRA2jUPgZtV
	 ZGV8xzCNJfmuNN8owkKNqS9Qf36Moz+qkAft3usSSHUOPy0+vA/PU2gyaXtZuAO3Lig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNa1MpD3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A8606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNa1MpD3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360271F00A05;
	Thu, 12 Nov 2026 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495663;
	bh=XWzzX2bCOjZE8Fke1tFaOhIuXhTbcbQFXwLZVTqEnEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KNa1MpD330l3EWuySCHcUKGnIZC0ND/ubfob28E/jJ0ZXddKGwz7qZFjYFVe22jUO
	 fr1EGuZJOR11VLiJeZCKyr/jgX1FLWAmaxqHVwdYDJUQFAawUKkmpcc7we+wk1viR0
	 2L5yLmYZ0oPbeMCOeutt7KS+GBToJ8lh7VmWi0m/nSh37iimn818iZn5MRFjTrV7/W
	 JBlv43bsdj08e2nohFZMOaGYvY3MD101tc0A4LRMEM6dsvEaDmSsu4CRQgPG87CFyi
	 Bo1eFHvgTGblFg/uCDkdRlIF+G3280cgX6v+zdTQPXov6TGxxq9LNAF9cQd0PYd5gJ
	 o7Hw/ecXuTd2g==
Message-ID: <76157846-e30e-46b0-b767-0902e3f8c82a@kernel.org>
Date: Thu, 12 Nov 2026 16:00:58 +0100
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
Subject: Re: [PATCH v2] mm/slab: remove outdated comment in
 create_kmalloc_caches()
Content-Language: en-US
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Hao Li <hao.li@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20261112144653.840367-1-ekffu200098@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261112144653.840367-1-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 15:46, Sang-Heon Jeon wrote:
> Since commit 16a1d968358a ("mm/slab: remove mm/slab.c and slab_def.h")
> removed SLAB, no kmalloc cache is created before create_kmalloc_caches().
> 
> So remove the outdated and redundant comment.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
> Changes from v1 [1]
> - Remove the whole useless comment
> 
> [1] https://lore.kernel.org/all/20261104144753.2266231-1-ekffu200098@gmail.com/
> 
> ---
>  mm/slab_common.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 01c64ef661e7..10603b9cbb53 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1028,11 +1028,6 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
>  		kmalloc_caches[type][idx] = kmalloc_caches[type][aligned_idx];
>  }
>  
> -/*
> - * Create the kmalloc array. Some of the regular kmalloc arrays
> - * may already have been created because they were needed to
> - * enable allocations for slab creation.
> - */
>  void __init create_kmalloc_caches(void)
>  {
>  	int i;
> 
> base-commit: ce6518e61e3b4bf4f97f7ac6204049b9eba7eb75

