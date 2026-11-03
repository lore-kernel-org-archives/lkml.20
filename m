Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744008;
	b=iRJDdko5/3I7TMo+/MfZtYwcFhPSurFGhB4TotIQWKGjCgP8DjoMNpnps2Z+qJqZmaR2
	 kN8nYU1LMDRwd9W4tp9KuNZvsNUgZzQl+W4PwjUXNXiyJsbJM42/R9quiC1afYqXnCMHX
	 tfC0ejTOu/NakNojyi4skPLdwvaQ20L4wQmBFD+Hifzh2bDrOgOu22Jlj92fnefqh0vjM
	 PtszQ39QBulEQTeQK6Pzq0xusqBkgDnogmLL1sbPAZaAg9gCKOYOXGHcmCu/HAlQt3ofG
	 3p34112tL3mpGLbDkhZXGOZdew+azI0CwoNbY2gB5e7NvkSzLbHMsC1uUXWCG0YYR2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FYgDozVOhRM4JDfEKkxlqSPk10kuZhtX9QzDdoHL+wQ=;
	b=supF4N6OoLc2leU0JYzl1P8VMlLHomwMd+y5U0Saav98cHm55nI3/FpeRDhxQ/1N2fYA
	 Xcq6Awjkhv8oRGqEYwk3T4IrK8D9S0+Uyhsh8GATIZn7HpsRGL/ZhMkzpdeBO4oWp4cRP
	 hrIYUPndc/Lpgp28kl3R+alz7YTlPruiBGfF2qa8Htq7rX1TFSr+CP892hSqEKJtTXG18
	 liRuSx1frW7SaZ7DChLBhfk0e1ykOjvPb9r3aH7GWBLS9PChZLcWtpTyYUxpX8XDmWiZD
	 j7rONHI6yoVYieEDOx/w7g+L4ECh4U9kIV/Amwq6z6yKo4zzt4eTywqUj4wWP2zi1XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DPE/7ccz";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFC5606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BFC5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPE/7ccz
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso54193f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744007; x=1794348807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FYgDozVOhRM4JDfEKkxlqSPk10kuZhtX9QzDdoHL+wQ=;
        b=DPE/7cczWrzdEgveF9OagaGEJsdUjFSMrVTj2h3jvH+HE/tNArl6aIxqhwXdICH+w5
         bB/He/83JKSzbYSy3z640eUPcFRETov3/5zNf1Ndaj+SMTWTwx+qKTTQ4g+qitveuBbP
         gZb5oCoQ3MZrA0sCnDeNfBhg8WudUmz7g2RA98DlhefRNQ7rFFTUUkHAlDOf+yi8w44P
         lEzaOIC5VBALwRJ1MMfIghFSeToc/hQgEUrtOptAwSCochAn5xHJszKSsFBpRNNZgdmB
         8Y4NBZD5VtEcemyp+DKtp0vXq8CdLLuBKRCcCXxAdBX1H1ElpHh9WlCA0UUc5vxEUhff
         PDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744007; x=1794348807;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYgDozVOhRM4JDfEKkxlqSPk10kuZhtX9QzDdoHL+wQ=;
        b=UIfXvPc/HGXqnlKjjSbAclM6CDfXDqlvjJYo/Pg/xaMqVT/Iz9sN/hQU/PVQZgGNgK
         zPw0JgLWAcDt3QuG8c/FatMPB2mj55RMjc+BiLsIo1C13bxC0qugy6grvQsknXkLXfIy
         aifTigblCHFJgcup7sewu1XqwB827Lv4beQYZNONpd3WnCmIjPW4mptRevrs5JwBiORv
         Jb32PIRv9Zt6dkZo8TsohEY37j8efv7q/oYnJ6pLt2ADza1VkfRhz8LGmdaW82m7X8Xv
         QDPCB3jldqHmbMAOSkiU7Wt3sIlTE53NmWHz7Gd5RVxZAcLTOrx2FfxbhuqLBlZoLvOk
         41iQ==
