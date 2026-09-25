Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241E4DA536
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352543; cv=none; b=rVdX05CwUJKCjHgqZBzjHbin1Y4C8gHWxDGKENjwMksAeQjV2DulCp26aEUTLuQehNSFnmd7IrRH7gd3AWVxRDs1hT2Q0mNSQjQVf7/n1eK7VRkxr6DKHjh7kVpZd0FGYKS29Pcz5+9R16XYDy06oOA/tlstu7HdgrP9g8xMIsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352543; c=relaxed/simple;
	bh=LPEK6ClVbsO8nlBPaYDXqbmGoVDsx7toQBMC3mAOwpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekINtp+C2hL/v43pX0ksPTQRXfyBMWnTp6AZ8RY8K4sNra946xaUzTI0lOoEqirvs0u0QOOFZpNg1gzxk9FdPm0li/gpJgZwB/F9BZ1hnw3LRoaudDWHvdZPoZGvQQNQOWEWsPqZwnBs6ytAKOEiJQQhJBC3MWafH2VWH84Jl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISzJNNrG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISzJNNrG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C294F1F000FF;
	Fri, 25 Sep 2026 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352539;
	bh=Uw7ew/unsfmuFvfxhLGpSSnLbVpiYISyYVscoi/C9zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ISzJNNrG9u/Oi9GkSszbO9GvibpC8eoQNutMO/baMlmDT46c2dXeOkhbaiJR6f7Zk
	 M8zTgQ0038lnRwgZGCcFvBjhDsQN6C8R602rKVOemSQyyJ2Azj/es6ijJnsxJcZ/C3
	 cFt7okZuzLjYoTTgFS7E/MzfC5DasjgeKlEUGMPwUJaW99oMwaAv0k30WasKVZGtXl
	 /Dkbp3RvHOVUX465LOcRJuXsEC07z9rUJDDe9FqdKEAb67EVHa+cZ8ajgWilDpTCPU
	 wFtDRY4Gsug20MbmmRFKO7KEc7cFCHQgENqRWvVWHp77FYJMAdnbvwoTzL4edkB4H1
	 qs+1lI4Dei+gw==
Date: Fri, 25 Sep 2026 17:08:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Pan Deng <pan.deng@intel.com>, akpm@linux-foundation.org, 
	liam@infradead.org, vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Tianyou Li <tianyou.li@intel.com>, 
	Wangyang Guo <wangyang.guo@intel.com>, Zhiguo Zhou <zhiguo.zhou@intel.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [PATCH] mm/vma: avoid redundant file rmap tree re-insert on
 new_below=0 split
Message-ID: <arab1d8-4b3SzoI6@gremlin>
References: <20260924054301.2330822-1-pan.deng@intel.com>
 <araI4WsI0XMXOR10@gremlin>
 <araVBBBVY-jafePL@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <araVBBBVY-jafePL@pedro-suse.tail5790ac.ts.net>

On Fri, Sep 25, 2026 at 04:43:37PM +0100, Pedro Falcato wrote:
> On Fri, Sep 25, 2026 at 04:27:44PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > This change skips the re-insert for that case.  vma_prepare() no longer
> > > removes vp->vma from the tree; instead vma_complete() detects that case and
> > > only recomputes shared.rb_subtree_last up the ancestor chain.  Everything
> > > else keeps the remove + re-insert path.
> >
> > This could really do with a diagram and a simple explanation.
> >
> > In general you should rewrite the entire commit message yourself and not
> > use the LLM output at all.
>
> +1 on this. Even with the Assisted-by, this needs to be understandable by
> hoomans.

Yes.

> > >
> > > Measured on v7.3-rc4, on a 2-socket 192C/384T system running UnixBench
> > > execl (384 concurrent execve of the same binary), dropping the redundant
> > > remove + re-insert yields ~14% higher throughput by shortening the
> > > i_mmap_rwsem write-side critical section during the file VMA splits that
> > > execve performs on the shared libraries.
>
> For what it's worth, I'm vaguely accepting of a similar change, but this needs
> to be _really_ well commented out, and ideally in file rmap code, _not_
> spaghetti'd in VMAs. The interval tree is complicated and some bits are not
> very intuitive. This needs to be robust. Not LLM'd into existence.
>
> This also reminds me that I should reboot the sharded file rmap effort...

Indeed, which is why I'm treating this as a report rather than a patch.

A member of the core team can do the actual work.

>
> >
> > This is really unconvincing I'm sorry. Real numbers please with statistical
> > evidence to back them.
> >
> > Additionally I notice you have not made one comment referring to locking
> > anywhere.
> >
> > This part of the kernel has VERY subtle and sensitive locking
> > requirements. I am not convinced you understand this, either.
> >
> > >
> > > Signed-off-by: Pan Deng <pan.deng@intel.com>
> >
> > This patch feels like a hack. You are creating a whole new set of very
> > fragile assumptions that have to be maintained throughout.
> >
> > Again as above, a member of the core team should take this over.
> >
> > > Reviewed-by: Tianyou Li <tianyou.li@intel.com>
> > > Reviewed-by: Wangyang Guo <wangyang.guo@intel.com>
> > > Reviewed-by: Zhiguo Zhou <zhiguo.zhou@intel.com>
> > > Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
> >
> > Please don't do this.
> >
> > Upstream is not interested in private reviews. Review tags upstream are
> > based on review done in _public_.
>
> Yeah, this too. It's just noise.

Yes!

>
> --
> Pedro

--
Cheers, Lorenzo
