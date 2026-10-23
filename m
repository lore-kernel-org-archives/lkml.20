Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792793080;
	b=F0SuhO1lhao/OOYJmcWWArtUxOYL9JCxxcXZP+BmBhSlMIGPR2Cznx643yeSr3+LCZhK
	 KWE7x98NMF4zRClOt1jVXsMUJyUlb8gDmo3mH9iShH8bAOzowT+GNmcVke8rSGgLJvWcV
	 z0lbDL+qiJOz6OlDZVE34/1tg7Un8IebhkcfTk3Vy8ZB5MOaYfEzVgZd8gEV3/tOuBmcD
	 pBBvFoS7GdUypR/4tOAEWNJZTEiZihUgjdrpi4nStAuZ51stB6hUzlOLfLfePwUg4rzT/
	 dNyGVnX0QLBFRNW4QgU6KQ030QAIMCdB2iETriR0FkkrHiBeghPc6U5zMDd46ISfDHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792793080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=M2PUbo+cIoiq8gI3fkCR83+zfagQiYcuN5Yp7Dgpauw=;
	b=pteFPF+xb8SOzafc0gsWWqJiBSF2kJ55eEN8WLNNz61+qKHpCgVURApqo89K4e58Ntj/
	 3hCvf9BRkxbw7Hszka6COkSeQHZvhTye/+JF9DLt57M7ePi+x2ttxzm3xQOxURUwTg0pZ
	 qreGOAg/Itrktu7LM8Ib5bURalc1r5gOFQrdLbxl4f71AinpMS/Ylnv1ChHvleLacYaQ7
	 5OZUEDxzzqmh1kI6TRdtLEbkru9pChyD6ZvzG2YOjNOGAAOdCzqDS7SEmfinuAObAlehZ
	 OtUE0zkbL3cXSQl3W8pt4XsW56rNTQOsmqLJAO5+T8tOg1pbJ3DP/FF/7e3AaM9WqOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UWTMqAip;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F71606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UWTMqAip
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1877474a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792793079; x=1793397879; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2PUbo+cIoiq8gI3fkCR83+zfagQiYcuN5Yp7Dgpauw=;
        b=UWTMqAiphTl0FpzCg78EJ5dkMZl4fvbylCvGTZjT2wiwPAsBuKEnGn27xGQITI9/9S
         IAJ6q1cVVWJconzmsoczmv151+fLd0n55RU37bFYcvQqIqV5+WEGJV0lrZ+NWqhU4FV9
         ALjc2lHvT3BdoMMTd+li+vRI+8ByJEnD4Qgk+tanZI7a7dKFFBPyYob0xRprGJdPtrAa
         R+4ESFglH087WPfGh8DW22tkOYNbUrWT1dXJcXAweebx1U6RyMQ5EBQLy6T7Us85IM09
         zkMKsiGBIUXNyVKfAWn11Klw2JGnvJSjCWhELqfJxorrNW671EG6l5OHPDQ0qSgC9rXQ
         ed2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792793079; x=1793397879;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2PUbo+cIoiq8gI3fkCR83+zfagQiYcuN5Yp7Dgpauw=;
        b=YQW9q3ONa/xMsBKxVDsRSPI9cWFBbb5SVzI2tnm6POFlpsMuNBPN7hN3u3YLDBKbUb
         RINYBLslg8JCaj8m0cdPefl2F9h6vAB/RGHnKVtXIez8ycyEA7J0UW15hcikgAH3ySSU
         0+vU471UwNJCigOaBy4q4cUrV2B1uMT2Qp/n1GMDFbFN/HF8kT/YF2ZB+EEB4ePM7QwO
         uYb87wXTdkWSkyAOMuFZobvj1XMo5FNevnrnS4srE+2WnZLdpqXjDqxiozAmxd2szSmJ
         WBgX8ExRYXwfytwGsnZ1POu8N8q92OcV/dL3gmXmaEnMJI++6h0GuYmKSGsPImPzJWbP
         zhKQ==
X-Gm-Message-State: AFq9FYKHV5UKrmp65urHSRo5WemzFdViUpsNG0sl/NC74InhpMIqjx5H
	CmMiBBtA1Zn9VAan2jMeEhH6vEqfsgzwXOuD7fEwwrmTTvu4SuApJ+Y3jfSqrSj+lkvDRFayYuA
	oceSdAUNuOi7wH1XoCfw8f8ZdTQ2cq0HZt7DmuK4gpmUPa6OEoK4DWo7uWXQwl9dDfe3F1CIAhm
	oskJ/3uyw9dXvr98xblg39ZXvlhVMDsLr8gEM1TSiHrWjRz7BJ
