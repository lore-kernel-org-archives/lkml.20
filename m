Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131EE2F0661
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.136.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175824; cv=none; b=Vd8fhZXzh1ciAy8j4HHZUCFfNxgk/6e3Ij//o0Vk38I9FbXDJyurHz8dRyuGSq04LGdd84uUy7j1YcNPsAY9NwbnEbEOvBSQzInaY2xoHvWK2r3cRNey9zxpDVXghcnTZOgcO6B6qtFwJOF6289ZfGCI3J+Fr1YXZT+LKORTz1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175824; c=relaxed/simple;
	bh=iYYSxDNR1S58UTAcWamCyKcYlcoS5npcSZBlyQ6L+cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJo7uG2/r5Q6qGZjO3jla9PQkJSKC7RxkQkDRS3fYTBs4Hae6bviaZf//7iNmdd3Feb4Llav1bXJuMxCXRchXbj+B9Wcb/pjB5Q5YAuxcTNbPGVGTgkKOwBQAcVQCdsIU8XIwm/o4p3n2+tm8SfnpRHwUXylZM6uz5ZnauhDc1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it; spf=pass smtp.mailfrom=cs.unibo.it; dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b=krNRTM9k; arc=none smtp.client-ip=130.136.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b="krNRTM9k"
Received: from eipi10.cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPA id A36981C0257;
	Mon, 31 Aug 2026 13:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1788175820;
	bh=iYYSxDNR1S58UTAcWamCyKcYlcoS5npcSZBlyQ6L+cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=krNRTM9kgPzAyOGUs2Z37IJ4hF4ESJLDxi08mnlynzRNfKFfjlU8XDdq8lcAWU655
	 owq9hJDM5ARNYrhgd11u9lof0YvluWBxrDb57ni3sVm5FLOtlxy+lIuQsVwngsX5t2
	 Ry/n/AgNmxnIXlrQbc5H1nEUo6e1mAN1NjexFKwI=
From: Renzo Davoli <renzo@cs.unibo.it>
To: linux-kernel@vger.kernel.org
Cc: Renzo Davoli <renzo@cs.unibo.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	"Dmitry V . Levin" <ldv@strace.io>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v3 1/3] asm/ptrace.h: add instruction_pointer_set
Date: Mon, 31 Aug 2026 13:30:02 +0200
Message-ID: <20260831113004.259991-2-renzo@cs.unibo.it>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831113004.259991-1-renzo@cs.unibo.it>
References: <20260831113004.259991-1-renzo@cs.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an instruction_pointer_set function for architectures that do
not currently provide one.

Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
---
 arch/alpha/include/asm/ptrace.h      | 6 ++++++
 arch/hexagon/include/asm/ptrace.h    | 6 ++++++
 arch/m68k/include/asm/ptrace.h       | 6 ++++++
 arch/microblaze/include/asm/ptrace.h | 6 ++++++
 arch/nios2/include/asm/ptrace.h      | 6 ++++++
 arch/um/include/asm/ptrace-generic.h | 6 ++++++
 arch/xtensa/include/asm/ptrace.h     | 6 ++++++
 7 files changed, 42 insertions(+)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 8e0a589e2d15..a8cc325c4704 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -31,4 +31,10 @@ static inline unsigned long user_stack_pointer(struct pt_regs *regs)
 	return regs->usp;
 }
 
+static inline void instruction_pointer_set(struct pt_regs *regs,
+					   unsigned long val)
+{
+	instruction_pointer(regs) = val;
+}
+
 #endif
diff --git a/arch/hexagon/include/asm/ptrace.h b/arch/hexagon/include/asm/ptrace.h
index ed35da1ee685..0a121f6e3bfc 100644
--- a/arch/hexagon/include/asm/ptrace.h
+++ b/arch/hexagon/include/asm/ptrace.h
@@ -18,6 +18,12 @@ extern const char *regs_query_register_name(unsigned int offset);
 	((struct pt_regs *) \
 	 ((unsigned long)current_thread_info() + THREAD_SIZE) - 1)
 
