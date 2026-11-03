Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694762;
	b=0gKYdnKGydoBe8VJYKwgFSO2ln/emU2IRjkSvTky33QKGc6lAaQGPrCd+Axe09RAdV7/
	 T/vTZoP1+4xHctg2lHGkor9MSEuB9XCmMuU0L7Oj5GAWqfR8U6ZCyd1ZBznMxn1Gk+J8O
	 9OYOlwIzl2KmzCgExRPeFFqqKIT7INIu1NJvD+m5bjEwN4BGRO68QsHtC/IdoyFxX5e5d
	 xCPmu2VDRhhytkst4rQvqHufJZ+MmvDZkTceAvwwq6Fg8CvB1XNBW+VfgdKRUJvNAUT2y
	 +YST70rRqs0sZOxg0iTGgfGIONXCc84jY0IXLHkm7dGzFpIOXo69cOOHj/NiYTchVPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=juHaABmsqQoLeAA/rLT1aKfzFmL4zz9z1UEoFz1K2V8=;
	b=Dw5PcGxaGQ84rlXRiUAS9YGKXX0PfEwRB+nd291uFtdNThHn35QvzAWpwsS6RIhxjAbn
	 d8+lDIVEidTDj1vr4C9+Nyc0mQTq5kmjtgEnmNQ0vsFY3Yh38vAI0nbfNmf2yf3sO/kWQ
	 9zpAiAA94tGh12Ht/X5CYPLWoZNGN5BT0Nwdu/dTknlqU6hAdxfko0Iem0pc17JOGnF0D
	 oU8tUd2FCArcC/Vl2S1n/+2NhVQfWb+ZOY4HOCJoOfWq0tofX9gmZnARQ1ftJBV3Rm3o+
	 NMVgJP8iQFq9d2CoAlYpxAiEGFb9VBTNWRNTPTRPBQtjRLXl6Pn1/QwJari04hOiXUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eicz9JMp;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2541606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2541606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eicz9JMp
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso25484775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694760; x=1794299560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juHaABmsqQoLeAA/rLT1aKfzFmL4zz9z1UEoFz1K2V8=;
        b=Eicz9JMpGYkp48+od1f2riYo7DPn3BBHQx4PtS3ZrM4k+SuKgHBr/RuSwxBuL5GLgm
         hlg8nmHApezVHw5ptwT0M+3vQtMVwhXmM5p/GYj8x+djDjLJw2hZoR0Ux7uqWCeylBKM
         cU1v6E2IbUkRXzdjFr74u91COXZz4CSDszbdtR566O3YCIKPPIQFugxKc1WeNK3zNwiL
         v7yk2tV9jX+KqWTJWBJPX/FHvXUktdJnecR6y/ctoJQTiy2wKRbUOztX6KfQr427rOIV
         +aQNJITwsGOME/2ct6R2NnNMqVlPMLZwTTM2p4fB+g3MdoAaNmfZz22cAN/wgUFqV3+h
         9zZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694760; x=1794299560;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juHaABmsqQoLeAA/rLT1aKfzFmL4zz9z1UEoFz1K2V8=;
        b=r0f8shRFa8AzAgDtSnmReakMRdFgvZq7+WePq1lLT7aKol6M/ovS/ONErXWXkCXE2H
         2oiBVmq2yps86WBipXuSxgKLozDRya5lUg1vrhMw9Mdys6i0d0y+J+ohAIDYQBDetSK4
         dpSo/UA830ToWyjOXOqeOk50J8631wV9Lz0Vf/8cdnfQyerJBsJMKJvKXdJqMffvMpqm
         FWjY/PI/WathOGqy2B1z+HvgeuHSzAKa7XpdSaXcJ9FSVMkfftTtxe1OPF2vCIUBmsrj
         QNKWbx9u7G7S3N5BoWLsqAOk8N8kWmUFrMB4YYt6NrzjrcfVXdIItaTUp1EmQA3aPDVJ
         OHmA==
X-Forwarded-Encrypted: i=1; AKwUvBxxbwYxMGQFD7gD+LO3keSJU+yk/BUQjmovCJSYEsq7xSlVPshXBS9gnn3N1F4JpLukhl4Khq1Fpj+Y+ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fjASgTQB+ckDEoEKGaJKHYKalFUawh/GX0DkR+Zb7qufD9gsh
	o8SzK6ad4rA3ksWjW8AIQeD9PsUTrJuUB1UU0Ba60QWTYzgbzR1JqGwv
