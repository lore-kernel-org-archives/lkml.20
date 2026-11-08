Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794160695;
	b=NDudc8ExjRBePyHYclu942qMFE+z+HD4fJOi9ndFf9WoFbI9RT9psv7q9A9Gl2BOLreg
	 Q9bsdEz6UUn8lI5YOMTRgAXAdL60Ixjf7x/0JPd3kdsRU1oJXfxKXmsoQpFfBicb1qSdP
	 U69hpy/lwzFB6J9t/19wEQ5RUABwzdvDJOK7eIwfXw9kuboYTYTWmU6y9+TvqRdyOuLPU
	 IOkUgTgtCvpJjV+2YqsyiW6UV07usc5u9ZtSAlxhdIay4ih7YP/o+XjKw6ZnSt6TInqe1
	 SJ2fmwIMdnoyOvcIQ3pibwFOsJkPCa3NYDgFtbAxSqFlYh3VZsiGokINnjLqLMcmR+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794160695;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3yNrGH+7MD7g2peNpAiNoMgnUZhFrksazqLFqyuuJY0=;
	b=UACJUX/qn6y7UH1JDDkmaDOXK7z9SPhv5m23D47gOBhXOQN4S1AjSy7J10o+ity9SU7k
	 LK63kieCAFpAeYWgbiAtJLuh6cJEHbC7E2IZF9OSKMikmjzvn+4rFd5aZYc4VGm3GaASS
	 JU+pm2Ptix1zdbzvIcLx/EA360IQAVpGQrjjCJKelGkPkH3Zo30wIhLe42TXqgYLoLt23
	 cJplaccDl788Zvnhx/LII1x4QNpiJ9dxzoFH/eK+v8+kTyyUewQDKoCqVxIIZ9X4Naed9
	 Dy+VXGPf/xyBjat8QheOpc/b2BlhufNoqim3xAxfKUiU/FXbQ8FNojeip7O54ExU+Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QmLTW06v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632CB606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QmLTW06v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDE31F0089F;
	Sun,  8 Nov 2026 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794160694;
	bh=3yNrGH+7MD7g2peNpAiNoMgnUZhFrksazqLFqyuuJY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QmLTW06vCK7JGjKpUs7lHZJh/niGMLMEpTh1l2EvrBm+QsSfrnL1GILxSrUKRTXqp
	 ESTDJyOYNdEXxfGzKoQ1sNPYkJMw0nOzd/lzwiyu4AC4vx1ApGFNboKTCnS9m2qq1O
	 55at46+B9nyvqfzWvK+ho8uGu5ouwYIybklCAJRFBWB+5Rn6TgvfEmY0Qas9BCfIlu
	 YkrllIoxlF1Lvy40Vz2CyQYDGFG0awpdUCwamiuFUQ3kfMoFckuq5wzA0rD9awCDiU
	 I7LeiZ8enwGnowmE3GTgZcIm+pKNpK80ZqCZEwWEtIADb81J0X9NEpxqhX8af6Swg4
	 ipQI9U/cQ6wgw==
Date: Sun, 8 Nov 2026 17:58:12 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 06/10] mm, slab: make SLUB_TINY handling dynamic for
 sizing decisions
Message-ID: <avC3UnTk21iV1i6O@minisforum>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-6-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-6-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:55AM +0100, Vlastimil Babka (SUSE) wrote:
> Enabling CONFIG_SLUB_TINY results in the caches' min partial slabs
> threshold to be zero, thus every slab where all objects become free is
> freed immediately. It also sets the default slab_max_order to 1, with
> the goal of reducing the potential of internal slab fragmentation.
> 
> Rework both of these decisions to be based on the newly introduced
> slab_tiny_enabled flag instead of #ifdefs. It's still possible to
> override the reduced slab_max_order with the boot parameter, as before.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
>
>  mm/slub.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index a3ee1bdf0eb3..be4e1f193295 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -8027,7 +8021,7 @@ static unsigned int calculate_sheaf_capacity(struct kmem_cache *s,
>  	size_t size;
>  
>  
> -	if (IS_ENABLED(CONFIG_SLUB_TINY) || s->flags & SLAB_DEBUG_FLAGS)
> +	if (slab_tiny_enabled || s->flags & SLAB_DEBUG_FLAGS)
>  		return 0;

nit: this change is not mentioned in the changelog

Otherwise looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
