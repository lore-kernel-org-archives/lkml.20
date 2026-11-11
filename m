Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403343;
	b=TRizDU4aijrmoFUyG/gVy+L01wWWmAQQb61qhdQrbmSkOniQRmAAbQnBgiRCivFXN4J/
	 QDYSLxtUxZitOdy3EDyjNZDZB0FzCjbLO/2DU553P3gZHng6znXCBIsaeMeMMQSbe5gTc
	 itw+pWiVKuwFBGx1eLcXvhT8DzFXJ9GOgI1Nw9oNTP0izA09euVemdenbQG412K5Bl6rx
	 8gDEs4He5QtX2jJvz3dace1mqnqYShA+q7T87Y2RiQ4ukYSKvLOPkZn7n+9YoOvLTQTwv
	 4Wt80sc2nqGOD2UQYVopmESNANwnnSp8Q+RyJpnErjyMdIIfstvRs9j0JEEcZcOex3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403343;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=73zqHQNbOKPRrmT3b3llwUzg6vJRAmXf+tx88qea+Qw=;
	b=LFWzRXOtaWEm3zEcTc+FpobUZQyZolGjg/3bUXi8FxKnc7MaDa5SWRdkyq2C7+CU85mg
	 K23ifdFgNHuazTxH7JDm6CitdaLvS1IsfRXEsfQ8fsACZfd/5C8eaPUUgfCzLz3bmqrBN
	 gb85+SpbOSaR2VBI7CmKEIQqe/QCJvmYIogEm0rtI7CKcm/K9nqFK0JZf7fO2t42bJH9M
	 xPAvI/0XIxgHwAOgThFe1m0+T5r91wqje6+buYjwsOLLFC+PkdNFDkEFzEPLOIo/gQ0b9
	 lBhn34gGtN+5bv952Es9L6m6zNL6C3xw4f8mp7TzxCoVrw+GQRcmQGi89m23fBNJgPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g3tbM1Zd;
	arc=none smtp.remote-ip=95.215.58.251
Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE32606A8A3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE32606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g3tbM1Zd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BB/nJSIAnk4695CccdaVaROjbSuX01pgcKgySiPClek=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794403340; v=1; x=1795008140;
 b=g3tbM1ZdDCwO5gtZoad9yQtfps8baV5pNPT4yCGGBmX0VZvn2MRDvA2jnOUTVs1FgwpHP6d2
 YnhmAX3/xBPlDNFxEU6/UWCCnHjkXB4xkhTdVQs5Dk6qgKT4TtxfZzG3CMMluVHqEN3DilklWHF
 c1ENLdpwjnmoD6NWwsZGClRo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 93e8838dec6035d2;
	Wed, 11 Nov 2026 13:22:20 +0000
X-Mizu-Trace-ID: 93e8838dec6035d2
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
Subject: [PATCH v3 1/2] x86/lib: Keep the scalar memcpy() count in RCX
Date: Wed, 11 Nov 2026 05:20:52 -0800
Message-ID: <20261111132214.2979125-2-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111132214.2979125-1-usama.arif@linux.dev>
References: <20261111132214.2979125-1-usama.arif@linux.dev>
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

Use RCX for the scalar loop count and tail indexing, and RDX for the
small-copy data temporary. Initialize RCX from the incoming RDX count in
memcpy_orig().

This prepares the ERMS size check to use RDX as scratch while preserving
the REP MOVSB count in RCX. The FSRM path and copy policy stay the same.

No functional change.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/x86/lib/memcpy_64.S | 59 ++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 12a23fa7c44c5..7bb146c811029 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -46,8 +46,9 @@ EXPORT_SYMBOL(memcpy)
 
 SYM_FUNC_START_LOCAL(memcpy_orig)
 	movq %rdi, %rax
+	movq %rdx, %rcx
 
-	cmpq $0x20, %rdx
+	cmpq $0x20, %rcx
 	jb .Lhandle_tail
 
 	/*
@@ -56,9 +57,9 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
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
@@ -75,23 +76,23 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
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
@@ -107,11 +108,11 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
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
@@ -119,53 +120,53 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
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
-- 
2.53.0-Meta

