Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896381;
	b=5dDA3TT2+5vH0O+auOEIb5cmW/4pJhCWVBvM9KGBdBYQ4oSqhSDp0m/7ai3Rf1FZI6mL
	 1OO9bBUrVfEui6RpU8/dP19irP2b4AyviXtGJKcYy6PHSKytqBjJQK3FY8CKXSQ/vCuoz
	 m4EXQciV72YwyKxqsrJERINLOecJehVt0zDZaHcEowBZlK3sk8U0cUGa8dPq2/uzMLVt0
	 oC/VNX8zi5nxdaOZ3wevA0lQBpetVA6GYDPLqzlRw4HG6rdEijkgbWPB+vHZ0yViwU7PJ
	 DcJ5KUiODCELf34u4ZUb9k2Sez6wh2y9lGyep6KWMYHHL4sjzD8meh42HtbpDc/FQpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896381;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mSfS/VpYRDfWYW/SpRNCqzvpn0MjIMyjO/C7eGCEl2w=;
	b=T+dAZVp8qoQZ/+hqXeaKreZ6wAp3eq+TAew7wTP9JuikF+Vbafl6Zs9+muMfFxYzSylM
	 1FOmOg4QHyoXW+zyr1lcMVQU1PfvRv7YCS41ojzSdIMjGfVhnw6JvRh0YeQt1BFRoVayQ
	 qii7d4X/RGwGWrDdav0FftuXoOQs672ejW85g+0ir9Aki96yOhk/47ebkA1MtAMhLTYcr
	 s7mLijNJ9e+GVX709OCFa8vOZ7b37PzMK78H/cnfBESM+eUyRgbFOY+/RMExReyxFNXFb
	 je+4CNO6X3hgpzausAAhug5XlFdnjC/DI4t0lr6V27au3XwLChRdV9y5vv6YgP0qfCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4bPPOtp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683E60A2621
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4bPPOtp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9A91F0093A;
	Thu,  5 Nov 2026 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896380;
	bh=mSfS/VpYRDfWYW/SpRNCqzvpn0MjIMyjO/C7eGCEl2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m4bPPOtp2zJAdqidlzL44ZUwcSIC9juhPx3x3FhmCg1hPbcRpBDRyG8EA8ChBVcWO
	 GsoSUrxFillZ7jeC7oF7W0RfXNllBtB1MuSHw2SlQYI0Kvf8W0dJ0zEha/+Drqoxtg
	 fhJdvj4anabtrYu5rm41hco7crYH/n+TmP3kadAh2tfiXndhPdfUvN2nhgC6rtzX3M
	 RFIkJzGhqHYnbo1SPdM4e6XhZQvqy2BjX9U0MYLPx6HAJlS336XfAETo65ACSFDd3G
	 d659qkBkuWREd8f+R6qc9yEhJBthbgi5iTc/LbPFu0A8GKMqXFY/Az9ETzL+OkcWoq
	 9K/2w5/xv0l1Q==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 41/47] ARM: xen: Move CPUHP_AP_ARM_XEN_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:39 +0100
Message-ID: <20261105163045.38862-42-frederic@kernel.org>
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
index 47b33c6759aa..5c84a39f6f06 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_DUMMY_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_XEN_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_DUMMY_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_XEN_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

