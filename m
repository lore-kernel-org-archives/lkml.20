Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2A4F6474
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415368; cv=none; b=Z/ZLspxNfcgD7C9A+O6Unt8/jKU+FTkwobO8jscIPlBGcMi5BNt5Nv0TdRMhN42Cfw2RU57E6IVFXCCrEA1ZyiqhED2P/sW1Pq4sIenPLUnICBc18lREzZCyFzIOtigmo37X3wBAqYeUTvGt4tqB2mvMMiUtkSO5ktFbrPXV3bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415368; c=relaxed/simple;
	bh=fUD2lZeGPiWcoYKfAfOlFoa8zcz2hSIRM0z1ROL5jsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCbwsLW0sFcJ5AwhtguqFccP0LjStczgbhCtTRpnE5+Rqa3zbhjAm/qXGma5HM1iLBKT2kLp1x2BBDN4xOrZVJd+r69lG+HFIA7oxcctUD93HVkebCK1bV1fGpv+OaRCfzJt1cvp2B5JanhTe6z7lySm6Iyf8pFnbIR1qpxrvVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1JbRB9i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1JbRB9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9E61F000C4;
	Mon, 19 Oct 2026 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415367;
	bh=/Hl6KIPAlSY04bYS9lmEhkSD5cF0cy9b1qqqoBGium8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i1JbRB9i1i0ehqHLTmVyNxQDdJECzTaN+VP/Dv1n3q7aduQlC+kef6yNWW/SowWTI
	 JPBPaWwPSXtadJclQF+OKmh3blJhLfHyImRgBm+79oBGkEBXauKXzwPS4fS3r9P7SU
	 FBCwyDmQQ0B3EQ3WPIEJUCFeVDa2g3Wij5tM/eTaX/As40uRApIa96QC3DDcQ3cBD7
	 ckliZik/pXrb4JuBdkZ8icmP89t1MTjGqSjTwVtSz4uiZtnKj5hJeUX7xp5PX6v/Y/
	 hQjQFk3k6dwT1ZJBukf5Ixctf4TeK1bqbxGHLOhTe1UJG5UJ0TJRsQKKPntWKFznrD
	 jJDLtqqqsRbrw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 08/49] cpu: Move [CPUHP_AP_IRQ_EIOINTC_STARTING..CPUHP_AP_IRQ_MIPS_GIC_STARTING] range post stop_machine()
Date: Mon, 19 Oct 2026 15:08:15 +0200
Message-ID: <20261019130856.49711-9-frederic@kernel.org>
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

None of these states have teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index db73cdfbf1d0..126896b2c970 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_BCM2836_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_EIOINTC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_BCM2836_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_EIOINTC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

