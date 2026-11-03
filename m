Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742202;
	b=MtFCCIdmgORIhUEzXWKBQHQOqhU9NI4l1XdwNEvvJX2O9ZmXs9m8M8f9TtUR/7IMF+r+
	 9q335ZpJYMa7BRWNZHx3ZNj3lXgRV9DquimmY3rR+SR1nmtwdlBfuHCXXM9G/2KBY8dE+
	 KznmUFcZcns6CPkHXj1eojz0zTkTtlCoMQX2ev9Xio+PfXjs6C8DRGKZEjeISBVtraPug
	 /0zleeckd6WvI2bSjwQMOmRPjjVlF9xm2B1r8xUG+wvogxBTAnVMcoH84rwYZsSkaMGrt
	 RumMN+fR43+5PTXP2YIMn8tvpV6v9G+eMCH1VoSDjUzEWVhd06TaqAXkev7vkzY2Lcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=81mqqgopMMqaUyS97akIwgKPW+Eqt+aTu6eaajJHQ9M=;
	b=Tj3LQfD6Q1bx22bYsSupiuRM9grQp92CxhEXyWKAn51bqHnszY1phNIZ2pws24d4oEKb
	 LJesSgcYuKDaBeL4qibpeAnmBAcOuJoIT3UEFFHICjVxd9Z5Q1msf58WHtbR59yzOWL+Y
	 6DzIZKG3tQTlMVHivkU2f3Mqjisc3jOViGM0WVJ+99f8znNk8XtaG/MRhtW9OKvy0W7Yu
	 1bcyEex6ypXO0zGVKKs5qYQquECtHYAhbds5WHBShlmIWPkJxxECbxZUAspQUXO7QBlDi
	 OkOh+uATWd+9BJ9WvwvtNEcS4yF8k0G/nY4+a07L+tMB278dUzJmA3MgUEv2eou9MgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfTmx+ef;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4C606EE8E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE4C606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfTmx+ef
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so8990a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742201; x=1794347001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81mqqgopMMqaUyS97akIwgKPW+Eqt+aTu6eaajJHQ9M=;
        b=LfTmx+efFswCAby3m3Vw92kBaSJTODARnqfktZh/gGGW2SiJQJZTtGQw/PO+c7/fT9
         sGLIU9BjLOm9/GVP4sh+ZsZgKyThKaBrO85qGdntNz133zN9j+IepFHI7D6EEclEopVz
         j2EPu+Hddmd14B8SmmqtQuVZAK7ZDdtyVTognBmRJw6QKWsTqHi1QxSNWxCPg8M3VgGG
         uEG0jcQOHKJ4ihZBwaqUheCWsEMbaAjNvUDwtZ8QS1b7XN+SWdzCZK6mAka0p3F2hFD3
         830KpGHnxhGgLE0Zu6ck/K0+HREqz0AjnPru3rAbpYNP3MRbvf6zpEFr7FfNhwXfn0Dt
         Q7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742201; x=1794347001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81mqqgopMMqaUyS97akIwgKPW+Eqt+aTu6eaajJHQ9M=;
        b=xaYh47uxSgMjllutRPbfValyVmRvCnGzRuU+jGiYFSJrdHYyfWjXMzkBMVPUlVhTzL
         ErS/iyKkLVPGmfP0YovpT0iB8gW1oEvjxBVnIw267dLa4Yqj7g9FQp2qQah2+AB02XfZ
         q65+uylPfIVOc8FVkxmuX+exR0HPyylLc8LejWMWeHKDou+UxcBN2crcj2t8ySIkjzen
         kcPxKkaElgv4tKi4Lp9C7hi4VNwz5+rO3gGhS9Ly3r9PXc97HDIDjI8RmVZjgmWIKy0B
         2JHawN42lQCnRbxAlJj+pM886nQqgzZYSCSwipMellsl0GErCIYmUyZPiSVy+51Nvr7k
         3vrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuKTmLFHA1YbeAIQVHQT9soLZ2dAm8LzjUxq/MxuEBV/MjLdGwNpP262o4AoVivFvu76qMYpxSgK/t/Vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jh0E1ngBFp+VbH/toq+PSdg+XJ1eEAV3IdR3rgRu8JvovXkSY
	hAgkYlyOlNBfjdJmaWQ5HlJKkXIxFHWaiBxLj0bc9R33svYgcIKjno3K
X-Gm-Gg: AYBFou2nQVLGqSoYLIcL6xFA6QFwbwOL+ak8SI8QgFFRj3bFhVq3ZKZpJpdnTUEyqvG
	mNHwqvSJnGH0t2WAU+Dnb16ttWXjXP6hcS9L7BbAtP0prKM3xzzKOUrKW3Gmx//zVnhxUeVp1gQ
	rd3+Qqi3EEDg4l+Z89/hW+OMlpQzb4QiYt6+ogBhlXfdPUfv3B2Q2crYcQuUyddFRQkG86BIeJ+
	3G9U6G351JJka+a9QzIpSgIQdA3CABhvaMmAO6S7uFJDIt/HS9Mi1mwoCDArvUOgIsQhl1+xsrR
	CPTuTQtgwy6F8ifeASIGznWN2wr6QbAzSCWmHl3UUVYnBjGSCEb8RIlL2dKEL0U7TSk/riS1xzc
	qQ2ifqya0O2fPnKo140Fb2zGh8+5HA5h4XWx6nzx3cMSF3iUiTHBwXCU9ASwkbFpD9SYe45/Jmr
	y54ARpP6OZmU6eiWBNe8aRoffxX1va08J94h4Tn7s81UQ1un3koS1hD10GFuu40g/VszIUbdojC
	Lkq8qr5nlCkQAqvYOGRIJ++4DOkaiedQbjSWpvt3qtqQmaaN1G7wUnCg7bd6AGuVGXiMa9BE5aN
	ndxJQKjFU0KNuZG5aS/n9RrvEWNjZFTGNE2421cj+NwO86Soymif2ZQxX9o9aM0zHrGRt7g=
