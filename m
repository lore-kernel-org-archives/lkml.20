Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896360;
	b=owJEhFApRAXPp6+eXv/AkkJ5Ouihy8pVABko5I7WOkQ5uHv2Ua+wavQhMbVTlzDKcINy
	 R2wypqwvp4ELnsd1rWCINk4HdUkxbiCIisjqWQ7r6YS0lZKot5ees5RT+QEpa98l30hjS
	 vHhTKzED0ix6CZ5VygeeUikPJ1M4oVngavggDE1wxYmZStlR4BFE1D8x250YDERoGmap9
	 xIRLb8bnkt+tNUjBKiOQx7AjKqdRV1yJ8T4j3o4jYjwXHwcLRTFA9BLL3GJIbv7l9wfgb
	 AMy/pqeEwvx+1nSDfUL9y6qTEZ1+u/wKtKaYbLGlvS9sEuozC2ugMMqun+myVk0bA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896360;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vczxqCkOZFjD/nFEaTMrrUxCppRkHMvooX6kBAKOW2Y=;
	b=Lc/sDkOJqKPP2dAs4H3M0eHSuxk+v8p6WRX19O8WnEwn0hCB6K/QIOHZwyOjSMo8biqo
	 xHePvJO2Odjx0pI9BW+PVHQrHEHTy+ZiY56UemzdYSTT9OR95eHo8olhnpfYMbN+a1fr6
	 SvN7HloewA+UnneRY6cE8ZVCPPL8MaAyKJoVGW9W1P5GZPXVh34rNR6EPtfK72QbsxD+v
	 HC2LXtkWh51cbhJ4CSXEEfw9IttZr94ng0ASss1GpPAt6McoRaRu4i6EYpF5UY1cR6TdI
	 ydQJhuLcz052PhMT8JgEza4pxhvt1yAcrqS7wYAF74ukQIOTWQa8cgK+LHzIujWp5jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lisH/Ud3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A86083615
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lisH/Ud3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A77F1F00919;
	Thu,  5 Nov 2026 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896359;
	bh=vczxqCkOZFjD/nFEaTMrrUxCppRkHMvooX6kBAKOW2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lisH/Ud3W5kd8haf1Krg+yuDeTu8PIE7kjovrT8VWq0YkMoeZ7+88kDFA6Q3YULaG
	 3EcdIWDu7yHsucKCFo8zfD0QO1Jh25e9yoE3KHEyuc3R3lmqVFpjsmzisdEeSbl3fz
	 nRD0/jpstBeyk959OcQ6rqL08PMDwNDMuSB3/n1+n1i3FPz5g6mJYrygqljavIAuEj
	 sRF93BjSF0YDOrL7ljjapHU0DjWziQniWqw+TxJt4tt732U92+QiwHmvVEuN4vGlST
	 Refr//O2apMyAN5tYFzodVVSr1Qosy0e6aZI9R7y0+hsOQgQkNMY2cmyt0QhBWTzaO
	 mSqu5vg/B2lFg==
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
Subject: [PATCH 34/47] clocksource/drivers/rtl-otto: Move CPUHP_AP_REALTEK_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:32 +0100
Message-ID: <20261105163045.38862-35-frederic@kernel.org>
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

The state here has no teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 3fb757c6bc7f..9b2e5862252e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARC_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_REALTEK_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARC_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_REALTEK_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

