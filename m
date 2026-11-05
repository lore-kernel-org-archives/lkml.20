Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896371;
	b=GqRI8HVmHqCHU51wPt1mZSqo2olzuQVKK6et/bSWvz9GnQ3zm/oKfWqo45W7rl3DkPOa
	 zLdiXzM7QqmpHLZLqVpmpzxW6KUxEQ4NQX9s2DTVovmDKlRXraCmVzLChn/IIxayGs9oT
	 sde5F+FByT4nVKqnW20+Ra8KGl8v9qI+y19DBei6V6koQCizeK1/iUDvtVzz2PspKfbX6
	 ngE1YLCkhKTHrkK+3scsbMrrA40X9vaw5VwzrMCDbRo6lTIeIz+IBU+GLDlW7C/EJxeAl
	 1zgbWyx3aBpKoD/yOasa7vNqIq60ZknACLg4JC9nFls4LZVNnuVfQ5OYrG2slvsbiZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896371;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6XhbcdWVv6I2mcCPOXrZAIKpQH+92kMfo3yd+PkyFP0=;
	b=DEeH75SUZpUp8WSwTL1ZcfXMnTkwT1JWQb5PMw9arHynqc6HV69ems5tuIw9x8h9KOD9
	 +HDYPbF3kEmKiuxdi45MOsS2qCbmiIAW1zSX9X5LSQ5mrQnYG44A4LQJywN4aeb1Hqs6t
	 EzQe8Sa785LJr1ErbKR/2wNV+kiNKOu+oqsr0SOypH3kZpwlJ3NGY8ZCNdbG5V6+1w2HW
	 4uY2hpMVQw2/xbdGBSk3bWC5UZkf3HV9Zi77OVBM6EbrwDIX5PEIug5E+7s5XomnpXKuJ
	 dGT1rgddwQHCXOW2WeJMJjJVocJ/h0a90zR1+iLAgc2tCyXsqB4ISBf+D7eeGvZFFtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6270ni3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF02606D727
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6270ni3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3ED1F00919;
	Thu,  5 Nov 2026 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896371;
	bh=6XhbcdWVv6I2mcCPOXrZAIKpQH+92kMfo3yd+PkyFP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n6270ni3JdY7qYC/LiLO7qRnnr5yR2SUS81N947AyflZPpI8YI7+kqzn4eZhr28ov
	 H2xquVBe1Z59TQdW4X/0TvaBi0Lkw7Jy+Ed0tBk4m6Yf634oW4g/Kmdx4hOzSzxPbq
	 ncOIQ6BAIgzz57+46I0NjAKkmhQpyl2HLYeTnMN/R0ztV763nuTXnMzeJ55MrIV4ns
	 9IAItrC89YVe1XWFOYEGmSgKZk4TPlAKmi3s/aIpnfDV70ccFFfndlN4BcR6S7LrNa
	 5ZJrcFkUv7HyQHr9kAWp1rlTUl7yZNqd1RYB4A7F+1uLtox6HbgXD9GMJPeH14yTu3
	 v/oRsqomesFWw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 38/47] clocksource/drivers/timer-ti-dm: Move CPUHP_AP_TI_GP_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:36 +0100
Message-ID: <20261105163045.38862-39-frederic@kernel.org>
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

This state doesn't have a teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 44f425cc48d9..93b8498e26c4 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CSKY_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TI_GP_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CSKY_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_TI_GP_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

