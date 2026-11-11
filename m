Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402164;
	b=Sh9k6G2Uswe30cY4TaU1S4Lo2QoUwS4rNGWBJxDEEoaR8qH70poXVqcbEn3dii9lY09j
	 d0rwrW7jhYPLC5gwDFw9F7v0Y9HEZ7ROVTSmOjuirCpLRDWCqjytLXdX8I/hXS4scbV6q
	 c/IaLz8w+vHuFAhTPqbknBduBiGiy3u2tEmkasNK471umOZUf7t/WtNzR6AGNW+S1APYi
	 j1djyE6+PPi4OekYJ6FVXj2CO0T1/635sF/nIX6ifCkpIlGNgLLZmWEVAtadwNIdrlsDh
	 zQ50DQsJRg4yRRSui3EDfEzzSGbBgbZabjIlK+g7v0RgaqwLHcuRUTnL560WiGoXWfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402164;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RaHa2H5IlxgkhROwEqCs0bYC+q480dw5LyjdDOhAiTU=;
	b=3gz+9II/3VKLTbnoO0kO1qapOpy2FMaoFlHc0qbUivltq5Uf7wHOjNUPtUixONiJdztR
	 EFv+vhyEjrME3w5RiNYEHv0iqhCX0sQtYyXja9sw0WuiKgNnCzcqSdL+JdjKnyAdb3Iiv
	 3GqT5TTRDGif/h6c/V+UanlBrAV0eHIHjo9g4NkhlYdYzScMjvsVQVFz2snb9Qf6C57im
	 tHLZQp73n9z8sl+/KjChAAgK88VtMp19vUZMRJfmlV3jQkyq1jnZTod0eNXYAq/8DndjS
	 xOi90F8nXB5/mKjnhstxydgIPuRRe7fxow5RO8TChOPJhaR64tPfT70vTII1CVjzrWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ro2rvqHr;
	arc=none smtp.remote-ip=95.215.58.217
Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB183606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB183606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ro2rvqHr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w51VNqQex41eC5Fs+GsUJNQtZZ3MIGSGYZarUi+P+/w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794402161; v=1; x=1795006961;
 b=ro2rvqHrQb+ulO6y9BOTtnWCmsZjqfTmZ4Cp43IsZsFKcsACN86hWBdRTBU/XC1qHzyai6t6
 Lt9kFq5AQjDCFYbjwVtTq2zOEhW8ZZOHVu12+tplle0MB15zlqh+WNHua7XZuWdUcZisBJJ8dR3
 iBVTXH322joKmGj38t2rHUAE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e48fb843a56a17fd;
	Wed, 11 Nov 2026 13:02:41 +0000
X-Mizu-Trace-ID: e48fb843a56a17fd
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: David Laight <david.laight.linux@gmail.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dsterba@suse.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	terrelln@fb.com,
	tglx@kernel.org,
	x86@kernel.org,
	torvalds@linux-foundation.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
Date: Wed, 11 Nov 2026 05:02:37 -0800
Message-ID: <20261111130238.2629939-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110170655.35a7c439@pumpkin>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 17:06:55 +0000 David Laight <david.laight.linux@gmail.com> wrote:

> On Tue, 10 Nov 2026 16:25:54 +0000
> Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> > On Wed, Nov 04, 2026 at 02:28:06PM -0800, Usama Arif wrote:
> > > +#ifdef CONFIG_MITIGATION_ITS
> > > +	/*
> > > +	 * Returns are patched before alternatives. Align the replacement
> > > +	 * source so its return is in the first half of a cache line and ITS
> > > +	 * retains its thunk. The copied return can then execute in either
> > > +	 * half of a cache line.
> > > +	 */
> > > +	.pushsection .altinstr_replacement, "ax"
> > > +	.balign 64
> > > +	.popsection
> > > +#endif
> > > +	ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> > > +		    __stringify(rep movsb; RET), X86_FEATURE_FSRM  
> > 
> > Does this mean any RET in a replacement needs the same alignment? Would
> > anything catch it if the next one doesn't have it?
> 
> My suspicion is that ideally 'yes'.
> But someone said (in this thread) that it is worse for RET in the first
> half a cache line - so aligning the replacement that way is better.)

Yes, ITS requires mitigation for a return in the first half of a
cache line. Aligning the old replacement there kept its thunk when
copied. The next version will keep RET in ordinary text, so ITS uses its
execution address and the replacement alignment is unnecessary.

> 
> > Linus' layout keeps the RET out of the replacement, with no padding:
> > 
> > 	movq %rdi, %rax
> > 	movq %rdx, %rcx
> > 	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
> > 	RET
> > 
> > Non-FSRM takes the same jump it takes today. Does that avoid the ITS
> > problem? Why not this layout?
> 
> It adds a jump to the non-FSRM path.
> Cold cache that is likely to be measurable.

The upstream code already jumps to memcpy_orig(); I have the next version
retaining that jump. Preparing RCX at the public entry adds a MOV on the
scalar path. The return stays in ordinary text so ITS uses its execution
address. I will post the next version today so that its easier to have
a discussion

> (But not if RET ends up being anything other than 0xc3 -  that will
> just kill everything.)
> 
> > 
> > > +	/*
> > > +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> > > +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> > > +	 * The 10-byte alternative fits a NOP without ERMS.
> > > +	 */
> > > +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS  
> > 
> > The RCX/RDX swap is most of the diff, and all it saves is one MOV on
> > copies of 2K and up.
> 
> Register-register moves don't cost much (they can even be done my the
> register renaming logic rather than the alu - but still have to be
> fetched and decoded), but needing them is a bit of 'lack of attention
> detail' when a simple backtrack can get the value where it is needed.
> gcc is very bad at it, a compiler really ought to do a lot better.
> 
> David
> 
> > 
> > What about something like this? Untested.
> > 
> > diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> > --- a/arch/x86/lib/memcpy_64.S
> > +++ b/arch/x86/lib/memcpy_64.S
> > @@ -31,11 +31,9 @@
> >   * which the compiler could/should do much better anyway.
> >   */
> >  SYM_TYPED_FUNC_START(__memcpy)
> > -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> > -
> >  	movq %rdi, %rax
> >  	movq %rdx, %rcx
> > -	rep movsb
> > +	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
> >  	RET
> >  SYM_FUNC_END(__memcpy)
> >  EXPORT_SYMBOL(__memcpy)
> > @@ -45,11 +43,11 @@ SYM_PIC_ALIAS(memcpy)
> >  EXPORT_SYMBOL(memcpy)
> > 
> >  SYM_FUNC_START_LOCAL(memcpy_orig)
> > -	movq %rdi, %rax
> > -
> >  	cmpq $0x20, %rdx
> >  	jb .Lhandle_tail
> > 
> > +	ALTERNATIVE "", __stringify(shrq $11, %rcx; jnz .Lerms), X86_FEATURE_ERMS
> > +
> >  	/*
> >  	 * We check whether memory false dependence could occur,
> >  	 * then jump to corresponding copy mode.
> > @@ -169,5 +167,10 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
> > 
> >  .Lend:
> >  	RET
> > +
> > +.Lerms:
> > +	movq %rdx, %rcx
> > +	rep movsb
> > +	RET
> >  SYM_FUNC_END(memcpy_orig)
> > 
> > If you keep the swap, please make it a separate patch with no functional
> > change.
> > 
> 
> 
