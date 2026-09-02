Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAB415F2E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342910; cv=none; b=UGZRH3ny3k3LHUEujlqCz/Zz980/67OJfXDJCA1ReK8ifvGMYlx3GI+oCLZS2lyDpZCAG4cbrF8lvodnyY7BlZh05vPhu2mNNXpTHEdPpBjiYLArWTBHp885E4KxlzYenygehpYTz95biQ1Rwi4K5BFU8VCJ5qg36erc9kL9y/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342910; c=relaxed/simple;
	bh=lwvCQkIp/yfl+NRCEGXg75MolCN7sDNZfOS0Hn2yg/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGQ1eUVmpAmD0TtiZp+ACIf5g4RERvVsc+Ad9ZtDWEIyg+6bXvaqlJoz7xWYI4Sm7ODVmxYaP3N5c/M6MuX5Xk6PKPV6OfUj73eDkWjfdWhv5paNW19iIm4nvuD8WvTKwZneO8B+JK9T+UUdMB0JDqu4FrbYV6ejCPYCEwZDioU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xcHNuANS; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xcHNuANS"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uaX39/CE0Q5UxvlotHbRwxFXgD9FMOYuW98v5zboCb0=;
	b=xcHNuANSzX9n+igcAqjiUBDz1CrooEDLf+EJ7mbDAmiiGQ72Hlu+8cgu2yV5hPOWJczpEr6Yg
	coYmblX4RpoQS8AQQhSLPuiwf+g3lEgKZTIB4kNXSvsLepWCqmuOYmP2hw0b1kf6WuGJT0Tkcof
	AW0LX0rr1BrhLwm/vJEU60s=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hZd8S4L0dz1T4gl;
	Wed,  2 Sep 2026 17:43:36 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 357154058E;
	Wed,  2 Sep 2026 17:54:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:54:56 +0800
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
Subject: [PATCH v18 02/14] arm64: ptrace: Rework audit_syscall_entry()
Date: Wed, 2 Sep 2026 17:55:25 +0800
Message-ID: <20260902095537.602517-3-ruanjinjie@huawei.com>
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

Extract syscall_enter_audit() helper and switch to generic helpers to
get syscall number and syscall arguments, matching the generic entry
implementation.

The new code:
- Checks audit_context() first to avoid unnecessary work when audit
  is not active.
- Use syscall_get_arguments() helper instead of directly accessing
  regs fields.
- Use syscall_get_nr() helper to get syscall number instead of directly
  accessing regs->syscallno.
- Now exactly equivalent to generic entry's syscall_enter_audit().

This is a preparation step for converting arm64 to the generic entry
infrastructure. No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 96462de75d4b..ede6f3bf29e0 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2458,6 +2458,17 @@ static void report_syscall_exit(struct pt_regs *regs)
 	}
 }
 
+#ifdef CONFIG_AUDITSYSCALL
+static inline void syscall_enter_audit(struct pt_regs *regs)
+{
+	long syscall = syscall_get_nr(current, regs);
+	unsigned long args[6];
+
+	syscall_get_arguments(current, regs, args);
+	__audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+}
+#endif
+
 int syscall_trace_enter(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
@@ -2476,8 +2487,8 @@ int syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
 
-	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
-			    regs->regs[2], regs->regs[3]);
+	if (unlikely(audit_context()))
+		syscall_enter_audit(regs);
 
 	return regs->syscallno;
 }
-- 
2.34.1

