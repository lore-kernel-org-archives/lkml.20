Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4943E071
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830834; cv=none; b=mLeRaIHZwh2dl7HqV4DEf1dpfVPFzTQr9ji3WjIYJrlLCWJH3fcbaVOzg1v0dzT5/o4o+TZ/Go+Cqvab4AY51dD6kKXJnD7D0TrxfXLbYpivEq9ohlyUbpRyUH3xcGWUmD+pthmXk0xX7ScWB7XXn4bubxJt5LJ3oqzAavUU/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830834; c=relaxed/simple;
	bh=Y7RLpz0czh9Ikbzh4hZv7fGnKJReSQKdUwh6VSk0vok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nN7AAOjBAbb8ywAjLgliquztvoG2601yWsxmddOtQDIrJ1AMUWaDW58kxQJ86IVWaJm1qOif1vn9lQdVJqm4UOgKcjmEc00wHWHIi7xLULbUzG+LG7lq5Xx9e1XyQa7wyhHYDX2iFspcy57IveooQEq9KMwF3gVS8AptKOza1Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/dDH27E; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/dDH27E"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so19759085e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787830830; x=1788435630; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vkezrtHgO5rhcqjudZIyvP6WMi132GoPfujmzaFMNuE=;
        b=P/dDH27ErCbWtgXkbvLirmpIqeyVDAMnoZ6/6Rps/p1wuWzpGkdK5SFYAVvchhOG/7
         RRv7zeo8LIYtZESr6o6egIQh7TkmgQnRJNSzdqVAeMnPPOAoA7UfNb7Bs0uvi1gX4UqI
         da/6m/LpCGHI9A8pVfpekoLh0/KdHgAoTAiAT5tPHjti6YiTOPLHAdVFitcF4UXdO83o
         u8yCDjk2ipVQb97WzmOQ163eCqoQO5GgO9uw9QTqnD6YBUqIYwu8kUPzJdtvJLJYf1C+
         vuUxEzWfrm8p6sAaqNo5lGWUkoI02zBwsHauOO+nm2/0SE7JzJf9/nV6jhEgtWfkrlLX
         ZRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830830; x=1788435630;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vkezrtHgO5rhcqjudZIyvP6WMi132GoPfujmzaFMNuE=;
        b=XaTdyUdOD19BRxjXVeQbai1iA9skQWZpgMaW4GRbM7jvJqUkIn/jGVCsaQs16RwRSa
         QIMQwup0rUqlFEPI1ug04kCC69bfoJ5Qgi1hkMJ/lODmrG0gjcWsDhkeBW7x8ZICJ9cV
         VwdWiKKB8rXcfUxu6fRf4jMo1Yj7a76NczAsU1z0omdAyNhkvekrsYx/5VJO/ZHVVL0v
         Acrm2+0iAQmK96BMxBRqcQTEVxdrVqCAeoCbKtzGMLds+0qdqShgESBk3WNLwR9fqo0I
         1OvemoCMjztdda/RvK2McFb0TN9oC8RTIw67OMd1aTHMvjQaNG7m1qo7C0QyOc74mROb
         ztJw==
X-Gm-Message-State: AFuF++lBvz+ekqC1OrwHfgcBV4UlldKe0QbQuWvUgMD1ulrkQsE5R+ET
	NlV5yo1Anbq+CNIf76HCjKBIPwJgegvBpUMtVcSAc9oh4rfnCazrWMZtrgxKuw==
X-Gm-Gg: AR+sD10ZSRZDfiYjZyWACXUeCCR98MHybwulshm/KWZ3GF1PSgXXQ37cf+vwjT4+IYS
	M2ybw2G5eDaPmUGJHPOswhEW0nvAEZcgnGmiNLPV5Jj6O0TPZ/S4SAr8WamB/YpDfHFzxzjyLAx
	9MLMZbEcIGsJwCqzxuClYOB9ZK5/NPmtBSDfAV7stf2/8ndgMyNIF9ZH+yvzSiiURnSkCQ7ZQke
	+LEK2EU6S5Qts5qBg0fBeKR/bOUkqhXck0O2GngcurdeByhvAmQZlUYwlnSrkgtfA9mZMcM8kmr
	Ce5fZbxwzh1aa400nOj/woYTl+jmofgD7JgxRqyCreYiTbzZqobmuNJ9zZ28hjkjk01lnnuDMHV
	I2rdjUX4C7rfTQY6A9UdyBCQ0UEG3udfFKyZYqJ39s6ZssMrgVor4Gc7/jr5DI6PTLC8TVsZYyA
	0FGl9hOTbx3O9UbpHCLvEbhd650DwoeFwM1UDYDViNlFFZpklqUfhS2wkrbbSz0N09PbwTVWM4A
	banH2NM5NYCwCrQ6be+xYxIGeL/yE4DUHWf/xOQ4RKUqKA=
X-Received: by 2002:a05:600c:8518:b0:499:d95a:414 with SMTP id 5b1f17b1804b1-499dc7042b6mr175755645e9.6.1787830830288;
        Thu, 27 Aug 2026 04:40:30 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm8332627f8f.12.2026.08.27.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:40:29 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 27 Aug 2026 13:40:14 +0200
