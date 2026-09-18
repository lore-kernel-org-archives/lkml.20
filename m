Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3775E407CD0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771341; cv=none; b=NVmHqMF5VNkIZacqV61/c/+8AtyTBd9qzrxWqslsYrGDU8R80kE1hucTGFbE9JI+1dbH2RMzHwInmW6+Z9jckKDsfTxIjccKzR0l4m70HJPMbLVYf1NvxRfqzI3c5JtBtR6BHRRN3c4oFJKKrXRQfhJWl8FCrBhJLNy2IxfW35Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771341; c=relaxed/simple;
	bh=0Sts79fqaxmt9c1E05J5rCucrXkE/ddG+pevHVmB4Go=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gqK1637/GIqKyYfbQ9daWr0+pjHSSIgmh2hlrezqjXE3ZKsyC40N+g5XSDp3+uk6vFyzKNe/S3EAXt5xd3Rwu+TRrt4fnJqK/0XUAlfhd8ejHbmuw6KwIXrVISJVnqBrDn3hMYq8Dlyn9HWQ6ygLe+Z9Z4wZk3BtCsHXo3/VJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HBQr4OGn; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HBQr4OGn"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so1100839a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771339; x=1790376139; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piXxKwae9uzBpYIu/Zn6s/3PXKEGnNnie257UODpRQo=;
        b=HBQr4OGnfp9ARpk+5IJpwia1/Uf2b+1BalvM6PrXzqC6MLeRWobYglMxyvuaEC0grK
         s9ykKuQaDaVQm1vy+j1V5QAj1rIGul4dxaotffqgw3LLjlumpY26HUunxovOhanRgMbH
         OFWO57lCa86xLYPcvsBUqCb1fbDyO3zp5VhqHqpAt64Vm1pbn2QMMy5AbJ61WEPozlkk
         fMMT8d9KW9HaKivtOM1bVW4yiFaLxKRi05GkRyWcoMNn6qUGfW4552vkPRSCx8H3D/YE
         U/AAePU4O4HZOEJsYNJPq4aSU17oN42Jyv42iktNjoY6B6SpVPkNcP4yMIz36aR7KMgN
         tdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771339; x=1790376139;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piXxKwae9uzBpYIu/Zn6s/3PXKEGnNnie257UODpRQo=;
        b=HBX9Po9RPgtIwwP7FZUqsUm3nKXUxzsgCpCnyORKxWZIWPvuOzrmNvTum8Q7UipQuC
         uTUEN+DGweuxnuMDI2t8EwPIBWdu9veKLeCWMcyGaiSL8pcKYImnmMKqm4G1WPzaERFY
         oP17V10ciHInIprotJejAC8+SHOmmzaZ4FE0d5fO8+2tD85+ijyBYMamFhzmvKepb2y1
         JDYF/xL87JL2Y2GiaoT4RAwthpnadGXUZpQWK6nD7vcNE6ewLI5ktIbq2llrcBGvpmSW
         +WuSd91gv7Vs6Xc55yAjlATwcXk0H8td8s8AVaUldxZ0peDsGdZURCWhQvHrVkz0QYcy
         +//A==
X-Forwarded-Encrypted: i=1; AKwUvBw0n2T8HAi17vmk2PsDFbCtzvsPamcnM6nVii/iyG+pGsqeWKiL8HoKlfPUde6xbk2rdAO1TaMsubdV+8I=@vger.kernel.org
X-Gm-Message-State: AFuF++mWrTmZAnNWSlRcUn5Spd0BdaFQhMqXs09lVbs0acXIOzWosRw6
	xhjVrtN9DczeyqXaEOmczV+GA38SXzDnforoIUoavj80jH8bU/FDQrUJv3APsIWo6AiIwrU0WDH
	gFbruRwp90PAMVuCQuR227nIC/A==
X-Received: from pgbcm3.prod.google.com ([2002:a05:6a02:a03:b0:cc5:2930:2a60])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:5483:b0:3dd:a196:3090 with SMTP id adf61e73a8af0-3dda19633c6mr1593487637.64.1789771339375;
 Fri, 18 Sep 2026 15:42:19 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:55 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-10-dylanbhatch@google.com>
Subject: [PATCH v7 09/11] arm64: entry: add unwind info for call_on_irq_stack()
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
2.55.0.1082.g2b9226bbc0-goog