X-Forwarded-Encrypted: i=1; AKwUvByCTV3di+tdE8/D7ET+IPtSqB0Fgqmfa02fQhlGsyouZdnO3kk/2stjsghDqiQvN2omHu0gJ9/DCPscIRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xBoTc3RNLyJlSy2gVOymwyWd09Xg0IqrFVfv2TAgsxizbIOBy
	CJ8EzTy/5kGGkdn1U5DE9mDFJRBtYWbgX44m43fwfP656cUjU9r5p7zC
X-Gm-Gg: AYBFou2sa1XJdt1dnK66exrSxgAbszVHaRs4MfDonAgEoczDtOVJ4nhicYvtzF5vanf
	c8CPRvnQQhM939fIxCzk8ZuCDwdKaeCl8uKdvtyxMSOFOcxL4q1ipkQpucr2nUNU0cKiDsVdRMC
	FXvAZhhkaRtQZ1rRGINT+PfDE9BhqfcTkkEawb62jdAw6WpTwMMZXFkDx19k+ZppQovuPxeJYzL
	/Q0J2TyKVvUtXtiT+wrmnF9NwyIkJWjTtC32BY1iUMqaajXSeJl6a2PLuz0vLFxAGO2Nh7wKIqT
	7C5mfzWl2iqs8ng9ZCU9cZgvr+o4q2IvYAvQADMGoPUCtkZkUp9Vpz98lPfDoPNcVA6UtrD1I1y
	q8R39XepHkF0dsoGO+4YjEd3Ma1MhtAsP1Yrnb4ofOvOLudJDS+1pgaI8oRkilOvXX40ZD8CCjj
	M+BmMdeyRD/joZGwqtlVaAlVgBc9tqqBLXXkMCPpxkqyvBj7oopnUTVxk3v0iFeN8Rz0zPfenO4
	wCNyPXhdtI7GV3XAlvVxTDlQOwVJP2aYVri8do7U1Csujs2OrJ+k2+a8WZhOzAidbj+V//sfnmD
	7YBsGSa/TVm9N6EHdBNLxmhsxINmCA61mcKtLZwCcExYxy4iRLZkuUDnx6u/Yyu3
X-Received: by 2002:a05:6000:4305:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-48fd7cda6e6mr765081f8f.0.1793744006661;
        Tue, 03 Nov 2026 14:13:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed5538basm272474f8f.44.2026.11.03.14.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:13:26 -0800 (PST)
Date: Tue, 3 Nov 2026 22:13:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Kiryl Shutsemau
 <kas@kernel.org>, bp@alien8.de, dave.hansen@linux.intel.com,
 dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
 hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
Message-ID: <20261103221325.789ff51a@pumpkin>
In-Reply-To: <77b8befb-e3dc-4a3f-ab30-b6c85bb90f94@linux.dev>
References: <atCpTMcAALymqADw@thinkstation>
	<20261017192727.2760919-1-usama.arif@linux.dev>
	<atiKeB-76nOj-ztU@thinkstation>
	<CAHk-=wh+dyDPs2kp=KoUiCYdk2MBBqzTKYbrkAyOMV9Z1XNu0w@mail.gmail.com>
	<20261022094958.13aeb5c0@pumpkin>
	<5f6fa235-55bc-45c6-90a8-20f75152e9f2@linux.dev>
	<20261103083238.672cdfa5@pumpkin>
	<77b8befb-e3dc-4a3f-ab30-b6c85bb90f94@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 14:14:50 +0000
Usama Arif <usama.arif@linux.dev> wrote:

