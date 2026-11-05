Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899730;
	b=GlwsUFyShHJuWXKLfdw3WlRoUCzMUZEKb8x8oFeyul7H5NXex1NoXlFSFQ5vngcEA3J4
	 7YrMtoPY+u90SiJsS//1+Xr1iq5Pz1SvyjHCPvaYBR1y2fefVZIf2nOe4mODKlpRNvKwD
	 kPKypvlhTg0Uuggo/FaoXr97ct2rZYLy+gquCsfji/1Yqt2eNlCuO2Qs6i5kd7JG5N97o
	 mDiIK9yUXc9V1/ScMFMmp/lABmn3pgWns3+dGbRTro2PkwNsY4/+CmLDfNe98oB+ydYg6
	 vU76XPv6UfMN9DPgSZIGeaCgcKdbF3Lr3TyKgj+WiiUks9RpMFS+6Yuw5ZoTSWWWevg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899730;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hj9tH0eL1+DEDCQDifLnB7RdlGpysEuUv6+m2uiwBO4=;
	b=Qnlc2Dy5VtBfutOnWP3qTV45Cn6+KDfQ+RIpBvkkR0q92ftFSVuikJ7yyPGTcBBbs+jB
	 NrIYZTwVcrjbrpmDe0ffeaxuSpl3wzzSqbw4E/nC3MfpWihz29c6EBBjGwQcrjzvgmPUP
	 UnqR6aPdSrwQfhQprFR6PwAxQ5hBP7CXRZG3GSzn6BNhM/t+O3Zcj2e4h0x6eCH11x8Nd
	 Jxap5QPre7Wep4lhB7P01rC5ZQkfw8JCERH8QIb40Uu20Allom5mdetzMUrdepamwE8jv
	 rs4yWp5S/AxAO12hgfX6blSW9y6fQBf6rVrb61ZSThXtEq5xFCoU/1v7y2Rg7FXaIhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gVvdrzcI;
	arc=none smtp.remote-ip=95.215.58.74
Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BEF606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31BEF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gVvdrzcI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kMkbzyr+XfIq7fCH0p3nJBoTzaB10OWbZHRIVm6/Qes=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793899726; v=1; x=1794504526;
 b=gVvdrzcIa3LWWxP8W/Ht9qPub+i1vs2lZsGOY08nZVdCpYExADrE0BN/9Z0URkfR3kAkszL5
 k+qxgE/sdQb2jGKJtFZ7T37npsw9B4MW0rOkdOVemwxsLfcrPk3fg7t12FbU/O7mdOa8GyKO426
 uYW22aH8zubZN73KhhzY6oQg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8bcaed4620e5aed3;
	Thu, 05 Nov 2026 17:28:45 +0000
X-Mizu-Trace-ID: 8bcaed4620e5aed3
X-Migadu-Flow: FLOW_OUT
Message-ID: <39da378e-eac3-49cf-9ac4-7bd02d70eb37@linux.dev>
Date: Thu, 5 Nov 2026 17:28:45 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
To: David Laight <david.laight.linux@gmail.com>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, dsterba@suse.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
 torvalds@linux-foundation.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
References: <20261104222806.1826508-1-usama.arif@linux.dev>
 <20261105081205.5a84e4cb@pumpkin>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261105081205.5a84e4cb@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/11/2026 08:12, David Laight wrote:
