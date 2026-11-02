Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660623;
	b=JnzuPcrL7oqAlyWIgbCLZDwpc0EnXYW6OhyMfsl2Na3tx5/rPr7ZGej7EZlPCZKrT+2V
	 ILdd8+8AgLHiIbMG3gYEtya6pyiFTY44/p+hByyI1G7z8eOeeoC43j9wPbg7sHJsf+CCD
	 +fvJvOOCEGIcA4ayIEHmC6Vkqf9oLrXWOqgy6J7RbwZmpATXil4VDpI1MBbtImnyeU0Tx
	 5pqDpdqkHABHywByD4uD1TNs2EkLVaW73ljmmQrJnZmLfVoNvHU3357/v/DnfL/H6VAfw
	 +qiVkbfYHF3bA7+1XRVQ2QVbg5IFpowC3pgLOMhCeIPptodAHNDiNR5qSElMdjvouDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660623;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4sXRGv1ClJCJ3GCQZIEJdI8S2MJYNLJVt+NueJCDB70=;
	b=WZ4yaBpBB0rUbb/S+XXvVKw9EFqtvrA2bALVL7hPDLCZ25Csyo9WTQgfVX7UBxAw9hCL
	 T2tnGMt6VVbzzdtKj8WDNfm13Pz4Caqzymx4ojnVQD3maeyR2Sqoycilax3rqvCFLjwkR
	 VLHHobATqrjn7YkEsWE5BcEuNiQPWJO+6jdYGk1t/1VRHvCwY16iWvoym/q2smx43q0pe
	 3IBZ3l8VzS+aGayLhs7CyDW2W8dM8vKypXqrWpVInjNYAzRXv7mnUdaNTNTJ3wMhqsSwe
	 G6HTScwlpZsgMIVx9hpaKrAMB3XCzL03eT1wI5vFOaNSPhz8OnGtEZUrGnqvSIqSe5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wKp7Jttk;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D9606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 258D9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wKp7Jttk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o7isaSsrX6hQEAAgjJK78G42jQx8ZV/pB4yuDrzWiIQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793660620; v=1; x=1794265420;
 b=wKp7JttkQtzp6+A89wWXUBOL0YZ3gdrsR/9oo8jBm087ogqdCcacKcOHup2OU/NsckT9ToLD
 A5d3Bzw6cdFeFHQ7nfQUExdrHXQpbLGIKy3XwLxhniBBHqwJgm9HKugwVYRPF5xH+KYW8IUpBC+
 DAQRgYcByejySzqmzmxJeTNk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e6834a2a1c425d22;
	Mon, 02 Nov 2026 23:03:39 +0000
X-Mizu-Trace-ID: e6834a2a1c425d22
X-Migadu-Flow: FLOW_OUT
Message-ID: <5f6fa235-55bc-45c6-90a8-20f75152e9f2@linux.dev>
Date: Mon, 2 Nov 2026 23:03:39 +0000
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
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
To: David Laight <david.laight.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Kiryl Shutsemau <kas@kernel.org>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, dsterba@suse.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 terrelln@fb.com, tglx@kernel.org, x86@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
References: <atCpTMcAALymqADw@thinkstation>
 <20261017192727.2760919-1-usama.arif@linux.dev>
 <atiKeB-76nOj-ztU@thinkstation>
 <CAHk-=wh+dyDPs2kp=KoUiCYdk2MBBqzTKYbrkAyOMV9Z1XNu0w@mail.gmail.com>
 <20261022094958.13aeb5c0@pumpkin>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261022094958.13aeb5c0@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22/10/2026 10:49, David Laight wrote:
> On Wed, 21 Oct 2026 08:18:25 -1000
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
>> On Tue, 20 Oct 2026 at 23:55, Kiryl Shutsemau <kas@kernel.org> wrote:
>>>
>>> Moving MOVQ inside ALTERNATIVE_2 is ugly...  
>>
>> Yeah, maybe it would make sense to make that function be
>>
>>         movq %rdi, %rax
>>         movq %rdx, %rcx
>>         ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
>>         RET
>>
>> instead? No nop instructions at all, and both alternatives are two bytes.
>>
>> Then do any ERMS logic at the top of memcpy_orig, which now has the
>> registers ready for string instructions anyway.
> 
> Is it possibly to just patch "rep movsb; RET" over whatever gets generated
> for memcpy_orig (after the two register moves) ?
> Then there are neither nops nor a jmp.
> 
> David
> 
Hi,

Sorry for the late reply. I had taken time off for the past couple of weeks
and didnt have access to my work station.

I implemented Davids suggestion and I think it looks good. The scalar body is
now part of __memcpy(), and FSRM replaces the existing 32-byte check with
"rep movsb; RET". Non-FSRM calls fall straight into scalar code, and FSRM
returns before any padding.

