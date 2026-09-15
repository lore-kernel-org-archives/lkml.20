Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490B1441619
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463124; cv=none; b=jv5j295QmQ+z4BaB6DnLkwkpsE4eHVeQinRyjms+HtFCGypatqdfi9/Kt8nuegdhCS6WbfcS4QrrkSjxi69OgMqEQPYXoA6th5VLIZYf/tPsdh65ZIz5bR+qq2XyeeaJlCdG9/ck13PEvED/VkbxLBcSHcHaB/f2G4kPk5qhNQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463124; c=relaxed/simple;
	bh=ligEys563GaiRhNpINKM6nCfw+5Fhk/eneyMpl5W+uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sb4M2/KKV8KJEaDH0BBEj3tSVhT5tDlAuS1/GT7ZvK+GyTeClKRSJuJsEqsjCOZHoFBF+1KY9iJIoIr86Gb7Ub0VWaaUD3DENr8nj5x6vc8o7inUHleukz8Fv2wzfgHLiaNwJSDF6+F4uesxQMJVJn/1xgwKqjUdEl1sr/EmapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4KDZ2kA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4KDZ2kA"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so1700929b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463121; x=1790067921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRlgQjCaKIy4dVemjk8uAj0nWBn95cwji7bMZ4jS6zE=;
        b=c4KDZ2kA8TTX4tYnIsYvMfr5cj5yH4TLLw1zXlqFJEyZ5xihp7mq9j3R/WUSEWcAUF
         mOQZttEA89iKjWmG0dyuKya/8//BH7QW068TScA5RMDDLEXYWYnKX3UH8NkS+AE8HqUA
         kSk+XqIj8AeYDYrWPtRrDTXHPe3uG5edQF7pcCNrDtoz3F3+uubxhUj9HgqjI7bN1FwL
         kWf7Ekf6KZ+pjg6CRK1ZTRUrtQNgJ79INr8DZa1jnE1rZsEfQBGF0lEKWFfyn+8SQT6A
         Z0Pid12f/qlojRkMY3D9nQ+6hKvXPbNw6azJTI8jSLWWv2YqHYLFRJJ8AoxFwmfM+FLQ
         w3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463121; x=1790067921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRlgQjCaKIy4dVemjk8uAj0nWBn95cwji7bMZ4jS6zE=;
        b=TePWuPiwicL5m8G7uhzB2f0L72h6JB6HxpqZn37mUtomuembIlLMzIGBub82+m2ANt
         L5pxua5yfxw9LeqEgX+R3yP3ajVfHQfofmlhNXW6l68GlLAuBmKZFy5B4YqBIi8bBf94
         y7lkRClHOVGFEqgcfL9Yaf/FQbMgGIxjbA1Zf4MB+RhtbyefMFfdFcY4snCvEAB7TYzX
         9kyePzGdHnYEpFJ2aKFLKym8AgoNYYb89y+93PLA0y8uF/J2brmMpYy/W5q3Q7Av07Mx
         0JAfA12GJV/ozSKyrkQI8dVVs4Sg3k4Ch/QCw/39xZqjKDsSO91LZPzKsD5pDuHYMqEI
         9Z2g==
X-Forwarded-Encrypted: i=1; AKwUvBzbpsWuyJQKQqMhM7MwxmffWlbJz3nghye7B18OSte6gWPqwzPi1mC8I2zgKLY6ykpff8d1Z3IUuoxLShc=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ4JJupOKGgwjiAfRCKLLoEiBMCacuAj1qKqIiXepoGz/mi0eX
	5+ZhRLksBdRn+RY7I3tMg/unX9vWK6hZ3oOZYJCNdRYkT5m8B00Ij/Q+
