Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A221FE47B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113216; cv=none; b=YatnHLyUawm/bku0vPrpP884MwXZkFvZwsGK/TF8QT6ScyXCyLaUeiEjEHV/bXac4juVm89rEZALXQWj4kaMi0gesD+022vmZP6NBprunysDiUNbx03xJ07WoL/UQRhynMocwDm+ONov3Koq0doFFH/6yIahp3XUuvbneptPj/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113216; c=relaxed/simple;
	bh=I0Agm2fTVnOPyl1SN8tT133C2+AahDkMUK2h01Z0uT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISbAKn4sDxnZ1jfV8P30Yo0WtVYJpmomPDYQ9ITH0RjMoP9J1MaarBWmMS2yj2hjR9rATMEwXBb5Mqq3ADJleVMtZYefo1xWZWMlti/5o1giAAuitSOjO48o1FPXd8Coj7LQ1O0B7n0743YKSYL6WldmxPNzmqYtg1UcVKc3gMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=O6eIM0os; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="O6eIM0os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Oa
	rOiKRU7Id/TSK8Y/qgbBHaQpxMfKiAvNe+wi8h78Q=; b=O6eIM0osBtlYlo5lRO
	nsjSDsEAs9z3GD6q0S+c2oKF7KwMRSmC6jmUh3Y+G80xMiO7LnyPN83K+IyQs6+w
	SC4H4l0SWvZLoq2Qwh1h/2VkmVeVkBN61AUYbXRIlXnGQkq+sbgXCW/aSbytBKoJ
	cM1UVe3Dk6KlB8Dbet6QZdlRg=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3fyJcedFqXHd8AA--.26861S2;
	Fri, 16 Oct 2026 09:09:49 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	rafael.j.wysocki@intel.com,
	jacob.jun.pan@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2 2/2] sched/idle: Use hrtimer cleanup class in play_idle_precise()
Date: Fri, 16 Oct 2026 10:09:44 +0900
Message-ID: <eccd97b2003a16291817974798cbe98b25b582a0.1792083743.git.sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792083743.git.sh_def@163.com>
References: <cover.1792083743.git.sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fyJcedFqXHd8AA--.26861S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF18Zr1DGw4xZw4ftr1fWFg_yoW8WrWrp3
	95X343Jw4xXrn7tasxJr4kury3G393ury3GFWSyr4fAF4kKr1Fqa4qqF12qF4fXrZYgr12
	9a4Fyr9xGr45GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi5l1kUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6h2E42rReV25xwAA3x

Pair on-stack setup with destruction using the hrtimer_on_stack cleanup
class in play_idle_precise().

Keep the cleanup object's scope around timer start and the idle wait. Start
the timer in pinned hard mode, so its callback runs as a hardirq on the
current CPU. The interrupted task observes it.done only after the callback
returns. Since the callback returns HRTIMER_NORESTART, the timer is not
requeued before the cleanup object tears down its on-stack debug object.

Fixes: c1de45ca831a ("sched/idle: Add support for tasks that inject idle")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/idle.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65ce6c4..2880e01368b8 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -429,13 +429,17 @@ void play_idle_precise(u64 duration_ns, u64 latency_ns)
 	cpuidle_use_deepest_state(latency_ns);
 
 	it.done = 0;
-	hrtimer_setup_on_stack(&it.timer, idle_inject_timer_fn, CLOCK_MONOTONIC,
-			       HRTIMER_MODE_REL_HARD);
-	hrtimer_start(&it.timer, ns_to_ktime(duration_ns),
-		      HRTIMER_MODE_REL_PINNED_HARD);
+	{
+		CLASS(hrtimer_on_stack, timer)(&it.timer, idle_inject_timer_fn,
+					       CLOCK_MONOTONIC,
+					       HRTIMER_MODE_REL_HARD);
 
-	while (!READ_ONCE(it.done))
-		do_idle();
+		hrtimer_start(timer, ns_to_ktime(duration_ns),
+			      HRTIMER_MODE_REL_PINNED_HARD);
+
+		while (!READ_ONCE(it.done))
+			do_idle();
+	}
 
 	cpuidle_use_deepest_state(0);
 	current->flags &= ~PF_IDLE;
-- 
2.55.0

