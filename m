Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3115540A0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967288; cv=none; b=DdyZAeYgPtU/6v6G52gOXBZPPUVSrDWTt1tdr00AZ0PdwQeGv4YHyX8E0H0OgZIfnCdO8he9qyHrb+VSGriCZ50hCJKR2NHqmO/t1j4dPqB7l31oSNexjnYUZcFRFdlECP42FOdb+1rxxt2ILyXq60jL5zydn7twG8awn7SJQ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967288; c=relaxed/simple;
	bh=4YPdhlDaXgYXXCNnsW81RofX21uV4LTfxxjn7hmEX2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WS1k6l+Z6gI+v/53bMtAf0Yq/p4Vb4HMMzyikW1sOhp+uIOvM3T2sZ1XhR9WQ6QXYpyBd5x9zNiDW10Uxgfn/EZE6Jx5wtB8TE9l7IZ5lskzawtkEOTLRasKky5C+5aViAoneVKy9w0jmh3WKOnrB4WQgMPSbKyWJ4InaNt7Vck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhDaHzT6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhDaHzT6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28601F00A3A;
	Wed,  9 Sep 2026 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967286;
	bh=rNUvA2/lQtpBECQm6efuKE8jX/o1YQk5zTI6Hl7HK0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RhDaHzT6GUcF2HWTvpoJElGyNMHmJSDgj1ko7bu6VBsyOE23dRHeBuzp/IgJicJLu
	 SGssZIMoPGM1cmma2sCr6OUn5ao0t3y4wT8vW9jgt/7g4u0yywdrNV8WKXFO1h/B3x
	 C/K7+4UXXEdkONlAsqWBc8rN8RsfJaB4RxlA/LC68yqVsvl1mYV5CUymKi+zQM2n6F
	 GZKZOYNThfxdR3AYELn4ch3N8BdwMOn68fPG97UFAyaIMK8cbqTV9GZF5tx2uSeXlw
	 nkscrSqXojNmTocE240Fn9la0KKT+WwJPW74gKw6ZXckSdxuj91xMNTmrkRrRjq2dS
	 LVExWNenhvauQ==
Date: Wed, 9 Sep 2026 23:01:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 3/5] riscv: support early isa ext and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <aqF00YcBdJIupeJr@xhacker>
References: <20260907151437.7603-1-jszhang@kernel.org>
 <20260907151437.7603-4-jszhang@kernel.org>
 <20260907-smashup-darn-93d1ee105a57@spud>
 <ap-EZ-rb7RJ5ykmG@xhacker>
 <20260908-baggie-tripping-c2cee6bb4947@spud>
 <aqCeaXYJEdW78PMV@xhacker>
 <aqFHr3BWR0XhxMsv@squawk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqFHr3BWR0XhxMsv@squawk>

On Wed, Sep 09, 2026 at 12:49:09PM +0100, Conor Dooley wrote:
> On Wed, Sep 09, 2026 at 07:46:49AM +0800, Jisheng Zhang wrote:
> > > > This assumes SV48 and SV57 are the only "early" users, but
> > > > other ISA ext may also need "early", who knows. So if future some extensions
> > > > need the "early", the code is ready, the author doesn't need to care about
> > > > the isa filling at all.
> > > > 
> > > > So I prefer my patch as is. What's your opinion?
> > > 
> > > We're about decade into the port being merged and this is the only thing
> > 
> > but the isa extension alternative is not, it was introduced by me three
> > years ago. But no matter how many years, 
> > 
> > > behaving in this way. I don't think the code in this patch is worth it on
> > > the off chance that something else comes along. If it does, we can
> > 
> > this makes sense. Let me cook a new version
> > 
> > > always fish this implementation back up and use it.
> > 
> > > 
> > > I'd also like to differentiate this code from "needing early", because
> > > this is about populating the information early in the extension bitmap,
> > > rather than about actually needing the information. There's no advantage
> > 
> > the code after arch/riscv/mm/init.c but before mmu on needs the
> > bitmap informaion when pgtable_l5|l4_enabled() is called (w/o
> > USE_EARLY_PGTABLE_LEVELS)
> 
> Oh, I must have missed something then, I didn't realise you were
> patching the alternatives early - I thought you were skipping them until
> the information became available at the normal time. Sorry bout that.


Aha, your suggestion about the simplifying the isa bitmap filling
still works.

> 
> How bad is the damage btw, if you implement pgtable_l5_enabled() as
> 
> static __always_inline bool pgtable_l5_enabled(void)
> {
> 	if (riscv_has_extension_likely(RISCV_ISA_EXT_SV57))
> 		return true;
> 
> 	return _pgtable_l5_enabled;
> }
> 
> ? It shouldn't be too bad since it should get expanded to stuff like
> 
> 	if (riscv_has_extension_likely(RISCV_ISA_EXT_SV57) || _pgtable_l5_enabled)
> 
> by the compiler. I wonder if you can do this and get rid of
> USE_EARLY_PGTABLE_LEVELS entirely, since the unpatched alternative
> should return false?

I know why you want this. AIUI, the early patched alternative is
still needed outside arch/riscv/mm/init.c but before mmu on. For
example, on a SV57 capable platform, the set_satp_mode() will detect
pgtable cap correctly, then _pgtable_l5_enabled = true and
_pgtable_l4_enabled = true, then any pgtable_l5|l4_enabled() calling
outside init.c but before mmu on also expects true. so we need to set
the isa bitmap so that latter apply_early_boot_alternatives() can
correctly patch .text section for us.

BTW, the USE_EARLY_PGTABLE_LEVELS is stolen from the x86 world, see
its USE_EARLY_PGTABLE_L5 ;)

> 
> Cheers,
> Conor.
> 
> (btw, I am kinda unavailable til the 22nd, so sorry if I take some time
> to reply here or to a new revision)

I just sent out v3, could you plz kindly review it when convenient

> 
> > 
> > > gained, as far as I can tell, by setting this early and it only makes
> > > the code more complicated.
> > > 
> > 


