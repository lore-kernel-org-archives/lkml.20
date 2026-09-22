Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481236A03B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049314; cv=none; b=UxBPkn8UDDqHHb1SR2pumrIK85awBMIkJeusRz6mzmNvq4PePzNfhEMuEphosHzied3+POBSU1rb1UNpcoVWEvE6uQjENFo4lo34nbjBe/hL0rUx5OWrGdpERoHM3kLHE0T1rlKxkUk6yollp73M9dGYOssgbwu1KVoAKHK3DCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049314; c=relaxed/simple;
	bh=cObXJ+xuZDs82UN2ib69BPv3e0blbSv9ViayzHqWqa4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CParqA65uhQIueFx6uVyTIolxk1XySLoTDlcx8bNPmf5nm4YOO60/RuGPN1LTSbp5lwovmEXFygeW+cj0XMSayJA9GkeHo6U2OnpY5ZU6RMJazlNCJainiTjO5lpCClw3jgnCH4e/thdBOxm8b/WTyEIwpyqHjOLQmTJ4JOjmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HeJCJOzb; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="HeJCJOzb"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=coYeYvAez67iqSXrfIJRz/NQ5fqMdasdPz7aT3OwOME=;
	b=HeJCJOzbQSEqplc2Tz831GERirzie7W0i2Lib/vguoh3SQbjasf23WnAdV+jM1UoBY7A1Tcvy
	iOS9gcwCvaFBYsGe7ityMdTFw/2yPFq4s4ZZm5zNeOoljXbo7bIt8GP8TU7DSF3GDByZVfaaRr4
	+dKJUNTLGxj2y2r6TqldUMI=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hpmDG0ys0z1K97G;
	Tue, 22 Sep 2026 11:43:58 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8737440586;
	Tue, 22 Sep 2026 11:55:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:54:59 +0800
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
Subject: [PATCH v19 00/14] arm64: entry: Convert to Generic Entry
Date: Tue, 22 Sep 2026 11:54:56 +0800
Message-ID: <20260922035510.1090299-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

This series converts arm64 to the generic entry infrastructure.

Currently, architectures such as x86, RISC-V, LoongArch, Powerprc
and S390 use generic entry, which significantly reduces maintenance
burden and improves code elegance. arm64 already adopted generic IRQ
entry in commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"),
making it the right time to complete the conversion.

This work brings arm64 in line with other major architectures,
reducing duplicated code and enabling future improvements like
Syscall User Dispatch and rseq time slice extension optimizations.

The series is rebased on v7.3-rc4 and has been tested with
stress-ng, hackbench, kselftests (ptrace, breakpoints, arm64/abi,
arm64/fp, vDSO), ptrace stress test, and Pseudo-NMI load test.

On gVisor with systrap mode, the Syscall User Dispatch (SUD) feature
yields a slightly lower performance gain on arm64 (3% ~ 5%), similar to
that on x86.

Result: the average over 1M getpid calls, ns/op

| KVM VM Configuration | SUD    | no-SUD | Savings % |
| -------------------  | -----  | -------| --------- |
| 2 vCPU, pinned       | 4269.8 | 4509.5 | 5.3%      |
| 4 vCPU, pinned       | 4175.4 | 4369.1 | 4.4%      |
| 8 vCPU, pinned       | 4352.6 | 4485.4 | 3.0%      |

Link: https://github.com/google/gvisor/commit/a45d6227b521012109cde9a942d644d778eb773b

Changes in v19:
- Rebased on v7.3-rc4.
- Fix build problem as Karl pointed out.
- Remove has_syscall_work() later to make it more clear.
- Add gvisor test data.
- Link to v18: https://lore.kernel.org/all/20260902095537.602517-2-ruanjinjie@huawei.com/

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

