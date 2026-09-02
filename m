Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C256A42BEAA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342913; cv=none; b=uTTV+J/rXuBerEqiBBSf8U+yGGV8TG1KmrD9q4CJ1Vdb4VepmRTZUzgk9zt9UP/fdLgLWREL/k2Fx0XUmCmBH5/KvcWQhEq32IHnXUOZZ45cPy+IIlHGPtyWMXkGbSEpc7//d0RMNHiG+7ECsDHBe1LmTnH33/3UcxEhRY1KBmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342913; c=relaxed/simple;
	bh=va3RmBYWjqUKdrPT/dqZ+uZ2s5LLxBYGTrLoC4zyoEA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nuSXcpoDq1qET8VLYFzf2ZNOCsUVqlLba4vVyR7qFtlWnbxyzaSRJlh9m7bMGEsmX5OroP6M+XngKyTICEjR/J0dN+wH84ahkySk2JdP4czsBo6WC1M0UU0NGsb3sRw/BwEOQiL7m87dsCcRmoNuNLgKdKWZd6WmaWKdz6XY3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=mMXdNRXJ; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="mMXdNRXJ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=j48ygBxQtnVqga/KxGE2hJAND8SrQruXUFpMvk/8YUA=;
	b=mMXdNRXJcknTqC2OMuM4HkW+/8U/XW8nLiCaEMtw8CMqowE/l0OuILklBw5XNaARIJJjlp4f8
	xqfy1JB/QPeZiNlwrNJeLvUTRT9J194Qg1yiEWL64oxWiIBr0Yxeu80las99ylSYKtT1GyEckdg
	IG2ilEkW3rXQx9m/NizCuEQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hZd9G75PTzRhWY;
	Wed,  2 Sep 2026 17:44:18 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DF4E14057D;
	Wed,  2 Sep 2026 17:55:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:55:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<thuth@redhat.com>, <james.morse@arm.com>, <vladimir.murzin@arm.com>,
	<broonie@kernel.org>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<ryan.roberts@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v18 09/14] arm64: ptrace: Align syscall exit work semantics with generic entry
Date: Wed, 2 Sep 2026 17:55:32 +0800
Message-ID: <20260902095537.602517-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902095537.602517-1-ruanjinjie@huawei.com>
References: <20260902095537.602517-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Refactor the syscall exit path to better match the generic entry
framework. Specifically:

- Introduce `_TIF_SYSCALL_EXIT_WORK` to aggregate exit-time thread
  flags (trace, audit, tracepoint).

- Rename `syscall_trace_exit()` to `arm64_syscall_exit_work()` to
  better reflect its role.

- Move `rseq_syscall()` out of `arm64_syscall_exit_work()` and into
  `arm64_syscall_exit_to_user_mode_work()` so that it runs
  unconditionally on all exits, consistent with generic entry.

- Gate `arm64_syscall_exit_work()` behind the new flag check,
  mirroring the generic entry exit's pattern.

Gating audit on `_TIF_SYSCALL_AUDIT` is equivalent to the previous
`audit_context()` check: the audit context and flag are statically
allocated at fork and freed at exit, remaining stable throughout
syscall execution.

No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h     | 8 ++++++--
 arch/arm64/include/asm/thread_info.h | 3 +++
 arch/arm64/kernel/ptrace.c           | 5 +----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 3e4672ab4a4f..7cc872fde019 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -8,6 +8,7 @@
 #include <uapi/linux/audit.h>
 #include <linux/compat.h>
 #include <linux/err.h>
+#include <linux/rseq.h>
 
 typedef long (*syscall_fn_t)(const struct pt_regs *regs);
 
@@ -121,13 +122,16 @@ static inline int syscall_get_arch(struct task_struct *task)
 }
 
 int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
+void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
 static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
 
-	syscall_trace_exit(regs, flags);
+	rseq_syscall(regs);
+
+	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
+		arm64_syscall_exit_work(regs, flags);
 }
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 5d7fe3e153c8..56a2c9426a32 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -112,6 +112,9 @@ void arch_setup_new_exec(void);
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
 				 _TIF_SYSCALL_EMU)
 
+#define _TIF_SYSCALL_EXIT_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
+				 _TIF_SYSCALL_TRACEPOINT)
+
 #ifdef CONFIG_SHADOW_CALL_STACK
 #define INIT_SCS							\
 	.scs_base	= init_shadow_call_stack,			\
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index ed970576d9a7..08d2c39ae2ba 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -28,7 +28,6 @@
 #include <linux/hw_breakpoint.h>
 #include <linux/regset.h>
 #include <linux/elf.h>
-#include <linux/rseq.h>
 
 #include <asm/compat.h>
 #include <asm/cpufeature.h>
@@ -2505,12 +2504,10 @@ static inline bool report_single_step(unsigned long flags)
 	return flags & _TIF_SINGLESTEP;
 }
 
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
+void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags)
 {
 	bool step;
 
-	rseq_syscall(regs);
-
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
-- 
2.34.1

