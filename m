Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792793076;
	b=DS8na5KrXabfWk++AgCp7NLFtC0+jfuK9HgazGuwjX16dUJCzUETM0Dy5/Flu/TBmzcO
	 K9jPycRW8+Yh+YTxTQLE4Ikxa5u5vS2LQm4kwSnd8jxQ8QOdtdKSB/N9hXlUlOjGfVPo5
	 /7PdddF4k85EvAWgNpEiCPBtmCeNkJcpKZmbW/rAzvtn+4V0revvJVhdcL2ZWsu34bXpR
	 w9Nc+sHKHUdVMjNMVI6BpfLHzuCTl4yqGjDILbb0Nfm6unAnTLaWEXXwMHWGJbMxficWx
	 iUL+BJJyRTf6Ki0wgsvuCKBzmb3JQKL8HOXjjNY/MFoJC/st2EtdZ0PGPsfvcnVbACw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792793076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3uVMsLhfk2XJy6YqTbr1kVtIpeH0kYg0y+/E4mSSf84=;
	b=2h6iNhlywVQgAHS7aqRtpcz3F7IVQZ0trqQfNwSM6dKsj/JqEVkawEJpXxlfA8rlOuna
	 U1Yf8UXqGUZK4cJT95CWyEDYUw0/i9FK21aHv4BLBV2kpyWBLAwUBtRFh3vyxCdfumzAZ
	 4GTheiFAiaxahqpd3bBJ5+etk64e+4IqEXgEt9Yft+AaRBLu0yPDo6S2y35m39TLpZ/No
	 6Uscayjz0zwMOtOpQQli9+R6duVu9DPqD5u10qI6c2gcms4Y48+j5ACJpgwlOgwZgZQfx
	 7BuNhG9icoTlw6Cq2ApMV9JveKuU42QnjruLVp+fAaSImZ4FqohFsUEw7moTca03quA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=eZzVkI2r;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE36C606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE36C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=eZzVkI2r
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so726715a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792793075; x=1793397875; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uVMsLhfk2XJy6YqTbr1kVtIpeH0kYg0y+/E4mSSf84=;
        b=eZzVkI2rvDHymGoKlQxkr2gsQResGrodmfP5tCsDnIjeUSiKW/q3bXzp/cNVn4QUbu
         bZSQEaEcj69rvbrH92YCAT0aQJoNez9s6GGaR8bGaO72Op7pRP+MpESnc04oU1LueAau
         SoCCY9yfoG0IZQhF6iEpZf6mDPsgwS30HCFcPo8S2QIb9/VOS19QgQL5DsX5orlXzI4q
         C4EABITHbeoAb5Ef7Nh1dTOEKX4ZePCS5nSq4wTi618e4cFGLRgAv4lbT9HGpA3g7vyw
         A1NSKTS4fQ+fYKRSCgl76pB2tQvB9hORU831z8hIjbtvRvNe2HPjPKNRi5WrG7Ra2VXS
         lP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792793075; x=1793397875;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uVMsLhfk2XJy6YqTbr1kVtIpeH0kYg0y+/E4mSSf84=;
        b=aochdnuhXtuoqEieEpWzYsfR3ykkCc/xv0VJy3VnJ+JDb7borrOFpTDHnYtZVef0bz
         yhad4OnPmltKGa/572CMgEfLI+dPc0TiTkhVublkKbotO6gOqZRJq+3u5OW1TR9+Yh9m
         BrsPYlIBJ78Wcpc6elcRgo1z9lQU3bevy2sXlZLmFt2k7U8QtqNO9AjtwKJhWVJb6EL0
         mExxuLou6vu4cS4AqkmruJDi6Yd+Il6LLqz7htJ9d7AHjZ0ITMjNV6Kthayl84DnOVKO
         K6IMcNgf9eN5GiwxqRGCEBacupcc7BkT6HB7ZfwncVAKEbXIZGkBTNnKuudQ0t9kuwtD
         Tqeg==
X-Gm-Message-State: AFq9FYIvyiwQt+CFMiTKt61pbTzaM4xXJQCSEHRis8d/JeBHMugtla2n
	oTK3DFzYoF4QH10UEzH3OgXsKfbkYyOBoko3GA/9w8xXHPIAljZc6tL1abCoKYznQr8QA2Zt/g5
	K0Il0Qb8VA5w1CNut/Amko/cP7qtQa7ctIa+nWQFZSaqz+hAtwDQehvEefkgsAz+UDzSlWIezoT
	7wenbJwtlL2plp9qjvadLHEc2CqG+CT4lN4n0h2nTZARmtOiBX
