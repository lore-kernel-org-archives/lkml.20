Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792793079;
	b=f+cx1d4KoFiRwQp0JjxGgml+9ZiUvjZ1PQj7iz+HzoWQTaUBWdkdk6sC6JxOhfSY+FHr
	 pm1Z5wgo7TeuQS7aXsRgQCxNSNGEuWX4V6H3cFPZxzzcToRzCv6zodquTHDg+03vacEPo
	 wAhtrYWHAl6R09X7KNwwLCzGOGfXZMUhcQrPr6/vw3NPzjjMTXu14qKXvRP+DwlrQH05G
	 xGvJo3UurkP7nYXejbeE1y/eyL/7LSpV2RVU+tfzYJwCZQp22GbZDJjoNL6C1y47Mdy/V
	 GJnIiWdnwj47l2VYk42WMXB7L7ioAHs4Tji4m++KWHT3oeTWQDpKektS2x1NFZFjCsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792793079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=NSFiqAw6PVTudAFIrcFiVo5fhlIkKRQ/fgGjCwTm65k=;
	b=edIJqs7f3yvIwC5EAWweq27Xr1r2PcUnXzpaaWQFWTOoDnomYF25dCTXr4CweT3tbgW2
	 f/wtG7fK07anbioAJU6FMgcC1PEC7UnZHrZ1ZtZdGd92wviON+tfn7mDFp7tdq/5pklYN
	 rlK4hDo9D/FYfpmnLrY00TpmQKUk1h+thb+7nw/4CXsPE0aNol9z2hqwgdGdqB3rhVY82
	 BbcPvkHxooj6TtQjFdvSXuikZcHWYXa7BGPYn5l2KobSzv/wyr1H3ubti8mfMqj6RpbkX
	 3G3hZmxBeq1no3STDLzLZfx4ggEvAmOvrtVnVlDHFYQnyD1XVLEhznsoTqIECu7JBaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="YIoH/KAH";
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE85606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE85606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=YIoH/KAH
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so1083122b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792793079; x=1793397879; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSFiqAw6PVTudAFIrcFiVo5fhlIkKRQ/fgGjCwTm65k=;
        b=YIoH/KAH6ufZbmhDr8eMaFDDtsF0KRrvev492uSLYgfa1YaFCYad4q9AxXMN7hAexC
         VNPtXJ7xriWc6+5nd4dXCE+HNVu6hycBReukEnAPcUcvvv9gObKpQx2WdpmATYaZGiAb
         kkfH0AgnhUMQ5juAp91uMTUOpLJkeIvSeraMz2E/9aIMoC469vMlAsR1myAYjjrSNWXu
         bGZiu7Ma2h8KXDxNIABJm7BBjRA62KusY9DZNuOTwpikDczw0BFQNL/osENWnrCYBDn2
         05ttJBKUL/E9YmJQZzJNxRtsV9eolJ9fb3MrgqN+09+Nvr1xkwXpTGgs7WY3HvHUdVHQ
         qPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792793079; x=1793397879;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSFiqAw6PVTudAFIrcFiVo5fhlIkKRQ/fgGjCwTm65k=;
        b=nTvigd82YfUXN8foIqu5JDgH+1AgI/afxVQ4rVhhJay4miQxg19hNIuZNrVLppAw2e
         bf05A4QBBOjkvu8eNWl47FWTGrKMQYRLRYRKMB2iKS8iPSjVvlJy/twaj+h4EDZoO7bq
         ewThgEJnMmVAU164c2uaeMIESyQ67Y7gC6AR10wo44A16HMMJKat3rOO7zQ89r48dVnC
         j5eRdYa9KZnoPXCtMrLWOeRdK/I1gtsi2EcvXNtEa9xlTQwGosQ/OhyqSWLSMpN55K8/
         Ctr1eMviRF9mHK6XsgzKTfsOR5DC1PmbWRTK1uw954JYdd1cyjuIUmORhdz1WeI1W1Ai
         XklQ==
