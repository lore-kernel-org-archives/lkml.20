Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F294A2A76
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373457; cv=none; b=DYMCXPxElEZlgYPHAAuxAPdSGjAi/LcPviQ3ldIUS23vikdrWm/ffX8G+/He935qJh7eJmrlE/CnIogCMwGxQqaMz7VI0r8/UrcV0NZ68ZTA/ANOqgL/9N8UDhuraoetHkkNEnVN7FxfZLufcHRvH/FdN82//+ADz2g3ZpiCvbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373457; c=relaxed/simple;
	bh=9otGNsuAvu+C9nOqBLqYzUvRo5+HMUNzJSPIQKaiCow=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HUtrXQHh+aqeARUlzasEDSK+q00FvmHfGVyFjYueoLPnGa8fPjOqIjQC+mGRTvXa1WdmZtMRftJpzrHO3pRHvLJEcEucVxaunrDZ6vuk1wd5FhG3OREtYCEyp2s5RklvM4oG5eOjvpRhFy6Ro84sKTW/f+9+TldPDNDy9JIZSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ish0aGPZ; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ish0aGPZ"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-887c99013edso2817899b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373443; x=1791978243; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l81J79D4i1POsrCPf+Pwq64LjZ2oqmV8MJetLifQiQs=;
        b=ish0aGPZwlOWsElTfmXU8aZ4rZPZahdm6rN8mJ931D7akbKCMVZ3a4dALUC7pKZktH
         MnnXVmXYgwHDs4UK+0ZTittRklGBXSCHoNGb10lojQ9c/Z/jGCbUgjpKSK+2vbRvfqnR
         ELIFu40MynISwGTzGsZVmiLz4KN6SgneHD8ZSt526vMsurk9AYmQXwg8c9YujvQVGymK
         LJIKIB6AZbq38IN1dQ3RQdsfZBQQ9Nz9ADbRSnKtB6OQU/EP6ednQYCavdzEFAEThY6P
         0EzMTM5G8z73LLbNPXo9GnB5Cp47DVwmOkXTSo4XN5uO0oORs2EphRigVAi9nwq9umTb
         nTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373443; x=1791978243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l81J79D4i1POsrCPf+Pwq64LjZ2oqmV8MJetLifQiQs=;
        b=CZO1CNzE5OmJR2FQd8zEDcio50Ann1qJxI0Wdfm2SklXUYuVp6gaUAJ/AJltQLpFfb
         uEbRyO1UfMpXOzcN/IlXCUu8Eatzl/AZrA2TF+47q/Jp9jclWcHykHH33Xl8J59mAcY7
         d0bEb1IF+cZkzob2ORe+AiQlLfFJOEsmY4dSVNUlzalm4mIs3GxtDRltyA97KTxvQ5Q0
         Bvh5InH2IgLBxbE1LUpRQV6OpIPeccMognrbsfKLcOPdn66dDIavEF1YmBpgUkkHgzT/
         ptDNCG0xpNWQAFv4unSVxVBm2WhtJ73ag/AYuvPjBnPDWw4NM9FV0LAMHVV6hkOEU5hf
         jAfA==
X-Forwarded-Encrypted: i=1; AKwUvBxS/gONVauwoC7iY8ISpKu4hR8k7oyjdgzJpOFgboYcUZt2rDbxMdrhs6abP93ugoflUIatfbegNFG67CU=@vger.kernel.org
X-Gm-Message-State: AFuF++k1CRTIgsjrMSYJIDvvUe7FMBOiHz+TrJTDKC+sahh6Rkv0Aks/
	yx9cJXgXFDbGz/JLnlI8il+g3ctDAPRxfrRZ7SzunA0BgzlCQaa1eAuEiJJD8tyVWcFdw4nOc6G
	XHl11kw9hLEbaKRZJ+C4mUQqFiw==
X-Received: from pfbfs11.prod.google.com ([2002:a05:6a00:818b:b0:880:3605:84e5])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2995:b0:878:3507:8d5e with SMTP id d2e1a72fcca58-891b48f75edmr1559429b3a.37.1791373442790;
 Wed, 07 Oct 2026 04:44:02 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:33 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-10-dylanbhatch@google.com>
Subject: [PATCH v8 09/11] arm64: entry: add unwind info for call_on_irq_stack()
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
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
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/entry.S | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f63049ac32dc6..3703acbeb16a5 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -30,6 +30,12 @@
 #include <asm/asm-uaccess.h>
 #include <asm/unistd.h>
 
+/*
+ * Do not generate .eh_frame.  Only generate .debug_frame and optionally
+ * .sframe (via assembler option --gsframe[-N]).
+ */
+	.cfi_sections .debug_frame
+
 	.macro	clear_gp_regs
 	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
 	mov	x\n, xzr
@@ -866,6 +872,7 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
+	.cfi_startproc
 	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
@@ -876,6 +883,9 @@ SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save our LR and SP (implicit in FP) */
 	stp	x29, x30, [sp, #-16]!
 	mov	x29, sp
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	ldr_this_cpu x16, irq_stack_ptr, x17
 
@@ -891,9 +901,13 @@ SYM_FUNC_START(call_on_irq_stack)
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
2.56.0.360.g66cac248cb-goog

