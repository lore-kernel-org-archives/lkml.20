Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896310;
	b=EGaOixTYyDi4AhEXDsG3Ewr80PRtdKPYM6fV84tR0fza4TOOrOaHVzdTWJOPU45R5Tb0
	 1JMmSYZNXTW2XZqJxgOI9W6rez1zSoBifQq9I+N0+pFLiq1ngRDQoyzGQZzhnXw8tUzGm
	 rE/THX3Swg+QGDeL0hUwaxHSAdb52qJapyNz8ewILcmxXFGTH3mUxtTvlE0STkVHOAm2B
	 Sj3RlFj/K1mCerasRZ4WrvOkgT4KRsfPRPUrTuuHjT+kwWeZHOo3NHbvB+zHNhpEnfNut
	 Wp9JMvPMbss+LCNZI9Fb3lwWg4l+UXCCakgtqzHI/0udxxMySXf4Fj7+A22f4mrvfnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896310;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1YG6GqkB8WcinTnE6Efs8v7lhqd+S55sath7HlxpGDY=;
	b=Ljbe5T1H50aLmDjjDPyOvq63bvFWIgFR+IaXqGXSNgngiGPNGBs+ilYMzlqJWKWVSHcI
	 SmFbEzRbgrPztVwRhQXahf6SwaJgUKPNeHL+p0MDD6OC43Wsk8+eeuE+tZz6C8kWI7NPz
	 txZdEaeoSyr62RThwEZGTly74bh0ZMqUvokyP1ADgoc4qqAEPdSV+UQ5aXStBHvsZiVYm
	 JEGAJm9d353AmxH07kKNjn1CqkTXaNprW/2WfvMoFZfOv1Rdoq2zVCMbhtWC4teqKCILA
	 2XR8CqYXuVvE+RLATCwkX5VfOVg3y/Fz1NwbAERnD0qT68P2Q+FdYxgOFGMz1+FAKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqOt2k9P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0FB606D81C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqOt2k9P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB601F00919;
	Thu,  5 Nov 2026 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896310;
	bh=1YG6GqkB8WcinTnE6Efs8v7lhqd+S55sath7HlxpGDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QqOt2k9PQmF+h0ysOFrKZjWVDMKdg86OMBr8ssGaB6Cgrfw11+yf/ZhDOPrzsPZXD
	 T2FiELiBmR0AIQMj7rVWkP6DbV1/DFC7R8xoICGjWaHQSI39ExMdqYLe3vmfO2aqO2
	 AtQ86iRzOivcDfRmrMe8rKSXU8PW/B8sXJlGFty+w71eLC6rggI7jXRSc24qUpQ9vj
	 xnZ+qo/aqdUkX2qL2pNC3A/a6pd3xefVcVw+UuuiF6dgFCiZj81af2Z5bVXhByz5zY
	 CCsGt7sFdf4PntJPKj2oICuLkvs5dsOn2xGXsiV6YDYmRtHVY70AaGhkwWKtENEKdF
	 WiS3wiq8KKjEg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 17/47] ARM: vfp: Move CPUHP_AP_ARM_VFP_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:15 +0100
Message-ID: <20261105163045.38862-18-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
index a9c5b0c1974b..4952a53e028b 100644
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