X-Gm-Gg: AYBFou1H/RiEAODdHNL/nfGXHZ7bh0sVk0cJexTOT7Y/IoKW26zcKW37CwbwLE2PAA6
	PbAuTZAJX/yA6ZUIUsqnK6nKijrUnjhdFbi5cSdlYjVC3JNLI4gOiEoTCt5MEWMrPRfPQsoEJRc
	yXEX12DkwKzlNwMGNJWowSazbYgFoLYwdyCRwE2a3YnzzrIRRrnoN0PzlSXaG8QIajGEnQLEXh2
	BxYC/c2PKfgHgmlVXqS+GdZ1QeEpuRRLGBlIunTelEN+d4ESjsPs7bqaoszlY057RZyc22vrFfL
	wxZquWEhXWpuVZKO9TzYZnvEw7XaRpx8w40t32byqy4C9iSwG3JAItcAXV6GtX1bRwKG6WOqTlT
	vlxu9FjVZe5hpf1JP86x2nd5e2h5BY09GNQiP9rnJHK1F38zR0GdO8x7gcLigMOaPU7KwzPKKWU
	oG+49h7nkUtWwd20+JBSFDOT2Obx6AdRuFHMvWRNXh8EtdyFfW9Fqku0DguCri99xK0u5Rsm4Hf
	4ahr+EKbSQ9SbvfZf5IDAxapOBpzDPzNofo/4nuvoqyr4cnXXHrPqD7qQUe1iuIYlpiE/amFu2h
	nrHIYP0TNtvQyTzDSo4hYOThEDZyKAZ2SmRalPUxHkPPCfk+SJglghYhrTu2SfTR
X-Received: by 2002:a05:600c:871a:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ac14ec7947mr285296425e9.2.1793694760039;
        Tue, 03 Nov 2026 00:32:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc87fsm38346675e9.12.2026.11.03.00.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:32:39 -0800 (PST)
Date: Tue, 3 Nov 2026 08:32:38 +0000
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
Message-ID: <20261103083238.672cdfa5@pumpkin>
In-Reply-To: <5f6fa235-55bc-45c6-90a8-20f75152e9f2@linux.dev>
References: <atCpTMcAALymqADw@thinkstation>
	<20261017192727.2760919-1-usama.arif@linux.dev>
	<atiKeB-76nOj-ztU@thinkstation>
	<CAHk-=wh+dyDPs2kp=KoUiCYdk2MBBqzTKYbrkAyOMV9Z1XNu0w@mail.gmail.com>
	<20261022094958.13aeb5c0@pumpkin>
	<5f6fa235-55bc-45c6-90a8-20f75152e9f2@linux.dev>
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

On Mon, 2 Nov 2026 23:03:39 +0000
Usama Arif <usama.arif@linux.dev> wrote:

