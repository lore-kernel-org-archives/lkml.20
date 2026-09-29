Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25AE3D7A01;
	Tue, 29 Sep 2026 02:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650789; cv=none; b=J73klK0PSGtUalFD/rqCBNChd5lZoKvIZX61Ya/nWBcx5BKdtcv5cYyBj0++0qZ0ZLTmMM+E9UJUGwcKru/niNgm4qbbJPqxGqdu8nseuGAQVNUXVmWiNeNUWHNYsU+hrVb1WYfO5ShknDbXn31W/M7rSeCzJES0qyxS3odWZ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650789; c=relaxed/simple;
	bh=pOld+LWdavPrHVTlTj0acdRz3iSfeLcrDc/zLYHca3Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=fMJ6qLTbSU4NhEdQXIWHUZQZSt3A/7hsUqGmktyIwxRe+2+HZX534m7Iv+25bGcdUgSBs9d/1FdqdLybWxk8uQVH3ec15R36jm8mHjkOtH4iSPxPfZydTgXISBBs//vGPImtV3ZsPZSEs6OfxqLpLvn7yYE83A0z82cN4QCSv/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=igrglF8U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3eVa6jQT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="igrglF8U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3eVa6jQT"
Date: Tue, 29 Sep 2026 02:59:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790650774;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYxQHFoH/O3Z1riPeF8v6D3SoDLHj/W+847rhYGDSdo=;
	b=igrglF8UoCOM+aqriWHQalIQsI6M43Uqjl5znUnRSua0w0PPO5G8a0ieOsYbkUB5x5LAZt
	xk74yHFA9VUr6uzm6mO5l3flcxexyouQ8P9H/XOUe+iYNZltmJ7jC8zb24hkPMdN0EP0jz
	0kU1ILTWV2YlwaJ4ghaS3SWrPMvRJdIdkBGOfHEeCAJXxNXllDeOiV8UPNx7Hl8GCgUu7N
	qOai8dw7TEMV3sam4OulgAEXpseR6Fgt54x3oWXPukueWFAkXUKGwjgI2iyUr/jXBykga0
	FxcSYumh/xbIgcjizNz0TY9u0kuXJNhDDlS4yHYCvJW2DI+1tklMXwgG+oWNgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790650774;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYxQHFoH/O3Z1riPeF8v6D3SoDLHj/W+847rhYGDSdo=;
	b=3eVa6jQTIQn0qQBEeqeftQoklZssDuZfSJGxv37KnUjSj30BTDlC0xIM8ljS0GtcqO+YCT
	T6kPgSPoySHPdjBw==
From: "tip-bot2 for Ard Biesheuvel" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/tdx: Share tdx_panic() with the EFI stub
Cc: Ard Biesheuvel <ardb@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925075137.44298-6-ardb@kernel.org>
References: <20260925075137.44298-6-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179065077287.3910103.16477447153352456973.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     0ffdb6c1ea44ddb40794b9c20a39b8fb30551875
Gitweb:        https://git.kernel.org/tip/0ffdb6c1ea44ddb40794b9c20a39b8fb305=
51875
Author:        Ard Biesheuvel <ardb@kernel.org>
AuthorDate:    Fri, 25 Sep 2026 09:51:39 +02:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 28 Sep 2026 15:07:42 -07:00

x86/tdx: Share tdx_panic() with the EFI stub

Move the implementation of tdx_panic() into the source file that is
shared with the decompressor and the EFI stub.

Use memcpy() and strnlen() instead of strtomem_pad(), as the latter does
not exist in the early boot code. Avoid fortify instrumentation in the
decompressor/EFI stub by defining __NO_FORTIFY before including
tdx-shared.c

Note that __tdx_hypercall() may call __tdx_hypercall_failed() if the
hypercall returns with an error (while it should never return to begin
with). __tdx_hypercall_failed() calls the decompressor's error()
routine, which prints a message and then loops forever.

When called from the EFI stub, this error() call may attempt to use port
I/O to the default serial port rather than the TDX hypercalls which the
decompressor uses normally to print diagnostics to the console, but this
is fine: given that this situation only occurs after a catastrophic
error, and a subsequent spurious return from tdx_panic(), whether
error() uses port I/O or not is rather moot at that point, as long as it
never returns.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Link: https://patch.msgid.link/20260925075137.44298-6-ardb@kernel.org
---
 arch/x86/boot/compressed/tdx-shared.c |  2 +-
 arch/x86/coco/tdx/tdx-shared.c        | 31 +++++++++++++++++++++++-
 arch/x86/coco/tdx/tdx.c               | 35 +--------------------------
 arch/x86/include/asm/shared/tdx.h     |  1 +-
 4 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/arch/x86/boot/compressed/tdx-shared.c b/arch/x86/boot/compressed=
