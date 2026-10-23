Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766920;
	b=SLDbIa6zmbsfL0NAPkNKTQFQ4pKq6AzmL37/5Zdd5JBg3MvwYzIdDEesmP+EVs+MLm+Y
	 3CXrTWgHhCHVWTH++bdBLb7ywH93DAiXIfbnjGz2ep8tGjnMrNA8beQR88rGmRyMjRQ9u
	 9IPN0vXHdVyEt9Ry9K0cscaQgn/lbc2dfp91Gcx6f/YvBDQCnnvo+w4rbvsyAfX6B7N4f
	 pLXgVCL8Fb1v/d8dcbjX9yD3NS2tHgqfIraFn2bbk0s5Zlh97asPAyWhgIjtPA2g0EDmj
	 hCKWhoOabYKwei8uflfQO+PaLWAR/0Bob08kNM51syvOMFY5ZKpZLlRvBV3bij02Xkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XoNiU9ULidIP7mhpM0I3d1L1MqWC9duVSz+nVIzIlO4=;
	b=fLaJgtZ8vbNcVtGDKHxRUA2U5h4nk3EiBGYw2xZMvr/DAZ/s3UfQWO65RWEB96IAzaOs
	 V/SEl52J1W+gpXwyMvUjWqV9V9rMtUeFNym3Qtw8B1W38nEBKsbbK60G98lkkOII8Jhjn
	 SAnRlveFFB1E601LslB5ovxfGOXiB+eIVC7gMz2hp8tMQrLoRc0tioj70F25sJsQSmZdh
	 +za/dFMKmNrW+3y14prm6L//rGAWsXmbria2U1O8kxsfKcfJ1ZNPljH41lKL2XLuTCV1y
	 VGK2asH2m1rzIweW9T+lADQIIlTUGNdx5g3reHcIU4e7g3cTA8ddVpa2KQhw9KDqORA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BJBbqgMq;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D60606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D60606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BJBbqgMq
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a21053899aso6084705e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792766919; x=1793371719; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoNiU9ULidIP7mhpM0I3d1L1MqWC9duVSz+nVIzIlO4=;
        b=BJBbqgMq8JGPxTYb02iIi5LBrNRB+Ufm1Hi28K2ilV8cUa/NnRiWQqjjwYPDvHpiVg
         zwauBCO1UkW9D0nLDdScg7s70yHpQKpPo6d/4geQSeyjA3FY+Ek0lo2BS7BkCeJY5El0
         SQWtZvLBN6E49nZmoJb261VYUmX07aWyUQPQ1vxrRR7h9xFRHadb+kg6sdXLuODWTSvd
         Lt7Hq+tInQvsHmiOAupXHBRnEadJAkQzfRInHcS5coo3nXdBHfuRlK3mryJVrWhYxo7D
         Sw6wvIR4byVwoYpPYY40wFlH0CDxeJfw+MvJl6RFlCiAZ4qfW8BTNhBqXIP/vHQlS/VZ
         7kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766919; x=1793371719;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoNiU9ULidIP7mhpM0I3d1L1MqWC9duVSz+nVIzIlO4=;
        b=bTvQWW+H516ikB6ALfF4Jmxi6X2mgCNpiegfiCXvZJyBpT/q/gIechIJ2wqX9Nmmha
         oc54G2pPy9q3bE4Fio1XcxF5irCROzQP2MbQBeBzAEEssKrB2ZCP4JGumUDSosFmBJGs
         v4Wa3S/0C75J6CEstFUSk5SoLEgFcsFZuEq9xfyKKQvYhGTPVD4PrRm5FYXKyOunFfRj
         ppDkpRReFs1CDfobmUf1PM3mGOIgxO21atN6HnbCHOG5RS2I9UZxHVzMSRzlmDImXsPQ
         FmZBT+p302q9GapmUzfCmlXeERq8auv0gJbYBA1w+0cGPjpeBr0oYIQxBokTK4CqCRxT
         cvaA==
