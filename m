Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F83306779
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777534; cv=none; b=WeKMsgmHuutB5pfq/M9Jlr0T5iPcI5tR9s9QGPEX7ZakR0u5qc6imR4tG55UpTzqyYdMHy25OwQKePggTPVDS0m3dbJAgUMm9tqA3zQ1turDgZnUuzfHE0XZkL3hDX10OJ01fdt/oSG4D32O2cY/hYQ12+LNB2v+hoG5sIIV8h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777534; c=relaxed/simple;
	bh=vPl/P5pCELiuRusxxVinBhBrLxisgd3V0mzkgoPCc8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JxCKixrb44OG+HXSlR2McoZetKaSdmMS87pWVOpvnxk3lACTu98ReOH5T/XG3g0L2EZkFa9rWoB9C3dk2+ILsh1CVOHXjAyplrU2U2ND+VRKaUjxAFapGby72vnUbQdn9VsL66uonLcEqjKUvbjwm+kKlLgpETfvUENQ2a5FUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LawWBopM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LawWBopM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9541F00898;
	Sat, 19 Sep 2026 00:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789777526;
	bh=h/1tymZAv5rjqCfr8zFms3PGcORRWST8nwCnweEjC1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LawWBopMAtl1qL88lLjM6pfBwHp2vv6p/969dyxASRYxVjka5btMggYglG+gjVOyp
	 kxck1xDdsRRXU8nL9yrRyR8FQLYYQDnx4MhTFTHcupKuXr2PS7YJ/juWq4we2UDZsN
	 3G6SqYAvW5Z5SqutoGo+wG2nKhxMN0698t0O6Ag18kfSZjMraSjHRa3CoSv0fMBuv1
	 NVGyNg7INJLy+2GgewBY9HgqPqfiwqCvNUN1BCDh8MK+iYZH4MiluuS7GyBPG4WL4j
	 sypjr0VCvapH7DV54iDmN4tW5e5Q5jMKTT4PiPyrAlxNeIhNFXVM6COGIZz5nQgIA3
	 ojQeMNx1N2n5Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 639FCCE178A; Fri, 18 Sep 2026 17:25:26 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 2/2] timers/migration: Mark updates to tmigr_event ->field
Date: Fri, 18 Sep 2026 17:25:23 -0700
Message-Id: <20260919002523.3133928-2-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <d432e78f-1d1b-422a-8622-8d3145cecbfd@paulmck-laptop>
References: <d432e78f-1d1b-422a-8622-8d3145cecbfd@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tmigr_event structure's ->ignore field are sometimes accessed
locklessly, but the __tmigr_cpu_activate(), tmigr_cpu_new_timer(),
and __tmigr_cpu_deactivate() functions do not mark accesses to this field.

Therefore, use READ_ONCE() for the tmigr_cpu_new_timer() function's
lockless load and WRITE_ONCE() for the __tmigr_cpu_activate() and
__tmigr_cpu_deactivate() functions' stores.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
---
 kernel/time/timer_migration.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 059d43355e65..f920e73fff51 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -715,7 +715,7 @@ static void __tmigr_cpu_activate(struct tmigr_cpu *tmc)
 
 	trace_tmigr_cpu_active(tmc);
 
-	tmc->cpuevt.ignore = true;
+	WRITE_ONCE(tmc->cpuevt.ignore, true);
 	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
 
 	walk_groups(&tmigr_active_up, &data, tmc);
@@ -1258,7 +1258,7 @@ u64 tmigr_cpu_new_timer(u64 nextexp)
 	ret = READ_ONCE(tmc->wakeup);
 	if (nextexp != KTIME_MAX) {
 		if (nextexp != tmc->cpuevt.nextevt.expires ||
-		    tmc->cpuevt.ignore) {
+		    READ_ONCE(tmc->cpuevt.ignore)) {
 			ret = tmigr_new_timer(tmc, nextexp);
 			/*
 			 * Make sure the reevaluation of timers in idle path
@@ -1362,7 +1362,7 @@ static u64 __tmigr_cpu_deactivate(struct tmigr_cpu *tmc, u64 nextexp)
 	 * or CPU goes offline.
 	 */
 	if (nextexp != KTIME_MAX)
-		tmc->cpuevt.ignore = false;
+		WRITE_ONCE(tmc->cpuevt.ignore, false);
 
 	walk_groups(&tmigr_inactive_up, &data, tmc);
 	return data.firstexp;
-- 
2.40.1

