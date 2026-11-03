Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742198;
	b=0T9AEtGzFLwAWQ9ot5tOeNfevMTiihvy94vjmuIplF3Ndg0mvuabrpKK64G4YDdrmHmF
	 ZqQS/WXpy2WofUOkahw9ZfNPN7PKY0KkyciDLDltjqAHn/xHN9wdR2Oaq26cCAmFDctVa
	 CP4OmEW42jzL0HYbOS1v2RW7Hb9NF4JWPMkzpBWhG8GqE03k3YLlUH+TIALP4GwPVcJWT
	 goTzR1o+tjM7izT4XD9s90M87hQHTDBp/FzZelrzBChRw4/fIiv2jo9zF3XwPbFEba1ra
	 XeqopZdnCjaQMwcdghkggnqRQ/fElakcfGCiZ7+p7ZGYkP9QttGY9gkOiiy8myAJ4rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4P8XRThq1Wu1TjVMMjPvOh5ua3op9yoqp6jtpZeTP9I=;
	b=m/taf/N1Z/vD8tUWOUL5WAzFvuQPPchfI233fj5HmMUS01+E++EgtIIz6fy3WZzUh3US
	 D71XH4gTo9vzfKpiOW0f49aajjsyFurbx3lT6L0kSaUNNpXIpJTqcTtzGPqCW2F0k3Lfk
	 4N2wojdJ4EO6Xp8sJJ3TborBfssS9H3iDlMZnnK/uz3M7ZwZCLL8WBRnj2ZGp8DWiLpFX
	 DGo2sSt9XgUIZ6yWwHLdaRKXxn0yQi1A6/MTayjWQmxnuojFh8yDCXWybniBAESnHMME2
	 jsHBHcpAHAnNQmHsQ1xxTWxJDtBeRP4CU7kHs5LLvpvrnwl2ntoIDIcj7anpEgNPe2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exJQJ5SR;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EC5606D816
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87EC5606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exJQJ5SR
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso8263166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742197; x=1794346997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4P8XRThq1Wu1TjVMMjPvOh5ua3op9yoqp6jtpZeTP9I=;
        b=exJQJ5SRRmD3cZY1VidWiAtntqIsF9RrZcZrpFw/ca2dJvD9uO3LbdtO8jK5p+CZvN
         19HEmVOV9kjAPVazHdDDRAK7wO1KS+XGE+aBOnMWnxiOWjj80wFfh5tC1iY02yBlBwer
         cPw5eH3DRc+3z10qjXQuD6XiRmiweTCxihtSAzB2jvKIONfezkmWWAXPJPHtTaEUNlyf
         PFPrUgrjn34WGKrxXcI3MO3bWT53GBwJfu5ZEeWH9ZerOb30omngiVakFG0CWo6P2mpU
         c+jzBVrM1nJUhDx29utoPCEx5lBRpU2cKOg5uzEiqphmSPuYCK6hGZLTm5JBG6nuFItH
         RC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742197; x=1794346997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4P8XRThq1Wu1TjVMMjPvOh5ua3op9yoqp6jtpZeTP9I=;
        b=D6CwC0ROxzgB0yUsBPO9EqGC/3AUymq7uhdi3EzGt5EkV4T6OSa4PxVndD4zad/ofh
         1qIFe26ioaVKe8l8OO7Z9CznxGsAxQmQsTFfU894CqHk8FCdyZuTAz4e44ezq8xNzYlx
         e1q/H9dWP4JI2D120dk4sgTfeuOrs6ivce1EQtgIhXHWInJU/SYDVdwe2lfJGNttRlz7
         XNXgf25t2MJ+Fz4TEOsPnzGeFgYdjEAU8UGnEQzF9UiBKRRgTEtwbVvr8emAFUctTD8n
         RkZhMoK5831PQvDAe8/JtlX76Bzv9E0fyCrEMdUOqgD/9hIAZ6ruR1x33zYBg58pc81/
         X+rw==
X-Forwarded-Encrypted: i=1; AKwUvBxmE3rJbYqyJKnW7DddcIGAHHdQMk8CZad2/XRnlwKQRV+Qm480eSL6vMDZsD/vCw6ZRDiZZMkMf0dWMWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z91bCB78DcwqspAas0QIepqkegc7mhlJEX0ohGeDdRomq3HNewx
	JcZdFv1eZK73TQzMQlQr96M1FN1DwcbVv1zmVhKz65In+GUiVHTvL0uEbV9qzJB+N/s=
