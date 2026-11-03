Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742200;
	b=oTTIMsTWMhOXV3Bcm2Sxem8uDSocTwl446t6W8MdH+Ba5y3GXFjbcJpJqqlNjJTusTFz
	 PcZK+nimEBcCBBTaka+Uxu43pp6mjgVgbaH2zB0xNIdYpuPjQPxNCWmhICNZdUAZ82aiw
	 TGSZqEVaOxyXsNYcNAZlmgwnPOSVYQaFi7ZuQc+slHTZO92zLpUgWWgoOtAtEZZwUiYRE
	 SbFCgrqXzSbx7e/xFDGo3fAnaVOzlHO9Cz95vw4V4NHlhFX7jDCdUYYuOBOOB1xawmeqL
	 Rm5qkYfZ1FrSrAqBeRsNFYoaM5rQr9E1eagDL8Xhqcg0iXRAa66VL8+8pFw1AJJIb9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kTz3h69vKYpBYO69sjF6ABERXYTIv+Bm2//nQ0YJpXo=;
	b=m14tkxg89NMQki8/rsFpfVqu/jksrtkktAs5kU8Cj81DRkTybRXYli8syaCr4hoav/jB
	 19z+4Wn7HniJvr0IQvzR4zuXwwRQyKGec1dbtnqPupkEGLzWGw9UK3BnoahSc5VURYeKM
	 Is2a+AJjEUiMGeQIyuB7d+JMN+ve0KiTZ/BNxOBVgmY3uknkFh0PjEPM9tuQ3QULR/lJR
	 hrR/XTLzaiFGH7AqxV1mUVYWrWGoQ8Ghqs5t74RwiK0Xv2eb4Y2TDZ/o/TI/czb2cH9Eq
	 qvt2htv2cRj/RSPXauNuZyPqVuhs0MMPzbDPcBuqe+tr8grpesf0ENxDNwJNNeOeqgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q0qKsJ2j;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C390F606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C390F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q0qKsJ2j
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c45551fa84eso9695766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742198; x=1794346998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTz3h69vKYpBYO69sjF6ABERXYTIv+Bm2//nQ0YJpXo=;
        b=Q0qKsJ2jiuLFef8xMUQn8xbdFoN2laqEnnTMM2E4MHpD17Y8TBwRv2QLcbFGvj6GbV
         CWgWyno+T5P/n9axHZ77q+UTYrmy04iMhCd+99G+UO//iklKtdrbjLbmoZyFYw/jElAG
         g5IHmpOG98qNmA3gddLKtDQAMD780DHLsF8wppU/+J2eX1ILZlr5LefUPhm15HcOcxdm
         BKwCvfi8cpGjchP/vWSv3wN9RQlG3BZuQEnd4VD9PxGm/X/ZJoWiqxymBpBA0iNpIbYa
         cZ8dXpsxAvhQ/G+ob1+kMVnS4RQDGN2XShK8OBn4t2a8n3Ah34CtHXPjluZ5Pr2zPe8l
         /s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742198; x=1794346998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kTz3h69vKYpBYO69sjF6ABERXYTIv+Bm2//nQ0YJpXo=;
        b=aQjhYLHIVV/DDVm3N3PsN1QdZ6fJJ9hZ0g1BcHmO3UUMIL07b3NnkPSbUbLCQCXhau
         b3eHlU8JMVGkllqvgMdgWgsIpgErCXgZS2xCkm7+rATfK6xC1pi9iATuxQcSkN6OF1Zw
         8+8BPp4LKEraqp/9uzGPCle4YdnYsTiX8OobTXmRiHLgYG57vpHz38IpqZHOLJJKG8SO
         hHgd/UQ/29N/3hvaEs0AffgpeF1enriShb71QEtluczFz8Lm6CeszjHJcAWFDTAgE8Qu
         9eHhyKXF3iOjE3kQvDJ3q0lJDX4g/tW84QK+bCtIsCRjJM2DIDkWJG5XaeDeWeKP/pm7
         DIog==
X-Forwarded-Encrypted: i=1; AKwUvBwtS/ggRDn3W6NIhfCpfnC6uM3F3uhzMHAxVFbdGCLF8URwUKAk7DV1q0qnyt1Bj4FNjWD/knn0dtAJkiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fMDtSRAtyQ6VPgyi1EOMVD2pD6IswZn6Pa3MdMPd2cVZmeRmC
	AFaBxSi1xnY8luIlQeLD09QWnTC1k2TEEEBkZ3nDZp5zKuem0AzudmqhdiHXzCEqsXM=