X-Received: from pjbnc11.prod.google.com ([2002:a17:90b:37cb:b0:3ab:3205:d225])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c88:b0:3ab:2d46:1dd2
 with SMTP id 98e67ed59e1d1-3ade9b2f1dfmr490112a91.6.1792793079134; Fri, 23
 Oct 2026 15:04:39 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:04:17 +0000
In-Reply-To: <20261023220431.1106611-1-jstultz@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023220431.1106611-1-jstultz@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023220431.1106611-7-jstultz@google.com>
Subject: [PATCH v33 6/7] sched/proxy: Detect cycles in proxy walks earlier
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Hui Su <sh_def@163.com>, John Stultz <jstultz@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Valentin Schneider <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>, 
	Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, 
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

From: Hui Su <sh_def@163.com>

Proxy execution follows blocked_on relationships to find a runnable lock
owner. A cycle in that chain can make find_proxy_task() loop indefinitely
while holding rq->lock.

Use Brent checkpoint state directly in the real owner walk. Cycle detection
reuses the owner resolution already performed by that walk and requires no
separate preflight traversal. The checkpoint, power, and span state are all
invocation-local.

Keep the existing owner == p wakeup-race handling ahead of cycle detection.
Unlike a sequence-marker approach, this adds no task_struct or runqueue
state and requires no activation-time reset.

The online walk can temporarily install a blocked_donor cycle before the
delayed Brent detection point. In the tested recovery path, the selected
task's blocked_donor was cleared before it resumed. A forced-stale control
also confirmed that mutex handoff revalidates the donor's blocked_on
relationship before consuming a backlink. Validation of this trade-off and
comparative measurements against the sequence-marker approach are included
in the cover letter.

Signed-off-by: Hui Su <sh_def@163.com>
[jstultz: Minor tweaks to work with hard MAX_PROXY_CHAIN_DEPTH limit]
Signed-off-by: John Stultz <jstultz@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: Andrea Righi <arighi@nvidia.com>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Cc: zhidao su (Xiaomi) <soolaugust@gmail.com>
Cc: Hui Su <sh_def@163.com>
Cc: Shubhang Kaushik (Ampere) <sh@gentwo.org>
Cc: kernel-team@android.com
---
 kernel/sched/core.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 12a42252bf474..0cb41a884ea70 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7017,6 +7017,9 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
 	struct task_struct *owner = NULL;
+	struct task_struct *cycle_checkpoint = donor;
+	unsigned int cycle_power = 1;
+	unsigned int cycle_span = 0;
 	bool curr_in_chain = false;
 	int this_cpu = cpu_of(rq);
 	struct task_struct *p;
@@ -7025,8 +7028,16 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 
 	/* Follow blocked_on chain. */
 	for (p = donor; p->is_blocked; p = owner) {
-		/* if its PROXY_WAKING, do return migration or run if current */
 		struct mutex *mutex = p->blocked_on;
+
+		/* Keep Brent's checkpoint state local to this owner walk. */
+		if (cycle_span == cycle_power) {
+			cycle_checkpoint = p;
+			cycle_power <<= 1;
+			cycle_span = 0;
+		}
+
+		/* if its PROXY_WAKING, do return migration or run if current */
 		if (!mutex) {
 			clear_task_blocked_on(p, mutex);
 			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
@@ -7143,8 +7154,13 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 			goto resched_idle;
 		}
 
-		/* Limit the depth we'll proxy to avoid cyclic deadlocks */
-		if (++chain_depth > MAX_PROXY_CHAIN_DEPTH) {
+		/*
+		 * Check for cycles, and worst case limit the depth
+		 * we'll proxy to avoid cyclic deadlocks
+		 */
+		cycle_span++;
+		if ((owner == cycle_checkpoint) ||
+		    (++chain_depth > MAX_PROXY_CHAIN_DEPTH)) {
 			__clear_task_blocked_on(p, NULL);
 			goto deactivate;
 		}
-- 
2.56.0.257.gf7497c7d27-goog

