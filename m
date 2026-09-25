Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558533F1074;
	Fri, 25 Sep 2026 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370890; cv=none; b=GXRcwpIo/9P/MYFKBtIOR6WSHwqRfzV4JGKd8iSx4Ifo425w8qG9EZcf42bOCL/FJhRaKmIflHNCkuE6wfLUnt3CqcU+/IhHPH0ay8CTRMmQVSelggGxvkVA1IyK5LtNg2kObTTe8ipdF8biLiAHmgaJ+B1BUDu1+oX2ERBIPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370890; c=relaxed/simple;
	bh=NhlnC2Q7KwZQ3xQDom28w1SAqe69mXctKjM8hL0/1Gc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NYvs1G8yXe5u17X8EzLAPKJyCB/bz/Mj1XYQHu4VmKt9uETqUwm03pjAWvE5E1rt95uTBmBOFzhLiPjuvrn4aTw4l/XLzn7c//7wnQckIlKY8fCtBdPwnT+NOr7qTjn5Q3kPyuvlRXS0rUAhQMRjEHI6ADy2bBY3aHPQllLaNIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2DlUmLrL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2DlUmLrL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBAF1F000FF;
	Fri, 25 Sep 2026 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790370889;
	bh=DqH4PeQMr+3IRa/5k11VZjOOSwN+Plv74YyybNA8Ovk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=2DlUmLrL+Xk39kIG65E2QhmxR2BNItmplWepLSgJ7g5X3uNDcgfj6zJKR0D3MNJ+Z
	 aB842bNTyWXoFunoN/Js7KZ6ZP2v/Rz+6uzDkXDQRssipAyrzjv269qxGWP2xBrbEE
	 eLTEu/mS13MNfSSoCCmi/9UcaWMAmXPhYMnzvHNY=
Date: Fri, 25 Sep 2026 14:14:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Carlos Maiolino <cem@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-Id: <20260925141448.57220a7d3f76b92d8f1cb130@linux-foundation.org>
In-Reply-To: <araNBVKW6MXR97P1@cronus.toxiclabs.cc>
References: <arUS5b85ed6L01qc@sirena.org.uk>
	<arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
	<f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk>
	<araNBVKW6MXR97P1@cronus.toxiclabs.cc>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 17:03:58 +0200 Carlos Maiolino <cem@kernel.org> wrote:

> On Fri, Sep 25, 2026 at 02:11:28PM +0100, Mark Brown wrote:
> > On Fri, Sep 25, 2026 at 02:26:25PM +0200, Carlos Maiolino wrote:
> > > On Thu, Sep 24, 2026 at 01:09:09PM +0100, Mark Brown wrote:
> > 
> > > > I fixed it up (see below) and can carry the fix as necessary. This
> > > > is now fixed as far as linux-next is concerned, but any non trivial
> > > > conflicts should be mentioned to your upstream maintainer when your tree
> > > > is submitted for merging.  You may also want to consider cooperating
> > > > with the maintainer of the conflicting tree to minimise any particularly
> > > > complex conflicts.
> > 
> > > Do you mean non-trivial conflicts with linux-next? I always attempt a
> > 
> > With other trees in linux-next.
> > 
> > > merge against Linus's tree before sending a pull-request to check and
> > > annotate any possible conflict, but I have never done that for
> > > linux-next. I can do that, no problems. Where should I send a
> > > notification to? linux-next@vger?
> > 
> > If there's anything interesting it can be helpful for me to get a heads
> > up on the resolution but the main thing (and half the point of having
> > -next) is to coordinate with other trees that you're colliding with.
> > You don't specifically need to check, I'll tell you if I notice
> > something, but OTOH if you know your work is going to be colliding with
> > someone else's it's good to coordinate.
> 
> Ok, that sounds fair Mark. I honestly didn't expect this patch to
> collide with Andrew's tree. The submitter sent both of them initially,
> Andrew picked one, and I asked the submitter to send the second one
> individually for me to pick up. But I didn't expect it to cause a
> collision. Next time it happens I'll try to keep an eye on the ending
> result.

I don't think much went wrong here.  Keeping the [1/4] xfs patch in
mm.git is appropriate, as it's part of a series.  Unfortunately Kefeng's
standalone "xfs: fix NOFS state corruption in btree split worker"
conflicted with it.

I suppose I could add the standalone fix to mm-git as well (with xfs
maintainer acks), just to make life easier for everyone?
