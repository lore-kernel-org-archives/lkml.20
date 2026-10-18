Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDE4495530
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792325707; cv=none; b=dTylNbodiMS9QkYS+ChO0uDB/hdG3WMFgKEs20yVVmp8y/XDbQeP8/U/Ju4pZmMyqQjMoCpXRMSPXdAFAH98IfjqG+TZNjjcGNJOZSBsqK8E0OLTQPPsOBlvrMf4nOEkbdcj+FS/w5Cunsnlb9ATI95ogjOMgj33p/hquD6+p50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792325707; c=relaxed/simple;
	bh=BW+uARivC6jjD/2a75VRmqqWhOr1I5QX4BGUopHD3Zk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LkhPXvBbTpVc48KbjWMoONKG5Kpg1TSzxstyJv8iedzZgKVYMaprY3WvpprIlmZWTlKucIQ5AwZIwrFE0FcPrMbSepIkiMWAoLx8xYpi7u9USlLJOMsnplIMU8niJ39O8ZPpyok9qrQTCQJH58RknUQ0qhPz7K4ULWMKctkc4lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TxvzM0ex; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TxvzM0ex"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c415561aaso798159f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792325704; x=1792930504; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Diqeqj2OU9UtngRhSx/ZRJRD+vZIyN5fgaD++Yc3pxU=;
        b=TxvzM0exc1fwGXjYQcDahqTve0bMo5jdQ8nlC55u+sl+Gc3deWy/mrDfm4OTSR/G89
         suezIswy1nJj0+afNWKNC+kskTbMhBBMSy5PxMunpRRFLDGh5CgK2gccef+7ogyBANQJ
         dXeSr0M79y4Vuaf9y4DhWKNGNCYIp4F3gxvIDj9sAp7bnbpDAXU9ybJRiiNPBGhZ0G3G
         Thqt3hvEmrnO/8lAhxl8EqmCTM13yyjWr340aTMDn1knEsNtBECiZpn2iACIG8unh/um
         nLbBp1ewSTLfTdxjBAi/YemKkadd8Um1CyFsxEt30Tmjk2YiWHxApLGFMaVdUrqy34/3
         US3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792325704; x=1792930504;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Diqeqj2OU9UtngRhSx/ZRJRD+vZIyN5fgaD++Yc3pxU=;
        b=ZdosL+5KkZI2aonuqIRarKiEyJZ4zhNjqvU2JEklYoqOIfiS5jvVVJU+cwM8pn7v0Y
         /i6NQTPVoKsLXpIGG1kIVHsHutLDhvJdhXjAEWaJZZkepPnwV+s2uVrJJRZP0noam5Fm
         zRqK6B5qmP/9UhzR+YHYGID/TxwqpsAEtQ5V99xcKbPbYHEaeGuZbMpiEWRa3aGfar5s
         2dFKiPlfrQToPFQGln65anUbww0k+agyL6NVwUUH/gXLJN+8kPUb9B6Oavd8XEKjt/qc
         VHwH0hx4FVL+LGpW+oTu0gGHMTN2TsEuVZruUoJUvWVG1cBnsoqFimywSVPWU5lgb8mW
         4p/g==
X-Forwarded-Encrypted: i=1; AKwUvBwxUpUabQkMueDk05uP+0ArrDJra7nuwYHYmOaL9XXpDNWOEYLdiMce+/0sNDgqvr2cK1WqGLJkswW6O9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP4dqQ+C3F7JRVyqsv1KRQ89fYuHYmOMkwujVaR6d+yATGiYrm
	Rgw1diqWG2rB5G3202G6aOcAZQauMmBeu4xToWhCyUZN2EnXYNwIYsSAoPa+poYiJ9Qq/THipWh
	vJSI5xl7Dwk2cjA==
X-Received: from wrdv26.prod.google.com ([2002:a5d:591a:0:b0:48d:efdd:ded])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:f8c2:0:b0:48d:fbf4:895e with SMTP id ffacd0b85a97d-48e07fb31demr5661713f8f.11.1792325703377;
 Sun, 18 Oct 2026 05:15:03 -0700 (PDT)
Date: Sun, 18 Oct 2026 12:14:47 +0000
In-Reply-To: <cover.1792248922.git.jpiecuch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1792248922.git.jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <45315290c86670e424bb38a547d2c325a6a9a7c7.1792248922.git.jpiecuch@google.com>
Subject: [RFC PATCH 3/5] sched_ext: Release the CPU when its running task
 leaves SCX
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Peter Zijlstra <peterz@infradead.org>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When the task running on a CPU switches from SCX to another sched_class
through sched_setscheduler() or a PI boost, the CPU is taken away from
the BPF scheduler without a context switch. sched_change_begin() calls
put_prev_task() with a NULL @next, so put_prev_task_scx() can't tell
where the task is going, and the new class's set_next_task() doesn't
notify SCX. The BPF scheduler is never told that the CPU has been
released.

Release the CPU from switched_from_scx() if @p is the CPU's scheduling
context. Every class @p can switch to is above SCX, so the CPU is no
longer available. As the new class isn't known yet, report the new
SCX_CPU_PREEMPT_CLASS_CHANGE reason, with @args->task pointing to @p.
The release happens before ops.disable() for @p.

switched_from_scx() is the only reliable place for this:
put_prev_task_scx() with a NULL @next is also called for changes which
keep @p in SCX, and the wakeup_preempt() call at the end of
sched_change_end() is skipped if rq->next_class has already been raised.

The reverse direction needs nothing new: when a running task switches to
SCX, sched_change_end() calls set_next_task_scx(), which acquires the
CPU.

sched_setscheduler() and PI boosting can target a task running on
another CPU, so ops.cpu_release() can now be invoked for a remote CPU,
with that CPU's rq locked. The legacy scx_bpf_reenqueue_local() was
already switched to the locked rq to handle this.

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c      | 11 +++++++++++
 kernel/sched/ext/internal.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 4d02d2d6e6d0..d56c692f3dfa 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -4433,6 +4433,17 @@ static void switching_to_scx(struct rq *rq, struct task_struct *p)
 
 static void switched_from_scx(struct rq *rq, struct task_struct *p)
 {
+	/*
+	 * The running task changing class (sched_setscheduler(), PI boost)
+	 * keeps the CPU without a context switch, so neither
+	 * put_prev_task_scx() nor the idle class sees it. Every class @p can
+	 * switch to is above SCX, release the CPU. The new class isn't known
+	 * yet. The scheduler being disabled is excluded by the static key.
+	 */
+	if (static_branch_unlikely(&__scx_cpu_avail_enabled) &&
+	    task_current_donor(rq, p))
+		scx_cpu_release(rq, SCX_CPU_PREEMPT_CLASS_CHANGE, p);
+
 	if (task_dead_and_done(p))
 		return;
 
diff --git a/kernel/sched/ext/internal.h b/kernel/sched/ext/internal.h
index 2d8c789c1e76..65b6ec7dc2f3 100644
--- a/kernel/sched/ext/internal.h
+++ b/kernel/sched/ext/internal.h
@@ -300,6 +300,8 @@ enum scx_cpu_preempt_reason {
 	SCX_CPU_PREEMPT_UNKNOWN,
 	/* next task is being scheduled by &fair_sched_class (partial mode) */
 	SCX_CPU_PREEMPT_FAIR,
+	/* the running task switched from SCX to another sched_class */
+	SCX_CPU_PREEMPT_CLASS_CHANGE,
 };
 
 /*
-- 
2.56.0.176.g3575e65682-goog

