Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878277;
	b=W/Qggc8ehaV3RlV2PSs1YmIscd6J6N4cNE0b9ZfIYjxzMZ2eJvsLq84abuXvexULtmq9
	 ywXgfdJiQeWrq4rbx4/nuWqshaLfjUAbUBczs4FwrCLhQytEDfATeFVglOow951gAeQ76
	 +Mv+3C3vPeMiGTkwsLtQzBwATJFOyNEnSKjzEl9btvCDZrICO2EjtUGRtBaZYz3s6tRw3
	 U9kFI3EEXHXY2nOUFU0JwfmK91umXKTNegkOzBm2ieLcZtbJkuslHtcbF4yj+BbUSr+Q2
	 y5aqVmOj/WDztPMFALEHKw+V6thZ+JOA+DJP2zrGR8pDkLuO9IHRlJS+rkFN/ZTP8RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878277;
	h=DMARC-Filter:DKIM-Signature:Subject:Message-Id:X-Original-From:To:
	 Mime-Version:X-Mailer:Content-Type:X-Lms-Return-Path:Cc:From:Date:
	 Content-Transfer-Encoding;
	bh=zymeiVDTaUbGUlbbf+xNjeEXqeiZrg115S/5RHw+xnk=;
	b=qFUb3aKxCOpc1onNmi6mkjjQ0HCpasYkJUDWGW4Remvvt+XEkEOKtc+c4zkoU9an8rZa
	 T7feTU9tbtme6rM70/gWTAoInPoj7WaYW4f8ySB2bfXFxm24GgJOC/rQuNgRDEa6ZGxNx
	 Sm5fuwbAy3NABRtIBonDqNjd1+brlYkOQTHh5z7Fsercav3XTPiJ+Q5E0E2tY3JOHTDoY
	 PVME1CePFAxXydAuaZvNZetzprfppO6KEYilNRQdW4lAEnbKXphIghLeVTT8GInHvOvV4
	 oC6hpmQtw3mr1/GRqtCvkICpAUT3kkcDRwfHEcKnXedlnfNcrzvPDLCPApqQqFdUqbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=OwLxvOop;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F6606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=OwLxvOop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793878270; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zymeiVDTaUbGUlbbf+xNjeEXqeiZrg115S/5RHw+xnk=;
 b=OwLxvOopyZ2MHz1nN7fThc31W2ovFn5j2sFnYyK9VDUdLNca2M+l2kljmPrxgcrD6HpsbL
 aTXlLoo4cJMOyGr+7X+a0NISrwXeNDsKZD50MkJB5/XV70dj1aSObRKcrVP57OW0du21St
 +4tdlxRvUslJU7ePcAS7Uc7Xerq3r6m6c9sqHPi/l4TwkRZERSjb6Y2SCvTCsjk4b8EpBM
 DenqL0PDcfROblA96ZA4OHb1GjhWFaOWm2egCKk9p1aZ/6/v4T9nPrvyUKRQ0t3g1D+D2x
 DfJTbMt/mohr1W4mO+gnrlVi2TwA7ZM55KJoqHglyQsZb/3Z8x8STqUAfAWr8Q==
Subject: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a group-stop
Message-Id: <20261105113051.97810-1-zhaogongyi@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26aec68fc+73c463+vger.kernel.org+zhaogongyi@bytedance.com>
Cc: <mark.rutland@arm.com>, <oleg@redhat.com>, <ruanjinjie@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Thu,  5 Nov 2026 19:30:51 +0800
Content-Transfer-Encoding: 7bit

PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
which calls ptrace_stop() without siginfo. If the tracer writes
NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
NO_SYSCALL before update_syscall_orig_x0_after_ptrace() checks
last_siginfo. WARN_ON_ONCE(!info) then fires for a valid ptrace stop.

Keep the early return when siginfo is absent, but remove the warning.
This leaves orig_x0 untouched at a non-seized group-stop and preserves
the existing syscall-exit-stop handling.

Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Changes since v2:
- Keep the early return on missing siginfo, as requested by Will.
- Remove v2's NULL guard on the syscall-exit-stop check, which is no
  longer needed after the early return.
- Update the comment to describe the non-seized group-stop case.

v2: https://lore.kernel.org/r/20261023110710.10145-1-zhaogongyi@bytedance.com

A local early-return variant was exercised on arm64 KVM with a non-seized
PTRACE_ATTACH group-stop and an NT_ARM_SYSTEM_CALL write. The write
succeeded without a kernel warning. Additional signal-handling probes
compared this behavior with v2; neither kernel reported a warning,
BUG, KASAN issue, or panic.
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbe..ecaa09b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -573,8 +573,8 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
 	if (regs->syscallno == NO_SYSCALL)
 		return;
 
-	/* We should only be called when target is in a ptrace stop */
-	if (WARN_ON_ONCE(!info))
+	/* Non-seized group-stops do not provide siginfo (see do_jobctl_trap()). */
+	if (!info)
 		return;
 
 	/*

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)
