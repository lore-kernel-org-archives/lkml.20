Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866329;
	b=rFCMga8JcnLmiCeXrCNf3BjU8vR/rsXbwva4pLRcNRdbAsWRoqgoXW1XcrMif4V3qN6f
	 RkrPUxiF6ArBALQpwSGb7TsQDVohrK5z7ifFzvFul/gJMEe0eLpJdePb/7h0BGHKaGceI
	 b7Ac7n8lRVIrw3hZPJHxyvEkCA/vuyadtQtEms40bvy4GSY36YJ/zog4urK/+KUXrc/lA
	 g0TrTNHzEW8YfXle2YYgDvHFfrdN6RlwZugc8laWQC7EHp9OrY7fsu9COx0Q/Yo27izOl
	 0/GErVPtnUyyfwBNnAt6nuEdFwovtMF/pSCz5JV9HPOCPa+EfGLnuAzB9Y1eGRt5M9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CZtfBRFk/hrmusptrWoxR6s57HP//E/GEl6q7gFx/gE=;
	b=yX2DVBoQyo/4ROCGv75eRiiwm+pKtD1VL2BmB9yUNgqKvasm1QVgWfXjfI+gq7ZH+vZi
	 zfWyonF5fVYmsaQzcVW0H4EksxSC7ydJfWVCPWsH7wdSZT7Rw6NjT13FeiYKuUMA0Irsf
	 RMwDgjUcu4NGlXAPPUuO9juW6djhzoqQVtP+idaD73kXU+1xKgBN7z+aaH3yz52OM+iAI
	 Q9XJ93FE+9m1IA9v3ackiKKQ+ApJEu1qJP+ocq7MfI04BojZDONYKfr/iCdm8q1fuGnxj
	 x+H5DxZOx5469i1Plg7aB6X7PtMuI/aX2oCPWf+Lituya329YUQq3sg3A/uMfzFszEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIsSS7gr;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E04B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIsSS7gr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso11455515e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793866327; x=1794471127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZtfBRFk/hrmusptrWoxR6s57HP//E/GEl6q7gFx/gE=;
        b=EIsSS7gryLadCEBIeV8afkgWKEplc72Sp0xowLTW5ATS2jIC75k1inn3/Ut7n8plm3
         q0+OyRj6Wae1/MP26/E7Qr0EchiVR+b2yziwtnEZNDvR/yxq6eyeRCbuA8TOeIZsB/s3
         rVI9sfSX/Zh69T6AGGCWO7tp8VWLsfglsYLQd0V+Irp/Ej21HAsFFOWqwrqVjPNaJHBM
         wtw4dhxzaPaFYSrZUs5+FL7Oapn0oMyWJ3W6bHk1nVs878a069lXhnfWsnZqkibGPuWI
         0ypdyJ2KPpD2E9r82CZCiVN7IS10lCmoMiHAh8LKI4kNhIrOIaGikXTgqQ5XTxri+PCD
         OlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866327; x=1794471127;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZtfBRFk/hrmusptrWoxR6s57HP//E/GEl6q7gFx/gE=;
        b=f35fIHK79XiFqmYv0ugSyYBRmCNCQTFx6dedg7J+HEeSJvHJ1Kd9JqwkOkewovgDoo
         YoulKEEljRvvU4n/v8I4r0WxsfmEr8UVuaPGVb/dMNprK8PkKKlpLLuYII0fQe/iyh5V
         eOabbHc42WWzQBMawJiMvVQakJl/lciLYDNx0Troo9P+mUb7IxCTrD4e0J29L60qBDHz
         RBdCMM0zX8lvsJirxJVKlPmrqX/1yTAfcaUvrk3STkiu0jC77GV0U8YzuFYlXqQcz8Dq
         NBfr3MlRAlT4yA+NbVZKpxph2J+90VkVT2PIsUb8qqVQTn3Kz4PrcXxjqkIhU9cfNPbx
         ftlA==
X-Forwarded-Encrypted: i=1; AKwUvBwYKTD3wAQentCNsc6bcsggPt3t+ioJb9Oztb+1nEDEDuGE6brfycE80mT78rR4LBSa9Z00NESPR4Ejduk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VI/C/AYt72ivchw3/HMFXygaMeMbZ74c3bWrxc+SajF5CRKdA
	v+1UXEh8Z9EuiTbyXaBwpdfdtGVyV65U2prwSRnq+03+Spc4X1+CdW8y
