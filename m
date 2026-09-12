Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29EC36B05C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196374; cv=none; b=JpSGiZGDHQbg4dIGJDtn+H6gFNI8h0BoEr0AOdsbnRyZXEMMV2rFnANymkWfUplkC3cLDo8J2f3ht7H3hQBDCNbTk8L3V1NO7hBOeGN0ZNViIaAE/Aj+s8MfFQ/FdMsDLW9GXe2iyUf65rTSYIXre6fKWcsftLPcOHvK9PK4n64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196374; c=relaxed/simple;
	bh=z1KffmHhzElZTDIuvQTwdNMYv2soVYtneJDRupzDxGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luHBIv/S5Q/cVOKY7YZTGpWneFvfctasKmNrPNKPx6LMwbMzSbzrUqdUg+BwV88sInZ0OyD1AX1Zl8OL9FrIJi6dTKBpxl9nPz8Slzgxc/E0OiMavx+CGvNdU/dVABJgKRYntgScrRYQaYBgj14w3BQFaBBoLrW6GHv2JznukHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkPMmtFV; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkPMmtFV"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8abdfso217433a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196372; x=1789801172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3JbySDrX7Qe3HLCVmAQbpZ/Bcq5FNjxxg9MbzFzoSM=;
        b=bkPMmtFVTlBhA+k0mmRll1DIo0LSzrLL7B6h+JoN7byE6p+F3Qy6Y75NkxLhdRylIf
         TYDr/ufXpsz1c2pZzQCY4s+VJlG6G/rt6xTPT2hSuEwJ1fErKv0dTPRO2bswY7ILMLeM
         OOAUD+sFOIrXAMDgDg/UjxvC2bkmyTzE1EM250S8CNwYWnl1GQN74e9xn2H1ZrSenq7p
         KXTvrgi7SkBjBUTltG7Y5fYmCokRAgprduRewqAdCAn6ahVfVpR0yBE3ABWSzyWlNQv+
         26qLTjWozwc9JUkXRWmTvy5EKNMQygzg+iXcZaTumgJIrXwlepjp0oNUhYf29aI/I3ve
         ik8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196372; x=1789801172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3JbySDrX7Qe3HLCVmAQbpZ/Bcq5FNjxxg9MbzFzoSM=;
        b=qw610087z3Nvp8XnaX7fx1cUn7i4A/49BOH/id9J7MyZmC+cYy0CKUlthQnW33WMQE
         zklVQ3PnomWr2xp3Irq9pRM3gyGKRlptJm9w7qk1fDf7RfpqDYhWfhk9PbSNmmbEz4iN
         u0q+WIoogBn28e9BPPpIg1ILIAwOHIgUsY77lf+zFWdYy4d8CAWvGYReny3jsWUfD7MT
         TMLV2eeGA6/8LXWDuFQR6k+D03wRoHfzEu92s7p/7UIoTIkfUo8b/wf9Ejn+QEwz98A3
         nkBzcFxwo6mHaXJQ6Dt+p0ejUo2kzvN3s+KRBRN+xLDVEwhtxbORXJz25UlzYUJN0Kma
         H0wA==
X-Forwarded-Encrypted: i=1; AKwUvBx8j2qokL6bLTgrpS7lppyItT98laEnNBsxzn48PxiVKBt1/4dJOwfVFOfMThAKs23U7GH8+mADadOkBZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nidC9o+FsPLGBvdiM905gdPPskNpw4Ec1YDkD2GrU0ni3ApBgG
	YRrHwGvzTziyYn/7THLTJ25ao6pTCEqKNapD64WZLcd1I2NWnRA20GkA
X-Gm-Gg: AYBFou24uuCkP9Nl4IDqezxiTqcM6GDnpi1j0yiCi9m1il/HANBCLTFYehE6zKXm1dw
	4q3v1ZhTVOpOhRjoVnLIcFKAjxpdUkIazwvPWgPczRmszhJfUsSL09AeQ5ywkIVBoZIye+4sx5L
	O7Pru7DGMR5TTwQdmkyKnT2bzrWhZCtI8A8eDoCzmMwf0qLT3xJt4Bkad/mjTfQqUi4V92vK//T
	hP3OKELmetxw/s4l3MaAhsOeIp3bXcWD08pZc4MKqciL4Mq5BKVN8se9jyTLi4E0ikrp2LXimVz
	YxSrFwj5kY1b/IsnXm/BrYDUoXMoJRR+IZtBUfNM8iM/JdSlswJhqQEBxHTr2RZZLkQxSA8lEHT
	uo5GmhGGsyqNfmHQli6qJ64AjvxQnwCXVIePIKGEB6ImHGS6IhrKLk0UWeI9KlQC+K3fWUbKXLP
	drrlL8Ind/+xIo909mBYO75PFl1SmxsuGQ/o2/q76B+9YziLvxTlGyqxhsTNM9hxE4QyQNlEkKe
	uVQWKp974kOlUQSVUo3NSTwEJ8Bwt7uJasM8iHFt3sgAw==
X-Received: by 2002:a05:6a20:cc8e:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3db0e40edbamr3056849637.17.1789196372133;
        Fri, 11 Sep 2026 23:59:32 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm10777777c88.8.2026.09.11.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:31 -0700 (PDT)
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
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH v4 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Sat, 12 Sep 2026 12:29:01 +0530
Message-ID: <20260912065902.24017-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912065902.24017-1-mkchauras@gmail.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
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
 arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..6f0f652d9348 100644
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
+	"2:	.4byte " #label " - .\n"		\
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
+	"2:	.4byte " #label " - .\n"		\
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY(1b, "%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY(1b, file, line, flags)	\
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

