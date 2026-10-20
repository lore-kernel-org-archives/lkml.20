Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523683;
	b=P3acalWTfovPoyULifZWjBI5MRt1CWZPom/1uBlwipYViqb9kiGOIFr2d+wny//YoBCb
	 5aL8MdUCLBMXeTRBnlgsrFVAvoK1EkOfH84cnERYNvRwv0pXzdcNDlB9BfEizHDx2o+Qe
	 j07wUBUJp/EVKAzV2wmAjKO7kBjZqldS3x/n3yU2vpLTCUYyrNQhQ2gPnhnqNzn+LVDK0
	 60xV/Uqvc4VLldrvXvBE1SJYQNf2XKOOvydUHsTJ+rP4xqisXqoXWwxwr13YYkiiWofU0
	 NHzasQScmNNa7Wc7IKHIU0N+6oKMyahQFBsEYlKLmduq16s9KvofoqdFkoZn8zgjPog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523683;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lDx47guntEZOrCUX8mIjSt9makKu9MX5TBUA+H/pf8A=;
	b=puX1hRiZl77ZBt5chyfznNo7bb3+fMdcaQM4us6vU8xtfXk+HQpmZrggGb0xkS5N4eCn
	 kEBCMYHpUfetiemocf2D9fsGbLtoaqXFjJYksJG+H5nW8VN47GHX7GRfMAQpyjnJvGeVA
	 Y4UXXYU1kOHhohzOWvoIEb9HeI8uNuFlVegjn/06JyBwxVAxX8R2aTn1Bweyi5Kvn0jEu
	 FNl8g/uSkVsw6igFucRvPto5j41PAGCMjtBQyu7/Q69N/zmzWRaTZUQ64+a6+x2NvgAhN
	 zRbtVNPznJA6adqjxgyiCC576/O4ni2XOZfgRA3kvWFw/M3PbOp/LB7uXLRLwmcB0pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+wzAH5R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756DA606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+wzAH5R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23E41F000C9;
	Tue, 20 Oct 2026 19:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792523683;
	bh=lDx47guntEZOrCUX8mIjSt9makKu9MX5TBUA+H/pf8A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=A+wzAH5RsnSqDHFqu1j1zqr954jZp4nw5qCeDxTnfBVhCIP8DHO5O/8v/NclVNKwi
	 NWWzGOlx885xdoNlVbJjMTZR+wj+lYTqSf2hOziQxvsBpq+bo5zW7jzQbVOvuqsMW4
	 1gFDOFff1Wbad1Ntk40bW/f9GaUFtzlZPp/0IDYbH588lHowmlv2IfWhoKu2qAaxjx
	 fuvAXVwJ2IG5m+/fh/ueuLgZtV7W6hMY9SHPaQdJlrlU+vW847nEcm6uf8gURMuyj7
	 rT1DB4igSz5P1t0NTM+WHv+pLlg4XPBFUiEiCd2LxBR1vww3ZnlfQIorWUOCLElDNT
	 67QEh+u5kDPEw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 95E9FCE1B83; Tue, 20 Oct 2026 12:14:42 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:14:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Bradley Morgan <brads@mainlining.org>,
	Arnd Bergmann <arnd@kernel.org>, phoronix@phoronix.com
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <851e3a8d-dd0d-49cb-8672-5cebc03d910b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
 <2f65337241e230cd26c130bc3183ad230c7c40e4.camel@physik.fu-berlin.de>
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
In-Reply-To: <2f65337241e230cd26c130bc3183ad230c7c40e4.camel@physik.fu-berlin.de>

On Tue, Oct 20, 2026 at 08:48:32PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Paul,
> 
> On Fri, 2026-10-16 at 20:51 -0700, Paul E. McKenney wrote:
> > However, it sadly does not permit easy implementation of all algorithms
> > needing on two-byte atomic operations because there are some systems still
> > supported by Linux that do not have native two-byte store instructions.
> > There is reason to believe that these systems will soon no longer be
> > supported by Linux.
> 
> Since this paragraph has produced a headline today [1], would you mind
> clarifying what you meant here? What architectures are you talking about?

The important word in the second paragraph quoted by the article is
"systems", which is not "architectures".   To its credit, the article
keeps this straight, but not so much the comments.

And here is Arnd Bergmann's patch that started this:

https://lore.kernel.org/all/20260908152808.3928630-4-arnd@kernel.org/

The system Arnd calls out is the Acorn Risc PC, which is one member of the
Arm family.  So not an entire architecture, but rather just a particular
implementation of an architecture, and an old one at that.  Not only
that, but if I remember correctly, Arnd got considerable pushback,
so I am not sure that his support-removal patch is going in just yet,
as in I do not yet see it in -next.

Please feel free to add this as a comment to the article, as the site
is not permitting me to do so.  I have added their feedback email on
CC in case that helps, and in the hope that my doing so does not unduly
annoy them.

							Thanx, Paul

> Thanks,
> Adrian
> 
> > [1] https://www.phoronix.com/news/Linux-7.4-Two-Byte-CMPXCHG
> 
> -- 
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