X-Gm-Gg: AYBFou34V5KymLDQL3e4oAh9x0a5mnYc8v76tx6/ArMz2+tp9eu05aUYMjCHxDYz0W/
	NqUsVkDhKSsgBUMksL08lj2rbMHcA3AXLpHJOyj/eOi/vYrh2DR+eD3FzrFfxdI+zw/IDU23XgV
	ytX9AzR86Srzd8i3a+W1xe6GJycDXHJCF46/08ftj3ygxbn0I88FxE5C9wPD94OzoBUDsM9DyRj
	fTKpn1GfCa+9oAVySnkjEIrnagdCbzRZK4o1fsF/fccQG9UlHmD2Km7hA8juqfkLPKWs3OrjT2h
	x6b3XfkBkzj+LtXvzd3KkMJPJ5OLgi4fwH6p+aA6aIZK7vJxUw9iW5unZSxKPWikFUPFtIQiu1R
	3yMph/2A3AtgTZCBCsWN7DeejI5Pv+bdxMx0F+mEcUmh7ApFkoYEEkYFtda2oY7iwat+Xf0Jv0m
	QF0ewOkKdCsSKTXUhdMxL5k3Jm4ma4eZ9f/nTX4RdagwFjFIdSfyPluFHyxpzTQEtU5RXSPm9SB
	NObLRTOsfRSMz31YKIPsuUzLXnHA+X452chh7FLzRlIJA3AdJFBwpuyqE+QORYVsHnb1tV6agWD
	k3RC0CTBrVXOr0ZPtEn99TuQg7xjcXBy5/BDU167aCJW8QOWvZKjUuvX1+Iu+jx3
X-Received: by 2002:a05:600c:3484:b0:4b3:6900:280c with SMTP id 5b1f17b1804b1-4b36def42b9mr132098235e9.19.1793866327155;
        Thu, 05 Nov 2026 00:12:07 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b573366ea6sm47667915e9.14.2026.11.05.00.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:12:06 -0800 (PST)
Date: Thu, 5 Nov 2026 08:12:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, dsterba@suse.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
 torvalds@linux-foundation.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <20261105081205.5a84e4cb@pumpkin>
In-Reply-To: <20261104222806.1826508-1-usama.arif@linux.dev>
References: <20261104222806.1826508-1-usama.arif@linux.dev>
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

On Wed,  4 Nov 2026 14:28:06 -0800
Usama Arif <usama.arif@linux.dev> wrote:

> Since commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
> memory copies"), memcpy() uses REP MOVSB only on FSRM CPUs, so ERMS CPUs
> without FSRM, such as Skylake through Cooper Lake, copy every size with
> the scalar loop. Large copies matter there: in Meta's x86 fleet, about a
> third of the time in memcpy_orig() is btrfs zstd decompression copying
> pages into and out of zstd's buffers.
> 
> Use REP MOVSB from 2048 bytes on ERMS CPUs. On a 1.4 GHz Cooper Lake, an
> aligned, cache-hot 4 KiB memcpy() then takes 66.8% less time (123.4 ns
> instead of 371.7 ns), and btrfs zstd reads take 4% less time. Smaller
> copies keep the scalar loop: using REP MOVSB from 32 bytes made
> 32/64/128/256-byte copies 114.9%/54.4%/66.1%/23.2% slower.
> 
> To keep the dispatch cheap, fold memcpy_orig() into __memcpy(). With
> FSRM, "rep movsb; RET" replaces the 32-byte length check. With ERMS, a
> shift of the length in RDX selects REP MOVSB; RCX already holds the
> count. Copies below 32 bytes skip the check, which is a single NOP
> without ERMS.
> 
> The FSRM replacement now contains a RET. apply_returns() runs before
> apply_alternatives(), so with the ITS return thunk it decides whether to
> keep the thunk from the RET's address in .altinstr_replacement. Align the
> replacement to a cache line so that the RET keeps it; the thunk is safe
> wherever the replacement is copied.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
> v1 -> v2: https://lore.kernel.org/r/20261013100442.2658311-1-usama.arif@linux.dev
> - Raise the threshold from 512 to 2048 bytes. REP MOVSB was slower than
>   the scalar loop for some misaligned copies of 512 to 640 bytes.

