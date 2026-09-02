Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380F42C50D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342917; cv=none; b=fl6bPoGGyVEr6hiHeGy8VVwVATNlkOx3GfeQXI7YeTJVIukVSiV/FpZsCgpfv7/AIhIAK6uC79WqJjlYdN8JnJ6x2Z4upeThlQffs5JiJj0bLULZ1S9ZvgArE7RhxRzsaXkjmJ6zExzvW/W7mf2TTq76w+7ECR3aabGaX5T39to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342917; c=relaxed/simple;
	bh=IddDeEfV/fjrGC1MDv5pJavHPpqpxUhLWVu6y4EtSsQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/+hYS+gA5AxsVcKKlQeskUiJbSXeWE00RuhPPXOBQsBxm34WQpG9cPoSKUIOJxBQofcTcOrK8Y5UIVI6V9D/xBF2cjFpBoPrHp2R1IMYJZrGNsw9QYlBbcGZLqPPjX+lrkD95Eh0rEmClw8doKm3KJPabqwrixWxQXig/GJ7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=WDEPn39y; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="WDEPn39y"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VFUiQ56PPSYmoAUultY8YLBWsGtf+JS3lLeKNy5QVgQ=;
	b=WDEPn39yXQS13YE4m0aaU5DCLNIgAsKWej2Jh/qDYm32U2x5Y55Pr8y6Kj3+qt+AhopF/fSf+
	svFMkDf5dwPFB7qwPWLQo/FlBdx/gFlwYCezF3MwVuHdUm1EVpkgYhae9815Ri7gxlP5LLjFA21
	1siPJcBk9YLecKCYnSxtTjY=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hZd8n0cLnz12LG0;
	Wed,  2 Sep 2026 17:43:53 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 63CAE4058E;
	Wed,  2 Sep 2026 17:55:09 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:55:08 +0800
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
Subject: [PATCH v18 11/14] arm64: syscall: Simplify el0_svc_common() syscall exit path
Date: Wed, 2 Sep 2026 17:55:34 +0800
Message-ID: <20260902095537.602517-12-ruanjinjie@huawei.com>
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

Remove the redundant nested conditional check within the system call
exit path of el0_svc_common() to streamline the exit sequence.

The fast-path block is guarded by `!IS_ENABLED(CONFIG_DEBUG_RSEQ)`,
so CONFIG_DEBUG_RSEQ is guaranteed to be disabled and the call of
rseq_syscall() is a no-op. Under this constraint, the code logic
inside the block becomes completely identical to what
the arm64_syscall_exit_to_user_mode_work() helper already does.
Replace that nested logic with a direct invocation of the helper,
eliminating redundant code.

Before:

| if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
| 	flags = read_thread_flags();
| 	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
| 		arm64_syscall_exit_to_user_mode_work(regs);
| 	return;
| }
| trace_exit:
|	arm64_syscall_exit_to_user_mode_work(regs);

After simplify:

| if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
|	arm64_syscall_exit_to_user_mode_work(regs);
|	return;
| }
| trace_exit:
|	arm64_syscall_exit_to_user_mode_work(regs);

Furthermore, Since both the conditional fast-path and the fallback
slow-path now uniformly invoke arm64_syscall_exit_to_user_mode_work(),
this explicit conditional branch is entirely redundant regardless of
whether the evaluation is true or false. Removing it collapses
the duplicated logic into a single, unconditional path.

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index a8e0bf8d362e..3488afd45d20 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -114,19 +114,6 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	}
 
 	invoke_syscall(regs, scno, sc_nr, syscall_table);
-
-	/*
-	 * The tracing status may have changed under our feet, so we have to
-	 * check again. However, if we were tracing entry, then we always trace
-	 * exit regardless, as the old entry assembly did.
-	 */
-	if (!(unlikely(flags & _TIF_SYSCALL_WORK)) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
-		flags = read_thread_flags();
-		if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
-			arm64_syscall_exit_to_user_mode_work(regs);
-		return;
-	}
-
 trace_exit:
 	arm64_syscall_exit_to_user_mode_work(regs);
 }
-- 
2.34.1