> On 03/11/2026 09:32, David Laight wrote:
> > On Mon, 2 Nov 2026 23:03:39 +0000
> > Usama Arif <usama.arif@linux.dev> wrote:
> >   
> >> On 22/10/2026 10:49, David Laight wrote:  
> >>> On Wed, 21 Oct 2026 08:18:25 -1000
> >>> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >>>     
> >>>> On Tue, 20 Oct 2026 at 23:55, Kiryl Shutsemau <kas@kernel.org> wrote:    
> >>>>>
> >>>>> Moving MOVQ inside ALTERNATIVE_2 is ugly...      
> >>>>
> >>>> Yeah, maybe it would make sense to make that function be
> >>>>
> >>>>         movq %rdi, %rax
> >>>>         movq %rdx, %rcx
> >>>>         ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
> >>>>         RET
> >>>>
> >>>> instead? No nop instructions at all, and both alternatives are two bytes.
> >>>>
> >>>> Then do any ERMS logic at the top of memcpy_orig, which now has the
> >>>> registers ready for string instructions anyway.    
> >>>
> >>> Is it possibly to just patch "rep movsb; RET" over whatever gets generated
> >>> for memcpy_orig (after the two register moves) ?
> >>> Then there are neither nops nor a jmp.
> >>>
> >>> David
> >>>     
> >> Hi,
> >>
> >> Sorry for the late reply. I had taken time off for the past couple of weeks
> >> and didnt have access to my work station.
> >>
> >> I implemented Davids suggestion and I think it looks good. The scalar body is
> >> now part of __memcpy(), and FSRM replaces the existing 32-byte check with
> >> "rep movsb; RET". Non-FSRM calls fall straight into scalar code, and FSRM
> >> returns before any padding.
> >>
> >> I have retained the 2048-byte ERMS cutoff, since selecting REP from 32 bytes
> >> regressed short copies in the Cooper Lake tests.
> >>
> >> I asked LLM to review it and it indicated a problem with ITS: returns are
> >> patched before alternatives are copied, so the return decision uses the
> >> replacement's source address. I align replacement storage outside the
> >> copied range so ITS retains the return thunk and relocation preserves its
> >> target. This adds no executed padding.
> >>
> >> Any thoughts on below? I will send it as a proper patch for review
> >> if it looks acceptable.
> >>
> >>
> >> From 9baffefb71c7223702c7bcd96d43b9a2828f3939 Mon Sep 17 00:00:00 2001
> >> From: Usama Arif <usama.arif@linux.dev>
> >> Date: Thu, 1 Oct 2026 14:15:12 -0700
> >> Subject: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
> >>  without FSRM
> >>
> >> Commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
> >> memory copies") left ERMS CPUs without FSRM, including Cooper Lake and
> >> Skylake, using scalar code for all out-of-line copies. Btrfs/zstd input
> >> staging and output flushing accounted for about 34% of memcpy_orig()'s
> >> sampled weight in Meta's x86 fleet profile.
> >>
> >> Use REP MOVSB from 2048 bytes on ERMS CPUs without FSRM, keeping scalar
> >> copies below that threshold. FSRM continues to use REP for all sizes.
> >>
> >> Merge scalar code into __memcpy() and overlay its existing 32-byte check
> >> with REP MOVSB and RET on FSRM, removing the non-FSRM entry jump. Copies
> >> below 32 bytes bypass the ERMS gate. SHR11/JNZ fits one ten-byte NOP
> >> without ERMS; the REP arm reloads the original count from RDX.
> >>
> >> With ITS configured, align replacement storage before its start label so
> >> the raw FSRM return retains its thunk before relocation. The alignment
> >> padding is outside the copied range.
> >>
> >> On Cooper Lake (boost disabled, capped at 1.401 GHz), plain-RET userspace
> >> replicas with aligned warmed buffers and entry offset zero modulo 64
> >> measured 4 KiB copies at 371.7 ns originally and 123.4 ns with this patch:
> >> a 66.8% paired reduction across five process runs. A separate sweep using
> >> REP from 32 bytes increased 32/64/128/256-byte times by
> >> 114.9%/54.4%/66.1%/23.2%, respectively.
> >>
> >> Small-copy costs remain: a warmed aligned zero-byte copy at entry offset
> >> 48 modulo 64 took a paired 0.75 ns more (+7.9%) than the original, in all
> >> five runs. These microbenchmarks do not establish a kernel workload gain
> >> or the best threshold across CPUs.
> >>
> >> Direct copy checks and memcpy KUnit passed with all four ERMS/FSRM
> >> combinations and with ITS forced on; the copied return target was verified.
> >>
> >> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >> ---
> >>  arch/x86/lib/memcpy_64.S | 42 ++++++++++++++++++++++++++--------------
> >>  1 file changed, 27 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> >> index 12a23fa7c44c5..407b226d4de2f 100644
> >> --- a/arch/x86/lib/memcpy_64.S
> >> +++ b/arch/x86/lib/memcpy_64.S
> >> @@ -31,24 +31,27 @@
> >>   * which the compiler could/should do much better anyway.
> >>   */
> >>  SYM_TYPED_FUNC_START(__memcpy)
> >> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> >> -
> >>  	movq %rdi, %rax
> >>  	movq %rdx, %rcx
> >> -	rep movsb
> >> -	RET
> >> -SYM_FUNC_END(__memcpy)
> >> -EXPORT_SYMBOL(__memcpy)
> >> -
> >> -SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
> >> -SYM_PIC_ALIAS(memcpy)
> >> -EXPORT_SYMBOL(memcpy)
> >>  
> >> -SYM_FUNC_START_LOCAL(memcpy_orig)
> >> -	movq %rdi, %rax
> >> +#ifdef CONFIG_MITIGATION_ITS
> >> +	/*
> >> +	 * Returns are patched before alternatives. Keep the replacement
> >> +	 * return in the first half of a cache line so ITS retains its thunk
> >> +	 * when the instruction is copied to its final address.  
> > 
> > I'm not 100% sure what that is about, but does it mean that the cache line
> > alignment of the code here also matters?  
> 
> Not the alignment of __memcpy() itself, only that of the replacement in
> .altinstr_replacement.
> 
> On ITS affected CPUs, a RET in the lower 32 bytes of a 64-byte cache
> line needs mitigation, so apply_returns() leaves such sites as a jump to
> its_return_thunk, whose own RET is in the upper half, and turns the rest
> into a plain RET. It runs before apply_alternatives(), so for the RET in
> the FSRM replacement it decides from the replacement's address, not from
> where the code is copied to. A plain RET could then end up in the lower
> half of a line in __memcpy().

So the RET in the replacement is in the first half a cache line- so becomes a ret.
But, unless __memcpy() is aligned, the relocated RET might be in the second
half so would need mitigating - but you copy in a mitigation-free ret.

If that is the only mitigation then wouldn't aligning memcpy mean you could
just use a ret (possibly followed by an 'int 3' - or whatever is the 'flavour
of the month' instruction for stopping SLS).

David

> 
> 
> >   
> >> +	 */
> >> +	.pushsection .altinstr_replacement, "ax"
> >> +	.balign 64
> >> +	.popsection
> >> +#endif
> >> +	ALTERNATIVE __stringify(cmpq $0x20, %rdx; jb .Lhandle_tail), \
> >> +		    __stringify(rep movsb; RET), X86_FEATURE_FSRM
> >>  
> >> -	cmpq $0x20, %rdx
> >> -	jb .Lhandle_tail
> >> +	/*
> >> +	 * Prepared RCX is scratch for checking length >= 2048.
> >> +	 * The 10-byte alternative fits a NOP without ERMS.
> >> +	 */
> >> +	ALTERNATIVE "", __stringify(shrq $11, %rcx; jnz .Lerms), X86_FEATURE_ERMS  
> > 
> > Can you use %rdx here, preserving %rcx for the 'rep movsb'?
> > You might need to swap cx<=>dx in the rest of the function.
> > (I'm sure we could use #defines to give names to registers....)  
> 
> 
> Yeah thats a good idea! It does make the code change a lot bigger, but its
> easy to review as its just swapping rdx to rcx. If there arent any major objections
> to this version, I will send it as an official patch tomorrow with the swap you
> suggested plus a bit more cleanup on the commit message and comments.
> 
> 
> Thanks for the review!
> Usama
> 
> > 
> > David
> >   
> >>  	/*
> >>  	 * We check whether memory false dependence could occur,
> >> @@ -169,5 +172,14 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
> >>  
> >>  .Lend:
> >>  	RET
> >> -SYM_FUNC_END(memcpy_orig)
> >>  
> >> +.Lerms:
> >> +	movq %rdx, %rcx
> >> +	rep movsb
> >> +	RET
> >> +SYM_FUNC_END(__memcpy)
> >> +EXPORT_SYMBOL(__memcpy)
> >> +
> >> +SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
> >> +SYM_PIC_ALIAS(memcpy)
> >> +EXPORT_SYMBOL(memcpy)  
> >   
> 

