Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896348;
	b=K7Z5JK/J6dbMBSCHo41sSDcXfdYicGDWKapvrn25PultubVl8QfPRjZwp7iLCUnI6b/0
	 XHHN3vIkklZaQKhYJ6fXsF6y8LEDUJSWA4n8ZHuIuNtfWaN6EGvB89m1lFt1687BuufKN
	 d30OAvaNxWksID7/Xv0yZB+e7TFdVi36O7XVcR7DLVDYkFJnSiNYdJz7Tnfc/57+37ZiP
	 ehY9yWO4eOjlYZJezQffpLgdnP5IF1baerHiqM3S1+WRQK9L5+yygZyb2Sa6XHrQqo7u2
	 recrvRLP/a9pPP+tE7rzREO4iVc/q/gO+d4Ow3Py7P6pBIRYLunOAtiJ739tllhRR3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896348;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OPMMO0d+VXO9ICqZUUEFSq+tSoxDgooDUAqX3oem3F0=;
	b=EosyvgU0FRa2jPaJrPMNvKaKn91WOaIJxcx5Xbjc2z1j6/HLPkxwdgbf1g+FBK2+BdpP
	 fm54ClL8v4Dd7AERtNzcgn9jGvgpUsaY1Djsx3L1wQea4f5Agts11vwF4piX+pIu6WCcf
	 iuAxm4J5ktqKRr19IFUwKH/jZRiukrnKy6yiV28C5nmdTXfhXxTjJb2/hzG+aoQGROeaO
	 d2qfyzkJmTAZFbt0hYhnuw33YTelj5c5YNdVFnSwPNF1I87pSS6WqLY2gVBzA3H/nwzXP
	 poq5LY1ZbqiBqgSthyNJTRJPxRUehDR1GcWVckip1IEsxeKnVNuHWtWuP9H36ldEIGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VclYDwv7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060C606D838
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VclYDwv7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA89F1F000C1;
	Thu,  5 Nov 2026 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896347;
	bh=OPMMO0d+VXO9ICqZUUEFSq+tSoxDgooDUAqX3oem3F0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VclYDwv7bL0v7D6h8c3lBgZv7Xf8vS6nqdU4DciXbPDyDlypJEDtmCTNdbvhWgwuU
	 APm4TJ4apO24X9luy5tUqojphPbkZOr5qlpJBn0htG/BufP0Q76eyJmWM2GfCUvYck
	 6J7AwUUsUl0stGsYB21IphWNrJuZJ+2RBRb6ANck7paJUPQRCbi+hgC1jOe0xDIocg
	 D3HtJPNNrAK7OCFj5Z4ml7wMFrtVBCWOup/MMi8TLkvZzXj1KtYD09UGJ+iqWeGy1n
	 WYONCZ/WMyQQ6Zxt0eVKZmhjWkn1wes5HGK7Lrba+FdHlaCO68XiYmQXWPIIZ9gSrT
	 JAOKFUHpJk/BA==
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
Subject: [PATCH 30/47] clocksource/drivers/armada: Move CPUHP_AP_ARMADA_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:28 +0100
Message-ID: <20261105163045.38862-31-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 27acdd9800cf..8a563de99dc1 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TEGRA_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARMADA_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_TEGRA_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARMADA_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