> On Wed,  4 Nov 2026 14:28:06 -0800
> Usama Arif <usama.arif@linux.dev> wrote:
> 
>> Since commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
>> memory copies"), memcpy() uses REP MOVSB only on FSRM CPUs, so ERMS CPUs
>> without FSRM, such as Skylake through Cooper Lake, copy every size with
>> the scalar loop. Large copies matter there: in Meta's x86 fleet, about a
>> third of the time in memcpy_orig() is btrfs zstd decompression copying
>> pages into and out of zstd's buffers.
>>
>> Use REP MOVSB from 2048 bytes on ERMS CPUs. On a 1.4 GHz Cooper Lake, an
>> aligned, cache-hot 4 KiB memcpy() then takes 66.8% less time (123.4 ns
>> instead of 371.7 ns), and btrfs zstd reads take 4% less time. Smaller
>> copies keep the scalar loop: using REP MOVSB from 32 bytes made
>> 32/64/128/256-byte copies 114.9%/54.4%/66.1%/23.2% slower.
>>
>> To keep the dispatch cheap, fold memcpy_orig() into __memcpy(). With
>> FSRM, "rep movsb; RET" replaces the 32-byte length check. With ERMS, a
>> shift of the length in RDX selects REP MOVSB; RCX already holds the
>> count. Copies below 32 bytes skip the check, which is a single NOP
>> without ERMS.
>>
>> The FSRM replacement now contains a RET. apply_returns() runs before
>> apply_alternatives(), so with the ITS return thunk it decides whether to
>> keep the thunk from the RET's address in .altinstr_replacement. Align the
>> replacement to a cache line so that the RET keeps it; the thunk is safe
>> wherever the replacement is copied.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>> v1 -> v2: https://lore.kernel.org/r/20261013100442.2658311-1-usama.arif@linux.dev
>> - Raise the threshold from 512 to 2048 bytes. REP MOVSB was slower than
>>   the scalar loop for some misaligned copies of 512 to 640 bytes.
> 
> Which cpu type was that?

Cooper Lake (Xeon Platinum 8321HC).

> Do I remember the older zen cpu falling back to byte copies?

I just checked, and Zen 1 and Zen 2 have neither ERMS nor FSRM, so
they keep the scalar loop. Zen 3 onwards has both, and FSRM already
uses REP MOVSB for every size.

> I wonder if it is possibly to do a run-time patch of the constant.

It might be possible. But I wanted to keep the patch usecase driven.
The current usecase is coming from zstd/btrfs. If we find a usecase
where it might be faster for smaller copies, it might become worth
looking into then?

> In all the tests I've done on Intel cpu (going back to sandy bridge)
> the only alignment that made any difference was 64 byte (32 on older cpu)
> alignment of the destination buffer.
> 

Also I should have been clearer in the changelog, by "misaligned copies of
512 to 640 bytes", I had tested a 513-byte copy with the source at page offset
1 and destination at 63, it took on average 62 ns with REP MOVSB versus
49 ns with scalar. I had done a couple of other tests at 640 bytes as well.

> That could be 'for further study'.
> 
> There are some very bad alignment pairs on some cpu.
> On zen5 if (IIRC) (src - dest) % PAGE_SIZE is between 1 and 127 then
> the both setup and per-byte cost of REP MOSVB are significantly higher
> (the byte alignment makes minimal difference throughout).

I am seeing similar on Cooper Lake.

> I don't remember finding anything similar on the Intel cpu I tested.
> But it is probably not worth checking for them because the cost of the
> comparison will be larger overall.
> 

Yes, I agree.

Do you think this version of the patch seems acceptable?

I feel like we should only investigate for lower size if we can find a
usecase.

