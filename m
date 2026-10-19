Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272994F5E1E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415440; cv=none; b=bbaLb/DOLsv4I+ag5NKS1bcIMMvaIsN525aPsYJcg0q2Y2LEC4M+ZXXCI7g//lYWovxfxYNMXFjU54Fwu+pGXT/XSxsVUa3pvCy10KqLA27xxrl0QkaoUqusikNDxqrNuCeoY/enIyk1p7G4ZudbiaSjn5EbDhI/CpNEcCTm0Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415440; c=relaxed/simple;
	bh=D8O9OxDj9SoE2U2/d2b0vrh94CcCnuwsJepxgRj+M70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eA6NbonJeV7tcPJ1WgzvsxC400xnCzggDRJ22rhkmgRyfDepfLY9vtJkWn2QC9t2hhH8tuhxiDXRmOZuHIsyEZnvAcZYFOOsAQW5H3Uc1yzcTToXu2lbIg3wCMLU/yDgKVRMEGSgolFubwe32NSk3lzZK1JFzMRUYPcKYImyJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kt/sI9Tb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kt/sI9Tb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429C31F000C5;
	Mon, 19 Oct 2026 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415438;
	bh=vushEdhWRPUWLc74YEYtHFujgyQzRnNdW4KguK0R+2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kt/sI9Tb67Dw/vkigmU/TMkei4jpYI0kqUNCilROCjm1OZDJVyo6AGkB2VPcfpFXw
	 mx8t07U1IEShXLuvkt9IHpO5vAvofXngJcgWEClnoeHG8xDtrCsQ+bWO3DKCemCMvQ
	 PpulC/n1w/j0kPahwvOF8x2fgkop7opRwGMIUOiDm0pp0XbcX2BhCwM39aaFfRaKyO
	 9rGE+XoVfHJTugREZIJgNg0ymRIyrEsgGlZ13Oled/w2B3H/1GUBJysRAzWl7IAheq
	 O6gq+ClXDTa37VqUzdCnKMy9wYZuhPOq7VL7Gq5iOwx6E12WsHJU/17PXyIoEm+o5K
	 ebVL6Vmf9+kJA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-snps-arc@lists.infradead.org
Subject: [RFC PATCH 33/49] clocksource/drivers/arc_timer: Move CPUHP_AP_ARC_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:40 +0200
Message-ID: <20261019130856.49711-34-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index e648df00c6c1..75f4cae8971e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_MIPS_GIC_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARC_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_MIPS_GIC_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARC_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

