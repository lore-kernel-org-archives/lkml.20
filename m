Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDB4F4D02
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415357; cv=none; b=Cq8pOZVAAFqs37qW8lfjQGkxsD5vul3QKTY9qrQapJMNoEs8i2rAAhgfno0+iXUf7YTNYDCtYsVfOAE6pHkJM9bOB0Xs4mpged4iOV6N1h8YOUnpzkOhNntO5ofPvttVXIpGc/3sOJjMfMx6M7vywx9gImwABM9AVtboAoJefvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415357; c=relaxed/simple;
	bh=BdfF0ifHxZW8BW7BBztOiGGGvadM8kv94TwgeRxhR9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeQzGEpbfQdwP+PH/fx58iTwEb4yzioLbAO0IBlLTgZjgeoUY75LclL39rXjLD2worNWNT+7NX1ThM/LxADlGBUJEOJf77o06lK+AMKmtCYR1TSWtzdT9QcWkVHLorhl0ULTdiknhNyrDb5SywTKHUKcl4WfXjwydCINsm6728o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWeaTYra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWeaTYra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262B31F000C4;
	Mon, 19 Oct 2026 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415355;
	bh=PVIpZ/CcS/sPol1gKct9BxnWhxMMYGLvx5dUYD56VGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PWeaTYraNSU0jfaIqwHk3gfobQ+2fgZP92xcoul56bzzLM0EVG75YR2ylrqzPnvPA
	 nE6hQ+pD6uXXf9MMOTzJ3a3IgBHFMfpd588BBqYw4lOT8zWxcqS0ICTfFBRuqKUESt
	 fulBclwtHPibb7HGkKNSSDAbLkGf4C3OM7+6osuJ4NuG9ZeC0NTG0gh22TUDouDyCX
	 4N1O4VG1aPY8a6w67npS9sw8eFasKZRLLqyxD+SoChVdPqSwA8hqUIhazMJC9BiyNt
	 BbPByneI5orT5+Lcm2oKk5Rf0L9f8hRbYlFaCWianuhnHV664ioAdChqW/7VFeeUbB
	 h6fRPj0oPN4Cg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC PATCH 04/49] rcu: Move CPUHP_AP_RCUTREE_DYING to post stop_machine()
Date: Mon, 19 Oct 2026 15:08:11 +0200
Message-ID: <20261019130856.49711-5-frederic@kernel.org>
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

Here RCU just does tracing with already proper handling of racy
accesses.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 4f3f0ae36893..f22afb213d6f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SCHED_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RCUTREE_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_SCHED_STARTING);
+	WARN_ON(st->state != CPUHP_AP_RCUTREE_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