X-Received: from pgbj17-n2.prod.google.com ([2002:a05:6a02:61d1:20b0:cd5:f7a5:5490])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:730c:b0:3e2:a1aa:aaa1
 with SMTP id adf61e73a8af0-3e7cd5078f3mr244225637.67.1792793074615; Fri, 23
 Oct 2026 15:04:34 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:04:12 +0000
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
Message-ID: <20261023220431.1106611-2-jstultz@google.com>
Subject: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on
 off-CPU sleeping dequeues
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, David Stevens <stevensd@google.com>, 
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
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Normally, when a task goes to sleep (DEQUEUE_SLEEP),
psi_dequeue() does nothing because psi_sched_switch() ->
psi_task_switch() immediately follows and handles the
runnable-to-sleeping PSI transition (clearing TSK_ONCPU,
TSK_RUNNING, and TSK_MEMSTALL_RUNNING, setting TSK_IOWAIT, and
leaving sleep-persistent TSK_MEMSTALL set).

With Proxy Execution, mutex-blocked tasks stay on the runqueue
across context switches, so psi_sched_switch() runs with
sleep=false and only clears TSK_ONCPU. If the blocked donor task
is later deactivated via block_task(), psi_dequeue() is called
with DEQUEUE_SLEEP while TSK_ONCPU is already cleared.

Commit c2ae8b0df2d1 ("sched/core: Fix psi_dequeue() for Proxy
Execution") checked for (flags & DEQUEUE_SLEEP) && (p->psi_flags
& TSK_ONCPU), falling through to
psi_task_change(p, p->psi_flags, 0) when TSK_ONCPU was not set.
However, clearing all of p->psi_flags treats the sleeping
dequeue as a migration and wipes sleep-persistent flags like
TSK_MEMSTALL (and fails to set TSK_IOWAIT).

When the task later wakes up on the same cpu without
ENQUEUE_MIGRATED, psi_enqueue() assumes TSK_MEMSTALL is still
set from when the task went to sleep and only sets TSK_RUNNING |
TSK_MEMSTALL_RUNNING. This leaves things in an inconsistent
state (TSK_MEMSTALL_RUNNING set without TSK_MEMSTALL), causing
psi.mem.full to exceed psi.mem.some, delta underflows in
get_recent_times(), and spurious psi.mem.full events.

So fix psi_dequeue() such that when DEQUEUE_SLEEP is set and
TSK_ONCPU is not set, we do the same runnable-to-sleeping flag
transition as psi_task_switch() (clearing TSK_RUNNING and
TSK_MEMSTALL_RUNNING, setting TSK_IOWAIT, and preserving
TSK_MEMSTALL).

Fixes: c2ae8b0df2d1 ("sched/core: Fix psi_dequeue() for Proxy Execution")
Reported-by: David Stevens <stevensd@google.com>
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
 kernel/sched/stats.h | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ebe0a7765f98e..20820fe1021a1 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -175,12 +175,28 @@ static inline void psi_dequeue(struct task_struct *p, int flags)
 	 * Do nothing here.
 	 *
 	 * In the SCHED_PROXY_EXECUTION case we may do sleeping
-	 * dequeues that are not followed by a task switch, so check
-	 * TSK_ONCPU is set to ensure the task switch is imminent.
-	 * Otherwise clear the flags as usual.
+	 * dequeues that are not followed by a task switch. If TSK_ONCPU
+	 * is not set (meaning we already switched away while the task
+	 * stayed on the rq as a blocked donor), handle the sleeping
+	 * state transition here so sleep-persistent states (TSK_MEMSTALL,
+	 * TSK_IOWAIT) are preserved.
 	 */
-	if ((flags & DEQUEUE_SLEEP) && (p->psi_flags & TSK_ONCPU))
+	if (flags & DEQUEUE_SLEEP) {
+		int clear = TSK_RUNNING, set = 0;
+
+		if (p->psi_flags & TSK_ONCPU)
+			return;
+		if (p->se.sched_delayed)
+			return;
+
+		if (p->in_memstall)
+			clear |= TSK_MEMSTALL_RUNNING;
+		if (p->in_iowait)
+			set |= TSK_IOWAIT;
+
+		psi_task_change(p, clear, set);
 		return;
+	}
 
 	/*
 	 * When migrating a task to another CPU, clear all psi
-- 
2.56.0.257.gf7497c7d27-goog

