Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890122;
	b=kLt8ieg//bPqGdBj2YlFHF721DT9qTraTqbi7rGmj/VwzWRa5+QYt6Tmdt79XkodgbOR
	 5OwGf+q4Xt7BhYbcGTC2aL6aAXBnl8fZUUoZW5dr54mijDIZhEosgdu14OQfzluJRh7Vl
	 g7vf2OsqVJBRxW23+4F80S5UpPUlBC9gVrGqsMXNa3OhbJftcDRmefmTk9tJd8ioLuEKR
	 j46lryu6VeX3oqvPOxTCE4U0DK0qdV1HiMa0+uBBXGxyAxD2znk7pYNHo2XIXEK5970v8
	 QjofQrTfcl9vh1JOmeg8eaUHz/PTDbavk0AqIsyHGv+IkGlGNL+PNCH1R3Wimvu0Kfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vDuDdRL8iZneo/phC8IWAHFDoAthrBkjX6kaJXJOz94=;
	b=NdFiGHh0aR9rmT40NhaIlSXu8s1b0qKqrPDpbcnTPM9obcke6i3mXx6uxM/XvYHkA5wy
	 ud717nUHkcQuWSJSfI+MCrFG0X4RB9iaMpmqJ/jYiaWh/4D6MUozgoMCxOEHXaST+5JuY
	 eM56+4xzFQyhHEjc6lR8lPK6lmF+uHA+dXTTqjikygxGVRTLwBqJmpd4YgQ3qftK97ZzA
	 d7gODgNZAfwvajTrsYCFWIAz88dayCHKHEqx/olfXvQs1Y9EYqkIAP8gyCDbOrnvlosec
	 ThENX9cfrft6snAMYU1g+BUVHhzUzUXhgspRA4yt5xIg+KgUcZZYekz/kxJ3PN97sVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SP+W2Lfk;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E1960A381B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E1960A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SP+W2Lfk
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08be1c84so64924425ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890122; x=1795494922; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDuDdRL8iZneo/phC8IWAHFDoAthrBkjX6kaJXJOz94=;
        b=SP+W2LfkrNnx1jjN1YNt85F6BWfWujzUbmezApdaGbnymMtHckzkHgEeMcGL6xU8h1
         nD6R3fyN/x1rYwdbf4MAqKbtXEEaEmvXvDpWHPEGH3/bk+OX6xV8DF2LigTbmgUbUPb0
         r1dE0YwMPw7w1SKCVJ727fHAREoHGUBOGBZWsVnjYzEPGQ31Nn61uqXpHcoAhbLg9WUE
         KzEwoZTL9etEHuGkwJzVXhuF4ls/afNviCViuQngeDFWeKRszizOxBwX9oN1ngT37jyK
         R4RVV0MG/lW9MQYke19cs3iDXlRvJtstT9NhsOAhnCWYYYvYtdLp4kTN72OdXE61KzQk
         uvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890122; x=1795494922;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDuDdRL8iZneo/phC8IWAHFDoAthrBkjX6kaJXJOz94=;
        b=v9FO76XtiH5+1Y89ML4FTwl6l13CoYAkzD/KXP0e4elObbbaIbTTILEIA6D2UMLvBb
         Z/cSd43DVWPoLxERhta8+zX0p5EXhGGo0pWC1xa6GqSMB4KuEzNhW17rayG/VtIMP36o
         jSMlsoiKROUDExtkLIa5wYmBJC7Vndh0uqt0y3oPIpdYcteUTvTsc6gD89//B0uWBMte
         xnf4rJBW/HmBoGmwU7/y4B2IAEFPiVBSmXYqqnxGMvYEq5QXEMA3srXFE8+/+UNOVQ2o
         qqaECaldldMbmVhBo3aY64SiZMtEf/A8TQl6Y6LHCiSkQW+zK/NWS7G7Hx0W9jUWZk7Q
         /CYg==
X-Forwarded-Encrypted: i=1; AL+hErF4h3GzvY+2/qwUEZWPdCkY96PpzAApIXPSj9vMn62AMsi9EvIXvIQUdL8xx8imr5xGgMy81CCXgDSBgok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZQRveJo7aQtRdSkYbNma+eYGz3wsPW4tWRcoD45PRUvaej+hx
	ICUElyDr8YiFcOwLKgaUne1lAzwOSApNehAFvAjDekIW8hRy6Tmgw0tMSSVmSRq1ZTyCl2JKFfW
	2Q3wSrfrBcxd9Xs5HoWFWZUZqXA==
X-Received: from plgn9.prod.google.com ([2002:a17:902:f609:b0:2df:4aa4:16d0])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:f8d:b0:2e9:5507:b52c with SMTP id d9443c01a7336-2ee0de03f7dmr125521225ad.34.1794890121819;
 Mon, 16 Nov 2026 20:35:21 -0800 (PST)
Date: Tue, 17 Nov 2026 04:35:02 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-11-dylanbhatch@google.com>
Subject: [RFC PATCH 10/12] arm64: entry: add unwind info for call_on_irq_stack()
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Weinan Liu <wnliu@google.com>

DWARF CFI (Call Frame Information) specifies how to recover the return
address and callee-saved registers at each PC in a given function.
Compilers are able to generate the CFI annotations when they compile
the code to assembly language. For handcrafted assembly, we need to
annotate them by hand.

Frame pointers alone are usually sufficient to recover stack frames
(without CFI), except at the exception boundary, where more information
is needed to determine if the LR is live.

Since an exception can be taken from call_on_irq_stack(), annotate it
with CFI. The actual entry assembly functions are left untouched, since
they are not expected to take exceptions themselves.

Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/entry.S | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 8d17f61d1b5b2..aae27ccc0f2c1 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -30,6 +30,13 @@
 #include <asm/asm-uaccess.h>
 #include <asm/unistd.h>
 
+#ifndef CONFIG_UNWIND_TABLES
+/*
+ * Do not generate .eh_frame unless CONFIG_UNWIND_TABLES is enabled.
+ */
+	.cfi_sections .debug_frame
+#endif
+
 	.macro	clear_gp_regs
 	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
 	mov	x\n, xzr
@@ -880,8 +887,11 @@ NOKPROBE(ret_from_fork)
  * 		          void (*func)(struct pt_regs *));
  *
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
+ * Open-code SYM_FUNC_START() so .cfi_startproc precedes the BTI landing pad.
  */
-SYM_FUNC_START(call_on_irq_stack)
+SYM_START(call_on_irq_stack, SYM_L_GLOBAL, SYM_A_ALIGN)
+	.cfi_startproc
+	bti	c
 	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
@@ -892,6 +902,9 @@ SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save our LR and SP (implicit in FP) */
 	stp	x29, x30, [sp, #-16]!
 	mov	x29, sp
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	ldr_this_cpu x16, irq_stack_ptr, x17
 
@@ -907,9 +920,13 @@ SYM_FUNC_START(call_on_irq_stack)
 	 */
 	mov	sp, x29
 	ldp	x29, x30, [sp], #16
+	.cfi_restore 29
+	.cfi_restore 30
+	.cfi_def_cfa 31, 0
 	scs_load_current
 	restore_irq x9
 	ret
+	.cfi_endproc
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
 
-- 
2.56.0.679.gc527c65306-goog

