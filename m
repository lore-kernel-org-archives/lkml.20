Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA242FCD6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342906; cv=none; b=ZgffRF0y6SOH/xs2zxDb/IqOlUmNbfD1puhaRRPXw6uKxDMmeN5ob0RBPtNx5fH9V1I5//7/VVOtUR1w8FCDIv5VV05lUoLq0BXTU+kImeMvfGdmzmHeuvNGOiA9+/7qmadTGDjk6kbKQSnE4o4G4p6sjg59OoYp+KV0x6/0mTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342906; c=relaxed/simple;
	bh=uT4XYQHoHzi/lu/+zICWgAU0vM+SNBi7J74IpgAjKfw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BkXBSsNLROcCXYfkTI9qECAJVEBmkjKz4DkgRWmZQ+KvK4IGN9MUKuToOaZkxmG/b6TQS1h8vb2s3+sJwzdcQtLdNtZgGuYlTSl5tIhMvUvX5Yb9FgyQcBLa13uwqGFrcNUGV3Yc0zTxXHl2HfnMHt811YoWWeXZkEyb5qZ+gOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ZIjnuske; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ZIjnuske"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=o5xw+YhmmG8c70Lw7ybuOW5FCpeaQgtQkW7/7eu2afU=;
	b=ZIjnuskee+CXN3biF48vPMwNU3fNdLgWh0Uo2C8+yXQ03ctNF9GskYOwoZ20aowe6Z8fGPC6A
	YgHV533PGC9i79FTZSRQqM5eXtX5CQxgEV8cfCYPe92q2u/ONDyih7QDl+wsriMW9vytTkmdmEQ
	bOjzZR+VYSsAnTBKcMi2sDc=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hZd925TyBzmVXM;
	Wed,  2 Sep 2026 17:44:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id ED6CF4057A;
	Wed,  2 Sep 2026 17:54:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:54:55 +0800
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
Subject: [PATCH v18 01/14] arm64: ptrace: Fix redundant syscall exit stop for PTRACE_SYSEMU_SINGLESTEP
Date: Wed, 2 Sep 2026 17:55:24 +0800
Message-ID: <20260902095537.602517-2-ruanjinjie@huawei.com>
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

PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
arm64 currently reports a syscall exit stop whenever _TIF_SINGLESTEP is
set, regardless of emulation state.

This violates the ptrace man page (Syscall-stops section):

	"If the tracee was restarted by PTRACE_SYSCALL or PTRACE_SYSEMU,
	the tracee enters syscall-enter-stop just prior to entering any
	system call (which will not be executed if the restart was using
	PTRACE_SYSEMU, regardless of any change made to registers at this
	point or how the tracee is restarted after this stop). ...
	If the tracee is continued using any other method (including
	PTRACE_SYSEMU), no syscall-exit-stop occurs. Note that all mentions
	PTRACE_SYSEMU apply equally to PTRACE_SYSEMU_SINGLESTEP."

Fix by introducing report_single_step(), which returns false when
_TIF_SYSCALL_EMU is set, skipping the redundant exit stop.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Fixes: ac2081cdc4d9 ("arm64: ptrace: Consistently use pseudo-singlestep exceptions")
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1c3a..96462de75d4b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2482,16 +2482,26 @@ int syscall_trace_enter(struct pt_regs *regs)
 	return regs->syscallno;
 }
 
+static inline bool report_single_step(unsigned long flags)
+{
+	if (flags & _TIF_SYSCALL_EMU)
+		return false;
+
+	return flags & _TIF_SINGLESTEP;
+}
+
 void syscall_trace_exit(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
+	bool step;
 
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
-	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
+	step = report_single_step(flags);
+	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
 
 	rseq_syscall(regs);
-- 
2.34.1

