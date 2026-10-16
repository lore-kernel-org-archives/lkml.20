Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DECF3B6C01;
	Fri, 16 Oct 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137675; cv=none; b=PhyjndinwmRW0Gqv2zKTP+i3oKeQHuIk8olGE2Om6CyfLGeEOa5l2QqTpfdcyv09sJYfhV9UJfoiqb5ffrqzSAa7OfkNcejmZNu236yzKYlZ1MgwLzVTSjEXxZuXUU/6MKV3O2q/NbV3qvXRjlJKqTtFHo6n4KyfUNui42Xdf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137675; c=relaxed/simple;
	bh=3VM9cJ+M/Qe2n6x7GSkX6ul76ZJAEwOb1XhCBiCDjpY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=YBus5xAPQg7wKVGIP67gD46AQ29Km/sW7UDm+OVmDwcEW/yjYK3zREXiYu2zM9gvr9owbmOqJtwUGoSolOmwVphyNSYSQguPEYEKGM2ZpJkPWIhOIUngSvJUAWvwDjUoUyxuVKOk6AmZf5cKwml7DlbtryfrsIt4wIRwl3/MDNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bR/gPNbf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SD/usmhT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bR/gPNbf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SD/usmhT"
Date: Fri, 16 Oct 2026 08:01:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137671;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mow8s7g1/X2pnIF3blu9wtywvOyZOdtHVkFFeJcv6GA=;
	b=bR/gPNbfJtKjY3L8ZJRv4yABN/dFQ3/V1MZyx9WJdu/gCDOTaVAMkSTiihd9dw/SaKjoza
	8P4p/gyzJXxMXQ6fR4t9pBDj38le1GaN158gO34+3fuHyW6TwgsxwEEsIvyqk/athL0WYC
	846bvseXi2Lv8p1/7JghVNUxzkMfjmf0UP8j1OpYHvZx/k1jo73Jt9IiiBQO2UPhGmdRap
	/QL0UA90moOkgSYuQyqgykwdrts0qlhDyT6rNXmSPHl1pzeg+yqHd7PrNPilZEEpaUOpLQ
	DmEJcqRNIpZoY8GeK7xrMvwQxeIi4ZnNs/HXPXIF92ruzrpM9TMN+b8jKUdZqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137671;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mow8s7g1/X2pnIF3blu9wtywvOyZOdtHVkFFeJcv6GA=;
	b=SD/usmhTyvT3lbmprarsXG/sRuLkyDK1og3A7kPwQHHLB+f1O+k5D4LSQkjPmkb9zrNrFl
	z50pueqkgdtIG9AA==
From: "tip-bot2 for vineash" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86: Don't WARN when the ext_regs_buf allocation fails
Cc: vineash <vineash30640@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <179187920064.3441876.15687522011658301558@gmail.com>
References: <179187920064.3441876.15687522011658301558@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213766956.2666988.5589345438223076331.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     f5a78ecccd98a04c47cea1cd63c2a2fdce8a4b48
Gitweb:        https://git.kernel.org/tip/f5a78ecccd98a04c47cea1cd63c2a2fdce8=
a4b48
Author:        vineash <vineash30640@gmail.com>
AuthorDate:    Tue, 13 Oct 2026 16:13:20 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:05 +02:00

perf/x86: Don't WARN when the ext_regs_buf allocation fails

reserve_ext_regs_buffers() wraps the per-CPU ext_regs_buf allocation in
WARN_ON_ONCE(). The allocator already prints a warning with a stack dump
when a GFP_KERNEL allocation fails, so the WARN only repeats it, which
Documentation/process/coding-style.rst asks not to do. The failure is
also handled: the buffers are freed again, the event is still created,
and events that ask for SIMD or extended register sampling are rejected
with -ENOMEM in x86_pmu_hw_config() and event_simd_regs_validate().

syzkaller hit this with fault injection on next-20261002. The trigger
is a plain hardware cycles event opened while no other x86 PMU event
exists, with the allocation failed:

  !per_cpu(ext_regs_buf, cpu)
  WARNING: arch/x86/events/core.c:441 at reserve_ext_regs_buffers arch/x86/ev=
ents/core.c:441 [inline]
  WARNING: arch/x86/events/core.c:441 at x86_reserve_hardware+0x6ff/0x880 arc=
h/x86/events/core.c:458
  Call Trace:
   __x86_pmu_event_init arch/x86/events/core.c:825 [inline]
   x86_pmu_event_init+0x109/0xc50 arch/x86/events/core.c:3003
   perf_try_init_event+0x140/0xbc0 kernel/events/core.c:13261
   perf_init_event kernel/events/core.c:13365 [inline]
   perf_event_alloc+0x2145/0x5680 kernel/events/core.c:13640
   __do_sys_perf_event_open+0x669/0x2d40 kernel/events/core.c:14185
   do_syscall_64+0x12c/0x7b0 arch/x86/entry/syscall_64.c:84
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

Drop the WARN_ON_ONCE(). This matches reserve_ds_buffers() and
reserve_lbr_buffers(), which also handle allocation failure without a
warning.

Fixes: b84c96283684 ("perf/x86: Enable XMM register sampling for non-PEBS eve=
nts")
Assisted-by: Claude:claude-opus-5-5 syzkaller
Signed-off-by: vineash <vineash30640@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/179187920064.3441876.15687522011658301558@gmai=
l.com
---
 arch/x86/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 9b1a903..4df792b 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -438,7 +438,7 @@ static void reserve_ext_regs_buffers(void)
 	for_each_possible_cpu(cpu) {
 		per_cpu(ext_regs_buf, cpu) =3D kzalloc_node(size, GFP_KERNEL,
 							  cpu_to_node(cpu));
-		if (WARN_ON_ONCE(!per_cpu(ext_regs_buf, cpu)))
+		if (!per_cpu(ext_regs_buf, cpu))
 			goto err;
 	}
=20