Which cpu type was that?
Do I remember the older zen cpu falling back to byte copies?
I wonder if it is possibly to do a run-time patch of the constant.
In all the tests I've done on Intel cpu (going back to sandy bridge)
the only alignment that made any difference was 64 byte (32 on older cpu)
alignment of the destination buffer.

That could be 'for further study'.

There are some very bad alignment pairs on some cpu.
On zen5 if (IIRC) (src - dest) % PAGE_SIZE is between 1 and 127 then
the both setup and per-byte cost of REP MOSVB are significantly higher
(the byte alignment makes minimal difference throughout).
I don't remember finding anything similar on the Intel cpu I tested.
But it is probably not worth checking for them because the cost of the
comparison will be larger overall.

David

> - Fold memcpy_orig() into __memcpy(). With FSRM, "rep movsb; RET" now
>   replaces the 32-byte length check (David Laight, Linus Torvalds). In
>   v1, the 13-byte empty FSRM replacement became a jump that FSRM CPUs
>   took on every call (Kiryl Shutsemau).
> - Do the ERMS check after the 32-byte check, so copies below 32 bytes
>   skip it (Kiryl Shutsemau), and keep the count in RCX so REP MOVSB
>   needs no reload (David Laight).
> - Align the FSRM replacement so that its RET keeps the ITS return thunk.
> - Fix the comment that called the return value the source input.
> ---
>  arch/x86/lib/memcpy_64.S | 101 ++++++++++++++++++++++-----------------
>  1 file changed, 57 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> index 12a23fa7c44c5..dc71b7d1bfd58 100644
> --- a/arch/x86/lib/memcpy_64.S
> +++ b/arch/x86/lib/memcpy_64.S
> @@ -27,28 +27,33 @@
>   *
>   * The 'rep movsb' itself is small enough to replace the call, but the
>   * two register moves blow up the code. And one of them is "needed"
> - * only for the return value that is the same as the source input,
> + * only for the return value that is the same as the destination input,
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
>  
> -SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
> -SYM_PIC_ALIAS(memcpy)
> -EXPORT_SYMBOL(memcpy)
> -
> -SYM_FUNC_START_LOCAL(memcpy_orig)
> -	movq %rdi, %rax
> +#ifdef CONFIG_MITIGATION_ITS
> +	/*
> +	 * Returns are patched before alternatives. Align the replacement
> +	 * source so its return is in the first half of a cache line and ITS
> +	 * retains its thunk. The copied return can then execute in either
> +	 * half of a cache line.
> +	 */
> +	.pushsection .altinstr_replacement, "ax"
> +	.balign 64
> +	.popsection
> +#endif
> +	ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> +		    __stringify(rep movsb; RET), X86_FEATURE_FSRM
>  
> -	cmpq $0x20, %rdx
> -	jb .Lhandle_tail
> +	/*
> +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> +	 * The 10-byte alternative fits a NOP without ERMS.
> +	 */
> +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS
>  
>  	/*
>  	 * We check whether memory false dependence could occur,
> @@ -56,9 +61,9 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>  	 */
>  	cmp  %dil, %sil
>  	jl .Lcopy_backward
> -	subq $0x20, %rdx
> +	subq $0x20, %rcx
>  .Lcopy_forward_loop:
> -	subq $0x20,	%rdx
> +	subq $0x20,	%rcx
>  
>  	/*
>  	 * Move in blocks of 4x8 bytes:
> @@ -75,23 +80,23 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>  	movq %r11,	3*8(%rdi)
>  	leaq 4*8(%rdi),	%rdi
>  	jae  .Lcopy_forward_loop
> -	addl $0x20,	%edx
> +	addl $0x20,	%ecx
>  	jmp  .Lhandle_tail
>  
>  .Lcopy_backward:
>  	/*
>  	 * Calculate copy position to tail.
>  	 */
> -	addq %rdx,	%rsi
> -	addq %rdx,	%rdi
> -	subq $0x20,	%rdx
> +	addq %rcx,	%rsi
> +	addq %rcx,	%rdi
> +	subq $0x20,	%rcx
>  	/*
>  	 * At most 3 ALU operations in one cycle,
>  	 * so append NOPS in the same 16 bytes trunk.
>  	 */
>  	.p2align 4
>  .Lcopy_backward_loop:
> -	subq $0x20,	%rdx
> +	subq $0x20,	%rcx
>  	movq -1*8(%rsi),	%r8
>  	movq -2*8(%rsi),	%r9
>  	movq -3*8(%rsi),	%r10
> @@ -107,11 +112,11 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>  	/*
>  	 * Calculate copy position to head.
>  	 */
> -	addl $0x20,	%edx
> -	subq %rdx,	%rsi
> -	subq %rdx,	%rdi
> +	addl $0x20,	%ecx
> +	subq %rcx,	%rsi
> +	subq %rcx,	%rdi
>  .Lhandle_tail:
> -	cmpl $16,	%edx
> +	cmpl $16,	%ecx
>  	jb   .Lless_16bytes
>  
>  	/*
> @@ -119,55 +124,63 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>  	 */
>  	movq 0*8(%rsi), %r8
>  	movq 1*8(%rsi),	%r9
> -	movq -2*8(%rsi, %rdx),	%r10
> -	movq -1*8(%rsi, %rdx),	%r11
> +	movq -2*8(%rsi, %rcx),	%r10
> +	movq -1*8(%rsi, %rcx),	%r11
>  	movq %r8,	0*8(%rdi)
>  	movq %r9,	1*8(%rdi)
> -	movq %r10,	-2*8(%rdi, %rdx)
> -	movq %r11,	-1*8(%rdi, %rdx)
> +	movq %r10,	-2*8(%rdi, %rcx)
> +	movq %r11,	-1*8(%rdi, %rcx)
>  	RET
>  	.p2align 4
>  .Lless_16bytes:
> -	cmpl $8,	%edx
> +	cmpl $8,	%ecx
>  	jb   .Lless_8bytes
>  	/*
>  	 * Move data from 8 bytes to 15 bytes.
>  	 */
>  	movq 0*8(%rsi),	%r8
> -	movq -1*8(%rsi, %rdx),	%r9
> +	movq -1*8(%rsi, %rcx),	%r9
>  	movq %r8,	0*8(%rdi)
> -	movq %r9,	-1*8(%rdi, %rdx)
> +	movq %r9,	-1*8(%rdi, %rcx)
>  	RET
>  	.p2align 4
>  .Lless_8bytes:
> -	cmpl $4,	%edx
> +	cmpl $4,	%ecx
>  	jb   .Lless_3bytes
>  
>  	/*
>  	 * Move data from 4 bytes to 7 bytes.
>  	 */
> -	movl (%rsi), %ecx
> -	movl -4(%rsi, %rdx), %r8d
> -	movl %ecx, (%rdi)
> -	movl %r8d, -4(%rdi, %rdx)
> +	movl (%rsi), %edx
> +	movl -4(%rsi, %rcx), %r8d
> +	movl %edx, (%rdi)
> +	movl %r8d, -4(%rdi, %rcx)
>  	RET
>  	.p2align 4
>  .Lless_3bytes:
> -	subl $1, %edx
> +	subl $1, %ecx
>  	jb .Lend
>  	/*
>  	 * Move data from 1 bytes to 3 bytes.
>  	 */
> -	movzbl (%rsi), %ecx
> +	movzbl (%rsi), %edx
>  	jz .Lstore_1byte
>  	movzbq 1(%rsi), %r8
> -	movzbq (%rsi, %rdx), %r9
> +	movzbq (%rsi, %rcx), %r9
>  	movb %r8b, 1(%rdi)
> -	movb %r9b, (%rdi, %rdx)
> +	movb %r9b, (%rdi, %rcx)
>  .Lstore_1byte:
> -	movb %cl, (%rdi)
> +	movb %dl, (%rdi)
>  
>  .Lend:
>  	RET
> -SYM_FUNC_END(memcpy_orig)
>  
> +.Lerms:
> +	rep movsb
> +	RET
> +SYM_FUNC_END(__memcpy)
> +EXPORT_SYMBOL(__memcpy)
> +
> +SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
> +SYM_PIC_ALIAS(memcpy)
> +EXPORT_SYMBOL(memcpy)

