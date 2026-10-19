Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CCC4F5E1B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415398; cv=none; b=bkWu9KL6pmJ+XAFKWCYqOFLD3M3hpEkZVIkCwyU+Lbh+dQ7o96LM/0RZSzYGsoUo9RwAaP2msBIFRlfwWRw49VWYmzaI+N1PSt0hyDBrikZhs/GMqFaKTJJ0u8f1FohxF0ycetUEAze6wGjwR0Q65CIhs1TzWUw068R/S28lrxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415398; c=relaxed/simple;
	bh=9+Utw6OtqfpySTyHCDh5VQD2KcJIi5/w2OzUmq3jTYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN+Ayl0e18/TdkWH5QLvF+8gOAwXj4DEZ5MZgWQ45Or/C4ecM4/57aQXcFs2faJAcE4wyoGSi5F6Y/5gD405PxDAaDizUQoT4rEBXE0PatvxrR2IyL310/Q+feqKZ9wDp+x5if2MwLqE3gHKOIFR4pJ3xVKkfNzj85FzQBOVmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3LxuVl8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3LxuVl8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7790E1F000C5;
	Mon, 19 Oct 2026 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415396;
	bh=tVzuQgyRSMcF1cPObbB3KELngDUQbdY4OVt3CdDmVuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n3LxuVl8s9roRBlbS2hHlqvUnSN8pHgIXJAetNqTKL08/I3LtNCjYSAAXpMzDdaCH
	 v0AubukCKCs8tN6qp/d3N4xHqiCrKG2wRTE+cl7JXP4x/g+0/Y/9IiFP4WP/b+XMQC
	 PTJt+U5ZyjjzevN1Xoy61bZEacx6C8hX+wJKqw79/8mpwDbwAaZw1P+XOSqYtiPwLx
	 5b0IHf0u96+sZTH6mZLoZ5tZibz+oEOzJUmKuyiRaH6o6ujmNjCkhpFPzwSeuVRZml
	 U+KBpUE12sCqulu2uwtahhQYdRCpGMdFelYx/XghQ1s8B8YX+rkjnhZKL1ucT5bauL
	 3ZMiFwqHO4fTg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 17/49] ARM: vfp: Move CPUHP_AP_ARM_VFP_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:24 +0200
Message-ID: <20261019130856.49711-18-frederic@kernel.org>
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

The teardown callback here only removes the local VFP state which is
never accessed remotely. As such it can run concurrently with other
CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c20a822df803..b7f5d0683ff7 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_XTENSA_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_VFP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_XTENSA_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_VFP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

