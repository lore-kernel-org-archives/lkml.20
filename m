Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D70D491595
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055809; cv=none; b=hkMqKxPxxd4BG1WsE9KSje2EDUaVpJJKSdmZj1I04AtKzAzrYKG7C3EfwI7oJ2eoGCfXpsgxVh4nbki7mrKDU1KZJjQgcKc1HxvD9isx9M6VHf0aeIA+yDjwbM6H04GPtE+BgQm7PbQsoeqtu7ztRVtGLFR0RicusrPaNKtCBXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055809; c=relaxed/simple;
	bh=MZq49wkKC99qRijao2kJ8eNB7vvCF15cZ22HbUR9zJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bbJ2IE4DV8ZU9N7uenfpiCoCWC4Vv9wJlXG3xt7/cwcM/A4idRn+TCT6xOcgK77zrSsSU2dNXaQoA27z/aUcF00n6wT6pUPpaS87awbRjZ4Gi8t62k0D9rszTeOGkHaRZcSA/uvuog/1lYv0aoiJKj9FQ/ow5PoXPzyGoD1yuvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONdvYFs4; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONdvYFs4"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so3279146a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790055805; x=1790660605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aI8dvVPU2tEhTtS2QxSNBjEg+bGkrZOYEQeAhVqGoaM=;
        b=ONdvYFs4BJOlYvhn3jRHjAr0QNUEO1/mMjyoIffHUhjK1QD8gbl0zu0+gPaqyqdK6q
         FJPtPXN1jhnMhf3LgoiaQ0Q06KUHNrJSdfIWI6Z4RsD1iuO1RYnBxN+FfmXhwzIPgGUc
         Wld2cVqGuD3RoZkYQsoHOsXbbP6AvEfVJN74OsqjTOvdA30oHVf+HQFu/0u5Z2gmhJ9y
         JSGAXr2Y1i5UtkkfkksQADx6SDWVOpngoa49vTpcdziQIUKvvZZuQG2PqeFEEPHNZm4g
         tGt657HRyntcd1stlzjubaF8aYt7ayLOoMFZu46MctXyG/HRUEJSpcVJh6jO9gS8d5Dy
         LAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055805; x=1790660605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aI8dvVPU2tEhTtS2QxSNBjEg+bGkrZOYEQeAhVqGoaM=;
        b=OSstOji+AN3ZxnlzAWMIU89g0rGhRTQryBokxnRNdK8aQ+rGNTocAYEezUoiHYjRNc
         vA+vRHApHX4VrbKlCJqh/8chh62kqTFc35oNYECw6eR4yDHfNKhYlWSWTsZkFM2mBM07
         h3MbfJ5LStwKalTm3eRIwAlq9edUwI3e/Ti0KR57/9zSmwE0+4HfHGxx20OjzSClfaxP
         HxAHvpZ0AQ2C1TlF85kodLVxRzmgQik9mvh0biZV2m5U+1fafd45PhMV6+b6UwO9WrBK
         c7D9kQSSoRhut6G7GyJDZEJJH3PjbNkBAhe6y+Wi8vA/BmZqsDQxhIpQD+pIRMDfd/zi
         x1qA==
X-Forwarded-Encrypted: i=1; AKwUvByi6m7SD5F9nzMO053d5FnPuxHgWMKx7kcdw4n3yip5OwYG9mVyQA53R2GKFZLFdkkOci0Er4M07uSYpM4=@vger.kernel.org
X-Gm-Message-State: AFuF++lA059guxNXf3Tmku6zFOBkizooLZL4zn5kChUX31txBuTqhhxB
	IK3hYfoyJ88W/05vv1f/kfNE97f728vMKST2xg/VR9mYpY9oqttrkl5E
X-Gm-Gg: AYBFou2mIDOWk5gHgqeDOFO4nIqIdNz7FJ8a16Lr4w9RFNRYMQSgCKZlhmXE3rn19ir
	iU/OlorY+jJubKKopS5WKsgsd/K4dnZsqPtM3jHUScFOwC+ehSxQfvA/AkOtCAV8gKQAaJlaiBA
	FjFwBPWxdbYLvPA42x6JUpk6ihXW+SfeqxK/GZI460Tr9yrpP2/yLYQNov+F5hdM1JfMWBcxZdb
	2eo1vEXGbufehvtAxY5rf+ZPnd14BaXD1T/IvRReK5SipKQhiSRy63imvwVAMVk729Bnrai5nqO
	3yBXcyv96UPxyA5G6M1g/WmZ7VAY+IKhnxd7/Uvi0rbma446lK1dhESUwfFD8OkqO3CETogsK5K
	Di3Kq3Un19pg4oL7eJyX/4AvLOUcfaN1a/Rp5mMqW763Vp8sTlcx944ysFknUDXzBDBzX1btL0/
	PJL5MaY1ouPfeV69FqA5CXmXh/94VsnB1AclYIDc97RIuhoVclMbFbamYCHWkraJ7Yfue4UzCB9
	Ir8UAWzkULW+rzahHnP/PnLAGrzKBk5XNRq89Y3aX7Io3Akbfnl
X-Received: by 2002:a17:90b:35c3:b0:39e:6c69:9b8c with SMTP id 98e67ed59e1d1-3a073226d79mr77215a91.49.1790055804607;
        Mon, 21 Sep 2026 22:43:24 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129a33esm2426272eec.14.2026.09.21.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:43:24 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
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
	rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH V6] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Tue, 22 Sep 2026 11:13:11 +0530
Message-ID: <20260922054311.906816-1-mkchauras@gmail.com>
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
Changelog:
V5 -> V6:
 - Dropped KUit tests from this series. It will be sent separately.
V5: https://lore.kernel.org/all/20260915090453.1227034-1-mkchauras@gmail.com/

V4 -> V5:
 - Fixed a build error with DEBUG_BUGVERBOSE=n
 - Added a label for bug entry
V4: https://lore.kernel.org/all/20260912065902.24017-1-mkchauras@gmail.com/

V3 -> V4:
 - Fix Label with appending b at end
 - Add KUnit test patch
 - Tested on ppc64le pseries: pass:5 fail:0 skip:0
 - Tested on ppc32 QEMU mac99 G4: pass:5 fail:0 skip:0
 - Tested on ppc64le QEMU pseries: pass:5 fail:0 skip:0
V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com

V2 -> V3:
 - Add label argument in _EMIT_BUG_ENTRY
V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com

V1 -> V2:
 - commit message now has error, fixes tag and closes tag
V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com

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

