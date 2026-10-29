Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262970;
	b=uaaYEb52njQh0IoXENQazVQMxce2rMTy4GWyKY8f37k9K2EJvZyEQ7bOd86j/vzWUYfC
	 cSNlOtKE88lCikTH8sEGSLvgeU79vPgoxWq7ARTSseU2o0vaFU/G6OT2xp/9s06VYpFhc
	 Nu8MLAhnGT1Hc40s2xhbjAzxwu2XyDmJTpurUM+TsbhPTJdPH7UnMMLrWC+HiyMObbEOE
	 U6+uOBw8LuwtT+Yr/uoSUqhLxPzv4kPCbmNcn90k07LmPgIJzb+rII0o48z+rSEL0YwyE
	 04ns5iccFkwdUiJgqlZ8eAsBIxgv5h3cWxoRKAwnyQuBPzTDgqb4ZNQmry4PGoT8FLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262970;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BqE9F7QHM9W2/QNtBufRNQmznh5NnDhMEtUPQb5xb70=;
	b=IWzHryAnKLvtxyylnfBvCHL37V6gUTvEjDrzXv+QeZ5pGW1T9748Y9pn2y3u530pL5wv
	 z0vmZi3BTJ0YjYytL4VheNZtii+xOgk/JKsXW8kE5dm0MvvP9KypTKRLMisDrGRlcylnI
	 zi1KDwPRIGxH1ijT29mo+N3hPIj6YyvshGqeNs9hnjdSp7ACDfkyUy89/0QH+fk8WElUq
	 QVkfhRUMMqki96eatIXZSj5Mn41seLJt3e4SZyXyXHY1tD0nlLqK3fG5KSt0d4qp0C2Y2
	 LftSMApGacHpqIcOOAvVVdDUngbX+i/16yJCGpqchxl1Nm3rfpoICxNKzSVipp08JMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bE0Dhn1I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E00D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bE0Dhn1I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4094C1F01828;
	Thu, 29 Oct 2026 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793262970;
	bh=BqE9F7QHM9W2/QNtBufRNQmznh5NnDhMEtUPQb5xb70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bE0Dhn1IMt6VsMx5LMilyofuecH4nFB14QMQ/6h/vPnj/2C7gAt+npJjDIXKPQvRI
	 +/HFdeuId/FdGXWgmB2JMO9a/STDDut3KSQ+gw5wUiW+OULcsf7AZjJG30+cTGA2Oy
	 DE+dNlnQAU9BVewFKYi5wWxlVAQGeojtt2zXpkVfPkX95Vmh5bcN+OYUKZwyWrvy4u
	 w1a7yQKPndAKCHznQv7wKQ0yVXz21IHsN+Nikaws0HnabpfiCWCKGsGwsDiQ/KZ7bb
	 gD4y3nAguwcbGPAwreUnLK98qoqMBta7qn2QZ/HJ18003Rk2NAgHQu0MZ2MRaddzOg
	 bdatkhCCkXKUA==
Date: Thu, 29 Oct 2026 09:36:05 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: yaolu@kylinos.cn, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, 
	tursulin@ursulin.net, simona@ffwll.ch, chris@chris-wilson.co.uk, 
	lionel.g.landwerlin@intel.com, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gem: Reset err for each fence entry
Message-ID: <auMDxbKZ-XmRbaUH@zenone.zhora.eu>
References: <20261027072832.726435-1-yaolu@kylinos.cn>
 <auHeqGZ-hm2lS7Nk@zenone.zhora.eu>
 <179325911095.16507.8295053984620715316@jlahtine-mobl>
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
In-Reply-To: <179325911095.16507.8295053984620715316@jlahtine-mobl>

Hi Joonas,

On Thu, Oct 29, 2026 at 09:31:50AM +0200, Joonas Lahtinen wrote:
> Quoting Andi Shyti (2026-10-28 13:39:14)
> > Hi Lu,
> > 
> > On Tue, Oct 27, 2026 at 03:28:32PM +0800, yaolu@kylinos.cn wrote:
> > > From: Lu Yao <yaolu@kylinos.cn>
> > > 
> > > If dma_fence_chain_find_seqno() failed once, 'err' will store val in
> > > the following loop. May causing returns '-EINVAL' even though that
> > > entry never called dma_fence_chain_find_seqno() at all.
> > > 
> > > Fixes: 13149e8bafc4 ("drm/i915: add syncobj timeline support")
> > > Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> > 
> > pushed to drm-intel-gt-next.
> 
> This was pushed without any R-b, DIM should have given you a warning
> when applying the patch.

I forgot to add it, or rather, I remembered it too late. Since
it's a simple and straightforward patch (most likely LLM
generated), I didn't want to make a fuss about it.

> I've reverted it for now, please use DIM and check the warnings before
> merging stuff.

I used dim and apparently dim is not enforcing it.

I'll push it again with my r-b.

Thanks,
Andi