X-Gm-Gg: AYBFou0BU+QKJfY2jEbJLddukkBV3XkBZ+4laF/18hGVWkUfcIwn9dB4Ao5Kaqm/CXK
	Cnw/b89MDYmy7NGDMaS9NjqeZj88o94mjJ+CvFgokSLPhS3Jas2GIRO6l14oUzYqSlpZvSBjcn9
	L9kVvtJk+SK0Ihn4tv9OPEqeIZ6SGX56jDkxkR9gtfXlM6PPSe7GkTVtlVvXU3RpcwKVnGe0116
	V9vjmso3reSgKx6OfLB/7lu1YAAgQnP1/Qvif2FPA69ZTEEUJcR9iaSJqy5V54y2gc54F4KNmjF
	BE7JKIGlfHPFDO0D8n6LqucauXXoMbhUXsOLz3dQ7keCEA0DQfHfmafnn9+Om7iE8616dY5r1wb
	b8Ouo6fMNbxH2l5TavzTkvCrFlq4HfyFBVcRgvJMABYIjRoMa4sqnJfiyHHm07ZFYkkn2/zS1Yl
	snx/HkZLS0KSxhNqfPyxz8FxjKtfrVYSjlpwYMYxI+Tbao84BIrLaGIaDA6fAL6/ap8lf2gQhMu
	37dO6UFaER+khIAvl6x4/1LhYvQAORlzUHS8Vmw6zztZ89p60SSL5WV86pHKGvZ/lmsLR1G9oHr
	jG6LHYYsnkVEUmkcuECjWSJqcCc3Arci61ZrJauokjIno13t1X9oWjtrA78W52LC3pun108=
X-Received: by 2002:a17:907:3e0f:b0:c2e:8eb7:53dd with SMTP id a640c23a62f3a-c4ca7a9f026mr1341572866b.42.1793742198084;
        Tue, 03 Nov 2026 13:43:18 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:17 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 05/14] alpha: distinguish skipped syscalls from invalid numbers
Date: Tue,  3 Nov 2026 22:35:11 +0100
Message-ID: <20261103214120.1099893-6-linmag7@gmail.com>
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

An out-of-range syscall number other than -1 must return ENOSYS even
when a tracer has changed the return registers. Keep explicit results
only when entry work rejects dispatch or the number is the -1 abort
sentinel. The generic-entry conversion incorrectly treats both cases
as skipped calls and preserves tracer results for invalid numbers.

Track explicitly supplied r0 values instead of inferring them from
register contents. Alpha cannot preset its complete ENOSYS return state
before entry work because r19 is still argument 4. Value comparisons
can overwrite legitimate results, including -1, the original syscall
number and a seccomp errno matching the entry registers.

Mark results supplied by syscall_set_return_value(), scalar ptrace
result writes and regset writes covering r0. Keep number-only aborts
returning ENOSYS. After a legacy r0=-1 abort, subsequent r0 writes are
results, not another syscall-number substitution. Honor the supplied
r19 error flag for regsets instead of turning small successes into
errors. Writes outside r0 and empty regset writes must not mark it.

Preserve seccomp return values, SIGSYS rollback and saved restart
arguments. The existing per-syscall metadata reset prevents a supplied
result from carrying over to another syscall.

Fixes: 83bd31c2840b ("alpha: enable GENERIC_ENTRY")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/syscall.h     |  2 +-
 arch/alpha/include/asm/thread_info.h |  1 +
 arch/alpha/kernel/ptrace.c           | 25 +++++++++---------------
 arch/alpha/kernel/signal.c           | 37 ++++++++----------------------------
 4 files changed, 19 insertions(+), 46 deletions(-)

diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
index 22315b932f854a71fd3babf6565dda443c6c7a77..52fa96ea57caba5f04c2c0c3d9ea31b909eb9f60 100644
--- a/arch/alpha/include/asm/syscall.h
+++ b/arch/alpha/include/asm/syscall.h
@@ -94,7 +94,7 @@ static inline void syscall_set_return_value(struct task_struct *task,
 					struct pt_regs *regs,
 					int error, long val)
 {
-
+	task_thread_info(task)->syscall_meta |= ALPHA_SYSCALL_META_RESULT;
 	if (error) {
 		/* error is negative errno in this tree */
 		regs->r0  = (unsigned long)(-error);  /* positive errno */
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 49bc08f3b5a98fbcb1d4ac919001bf70c3db614b..78f9f60d4ad197c27cd05bfd6a5c20af22bee7a3 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -58,6 +58,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 #define ALPHA_SYSCALL_META_SKIP			0x2
 #define ALPHA_SYSCALL_META_FORCE_SUCCESS	0x4
 #define ALPHA_SYSCALL_META_ROLLBACK		0x10
+#define ALPHA_SYSCALL_META_RESULT			0x20
 
 /*
  * Thread information flags:
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index dba7e9905cfa842dbfe851b3e6ab996c94f7ee46..08e2401cb7e005795a04e169f0c53cf9ed35adb5 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -280,21 +280,6 @@ static void alpha_elf_gregs_set(struct task_struct *child,
 
 	if (nwords > 32)
 		ti->pcb.unique = src[32];
-
-/*
- * PTRACE_SETREGSET can be used at a syscall-entry stop to skip the
- * syscall by setting the syscall number to -1.  The seccomp/ptrace
- * selftests use this to synthesize errno returns.
- *
- * Alpha uses r19/a3 as the error flag, so a skipped syscall with a
- * small positive r0 and a clear r19 must be normalized to an error
- * return.
- */
-	if (pt->r1 == (unsigned long)-1 &&
-	    pt->r19 == 0 &&
-	    pt->r0 > 0 &&
-	    pt->r0 < MAX_ERRNO)
-		pt->r19 = 1;
 }
 
 static int
@@ -328,7 +313,8 @@ put_reg(struct task_struct *task, unsigned long regno, unsigned long data)
 	 * mutable syscall number in regs->r1.
 	 */
 
-	if (regno == 0 && regs->r1 == old_r0 &&
+	if (regno == 0 && regs->r1 != (unsigned long)-1 &&
+	    regs->r1 == old_r0 &&
 		(data == (unsigned long)-1 ||
 		(regs->r19 == 0 && data < NR_syscalls))) {
 		regs->r1 = data;
@@ -339,6 +325,9 @@ put_reg(struct task_struct *task, unsigned long regno, unsigned long data)
 	 */
 		if (data == (unsigned long)-1)
 			regs->r19 = 0;
+	} else if (regno == 0) {
+		/* Once dispatch is cancelled, even -1 is a valid result. */
+		task_thread_info(task)->syscall_meta |= ALPHA_SYSCALL_META_RESULT;
 	}
 	return 0;
 }
@@ -535,6 +524,7 @@ static int alpha_regset_set(struct task_struct *target,
 {
 	elf_gregset_t gregs;
 	unsigned int nwords;
+	bool writes_r0 = count && pos < sizeof(elf_greg_t);
 
 	if (pos + count > sizeof(gregs))
 		return -EIO;
@@ -551,6 +541,9 @@ static int alpha_regset_set(struct task_struct *target,
 
 	nwords = sizeof(gregs) / sizeof(elf_greg_t);
 	alpha_elf_gregs_set(target, gregs, nwords);
+	/* Only count r0 bytes actually supplied, not the preserved registers. */
+	if (writes_r0)
+		task_thread_info(target)->syscall_meta |= ALPHA_SYSCALL_META_RESULT;
 
 	return 0;
 }
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index ab32affa09c41152eabd1f3be92a126a85fb7a2d..f972f690eb678b9201e340624a60fe26ad7f23c8 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -567,7 +567,6 @@ asmlinkage unsigned long
 alpha_syscall_enter_select(struct pt_regs *regs, long syscall)
 {
 	struct thread_info *ti = current_thread_info();
-	unsigned long saved_r0 = regs->r0;
 	unsigned long saved_r19 = regs->r19;
 	unsigned long fn = (unsigned long)sys_ni_syscall;
 	long nr = syscall;
@@ -584,22 +583,20 @@ alpha_syscall_enter_select(struct pt_regs *regs, long syscall)
 
 	permit = syscall_enter_from_user_mode_randomize_stack(regs, &nr);
 
-	/*
-	 * Alpha cannot preset the full -ENOSYS return state before generic
-	 * entry handling, because r19 is still syscall argument 4 on the
-	 * normal dispatch path. So provide the default -ENOSYS result only
-	 * here, after we know no real syscall will be invoked, and only if
-	 * entry work did not already change the return state.
-	 */
-	if (unlikely(!permit || (unsigned long)nr >= NR_syscalls)) {
-		if (!(ti->syscall_meta & ALPHA_SYSCALL_META_ROLLBACK) &&
-		    regs->r0 == saved_r0 && regs->r19 == saved_r19)
+	if (unlikely(!permit || nr == -1)) {
+		/* r19 is still argument 4 unless a hook supplied a result. */
+		if (!(ti->syscall_meta & (ALPHA_SYSCALL_META_RESULT |
+					 ALPHA_SYSCALL_META_ROLLBACK)))
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
 
 		ti->syscall_meta |= ALPHA_SYSCALL_META_SKIP;
 		return fn;	/* ignored by asm when SKIP is set */
 	}
 
+	/* Invalid numbers other than -1 must invoke sys_ni_syscall(). */
+	if (unlikely((unsigned long)nr >= NR_syscalls))
+		return fn;
+
 	instrumentation_begin();
 	{
 		unsigned long index;
@@ -633,24 +630,6 @@ alpha_finish_syscall_to_user_mode(struct pt_regs *regs, long ret)
 	}
 
 	if (meta & ALPHA_SYSCALL_META_SKIP) {
-	/*
-	 * Skip-dispatch path: ptrace/seccomp may already have installed
-	 * the return state in r0/r19. Preserve it unless the syscall was
-	 * skipped with no explicit return value.
-	 *
-	 * Generic PTRACE_SET_SYSCALL_INFO changes only the syscall-number
-	 * shadow, so r1 == -1 while r0 still contains the original Alpha
-	 * syscall number. Legacy PTRACE_POKEUSR based skipping can leave
-	 * r0 == -1 with a3/r19 still indicating success. Both represent
-	 * an unhandled skipped syscall and should become ENOSYS/a3=1.
-	 */
-		if (regs->r1 == (unsigned long)-1 &&
-		   (regs->r0 == ti->syscall_saved_nr ||
-		    regs->r0 == (unsigned long)-1)) {
-			regs->r0 = ENOSYS;
-			regs->r19 = 1;
-		}
-
 		instrumentation_end();
 
 		syscall_exit_to_user_mode(regs);
-- 
2.43.0

