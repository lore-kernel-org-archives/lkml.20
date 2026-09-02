Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5F42EEDA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342913; cv=none; b=YYTTjvluLm7uLNjTZ4NXpx7U3DPuHQfIctn1+1UDrkNHFx1DDijLcP3UdlZW+5Fu0B0MAiNldkmksiTltXbiDWTHIHE2hLvpRmDQ3i4mXkHAVPAi8RkC8uHiRLLGzJuozP067CqwzVWprpZC01TEZjxOI54wtVClUiPqrE0B6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342913; c=relaxed/simple;
	bh=I5Md7Lbufy/N98rSj2HN6I/iv7kg6i4YH3IzpXuTcEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ATHAkr5/+KgIaPWThOupKrYPEKTVdNMhKakEIuOFVnwjXzEScgbetRpSyWkwJLABi4sUhV3Mz5va5dJ23ABr5xBHKrWYhqlILikP15Bm+kKzNh9cvGgJ/9QtE2b2jWWqy2dsMvNkoqUzE1nM/RXTg41jcqP+iZooFspsOSkSoNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=FJmiMl67; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="FJmiMl67"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kAf/nNR8HHqMYLpYQ0QlqlNtM4B7wPnvDV7tS7QLCUI=;
	b=FJmiMl67ze5ynmXSiSZqC7Od13NzNSTui1ckmmkkQoOoGuNNB6Vo5gGdSwXHjllgTexNMnAjd
	l6KzDsPoyVyvncGWdojYByeIyXbESsQVQpffTLQRPDwkjcL25ce2PR2SeBRs6CCg/zIoYZerjlh
	GBfquV7mquE+DnSsOwVjjY4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hZd9C0Trkz1cyVL;
	Wed,  2 Sep 2026 17:44:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6975A4057A;
	Wed,  2 Sep 2026 17:55:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:55:03 +0800
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
Subject: [PATCH v18 07/14] arm64: ptrace: Pass thread flags to trace enter/exit
Date: Wed, 2 Sep 2026 17:55:30 +0800
Message-ID: <20260902095537.602517-8-ruanjinjie@huawei.com>
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

Move the reading of thread flags from inside arm64_syscall_trace_enter()
and syscall_trace_exit() to their callers.  This aligns the function
signatures with the generic entry framework, where the caller
is responsible for supplying the flags.

In el0_svc_common(), the flags are now passed directly to the tracing
functions, and re-read before the enter/exit path to reflect any updates.

No functional change intended; this is a preparatory step for
converting arm64 to the generic entry infrastructure.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h |  4 ++--
 arch/arm64/kernel/ptrace.c       |  6 ++----
 arch/arm64/kernel/syscall.c      | 11 +++++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index d1dabdcde41c..696739f5a250 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int arm64_syscall_trace_enter(struct pt_regs *regs);
-void syscall_trace_exit(struct pt_regs *regs);
+int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
+void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 05800664695c..ed970576d9a7 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2469,9 +2469,8 @@ static inline void syscall_enter_audit(struct pt_regs *regs)
 }
 #endif
 
-int arm64_syscall_trace_enter(struct pt_regs *regs)
+int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
-	unsigned long flags = read_thread_flags();
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
@@ -2506,9 +2505,8 @@ static inline bool report_single_step(unsigned long flags)
 	return flags & _TIF_SINGLESTEP;
 }
 
-void syscall_trace_exit(struct pt_regs *regs)
+void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 {
-	unsigned long flags = read_thread_flags();
 	bool step;
 
 	rseq_syscall(regs);
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index b8d7d29a431b..e778aac6fab9 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -113,7 +113,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = arm64_syscall_trace_enter(regs);
+		scno = arm64_syscall_trace_enter(regs, read_thread_flags());
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
@@ -127,13 +127,16 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
-			syscall_trace_exit(regs);
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP) {
+			flags = read_thread_flags();
+			syscall_trace_exit(regs, flags);
+		}
 		return;
 	}
 
 trace_exit:
-	syscall_trace_exit(regs);
+	flags = read_thread_flags();
+	syscall_trace_exit(regs, flags);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1