I have retained the 2048-byte ERMS cutoff, since selecting REP from 32 bytes
regressed short copies in the Cooper Lake tests.

I asked LLM to review it and it indicated a problem with ITS: returns are
patched before alternatives are copied, so the return decision uses the
replacement's source address. I align replacement storage outside the
copied range so ITS retains the return thunk and relocation preserves its
target. This adds no executed padding.

Any thoughts on below? I will send it as a proper patch for review
if it looks acceptable.


From 9baffefb71c7223702c7bcd96d43b9a2828f3939 Mon Sep 17 00:00:00 2001
From: Usama Arif <usama.arif@linux.dev>
Date: Thu, 1 Oct 2026 14:15:12 -0700
Subject: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM

Commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
memory copies") left ERMS CPUs without FSRM, including Cooper Lake and
Skylake, using scalar code for all out-of-line copies. Btrfs/zstd input
staging and output flushing accounted for about 34% of memcpy_orig()'s
sampled weight in Meta's x86 fleet profile.

Use REP MOVSB from 2048 bytes on ERMS CPUs without FSRM, keeping scalar
copies below that threshold. FSRM continues to use REP for all sizes.

Merge scalar code into __memcpy() and overlay its existing 32-byte check
with REP MOVSB and RET on FSRM, removing the non-FSRM entry jump. Copies
below 32 bytes bypass the ERMS gate. SHR11/JNZ fits one ten-byte NOP
without ERMS; the REP arm reloads the original count from RDX.

With ITS configured, align replacement storage before its start label so
the raw FSRM return retains its thunk before relocation. The alignment
padding is outside the copied range.

On Cooper Lake (boost disabled, capped at 1.401 GHz), plain-RET userspace
replicas with aligned warmed buffers and entry offset zero modulo 64
measured 4 KiB copies at 371.7 ns originally and 123.4 ns with this patch:
a 66.8% paired reduction across five process runs. A separate sweep using
REP from 32 bytes increased 32/64/128/256-byte times by
114.9%/54.4%/66.1%/23.2%, respectively.

Small-copy costs remain: a warmed aligned zero-byte copy at entry offset
48 modulo 64 took a paired 0.75 ns more (+7.9%) than the original, in all
five runs. These microbenchmarks do not establish a kernel workload gain
or the best threshold across CPUs.

Direct copy checks and memcpy KUnit passed with all four ERMS/FSRM
combinations and with ITS forced on; the copied return target was verified.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/x86/lib/memcpy_64.S | 42 ++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 12a23fa7c44c5..407b226d4de2f 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -31,24 +31,27 @@
  * which the compiler could/should do much better anyway.
  */
 SYM_TYPED_FUNC_START(__memcpy)
-	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
-
 	movq %rdi, %rax
 	movq %rdx, %rcx
-	rep movsb
-	RET
-SYM_FUNC_END(__memcpy)
-EXPORT_SYMBOL(__memcpy)
-
-SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
-SYM_PIC_ALIAS(memcpy)
-EXPORT_SYMBOL(memcpy)
 
-SYM_FUNC_START_LOCAL(memcpy_orig)
-	movq %rdi, %rax
+#ifdef CONFIG_MITIGATION_ITS
+	/*
+	 * Returns are patched before alternatives. Keep the replacement
+	 * return in the first half of a cache line so ITS retains its thunk
+	 * when the instruction is copied to its final address.
+	 */
+	.pushsection .altinstr_replacement, "ax"
+	.balign 64
+	.popsection
+#endif
+	ALTERNATIVE __stringify(cmpq $0x20, %rdx; jb .Lhandle_tail), \
+		    __stringify(rep movsb; RET), X86_FEATURE_FSRM
 
-	cmpq $0x20, %rdx
-	jb .Lhandle_tail
+	/*
+	 * Prepared RCX is scratch for checking length >= 2048.
+	 * The 10-byte alternative fits a NOP without ERMS.
+	 */
+	ALTERNATIVE "", __stringify(shrq $11, %rcx; jnz .Lerms), X86_FEATURE_ERMS
 
 	/*
 	 * We check whether memory false dependence could occur,
@@ -169,5 +172,14 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
 
 .Lend:
 	RET
-SYM_FUNC_END(memcpy_orig)
 
+.Lerms:
+	movq %rdx, %rcx
+	rep movsb
+	RET
+SYM_FUNC_END(__memcpy)
+EXPORT_SYMBOL(__memcpy)
+
+SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
+SYM_PIC_ALIAS(memcpy)
+EXPORT_SYMBOL(memcpy)
-- 
2.53.0-Meta




