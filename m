Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E92B51596A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415470; cv=none; b=SV/HueVzhdaffnJHSPQyXVQ8UNdjB0bTc40WsrPuKLKxNgjEhYr3OTRc+ZQCzAJrYHpXztpILeG8DN07/hxDmU9C7JGgUm+n+DykUK3XYztpA73yt2nMtlM8i0WK0uF5UcdFumvrMdi3rBJ05N+dmaAgoC5dlOFJ3s/1r677b1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415470; c=relaxed/simple;
	bh=wESJoQ3NA7iqlTYu+7X14H8cZMx2hjmx9hTfADWZN/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQyXvDBZbJzsjln9QBwGoj1ciyUEzqfxu+2/XXKw7YfgA41obKKmtkBRmjLuR/PCq4jQQYU54IR+DiofX4FvcNSJiWr7P+ySl6fnpoWy++Ovz+a/Y9WdXMALDbfT3THBETWNAub6OfgkLDNY5k7/E9T1gOIz8kJKEveijJa7hzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c954HM8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c954HM8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69DA1F000C4;
	Mon, 19 Oct 2026 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415469;
	bh=M24+w+NdTKahRF4+gyU4UiSR3xwhwSulDlhYKF+JH7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c954HM8Hq4Hn5WEfHn8DPLFIkUuxBR8DpSkqmLIZhxXrz2YOtWIqDoftoDNcA6lxL
	 eaxbYfn3JwbiIbNYbKPIWM+2DV/indQ0F4zCq293+gvFtM2Oa/tkJL6Jgk8xrwfoUK
	 aWF39BbiB9azztRh6sDer18xgHh+2LzCWtQwNx5C4vjTdHg0fM/q3RBlSg9q6pwNVK
	 q6c2t7E8GKUhoRHFiaCErq/RIWySKo/9p7hRk4qwmDbWMsvL6Y2awQ6HSE9TIn3UIC
	 XJ9DOAjSta4AIxg3X78G16qngsgVTo9MPyTDchzHCG0BgLUn3gz72EspWCM332Adtw
	 zq1HGhSFLmb6g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 46/49] tick-sched: Convert ad-hoc implementation of irq_work_kick_cpu()
Date: Mon, 19 Oct 2026 15:08:53 +0200
Message-ID: <20261019130856.49711-47-frederic@kernel.org>
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

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/time/tick-sched.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea386713..0d6330334eae 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -400,14 +400,6 @@ static bool can_stop_full_tick(int cpu, struct tick_sched *ts)
 	return true;
 }
 
-static void nohz_full_kick_func(struct irq_work *work)
-{
-	/* Empty, the tick restart happens on tick_nohz_irq_exit() */
-}
-
-static DEFINE_PER_CPU(struct irq_work, nohz_full_kick_work) =
-	IRQ_WORK_INIT_HARD(nohz_full_kick_func);
-
 /*
  * Kick this CPU if it's full dynticks in order to force it to
  * re-evaluate its dependency on the tick and restart it if necessary.
@@ -419,7 +411,7 @@ static void tick_nohz_full_kick(void)
 	if (!tick_nohz_full_cpu(smp_processor_id()))
 		return;
 
-	irq_work_queue(this_cpu_ptr(&nohz_full_kick_work));
+	irq_work_kick_cpu(smp_processor_id());
 }
 
 /*
@@ -431,7 +423,7 @@ void tick_nohz_full_kick_cpu(int cpu)
 	if (!tick_nohz_full_cpu(cpu))
 		return;
 
-	irq_work_queue_on(&per_cpu(nohz_full_kick_work, cpu), cpu);
+	irq_work_kick_cpu(cpu);
 }
 
 static void tick_nohz_kick_task(struct task_struct *tsk)
-- 
2.53.0

