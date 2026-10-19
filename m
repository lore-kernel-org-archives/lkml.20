Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37DA4F6490
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415362; cv=none; b=aNORYGwylORf6BjM7gEddfxd50t69FqgEJsqXrIpeAgcfUfRJ+27dxvqjp7CBsXQND+aGeaw+s19wWlrvaDI7jsNgT7hN+LXUj9uiDcXRaJRIFxmx4Fn9mLqeTIMiaQzJtYMIOlJpzbGvb7mNkekXHJ9AjVPHZrRTISdtg6t8oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415362; c=relaxed/simple;
	bh=26rIYU9uIosbdeBMndVjqiLjlffe0X7cA1qBhPw6OQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOqATloFn7QcN/37MXtHy3P/NXupTfGHX0Pua0VllCunZHygqlvnRTnerNbTq5wneUpUAsDQ/ThpNnHhRWNHxzMljPBT+zDTwiGmrsTi2Q5dvwRNkl0+uFu2mHi7qUk9Tj6PcTvWKaK8thDdJJYrM0PvMMHPjF1laQKZfM3ij2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyAknddN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyAknddN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244DD1F000C4;
	Mon, 19 Oct 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415361;
	bh=IgXgwslW28zk6GinGRzAokkcatQ7dUY2mE6IcBWGydc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NyAknddNCZiVjYm5uSedfGJWr/UJcrwgjOo/q6ykX2ja5TnFf+gWd9JmAcHVw7KAm
	 lW7XaeEg3OzhIHq/Qugk3ZvRp6hmK+Oi84VIfE8nWY2Ptqik5xlg5G6pphV6xJ24zq
	 wkTMkGeGK188HiQRJG7+sT5kkVBtYXPMDEfLkcBBunOJtnlaYBXyoAId0sojTsD5Ew
	 X/HWLZDX46XObOr8sAWKLMTaMRKK1QHWNXsRirOs14+EiVRa+D+53Rf29LV7gCsmv/
	 6P/iwRi2A1M9qgGRelVth+1DySI8TKV0kbTZDOnROERYqgBFgEzuLZe3CxcGGY3vFs
	 75zIP81Z4ZjVA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 06/49] cpu: Move CPUHP_AP_IRQ_ARMADA_XP_STARTING..CPUHP_AP_IRQ_GIC_STARTING range post stop_machine()
Date: Mon, 19 Oct 2026 15:08:13 +0200
Message-ID: <20261019130856.49711-7-frederic@kernel.org>
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

Here none of these states have teardown callbacks.

Move these teardown callbacks to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 68eb8de820d5..293dbb73d940 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CPU_PM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ARMADA_XP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CPU_PM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_ARMADA_XP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

