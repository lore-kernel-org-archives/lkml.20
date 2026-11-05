Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896264;
	b=I1xHDHC/VJCHYnlnLaZHKH8CAnBfIhJPgR+q9WxaF0cHXLmtA+3lKLQ3sd12vP6PqTWs
	 wIIWqBUSBH7IDOfehRzE0M+kAePajzhxY6aTF/3Di5gcua4nwOetEuq9ZeqL8NDACjcG1
	 OSYXUBE2IXr/8X/djeOfhIFFe54VR6JYD1vzjPgm9JHQYqPyP/M429/AsWCtoZGsJODf1
	 hXD6VLnZ8RaiqBzwS5m2SokTiOXKhdsZM1oBtXlgZx9wiza2s03h1ijBBUWreKIICmJwv
	 o2DOCKNfoKHvZNu9lddGqTQsUocVX6NoS59SloV3LZMIJdjR3fRKLcIJK4XeQ4pRXrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896264;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0xaO2cmr3BScNckQq0kw3vLNfbfDFVOXq+OdvYGYuXs=;
	b=2zFd3Emz2za6sGXTWDIdy+wkx+9TrO4mkzt8RdjaH4X24OX1D5CQ8W02RFwStsnYmbsw
	 P1BHE+yfeYFk2i3c5/vtm83QVwsYU9Hk5bAihDK8IVFy4L+7ENBZ4rQQLbJLHCJypZ/p2
	 XArqkP9gauEHToOK7fiFjq7LzoBwWwWybGN4POkOPXt37k3A0JiglzkVSUdwIVaiCF87q
	 jhcNj8JCuVKm6tSS+1HJIoO+uya8SZpOTZYVVd1ZAJgnWyW/ho76NVFc4hRLoBLOvebxr
	 Bja+S59JKo7CaSjNquWjKKJU02wAiwQgJGj/hYMHPC1x7xv401H4mWylO/QjocxU8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvjCjKZz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B02606D836
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvjCjKZz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D5E1F01579;
	Thu,  5 Nov 2026 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896263;
	bh=0xaO2cmr3BScNckQq0kw3vLNfbfDFVOXq+OdvYGYuXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mvjCjKZzHj2F7BQtO879bilsr4xzZPXD5KMo42S1zIZ2UX8cvf0uVv054rbxtF8lz
	 /kTdoADkkhAlXNtsiPdyx6EadhSmkyuri++Z4tQ5ESuwwdousCtAl62tS5mqWa62PV
	 NRKKotmYlD4bNyr4O8KhyXHNGpK3pRjORmtXSbfJP51DDDQ2TAI9it+aB7CbN0qWW4
	 oe+ATpUTy/O5PNtAsA49UoB65upreqfZDXSAtJIDheo/FVFB8rOFHyip81QQfqHm1L
	 cN2LLk1aD4KlgAgs/H+KL97ICz3n7zTBuhRP1PifaHVevUOorvxe+9Im/WhyG4FCk8
	 yLB/pcUtyezfA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 03/47] sched: Move CPUHP_AP_SCHED_STARTING to post stop_machine()
Date: Thu,  5 Nov 2026 17:30:01 +0100
Message-ID: <20261105163045.38862-4-frederic@kernel.org>
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

- The nohz_full remote tick can be shutdown safely while it runs
  concurrently.

- Updating the RQ clock shouldn't be a problem while offline with other
  CPUs around.

- Since it is seen offline, no task can be queued to it remotely.

- dl server stop is sychronized with rq lock. hrtimer_try_to_cancel()
  can become racy but then if it fires, it will just early return.

- calc_load_migrate() just folds local load to the global accumulation

- update_max_interval() only depends on the number of online CPUs, which
  is stable at this stage.

- hrtick_clear() deals with a strictly local timer

- sched_core_cpu_dying() doesn't race with anything

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c48cdff149f6..6e6d3a3016a5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CACHECTRL_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SCHED_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,8 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CACHECTRL_STARTING);
-
+	WARN_ON(st->state != CPUHP_AP_SCHED_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

