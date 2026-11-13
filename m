Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579107;
	b=bE1AjPJQysg9Gp3afR3DqHxqjuUdR7YLlAuBlpSKoIbHTrbkrAOn4b5kbS4WSEoiVaX+
	 oSCD2XS7D2R2oFtoZiF4wuszhfJjf8/MdFHjtMNwnqFGizsKvbF7VYeEiWmJZZbyVMJOQ
	 QnlfLmuQ5phl/OcvmmhtMscXVHeIPeT4X+NHGspWi/EH7XXYS1adrcmSRyJ9+W0t95Lm6
	 LB6AUKVUZxKmH418GNnoz7pKwVvCvRvzMO1udMsoQnDGbuTEycbL2Bd7cMsaaU8ZhZ3uG
	 YyRKx7Gd2HTGWNGWFxNxEUgRfFwjcIqRzBXkoCVgn0GKtdVEn6kZbUfPW3GCbug6TQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579107;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W9HQtAENQ5vKmfYGjX4tSmI9PFf5B7WDYiNarXEtyzM=;
	b=t5X7jv1PYTeE+Hay7HtstfEmE5isvzbPiDKPLBkqs/+PAI4OCO4dyCYxoxkbtU1G3roz
	 7QpSbauA/wqcIqjRFBGZ+H5cypcs5GDPeMGvUKWrTruRYsnjBp3FKyleTIc4ShJkUPC7I
	 utWsryU9qBhBk6siC5o7Ekt+Xvpwj42A1cE/N17iCARMMXu5I2I3yNBPJMPaqpBqlq3K1
	 AeWM1bmBzQLI/qwfvXyEdwpcYFRy8DIyUWcUDibkXNlH2Ts44hcBerv0x6v11AX+pP9Sx
	 0V0fPmwMDG7bdZ7YeqZ8igLOYxMUrikR75BMREBciZNMeTdx2ZL18ETWrCMBraL1NVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rYOhSodA;
	arc=none smtp.remote-ip=95.215.58.19
