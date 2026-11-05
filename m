Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896272;
	b=p0kRnR3gjmHYDuZcJqX5Mh63dQxiM//eoPSaLlozSJBd4OzDPWYBugE0spR9mkrUrDi+
	 M8P0k5z6ZmEqz3Z3gGUO4RlRzmIAMqyXiK87IwZzICN6NQxgM2eBa8Q88m2ZApa0b/a43
	 aWsCN6tZFdTuDn4wjwyuYsVThvaNf1mCb2AE7/sv1ufmcEFEHIhPI0IN/21m1gDMnX7/9
	 oQHvKV18+GYoGZlae9dD/ril2xo9Ij/KTfH3X/ETSBSeKTB6piRrK9s+tHzgRGVAEsngw
	 CZyfVmrMWYfkk9nLZ8Vg5wUxjLMj6kxfR97P6JSF6MDIF0lvQEww988ddrAzJoKtLzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896272;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7iuN1CXDA64z7LJqyDcE7mTOMVTLzez8bU1Yxw/6RkI=;
	b=V8b6UDevuX77ONvV1sSCBbda0Sr5qecC5qBhDlVfD9taGr6TmpJbnvs2xjxCqW/ncXTs
	 Z40tUNFWcEZ+YFjznD1Rn4glWTV9RUn6+ikm6A7GvbsvDNMd8H+ro1F6i4M4TWpGCdFdg
	 hX0bmOFoouP2WYCNq2OwBwYzG/nVHTVVA78J9j0f0gmktWK5cRx2ba9V3Iv07w8tl+sXR
	 y+6WzKpRhl+1bimpadn3q2U5i89hFo5CuKH1Eg9KySuukFidP3B4LQ2KPjT7mh0ype1iJ
	 o6NPDt/4LPPimt7XEkfGJinpskLKV5YG4uT+fPdDlFDj8NEjQAOydidC4keOiXl6jgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJ9079hU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF260A2639
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJ9079hU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6091F000C1;
	Thu,  5 Nov 2026 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896272;
	bh=7iuN1CXDA64z7LJqyDcE7mTOMVTLzez8bU1Yxw/6RkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FJ9079hUCth3yidIrWSIk5yBUUEBXXRTwY/gYRgujQFEqi1GELidpxi9CLv1+D4UQ
	 8etNrMp5y38KzehtxqZaQ8xqIZfu8qnRWY3UYiRLpxsZZEBC73UYPCiNUwWHF0ZlKd
	 wLDDIHLYx1jwqDt9E0/W0hjvFg3yt9fZWeExox1cbu5QXoIx6aujOYK9yalPz+caaK
	 QBdYWyuO1CQTP925jS5VrrazjuxJC8gb4I//ImyHNDD3dTPRBX/8gFJ8qWunG/Ovup
	 wh+4zA9UcQZXy3UyjM7Ig8ZUzojufU0JEs3S4aEh/AGk9ArajbSHL8NCh21zpq1X6j
	 IdadRrZpoAoAg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 06/47] cpu: Move CPUHP_AP_IRQ_ARMADA_XP_STARTING..CPUHP_AP_IRQ_GIC_STARTING range post stop_machine()
Date: Thu,  5 Nov 2026 17:30:04 +0100
Message-ID: <20261105163045.38862-7-frederic@kernel.org>
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

Here none of these states have teardown callbacks.

Move these teardown callbacks to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index acc6a0e6446c..cb0eb71c27c9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CPU_PM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ARMADA_XP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CPU_PM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_ARMADA_XP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

