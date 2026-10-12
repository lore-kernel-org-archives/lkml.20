Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0B74DA9C3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839275; cv=none; b=qTSW/T8AE1CO7+14pQaa1kNhA/pARYbV5uJpqgFbxaf6PL1Ggp5+T27cfljfui1AijrcP2m8Ic2iGlOYFdG3ViCRk9/1dSXd5lj/TiPPxNIJXiQqt6Bb6gltA1F3ZCq7udgmd4DkVUMsEJ7wRs6V8rYpsXi0/+tc+9t1ZthK2eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839275; c=relaxed/simple;
	bh=2iGJa1pRiVOXDM67nmTfy4VDeqP8cmUx/xWfbwxMNUk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VdeNk+M6dkRy3ADtsU2KCV09KarJ+GF2hQIT7Oz5Cem3EmjrgzFmhKmOAvovYFu8VCv/eWb8Zh5Mi77Rt2gLgajlTrbgIzwCUIWvwsAlFhuOFmy3HMAKSrm6BjFhtfSehDgxhsA2Yqs/hG4nSp/HKHhQb/OPenR+RGqcHRDsEWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=goM5BbKq; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="goM5BbKq"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01c621dc2so17303675e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791839273; x=1792444073; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1rYrNeMFCmb08SKOQ3NwME5dyCsxgu8ZWcr1xM3xV0=;
        b=goM5BbKqhDml6+IGHdLgb/U6fcduWqTbhfEabyaPBrakZIXiUK6U7pJ/ZfIsxYLNRy
         6xd0cEZajuXDVJ5YZMCjCQQohrh4EXgIo2Jk8cfmiieDQp8ZOCpUutYzOokBBZpmzpd9
         b9gmLGTHIPqcIE253sn8ByoaCUuwR4BXQ69Rzr3uutpzNAexqEDHMvNrkx/Rf424ZTPo
         t2Rhw0lPyPo8motZJtbqJMnZXFgJJ65A55fPCFQzCmuZpi3SfQ2gp6XI4Z/9rD2TkvGt
         EAF0gsAlgrs0jh9Bhl95w8uEszlk4U2ULcYFn43WG29t074RyxF7YyjhxnBXDpvmL86t
         CsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839273; x=1792444073;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1rYrNeMFCmb08SKOQ3NwME5dyCsxgu8ZWcr1xM3xV0=;
        b=w16PJKmChk/DdlC2g4dDpxCqiuI2XD+0eAy5KF1Tw0ZumG6xWTtUq+zsualEKkvZsR
         BRdD2U7rafpp2c71jE4iy2+8oGzvvkfFEJ5FoLq0DTuyifQISTtBqNWRxp8uIpM1I2Wu
         s6hNh2q+dhuIiKPIPSanYh6taNoBR/hheD4pBFlZxlVQ60qvmdtgsVcA2Xu5pAMxr5Jf
         NdxFy3UofaBcYC6Tu28NiSa70Ne09biKoxA8UEsau2RwMBl/2EqSnuNt6qOWlfnWBNuJ
         tI8rdINPT9q6TGSITakhbwAj8nWHnxmZ5+kQzZ90DPAuLEOj1+T0LLbqJvQ11Jc7GDqL
         7JIA==
X-Forwarded-Encrypted: i=1; AKwUvBzvP4IqjuYK6Gaclogl9rVNImEUwmwTSj3WM/ZF100bPmIEaNiJmVEJxuoRTY7Ki+nu+wCPZp4bfeLtdi0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrYLXlRFpiK+9Gwk9W1YrhZU29DXfgv1eZeQCnnmPluJVgxGjr
	NBidScR8YaeVSFwfbUEZ+P5Sw4fyVwczWelPYsjwJ70WFpv8d4e38v2m0am60VzPfwtr4RTSbJZ
	vX+bLfSmuNYrrxQ==
X-Received: from wmgb17.prod.google.com ([2002:a05:600c:1511:b0:4a1:989a:a866])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6749:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a18e49d633mr193168105e9.7.1791839272782;
 Mon, 12 Oct 2026 14:07:52 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:07:46 +0000
In-Reply-To: <20261012210749.2955291-1-jpiecuch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012210749.2955291-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012210749.2955291-3-jpiecuch@google.com>
Subject: [PATCH 2/2] sched_ext: Wait for SCX_OPSS_DISPATCHING before moving
 tasks off DSQs
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, fangqiurong <fangqiurong@kylinos.cn>, 
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A task can be found on a non-local DSQ while the CPU which dispatched it
is still running ops.dequeue() and hasn't cleared SCX_OPSS_DISPATCHING.
The DSQ consume and move paths don't wait for the dispatch to finish and
can operate on the task concurrently with the dispatcher.

Call scx_wait_dispatching() in scx_move_local_task_to_local_dsq(),
unlink_dsq_and_switch_rq_lock() and move_task_between_dsqs() before they
operate on the task. In scx_move_local_task_to_local_dsq(), wait before
scx_resolve_local_dsq() as it may update p->scx.flags.

Fixes: ebf1ccff79c4 ("sched_ext: Fix ops.dequeue() semantics")
Fixes: cb86607ada73 ("sched_ext: Don't run ops.dequeue() with a DSQ lock held")
Cc: stable@vger.kernel.org # v7.1+
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index acfeadf5503d..d2a69dfda9cc 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2407,11 +2407,14 @@ static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p, int wake_fl
 void scx_move_local_task_to_local_dsq(struct scx_sched *sch, struct task_struct *p,
 				      u64 enq_flags, struct rq *dst_rq)
 {
-	struct scx_dispatch_q *dst_dsq = scx_resolve_local_dsq(sch, dst_rq, p, &enq_flags);
+	struct scx_dispatch_q *dst_dsq;
 
 	lockdep_assert_rq_held(dst_rq);
 
 	WARN_ON_ONCE(p->scx.holding_cpu >= 0);
+	scx_wait_dispatching(p);
+
+	dst_dsq = scx_resolve_local_dsq(sch, dst_rq, p, &enq_flags);
 
 	if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT))
 		dsq_insert_head(dst_dsq, p);
@@ -2591,8 +2594,13 @@ static bool unlink_dsq_and_switch_rq_lock(struct task_struct *p,
 	switch_rq_lock(locked_rq, src_rq);
 
 	/* task_rq couldn't have changed if we're still the holding cpu */
-	return likely(p->scx.holding_cpu == cpu) &&
-		!WARN_ON_ONCE(src_rq != task_rq(p));
+	if (likely(p->scx.holding_cpu == cpu) &&
+	    !WARN_ON_ONCE(src_rq != task_rq(p))) {
+		scx_wait_dispatching(p);
+		return true;
+	}
+
+	return false;
 }
 
 static bool consume_remote_task(struct scx_sched *sch, struct rq *this_rq,
@@ -2635,6 +2643,8 @@ static struct rq *move_task_between_dsqs(struct scx_sched *sch,
 	lockdep_assert_held(&src_dsq->lock);
 	lockdep_assert_rq_held(src_rq);
 
+	scx_wait_dispatching(p);
+
 	if (dst_dsq->id == SCX_DSQ_LOCAL) {
 		dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
 		if (src_rq != dst_rq &&
-- 
2.56.0.385.gd3acb90ef8-goog

