Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896266;
	b=wNXISi89gke+m03ZeJ0tl0VVTL8zzsOp7UrugYHvZAAeGvqmNTFOueCbot7EEZ0qG75g
	 t14nE6VXQPB9oE1xehHersldoV5UEFJwxzZPcDn7nbmO70TYrVKAqreghmuFEXi/SI4Gx
	 38SFHmqu5Oj6/wc+JDbBJOjG7IxHjob8NCX7QpGTyAoyYKUDwSz43WtAD1+tYa6SBvOXa
	 hbCLaEhwu7E855AIPSwqX/E/x0mA3kxIv5ID1KuZ7kF7eb06zS2fw6uahVc0oUzC3sU2m
	 Osf+RVxRlKQfIBUOqi69rBV71X0NM5prXxxPiohmiGh8LBCT7ALoLyKZ324IKGeX+Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896266;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Igc7YNMSkmyhxBWcCj38Xzf5geNbKdbWlTqxE7SW6oY=;
	b=PweDKkOPoiILP3n8egpdGqnvIIFRFAJwUOf32Dr94/Tjz6lKiFAZ0mYrMNaalQAngiEa
	 GaGG38dPtff3QnRIabFpsKHnqSFx+GEMmVNSnngZCVIaNg4ZQTTUm+gCaL11I0SA02irT
	 3Xyqf57/z136c6ixdZZz0czMQ4o9jwNOmHMZJZDuCoXifAi6f7GviaiHYKAhfUHwatlk7
	 LDlMdPlvsYIc+4RGTL7FwnEG/yiNM2bO3qnWmxeVWq2BmHazjbbmeKpx7ce0ktHPK4c2b
	 a5OFAa2CVfF26Dua867LyAp0M+lzirX4lR0A3ptsP0pLLLzM+VlRuIDZNeB9JmW/Ybg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSRa5aRQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7682E6083632
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSRa5aRQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250741F00919;
	Thu,  5 Nov 2026 16:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896266;
	bh=Igc7YNMSkmyhxBWcCj38Xzf5geNbKdbWlTqxE7SW6oY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DSRa5aRQ/tTmY4A3euol0yR6DBtf+WgKwrNaqiAm4mmteUR3S3ybchHNVY4J5E2Ug
	 ARclXaUIppZCtdPU/6xdfN1XlXktT12PUrPwzL59L9p7xM7KvZYiiO4zHYAjh+MVTz
	 47ELvjFKSUibYo7R8BjklYWdAM6dHcYCtYZzjzdxhiT67ClstZbwgb1wk9FnCM629k
	 cG7MV8u8ANya9HXzy0edHG5KdNK9Hxc/x2F8n+H3Lw0AeOMDpdHfeCBFRawWbCFsg9
	 bkpo9KBbTcqibALVtT3wztSd9tMIeKUnO2YoUkPGF68OFFMImMQoqCsfA0iDg2/V6g
	 3dVKUcW2E017w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 04/47] rcu: Move CPUHP_AP_RCUTREE_DYING to post stop_machine()
Date: Thu,  5 Nov 2026 17:30:02 +0100
Message-ID: <20261105163045.38862-5-frederic@kernel.org>
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

Here RCU just does tracing with already proper handling of racy
accesses.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 6e6d3a3016a5..58bb74f0fcb0 100644
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