+static inline void instruction_pointer_set(struct pt_regs *regs,
+					   unsigned long val)
+{
+	instruction_pointer(regs) = val;
+}
+
 #if CONFIG_HEXAGON_ARCH_VERSION >= 4
 #define arch_has_single_step()	(1)
 #endif
diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptrace.h
index bc86ce012025..6e8a8f0daee8 100644
--- a/arch/m68k/include/asm/ptrace.h
+++ b/arch/m68k/include/asm/ptrace.h
@@ -18,6 +18,12 @@
 	(struct pt_regs *)((char *)current_thread_info() + THREAD_SIZE) - 1
 #define current_user_stack_pointer() rdusp()
 
+static inline void instruction_pointer_set(struct pt_regs *regs,
+					   unsigned long val)
+{
+	instruction_pointer(regs) = val;
+}
+
 #define arch_has_single_step()	(1)
 
 #ifdef CONFIG_MMU
diff --git a/arch/microblaze/include/asm/ptrace.h b/arch/microblaze/include/asm/ptrace.h
index 17982292a64f..69e10658d7a9 100644
--- a/arch/microblaze/include/asm/ptrace.h
+++ b/arch/microblaze/include/asm/ptrace.h
@@ -20,5 +20,11 @@ static inline long regs_return_value(struct pt_regs *regs)
 	return regs->r3;
 }
 
+static inline void instruction_pointer_set(struct pt_regs *regs,
+					   unsigned long val)
+{
+	instruction_pointer(regs) = val;
+}
+
 #endif /* __ASSEMBLER__ */
 #endif /* _ASM_MICROBLAZE_PTRACE_H */
diff --git a/arch/nios2/include/asm/ptrace.h b/arch/nios2/include/asm/ptrace.h
index 96cbcd40c7ce..d120d8ecb187 100644
--- a/arch/nios2/include/asm/ptrace.h
+++ b/arch/nios2/include/asm/ptrace.h
@@ -70,6 +70,12 @@ struct switch_stack {
 #define user_stack_pointer(regs)	((regs)->sp)
 extern void show_regs(struct pt_regs *);
 
+static inline void instruction_pointer_set(struct pt_regs *regs,
+					   unsigned long val)
+{
+	instruction_pointer(regs) = val;
+}
+
 #define current_pt_regs() \
 	((struct pt_regs *)((unsigned long)current_thread_info() + THREAD_SIZE)\
 		- 1)
diff --git a/arch/um/include/asm/ptrace-generic.h b/arch/um/include/asm/ptrace-generic.h
index 86d74f9d33cf..44beb96862d8 100644
--- a/arch/um/include/asm/ptrace-generic.h
+++ b/arch/um/include/asm/ptrace-generic.h
@@ -29,6 +29,12 @@ struct pt_regs {
 
 #define PTRACE_OLDSETOPTIONS 21
 
+static inline void instruction_pointer_set(struct pt_regs *regs,
+					   unsigned long val)
+{
+	instruction_pointer(regs) = val;
+}
+
 struct task_struct;
 
 extern long subarch_ptrace(struct task_struct *child, long request,
diff --git a/arch/xtensa/include/asm/ptrace.h b/arch/xtensa/include/asm/ptrace.h
index d0568ff6d349..97b14418955e 100644
--- a/arch/xtensa/include/asm/ptrace.h
+++ b/arch/xtensa/include/asm/ptrace.h
@@ -103,6 +103,12 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 	return regs->areg[2];
 }
 
+static inline void instruction_pointer_set(struct pt_regs *regs,
+					   unsigned long val)
+{
+	instruction_pointer(regs) = val;
+}
+
 int do_syscall_trace_enter(struct pt_regs *regs);
 void do_syscall_trace_leave(struct pt_regs *regs);
 
-- 
2.55.0