X-Gm-Gg: AYBFou07kons1We6P/I8NpKJEgnYwc8mkkAgqgEeEeijt4Kxv74W9x1le+wQ7UGc3ne
	lyR2iomvqwLI8DqqpeMs52QGesnbeicSQmgHWzSla9L90bx3qqpW6B0ZEOTH0R9kzNTW5ei20hy
	X2MZOiuw+hS4LdSqNRwr45EBubmkvHYqJ0NbND0dpRSVcq87FSulIdm0e+Qpo3DL4yduzaYtvTI
	g6RVq2NXNQ47ZNZV+7tQPhbMxSd6Kn4WfEKYbOo4G+duwoaMS0OnjALKO3u8Yqdtclf4iihoZFk
	dSN/t7+eahiwE0K1mQPCdCKjVXXzdQYjnoNZmeYhW/MYLbMog0tTg8QzXCdKYDKg+YixL4xmvuv
	cLyLLwRUCT4pJxYUuSEo1VhH/pyTvZTwIotu//Yaqx/F+yb2KubFg3VHEtJaqyfS6Pyx1sEyu85
	o1ZT0wtOdBQZRd5N3rqpBub6fdQkc8IiVjARGdwEwCLOlcf79DAn8kePaE2cU7JsZfufoYYFvm8
	FhaFPe5YS8cCYsqIZUC388M9Eoml2ISMKPhojjxkjAXIWTf1ONLyQ==
X-Received: by 2002:a05:6a20:430e:b0:3d3:ad3c:49a6 with SMTP id adf61e73a8af0-3db4061f449mr14643678637.20.1789463121439;
        Tue, 15 Sep 2026 02:05:21 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65a8120sm6495512a12.30.2026.09.15.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:05:21 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
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
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	mkchauras@gmail.com,
	ynorov@nvidia.com,
	david@davidgow.net,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH V5 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Tue, 15 Sep 2026 14:34:52 +0530
Message-ID: <20260915090453.1227034-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915090453.1227034-1-mkchauras@gmail.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
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

Refactor _EMIT_BUG_ENTRY to take explicit (bug_entry, trap, file, line, flags)
string arguments via string concatenation. This removes the dependency
on asm operand numbering and makes the labels an explicit argument,
so the caller's intent is visible at the call site and a future caller
using a different label cannot silently produce a wrong bug table entry.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
each call site, so BUG_ENTRY() can still pass sizeof(struct bug_entry)
as an asm operand while ARCH_WARN_ASM can supply its own size string
independently.

Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
convention, indicating that no additional reachability annotation is
needed after a WARN on powerpc.

Reported-by: FUJITA Tomonori <tomo@flapping.org>
Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
Fixes: 73b741adb264 ("rust: Add PowerPC support")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/bug.h | 46 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..bf31ee1e902a 100644
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
+#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"				\
+	#bug_entry ":	.4byte " #trap " - .\n"			\
+	"		.4byte " file " - .\n"			\
+	"		.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
-	".section __bug_table,\"aw\"\n"		\
-	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"				\
+	#bug_entry ":	.4byte " #trap " - .\n"			\
+	"		.short " flags "\n"
 #endif
 
-#define BUG_ENTRY(cond_str, insn, flags, ...)		\
-	__asm__ __volatile__(				\
-		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+#define BUG_ENTRY(cond_str, insn, flags, ...)			\
+	__asm__ __volatile__(					\
+		"1:	" insn "\n"				\
+		_EMIT_BUG_ENTRY(2, 1b, "%0", "%1", "%2")	\
+		".org 2b+%3\n"					\
+		".previous\n"					\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
-		  "i" (flags),				\
-		  "i" (sizeof(struct bug_entry)),	\
+		  "i" (flags),					\
+		  "i" (sizeof(struct bug_entry)),		\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)			\
+		"1:	twi 31, 0, 0\n"				\
+		_EMIT_BUG_ENTRY(2, 1b, file, line, flags)	\
+		".org 2b+" size "\n"				\
+		".previous\n"
+
+#define ARCH_WARN_REACHABLE
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
-- 
2.55.0

