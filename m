Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C07490BE0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799067; cv=none; b=VCSdr8//TA4vvHIlDCEiOaxYr9jfKhkqOX/TAoFyNHAAdIItmPHyj9+qPsd7tfI2ERiXHhFqKpvphg5gcFJ+MkgC3/VLLD25XAjFjkbR3DijmS2RMhl31HPfUt5H3Kert4Hr1PpWV9pqbPEczjU4xpqLNrjUQagaQyTMQXai65w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799067; c=relaxed/simple;
	bh=SHiaRDgAbRogSCrDgqQFHN5EjCO5q58zZZmwYQDZJFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAyMm0GGlLuq7HREdZK4iTkqA9cshc+LHwGiBuNPwgBR9YkSm5IvIxkGHT9xn9DN2gAYkqMwJLFgAoerhNPKmlCKCMKErr0X1ewVHa4Kr0yubn9Hg5wD1JH1o7zmPK6ZmoI7UylcTDDaivUO+6cx4fTFgZWFBF4MqCFqFF47DOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kj9ZlutW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kj9ZlutW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BB61F00A3D;
	Mon,  7 Sep 2026 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799063;
	bh=YqRz7kh9GA65pE9byU4+133n1tljEOvpx8kOxD8+E2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kj9ZlutWEW+hsUIPXmKg+enJK5UF3ivS1PX6eBAbwSJLQxjWFIrG6T+cZYCJdEipJ
	 pApIwfPKHrWIXuVU4ioqDqg5BpZaeOpulEoiUwtw/wYHIyY5cYvzpWI8Y/JVNgNgYf
	 c3Y2gI7w0QT/tUyiI0UcIBbOSR7zZvz8w4cFdTZLngGb3sqpZEJt4dl14DtrKTSJIX
	 xNsejXmNUprfgbdQTUnNdyI9Wzg7wZ4T/b4R6EocHKmCiwbpMO9rnJ9kpi7hYonKm6
	 cme+a2sIz9PRgnNMVv3dv3a/3+9S2bJ15P3akcE61aILDqj+YCYgVNnLHyizFr/Ys7
	 PQiaKlG8AvYow==
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
Subject: [PATCH v2 01/14] selftests/arm64: Remove big-endian support
Date: Mon,  7 Sep 2026 17:37:12 +0100
Message-ID: <20260907163726.17104-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

