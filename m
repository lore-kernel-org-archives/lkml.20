Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B19B22CBE6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725934; cv=none; b=nuiZzt1iMzSuKWJxpwcjlmdJS56XIPFZfWMXXF9g/ssZlhZsqNzOLKfeN++Ci7WV/MMAlaH0sRwKVJ9mfnAhuPWn2VfaulmEhu5qWmVTcurwxXzQ/aM50eS7MJewg6wW9dQ1pGvFggLSs9zF3VjEYMVxZsjYItvGJtcJhriqMsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725934; c=relaxed/simple;
	bh=VlaIIXAgtNH9CjpXUFsGzgsQokBenQSI3ZDOBobz3oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ionB0O96z1X7xASkoS31VCvpUqOJlPpyR+6vdQvYveQiqc4q34kxcCzVrIN9ikq6rkXscvtmQ9CJiNMZxMSOzT2VUOQDiplPi6lv1MKqEadoQXyU3k0/zNL7X12X8Fy5wJnk/OQaKeuLBpLtF2MAAzpseAzbnx9g3Y1l39Iqjgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lpw9lQ8K; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lpw9lQ8K"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-485843aeab8so3085917f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725931; x=1789330731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzigpOKL1OFYCaoRua6BtFJqvREz04FyyrYb1+IZ6O0=;
        b=Lpw9lQ8KAT2HN0tWYq7DPaD9GKgvmfXRpH60E+qsnyLWi9Icrml+JgvlKyUtCSS/9u
         RZQzQt809pGCukzbw0XBmR4sCxyf2qoU94jhxU7U0ow+7yXHhdKlxe/w5qM/F5rCfzOa
         T7BSLLmp748K/1vNe6KCNWXgw0whIChyJEHjnEcIgNWTdT6K3s/jE9FZ0Ucmg9GOU8pu
         q1sv5VXzJTsMSKnrsS5FrhxCq0g4AP+sPsX/BmJXOW1eLoDwtg9LfocMMoimRtr/HOyX
         JWuQ7/QbvdWKIPASD6qUkL0QJqMJZcLS71VLErIv3vUs4VIrow7HrcfjZdMapq+DGsrr
         N/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725931; x=1789330731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzigpOKL1OFYCaoRua6BtFJqvREz04FyyrYb1+IZ6O0=;
        b=eDMxu3LKNCCOvMf28/Y1cY+c549/txYGkL5lReJ1XaJTmPXPJ/v/Eu/xYlZMMtWAGt
         dPD0+DaJOA2tRS0Zx0ebVeGhX/btveiQNZIBz/fTcgjFD8so0LctjR6AgkpeXFrJK2a5
         W32Wlo7pA7fA83ZH3xgBnMWlWkRN5cfJTj63dgeGZjadDaWN7LtBaWIdOiBwWYRYcgDS
         2TbNk8+UR465jwmmqSP01vSuLmnOpKLU6hr7sCFn50MG/k/XkniqNAus3uapoqHteGYw
         9nabFZAmdur2zbNjzPKKxqidnXd4YSseSwN/fEz7od5Pe2oijn1CM947BYBSYAch/FKv
         9t+A==
X-Forwarded-Encrypted: i=1; AKwUvBzwaMiHss9ycCga0pNZUZL+F0ndMZ90fSGfCgaZsUPr1R+e+V87gf1i9yrbSB2e9p6IzvBQVMR8gtOUMv0=@vger.kernel.org
X-Gm-Message-State: AFuF++lSPd3QoEcd/lnwOh1Rvx0ZrhgSA1n4ZE0qD1C20bgoctsUbKDD
	UkJQzG8QYKEMnEYNPl1aARdPu1+WsjvLUe8dZvmb0dxOfskq92Xl0SKU
X-Gm-Gg: AYBFou28j2znt2+W8/0KfDkg0RNjhfZy+XabcvBghdUAenf7Oy3PVwynHuA3IBgCk2w
	oRsyTu3nC/BxoBI1+stpWIOSYFV1dvj0r9fSdrTogxOnHZiAkFoJ33lt2FsqyPGttovg9Knt7OD
	Me+Am6ZcMZcAOybhBHD+OC2DyIrBiI6bZLEdAMLd8Xgl8WDQapAXhckVmhiIkM4ACM+5Tu3y3zu
	V7wHOnpDbr4BUYeouQ5eqrAWioRYPY9tZMV30Ob9qUqYni91TTEXlg6Ac2dOMfP2uucIJV0pkoh
	qd5r12Mo58d0aQRTug+pI0P9GZ460RRRpxPT0GwA9UGIvarwN1rtluqT4xdPihJ9yqa/mZQCxTF
	Fbj1joqOwdMMc0k7VYirQ2a2gRhMs8cINWqDsM6yVpbdqz+jbmeISpoDphQoI7z9Jqr3OwICz3w
	8ACQrc3jqaxy3lbyispGTX+F8a+/vJlHKDfCYBICNvUJ2zUslUAhjM7u1QtPelnx88xWI0cw67D
	qqgRZbHOLmxjjE2iSK26OP4qqNIQQL6YXK4b+nZE8H9OAPewdnoRqh57kR+UwfdhJ7RV/e+EIE5
	1rot4tc=