> On 22/10/2026 10:49, David Laight wrote:
> > On Wed, 21 Oct 2026 08:18:25 -1000
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >   
> >> On Tue, 20 Oct 2026 at 23:55, Kiryl Shutsemau <kas@kernel.org> wrote:  
> >>>
> >>> Moving MOVQ inside ALTERNATIVE_2 is ugly...    
> >>
> >> Yeah, maybe it would make sense to make that function be
> >>
> >>         movq %rdi, %rax
> >>         movq %rdx, %rcx
> >>         ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
> >>         RET
> >>
> >> instead? No nop instructions at all, and both alternatives are two bytes.
> >>
> >> Then do any ERMS logic at the top of memcpy_orig, which now has the
> >> registers ready for string instructions anyway.  
> > 
> > Is it possibly to just patch "rep movsb; RET" over whatever gets generated
> > for memcpy_orig (after the two register moves) ?
> > Then there are neither nops nor a jmp.
> > 
> > David
> >   
> Hi,
> 
> Sorry for the late reply. I had taken time off for the past couple of weeks
> and didnt have access to my work station.
> 
> I implemented Davids suggestion and I think it looks good. The scalar body is
> now part of __memcpy(), and FSRM replaces the existing 32-byte check with
> "rep movsb; RET". Non-FSRM calls fall straight into scalar code, and FSRM
> returns before any padding.
> 
> I have retained the 2048-byte ERMS cutoff, since selecting REP from 32 bytes
> regressed short copies in the Cooper Lake tests.
> 
> I asked LLM to review it and it indicated a problem with ITS: returns are
> patched before alternatives are copied, so the return decision uses the
> replacement's source address. I align replacement storage outside the
> copied range so ITS retains the return thunk and relocation preserves its
> target. This adds no executed padding.
> 
> Any thoughts on below? I will send it as a proper patch for review
> if it looks acceptable.
> 
> 
> From 9baffefb71c7223702c7bcd96d43b9a2828f3939 Mon Sep 17 00:00:00 2001
> From: Usama Arif <usama.arif@linux.dev>
> Date: Thu, 1 Oct 2026 14:15:12 -0700
> Subject: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
>  without FSRM
> 
> Commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
> memory copies") left ERMS CPUs without FSRM, including Cooper Lake and
> Skylake, using scalar code for all out-of-line copies. Btrfs/zstd input
> staging and output flushing accounted for about 34% of memcpy_orig()'s
> sampled weight in Meta's x86 fleet profile.
> 
> Use REP MOVSB from 2048 bytes on ERMS CPUs without FSRM, keeping scalar
> copies below that threshold. FSRM continues to use REP for all sizes.
> 
> Merge scalar code into __memcpy() and overlay its existing 32-byte check
> with REP MOVSB and RET on FSRM, removing the non-FSRM entry jump. Copies
> below 32 bytes bypass the ERMS gate. SHR11/JNZ fits one ten-byte NOP
> without ERMS; the REP arm reloads the original count from RDX.
> 
> With ITS configured, align replacement storage before its start label so
> the raw FSRM return retains its thunk before relocation. The alignment
> padding is outside the copied range.
> 
> On Cooper Lake (boost disabled, capped at 1.401 GHz), plain-RET userspace
> replicas with aligned warmed buffers and entry offset zero modulo 64
> measured 4 KiB copies at 371.7 ns originally and 123.4 ns with this patch:
> a 66.8% paired reduction across five process runs. A separate sweep using
> REP from 32 bytes increased 32/64/128/256-byte times by
> 114.9%/54.4%/66.1%/23.2%, respectively.
> 
> Small-copy costs remain: a warmed aligned zero-byte copy at entry offset
> 48 modulo 64 took a paired 0.75 ns more (+7.9%) than the original, in all
> five runs. These microbenchmarks do not establish a kernel workload gain
> or the best threshold across CPUs.
> 
> Direct copy checks and memcpy KUnit passed with all four ERMS/FSRM
> combinations and with ITS forced on; the copied return target was verified.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/x86/lib/memcpy_64.S | 42 ++++++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> index 12a23fa7c44c5..407b226d4de2f 100644
> --- a/arch/x86/lib/memcpy_64.S
> +++ b/arch/x86/lib/memcpy_64.S
> @@ -31,24 +31,27 @@
>   * which the compiler could/should do much better anyway.
>   */
>  SYM_TYPED_FUNC_START(__memcpy)
> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> -
>  	movq %rdi, %rax
>  	movq %rdx, %rcx
> -	rep movsb
> -	RET
> -SYM_FUNC_END(__memcpy)
> -EXPORT_SYMBOL(__memcpy)
> -
> -SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
> -SYM_PIC_ALIAS(memcpy)
> -EXPORT_SYMBOL(memcpy)
>  
> -SYM_FUNC_START_LOCAL(memcpy_orig)
> -	movq %rdi, %rax
> +#ifdef CONFIG_MITIGATION_ITS
> +	/*
> +	 * Returns are patched before alternatives. Keep the replacement
> +	 * return in the first half of a cache line so ITS retains its thunk
> +	 * when the instruction is copied to its final address.

I'm not 100% sure what that is about, but does it mean that the cache line
alignment of the code here also matters?

> +	 */
> +	.pushsection .altinstr_replacement, "ax"
> +	.balign 64
> +	.popsection
> +#endif
> +	ALTERNATIVE __stringify(cmpq $0x20, %rdx; jb .Lhandle_tail), \
> +		    __stringify(rep movsb; RET), X86_FEATURE_FSRM
>  
> -	cmpq $0x20, %rdx
> -	jb .Lhandle_tail
> +	/*
> +	 * Prepared RCX is scratch for checking length >= 2048.
> +	 * The 10-byte alternative fits a NOP without ERMS.
> +	 */
> +	ALTERNATIVE "", __stringify(shrq $11, %rcx; jnz .Lerms), X86_FEATURE_ERMS

Can you use %rdx here, preserving %rcx for the 'rep movsb'?
You might need to swap cx<=>dx in the rest of the function.
(I'm sure we could use #defines to give names to registers....)

David

>  	/*
>  	 * We check whether memory false dependence could occur,
> @@ -169,5 +172,14 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>  
>  .Lend:
>  	RET
> -SYM_FUNC_END(memcpy_orig)
>  
> +.Lerms:
> +	movq %rdx, %rcx
> +	rep movsb
> +	RET
> +SYM_FUNC_END(__memcpy)
> +EXPORT_SYMBOL(__memcpy)
> +
> +SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
> +SYM_PIC_ALIAS(memcpy)
> +EXPORT_SYMBOL(memcpy)

