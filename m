Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADBE4D09E6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066114; cv=none; b=HzEchl68mU9I8l91/cKQgK6+vnEIG80rYXE7EogTz0A2Ov/0v2oGOlM9F31QfI1xpDa2HkS8LMcCm5rf3iPy6IX+NohNbruSHL8+HhA/wC82UmnICnq6cTzIMv1uF+F51TeSMQxV4H2mzrKEGJhQB+RKJvcS/067CJXONwhjOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066114; c=relaxed/simple;
	bh=DkzI2S0K7w+Xam1LtZQ/5yXCtWaQg1/R4y0gaKo7n1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY/JsRWO4RWUctfau+JlHjkl9XhbLUUr+wrcyzl1myd1p8zYRWRE9ux0n2oySL7gGHm9GPSnUr2BOumdXfD941NyJ5M18s+jUfr3HwOgiiokswA965G666tzfUF9bpa4wq6xbRMMBDn/DBI1oaDprAJm2GhmHy1VbcJcB3UwvzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgZyX1P6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgZyX1P6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3459F1F000C4;
	Thu, 15 Oct 2026 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066113;
	bh=dn5PpHk1Moxd3JWutzvn/KsD0M1gf1ufaWfC4bJDCiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WgZyX1P6AzV7X/pRDGW1J8Kg8XUP0oligz6kvE7uF6zhh2ZsZ38xqhVZnNZpYss3f
	 vEIGIoyE2ijf3Zc8vRJOpAlIYKl2kmWzftrQrK5ZJkT34UjL/EHKI3ME8EzPYbDd1J
	 7JJswDv1rC0E8pO6dKx+SW0ocTB05GZ7YdblyNmex15usxcM6HEta7vRmdGj3zZouV
	 r4xXyPGWSSUNKT5/jS/RRyVb/XuAKue3s2kCZ7fhWCDbJqEp+7tjmH3VjxXgadHg29
	 7OU8jt8h0O8nianzB1PZpGcuNx3fE95CwalSZ70XvFOfz4HaV+AST7qCz2aW3hjLli
	 F2jpiB8pY9IzA==
Date: Thu, 15 Oct 2026 19:48:29 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend
 on MMU
Message-ID: <atC9jZIF1T1x0w1X@xhacker>
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
 <atAQAI0WWtwh8kvf@xhacker>
 <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>

On Thu, Oct 15, 2026 at 09:43:40AM +0200, Geert Uytterhoeven wrote:
> Hi Jisheng,
> 
> On Thu, 15 Oct 2026 at 01:48, Jisheng Zhang <jszhang@kernel.org> wrote:
> > On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> > > These options are irreleant for nommu systems.
> > >
> > > Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
> > >
> > >  config RISCV_ISA_SV48
> > >       bool "Page-Based 48-bit Virtual-Memory System"
> > > -     depends on 64BIT
> > > +     depends on 64BIT && MMU
> > >       default y
> > >       help
> > >         Add support for the Page-Based 48-bit Virtual-Memory System.
> > > @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
> > >
> > >  config RISCV_ISA_SV57
> > >       bool "Page-Based 57-bit Virtual-Memory System"
> > > -     depends on 64BIT
> > > +     depends on 64BIT && MMU
> >
> > hmm, I think we also need to make RISCV_ISA_SV57 depend on
> > RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
> > !RISCV_ISA_SV48. Human won't make this wrong combination, but
> > the random config can.
> 
> Is that really an issue?
> If I build a kernel for an SV57-system, do I really need to enable
> support for SV48, too? It builds fine without...

This is to align with the spec:
"implementations that support Sv57 must also support Sv48"


> 
> > with that change,
> > Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
