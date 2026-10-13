Received: from mta0.migadu.com (out-85.mta0.migadu.com [91.218.175.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7674D4D0A0F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885895; cv=none; b=YBZ9fOnPSQH1EMVTfj7BpXTJ8i/2pqvdrqnKKS/LYo3uAOdPWkTnaSwWIEYjOaK01Svd1gmyLWmqQyLp/qJuL3G+fHu6MbbECd2XDVnqwDmFutEEDHcmUBRycgBot/464ZUTRpuXGFKIPRekuRxaboRojQXBekkFdP9NvxXytDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885895; c=relaxed/simple;
	bh=10sYukvEEIoxfdGdZDO520B+cvwbM5UT4XvPG2jEC1Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=r3Ry2801qOkI0GY+RKhfacK2QBDeEg6yl4+s/l1+HaLdT/CVuLzSE95dCZHjSbOXoW4vt3/x/w1MRlNRjzrOYi8hcvlymQyDlBudEFGvcULoQAEeraOkxTIA2GqsUvnYZ8cge29Lw7Mrv+0M+nmhAOJO/oj8Z6XyWuDYQ1Tgt4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e3lvtCtP; arc=none smtp.client-ip=91.218.175.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e3lvtCtP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=10sYukvEEIoxfdGdZDO520B+cvwbM5UT4XvPG2jEC1Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791885889; v=1; x=1792490689;
 b=e3lvtCtP1obAh3hf9yFMoK5ATn+q4DkKKx1XEtFvEL4NQDRAdNg76z8T3aVSCsUEW1Z3sr37
 DnhiuKegUnDIxFfJu8ShkoMhcUU08owoSzH8zXT2Kd/pqcZeoqNHKyPg9LBe9OLIBKHQkPxiWYm
 YAjtUTNxgmSOEaWWuvxRDkB4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 00159b9699d5f435;
	Tue, 13 Oct 2026 10:04:49 +0000
X-Mizu-Trace-ID: 00159b9699d5f435
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: bp@alien8.de,
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
Subject: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
Date: Tue, 13 Oct 2026 03:04:42 -0700
Message-ID: <20261013100442.2658311-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
memory copies") stopped selecting REP MOVSB from ERMS alone because it
is not suitable for short copies. Consequently, ordinary out-of-line
__memcpy() calls on CPUs with ERMS but without FSRM use memcpy_orig()
for every length. Its main loop copies 32 bytes per iteration and can be
slower than REP MOVSB for large copies, as measured below on Cooper Lake.

This matters for btrfs zstd decompression. The btrfs-tree commit
e27a6e4823f3 ("btrfs: zstd: avoid a copy in zstd_decompress_bio()")
removes btrfs' copy from a scratch buffer into the page cache by letting
zstd write there directly. It does not remove the copies inside
streaming zstd. ZSTD_decompressStream() still uses memcpy() to flush
decompressed data from its internal output buffer to the supplied page
(zdss_flush), and to stage compressed input when the next block crosses
an input folio supplied by btrfs (zdss_load). In Meta's fleet profile
of x86 kernels, these two btrfs/zstd call sites accounted for about 34%
of the sampled profile weight attributed to memcpy_orig().

On CPUs without FSRM, select REP MOVSB for copies of 512 bytes and above
when ERMS is present. Keep memcpy_orig() below 512 bytes. The later FSRM
alternative continues to select REP MOVSB for all sizes, including when
ERMS is not exposed.

Userspace replicas of the original and patched entry paths were run on
a turbo-disabled Xeon Platinum 8321HC (Cooper Lake), capped at
1.401 GHz. Results average two runs and scale the per-call time to
65,536 4 KB calls, or 256 MB in aggregate.

Here "hot" means cache-resident. The rows model zdss_flush() from
zstd's L2-resident output buffer, zdss_load() from a cold compressed
folio into zstd's hot input buffer, and a page copy into a cold
destination.

                                    orig  REP MOVSB  reduction
  zdss_flush: L2 -> hot page     28.0 ms   11.9 ms      57.5%
  zdss_load: cold -> hot buffer  46.1 ms   28.9 ms      37.3%
  page copy: hot -> cold page    29.8 ms   22.5 ms      24.5%

REP MOVSB was faster in every tested scenario at 512 bytes and above.
Copies below 512 bytes showed no consistent performance change across the
possible function alignments.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
The above benchmarks to model copies in zstd were created using LLM:
https://gist.github.com/uarif1/8409ccd34284f128dbea5822ec628ef3
---
 arch/x86/lib/memcpy_64.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 12a23fa7c44c5..a7b3ce4fae0b4 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -31,7 +31,9 @@
  * which the compiler could/should do much better anyway.
  */
 SYM_TYPED_FUNC_START(__memcpy)
-	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
+	ALTERNATIVE_2 "jmp memcpy_orig", \
+		      "cmpq $512, %rdx; jb memcpy_orig", X86_FEATURE_ERMS, \
+		      "", X86_FEATURE_FSRM
 
 	movq %rdi, %rax
 	movq %rdx, %rcx
-- 
2.53.0-Meta

