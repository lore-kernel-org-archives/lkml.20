Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580294;
	b=5AajtBIXGt+3nImxl2hPFjbAKhh5vDO4sdZ7ztBs3sjRaMXgXlLH1H2v0yTC+h9pEXYG
	 SNb9K/tpxF6CesMYeeNQ61XDU0ORR9qjIFxzL68yha5EhOHMCTYuEkh2SgcwmetVjWfkt
	 b6QlV32ErMJoCywU/poLRccu0R0dttW3gw3seIGVOxR93pJKgZo2ffT3xuM/NV5hhzg2Y
	 bLcMR7YiFl9XtWIMNJOF3Tml4jEeOhK/3M6/flY532u88rSmHCNLdEEMuIXhISPPwc0fo
	 5PZX7FL4s5mx4M1zL58nbFMIOCE0eFL7TXWOZz9NgGlOz2aoVULKvyZxQK15aUIKu0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580294;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/GNt6F0WGkGjAhT/kwG+PoYS3GyLXEQu1iCJQcPdwUM=;
	b=jF+jKAWr1XP9rDzD/wHTjOaEDmEwVNZmZJPqxQgkeBzP8b4MXr50sp/BVRqwc91I/ErJ
	 +NA2M/CKov7PPiBNnrXUruImbgPNArTaVtssHxmvN1Yw/O/sE39MlsWW20ynAKe1NvmHE
	 G5tHLZv2dglbYvwj9t5tAd0vmQn6dnvdop9dmN9nq9279El5sPE2vlL9boqL4Uw99TRJn
	 9GXBI6eNjHvtfxkHsAgvzwYRzFyYs4JnwdxAO0FMGl17ktXAvqncojNVV6wHhtkWphllW
	 gOkbu5sw+LkGVqI3T/wTj7rd5kMA5mnBTfq5wuIa+8L1T+7NPjnwOuappOdz270yyDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aTGDfczo;
	arc=none smtp.remote-ip=95.215.58.156