X-Gm-Gg: AYBFou3sycOobW5dH9hWjD6EkyNmGeQhAMXE5Ure5e3RyWnIAHmb5vC8yDxcM9L7qFJ
	XSXWmKPEk7L+rqPTkBnSshJVEyduC63jhfmnv5g7NKmIkDM6JUdY0/Gl3E9knGiW/6UK6aZzKsr
	XO/r+Q3T21zVi4CZ8y2Wf4fOQ7L1sfJMVbc0wAiFxm3x3sdpnqz/OVUxEFSb6WmGsh6IyYrHoPH
	vX0ZXeaK4SdjrN1QN4XjiaoM7npCA3edTGCmkEdTlyyQbiNb3NOuFvHtS8M+OmrhQpiVkdmsBCi
	4zlCBnm/QYXW9zh891n/RbvcJ7eDUyW3fvEi9BzAmpBb7KhG7x63lwKXZcaq7r3pmvKHfOUT2na
	hfy0aBROiPXG28DeZBHCIPUtKOpihvSa1tHIk9DDnYJb3Da7nlb+WG0mtD9ToGnZKykQOWU0wSl
	AtPjkCfwIwGkupUASXDbqpOQ7vyIloY0MxaY7Et6Ke6ZPUqr+R/mbjCHk6tbJrKKPCM85Bf4Hdz
	jNoD7+gb+ZaUmyAndKk+vSzn/0xiJQkesi1Qznvixu9lRvMV9De5+woBbabzScHbgrc0Dblgno0
	T6Kf6o4nJT5fm24nRiaEkxsdRo4neXL/t08KG8qYGOy1k+YmPiJ7v5h3E+R4TnXl5LhGifw=
X-Received: by 2002:a17:907:3d89:b0:c46:645f:cedf with SMTP id a640c23a62f3a-c4ca7a0708amr1244476366b.15.1793742196882;
        Tue, 03 Nov 2026 13:43:16 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:16 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 04/14] alpha: fix syscall restart eligibility
Date: Tue,  3 Nov 2026 22:35:10 +0100
Message-ID: <20261103214120.1099893-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After GENERIC_ENTRY, stale restart state or a successful syscall result
such as 512 can be mistaken for a restart code, corrupting r0 or the PC.

Clear restart eligibility after use and before returning to userspace,
including signal-context restore. Require a3 to indicate an error before
handling restart codes, preserving the saved arguments for replay.

Save the fourth argument before entry work can replace r19 with the
a3 error flag. Preserve that saved value when seccomp or ptrace skips
dispatch and supplies a restart error; dispatched syscalls still save
the argument after any ptrace changes.

Fixes: 83bd31c2840b ("alpha: enable GENERIC_ENTRY")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/entry-common.h | 10 ++++++++++
 arch/alpha/kernel/signal.c            | 13 ++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/entry-common.h b/arch/alpha/include/asm/entry-common.h
index a811c73454d28dbc166b83b6f5cd550da339b5fb..85dabd1021da012269eb28acb3ce2da21e0ad706 100644
--- a/arch/alpha/include/asm/entry-common.h
+++ b/arch/alpha/include/asm/entry-common.h
@@ -4,6 +4,7 @@
 
 #include <asm/stacktrace.h> /* For on_thread_stack() */
 #include <asm/syscall.h>
+#include <asm/thread_info.h>
 
 #define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
 
@@ -11,4 +12,13 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
 				unsigned long ti_work)
 {
 }
+
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						 unsigned long ti_work)
+{
+	/* An interrupt after returning to user mode must not restart a syscall. */
+	current_thread_info()->syscall_saved_nr = 0;
+}
+
 #endif
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 3fae37b4593f22f07a375ab7bc0b0712d0130a07..ab32affa09c41152eabd1f3be92a126a85fb7a2d 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -154,6 +154,7 @@ restore_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs)
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
 
 	current->restart_block.fn = do_no_restart_syscall;
+	current_thread_info()->syscall_saved_nr = 0;
 	current_thread_info()->status |= TS_SAVED_FP | TS_RESTORE_FP;
 
 	sw->r26 = (unsigned long) ret_from_sys_call;
@@ -497,17 +498,20 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 	unsigned long single_stepping = ptrace_cancel_bpt(current);
 	struct ksignal ksig;
 
+	/* Consume restart state once, even if the exit loop repeats. */
+	current_thread_info()->syscall_saved_nr = 0;
+
 	/* This lets the debugger run, ... */
 	if (get_signal(&ksig)) {
 		/* ... so re-check the single stepping. */
 		single_stepping |= ptrace_cancel_bpt(current);
 		/* Whee!  Actually deliver the signal.  */
-		if (r0)
+		if (r0 && regs->r19)
 			syscall_restart(r0, r19, regs, &ksig.ka);
 		handle_signal(&ksig, regs);
 	} else {
 		single_stepping |= ptrace_cancel_bpt(current);
-		if (r0) {
+		if (r0 && regs->r19) {
 			switch (regs->r0) {
 			case ERESTARTNOHAND:
 			case ERESTARTSYS:
@@ -571,6 +575,7 @@ alpha_syscall_enter_select(struct pt_regs *regs, long syscall)
 
 	ti->syscall_meta = 0;
 	ti->syscall_saved_nr = syscall;
+	ti->syscall_saved_r19 = saved_r19;
 
 	if (!(ti->status & TS_SAVED_FP)) {
 		ti->status |= TS_SAVED_FP;
@@ -614,7 +619,9 @@ alpha_finish_syscall_to_user_mode(struct pt_regs *regs, long ret)
 	unsigned long meta = ti->syscall_meta;
 
 	ti->syscall_meta = 0;
-	ti->syscall_saved_r19 = regs->r19;
+	/* Entry work may have replaced argument 4 with the a3 error flag. */
+	if (!(meta & ALPHA_SYSCALL_META_SKIP))
+		ti->syscall_saved_r19 = regs->r19;
 
 	instrumentation_begin();
 
-- 
2.43.0