> David
> 
>> - Fold memcpy_orig() into __memcpy(). With FSRM, "rep movsb; RET" now
>>   replaces the 32-byte length check (David Laight, Linus Torvalds). In
>>   v1, the 13-byte empty FSRM replacement became a jump that FSRM CPUs
>>   took on every call (Kiryl Shutsemau).
>> - Do the ERMS check after the 32-byte check, so copies below 32 bytes
>>   skip it (Kiryl Shutsemau), and keep the count in RCX so REP MOVSB
>>   needs no reload (David Laight).
>> - Align the FSRM replacement so that its RET keeps the ITS return thunk.
>> - Fix the comment that called the return value the source input.
>> ---
>>  arch/x86/lib/memcpy_64.S | 101 ++++++++++++++++++++++-----------------
>>  1 file changed, 57 insertions(+), 44 deletions(-)
>>
>> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
>> index 12a23fa7c44c5..dc71b7d1bfd58 100644
>> --- a/arch/x86/lib/memcpy_64.S
>> +++ b/arch/x86/lib/memcpy_64.S
>> @@ -27,28 +27,33 @@
>>   *
>>   * The 'rep movsb' itself is small enough to replace the call, but the
>>   * two register moves blow up the code. And one of them is "needed"
>> - * only for the return value that is the same as the source input,
>> + * only for the return value that is the same as the destination input,
>>   * which the compiler could/should do much better anyway.
>>   */
>>  SYM_TYPED_FUNC_START(__memcpy)
>> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
>> -
>>  	movq %rdi, %rax
>>  	movq %rdx, %rcx
>> -	rep movsb
>> -	RET
>> -SYM_FUNC_END(__memcpy)
>> -EXPORT_SYMBOL(__memcpy)
>>  
>> -SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
>> -SYM_PIC_ALIAS(memcpy)
>> -EXPORT_SYMBOL(memcpy)
>> -
>> -SYM_FUNC_START_LOCAL(memcpy_orig)
>> -	movq %rdi, %rax
>> +#ifdef CONFIG_MITIGATION_ITS
>> +	/*
>> +	 * Returns are patched before alternatives. Align the replacement
>> +	 * source so its return is in the first half of a cache line and ITS
>> +	 * retains its thunk. The copied return can then execute in either
>> +	 * half of a cache line.
>> +	 */
>> +	.pushsection .altinstr_replacement, "ax"
>> +	.balign 64
>> +	.popsection
>> +#endif
>> +	ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
>> +		    __stringify(rep movsb; RET), X86_FEATURE_FSRM
>>  
>> -	cmpq $0x20, %rdx
>> -	jb .Lhandle_tail
>> +	/*
>> +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
>> +	 * Shift RDX to check length >= 2048 without destroying the REP count.
>> +	 * The 10-byte alternative fits a NOP without ERMS.
>> +	 */
>> +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS
>>  
>>  	/*
>>  	 * We check whether memory false dependence could occur,
>> @@ -56,9 +61,9 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>>  	 */
>>  	cmp  %dil, %sil
>>  	jl .Lcopy_backward
>> -	subq $0x20, %rdx
>> +	subq $0x20, %rcx
>>  .Lcopy_forward_loop:
>> -	subq $0x20,	%rdx
>> +	subq $0x20,	%rcx
>>  
>>  	/*
>>  	 * Move in blocks of 4x8 bytes:
>> @@ -75,23 +80,23 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>>  	movq %r11,	3*8(%rdi)
>>  	leaq 4*8(%rdi),	%rdi
>>  	jae  .Lcopy_forward_loop
>> -	addl $0x20,	%edx
>> +	addl $0x20,	%ecx
>>  	jmp  .Lhandle_tail
>>  
>>  .Lcopy_backward:
>>  	/*
>>  	 * Calculate copy position to tail.
>>  	 */
>> -	addq %rdx,	%rsi
>> -	addq %rdx,	%rdi
>> -	subq $0x20,	%rdx
>> +	addq %rcx,	%rsi
>> +	addq %rcx,	%rdi
>> +	subq $0x20,	%rcx
>>  	/*
>>  	 * At most 3 ALU operations in one cycle,
>>  	 * so append NOPS in the same 16 bytes trunk.
>>  	 */
>>  	.p2align 4
>>  .Lcopy_backward_loop:
>> -	subq $0x20,	%rdx
>> +	subq $0x20,	%rcx
>>  	movq -1*8(%rsi),	%r8
>>  	movq -2*8(%rsi),	%r9
>>  	movq -3*8(%rsi),	%r10
>> @@ -107,11 +112,11 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>>  	/*
>>  	 * Calculate copy position to head.
>>  	 */
>> -	addl $0x20,	%edx
>> -	subq %rdx,	%rsi
>> -	subq %rdx,	%rdi
>> +	addl $0x20,	%ecx
>> +	subq %rcx,	%rsi
>> +	subq %rcx,	%rdi
>>  .Lhandle_tail:
>> -	cmpl $16,	%edx
>> +	cmpl $16,	%ecx
>>  	jb   .Lless_16bytes
>>  
>>  	/*
>> @@ -119,55 +124,63 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>>  	 */
>>  	movq 0*8(%rsi), %r8
>>  	movq 1*8(%rsi),	%r9
>> -	movq -2*8(%rsi, %rdx),	%r10
>> -	movq -1*8(%rsi, %rdx),	%r11
>> +	movq -2*8(%rsi, %rcx),	%r10
>> +	movq -1*8(%rsi, %rcx),	%r11
>>  	movq %r8,	0*8(%rdi)
>>  	movq %r9,	1*8(%rdi)
>> -	movq %r10,	-2*8(%rdi, %rdx)
>> -	movq %r11,	-1*8(%rdi, %rdx)
>> +	movq %r10,	-2*8(%rdi, %rcx)
>> +	movq %r11,	-1*8(%rdi, %rcx)
>>  	RET
>>  	.p2align 4
>>  .Lless_16bytes:
>> -	cmpl $8,	%edx
>> +	cmpl $8,	%ecx
>>  	jb   .Lless_8bytes
>>  	/*
>>  	 * Move data from 8 bytes to 15 bytes.
>>  	 */
>>  	movq 0*8(%rsi),	%r8
>> -	movq -1*8(%rsi, %rdx),	%r9
>> +	movq -1*8(%rsi, %rcx),	%r9
>>  	movq %r8,	0*8(%rdi)
>> -	movq %r9,	-1*8(%rdi, %rdx)
>> +	movq %r9,	-1*8(%rdi, %rcx)
>>  	RET
>>  	.p2align 4
>>  .Lless_8bytes:
>> -	cmpl $4,	%edx
>> +	cmpl $4,	%ecx
>>  	jb   .Lless_3bytes
>>  
>>  	/*
>>  	 * Move data from 4 bytes to 7 bytes.
>>  	 */
>> -	movl (%rsi), %ecx
>> -	movl -4(%rsi, %rdx), %r8d
>> -	movl %ecx, (%rdi)
>> -	movl %r8d, -4(%rdi, %rdx)
>> +	movl (%rsi), %edx
>> +	movl -4(%rsi, %rcx), %r8d
>> +	movl %edx, (%rdi)
>> +	movl %r8d, -4(%rdi, %rcx)
>>  	RET
>>  	.p2align 4
>>  .Lless_3bytes:
>> -	subl $1, %edx
>> +	subl $1, %ecx
>>  	jb .Lend
>>  	/*
>>  	 * Move data from 1 bytes to 3 bytes.
>>  	 */
>> -	movzbl (%rsi), %ecx
>> +	movzbl (%rsi), %edx
>>  	jz .Lstore_1byte
>>  	movzbq 1(%rsi), %r8
>> -	movzbq (%rsi, %rdx), %r9
>> +	movzbq (%rsi, %rcx), %r9
>>  	movb %r8b, 1(%rdi)
>> -	movb %r9b, (%rdi, %rdx)
>> +	movb %r9b, (%rdi, %rcx)
>>  .Lstore_1byte:
>> -	movb %cl, (%rdi)
>> +	movb %dl, (%rdi)
>>  
>>  .Lend:
>>  	RET
>> -SYM_FUNC_END(memcpy_orig)
>>  
>> +.Lerms:
>> +	rep movsb
>> +	RET
>> +SYM_FUNC_END(__memcpy)
>> +EXPORT_SYMBOL(__memcpy)
>> +
>> +SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
>> +SYM_PIC_ALIAS(memcpy)
>> +EXPORT_SYMBOL(memcpy)
> 