Received: from mta1.migadu.com (out-156.mta1.migadu.com [95.215.58.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8BC606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D8BC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aTGDfczo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=101SHGfBgJHChJCV/ThZnHKUkDRzymRKW30t3wvPYGI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794580291; v=1; x=1795185091;
 b=aTGDfczooS74a4M1/KQurgmxwSOHdGpogOkUnZ05rUOG11kvo37GQ49llPva8zTC+bDejBlI
 zaIkBiToN203+iNl0+8+MNu+DyD1Gg3Nwc8VteIItmc0AmJoOVZUW/UZXAzp+03FAinOSdJMkbD
 l4plvGKUTqsvDAJlO4kToSo4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c5395c9bf243e6ea;
	Fri, 13 Nov 2026 14:31:31 +0000
X-Mizu-Trace-ID: c5395c9bf243e6ea
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: David Laight <david.laight.linux@gmail.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Borislav Petkov <bp@alien8.de>,
	dave.hansen@linux.intel.com,
	dsterba@suse.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	terrelln@fb.com,
	tglx@kernel.org,
	x86@kernel.org,
	torvalds@linux-foundation.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
Date: Fri, 13 Nov 2026 06:31:23 -0800
Message-ID: <20261113143124.1454967-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261112093729.065afd6c@pumpkin>
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

On Thu, 12 Nov 2026 09:37:29 +0000 David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 11 Nov 2026 15:46:08 -0800
> Borislav Petkov <bp@alien8.de> wrote:
> 
> > On Wed, Nov 11, 2026 at 05:20:53AM -0800, Usama Arif wrote:
> > > diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> > > index 7bb146c811029..5320862e0274e 100644
> > > --- a/arch/x86/lib/memcpy_64.S
> > > +++ b/arch/x86/lib/memcpy_64.S
> > > @@ -27,15 +27,13 @@
> > >   *
> > >   * The 'rep movsb' itself is small enough to replace the call, but the
> > >   * two register moves blow up the code. And one of them is "needed"
> > > - * only for the return value that is the same as the source input,
> > > + * only for the return value that is the same as the destination input,
> > >   * which the compiler could/should do much better anyway.
> > >   */
> > >  SYM_TYPED_FUNC_START(__memcpy)
> > > -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> > > -
> > >  	movq %rdi, %rax
> > >  	movq %rdx, %rcx
> > > -	rep movsb
> > > +	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
> > >  	RET
> > >  SYM_FUNC_END(__memcpy)
> > >  EXPORT_SYMBOL(__memcpy)
> > > @@ -45,12 +43,16 @@ SYM_PIC_ALIAS(memcpy)
> > >  EXPORT_SYMBOL(memcpy)
> > >  
> > >  SYM_FUNC_START_LOCAL(memcpy_orig)
> > > -	movq %rdi, %rax
> > > -	movq %rdx, %rcx
> > > -
> > >  	cmpq $0x20, %rcx
> > >  	jb .Lhandle_tail
> > >  
> > > +	/*
> > > +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> > > +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> > > +	 * The 10-byte alternative fits a NOP without ERMS.
> > > +	 */
> > > +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS  
> > 
> > Sorry, this is adding more JMPs in "conditional" alternatives code and thus
> > turns this into a bigger and unmaintainable mess than it already is.
> > 
> > The 2K limit looks like something conjured out of a thin air as it seems it
> > work for your particular case. I'm sure we will have to whack it in the future
> > because someone else will complain of the opposite.
> > 
> > This needs to be done with alternative_call*, even at the price of some
> > duplicated code but without turning what already is a mess, into a bigger one.
> 
> Multiple functions seems like a good idea.
>

Hopefully the version in [1] is acceptable!
 
> In some cases you can patch the constant in the instruction.
> That is safe here even if a multi-byte constant crosses a cache line
> because it is only an optimisation.
> 

I think it might be a good idea to start with just a constant and if
someone can comeup with a usecase that needs it patched, we can then
look at this? Basically prefer to keep it usecase driven.

> Patching the call sites would certainly be cleaner.
> More interesting would be having a function with a non-standard calling
> convention (%rdi, %rsi, %rcx, everything else preserved, void result)
> so that the 5 byte call can be patched with "rep movsb; nop3".
> I can't see anywhere that uses the result.
> Maybe start with "rep movsb; nop3" and patch with the call?
> You'd still need a normal memcpy() for the calls gcc makes and if the
> address is taken.
> 

Replacing the caller's CALL with REP MOVSB could remove actual call
overhead. The C wrapper I tried patches a CALL inside __memcpy() and
adds a helper call and return. The attached tail dispatcher handles the
existing public ABI and leaves caller-side patching for a follow-up.

The scalar helper currently uses RDX and R8-R11 as scratch. Your private
void interface would need an implementation that preserves those
registers, or register saves. RCX already holds the count, and the
scalar helper preserves RAX and the callee-saved registers.

There are return-value users: memdup_buf() in
lib/crypto/tests/test-utils.h returns memcpy()'s pointer. The normal
entry must still return the original destination in RAX and support
compiler-generated and address-taken calls, as you point out. The
current revision preserves that ABI and its aliases.


> A special function to do the patching would also make sense.
> All Intel non-atom cpu since sandy bridge run 'rep movsb' as fast
> as 'rep movsq' - so you only need to worry about short copies.
> Whereas some of the older Zen cpu run misaligned copies slowly.
> So you could pick/patch the most appropriate code using more complex
> logic than just whether one of the X86_FEATURE_xxx bits is set.
>

I agree that CPU model and alignment can inform a better policy.

I think to do this, we need access to many different CPUs to test.
I am confident that the 2K cmp will not regress other CPUs and is a good
start. Would it make sense to go ahead with the apprach in the current
patch and develop later on it if someone comes up with a usecase?
 
> The same calling convention might make sense for memmove().
> Although it probably wants a scratch register for the (dst - src < len)
> check (it might want dst in the scratch register!).
> 
> David
> 

[1] https://lore.kernel.org/all/20261113141137.1113517-1-usama.arif@linux.dev/ 
