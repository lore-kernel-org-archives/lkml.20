Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896323;
	b=cN5gOTQFXSbfOanbOElPrjQjDoyTnS4XOkoD/9PTBnWoFRMB+LWX4YSLGBXvBn0ZgiHN
	 NuQlryOYYWdtvfKddgNOOkuXvrgk0K5q05KAfHVrSzbB52NF+siN+oSCa0IfcKuDlZYOs
	 kp0Y0ebqNxHwDACbRmTNVR+JLU61gBQEaF7Aflp9ecYz7ImNfmP0vf17suW1lVk8bC/gd
	 FwU50VtYjWk34EWkAN1RWyrw9xYFl3smQfvoA9K5AnHbPSnSCoYi9tiQ39pMkCMTSCrTH
	 VH8WKXChiPtLoSoiGayWkm6q79iuZnVORgJVAUBXQXyb0JJRaCpnjv2QWtNmGXZuuFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896323;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pYSZDDkB9KE0B4etIEkyJve5o1Mggby0d5u0jTSHpFw=;
	b=eNiMeEdl5Xy4SrkKFYmGMFaEkstyZUlqhyaisB2tsqHYV3U6pT7FfBCKmeZFQsGsGABo
	 a4DjJXWC4Fojq7vkExP/ZfHw/s3zDz/3ZDQ1n3FMugXVszAuDijTjPnVQ++p3uLEU/Wv8
	 W8VlF7QorNm1bWTTNPyMqW2xjy2syt12LG169symG7CnQilh8fYgXjFoiEtWeM39Ixm2C
	 Nh8/6eirHNm/+b4Xz11QKsI6O7v3Vr/35f1YlgF9seM10f7APUgYHqLFExwMJlzKQ0tz7
	 siQCWqfSlWY5aTVLriWTirrbewaYul154Uxp6twyTjQuUr2ZKbOW26CW0kHh/qBv1sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ky3Ts5sb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF04560726CB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ky3Ts5sb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4091E1F00919;
	Thu,  5 Nov 2026 16:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896322;
	bh=pYSZDDkB9KE0B4etIEkyJve5o1Mggby0d5u0jTSHpFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ky3Ts5sbmUIVXA7k0qkLZif0mX72I2sI4IsgDNT1CsBFWPXJWfdFmcW0vRPbzpNZw
	 DuPe9d2TuK7Z+ceAW4a8SYO0BelVpW6rDDsLUGaddVFX0AK6XUj3aOuR4YE02a7ujD
	 UBxefPU+WwF0M11te7x72zHqMoe+cZt1mWQS7DEIVBEbV3V6eOd2+8DGFC3ROPGn5w
	 uQO84Gqg3T0AowMax1bQwl3VP5hnh1HWvgjZ86Y2iLnzdCSdqb3jZVW2SNWc9dzIQD
	 t0qVrPMgXNa7DAh14kIhoeC2N2cduO6kGa0hpNPSHOBkbQ/d21J5twcNYNVgkby+vR
	 DVYK4GT+DseMA==
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
Subject: [PATCH 21/47] ARM: l2c: Move CPUHP_AP_ARM_L2X0_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:19 +0100
Message-ID: <20261105163045.38862-22-frederic@kernel.org>
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

The teardown callback here disables the L1/L2 cache prefetch and the
write full line of zeros mode. These operations should only impact the
outgoing CPU and can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2ad19f3f2563..498ff31b24cf 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_RISCV_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_L2X0_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_RISCV_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_L2X0_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

