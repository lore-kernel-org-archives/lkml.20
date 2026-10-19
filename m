Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF3515892
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415466; cv=none; b=U76TYHgXkZ9xc/bc6EDSgpDUHUdX4xl6o/86OshQHPRsWH7hSbIdbwpb5QSbRMVUy95eSTzERAJRFGuKwsAv/LJ9Bp42CO+FQQ14m6tp2rdkahjN3xb9YAuhs3VaLeosY2eJMbYT4mHLJOitEUZRgZj5IwxZtqd8SzX8DEQ/Hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415466; c=relaxed/simple;
	bh=v8NfyFdA+3h3DY0go/ZQ5yMYAIu10GMGqvK5p4nK/mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4ThtHYs5SnBwX2T2jC4voKJHum6ApaVW3zdcQitP1/CYBHQbzbAQmjjNn+auMb6E5gU8OLhG5njx9bk2lgaBH4vF3JpJg8ZvPh+dd4aN6VzV1rQGasQnIBPOD4L2uCpxaXsUuYN3cvY42t53MJDijOknluZ3zzssgZ1vFeWgz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iA2FxAAu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iA2FxAAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC291F000C4;
	Mon, 19 Oct 2026 13:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415465;
	bh=K1HI8SEBqjw96bn1RnQ4Y56NBherkmXRP3ao5bzzXGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iA2FxAAuw/Va9xVA2AugCKdF7xtfNkBPOEppppcOApqcSs5EaxEnGE2Q4ledD8Auq
	 JDrkeyU7gjlwCyOMBzFs6ENhM7TvGIsVWRN2OFmxkYXEP2TvkajVuPhFMsE35IE3OR
	 PG2wnEHArtAJ9SRH59Aql93Kd+vIjxDRwNyz+iP4v3SgfEClwGmqcPJ9LKZk/xEnHF
	 1LXeRwV0cBj1LeUL5Jl6yvcZGSwP8i3KsJ7su5hEkY5N3LTyD76fu1rVbkI48H2hwr
	 +pBprurY0tYhn8FctBgUhVa4b6VDRkM0BR2Qub+1wQ71FzDuaznTryValWIQwsjMvy
	 xoq6oWziT5/7Q==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 44/49] hrtimer: Move CPUHP_AP_HRTIMERS_DYING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:51 +0200
Message-ID: <20261019130856.49711-45-frederic@kernel.org>
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

The migration of timers can happen while other CPUs are running because
everything is serialized with the base locks. Also those locks only
nest on the outgoing CPU during hotplug so no locking inversion should
happen.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 4b3fcab1575c..1da41620a583 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SMPCFD_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_HRTIMERS_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_SMPCFD_DYING);
+	WARN_ON(st->state != CPUHP_AP_HRTIMERS_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

