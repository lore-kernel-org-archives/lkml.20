Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831296;
	b=1+s9NjvovbwSWDB4CJuDOdy4jKEHuHPdjbGJHE0UpFLxDYZ2HFaYN+fL43lutUS2mqzJ
	 TlHGtLU/1QAMkcn8lG+NjdsBjSqnupgt9EO4WqrDuQ1lHTj0kFFs5zmKWwMY2x9taGkBF
	 F0gktijDGCuF+wy3fYe22UELrRMgNs9pDD/xu5hQJ17/YdKnEYbMm+Xk07FS2WPW+4dpx
	 xlWOsFPMMFbViEqDHZBWE4jHLZHZWBxEqy/u2/3akS+m1pXjJ/NOC8CARMne9ROImu7JY
	 DLito+LTz1ikpDijiuRsaKo3zERZxr0uwojbex6B21iz/trtjyXBqUTwMJm3wHFIt3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831296;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4vV06JAmjJak3Y1yDoNXKTyBl+mjcYashAz2xY12kSA=;
	b=sVHilqA869ylmU+X231U9ELe8gJTIBVTL91x/SUEgqmNi0uaUj+4NfLDPBfqWDLM4XH3
	 1XcUspCKTtsUe2vqduFKpGI1Wv1WaoX4r0JFWyV8+mSbit8P9GeGLcvTgiZjE7tLgTKRo
	 2GhjA09JeuuIuyS1Na0n8uurKnoWpvmD3fNFsrTu54cnZykK1V6LrdsE7ivKcDhrgbWxf
	 FLMtWRGuwQUrdInUfPp3VJJ1+VO2qdNqfCF6AgysA7S4Azenrfs7XuSKYKLTjRuYu1ab7
	 rx2B/+dkGdx+XveCXzER2nmxsN9eHIlM3p/bXntidyGyP3mufscYuDfX2TJf1xRCo5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5647606AC25
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5647606AC25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yq/+7jmuFEF3ZlTvER97pUm256g37zJiMeimhhuC8I8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793831291; v=1; x=1794436091;
 b=VbAG3NVra0Y3Npq8Hcgalo9grWH72g+gxt6qUZKaLOG5danypCwxB4+/jpBQGJ8Y1QE85yg3
 J8++bfFl1Sh+89La+dViTynzCoVbWjp/eSbQUZ1QdwnDNJ04KIelMokM7DoS6m+IAd3/qE3nfNE
 0kvxSz1PTFqx2b/kVWHiSOIQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 47561d58ac193601;
	Wed, 04 Nov 2026 22:28:11 +0000
X-Mizu-Trace-ID: 47561d58ac193601
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: david.laight.linux@gmail.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dsterba@suse.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	terrelln@fb.com,
	tglx@kernel.org,
	usama.arif@linux.dev,
	x86@kernel.org,
	torvalds@linux-foundation.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
Date: Wed,  4 Nov 2026 14:28:06 -0800
Message-ID: <20261104222806.1826508-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
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

Since commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
memory copies"), memcpy() uses REP MOVSB only on FSRM CPUs, so ERMS CPUs
without FSRM, such as Skylake through Cooper Lake, copy every size with
the scalar loop. Large copies matter there: in Meta's x86 fleet, about a
third of the time in memcpy_orig() is btrfs zstd decompression copying
pages into and out of zstd's buffers.

Use REP MOVSB from 2048 bytes on ERMS CPUs. On a 1.4 GHz Cooper Lake, an
aligned, cache-hot 4 KiB memcpy() then takes 66.8% less time (123.4 ns
instead of 371.7 ns), and btrfs zstd reads take 4% less time. Smaller
copies keep the scalar loop: using REP MOVSB from 32 bytes made
32/64/128/256-byte copies 114.9%/54.4%/66.1%/23.2% slower.

To keep the dispatch cheap, fold memcpy_orig() into __memcpy(). With
FSRM, "rep movsb; RET" replaces the 32-byte length check. With ERMS, a
shift of the length in RDX selects REP MOVSB; RCX already holds the
count. Copies below 32 bytes skip the check, which is a single NOP
without ERMS.

The FSRM replacement now contains a RET. apply_returns() runs before
apply_alternatives(), so with the ITS return thunk it decides whether to
keep the thunk from the RET's address in .altinstr_replacement. Align the
replacement to a cache line so that the RET keeps it; the thunk is safe
wherever the replacement is copied.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
v1 -> v2: https://lore.kernel.org/r/20261013100442.2658311-1-usama.arif@linux.dev
- Raise the threshold from 512 to 2048 bytes. REP MOVSB was slower than
  the scalar loop for some misaligned copies of 512 to 640 bytes.
- Fold memcpy_orig() into __memcpy(). With FSRM, "rep movsb; RET" now
  replaces the 32-byte length check (David Laight, Linus Torvalds). In
  v1, the 13-byte empty FSRM replacement became a jump that FSRM CPUs
  took on every call (Kiryl Shutsemau).
- Do the ERMS check after the 32-byte check, so copies below 32 bytes
  skip it (Kiryl Shutsemau), and keep the count in RCX so REP MOVSB
  needs no reload (David Laight).
- Align the FSRM replacement so that its RET keeps the ITS return thunk.
- Fix the comment that called the return value the source input.
---
 arch/x86/lib/memcpy_64.S | 101 ++++++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 44 deletions(-)

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 12a23fa7c44c5..dc71b7d1bfd58 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -27,28 +27,33 @@
  *
  * The 'rep movsb' itself is small enough to replace the call, but the
  * two register moves blow up the code. And one of them is "needed"
- * only for the return value that is the same as the source input,
+ * only for the return value that is the same as the destination input,
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
 
-SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
-SYM_PIC_ALIAS(memcpy)
-EXPORT_SYMBOL(memcpy)
-
-SYM_FUNC_START_LOCAL(memcpy_orig)
-	movq %rdi, %rax
+#ifdef CONFIG_MITIGATION_ITS
+	/*
+	 * Returns are patched before alternatives. Align the replacement
+	 * source so its return is in the first half of a cache line and ITS
+	 * retains its thunk. The copied return can then execute in either
+	 * half of a cache line.
+	 */
+	.pushsection .altinstr_replacement, "ax"
+	.balign 64
+	.popsection
+#endif
+	ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
+		    __stringify(rep movsb; RET), X86_FEATURE_FSRM
 
-	cmpq $0x20, %rdx
-	jb .Lhandle_tail
+	/*
+	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
+	 * Shift RDX to check length >= 2048 without destroying the REP count.
+	 * The 10-byte alternative fits a NOP without ERMS.
+	 */
+	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS
 
 	/*
 	 * We check whether memory false dependence could occur,
@@ -56,9 +61,9 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
 	 */
 	cmp  %dil, %sil
 	jl .Lcopy_backward
-	subq $0x20, %rdx
+	subq $0x20, %rcx
 .Lcopy_forward_loop:
-	subq $0x20,	%rdx
+	subq $0x20,	%rcx
 
 	/*
 	 * Move in blocks of 4x8 bytes:
@@ -75,23 +80,23 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
 	movq %r11,	3*8(%rdi)
 	leaq 4*8(%rdi),	%rdi
 	jae  .Lcopy_forward_loop
-	addl $0x20,	%edx
+	addl $0x20,	%ecx
 	jmp  .Lhandle_tail
 
 .Lcopy_backward:
 	/*
 	 * Calculate copy position to tail.
 	 */
-	addq %rdx,	%rsi
-	addq %rdx,	%rdi
-	subq $0x20,	%rdx
+	addq %rcx,	%rsi
+	addq %rcx,	%rdi
+	subq $0x20,	%rcx
 	/*
 	 * At most 3 ALU operations in one cycle,
 	 * so append NOPS in the same 16 bytes trunk.
 	 */
 	.p2align 4
 .Lcopy_backward_loop:
-	subq $0x20,	%rdx
+	subq $0x20,	%rcx
 	movq -1*8(%rsi),	%r8
 	movq -2*8(%rsi),	%r9
 	movq -3*8(%rsi),	%r10
@@ -107,11 +112,11 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
 	/*
 	 * Calculate copy position to head.
 	 */
-	addl $0x20,	%edx
-	subq %rdx,	%rsi
-	subq %rdx,	%rdi
+	addl $0x20,	%ecx
+	subq %rcx,	%rsi
+	subq %rcx,	%rdi
 .Lhandle_tail:
-	cmpl $16,	%edx
+	cmpl $16,	%ecx
 	jb   .Lless_16bytes
 
 	/*
@@ -119,55 +124,63 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
 	 */
 	movq 0*8(%rsi), %r8
 	movq 1*8(%rsi),	%r9
-	movq -2*8(%rsi, %rdx),	%r10
-	movq -1*8(%rsi, %rdx),	%r11
+	movq -2*8(%rsi, %rcx),	%r10
+	movq -1*8(%rsi, %rcx),	%r11
 	movq %r8,	0*8(%rdi)
 	movq %r9,	1*8(%rdi)
-	movq %r10,	-2*8(%rdi, %rdx)
-	movq %r11,	-1*8(%rdi, %rdx)
+	movq %r10,	-2*8(%rdi, %rcx)
+	movq %r11,	-1*8(%rdi, %rcx)
 	RET
 	.p2align 4
 .Lless_16bytes:
-	cmpl $8,	%edx
+	cmpl $8,	%ecx
 	jb   .Lless_8bytes
 	/*
 	 * Move data from 8 bytes to 15 bytes.
 	 */
 	movq 0*8(%rsi),	%r8
-	movq -1*8(%rsi, %rdx),	%r9
+	movq -1*8(%rsi, %rcx),	%r9
 	movq %r8,	0*8(%rdi)
-	movq %r9,	-1*8(%rdi, %rdx)
+	movq %r9,	-1*8(%rdi, %rcx)
 	RET
 	.p2align 4
 .Lless_8bytes:
-	cmpl $4,	%edx
+	cmpl $4,	%ecx
 	jb   .Lless_3bytes
 
 	/*
 	 * Move data from 4 bytes to 7 bytes.
 	 */
-	movl (%rsi), %ecx
-	movl -4(%rsi, %rdx), %r8d
-	movl %ecx, (%rdi)
-	movl %r8d, -4(%rdi, %rdx)
+	movl (%rsi), %edx
+	movl -4(%rsi, %rcx), %r8d
+	movl %edx, (%rdi)
+	movl %r8d, -4(%rdi, %rcx)
 	RET
 	.p2align 4
 .Lless_3bytes:
-	subl $1, %edx
+	subl $1, %ecx
 	jb .Lend
 	/*
 	 * Move data from 1 bytes to 3 bytes.
 	 */
-	movzbl (%rsi), %ecx
+	movzbl (%rsi), %edx
 	jz .Lstore_1byte
 	movzbq 1(%rsi), %r8
-	movzbq (%rsi, %rdx), %r9
+	movzbq (%rsi, %rcx), %r9
 	movb %r8b, 1(%rdi)
-	movb %r9b, (%rdi, %rdx)
+	movb %r9b, (%rdi, %rcx)
 .Lstore_1byte:
-	movb %cl, (%rdi)
+	movb %dl, (%rdi)
 
 .Lend:
 	RET
-SYM_FUNC_END(memcpy_orig)
 
+.Lerms:
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

