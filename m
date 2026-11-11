Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401919;
	b=lPnetKAJNiN4h1Y1r2sv1mWGr6+KaDgLlYRATOox1Db1hs44NIaKKmG8bfWlyZYiuuRR
	 S8w62sYTeg9qpKqaCOLshf3WnvXVO2LXIC+lJdfOwoYMLkwjgoystpKtSpyotgqq3dX4a
	 OC7BDf8C+gs++kk8zVDQaum49ug6SWh1HoTw3oOt5stuT5tqbtTAjeUxHw/HFRI0u3k+K
	 5BlXSBzBHh9xHjL2CtlpaWgz36iLwBJXQ1HvdkokFo3JrS4apy/mOnSi5/mjQnfQB2P6g
	 0NcoYswSob7x7YuCvyGya2xHLG+rEPllMZpYVGXRpTdRyNc/w0s9VTFvYJQa+lXxCOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401919;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KPyZooxb6qLTcTHsMRqiLji62F6SisPppeJ+HvjwccY=;
	b=Hu6atFOwJDerf+H04vSPdUqd6uL10jHsxhoYpjkX/UgaudXfR1nf8uZAdBvFvbyKmVN5
	 uLQ08fq6Y3PvdTd8xe9qB1cLdBXoVqC3bE/p9SNYjcgqp1XDjK+GlDjlp810myXx2ICde
	 6YKzlENOYzioqkv7CX1da4uyE23op3DMW6RcU59Q9evU4my931brk0oQgkN+hwuHkh0LL
	 hXl0/c1uWBjeHt7YS15rBsgaaDS3khK19kYm4m2MmvLhEH+wrr4xR3NS3ubotVTKQXAVV
	 QSnDL3jNj9n6QVowxxPwEc5/2fZ4+i6X0bILUyaLkKR0PH++WV9GzzP6XTbr+IMHX7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WqVIZZLa;
	arc=none smtp.remote-ip=91.218.175.119
Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5C4606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE5C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WqVIZZLa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n/PhzmNIQD84p7mGnPzCf9PKwY4qk4+A+Cw7fHrUV8o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794401916; v=1; x=1795006716;
 b=WqVIZZLa4GK37345ROW+Ob8Q+kSA4cLQOkz/jVxSiz6A9WSQd3Kraj96k598UZaaGyHzRRjf
 1qXXFLJn+z87uXaBZycNLEqHR/27Ws13tfqv+Kwur6oyq+Ki+IuWi5EfIAbUZrcwzjYHhk3Edvm
 Wem0thTpo+ygyTGTiON4k60w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7d6ab9f2b976eeb0;
	Wed, 11 Nov 2026 12:58:36 +0000
X-Mizu-Trace-ID: 7d6ab9f2b976eeb0
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	david.laight.linux@gmail.com,
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
Date: Wed, 11 Nov 2026 04:58:31 -0800
Message-ID: <20261111125832.2541683-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avNEZ6Zz5IhN2Zao@thinkstation>
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

On Tue, 10 Nov 2026 16:25:54 +0000 Kiryl Shutsemau <kas@kernel.org> wrote:

> On Wed, Nov 04, 2026 at 02:28:06PM -0800, Usama Arif wrote:
> > +#ifdef CONFIG_MITIGATION_ITS
> > +	/*
> > +	 * Returns are patched before alternatives. Align the replacement
> > +	 * source so its return is in the first half of a cache line and ITS
> > +	 * retains its thunk. The copied return can then execute in either
> > +	 * half of a cache line.
> > +	 */
> > +	.pushsection .altinstr_replacement, "ax"
> > +	.balign 64
> > +	.popsection
> > +#endif
> > +	ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> > +		    __stringify(rep movsb; RET), X86_FEATURE_FSRM
> 
> Does this mean any RET in a replacement needs the same alignment? Would
> anything catch it if the next one doesn't have it?

The issue is specific to address-dependent return handling, such as
ITS. apply_returns() runs before alternatives, so its decision uses
the replacement source address. Copying an unthunked return from the
safe half to the vulnerable half can invalidate that decision. The
patch had no check of the copied return's final ITS placement.

I have kept RET in ordinary text, so the decision now uses the address
where it executes. There is no return in either replacement and no
replacement alignment to maintain.


> 
> Linus' layout keeps the RET out of the replacement, with no padding:
> 
> 	movq %rdi, %rax
> 	movq %rdx, %rcx
> 	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
> 	RET
> 
> Non-FSRM takes the same jump it takes today. Does that avoid the ITS
> problem? Why not this layout?

Yes. I have adopted that layout and kept memcpy_orig() separate.
The entry prepares RAX and RCX; the scalar function no longer repeats
that preparation. FSRM replaces only the jump with REP MOVSB, leaving
RET in ordinary text. This resolves the ITS source-address issue.


> 
> > +	/*
> > +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> > +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> > +	 * The 10-byte alternative fits a NOP without ERMS.
> > +	 */
> > +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS
> 
> The RCX/RDX swap is most of the diff, and all it saves is one MOV on
> copies of 2K and up.

Agreed that the register change obscured the functional change. I have
split it into a preparatory patch. It consistently uses RCX for scalar
counts and indexes, and RDX for small-copy data. The subsequent ERMS
patch can shift RDX while preserving RCX for REP MOVSB.


> 
> What about something like this? Untested.

The entry layout is now the one you suggested. I retained the RCX
count in a separate patch, so the ERMS arm needs no count reload.
The gate remains after the 32-byte check and keeps the 2048 threshold.


> 
> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> --- a/arch/x86/lib/memcpy_64.S
> +++ b/arch/x86/lib/memcpy_64.S
> @@ -31,11 +31,9 @@
>   * which the compiler could/should do much better anyway.
>   */
>  SYM_TYPED_FUNC_START(__memcpy)
> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> -
>  	movq %rdi, %rax
>  	movq %rdx, %rcx
> -	rep movsb
> +	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
>  	RET
>  SYM_FUNC_END(__memcpy)
>  EXPORT_SYMBOL(__memcpy)
> @@ -45,11 +43,11 @@ SYM_PIC_ALIAS(memcpy)
>  EXPORT_SYMBOL(memcpy)
> 
>  SYM_FUNC_START_LOCAL(memcpy_orig)
> -	movq %rdi, %rax
> -
>  	cmpq $0x20, %rdx
>  	jb .Lhandle_tail
> 
> +	ALTERNATIVE "", __stringify(shrq $11, %rcx; jnz .Lerms), X86_FEATURE_ERMS
> +
>  	/*
>  	 * We check whether memory false dependence could occur,
>  	 * then jump to corresponding copy mode.
> @@ -169,5 +167,10 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
> 
>  .Lend:
>  	RET
> +
> +.Lerms:
> +	movq %rdx, %rcx
> +	rep movsb
> +	RET
>  SYM_FUNC_END(memcpy_orig)
> 
> If you keep the swap, please make it a separate patch with no functional
> change.

Done. The first patch changes the scalar register allocation and
initializes RCX in memcpy_orig(), with no copy-policy change. The second
patch hoists that preparation and adds the ERMS path and FSRM layout.

> 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov
> 
