Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27184F5E0A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743155; cv=none; b=WLGlJIEgdveFTMVNEVsWa0MvI2ZgVs1D9x3/x0Gx6y6rBu2j9Giptb72in5TzWCEE55Laq0EQByne4tnZe4ZtOx5Kgq/rxj3FJwlr+gsFPJHC6LBFtI2e1W4eNA7iJN6BtaGz/dzrohCscf7pQwfdFBdjN+pl19u782nu+o9m3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743155; c=relaxed/simple;
	bh=KB1gbSWAy/ka+/YHyBSMEy9C6IvBSbt+SvdAkrr9i/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9EGr4clygloEf5DtJIwtNrgnzGUgEYtSZJaWyc/iEjW6lghtVvGDQLoDaGZhw4g8dT3N3lrQ8fdODB6+rqXtdwyZ/SnMs4GinxeQ3oyBfZu011WC8KY55bYqMset/YHOdJlFaywYz4ZSxKLPArYg5TJhPpTqENuPbV9yJ+6aTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZi6GglU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZi6GglU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3608C1F00898;
	Fri, 18 Sep 2026 14:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743147;
	bh=alAQXkbnxpjXDfvThdJzKpaGNsoJElzpO5O9I9uSqHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jZi6GglU53TBP8sQOukY49URZBMglJbjKZVyPmWGiDdR2f2j9PlnH4ynsQ/DpTRz8
	 XhIRO2RjFjQgPw5+gfqVf671XbEKxyD5pcrkG6NMKfZ+VFKD7kJuwqj5A/WOZyzIJp
	 1daW/YIq7WjFLlt1hgXozLv6less93YykNMKXun7KQaq6KlvUe/I7HSa+Jb5+7UalN
	 yZnHU9RcEbh+vRhcSU8CKfLNhLEF/s/SkslPLHnDUKP/SuChLRBCVrElKfA386ZmbN
	 xGVpjMZFacMWo0loUg/eSx+3F2ro+m+MpDaD/uq8u1gO/q/S1t4xaL6Oe5v8MX60X5
	 8C5O4BkazNCCA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 01/13] selftests/arm64: Remove big-endian support
Date: Fri, 18 Sep 2026 15:52:03 +0100
Message-ID: <20260918145217.1669-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Big-endian support on arm64 depends on BROKEN, so the arm64 selftests do
not need to worry about testing this configuration any more.

Remove the 128-bit byte-swapping helper from the fp-ptrace test and the
big-endian definition of RSEQ_SIG_DATA from the rseq test.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 19 +------------------
 tools/testing/selftests/rseq/rseq-arm64.h    |  5 -----
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index b435837c8c0e..9b184d78f4fd 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -115,23 +115,6 @@ static void handle_alarm(int sig, siginfo_t *info, void *context)
 	got_alarm = true;
 }
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-static __uint128_t arm64_cpu_to_le128(__uint128_t x)
-{
-	u64 a = swab64(x);
-	u64 b = swab64(x >> 64);
-
-	return ((__uint128_t)a << 64) | b;
-}
-#else
-static __uint128_t arm64_cpu_to_le128(__uint128_t x)
-{
-	return x;
-}
-#endif
-
-#define arm64_le128_to_cpu(x) arm64_cpu_to_le128(x)
-
 static bool sve_supported(void)
 {
 	return getauxval(AT_HWCAP) & HWCAP_SVE;
@@ -932,7 +915,7 @@ static void fpsimd_to_sve(__uint128_t *v, char *z, int vl)
 
 	for (i = 0; i < __SVE_NUM_ZREGS; i++) {
 		p = (__uint128_t *)&z[__SVE_ZREG_OFFSET(vq, i)];
-		*p = arm64_cpu_to_le128(v[i]);
+		*p = v[i];
 	}
 }
 
diff --git a/tools/testing/selftests/rseq/rseq-arm64.h b/tools/testing/selftests/rseq/rseq-arm64.h
index 21e1626a7235..f9fecf941bf2 100644
--- a/tools/testing/selftests/rseq/rseq-arm64.h
+++ b/tools/testing/selftests/rseq/rseq-arm64.h
@@ -12,12 +12,7 @@
  * matches code endianness.
  */
 #define RSEQ_SIG_CODE	0xd428bc00	/* BRK #0x45E0.  */
-
-#ifdef __AARCH64EB__
-#define RSEQ_SIG_DATA	0x00bc28d4	/* BRK #0x45E0.  */
-#else
 #define RSEQ_SIG_DATA	RSEQ_SIG_CODE
-#endif
 
 #define RSEQ_SIG	RSEQ_SIG_DATA
 
-- 
2.55.0.1082.g2b9226bbc0-goog

