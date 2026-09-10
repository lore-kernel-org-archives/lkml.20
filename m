Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B93D7D74
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034978; cv=none; b=q2ArJCQqTk6h0pMe6eamtTIp9FRDaMCy7sGYMLqv4lXR/1Yf1y6L9nO3YdTxJLxFIrW1HASCsw2e9PvgUgWLVzJ2+h8VoLexI59gTXARRzSxDibnzCKi4QpbKXiMVn4sB0uYQFMT6T51ESLDq15QoNfmUsO66uVpzT9yj/ItBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034978; c=relaxed/simple;
	bh=5MTpEF29vY3ddpLprqaotRdeYOwb+VnVZdNgLIvFcmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2uNh7bH8akQCOSDhHzEY/2LETauI5gaGeL2rs2/CMVI2478fdj7JGBWMGpdw5EVThHHH0IkuzgjJ7oR81aI9nGUxUV1kMNQaSXSQZqyd+SmD9w1GoBw8k6ePNoL7KxzQr4jUyItZUCj/d1jvTt9lb/OPsN+66d1rw8JgenJMjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctytSY7L; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctytSY7L"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a5aad413so5799690a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789034970; x=1789639770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5leu8y8+SZGo99Bk+YLh7ZmObofNLoxXT8B8pxE/vs=;
        b=ctytSY7L/DxEzqk8j7+gaGI6mvluVfU3O2r2Pv6lA5ZPvr/AimXeCBMvrct/yR5WtK
         tl/0oQVoeVE3191rLgWEe5hKsyXp8FpEBYj8EomuCTfT0gGuKY3W/WCSgR/fAK2P2Vv0
         oxHYuUc0z8iawlEti2VZA+9cGcDYJ6RD+Yy9XZOw7MKqGneVfEk/AHsxt8xgJSCf/C2P
         bRfPgkVm/HmXbUWA6hWL3upem518tWiXvdSKVwrIgcDOCXJKSk0A82SYq5DqAApe16Y9
         G8ZvXESyYKdUpHqVgoLNswImC46tzflLstu00cbblF1SzAKf8WyWlODP5mONUO9ErwWG
         hbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789034970; x=1789639770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5leu8y8+SZGo99Bk+YLh7ZmObofNLoxXT8B8pxE/vs=;
        b=lSmdwkGmuTRJsIYyJXQvicMRbtl4jeD7/J8YyggzCMG0DNHK1IMrNtWDgqZ+XLSHxv
         eAm+rwYiIW5fTf3aPWKFujVuUnaBfxID5m7ex0P734PbvpWBkG75vvvDTwmaRXpSvs6X
         ZJaN4SiSiz2PdhQjwUAsegRNZ+xDTM74h6V5IqSrKv/MTrEEWqO0o3xUGMXg47D2FGF9
         QunToqE8NMdqlU7bopapWQCsh1Y15ZAYBc1E7GhuAeaDoV0ty2aDmQKaNiOTbr0dmJgn
         xuXJKt/Qwwf6oOW5qD59XX5BBX3ANMU4zeENANkKOnXmPuCfqNSuFXL3HiCqlJCxMXR2
         GdYg==
X-Forwarded-Encrypted: i=1; AKwUvBz5ZJBq9NtKWIo8/AMDFR6206JUv3jPOozD9R4jGrjGXZX0JL4e8XEQupiKZVzuhmXuBAfo301+mT7Uqn8=@vger.kernel.org
X-Gm-Message-State: AFuF++n3dM8UOwyeOPascpyjoGKL8CGRsJGC1Mj+kUIpCi3axWtFnUaO
	v4jn7td/DO4q9v3h08hy46fwS58XgG1o/VeoEgRHJRae3LBesOgjo1Hn
X-Gm-Gg: AYBFou0JsYctVBrHT/91xR40WTzAxHB6+YTPPBXPDqN/RK4ApUxVGfQ9XsUwtFa41Ky
	xUQ5BU1LZjSq1Qb7lY7AFSwVuR7S//tCZnqhSEyKCUoD07ysXhuYwNtQoiGIkykepzrKN+ybgkq
	IPNekiGsF/DuTb4FA7SB8rFQH+hbKnFEQql22nI/VNP5LyRZvLPy5ZcLTUR1zaAO5ayASk+BSr+
	RK7pXnuthIxgCUoeQp1pPQSZWCVM7HtgajS6wxd9Wg5yDrEmFWB4VG1maphoeARe5OE1xduFZI3
	RFHTLbtCbp0AowyhfufZYGS4BFRY+tnritylUzEyZ9NmpyeYzyr6Ef3Ncp3wnpqjqIdUo/k/pXB
	G5uxUII+cL5E5rcb0GnYAH3b+imAMcarM5jLU1ugeg6BPYl8dk8lVfy8veaKlmgxQxxcw6LZO2G
	ktG90t+OtwC6HAodGVA+roTrl+fBe68G3l9X3BQyfNXHX3Khz4/y2H4f3bkd8Mne9RKSMQTnv2+
	wwuC4zduR+JYGAoyrlADigHf/OBNLxFwjbTYxCtIwiGNR/e+YW87ACaKn9tE7zr
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr56515343a91.21.1789034970472;
        Thu, 10 Sep 2026 03:09:30 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae60b23csm3460207a91.0.2026.09.10.03.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:09:29 -0700 (PDT)
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
Subject: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Thu, 10 Sep 2026 15:38:02 +0530
Message-ID: <20260910100801.2159785-2-mkchauras@gmail.com>
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

To add ARCH_WARN_ASM, _EMIT_BUG_ENTRY first needs to be refactored.
The old definition was a bare macro with no parameters, relying on
positional asm operand references (%0-%3), hardcoding the backward
reference to local label 1b, and including .org/.previous directives
inline. That made it impossible to compose as a plain string outside of
an asm operand context, and left an invisible contract that callers must
always emit their trap at label 1:.

Refactor _EMIT_BUG_ENTRY to take explicit (label, file, line, flags)
string arguments via string concatenation. This removes the dependency
on asm operand numbering and makes the trap label an explicit argument,
so the caller's intent is visible at the call site and a future caller
using a different label cannot silently produce a wrong bug table entry.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
each call site, so BUG_ENTRY() can still pass sizeof(struct bug_entry)
as an asm operand while ARCH_WARN_ASM can supply its own size string
independently.

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
V2 -> V3:
 - Add label argument in _EMIT_BUG_ENTRY
V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com

V1 -> V2:
- commit message now has error, fixes tag and closes tag
V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com

 arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..df2183c35945 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -32,34 +32,38 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLER__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _EMIT_BUG_ENTRY				\
-	".section __bug_table,\"aw\"\n"		\
-	"2:	.4byte 1b - .\n"		\
-	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
-	".previous\n"
+#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"			\
+	"2:	.4byte " label "b - .\n"		\
+	"	.4byte " file " - .\n"			\
+	"	.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
-	".section __bug_table,\"aw\"\n"		\
-	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"			\
+	"2:	.4byte " label "b - .\n"		\
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY("1", "%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY("1", file, line, flags)	\
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

