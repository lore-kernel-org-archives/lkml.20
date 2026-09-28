Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B684EB876;
	Mon, 28 Sep 2026 19:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622942; cv=none; b=G30OKlI38qj5D5mvROpYgL+H4WfwgMzi+WM+BeDsvSTPzc+jEzQo68zLr4w13xgEUetNX8w4t0QMn31b1OWDs1CDNdfB3opGW9SXZ+RmE+dMzamPXwAnNcQTm1BinSCfTMY2eb212x71ihrn03K7I61BjzbMrVyuyAqH390kE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622942; c=relaxed/simple;
	bh=puqMg1sTaFj/Bsh7B+dlZfWlRdP87GEJpVuSjxj4Jq4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XXdB1rBUzmVnyp4rQ9401oT+5yiL8EG2Gfq8h5h6Ezvjip+lFzoNqFRlVoblF/dB02+nM9Za3kYBW3WUvv5ND9uE/BgCghd95pOTuTcaSdikYnFfRMkcewJ4jBjorGPSoZb6yt/xGCRB2UQrqt+WkewIF7drWfimBOi/ksNcOVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HuKZ7ocI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n/SaJfiy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HuKZ7ocI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n/SaJfiy"
Date: Mon, 28 Sep 2026 19:15:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790622938;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xh3djANS6QZdIIa9maXKS8rDvXhbh+b5OB4Sb1sWRTY=;
	b=HuKZ7ocI86o4wK3K6KEyyL3mVAX99QuA8ga0nX7sUaNRefQh+luHjMryrWZMrpIAg+i0zP
	kSCLdGCr+iCA+Vo/IbAJgrj26dWM33CE3Enj1y96rD398pbBWSFIBKgJQhDfIdnqJLvVeE
	kufw1PtkRPZTNrnrpHUF/Ew120CZ8yMD+OFJLVQ6CfF34O6RpuzZbwXUMxAbn2loRM25TS
	UNoFvNYtC6D9bBahNo2cOf3igGDZdUnv+nYtopRDvRYpcQvO3cNX257klQ8M0ASrVDEqZ2
	Tf3hi1u6q2mzutSviDWIOuR0w+cQKhutejSOzDKwMDDX6NM3cVSYZ/KflCOKMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790622938;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xh3djANS6QZdIIa9maXKS8rDvXhbh+b5OB4Sb1sWRTY=;
	b=n/SaJfiyZlC+gUfg5XMc7CZMV2vcEKf+V8QdD7XpR6rdowhNaoBZpX5FDu/Jd9JiM6CR5g
	/bYOZ76Ez+xQEmDw==
From: "tip-bot2 for Nick Desaulniers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] {x86,um}/uapi/ptrace: Guard register offset macros
 with __ASSEMBLER__ or __FRAME_OFFSETS
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Oleg Nesterov <oleg@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Elliott Hughes <enh@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179062293624.3910103.15499265591348988384.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     a661c34fe693c8f9ef29b45ee71cfa1fe593502b
Gitweb:        https://git.kernel.org/tip/a661c34fe693c8f9ef29b45ee71cfa1fe59=
3502b
Author:        Nick Desaulniers <ndesaulniers@google.com>
AuthorDate:    Fri, 21 Aug 2026 15:45:42 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 28 Sep 2026 12:11:19 -07:00

{x86,um}/uapi/ptrace: Guard register offset macros with __ASSEMBLER__ or __FR=
AME_OFFSETS

The register offset macros in <asm/ptrace-abi.h> are guarded by
`defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
were left unguarded for 32-bit. This causes havoc for userspace that
happens to use identifiers colliding with these short macro names
(e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
userspace is forced to be super extra careful with include ordering to
minimize the chance of collision.

Wrap both the 32-bit and 64-bit register definitions under
`#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.

Closes: https://github.com/llvm/llvm-project/issues/217413
Assisted-by: LLM
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Johannes Berg <johannes@sipsolutions.net>
Tested-by: Elliott Hughes <enh@google.com>
Link: https://patch.msgid.link/20260821-ptrace_uapi-v1-1-3de8638a29f2@google.=
com
---
 arch/x86/include/uapi/asm/ptrace-abi.h | 4 ++--
 arch/x86/um/asm/ptrace.h               | 4 +---
 arch/x86/um/ptrace_32.c                | 1 +
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/ptrace-abi.h b/arch/x86/include/uapi/a=
sm/ptrace-abi.h
index 5823584..3656955 100644
--- a/arch/x86/include/uapi/asm/ptrace-abi.h
+++ b/arch/x86/include/uapi/asm/ptrace-abi.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_X86_PTRACE_ABI_H
 #define _ASM_X86_PTRACE_ABI_H
=20
+#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
 #ifdef __i386__
=20
 #define EBX 0
@@ -25,7 +26,6 @@
=20
 #else /* __i386__ */
=20
-#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
 /*
  * C ABI says these regs are callee-preserved. They aren't saved on kernel e=
ntry
  * unless syscall needs a complete, fully filled "struct pt_regs".
@@ -57,12 +57,12 @@
 #define EFLAGS 144
 #define RSP 152
 #define SS 160
-#endif /* __ASSEMBLER__ */
=20
 /* top of stack page */
 #define FRAME_SIZE 168
=20
 #endif /* !__i386__ */
+#endif /* defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS) */
=20
 /* Arbitrarily choose the same ptrace numbers as used by the Sparc code. */
 #define PTRACE_GETREGS            12
diff --git a/arch/x86/um/asm/ptrace.h b/arch/x86/um/asm/ptrace.h
index 2641d28..439c415 100644
--- a/arch/x86/um/asm/ptrace.h
+++ b/arch/x86/um/asm/ptrace.h
@@ -13,9 +13,7 @@ enum {
 };
=20
 #include <linux/compiler.h>
-#ifndef CONFIG_X86_32
-#define __FRAME_OFFSETS /* Needed to get the R* macros */
-#endif
+#define __FRAME_OFFSETS /* Needed to get the register macros */
 #include <asm/ptrace-generic.h>
=20
 #define user_mode(r) UPT_IS_USER(&(r)->regs)
diff --git a/arch/x86/um/ptrace_32.c b/arch/x86/um/ptrace_32.c
index 3af3cb8..9e9155b 100644
--- a/arch/x86/um/ptrace_32.c
+++ b/arch/x86/um/ptrace_32.c
@@ -7,6 +7,7 @@
 #include <linux/sched.h>
 #include <linux/uaccess.h>
 #include <linux/regset.h>
+#define __FRAME_OFFSETS
 #include <asm/ptrace-abi.h>
 #include <registers.h>
 #include <skas.h>
