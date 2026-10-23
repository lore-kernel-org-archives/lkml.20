Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753654;
	b=RNoouXdmnVS6Uf0EU5UN7NQNaiQBZYpu3nlgcLgXRYMrbImISjnrNpp9zk8WsvzVab3b
	 0KX3CiyXXf85aC1a06mIXkBf2rMapaXrF+gqgqOLwIJXpMffO5KJZoIy92R63E89apnRj
	 NeSupSVpV3izCoRb3izt9Q8c3igg5WMPfnFRD936WW1VUy3t7s90g3poaB8oxjsGEkieC
	 ecWi2tfaSESSG2OMeE8vIJlsDjXhFSSgXKSx6xJioxmCtMwDFAB49h5h2zH0BDwAxkA1w
	 coip6GXcGtjW9wpql2zCBZxM5TbaNhk8afOGgmK/KEK2qqKJ2YK4ffW19i7ley8gpHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753654;
	h=DMARC-Filter:DKIM-Signature:Date:X-Lms-Return-Path:From:Subject:
	 Content-Type:To:Content-Transfer-Encoding:Message-Id:Mime-Version:
	 X-Mailer:X-Original-From:Cc;
	bh=i+/XEGN5akkFk1oc7cCo+cEyH5qYPWd1RI6IHrGAL3A=;
	b=FKUtx47jp0ZaDMjDt2thxftU0pkxQGfKjEnI8ILunSuNQgMB7q6ALgLseIjyzdG9sudK
	 Q+J/QV0lk7C+jXnBcj94sG4ABFt69LmYeo4clkqlaBVxUSwjLb4fQHXnwba6EIVFr4SWs
	 GLZ9GZ7GduoMkpSYC2/ZLCOTeoEO4AsRCERmG3iSVFwnp92GbfyTmOSSkFAyaPTFDpFcE
	 91pZKrKWh7DBTrqaRckwaDyEmUMtAUd1cMln+6h+UR8N0cWVYt86n9uj+lFI2/Q5Spcs6
	 YHXUoPaTyy/D7KCiQFBMOKsQlOmIfkN7VbPQte3Q0ZrGYihJzEHq1WzCBxrE7raT/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=VAu0Tmc2;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0553D606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0553D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=VAu0Tmc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792753648; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=i+/XEGN5akkFk1oc7cCo+cEyH5qYPWd1RI6IHrGAL3A=;
 b=VAu0Tmc2yfuEj3hdp1OL2vyB+b//1R/ZQYhfPI0bgP2JIvRWGlZdtzLlOtM6QICJQduqAi
 aUhzIW/HqOC3/fwCsHq1/JwkGE67xr6yj/5MASQOaKIpLs0ISZv9+CkCdCVJbybSfjP9Rc
 tP4/xyVMwU/OqrRhZtEj/a99iNXsW8fCBGhZ6AVabmPHPe0ss3jUd12F1YXAhgIeWZ/o8f
 z/G/I2Y+0FigMdBK25CQutlJcnQDXRgVvJKqiZkMvQqfSzLhlNFWCdnkH5Ii0kSZqf1YQA
 jI4LfZ1zzuUfRWC4ZWHmX7E0MysCRpSfE24Eq0IONOxCXs2cCR6aJPwvoP2eUA==
Date: Fri, 23 Oct 2026 19:07:10 +0800
X-Lms-Return-Path: <lba+26adb3fee+973ca5+vger.kernel.org+zhaogongyi@bytedance.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a group-stop
Content-Type: text/plain; charset=UTF-8
To: <catalin.marinas@arm.com>, <will@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <20261023110710.10145-1-zhaogongyi@bytedance.com>
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
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: <mark.rutland@arm.com>, <oleg@redhat.com>, <ruanjinjie@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>

PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
which calls ptrace_stop() without siginfo. If the tracer writes
NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
NO_SYSCALL before calling update_syscall_orig_x0_after_ptrace(). The
WARN_ON_ONCE(!info) then fires, although this is a valid ptrace stop.

Remove the warning and guard the syscall-exit-stop check against a
missing siginfo. Keep recognizing both SIGTRAP and SIGTRAP | 0x80:
syscall-exit-stops use either value depending on whether the tracer
enabled PTRACE_O_TRACESYSGOOD. With no siginfo, allow the final
assignment to synchronize orig_x0 from x0.

Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Changes since v1:
- Remove the warning and early return, as suggested by Oleg.
- Keep recognizing syscall-exit-stops with or without PTRACE_O_TRACESYSGOOD.

v1: https://lore.kernel.org/r/20261016024536.18938-1-zhaogongyi@bytedance.com

Tested on arm64 KVM at af32da41b032 with this v2 applied.
At a group-stop, PTRACE_GETSIGINFO returned -EINVAL and an
NT_ARM_SYSTEM_CALL write succeeded. Syscall-entry and seccomp
x0 rewrites worked. At syscall-exit-stops, NT_PRSTATUS writes succeeded
with and without PTRACE_O_TRACESYSGOOD (si_code 133 and 5,
respectively). No kernel warnings occurred.

 arch/arm64/kernel/ptrace.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1..22fb9eeed 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
 	if (regs->syscallno == NO_SYSCALL)
 		return;
 
-	/* We should only be called when target is in a ptrace stop */
-	if (WARN_ON_ONCE(!info))
-		return;
-
 	/*
 	 * For compat tasks, orig_r0 is provided directly through GPR index
 	 * 17.
@@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
 	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
 	 * return value of the system call.
 	 */
-	if ((info->si_code & ~0x80) == SIGTRAP &&
+	if (info && (info->si_code & ~0x80) == SIGTRAP &&
 	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
 		return;
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)
