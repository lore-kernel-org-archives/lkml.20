Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361846;
	b=Qkuu0KaGT35sPP+Wigz5C9FBmkQ3GVAspxUeg9k971u6SGqBz8SDCh7wriuFKH60Hv59
	 dm8KQ7fwN0rfLIOxoNEgSVbPTUfvDDK+AJQ+CrPSwFJe/S3ShM/LZ+yj0DQma1a53P7q/
	 nayLcH7yFRLysl/boTZR5DoerrFThiBAIXGLwx3nvXBDusoFDGog9fvhdq4l34t5NXkT2
	 C4GZE77oFBlS3dQXdnbl91TWpoAHvRaXsImEXzRUYAivUy5B6g+WasL9jEiPWb7WSknOr
	 E5PXoX5NfETgDOncM64ulLfQ91pbQN2j/NTG2Z2b5LCuBooEVo36hVu51GqTvvvUw/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361846;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v82mzkt/jt6jPtl1ei1Iq8wfRsMZYKIpIpg9HbC5F18=;
	b=xwC80kEQKxk6MjzdbcOyO2/bATnus8N7YFOhpxZfzIcjK8k5TQ6oyQ3Jc3qZlGYjjTcI
	 HS08m57mtkfvii3ibWoltEdOThurZwC9MUDy+Fwvhk33Inlgf3MJ9t9vSNBVUdjpUGp6J
	 KjBH3CnfVUwi5fWCF+0ZFszEReYS8qXaj/5CXAqCheV8l+OepL36UWHoQpR2Lp+KdNGdw
	 i7Wl1vmYGXVkGqrPHg/ftnJYSoIsMUJMA870TtZTSGQjmuJ1e3Wzw26dKePO6My27XivD
	 e5azm7PQOJDF2P3uKlIOGp7wtiou25y7SjIPrM+qe9PTbOiPSGhnDvvrKaO0iDvs+Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKBGo9SZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E1D606A338
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKBGo9SZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CDA1F000C1;
	Fri, 30 Oct 2026 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361846;
	bh=v82mzkt/jt6jPtl1ei1Iq8wfRsMZYKIpIpg9HbC5F18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bKBGo9SZfxwjC/Xfqsy4J8CcQ7x1O4QhOR3H1pnysW62FBdsJRwtCvOy28QHYKcR3
	 VrjQ0tY9EXaol2fM77uzLHD7pYPlEk1J4x6OdzYA1y0Ma0UuT1ivg5wMECjifl0Utv
	 rUnI08CGpjcSJYa7vDOHCTTh8HAsV/KOVk2/4x8DzYVbujacQUZBbpImkrVWvouKx0
	 QcRuEbgagwyuFa0f3k/RGb/l7/6udXYs+QS3xtQ430YisTQ2zEg/YjK8JAM/8p3iYH
	 Da5Q8yZeBa+apnfcjjbIDPFYbLXav/zsReh2gHHinKOyVPyxzeM59lHemtrjCLDefk
	 jVON88cHrKDnw==
Date: Fri, 30 Oct 2026 14:03:57 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, baoquan.he@linux.dev, pasha.tatashin@soleen.com,
	graf@amazon.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] kexec: do not place the next kernel in a
 fixed-address CMA area
Message-ID: <auSHrdDdFrWRsuzM@kernel.org>
References: <20261014145731.3431527-1-radhey.shyam.pandey@amd.com>
 <20261014145731.3431527-2-radhey.shyam.pandey@amd.com>
 <2vxzh5i5orbv.fsf@kernel.org>
 <auL3UW2InVqYU6Fs@kernel.org>
 <2vxzzevwmz2v.fsf@kernel.org>
 <7625fa23-5f4b-4658-b17a-fe4e58103e7c@amd.com>
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
In-Reply-To: <7625fa23-5f4b-4658-b17a-fe4e58103e7c@amd.com>

On Fri, Oct 30, 2026 at 01:22:50PM +0530, Pandey, Radhey Shyam wrote:
> On 10/29/2026 6:41 PM, Pratyush Yadav wrote:
> > On Thu, Oct 29 2026, Mike Rapoport wrote:
> > > On Wed, Oct 28, 2026 at 03:03:16PM +0100, Pratyush Yadav wrote:
> > > > On Wed, Oct 14 2026, Radhey Shyam Pandey wrote:
> > > > > @@ -304,6 +317,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
> > > > >   	cma->ranges[0].count = cma->count;
> > > > >   	cma->nranges = 1;
> > > > >   	cma->nid = NUMA_NO_NODE;
> > > > > +	set_bit(CMA_FIXED_BASE, &cma->flags);
> > > > >   	*res_cma = cma;
> > > > > @@ -517,6 +531,8 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
> > > > >   	}
> > > > >   	(*res_cma)->nid = nid;
> > > > > +	if (!fixed)
> > > > > +		clear_bit(CMA_FIXED_BASE, &(*res_cma)->flags);
> > > > 
> > > > Nit: This reads a bit odd. cma_init_reserved_mem() sets the fixed base
> > > > and then you clear it later. Wouldn't it be better to just pass the
> > > > fixed boolean to cma_init_reserved_mem()?
> > > 
> > > Actually, we shouldn't expose cma_init_reserved_mem() at all.
> > > 
> > > The current callers of cma_init_reserved_mem() should be switched to
> > > cma_declare_contiguous_nid() that does sanity checks before calling
> > > cma_init_reserved_mem().
> 
> Thanks Pratyush and Mike for the review.
> 
> The switch from cma_init_reserved_mem() to cma_declare_contiguous_nid()
> looks like a broader CMA refactoring and requires additional changes to work
> correctly.

Hmm, you are right.

How about we invert the flag meaning?
Than cma_declare_contiguous_* will set it where appropriate and we won't
have the weirdness Pratyush pointed out.

And Radhey, please, make your LLM to spill more concise and to the point
text and teach it to trim emails ;-)

> Thanks,
> Radhey
> 

-- 
Sincerely yours,
Mike.
