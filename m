Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D73905E7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024397; cv=none; b=BCeO/a7NoP6P6kT66cvxW6CzMwoyhWr+tHN6lOuSPC91hzUwlNu8Q6G8dn7NYoioItuHR81YTZPU54FN8nWfxRPFqGX9ZDphft0xFN8dQ/MLDPw2NlknFFSeCBdKQQYzV+gU5oI/phhsJX9qXz715DZGLVzneYQrH0X2H7BTPqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024397; c=relaxed/simple;
	bh=fCdtyTmQLFJCppzzCnTNnwRvkB3lcC2v6IB30SxEUK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GSei7O87/xMYYdTqrA/SEZHE9/vDt/nZDFlS+qZXDyDs946eC4wHboZp90PxsvPg9j18tFvvuHE1NgOc0TBVgtqmX7XPTboLfVSQSSz0gyXmHY1pyjLRarQnKhAhilgn5ilLyns2SFXg6CPUUYjGl2fyFH7ckkdymTgX4iHVPUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJpoeeyq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJpoeeyq"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so13872275ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024395; x=1789629195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2oXTxVfBODKLGSc/9HbMzKqtFz+JtlQq+nSqeCi24+U=;
        b=tJpoeeyqtUgppSt53xkFE55Yc7jRV7VFQP2zVZl5BEEAFj6Q/ZgMq7yfNISydPWWLe
         6ftHg9l6ibSwpHPg8i16H/kOBDgyxp9PgKhaKUohG5nL00g1hVFxpO7jRGBPnsKvUwHi
         3yTJDry3yF8aveR170GFgBdjjG14fl9JQ4fXWo9+3dsq+Gg11SKCC6UkNs7gJ30r9ayg
         D/l+AhNCaM/7+kyD5DwRFmL092QfVdyiHWaenFvFAhuDmRBngg8k28wfjvnpuUrQ8KaB
         jGXSuJ5DbkIpbGoNjhfpIXGtsuRGFl6DZBv+Ur1o8uAQ6TM8TfJH7OrlyY2y2akuAN/2
         mJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024395; x=1789629195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oXTxVfBODKLGSc/9HbMzKqtFz+JtlQq+nSqeCi24+U=;
        b=EcQXoPWfqobsy/o33lsVzJFmNOBoIjqvrdb5XqPdNrhBS/htJVpg3lsb1Bao0sqkn1
         QdDiyoSxYmu5FZEZUHpSATuHMdAFktQC8G6yJyv1TYwxACw0kjGuKO+/MviE8EiDeW/0
         t3tOzbIb0lY1S0u3weYLae5hafTF8125iK72n4Z3XFFAWcjSqCE0NoKh3QXIr8pgwNmK
         g04wTR/lG8BKDhAicmblCD+t6yIbtmNw4qDvMEWA2VUW6J28KShv9DA6a08PKLsgQvgP
         t0ZvRq3K1129UlPD5S18iLan6BhEvs2/5UFrSbFzI06mLLtiGRpmXwa5Q6VRNNgRz+Jg
         +OZg==
X-Forwarded-Encrypted: i=1; AKwUvBx3NgT1IWh5x/q4bxP87+eLe5GDtbqRH/AGtTH5AH2CspQnk4hA3ERlPurJPwSq4wpk8NIRaohK2cQI0XE=@vger.kernel.org
X-Gm-Message-State: AFuF++kKve+pHs4vPj8bCZ7iyCYZtY2FcsISUCZrywghpUzNfc5p9wDy
	qtDDrHDu6pd2ePepvDpq0zP+hOWKRWCaNNHuUotArDscmjD53/AP4ITA
X-Gm-Gg: AYBFou0t5lPFyjW1rGJMG7WdKBwPS56jzI4iOkXkZd/ga6cWZClc3xxnbJq6EzujYS/
	Q5x9CWi+t8X9I/O3ilwfj0cLkbePsbJ3isZkD+BSJBcR7JCikrtjUJIuLaZa+1a2Ng/dlldglae
	GV/RZO8UPyuLNvk6+t03pT/D763rUSf2vr1J4TNpofHljVRvS4MCFd8aeVc0gYvQm/gERyfS8g+
	1gOx+MwlHjA0VlVawcp4vI3hOs4NGMiR0ESgZnimYk4T/9MAKG2JaS9/SmetB48SAYAoDvlzLiV
	xz4OTvLZKn8uriL3R8nBkW8/pHqnQS6FQhrChN3hPtDzZMzvjhzZc/Zvs362D3d+JmhENtV2F5m
	fNQbRoNlTgEOWNTasdC5Hj2dZ/6jxPhr3OxyvC6030bkG7mJpK8+XKR3nb1Mm2QZIp50/sUbYoP
	MSj9iYFKuVwbUXNAKNe5I8fpgCd63IEuHkVVf1sbMet4kRE12/HD2YvpQsUiOuWl3xgrfljntaT
	04DhBnD8SbyIJ3J7d3QrrP6WY+how2/+5UBFPE7/zeAkHzNF4nVUA==
X-Received: by 2002:a17:903:17cc:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd07cb17dbmr88797695ad.21.1789024394747;
        Thu, 10 Sep 2026 00:13:14 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm82366995ad.80.2026.09.10.00.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:13:14 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	mkchauras@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH V2] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Thu, 10 Sep 2026 12:42:53 +0530
Message-ID: <20260910071252.1950488-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust kernel infrastructure generates inline asm for WARN() via
ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
arch-specific asm template string for use in Rust's core::arch macros.

powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
Rust builds to fail on powerpc with
```
error: no rules expected `ARCH_WARN_ASM`
   --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
    |
  1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
    |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
    |
   ::: ../rust/kernel/lib.rs:279:1
    |
279 | macro_rules! concat_literals {
    | ---------------------------- when calling this macro
    |
    = note: while trying to match sequence start

error: no rules expected `ARCH_WARN_REACHABLE`
   --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
    |
  1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
    |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
    |
   ::: ../rust/kernel/lib.rs:279:1
    |
279 | macro_rules! concat_literals {
    | ---------------------------- when calling this macro
    |
    = note: while trying to match sequence start

error: aborting due to 2 previous errors
```

Refactor _EMIT_BUG_ENTRY to accept explicit (file, line, flags) string
arguments rather than relying on positional asm operand references
(%0, %1, %2, %3). This allows the macro to be composed as a plain
string concatenation, which is required for ARCH_WARN_ASM where no asm
operand context exists.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
the BUG_ENTRY() call site to preserve existing behaviour while enabling
ARCH_WARN_ASM to supply its own size operand independently.

Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
convention, indicating that no additional reachability annotation is
needed after a WARN on powerpc.

This brings powerpc into line with x86, arm64, s390, and riscv, all of
which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.

Reported-by: FUJITA Tomonori <tomo@flapping.org>
Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
Fixes: 73b741adb264 ("rust: Add PowerPC support")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
Changelog:
V1 -> V2:
- commit message now has error, fixes tag and closes tag

 arch/powerpc/include/asm/bug.h | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..8aba39e0cf26 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -32,34 +32,38 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLER__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.4byte " file " - .\n"		\
+	"	.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY("%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY(file, line, flags)	\
+		".org 2b+" size "\n"			\
+		".previous\n"
+
+#define ARCH_WARN_REACHABLE
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
-- 
2.55.0

