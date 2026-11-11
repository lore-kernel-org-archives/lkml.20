Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388694;
	b=dJm6NFL9QwLHUnlECOdX6PhqwaQYUCKBVDP4BjgwKB2gcM2TUbHjx1vEsxGu1XksN1ah
	 utwsATogiE42PDEI/aaTESxowGU6dtptTG1HwzHFfxhqIolUnnYddtHu9NsiWqRYgLfh9
	 n/nkCsUtBicTZNkjWNC68elJXUCXGU7J0rxiO9wHP8hyLhteoRzkMCYrwf+OFw4z63u6r
	 CSMxKaJKR2g0q/z87lfN48muGgkwAvJeCdsZS+aLV9O3R/pvLiJd0hY0LWZbMIiXAzsEW
	 MOwVlO4SqAALJKtTqSSdy47rHheEV080WIbMilPnT/Nu8OVNyfCZ9yFwHEbnRbAKbHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388694;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QWs1gzgqO1A59hoKs3tuMBi4edD/w8k5cYwrGVQ+cB0=;
	b=a3XtJy5TkRjRZnUh51GyiB5fFImgjG9dxGiS5sF/FN+dUBxlWOOdhftiR4FaqypzbeAv
	 CvnacdgXBrc61a3p1BF2LuOjXRymNdpVSae0aUJUGmKIvFoc4Bm0Cnw6sIl/ioG6XYttE
	 S1kSSse1BbswUvRPUT59jF/acYemijI3X1Nz0eW7cu4tt1N8k+TJ61YE3xDBq0Mjroqjc
	 RFY8lV+NFhTZTwNXRDqfS8MgXXxgPLsIl9rsSkmyZWgsQSVsT8QgmU/u7+b1c+l68+tUy
	 KoCZXyIlyRmJZh7yFfgXMTVxpecWh1zY/dZFhUo4pKghKQma+6KGcWMIkKerWvOGQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nPQ/W3tB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FDD606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPQ/W3tB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CCA1F00A05;
	Wed, 11 Nov 2026 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794388694;
	bh=QWs1gzgqO1A59hoKs3tuMBi4edD/w8k5cYwrGVQ+cB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nPQ/W3tBH7IXMyeKIqwMvWCKjOnatvPKh87fP3UWoe4psnTdQu3w//a4sVvyE5zyz
	 WF6vpLmRhLQ185mGVjNFBZhQ7xCxtNeg3hFPeJzQXaTIUVMFg/S3s9Qe1Cxt8RCkJF
	 HhDBZ6WdHgptQZ2NRfBJiRcBr5kB7SouvZozxUO2+UN1neTwxcLQmC61yWu1KPQ6by
	 gwpvXemy6XTmp/oBzm6UWZvKSQ0ZwHAhr3GU5rLIhfedrpY5pUWiqZLQpnLKj4hkNR
	 5zs8NjAKyNYimLPdfruEqZ6OUkajo6zoVMkPD0cWEzSrrHnr+VdqzG9d/rcN2NXPxd
	 95DJQsE3IFJIA==
Date: Wed, 11 Nov 2026 11:18:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] kho: Prevent reuse of preserved pages after a
 reservation failure
Message-ID: <avQy0MUl6eOplwhh@kernel.org>
References: <avQUquBK6cO6tUUI@chrisdown.name>
 <avQg0_jFY3get3wG@kernel.org>
 <avQka0wY-EdLkspv@chrisdown.name>
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
In-Reply-To: <avQka0wY-EdLkspv@chrisdown.name>

On Wed, Nov 11, 2026 at 12:16:43AM -0800, Chris Down wrote:
> Hi Mike,
> 
> Mike Rapoport writes:
> > On Tue, Nov 10, 2026 at 11:09:30PM -0800, Chris Down wrote:
> > > kho_preserved_memory_reserve() reserves each range of preserved memory
> > > in memblock and marks it noinit, but ignores both return values. Either
> > > can fail when memblock has to grow its reserved array and can't find
> > > room, which at this point in boot it may only take from KHO bootmem.
> > 
> > Is it an LLM analysis or you seen this happen?
> 
> Are those the only two options nowadays! :-) In this case it's just eyeballs.

Didn't think anybody still uses those :)
Kudos!
 
> I happened to notice this while preparing my KHO/LUO observability patchset
> and thought it made sense to send as a separate patch, since it doesn't
> depend on anything there.
> 
> It's probably realistically quite unlikely, I would think it would require a
> lot of fragmentation or a very small kho_bootmem=.

It's unlikely indeed and if that happens we'll panic on memory map
allocation anyway :)
 
> > > Dropping the handover at this point isn't safe either. reserve_mem=
> > > revives its regions from the handover before mm_core_init(), and
> > > relies on this walk to reserve them.
> > 
> > reserve_mem_kho_revive() can memblock_reserve() its memory itself and we
> > can carry on, can't we?
> 
> Thanks, that's better. I had thought carryong on wasn't possible because
> reserve_mem has already reserved its regions by the time we get to the walk,
> but actually you're right that there's no reason reserve_mem_kho_revive()
> can't just do it itself...
> 
> Looking at the code one thing we would likely trip over then is that
> kho_mem_retrieve()'s error path only clears fdt_phys, but not bootmem_phys.
> kho_init() then thinks that it's a cold boot and runs
> init_cma_reserved_pageblock() over the inherited bootmem which has already
> been handed to the buddy allocator, so this would need adjustment first.
> 
> So then, let me send v2 with reserve_mem_kho_revive() sorting out its own
> range, and making kho_init() skip the bootmem setup when the bootmem was
> inherited, if that sounds good?

Yeah, just keep them as two patches please :)
 
> Thanks!
> 
> Chris

-- 
Sincerely yours,
Mike.
