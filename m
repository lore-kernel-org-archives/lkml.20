Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76362264AB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415457; cv=none; b=WwxEgUQQH3R0NdPAIQIfgJpfWoABaQPjvY8olHFIgTQcnicj42YzGl03sKypgB8eIwd0YuIgCeW/GQd/fmnBVR+qI9HrkaZksZWbW5OELSirC5X1wsdpTILnf8kUR6n4B5obdJd2SMCD6QPLge0rIh1x3uYBiG/6M93fhyIaaAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415457; c=relaxed/simple;
	bh=NGX3xgfd0erIRJTMRP6J9wzSd1Tpu0hBC7vgxNBGTOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxtUgcLhlszS+Gwc6gfmfjkhQW97/KOTcjHy3JXkPxud1DiiBZdlNg2p9VIjzotAVJgEj+SOmkVf6c8FDBMcQBAj8WGnFi776sYJQGX8YBsK4lGGiAVbZY4M0JQlq99YwRJb9HqP0bt8QyBosPW4YdGRbuWtbPpv4tzEIIbxXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeTNlHU3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeTNlHU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B4F1F000C4;
	Mon, 19 Oct 2026 13:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415456;
	bh=5lQthWRD+2+JRCaoC/dvzLoXD2kck6tZECt8BIViEmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aeTNlHU3CTz59eE/w1bPZbT6HBqpBICPu/ESGqJbS3loPf4x3teAD2mChs8EVT0sq
	 2xDmZCmcoeXpoYylsFnl98ky5mf88mUbubJzww0/Zxg/r/PKflCWb5AWON0Fpi1moU
	 riD0l9RbkMmPSXAqyVck69j9bZ3cWJroBDRaSc9o80JNEDG8o3ZwmagUKV12LnU9XX
	 RIrPqrS+aRonUt/Pe9zMJVIugNisy7ki7gezrmctiaJhJ1TD6T3IRcPRxyErfSf5ep
	 FWAkuEaoEm55BR9JbCQHAIvCh3PV6pBNN8X3W9j5HpLHdSeEieuG9i1yjIvvSMLUHY
	 ZCCoEvQiCZNuQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 40/49] clocksource/dummy_timer: Move CPUHP_AP_DUMMY_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:47 +0200
Message-ID: <20261019130856.49711-41-frederic@kernel.org>
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

The state here doesn't have a teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c37fe84baaa8..bc06cb1f0282 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_HYPERV_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_DUMMY_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_HYPERV_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_DUMMY_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

