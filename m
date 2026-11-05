Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896388;
	b=ZFVp2SDH6Xj0Lxr1oRqlVPXlkuz5oFP5nClJOfHMsYI7nZWJgeKqoq0zp2NLyBqU7eyd
	 TjEY33iLTpfb9o13Zukd3CcgH6aCTgJahbQ6HT5l/Lnp+AOjGsYtGn12q+DCDJkoGamAX
	 AmMCq6jCqsbPd3h1VXhJ/GgchXrlP26KA6PIelolI8cRYCFztwqQn+jr/GtLPmKNWoEEQ
	 gfmC+gPGvJTqOm2fg7aWYi5RhV3bmjrnq6iM0MitLnA5YpddzhLgsi8JDhLtyfEG6n6qX
	 zAFIlxq6NyHaJ5feBuJudJoWSGTWFl87Ar5dV9EVmW2yycRkCOgi8qedt0bMNKbvCGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896388;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7rN/QehWQXX2FoV5MxSHlgggY4+8n+tRG0clHdqH0NY=;
	b=kWXY5HTtKRBfQJxE15xjfLMDoWwYEB6yh4RuWukx3xiONHdJM2U7zgRMsXjaLFIvaGJt
	 LXMtlVRrgvh5rhTRcFWYcoiF+IYBqhemYQ7Y9/w7M1vQXTrLXI/RBmVrMiRpHlsi7vRMC
	 soBruOm2rilLj5fN4/K0ROLiocbgxV4e6+nonJKDnu/sgN8i6i+H6i/2gXePeN4SmJ3y0
	 KYYkWa/Wu+6W19berutp+PoRM4wfbiKewxF3B7ehphMCPAoyJigpuXmYhilVR6ReiIEC+
	 HcZjfTFfFQ6Zxl8AwrbOj2JUlopafAMhaA2sLxoEAyFRZJhpdwihFMsr9+Ie+3eV0sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODPRyD6S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5131606F93E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODPRyD6S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB7C1F0093A;
	Thu,  5 Nov 2026 16:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896387;
	bh=7rN/QehWQXX2FoV5MxSHlgggY4+8n+tRG0clHdqH0NY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ODPRyD6SvTay2w6IKMrxbaCr0mFudrybkDM9lQFSeQeF9MsXiiWAq1R0vXSZJZFal
	 arSuA2hJ7MeYw++AbQxGh8T6/MM8MbK+3tVS463Y8ZB88qCjno7zXBbpUm8IfQ3jON
	 cT6YK46MVYtDP5obwLM9XzWK0fXiVVpgWUYFq0LxkZxgZ44pgY8INlCR6Uh2GceFLv
	 SO8M+QXWPxGZ9QtNZLtoMyuUkFTxUJaX2PLEdrnNp6GJNeMeZfTsBqwhBVtQdT+/YC
	 YxVlfuPuZwSCM4FWX7Zp71Eyqky787qChI5HdanOQmHxAIvfo5EalSNrSqWA9uS7HG
	 gKoW0yGckviVg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 44/47] hrtimer: Move CPUHP_AP_HRTIMERS_DYING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:42 +0100
Message-ID: <20261105163045.38862-45-frederic@kernel.org>
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
index 304a88fc7a62..4d34c4ed9836 100644
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