X-Forwarded-Encrypted: i=1; AKwUvBwt3O9gLsK+GqmQKGsW6T75njjd0uvFsMFlJsl9Ez7PwJZA/mmEmGqYTvrPV1cIdIatIZyvYSfwvfMZgLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2ZsC4++0fCyQG4YVKGGbl0oPRKhRQZvTHozMz/CYoWXy2JYzr
	8pZ4++BjL0mI9wCC3et0PTtmfIVsOoiimC5vN9GI4ZexbKdFIg980VWGSNn3gEHyFziHm2hJXEa
	XVkFCJgU3GkLfOg==
X-Received: from wmoo14.prod.google.com ([2002:a05:600d:10e:b0:4a1:df53:c6c2])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a00c:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4a211f11bf8mr35857445e9.29.1792766918592;
 Fri, 23 Oct 2026 07:48:38 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:48:04 +0000
In-Reply-To: <20261023144811.2230393-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023144811.2230393-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023144811.2230393-2-jpiecuch@google.com>
Subject: [PATCH 1/2] sched/core: Preserve WF_RQ_SELECTED across queued wakeups
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ENQUEUE_RQ_SELECTED tells a sched_class that ->select_task_rq() was
called for a task wakeup. sched_ext exposes this flag to BPF schedulers
as SCX_ENQ_CPU_SELECTED. However, the flag is lost for queued wakeups,
which a BPF scheduler can opt into with SCX_OPS_ALLOW_QUEUED_WAKEUP.
This also results in undercounting SCX_EV_SELECT_CPU_FALLBACK events.

Preserve WF_RQ_SELECTED for queued wakeups in the same way WF_MIGRATED
is. This way, ttwu_activate() receives WF_RQ_SELECTED for queued wakeups
and passes ENQUEUE_RQ_SELECTED to activate_task().

Fixes: 3539c6411a7c ("sched_ext: Implement SCX_OPS_ALLOW_QUEUED_WAKEUP")
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 include/linux/sched.h |  6 ++++--
 kernel/sched/core.c   | 10 +++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 12a7e094a3e6..9dabffea1c54 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1006,7 +1006,7 @@ struct task_struct {
 	/* Unserialized, strictly 'current' */
 
 	/*
-	 * This field must not be in the scheduler word above due to wakelist
+	 * These fields must not be in the scheduler word above due to wakelist
 	 * queueing no longer being serialized by p->on_cpu. However:
 	 *
 	 * p->XXX = X;			ttwu()
@@ -1016,9 +1016,11 @@ struct task_struct {
 	 *     p->on_rq = 0;			p->sched_remote_wakeup = Y;
 	 *
 	 * guarantees all stores of 'current' are visible before
-	 * ->sched_remote_wakeup gets used, so it can be in this word.
+	 * ->sched_remote_wakeup and ->sched_rq_selected get used, so they can
+	 * be in this word.
 	 */
 	unsigned			sched_remote_wakeup:1;
+	unsigned			sched_rq_selected:1;
 #ifdef CONFIG_RT_MUTEXES
 	unsigned			sched_rt_mutex:1;
 #endif
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0ab15f03cb94..d8495735166d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3975,13 +3975,20 @@ void sched_ttwu_pending(void *arg)
 	update_rq_clock(rq);
 
 	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
+		int wake_flags = 0;
+
 		if (WARN_ON_ONCE(p->on_cpu))
 			smp_cond_load_acquire(&p->on_cpu, !VAL);
 
 		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
 			set_task_cpu(p, cpu_of(rq));
 
-		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
+		if (p->sched_remote_wakeup)
+			wake_flags |= WF_MIGRATED;
+		if (p->sched_rq_selected)
+			wake_flags |= WF_RQ_SELECTED;
+
+		ttwu_do_activate(rq, p, wake_flags, &rf);
 	}
 
 	/*
@@ -4025,6 +4032,7 @@ static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags
 	struct rq *rq = cpu_rq(cpu);
 
 	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
+	p->sched_rq_selected = !!(wake_flags & WF_RQ_SELECTED);
 
 	WRITE_ONCE(rq->ttwu_pending, 1);
 #ifdef CONFIG_SMP
-- 
2.56.0.257.gf7497c7d27-goog

