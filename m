Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3343E5592
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049316; cv=none; b=ikmJ98Af/whTN8jFh94XERIuxwJ5lXKfJjHQasctQfP4vs2PkL+QASKKBGYKYXAvcptShfZYasMz3JCzhNVGkyeiHLEBjwBXqLBlEBNeWO8VKDPk8s8rBpNOR7Byk/AqkqPvgpGeNi4Mn7hJ5Es+syDD1RbkPKb9pNzoKvMlWI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049316; c=relaxed/simple;
	bh=n+Tg869FhEEiTqPHyWfEnIX4Vwk/KH+sP2eHmVex2Tw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQL+6MnLmDe9cXj6XkvhFfd8GE2Hoa1HdhYw2cuV4TpP2X42LcZzmBVTtGfJaLWJFn6NGlSScVcygcw7sqB/toIVAX2ZDKMmuMiWO4Uh+FD0owtBc3vhQL+RDjD58c/+elOENUXI6J+lfKSeBgPS0Ajp64pa41jM+CObzWbUR60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=VHIMjQnS; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="VHIMjQnS"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fscORP/Ua4vjA6xBbJI+MbSVspWXri5IAzXeu3EhZoo=;
	b=VHIMjQnSXL4yFb4I+cGDBOANmgmDL1BLuwJObcJhqlstUtYFW+cVVi7X13XgRs/d+EO4rup4c
	7QwlhmyBKpZk0VT9QOV8TwWk15BDGDkFvvE67nYT/ZH0wVPghPWITqhixBSmVJpqFPqLpX/T1+q
	bsmoLYKngSWHxZn8sHQP9D8=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hpmD24JCVzcb3J;
	Tue, 22 Sep 2026 11:43:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A7A440579;
	Tue, 22 Sep 2026 11:55:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:07 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <yeoreum.yun@arm.com>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<vladimir.murzin@arm.com>, <tglx@kernel.org>, <broonie@kernel.org>,
	<liqiang01@kylinos.cn>, <ryan.roberts@arm.com>, <pengcan@kylinos.cn>,
	<kmehltretter@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v19 12/14] arm64: ptrace: Make return type of arm64_syscall_trace_enter() bool
Date: Tue, 22 Sep 2026 11:55:08 +0800
Message-ID: <20260922035510.1090299-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922035510.1090299-1-ruanjinjie@huawei.com>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

In preparation for migrating arm64 to the generic entry infrastructure,
decouple the decision to execute the syscall from the syscall number
itself. The ptrace and seccomp now returns a boolean flag rather than
overloading NO_SYSCALL (-1).

Changes:
- arm64_syscall_trace_enter() returns bool:
  - false: abort syscall execution
  - true: proceed, with syscall number reread from regs
- If we decide to execute the syscall, reread the syscall number
  and check if it is NO_SYSCALL again. Because when a tracer sets
  the syscall number to -1 and provides a custom return value in x0,
  this avoids calling invoke_syscall() which would overwrite the custom
  value with -ENOSYS by sys_ni_syscall().

Behavioral impact (unchanged):
- User-issued syscall(-1): unchanged, returns -ENOSYS.
- Tracer skip with custom x0: unchanged, returns custom x0
- Tracer skip without setting x0: unchanged, returns original
  argument (garbage)
- Normal syscalls and seccomp rejects: unaffected

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Can Peng <pengcan@kylinos.cn>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Li Qiang <liqiang01@kylinos.cn>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 2 +-
 arch/arm64/kernel/ptrace.c       | 8 ++++----
 arch/arm64/kernel/syscall.c      | 6 +++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 7cc872fde019..f19d4a8824ba 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -121,7 +121,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
+bool arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
 static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 610a79c1072b..c304c062abbb 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2470,14 +2470,14 @@ static inline void syscall_enter_audit(struct pt_regs *regs)
 static inline void syscall_enter_audit(struct pt_regs *regs) { }
 #endif
 
-int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
+bool arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
-			return NO_SYSCALL;
+			return false;
 
 		/* ptrace might have changed thread flags */
 		flags = read_thread_flags();
@@ -2486,7 +2486,7 @@ int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	/* Do the secure computing after ptrace; failures should be fast. */
 	if (unlikely(flags & _TIF_SECCOMP)) {
 		if (!__seccomp_permit_syscall())
-			return NO_SYSCALL;
+			return false;
 	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
@@ -2495,7 +2495,7 @@ int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	if (unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
-	return syscall_get_nr(current, regs);
+	return true;
 }
 
 static inline bool report_single_step(unsigned long flags)
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 3488afd45d20..72c6e8b7ab21 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -108,7 +108,11 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = arm64_syscall_trace_enter(regs, read_thread_flags());
+		if (!arm64_syscall_trace_enter(regs, read_thread_flags()))
+			goto trace_exit;
+
+		/* Reread the syscall number as it might have been modified */
+		scno = syscall_get_nr(current, regs);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
-- 
2.34.1

