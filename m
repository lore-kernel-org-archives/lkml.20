Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B3C42C4FA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342908; cv=none; b=KnJK5iF8Z4UtN4FwE9cBIzcg1QmPDBJfplrio6mimNFPKtz3qOTr7vvh4rZpOhMv2am1oGAnBbE/4o999cfJW+EqrdHE1DnISe0bkQNQwWcfDoixmFVtAqUmBxOL1ld1QXkL4qNfIjp8wyi49Gn/KNhgHDGD7P4T5cU8HVYQePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342908; c=relaxed/simple;
	bh=TIbbwk5s8CH0rjAb0EPd2tFO7Y5ZS2gmf4B1SMvx/DY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QBGfAe6fJs3sZmr1LrrbxKOOKnjzJo35+bs7Sl7kTCme7B0itBI+9Iu7SlWVufOqsxNOKpAYM9dFqTCa6ZuPjLmzZzMy5myiFVx4l3uVSyBzXQ9GSlYMaeDpLA9NTJuO9pljU0E5r6w/pOWhL1zxU/z92pKPmz5o33br/BOTu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rFI4Rufm; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rFI4Rufm"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0RdpgugXCN6KiFRaFayYGHsLsytNnS2Q4yP7YGlevS4=;
	b=rFI4RufmbHVr1NRPLfEoPVQYC/jqnsCLhuHr9XoTjAx9+RDZZ3HFMV3aGNDQWa3NQBigUEi2N
	+w+um++Sb1MmxQEk+3EUGNeElRrS9ZJ9YMWJ+5EeM9nUNlSWWf7wLFWq3r1PQvf5UbjzhduvTEa
	wqWE0X8O0aTwaKLxQ2t9Rig=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hZd9233Fkz1cyQh;
	Wed,  2 Sep 2026 17:44:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id BD15040565;
	Wed,  2 Sep 2026 17:54:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:54:54 +0800
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
Subject: [PATCH v18 00/14] arm64: entry: Convert to Generic Entry
Date: Wed, 2 Sep 2026 17:55:23 +0800
Message-ID: <20260902095537.602517-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)

This series converts arm64 to the generic entry infrastructure.

Currently, architectures such as x86, RISC-V, LoongArch, Powerprc
and S390 use generic entry, which significantly reduces maintenance
burden and improves code elegance. arm64 already adopted generic IRQ
entry in commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"),
making it the right time to complete the conversion.

This work brings arm64 in line with other major architectures,
reducing duplicated code and enabling future improvements like
Syscall User Dispatch and rseq time slice extension optimizations.

The series is rebased on v7.3-rc1 and has been tested on Kunpeng HIP09
with stress-ng, hackbench, kselftests (ptrace, breakpoints, arm64/abi,
arm64/fp, vDSO), ptrace stress test, and Pseudo-NMI load test.

Changes in v18:
- Rebased on v7.3-rc1.
- Drop the SUD patch as Mark suggeted.
- Update the commit message.
- Add Reviewed-by.
- Link to v17: https://lore.kernel.org/all/20260721081858.1169276-1-ruanjinjie@huawei.com/

For changes in v7 to v16, please refer to the individual patch threads:
- v16: https://lore.kernel.org/all/20260629130616.642022-1-ruanjinjie@huawei.com/
- v15: https://lore.kernel.org/all/20260511092103.1974980-1-ruanjinjie@huawei.com/
- v14: https://lore.kernel.org/all/20260320102620.1336796-1-ruanjinjie@huawei.com/
- v13: https://lore.kernel.org/all/20260317082020.737779-1-ruanjinjie@huawei.com/
- v12: https://lore.kernel.org/all/20260203133728.848283-1-ruanjinjie@huawei.com/
- v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/
- v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/
- v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/
- v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
- v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/

Jinjie Ruan (14):
  arm64: ptrace: Fix redundant syscall exit stop for
    PTRACE_SYSEMU_SINGLESTEP
  arm64: ptrace: Rework audit_syscall_entry()
  arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
  arm64: ptrace: Rename and clean up syscall_trace_enter()
  arm64: ptrace: Protect rseq_syscall() from tracer PC modifications
  arm64: syscall: Rework the syscall exit path in el0_svc_common()
  arm64: ptrace: Pass thread flags to trace enter/exit
  arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work() helper
  arm64: ptrace: Align syscall exit work semantics with generic entry
  arm64: syscall: Use exit-specific flags check in el0_svc_common()
  arm64: syscall: Simplify el0_svc_common() syscall exit path
  arm64: ptrace: Make return type of arm64_syscall_trace_enter() bool
  arm64: entry: Convert to generic entry
  arm64: Inline el0_svc_common()

 arch/arm64/Kconfig                    |   2 +-
 arch/arm64/include/asm/entry-common.h |  77 +++++++++++++++++
 arch/arm64/include/asm/syscall.h      |   5 +-
 arch/arm64/include/asm/thread_info.h  |  16 +---
 arch/arm64/kernel/debug-monitors.c    |   8 ++
 arch/arm64/kernel/entry-common.c      |   2 +-
 arch/arm64/kernel/ptrace.c            | 115 --------------------------
 arch/arm64/kernel/signal.c            |   2 +-
 arch/arm64/kernel/syscall.c           |  34 +++-----
 9 files changed, 102 insertions(+), 159 deletions(-)

-- 
2.34.1