/tdx-shared.c
index 5ac4376..dc38047 100644
--- a/arch/x86/boot/compressed/tdx-shared.c
+++ b/arch/x86/boot/compressed/tdx-shared.c
@@ -1,2 +1,4 @@
+#define __NO_FORTIFY
+
 #include "error.h"
 #include "../../coco/tdx/tdx-shared.c"
diff --git a/arch/x86/coco/tdx/tdx-shared.c b/arch/x86/coco/tdx/tdx-shared.c
index 1655aa5..29661d8 100644
--- a/arch/x86/coco/tdx/tdx-shared.c
+++ b/arch/x86/coco/tdx/tdx-shared.c
@@ -89,3 +89,34 @@ noinstr u64 __tdx_hypercall(struct tdx_module_args *args)
 	/* TDVMCALL leaf return code is in R10 */
 	return args->r10;
 }
+
+void __noreturn tdx_panic(const char *msg)
+{
+	struct tdx_module_args args =3D {
+		.r10 =3D TDX_HYPERCALL_STANDARD,
+		.r11 =3D TDVMCALL_REPORT_FATAL_ERROR,
+		.r12 =3D 0, /* Error code: 0 is Panic */
+	};
+	/* Define register order according to the GHCI */
+	struct { u64 r14, r15, rbx, rdi, rsi, r8, r9, rdx; } message =3D {};
+
+	/* VMM assumes '\0' in byte 65, if the message took all 64 bytes */
+	memcpy(&message, msg, strnlen(msg, sizeof(message)));
+
+	args.r8  =3D message.r8;
+	args.r9  =3D message.r9;
+	args.r14 =3D message.r14;
+	args.r15 =3D message.r15;
+	args.rdi =3D message.rdi;
+	args.rsi =3D message.rsi;
+	args.rbx =3D message.rbx;
+	args.rdx =3D message.rdx;
+
+	/*
+	 * This hypercall should never return and it is not safe
+	 * to keep the guest running. Call it forever if it
+	 * happens to return.
+	 */
+	while (1)
+		__tdx_hypercall(&args);
+}
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a63..a9a16d0 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -198,41 +198,6 @@ u64 tdx_hcall_get_quote(u8 *buf, size_t size)
 }
 EXPORT_SYMBOL_GPL(tdx_hcall_get_quote);
=20
-static void __noreturn tdx_panic(const char *msg)
-{
-	struct tdx_module_args args =3D {
-		.r10 =3D TDX_HYPERCALL_STANDARD,
-		.r11 =3D TDVMCALL_REPORT_FATAL_ERROR,
-		.r12 =3D 0, /* Error code: 0 is Panic */
-	};
-	union {
-		/* Define register order according to the GHCI */
-		struct { u64 r14, r15, rbx, rdi, rsi, r8, r9, rdx; };
-
-		char bytes[64] __nonstring;
-	} message;
-
-	/* VMM assumes '\0' in byte 65, if the message took all 64 bytes */
-	strtomem_pad(message.bytes, msg, '\0');
-
-	args.r8  =3D message.r8;
-	args.r9  =3D message.r9;
-	args.r14 =3D message.r14;
-	args.r15 =3D message.r15;
-	args.rdi =3D message.rdi;
-	args.rsi =3D message.rsi;
-	args.rbx =3D message.rbx;
-	args.rdx =3D message.rdx;
-
-	/*
-	 * This hypercall should never return and it is not safe
-	 * to keep the guest running. Call it forever if it
-	 * happens to return.
-	 */
-	while (1)
-		__tdx_hypercall(&args);
-}
-
 /*
  * The kernel cannot handle #VEs when accessing normal kernel memory. Ensure
  * that no #VE will be delivered for accesses to TD-private memory.
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/=
tdx.h
index f20e91d..e578525 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -171,6 +171,7 @@ static inline u64 _tdx_hypercall(u64 fn, u64 r12, u64 r13=
, u64 r14, u64 r15)
 	return __tdx_hypercall(&args);
 }
=20
+void __noreturn tdx_panic(const char *msg);
=20
 /* Called from __tdx_hypercall() for unrecoverable failure */
 void __noreturn __tdx_hypercall_failed(void);
