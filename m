Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1374BF923
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768850; cv=none; b=ZokUKg8MYM70DxkyVCUU+JtV9hv+Y0uEHKcK69jTTBpaHr9yqaAycvnxnEIVJtNbCBkPpzrPotRjgWoXv3F+HxjULpxE60KFmeXoD1/gEuY0vCsuu02gLTPiGqwm0wmO0aqwc0en9DQN+40WUHy4jGL6uX2M2cDtXi9p+8yzFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768850; c=relaxed/simple;
	bh=S2IteDg8BCUYq9MzemfP7PtVXLKBwoY3Str6Zy5rFOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UjGMa5wZVUIhxykBfaw5IexOoXYCughsMxhmVLenoQA0bI7p1uy58ccNfUQWoV6hLluGU255iJJtXH4Ianr6h+MBSjQMYTjWaL/6Vpl6qOkJZ4fvZPR1m4yvqnt8ibWLvytk9BGK6OL8yoiGeuTjxuZ4MWqvcbvS2zt0KJnR9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNCaBPo1; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNCaBPo1"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e735659b7so39250515e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790768847; x=1791373647; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEJmFxHtcGebW5hV+i8YWLS/cd2PKjrOjbCuo6aJ0BI=;
        b=NNCaBPo1LtFpi/elvc2szZRldCHO/9yv3imzh8GmkQKlCqPJ7kvamLyZROhBzdSnkS
         4+mWK6P+0wISq6gZo46pfFCcbQsovmvs0rwjlEWEALSI50ZpRT0ZUm1cG34OfwDrTt0t
         URo4fl43FZKlJc7XCZMi+othFCTPP0HI1yPJLAFT17AUuofr56l2Qofpj7Z5BON/+Rlc
         H0qpj9Tcdh86i+7kHV0+4nqEDDeXsKXFsUhxIRbp04WoXYLA7P9IWD0uQzbrr7DHlHoJ
         3A/UqvCRgqz/eeU+qRMp1ySzontHFCcx/SX/uKCiXwZsLg3YpptH0lI8pM/9Ts5WiZEH
         2V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768847; x=1791373647;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEJmFxHtcGebW5hV+i8YWLS/cd2PKjrOjbCuo6aJ0BI=;
        b=rXIjZhqEUPF22g3uScST6hyBa4U1oc0em4DOMU93OM/Gec2inGs2UxkMS+t6LTawMU
         7kCG+OFtREMPbZ5DtTbko7EC6TM8ABdxtPfTS/i6khtWyzkZu7Sp6UrDcRaoZ9CDIhNm
         wj1x8Z8J/UHHn0+wZFc7qniMyVmRSW7eHUPdfemO7sKO0b3+45Loaubyy6PpGLMRL1HE
         6cv/l6obOsse65AOdQ5OfzL8i8Zd4PtYJGZg8wGo0DCOzA1UrCecgnBHrmUb61dXQiXv
         GHG4s0RbZkWYCMiPeNy+vwB0vASLRhSPQwdvJXkom/PsMzWdFRnl1FL+k+zQa6hNB+iQ
         t6xA==
X-Forwarded-Encrypted: i=1; AKwUvBybfrJfWlpQK7zd7UcXc55MuKiiRGl1SeF1EayhdPHkKO1Jf1Yv1tOoIKgLkNn4FZBvwJnlk0rY+Iq/tYU=@vger.kernel.org
X-Gm-Message-State: AFuF++kuBns+MAcqhJeAmHkzt3koLOm7wXpXRaI6eewF1qbupkHmC1Xk
	d1CvdecmurQ4CGpvqM4aBxWYixbyZHee/axCz6bzWgPCFQYAY6zEmdxDdvP1gKQOJD6iywQyC55
	DE+jl3OMnnNkbtQ==
X-Received: from wmdv19.prod.google.com ([2002:a05:600c:12d3:b0:4a0:1046:34c4])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45d3:b0:49f:cac3:c68a with SMTP id 5b1f17b1804b1-4a01affeca0mr17228185e9.31.1790768846990;
 Wed, 30 Sep 2026 04:47:26 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:47:22 +0000
In-Reply-To: <20260930114725.331370-1-jpiecuch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930114725.331370-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930114725.331370-2-jpiecuch@google.com>
Subject: [PATCH v2 1/2] sched_ext: Call ops.dequeue() when a task arrives on a
 remote local DSQ
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a task in the BPF scheduler's custody is moved to another CPU's
local DSQ, ops.dequeue() is only called once the task is picked for
execution, from set_next_task_scx() with SCX_DEQ_CORE_SCHED_EXEC, even
though no core-sched pick took place. It should instead be called
without flags when the task is inserted into the destination DSQ, as it
is for same-rq dispatches.

move_remote_task_to_local_dsq() sets p->scx.sticky_cpu across the
migration so that deactivate_task() on the source rq doesn't end custody.
Since commit b75aaea24c9f ("sched_ext: Properly mark SCX-internal
migrations via sticky_cpu"), enqueue_task_scx() only clears it after
inserting the task, so task_leave_custody() still sees the migration in
progress and skips the custody exit.

Clear p->scx.sticky_cpu as soon as enqueue_task_scx() has read it, as
was done before that commit. The source side is unaffected.

Fixes: ebf1ccff79c4 ("sched_ext: Fix ops.dequeue() semantics")
Cc: stable@vger.kernel.org # 7.1.x: 18d62044cda7: sched_ext: Preserve rq tracking across local DSQ dispatch
Cc: stable@vger.kernel.org # 7.1.x
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 493b7aac7087..5209510d6a5e 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2152,6 +2152,13 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int core_enq_
 	int sticky_cpu = p->scx.sticky_cpu;
 	u64 enq_flags = core_enq_flags | rq->scx.remote_activate_enq_flags;
 
+	/*
+	 * An SCX-internal migration ends on arrival. Clear sticky_cpu so @p can
+	 * leave custody when inserted into the destination DSQ.
+	 */
+	if (sticky_cpu >= 0)
+		p->scx.sticky_cpu = -1;
+
 	/*
 	 * SCX_RQ_IN_WAKEUP promises a task_woken_scx() call once this enqueue
 	 * returns. Only the core's wakeup path delivers one. The flags stashed
@@ -2190,9 +2197,6 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int core_enq_
 		dl_server_start(&rq->ext_server);
 
 	scx_do_enqueue_task(rq, p, enq_flags, sticky_cpu);
-
-	if (sticky_cpu >= 0)
-		p->scx.sticky_cpu = -1;
 out:
 	rq->scx.flags &= ~SCX_RQ_IN_WAKEUP;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