X-Received: by 2002:a05:6402:7ca:b0:6b4:35af:327f with SMTP id 4fb4d7f45d1cf-6b4d515d7efmr8563685a12.43.1793742201019;
        Tue, 03 Nov 2026 13:43:21 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:20 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 08/14] alpha: use generic syscall exit for new tasks
Date: Tue,  3 Nov 2026 22:35:14 +0100
Message-ID: <20261103214120.1099893-9-linmag7@gmail.com>
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

Move fork and kernel-thread startup into C and use
syscall_exit_to_user_mode() for the return to userspace, retaining the
saved user context for exit work.

This also supplies the child syscall-exit tracepoint for fork, vfork,
clone and clone3.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/entry.S   | 23 ++++++++++-------------
 arch/alpha/kernel/process.c | 16 ++++++++++++++++
 arch/alpha/kernel/proto.h   |  6 ++++--
 arch/alpha/kernel/signal.c  |  8 --------
 4 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 2233eb6da7065e7d85cbc668a09e565bcfd75a52..5da8c0d17a1d893f59bee1a12f5782276432674d 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -417,11 +417,11 @@ ret_from_exception:
 	beq	$0, restore_other
 	br	restore_all
 
-ret_to_user_from_exception:
-
-	mov	$sp, $16
+ret_from_fork_common:
+	mov	$17, $16
+	mov	$sp, $17
 	DO_SWITCH_STACK
-	jsr	$26, alpha_exit_to_user_mode
+	jsr	$26, alpha_ret_from_fork
 	ldgp	$gp, 0($26)
 	UNDO_SWITCH_STACK
 	br	restore_all
@@ -548,9 +548,9 @@ alpha_switch_to:
 	.align	4
 	.ent	ret_from_fork
 ret_from_fork:
-	lda	$26, ret_to_user_from_exception
-	mov	$17, $16
-	jmp	$31, schedule_tail
+	mov	$31, $18
+	mov	$31, $19
+	br	$31, ret_from_fork_common
 .end ret_from_fork
 
 /*
@@ -560,10 +560,7 @@ ret_from_fork:
 	.globl	ret_from_kernel_thread
 	.ent	ret_from_kernel_thread
 ret_from_kernel_thread:
-	mov	$17, $16
-	jsr	$26, schedule_tail
-	mov	$9, $27
-	mov	$10, $16
-	jsr	$26, ($9)
-	br	$31, ret_to_user_from_exception
+	mov	$9, $18
+	mov	$10, $19
+	br	$31, ret_from_fork_common
 .end ret_from_kernel_thread
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 2182496c535661f399a73400e308c0a7fc6d76f1..c7e6e7b593af10305414ea30f5b944b9d21dd2e2 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/entry-common.h>
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/sched.h>
@@ -226,6 +227,21 @@ flush_thread(void)
 	current_thread_info()->pcb.unique = 0;
 }
 
+/* The assembly stub keeps the complete user switch_stack below regs. */
+asmlinkage noinstr void alpha_ret_from_fork(struct task_struct *prev,
+					 struct pt_regs *regs,
+					 int (*fn)(void *), void *fn_arg)
+{
+	instrumentation_begin();
+	schedule_tail(prev);
+	if (fn)
+		fn(fn_arg);
+	instrumentation_end();
+
+	/* A kernel thread may return after a successful kernel_execve(). */
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index 90af335cd6798ad4039ecc2a3c67505eadbd32a2..c418333d0b89d910ec59d1d57d6bcc0550efc4aa 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -164,14 +164,16 @@ extern void entDbg(void);
 /* pci.c */
 extern void pcibios_claim_one_bus(struct pci_bus *);
 
+/* process.c */
+extern void alpha_ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
+				int (*fn)(void *), void *fn_arg);
+
 /* ptrace.c */
 extern int ptrace_set_bpt (struct task_struct *child);
 extern int ptrace_cancel_bpt (struct task_struct *child);
 
 /* signal.c */
-extern void alpha_schedule_user_work(void);
 extern void do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19);
-extern void alpha_exit_to_user_mode(struct pt_regs *regs);
 
 /* syscall.c */
 extern void alpha_syscall(struct pt_regs *regs);
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 244fec20294b81e0c749a07321f917befb62b1a7..e3cb1b50c83d9680032731799b644118b46803bc 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -538,14 +538,6 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 		ptrace_set_bpt(current);	/* re-set breakpoint */
 }
 
-asmlinkage noinstr void alpha_exit_to_user_mode(struct pt_regs *regs)
-{
-	instrumentation_begin();
-	local_irq_disable();
-	instrumentation_end();
-	irqentry_exit_to_user_mode(regs);
-}
-
 void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	struct thread_info *ti = current_thread_info();
-- 
2.43.0

