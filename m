Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEC42B301
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342914; cv=none; b=pLQVu6LpO/A6M3c8u9xgVXX4p0FXQBalRpTO8xnr00o8ir101x5rXOX1ZFQGQAYaKaP5OZyuNN9bB9dfQunclyF+MSmR7GPH/f/glzXPCOqa8g9MfMRj48VwjnFZqI4vzlXkwMfG3czN5ch+EPU8Yc9D0WbDkhA8o6vix4sRjUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342914; c=relaxed/simple;
	bh=Jdr3ln7KXGrq36YCKA0/b6vG+5RrjK+NoGbcIpAzUG8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtlmckX+XYvcjtTK6x/RyD6PnzAz70kiD9yuYmIunZgj0ZWlu+SptVnZQj1DnvGD8EioD6Xp/dvMa1POKRdwadUMSOPh5WobX7laXzpB95lhJEbf8+GVziLibEvwvsgwtSKnJ9S0K6sDMsS4XvLWg7fqsMaK+uMLbEZnbJRNfe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rpT9N5Tu; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rpT9N5Tu"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/ZCmpI5ilpbz/FIQqVGzltAknX2qQEJHrIQ0Yhx+vwM=;
	b=rpT9N5TuflYk1bmaV/pSQWSRat7xhSvNXh41qo/pC6UswEPuaQFCDFSZCR8Le5hQb8Nl6qN11
	toraYJvVhhgg7tHrAq12btnKjxh9shwSqm8DzSYfjZP5GsO0MDPjxhTlRfeLZ5hgbzXS91dzfp8
	rMLi9oY+LchY2CiEbEVKTHk=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hZd973jZZzRhVJ;
	Wed,  2 Sep 2026 17:44:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6FECA4058E;
	Wed,  2 Sep 2026 17:54:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:54:58 +0800
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
Subject: [PATCH v18 03/14] arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
Date: Wed, 2 Sep 2026 17:55:26 +0800
Message-ID: <20260902095537.602517-4-ruanjinjie@huawei.com>
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

Refactor syscall_trace_enter() by open-coding the seccomp check to
align with the generic entry framework.

The generic entry implementation expands the seccomp check in-place
by testing SYSCALL_WORK_SECCOMP and directly calling the underlying
__seccomp_permit_syscall() function. Moreover, generic entry explicitly
re-reads work flags after ptrace handling to ensure any updates to
seccomp work flags during the ptrace stop are observed.

Bring arm64 in line with this behavior:
- Re-read thread flags after ptrace handling.

- Test the updated flags for _TIF_SECCOMP and call
  __seccomp_permit_syscall().

No functional changes are intended; this change simplifies future
migration to the generic entry framework.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/all/20260713025712.416366-1-ruanjinjie@huawei.com/
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index ede6f3bf29e0..bb1b3261b767 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2478,11 +2478,16 @@ int syscall_trace_enter(struct pt_regs *regs)
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
+
+		/* ptrace might have changed thread flags */
+		flags = read_thread_flags();
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
-	if (!seccomp_permit_syscall())
-		return NO_SYSCALL;
+	if (unlikely(flags & _TIF_SECCOMP)) {
+		if (!__seccomp_permit_syscall())
+			return NO_SYSCALL;
+	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
-- 
2.34.1

