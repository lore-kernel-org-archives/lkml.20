Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826481;
	b=z3CaJDsiGnDlwEC3Naz0cIb8jan5M2pv8Nmxn9TZffj3CBkKVEoxGrwkL/VldhkmOeca
	 HVxdtSczC0QyjmQuq9TTukRgxaNRJT0m9QjitVtq4xE6m3Jt5daM4lTlih06wFfvW+50n
	 kDXVHInp+8z1F6gP0lzlBaBqiLlyMLq+sEh/ayLoAaueIybbJ+C6x2KnmrGXG4pDuswBC
	 CkG8Wt9eXHaKu2PUp8RXAZ6dROUjoSLmZe/9nflAkW7pWts0WauoXWTdnJ5YrsKK1P7h6
	 4MjEbX10MqHihFp0jz2wMJA8dXDoZK4G1YIq18R07xt53j9RcwzF+pZFN6JrxpSnMqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826481;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rUXIEzzZbx+pvk5hQhC5uQsVJ+Wr1axlLvfdDODcWmE=;
	b=OToLlT0jFU/ErPeGYW7KIrAYClHnyGUaYWb17tp+Nue916FPT01hnqZairOeCudS5Ktz
	 QUvyPA2eaVvfdOnSDyIYYJWeVgmHJNh+o+bxboi8EV7YIape46jFNUrc2wHeJol9hGw4R
	 YrWKFtDpLJ7ygVFwOJvJKBdciTBOC1PWEaj2K884A6G4a+Wb/lcohNT7qxywJa+lfaGJV
	 yaM4whuPBK2s/c5wBVjgjdjiZiJZFpSfg1Q93znaj/0ZgrvP2Yddw2+pxnWpMf98FB2Nd
	 UKymsvFNXu7kFKrdTVj7fdbVEf80gVljtNf+8lKijhhqS93KqBUuiuRljfzfEfDfyqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+fgOzHk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA02D606A887
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+fgOzHk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D441F000C4;
	Mon, 16 Nov 2026 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826481;
	bh=rUXIEzzZbx+pvk5hQhC5uQsVJ+Wr1axlLvfdDODcWmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=M+fgOzHkr8hBd2SC57MQPYOT+v3WbLVix+CbLh5WS/cVkG/7psr2ewW/ujd7whLPC
	 KMCUWnxBRjzZAI+xHnE2ZepI3e3xDp+IGS3IPiUC7tityO8okLOC6uUjomINEtSfS/
	 sGz43WsxfRT3XB2OUcNq41La+hScCru6Qtkfc8o8yac37EH7k1Et0aX0QMYV2pmaC3
	 0QgRezQDfsmcD6FzKQChjK96MP+R6LPBAtx9xG+3skEgxSR8W9nIQTZqaOIXIyyoV5
	 PscNH8WzGg1n7EHnvUNuAxTdN5N4pYUxwLFLvJq+D2x7L8GszeD4DGdsXH2i9mH8Fs
	 2PPBLKy4gEHvg==
Message-ID: <0e626675-c6f9-40d7-a4ae-de069154ada2@kernel.org>
Date: Mon, 16 Nov 2026 11:54:37 +0100
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
Subject: Re: [PATCH] mm/slub: don't let kmemleak report rcu sheaves
Content-Language: en-US
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
 Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com,
 Breno Leitao <leitao@debian.org>
References: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+CC Breno

On 11/13/26 16:18, Nguyen Ngoc Thang wrote:
> kmemleak reports full rcu sheaves as leaked:
> 
>   unreferenced object 0xffff88810005f600 (size 512):
>     hex dump (first 32 bytes):
>       e0 79 f0 2b 81 88 ff ff 20 00 b4 81 ff ff ff ff
>       00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00
>     backtrace:
>       __alloc_empty_sheaf mm/slub.c:2854 [inline]
>       alloc_empty_sheaf mm/slub.c:2874 [inline]
>       __pcs_replace_empty_main+0x260/0x2e0 mm/slub.c:4806
> 
> The second word is rcu_free_sheaf and the size equals the capacity: the
> sheaf was handed to call_rcu() by __kfree_rcu_sheaf() and is waiting for
> a grace period. At that point the only reference to it is the ->next
> pointer of the previous callback in the rcu callback list.
> 
> That previous callback may live in memory kmemleak never scans, e.g. the
> rcu_head of a struct slab queued by rcu_free_slab() for a
> SLAB_TYPESAFE_BY_RCU cache. Slab pages are frozen (page_count() == 0),
> so kmemleak skips their struct page. The chain from rcu_data is cut and
> the sheaf, typically allocated long ago and recycled, looks unreferenced.
> Since the sheaf is then not scanned either, the objects it is about to
> free can be reported as well.

I don't get this part. The previous object can't be that much gone, RCU
still needs to get to this sheaf at some point, so there has to be a live
pointer somewhere?

> Sheaves are allocator metadata and are always owned by a pcs, a barn or
> an rcu callback. Mark them with kmemleak_not_leak(): they are never
> reported but still scanned, so objects queued in them stay referenced.
> Allocations that can't spin are not tracked by kmemleak, so skip them,
> as alloc_slab_obj_exts() does.
> 
> Fixes: ec66e0d59952 ("slab: add sheaf support for batching kfree_rcu() operations")
> Reported-by: syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=527fed49e5b988882c9a
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

I wonder if we should rather do this at the moment the sheaf is handed over
to rcu.
Or if it's a generic problem that should rather be solved by kmemleak having
visibility to the rcu queues.

> ---
> Reproduced in QEMU (syzbot config, 2 vCPUs, numa=fake=2) by stalling a
> grace period with a preempted reader on CPU0 while CPU1 interleaves
> rcu_free_slab() (filp slabs) and rcu_free_sheaf() (maple nodes freed by
> kfree_rcu()) callbacks, then running two kmemleak scans:
> 
>   before: 16-18 sheaves reported per run, rcu_head.func == rcu_free_sheaf,
>           plus maple nodes held by them
>   after:  no sheaf or maple node reports, no new warnings
> 
>  mm/slub.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index cd671b934719..e01416ae0b4a 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2856,6 +2856,14 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
>  	if (unlikely(!sheaf))
>  		return NULL;
>  
> +	/*
> +	 * A queued rcu sheaf may only be referenced by an earlier rcu callback
> +	 * in memory kmemleak doesn't scan (e.g. struct slab). Never report
> +	 * sheaves, but keep scanning the objects they hold.
> +	 */
> +	if (alloc_flags_allow_spinning(alloc_flags))
> +		kmemleak_not_leak(sheaf);
> +
>  	sheaf->cache = s;
>  
>  	stat(s, SHEAF_ALLOC);

