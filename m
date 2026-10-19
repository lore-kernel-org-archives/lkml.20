Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B53DEECB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374791; cv=none; b=evfgEJEA5tZqaIfMU0RxIXI0yuyJMVIRjkKNH2zP1ec3BFlRQKIMAYhbr6ozKww9cczxzW9tjHVb6nAJBejukIDmlFygmrFOluiRmH3amzvmrqDKgcPj0bIy2Zu+RqtIEELJllXoY3Rt0P9lUR2TczThAvKwPMWZR1nvh064aho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374791; c=relaxed/simple;
	bh=J1xRBo8oWJWQh/bE8A9/RXL9xSzWaVfZb5GiXxnIUXo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dmPJRY2IU5pD5dkGMNBu5lurisw4NU3Qu5aHNIb/p4FrE6lsWj49y19cor3fe1ZL9V52gLYsR6otmLcl1Ce0ZVWXt/zupUgGUzFQC2yC6hcpuxztKIpbR34tufLO4bayFA48WeCfFcCe17WRBVuLDoJlM0SkKmPR0JN6eHYxIj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=p8rGh+pu; arc=none smtp.client-ip=23.83.209.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="p8rGh+pu"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 92563461F9B;
	Mon, 19 Oct 2026 01:35:06 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (100-96-7-166.trex-nlb.outbound.svc.cluster.local [100.96.7.166])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2BFA2461E98;
	Mon, 19 Oct 2026 01:35:02 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Exultant-Well-Made: 527d0515463621f7_1792373706455_3594791401
X-MC-Loop-Signature: 1792373706455:4251318137
X-MC-Ingress-Time: 1792373706455
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.7.166 (trex/8.0.2);
	Mon, 19 Oct 2026 01:35:06 +0000
Received: from offworld.tailf5af7a.ts.net (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4j7J513j12zPK;
	Sun, 18 Oct 2026 18:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792373702;
	bh=1yFSlPhXf+ABAGiQCmcQHVBU3wg4SKS/vtsXYTbxkJE=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=p8rGh+puOj8/luOGdZJjR++9KIJadf4MK26ALO0jhZOEwt0zzqrzHJIBfKzO95jEM
	 YY7gco2uGnQWvR2j2NKebHdjhFim4jherr9SHPoCGlBe8DnrndQVnI8td8uUmxjb+/
	 zDNHOI8QH37XhQcB16VP/+ZhJUM8ZN/alt1KdV4RA4OATM285mqrUhVTEV+iJMjGOH
	 hMzhOt0jPQM+Y8VP/cooBS0LjsrgYnmv14hOHR6d5WNJjigqEzHSzMSTjwRrsEkE27
	 LVtCIN48O1H/O7aC7SSwlbKUz7hKgguDFYGY8wnlQ9eIdHJ5QVNhYJRgCye5LJ5bFT
	 oT4xLZMDlmI+w==
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	parri.andrea@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dave@stgolabs.net
Subject: [PATCH] riscv: Avoid smp_mb__after_spinlock() fences on non-SMP
Date: Sun, 18 Oct 2026 18:34:56 -0700
Message-Id: <20261019013456.1898839-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smp_mb__after_spinlock() is defined in asm/barrier.h, which
linux/spinlock.h includes unconditionally, so non-SMP kernels get
RISCV_FENCE(iorw, iorw) as well and emit a full fence.

The other architectures that override it, arm64, csky, powerpc and
xtensa, define it in asm/spinlock.h, which linux/spinlock.h only
includes for CONFIG_SMP, so their non-SMP builds get the generic
kcsan_mb() fallback. Move the riscv definition, the SMP fence is
unchanged.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/include/asm/barrier.h  | 27 ---------------------------
 arch/riscv/include/asm/spinlock.h | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 700ba3f922cb..2284473844d8 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -24,33 +24,6 @@
 #define __smp_rmb()	RISCV_FENCE(r, r)
 #define __smp_wmb()	RISCV_FENCE(w, w)
 
-/*
- * This is a very specific barrier: it's currently only used in two places in
- * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
- * orderings it guarantees, but the "critical section is RCsc" guarantee
- * mandates a barrier on RISC-V.  The sequence looks like:
- *
- *    lr.aq lock
- *    sc    lock <= LOCKED
- *    smp_mb__after_spinlock()
- *    // critical section
- *    lr    lock
- *    sc.rl lock <= UNLOCKED
- *
- * The AQ/RL pair provides a RCpc critical section, but there's not really any
- * way we can take advantage of that here because the ordering is only enforced
- * on that one lock.  Thus, we're just doing a full fence.
- *
- * Since we allow writeX to be called from preemptive regions we need at least
- * an "o" in the predecessor set to ensure device writes are visible before the
- * task is marked as available for scheduling on a new hart.  While I don't see
- * any concrete reason we need a full IO fence, it seems safer to just upgrade
- * this in order to avoid any IO crossing a scheduling boundary.  In both
- * instances the scheduler pairs this with an mb(), so nothing is necessary on
- * the new hart.
- */
-#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
-
 #define __smp_store_release(p, v)					\
 do {									\
 	compiletime_assert_atomic_type(*p);				\
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index 52f11bfd0079..54bd8db8eb4f 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -3,6 +3,33 @@
 #ifndef __ASM_RISCV_SPINLOCK_H
 #define __ASM_RISCV_SPINLOCK_H
 
+#include <asm/fence.h>
+
+/*
+ * This is a very specific barrier.  See include/linux/spinlock.h for the two
+ * orderings it guarantees, but the "critical section is RCsc" guarantee
+ * mandates a barrier on RISC-V.  The sequence looks like:
+ *
+ *    lr.aq lock
+ *    sc    lock <= LOCKED
+ *    smp_mb__after_spinlock()
+ *    // critical section
+ *    lr    lock
+ *    sc.rl lock <= UNLOCKED
+ *
+ * The AQ/RL pair provides a RCpc critical section, but there's not really any
+ * way we can take advantage of that here because the ordering is only enforced
+ * on that one lock.  Thus, we're just doing a full fence.
+ *
+ * Since we allow writeX to be called from preemptive regions we need at least
+ * an "o" in the predecessor set to ensure device writes are visible before the
+ * task is marked as available for scheduling on a new hart.  While I don't see
+ * any concrete reason we need a full IO fence, it seems safer to just upgrade
+ * this in order to avoid any IO crossing a scheduling boundary.  The
+ * scheduler pairs this with an mb(), so nothing is necessary on the new hart.
+ */
+#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
+
 #ifdef CONFIG_QUEUED_SPINLOCKS
 #define _Q_PENDING_LOOPS	(1 << 9)
 #endif
-- 
2.39.5

