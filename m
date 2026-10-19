Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EAF515978
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415468; cv=none; b=RbHKJ7Tg3rjKwIoXGRNlpVS9Kq4+0G5BPY3m6D6rprePUw5GDwS/2PEaKqwL0Cdu/qcYg77cjkI/VJ3njqFpDXZqjvhkm4o2V8uZH5EeKSJKGnAoVU/CaqJrBYg3Y+olFL1uGRSV0Q0mwr5h3y2tgwCKJkewHGLrTMZjCG88c40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415468; c=relaxed/simple;
	bh=Wd/PKe58j5PiEiHtrK02t0Zwx55jaiQIl8UVoTCBNPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEjMXfbigvf62g3Vu5KKcYDbqnqIs4jJoj+/Hd1PlANWeDO7zEBZ9/X1/YVTngpTy+Eatjfhmv5XRQ4Ti6PHflbnweqgyHUCM0nZB6TlXKXVmokPbDKHAHvR+oj4yyhQ4BVeE/1fHI0DeN8o7Oy96Y9v+UUBNdOXVm5c3b7Nqg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nzd7Z7Bs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nzd7Z7Bs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5491F000C5;
	Mon, 19 Oct 2026 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415467;
	bh=7Vfuz9tu+VUEKAn+HWXwb7DcpK7BT25y51TxDhatN40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nzd7Z7BsOPkCSWQQm/QZAh32dF5QcEv9c2+voSaaRIIidx/ZMC9LWdjaIJH0Ajf9Y
	 IzRy1m/GBRZe/j3e2dXm2dWPEIpjhit8YF67X0GncXlW7E4b7DLW0r1k7uHolkSUor
	 +oRvrAKVZ67pn3MmcZOSLAY7zjPENQVSeaXpO/0NiuC/q9jvPl+F6L+kUrqF0Tf5JU
	 fKcVBNOWhmuSo+hKk0pJHKtnQmWAhQiPXx7GS0+QJd0rWuTZZ2SSNuqotM+ERA6dX4
	 M/v8lfWkbkAV4k1vEWXKY4+nW9DbAXW7KJ8rG8xsfXULIuFp2HePQuobKdzUV+IOw0
	 tdp4azThMD/Wg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 45/49] irq_work: Introduce irq_work_kick_cpu()
Date: Mon, 19 Oct 2026 15:08:52 +0200
Message-ID: <20261019130856.49711-46-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPUs in nohz mode need to be kicked in the following situations:

* A tick dependency has been added to a CPU that must exit the nohz_full
  mode. The tick infrastructure has its own ad-hoc implementation of
  such a "kick".

* A timekeeper going offline needs to handover its timekeeping duty
  to another CPU. This is currently assigned directly in stop_machine()
  with the assumption that the new timekeeper is not in dynticks-idle
  mode. But since teardown callbacks are being converted to execute
  concurrently with other CPUs, the new timekeeper may now be idle.
  It so, it must get an IRQ so that the next tick is reevaluated.

Provide a generic empty irq work callback to implement this "kick".

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/irq_work.h |  1 +
 kernel/irq_work.c        | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
index c5afd053ae32..3873f4ff5be4 100644
--- a/include/linux/irq_work.h
+++ b/include/linux/irq_work.h
@@ -51,6 +51,7 @@ static inline bool irq_work_is_hard(struct irq_work *work)
 
 bool irq_work_queue(struct irq_work *work);
 bool irq_work_queue_on(struct irq_work *work, int cpu);
+bool irq_work_kick_cpu(int cpu);
 
 void irq_work_tick(void);
 void irq_work_sync(struct irq_work *work);
diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index f7e2dc2c30c6..a1569266ec35 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -181,6 +181,22 @@ bool irq_work_queue_on(struct irq_work *work, int cpu)
 #endif /* CONFIG_SMP */
 }
 
+static void irq_work_kick(struct irq_work *unused)
+{
+	/*
+	 * Kick the CPU, typically so that it takes action:
+	 * * On IRQ exit (nohz_full dependency changed and tick must be restarted)
+	 * * On the idle path so that the next tick is re-evaluated.
+	 */
+}
+
+static DEFINE_PER_CPU(struct irq_work, irq_work_kick_work) = IRQ_WORK_INIT_HARD(irq_work_kick);
+
+bool irq_work_kick_cpu(int cpu)
+{
+	return irq_work_queue_on(&per_cpu(irq_work_kick_work, cpu), cpu);
+}
+
 bool irq_work_needs_cpu(void)
 {
 	struct llist_head *raised, *lazy;
-- 
2.53.0

