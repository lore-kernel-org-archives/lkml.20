Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435752;
	b=EF3rbGTbSBklJVOmBpwTF0GnAr2U0Hplmb+qAjrZCvlw29tLmErgeB20Y2a1r4zeLlae
	 ZlP5AEwsb8uG0KeJNUmhzYYBYCKNcBHAVlGjkZFDcMm9LlFviewzJ7IhCy96+9UkWuVjc
	 UHwDf3TsKWCCstCnm2CXoDVDwvMeUCJ+X+SthbH3YGvGGb+UcPuiYfaM0L4wvY7EoSoFE
	 bjC9YHO7zNiXK78KU8ve0zP++dbCIj24GElSQvIKcmVHeQP0oJ/3ImGwH8yRXTuJFCCU/
	 slceuC+LqXOfjNkpkvIyI/Q8jesnUuPSq/Zh/Fve2reEwd+8hCipH7gYUtaHudwQ/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435752;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=odoauVdJqWqaAI8ZwIV7KjQzqBjqQDbAw/30Cb/fZ88=;
	b=iscSpkktCVVL/vFMLcJEGA45OnAdUkYem/MG6+DKn5PxBPTc8pccAYJJmpRB7SBJ9giz
	 pl0yvv+hf+8Nub6jtATq6kYo1mAodcZxJrlu74FCYYnIC2Z4OdUerEd8PwN5Rc/nhoI3v
	 hPZqU/XSvl3+ks7Ucyuro6CkUjyTWWDjA7QPCZnHBP6U+aGwTAUR+AtanuenV89wSbqgG
	 7bW6YS4DmB5IzQ25wsHa9mFTBcxSS34gEPM+y58x8MuV6ycyY9DkGA0A3RZp8hO/Cv32Y
	 NUqer6TlkvCOZ5b8mqwUR5O07US5yGZlruIqbj9zQk/t5jO1mlIkZSBK9hMZbPI7jZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpVt81lu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E34606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpVt81lu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244821F000C5;
	Mon, 19 Oct 2026 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792435751;
	bh=odoauVdJqWqaAI8ZwIV7KjQzqBjqQDbAw/30Cb/fZ88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FpVt81luKpgl1WbnJJ7TGOrqiFGvJE3Vp6obqv4BfKFwpY83JjR22wBTyq00DpteV
	 Yn5OVnKkHlnjGjCrOznxDdU7mpGANQof2eWfxPOKPb2PltMjR5Xk9FpmPFOihIcyqZ
	 6A4+TGeNbwggf80qgkj2+YogHGG81aFViwNYLz5nmpdPhfOtGEMT+p9/gRYiaGQxiL
	 9aeS6k3X6WcPE/UvlwrmOsk7H1p8uGmpJsLUqR19zfRQ57SuTDIBn50er8OPHButkz
	 zyFMD4MF4QFuSmtQk7gDLFY0NdpysNqdbseTNWlKW88MI2mWQBma+YdXSicarCtQDs
	 GSnP5tFu7k5+w==
Date: Mon, 19 Oct 2026 19:49:09 +0100
From: Harry Yoo <harry@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] mm/percpu: clean up callers of pcpu_obj_full_size()
Message-ID: <atZiXtW0rmiQLEB8@thinkstation>
References: <atZWW7V0MI--HOke@thinkstation>
 <20261019181628.2113224-1-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261019181628.2113224-1-joshua.hahnjy@gmail.com>

On Mon, Oct 19, 2026 at 11:16:27AM -0700, Joshua Hahn wrote:
> On Mon, 19 Oct 2026 18:49:26 +0100 Harry Yoo <harry@kernel.org> wrote:
> 
> > On Mon, Oct 19, 2026 at 09:28:02AM -0700, Joshua Hahn wrote:
> > > The size of a pcpu allocation can be interpreted in two ways:
> > > 1. The size of the allocation attributable to a single CPU.
> > > 2. The total size of the allocation across all CPUs, including the
> > >    allocation overhead (for obj_cgroup membership).
> > > 
> > > In most accounting paths for percpu memory, we need the second
> > > definition (total size). Make this more obvious by coalescing the
> > > callers of pcpu_obj_full_size().
> > > 
> > > No functional changes intended.
> > > 
> > > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > > ---
> > > @@ -1662,11 +1661,10 @@ static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
> > 
> > Perhaps it's better to rename 'size' parameter to 'full_size' in those
> > memcg hooks to make it clear it's expecting total size?
> 
> Hi Harry, thanks for the review! That sounds very reasonable to me.
> I'll spin up a v2 to make this change.

Thanks!

> > Otherwise LGTM!
> > Thanks for cleaning this up.
> > 
> > And it might be beyond the scope of this patch, but I think
> > trace_percpu_alloc_percpu_fail() should take full_size instead of size.
> 
> Hmm, I'm not sure. The trace event for percpu_alloc_percpu actually
> tracks both size and bytes_alloc separately, but percpu_alloc_percpu_fail
> only tracks the "size" paramter. I think it might be a bit confusing to
> have the percpu_alloc_percpu_{, fail} have diferent meanings for the
> "size" parameter.

Ah, right.
 
> Perhaps the right approach here is to add a new field "bytes_alloc"
> to trace_percpu_alloc_percpu_fail so that we get full parity with
> trace_percpu_alloc_percpu?

Yeah.

> ( Actually I think we don't even really want size, what we really care
>   about to me it would seem is the size of the allocation request that
>   failed but alas...

(looks at fun percpu memory allocator history)

commit df95e795a722 ("percpu: add tracepoint support for percpu memory")
says the tracepoint is for recording & replaying percpu memory
allocation requests re-evaluating the decisions.

I guess for 'replaying' purposes we'd need 'size' rather than
'bytes_alloc'.

> it may be too late to change the meaning of the field )

Agreed.

> wdyt?
 
I guess we can revisit this when it actually bothers us or
somebody then :P

> Thanks again Harry, have an awesome day : -D

No problem, and you too!

-- 
Cheers,
Harry / Hyeonggon
