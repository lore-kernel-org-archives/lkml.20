Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38894E5346
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415478; cv=none; b=aiVBh5kwkDchwJTQwfcwyhYpg3DHWQOMddmvfom/YRk+r0CF90kyhPi9MKQ00BNg5TcGQrC8Fa9iggGfgRL9SuIX005KjFbvTW1/BXy7SVfWieRCk1Jj116olo7J5VfY15jKmCv5VwpkLvK67SFQgDlTDrXdIxFARyU0/XnETEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415478; c=relaxed/simple;
	bh=NXB/UvlufA9tj1LDZR18dS+cHNP0I/0EenzwMgUn5Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrKcvuRteh6UMnkBBby3hyo3i5t7jASyL0JpObNDfa6x/1fvyijeR1Wh5+FpDs1+hwbc/Uq/bhwZgR90CTBFyXmD70sG1Yb0k8leHNfNWoZ3LcUkgoB1MRUXchL1QW3mcTGrspoeUmK1zD4n/RmxRwr45QEUFr7kp08oqnBVKFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFrdQ4ZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFrdQ4ZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332541F000C4;
	Mon, 19 Oct 2026 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415477;
	bh=Rzj8BT/yawvlFvWiKgY7YWEOrf8AruxVG6QySahLhSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fFrdQ4ZBvqImuWldbCFDLDLKbl3TWVVr/rHfINDcsOZRggF0LXKDHBvzkLErT8zzV
	 KF6ryk/CTVKV9vUM/nLP5LH+es/yX43fP8l02r/o4eKOV24Q5JVn63WmQcWt1oPA0P
	 Ibm/hw4lfaX8TdRYAu3yusIM1IRIIkyFbEDYCmpldhC5VK3zZCTtMy7OClZXtpZS6n
	 Tki3CGAQEYrCd6ZAjThgbybkptMXqQyXc9K2pqd3/ESnRTi6YwftymrmON/qJUKHZE
	 CI0szDe0UVmqswwX0ibh90I4nDUzv2CapfP4fFIPJBD3M2QocoPt5AV129SUsa+RUX
	 +hMmEDQBwir7w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 49/49] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:56 +0200
Message-ID: <20261019130856.49711-50-frederic@kernel.org>
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

It *looks ok* to disable the cache readahead globally while the other
CPUs are running.

Move this teardown callback to post stop_machine() accordingly.

But please double check.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 87680f7c6493..36f8e6588196 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_X86_TBOOT_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ONLINE);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_X86_TBOOT_DYING);
+	WARN_ON(st->state != CPUHP_AP_ONLINE);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

