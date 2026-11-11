Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403345;
	b=W53+Xd82CsvoFCnvuqwTKrR7fU5An0RwPNfnyyr7u8iYMWQAnyMumHDL57wGHNPLpDsA
	 LrqsrK12VmJJVy9GSflLMoELGaNps0xqsLu2/oKrsL1Hi6ReauQw8CM/zmBk8LiflWs8t
	 I6CFsax2811gACrXKXj5380Fzn2N1VoxUxO17/huCkz8oqpajOpqXYuBASPywPIEMVBbZ
	 R8YqAmVNlH/jV1AXNidzudgsl3bbtXmTwPAZDLE3YX01KzCUYo9rhYo6xep5L6O8vZ3xc
	 3NATeuTi+JtWZTmzpaPznz+3zTKHBGFSathCHbd3Vs7awvbE0cW+64LUe0aie0auSCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403345;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E/45XS6kOhXEH4Vbvnuouc3+HJpGog7iZwTgGT4HZws=;
	b=CdNlrvcg7h1Fe2qNvAIAseP8ixV/o8YYNwnTTOON5fBuHjwzHPiCK28ToVMAc92JKkrk
	 R4HUSncy5xMXNbDWKu3FaJZgEF0k+qeHZHtXf3bKGCvC8BpDWArJJDOSvDyg+uRzAFiPq
	 SgpoMghgskKlLExodomt4aVawCaUa6+MRDOUiXerYAc1DdoIXuIAULYm+w/pm2LpbqsCR
	 TQO0LUOwVPpVn0GrNuZKXzjEhqVofnNGz4qhNW4QOJwM+VReipSpjg5xd+CW0Ir2exhzi
	 zCfn8qJuxkJ1xJXmXYxc0KS96MxsFk1ZWspWO1hWlj6r6sfb1mirtNa/pEHRCApEMBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H3Ec2yz1;
	arc=none smtp.remote-ip=91.218.175.253
Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE6C606A8B3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE6C606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H3Ec2yz1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=q4bKncdlu5h0Ydk9tuGuFTG8deC9R5JyHB0UMOxC5eA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794403342; v=1; x=1795008142;
 b=H3Ec2yz1WX8baODdh4ERNDIyuizIAPb+hcrrlv1mmZSfccKoO9D7lqdyKHUanjDBWK2KHad7
 b9wCd6l1bpK8sk++saboetxbWwytSrZur8TmBQjZhfKLb8jBU9o03+DC+s2GjDrjV+G+9NifDfK
 SO/7blHfByKANwLiPVhV1txk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id b3063572b479c9be;
	Wed, 11 Nov 2026 13:22:22 +0000
X-Mizu-Trace-ID: b3063572b479c9be
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
Subject: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
Date: Wed, 11 Nov 2026 05:20:53 -0800
Message-ID: <20261111132214.2979125-3-usama.arif@linux.dev>
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

Since commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
memory copies"), memcpy() uses REP MOVSB only on FSRM CPUs, so ERMS CPUs
without FSRM, such as Skylake and Cooper Lake, copy every size with
the scalar loop. Large copies matter there: in Meta's x86 fleet, about a
third of the time in memcpy_orig() is btrfs zstd decompression copying
pages into and out of zstd's buffers.

Use REP MOVSB from 2048 bytes on ERMS CPUs. On a 1.4 GHz Cooper Lake, an
aligned, cache-hot 4 KiB memcpy() then takes 66.8% less time (123.3 ns
instead of 371.6 ns). In a single-vCPU guest, reading a synthetic
512 MiB btrfs zstd file takes 14.8% less time (median of five kernel
pairs). Smaller copies keep the scalar loop: using REP MOVSB from
32 bytes made 32/64/128/256-byte copies
111.8%/68.0%/63.2%/15.6% slower.

Prepare the return value and RCX count before the FSRM alternative. On
FSRM CPUs, REP MOVSB replaces the jump to memcpy_orig(), followed by a
RET in ordinary text. ITS then selects return handling using the RET's
execution address.

For ERMS CPUs, shift the scratch copy of the length in RDX after the
32-byte check. RCX already holds the count, so large copies need no
reload. Copies below 32 bytes skip the check, which is a single NOP
without ERMS.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/x86/lib/memcpy_64.S | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 7bb146c811029..5320862e0274e 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -27,15 +27,13 @@
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
+	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
 	RET
 SYM_FUNC_END(__memcpy)
 EXPORT_SYMBOL(__memcpy)
@@ -45,12 +43,16 @@ SYM_PIC_ALIAS(memcpy)
 EXPORT_SYMBOL(memcpy)
 
 SYM_FUNC_START_LOCAL(memcpy_orig)
-	movq %rdi, %rax
-	movq %rdx, %rcx
-
 	cmpq $0x20, %rcx
 	jb .Lhandle_tail
 
+	/*
+	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
+	 * Shift RDX to check length >= 2048 without destroying the REP count.
+	 * The 10-byte alternative fits a NOP without ERMS.
+	 */
+	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS
+
 	/*
 	 * We check whether memory false dependence could occur,
 	 * then jump to corresponding copy mode.
@@ -170,5 +172,8 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
 
 .Lend:
 	RET
-SYM_FUNC_END(memcpy_orig)
 
+.Lerms:
+	rep movsb
+	RET
+SYM_FUNC_END(memcpy_orig)
-- 
2.53.0-Meta