X-Received: by 2002:a05:6000:4703:b0:482:fbb5:ab56 with SMTP id ffacd0b85a97d-48587085bc9mr41603296f8f.13.1788725931381;
        Sun, 06 Sep 2026 13:18:51 -0700 (PDT)
Received: from fedora ([2a01:261:818:9401:46b1:9fe8:a5e3:32be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm19228120f8f.19.2026.09.06.13.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 13:18:50 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/process: Use thread.gsindex for 32-bit gs, drop dead thread.fs
Date: Sun,  6 Sep 2026 22:18:29 +0200
Message-ID: <20260906201842.154014-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

thread_struct duplicates what 64-bit already does for segment
tracking: on X86_64 the active FS/GS selectors live in the 16-bit
fsindex/gsindex fields, while X86_32 instead carries its own
"unsigned long fs, gs" pair, flagged since day one with:

	/*
	 * XXX: this could presumably be unsigned short.  Alternatively,
	 * 32-bit kernels could be taught to use fsindex instead.
	 */

Do the second half of that TODO for gs, and just delete fs.

gs is the only one of the two that actually needs storage in
thread_struct on 32-bit. pt_regs does have a gs slot, but on
32-bit it is repurposed to hold the interrupt vector number
("On interrupt, gs and __gsh store the vector number. They never
store gs any more.", see struct pt_regs in ptrace.h) rather than
the real %gs selector, so __switch_to() and ptrace() need
thread.gs as the only place the actual value lives. fs has no
such repurposing - its pt_regs slot genuinely holds %fs (see
PT_FS / regs->fs) and sigcontext does too - and thread.fs has had
no reader or writer anywhere in the tree for years: it's dead
weight in every 32-bit task_struct.

Move gsindex out of the CONFIG_X86_32 #else branch so it's shared
between 32-bit and 64-bit instead of 32-bit growing its own copy,
and update the corresponding .gs sites in process.c, process_32.c and
ptrace.c to match. Segment selectors are 16 bits wide, so narrowing
from unsigned long to unsigned short loses nothing - ptrace's
set_segment_reg() already truncates to u16 before the assignment.

No functional change; thread_struct also gets a little smaller on
32-bit as a side effect.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/processor.h | 10 +---------
 arch/x86/kernel/process.c        |  2 +-
 arch/x86/kernel/process_32.c     |  6 +++---
 arch/x86/kernel/ptrace.c         |  4 ++--
 4 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index ec9db0dfa0df..d80a28fb51ec 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -476,19 +476,11 @@ struct thread_struct {
 	unsigned short		es;
 	unsigned short		ds;
 	unsigned short		fsindex;
-	unsigned short		gsindex;
 #endif
-
+	unsigned short		gsindex;
 #ifdef CONFIG_X86_64
 	unsigned long		fsbase;
 	unsigned long		gsbase;
-#else
-	/*
-	 * XXX: this could presumably be unsigned short.  Alternatively,
-	 * 32-bit kernels could be taught to use fsindex instead.
-	 */
-	unsigned long fs;
-	unsigned long gs;
 #endif
 
 	/* Save middle states of ptrace breakpoints */
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..5b1a132ff84e 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -204,7 +204,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		set_bit(MM_CONTEXT_LOCK_LAM, &p->mm->context.flags);
 #else
 	p->thread.sp0 = (unsigned long) (childregs + 1);
-	savesegment(gs, p->thread.gs);
+	savesegment(gs, p->thread.gsindex);
 	/*
 	 * Clear all status flags including IF and set fixed bit. 64bit
 	 * does not have this initialization as the frame does not contain
diff --git a/arch/x86/kernel/process_32.c b/arch/x86/kernel/process_32.c
index 168dabf9853f..f520039d7d15 100644
--- a/arch/x86/kernel/process_32.c
+++ b/arch/x86/kernel/process_32.c
@@ -172,7 +172,7 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	 * used %fs or %gs (it does not today), or if the kernel is
 	 * running inside of a hypervisor layer.
 	 */
-	savesegment(gs, prev->gs);
+	savesegment(gs, prev->gsindex);
 
 	/*
 	 * Load the per-thread Thread-Local Storage descriptor.
@@ -202,8 +202,8 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	/*
 	 * Restore %gs if needed (which is common)
 	 */
-	if (prev->gs | next->gs)
-		loadsegment(gs, next->gs);
+	if (prev->gsindex | next->gsindex)
+		loadsegment(gs, next->gsindex);
 
 	raw_cpu_write(current_task, next_p);
 
diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
index 3dcadc13f09a..09fcbfba8a45 100644
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@ -192,7 +192,7 @@ static u16 get_segment_reg(struct task_struct *task, unsigned long offset)
 		if (task == current)
 			savesegment(gs, retval);
 		else
-			retval = task->thread.gs;
+			retval = task->thread.gsindex;
 	}
 	return retval;
 }
@@ -230,7 +230,7 @@ static int set_segment_reg(struct task_struct *task,
 		break;
 
 	case offsetof(struct user_regs_struct, gs):
-		task->thread.gs = value;
+		task->thread.gsindex = value;
 	}
 
 	return 0;
-- 
2.55.0