Received: from mta1.migadu.com (out-19.mta1.migadu.com [95.215.58.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093B606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C093B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rYOhSodA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DPVdUFrRPGoonaY06A4ANCt73kujshDvNbXCKgox26M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794579104; v=1; x=1795183904;
 b=rYOhSodA1HeX1JG+ysruYZIanHU9dDXemj6t6WOywemvMiJHSB+c/JURl9HW1VsS1LitWI3Z
 uRFDNk0Ko0hr3Rv1RYqotqNwk1Hkm8Cmte0JanjjlgUYOf1F/UYnBVacE/PQSiy3csUXkPG5kZw
 puFO234F+f1zov56DTouFYBA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7bf90050f2e4e577;
	Fri, 13 Nov 2026 14:11:44 +0000
X-Mizu-Trace-ID: 7bf90050f2e4e577
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Borislav Petkov <bp@alien8.de>
Cc: Usama Arif <usama.arif@linux.dev>,
	david.laight.linux@gmail.com,
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
Date: Fri, 13 Nov 2026 06:11:36 -0800
Message-ID: <20261113141137.1113517-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
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

On Wed, 11 Nov 2026 15:46:08 -0800 Borislav Petkov <bp@alien8.de> wrote:

> On Wed, Nov 11, 2026 at 05:20:53AM -0800, Usama Arif wrote:
> > diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> > index 7bb146c811029..5320862e0274e 100644
> > --- a/arch/x86/lib/memcpy_64.S
> > +++ b/arch/x86/lib/memcpy_64.S
> > @@ -27,15 +27,13 @@
> >   *
> >   * The 'rep movsb' itself is small enough to replace the call, but the
> >   * two register moves blow up the code. And one of them is "needed"
> > - * only for the return value that is the same as the source input,
> > + * only for the return value that is the same as the destination input,
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
> > @@ -45,12 +43,16 @@ SYM_PIC_ALIAS(memcpy)
> >  EXPORT_SYMBOL(memcpy)
> >  
> >  SYM_FUNC_START_LOCAL(memcpy_orig)
> > -	movq %rdi, %rax
> > -	movq %rdx, %rcx
> > -
> >  	cmpq $0x20, %rcx
> >  	jb .Lhandle_tail
> >  
> > +	/*
> > +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> > +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> > +	 * The 10-byte alternative fits a NOP without ERMS.
> > +	 */
> > +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS
> 
> Sorry, this is adding more JMPs in "conditional" alternatives code and thus
> turns this into a bigger and unmaintainable mess than it already is.
>

How about something like what I have added at the end, would that be more
acceptable in terms of maintainability?
 
> The 2K limit looks like something conjured out of a thin air as it seems it
> work for your particular case. I'm sure we will have to whack it in the future
> because someone else will complain of the opposite.
> 

As mentioned in the commit message as well as [1], 2K came from experiments.

Changing the cmp immediate from 2048 to 32 bytes made aligned warmed
32/64/128/256-byte copies 101.2%/69.5%/53.5%/16.5% slower.

This is usecase driven, as Linus said in [2]: "let's see if somebody finds a
case where the kernel memory copies also care".

If someone finds a case where less than 2K is used and it doesnt cause a
regression for CPUs, they can try lowering it.

> This needs to be done with alternative_call*, even at the price of some
> duplicated code but without turning what already is a mess, into a bigger one.
> 

I tried alternative_call_2() from a C entry with separate helpers. It
adds a helper CALL/RET to every path, including FSRM. The attached
version uses tail jumps, so each helper returns directly to the original
caller and FSRM keeps REP inline. I am hoping this is acceptable?

> Or a static key or even with stop_machine_nmi() (currently in review) which
> patches the kernel even later, when it is convenient to do so.
> 
> Whatever it takes to keep this code readable and sane.
> 
> But not this.
> 
> Sorry.
> 

No worries! Hopefully the version below is more maintainable and acceptable
for everyone?

Thanks for the review!
Usama

[1] https://lore.kernel.org/all/20261017192727.2760919-1-usama.arif@linux.dev/
[2] https://git.kernel.org/linus/47ee3f1dd93bcbe031539b1ecdaafb44b661c772

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 7bb146c811029..8a398edf6e160 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -27,15 +27,15 @@
  *
  * The 'rep movsb' itself is small enough to replace the call, but the
  * two register moves blow up the code. And one of them is "needed"
- * only for the return value that is the same as the source input,
+ * only for the return value that is the same as the destination input,
  * which the compiler could/should do much better anyway.
  */
 SYM_TYPED_FUNC_START(__memcpy)
-       ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
-
        movq %rdi, %rax
        movq %rdx, %rcx
-       rep movsb
+       /* FSRM takes precedence. Keep RET outside replacements for ITS. */
+       ALTERNATIVE_2 "jmp memcpy_orig", "jmp memcpy_erms", \
+                     X86_FEATURE_ERMS, "rep movsb", X86_FEATURE_FSRM
        RET
 SYM_FUNC_END(__memcpy)
 EXPORT_SYMBOL(__memcpy)
@@ -44,10 +44,15 @@ SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
 SYM_PIC_ALIAS(memcpy)
 EXPORT_SYMBOL(memcpy)

-SYM_FUNC_START_LOCAL(memcpy_orig)
-       movq %rdi, %rax
-       movq %rdx, %rcx
+/* The entry prepares RAX as the return value and RCX as the count. */
+SYM_FUNC_START_LOCAL(memcpy_erms)
+       cmpq $2048, %rcx
+       jb memcpy_orig
+       rep movsb
+       RET
+SYM_FUNC_END(memcpy_erms)

+SYM_FUNC_START_LOCAL(memcpy_orig)
        cmpq $0x20, %rcx
        jb .Lhandle_tail
 