X-Gm-Message-State: AFq9FYIl09ZRUo1t09M43RQaCJzt1/nskt6g9IHyqcNHYYOaiCpnwbfD
	UK+MoSoPtWEyu3S3wrO44rIhtDz4gEhp5N3RE6Od8dVg5nm0+fyCzPV2Eq5ev9tCIcB5gtcv2EC
	0MVqKGPwflkKnCmSwnOD8DqXzfbLerInyllj6ZfWZG+F+SI1gUGSG2C7a7pegihkfKFu9KRxlgU
	eShD4On6px89C2lMwC3zsfwVG+PKrzP6Z90aZ8Q2xKCpaxnykI
X-Received: from pgbd15-n1.prod.google.com ([2002:a05:6a02:64cf:10b0:cd8:bc38:3b48])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3c8e:b0:3e0:e042:2450
 with SMTP id adf61e73a8af0-3e7bfbe6b69mr309700637.51.1792793078353; Fri, 23
 Oct 2026 15:04:38 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:04:16 +0000
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
Message-ID: <20261023220431.1106611-6-jstultz@google.com>
Subject: [PATCH v33 5/7] sched/proxy: Break cyclic proxy chains by
 deactivating blocked tasks
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "zhidao su (Xiaomi)" <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
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
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, Hui Su <sh_def@163.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

From: "zhidao su (Xiaomi)" <soolaugust@gmail.com>

find_proxy_task() follows the blocked_on/owner chain for a
blocked donor. If the chain forms a cycle, __schedule() can keep
walking the same chain while holding rq->lock.

Kernel locks are not allowed to have cycles (except ww_mutexes,
which we handle properly), so this logic isn't likely to trip
unless a bad driver has incorrect locking (which lockdep should
detect). However, eventually we want to have proxy-enabled
futexes, where we can't control userland's locking, and will
need to avoid wasting cpu time iterating around a cycle.

A PE cycle reproducer creates two tasks blocked on each other's
mutexes. Without a guard, the guest does not complete within a
90s vng timeout. With this change, loading the reproducer
reports:

  sched/pe: deadlock cycle detected, pid 128

and a heartbeat kthread pinned to the same CPU continues to run:

  pe_cycle_kmod: heartbeat 3 pid 129

Rescheduling idle is not enough here: the same blocked_on
relation remains, so the next scheduling pass can select the
same donor and re-enter the same cycle.

When the walk reaches the original donor again, clear the
current blocked_on relation and deactivate that blocked task. Do
the same for excessive chain depth after revalidating blocked_on
under p->blocked_lock. This removes the task from the proxy-exec
runnable-chain selection path and lets the scheduler make
progress.

Use 1024 as the depth limit to match rtmutex's default
max_lock_depth.

Signed-off-by: zhidao su (Xiaomi) <soolaugust@gmail.com>
[jstultz: Simplified slightly, dropping WARN_ON and owner == donor
 check, slightly reworked commit message]
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
 kernel/sched/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 43ba76b5a3464..12a42252bf474 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6984,6 +6984,8 @@ static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
 	proxy_reacquire_rq_lock(rq, rf);
 }
 
+#define MAX_PROXY_CHAIN_DEPTH 1024
+
 /*
  * Find runnable lock owner to proxy for mutex blocked donor
  *
@@ -7019,6 +7021,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 	int this_cpu = cpu_of(rq);
 	struct task_struct *p;
 	int owner_cpu;
+	int chain_depth = 0;
 
 	/* Follow blocked_on chain. */
 	for (p = donor; p->is_blocked; p = owner) {
@@ -7139,6 +7142,13 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 			 */
 			goto resched_idle;
 		}
+
+		/* Limit the depth we'll proxy to avoid cyclic deadlocks */
+		if (++chain_depth > MAX_PROXY_CHAIN_DEPTH) {
+			__clear_task_blocked_on(p, NULL);
+			goto deactivate;
+		}
+
 		/*
 		 * OK, now we're absolutely sure @owner is on this
 		 * rq, therefore holding @rq->lock is sufficient to
-- 
2.56.0.257.gf7497c7d27-goog

