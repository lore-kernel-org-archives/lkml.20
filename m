Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896332;
	b=boTaecONfxVe4EkQxW5jhahsp3DxfAWUILizEydUIp3nzQFP9Xv4DXlNqlJg3UPQ16bD
	 3qBNbZisgUTBwTBftlMxt3M66LPKyJ04YXvedufpeXZDtz5M1p3rt76UgqIApW8opgMo3
	 W9rZAHwcs5auhPIFJZxU992dH2mQir0blJ2BDiG1itEslSHIF9LhLoBKYUDLSQhussuhf
	 RqNUTgWVgOTBmS0KNFolV7K1Y+e4uZSx7NIus7wU+oKxf0XtbwAXzceVUwdnKLUwQe40L
	 2ene/UXFVL+yjBwaKTEPisqrZMXPkyJk+hoRk1LSxVY+41QFj7pS8gR3qyBTHXKx8/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896332;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u7ZwqjtzSR0o1QTyifWY7mPwVdBSMzMSz40FvvcurNg=;
	b=IVb4ZA6YWi8SGYpQLdrDH3h2gXbYyMNCR19pJbpyW42y8mYVl5qKKjnoTBwAmscaDHq+
	 kFAy+2BYPztk+w+AGyYX9SzYa39DApT2bqVzGNTCHivAqAxP4Q9eShGKp7Gc5uH1XJFtJ
	 /tSYOWCP2NWvtBCwMsnpish7RdCMooA2dgTYfTAmsw/fvCM9JzsXi7EgAfiA3LiXbYy6K
	 bc9KgJY6vxsTIyfaubr7Dj0ykeh7cEXYWrBr+gTu0OWgEbkbhWTbicRrF9L0YY2ReDqu5
	 ha+Io88wfML4AFQfIYf416bSECTrujKzhn9j47k0LFUF+bD4i0A1qCBQioMER6x9r5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+hHuRN0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20C6082BFB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+hHuRN0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C1C1F000C1;
	Thu,  5 Nov 2026 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896332;
	bh=u7ZwqjtzSR0o1QTyifWY7mPwVdBSMzMSz40FvvcurNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W+hHuRN0Y5gzd6aWT5/N9Fq9DIQ/crqWKTYS0dP9WisN7+kvm/ozSS/Ty50vTm9j5
	 KVr4uquyaDcDTL4NF9+4DxmPsHmeWzo5+IQOrPH/k1PvDU8STNaapaShu0YBRGtMIE
	 MOkuSQ4W07rX0usTUfMrKZm+/zRvKEciMW25oWQnkw5lSnl6W3HWtY6qO7vE0RjlS7
	 68bNosHivjjs3d8kUUryLbpsFLzClC0BPKaxydqoV+AWmfgGl0g7jxA8nkpsP2Jvet
	 rXOIZag/0RJbEzuw95OANkVmXmWPO4+OFqW/+AoZrNxdZ/uraYCeDkvTkRAHnPkhne
	 j5DpNQ4zpWlsg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 24/47] clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:22 +0100
Message-ID: <20261105163045.38862-25-frederic@kernel.org>
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

The teardown callback here only clears the CPU from the
evtstrm_available cpumask, which is only ever checked locally for the
current CPU. And set/clear from other CPUs are atomic.

Therefore this callback is safe to run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 3c561a630962..6f4c609163e5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