Subject: [PATCH] sched/core: Convert remaining BUG_ON() instances to
 WARN_ON_ONCE()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-warn_instead_bug-v1-1-b515c0f74b89@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB0ikGoC/yXMTQ5AMBBA4avIrDWhElpXEZGqwViUdPwl4u6K5
 bd47wJGT8hQRhd43IlpdgFpHIEdjRtQUBcMMpF5omQhDuNdQ45XNF3TboOwGo3OlFZpZiFki8e
 ezm9Z1b95aye06/uB+34Am2jj/HQAAAA=
X-Change-ID: 20260827-warn_instead_bug-c9ea9389813c
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787830828; l=3492;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=Y7RLpz0czh9Ikbzh4hZv7fGnKJReSQKdUwh6VSk0vok=;
 b=XV0c4BgQ8hfoeSwcOhLQ2wg/dNxcZJ+9PQxa+j6nGFXJQyImKgxUoe90xgefdLFfzDxX4J9cw
 lR2/GNXXIeMBiY+X7AWKL2QnoMEEmNoo+94sr9GpNLJgH5ftgmLzVCz
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Commit 09348d75a6ce ("sched/all: Change all BUG_ON() instances in the
scheduler to WARN_ON_ONCE()") left a few BUG_ON() behind in core.c.
Convert them as well.

As described in Documentation/process/deprecated.rst, BUG_ON() crashes
the system, which makes the failure harder to report and to debug, as
the message often never reaches the console or the syslog. With
WARN_ON_ONCE() the user gets a chance to see and report the problem
instead, and system owners who do not want to keep running after an
"impossible" condition can still set panic_on_warn.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Follow-up to commit 09348d75a6ce which converted the scheduler BUG_ON()
instances to WARN_ON_ONCE() but left a few behind in core.c.

Build tested on arm64 with CONFIG_NO_HZ_FULL and CONFIG_SCHED_CLASS_EXT
enabled so that every converted site is compiled.
---
 kernel/sched/core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..bab74b4f0dd6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5949,7 +5949,7 @@ static void sched_tick_stop(int cpu)
 int __init sched_tick_offload_init(void)
 {
 	tick_work_cpu = alloc_percpu(struct tick_work);
-	BUG_ON(!tick_work_cpu);
+	WARN_ON_ONCE(!tick_work_cpu);
 	return 0;
 }
 
@@ -7582,7 +7582,7 @@ asmlinkage __visible void __sched preempt_schedule_irq(void)
 	enum ctx_state prev_state;
 
 	/* Catch callers which need to be fixed */
-	BUG_ON(preempt_count() || !irqs_disabled());
+	WARN_ON_ONCE(preempt_count() || !irqs_disabled());
 
 	prev_state = exception_enter();
 
@@ -8619,7 +8619,7 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
 
 	rq_lock_irqsave(rq, &rf);
 	if (rq->rd) {
-		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
+		WARN_ON_ONCE(!cpumask_test_cpu(cpu, rq->rd->span));
 		set_rq_online(rq);
 	}
 	rq_unlock_irqrestore(rq, &rf);
@@ -8631,7 +8631,7 @@ static inline void sched_set_rq_offline(struct rq *rq, int cpu)
 
 	rq_lock_irqsave(rq, &rf);
 	if (rq->rd) {
-		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
+		WARN_ON_ONCE(!cpumask_test_cpu(cpu, rq->rd->span));
 		set_rq_offline(rq);
 	}
 	rq_unlock_irqrestore(rq, &rf);
@@ -8954,13 +8954,13 @@ void __init sched_init(void)
 	int i;
 
 	/* Make sure the linker didn't screw up */
-	BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
-	BUG_ON(!sched_class_above(&dl_sched_class, &rt_sched_class));
-	BUG_ON(!sched_class_above(&rt_sched_class, &fair_sched_class));
-	BUG_ON(!sched_class_above(&fair_sched_class, &idle_sched_class));
+	WARN_ON_ONCE(!sched_class_above(&stop_sched_class, &dl_sched_class));
+	WARN_ON_ONCE(!sched_class_above(&dl_sched_class, &rt_sched_class));
+	WARN_ON_ONCE(!sched_class_above(&rt_sched_class, &fair_sched_class));
+	WARN_ON_ONCE(!sched_class_above(&fair_sched_class, &idle_sched_class));
 #ifdef CONFIG_SCHED_CLASS_EXT
-	BUG_ON(!sched_class_above(&fair_sched_class, &ext_sched_class));
-	BUG_ON(!sched_class_above(&ext_sched_class, &idle_sched_class));
+	WARN_ON_ONCE(!sched_class_above(&fair_sched_class, &ext_sched_class));
+	WARN_ON_ONCE(!sched_class_above(&ext_sched_class, &idle_sched_class));
 #endif
 
 	wait_bit_init();

---
base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
change-id: 20260827-warn_instead_bug-c9ea9389813c

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

