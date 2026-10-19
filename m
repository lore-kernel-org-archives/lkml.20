Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85AC597F5A;
	Mon, 19 Oct 2026 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420775; cv=none; b=B3+a4dn0KGVzuFveRln/w0EDkhAiscRoPeFPsb13IxBPR7RPUlIJec0rtQmcw/eAL8P8FLyyubIRpYTM7diiiNMHvKaNgR2MafAQSOCbDUauu5mGp9mhzM+QqcuoJ2IOvPSVlfiA6SjUzSeKNvazxBqpXpwS8NYkMu1g0V+EaVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420775; c=relaxed/simple;
	bh=JjM6WMwkRUf2/5gey+sJpRtb5OdpT/PMnafxddPOu+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kw16+kT9J0x536//AAI68VsGfhvyQ7LTZVEqhxNJv+UtbO2FtZ05Oyf0wXwcpnr0wH/VhH/IEY5hNbKu81lGVQ2YNX2ds8n1iW4fBU1J7tGvZT7V3rhMxY+6w0Z1CEsOU6PQ0c37H+d6eGC7esncqHjxdEGEcZpZi9i9uapneTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqP2OoJA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqP2OoJA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D093D1F000C9;
	Mon, 19 Oct 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420773;
	bh=6hWQwOt6Wt6hUvhPaeEqwpzhXz566q+fi9LFZingnXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SqP2OoJAFz60lu3Rxyx877dqP4vCGu83HkFx6suWTPAyerC//e6zk6twRwt21ZMx7
	 zgixhHQs1hfKO682iB+0Pltr1tbYACHSji4rD7I/XelqVCa5LcqGFUNT+Mn48Szaaz
	 fglHf9x8Ut/vDzhqy662N9OYXACbtTLlpy5lXZfoNinvN9jSAdEJG9CaO2wycP7yaT
	 Pj9of5A8NTLxrc5jFBXihvJ7U69ApwvgERUW67lxByxCk4zz5u90YU9sbq9ciVUJY+
	 KQZkWIDeRf97J0ulxABT2LeDJ64On/Jljx41whei3vhE8FXRgzde9EyltPEdDkAs/I
	 WBz2K4WlSGEWA==
Date: Mon, 19 Oct 2026 15:39:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pedro Falcato <pfalcato@suse.de>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-ID: <atYqIrlyW1tgZJIx@gremlin>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
 <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>
 <atYJA7nIu_RwpoCC@gremlin>
 <20261019073201.aee381fbbdf2edfdd0a68754@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019073201.aee381fbbdf2edfdd0a68754@linux-foundation.org>

On Mon, Oct 19, 2026 at 07:32:01AM -0700, Andrew Morton wrote:
> On Mon, 19 Oct 2026 13:19:45 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
> > On Mon, Oct 19, 2026 at 10:53:27AM +0100, Pedro Falcato wrote:
> > > On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > > > So I think it's fine to just send it (early :) in the merge window.
> > > > ---
> > > > v2:
> > > > * Updated comment in vma_seqcount_is_write_locked() to mention the VMA
> > > >   being attached.
> > > > * Renamed reset_vma_seqcounts() to __mm_reset_vma_seqcounts().
> > > > * Used acquire semantics in vma_start_reads() to avoid race with reset -
> > > >   there is another acquire immediately after this one so it should just be
> > > >   noise perf-wise.
> > > > * Removed stable tag, will do the backports manually (just make the value
> > > >   64 bits...)
> > >
> > > I guess you're fitting this where __vm_anon_pgoff_lo now sits? If so, then
> > > this patch probably wants backporting to 7.3.
> >
> > Ack.
>
> I added cc:stable to the mm.git copy of this.

But that'll trigger the bots for every revision right? I don't want that, even
if they fail, that'll set off Sasha's bot who might get things spectacularly
wrong.

Could you update it to:

Cc: <stable@vger.kernel.org> # v7.3.x

To be super clear about it.

Thanks!

--
Cheers, Lorenzo
