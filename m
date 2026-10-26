Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015076;
	b=SKDESXcELdllQjTz+BBUCk6VU+tszb13Wcn9SvZQBg64SFRJCWJecp6BzkKnDFF9jpSU
	 hWjjeONjl+6Jsz7RLkxB34chyVNfuQ1BDaZL3EprbEeepPNjaDgFXWXqHjh2vCN5YrPOj
	 AF9VWXOsbUIZZXMDWnbXpRsT1eXKfN0iQMzoRLkchpyQAZSnVW/tgtXiQwXwOiH2JlxWn
	 yO1SqTZb4iHmw1wtAJwUURQDq6rEzD9e+1ws8J+1Js0fVdKe/MHDlIr4IUaqYFpmDi4sM
	 luh9Wwcsr98ICzMcFWHnTB8vY9YDq/aQ5evhX+lBlkvygPak8YdFK7vQhz3SWAzoIEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MCxLFVekHshLR9plLQafQMYGaOoafpn9N5VeIA++ViM=;
	b=1XN3vDTln+GoxQ1NWRUaqAhT1XQf7ed49RBx886b6IMRXLDY4YFQ7RDExd4eAIljUjI2
	 nPCmtYZHC2hgoF+ak8LfbZPSB727zszX+2H/LrVxZ3BI0hwShHiu61fy0zY1m5VY+h4l4
	 Ex2Gk/hFgKFV8J8xPyV02ZdtZuLi/yjou8Mue05frl5EnJfMIv/DdSDLl9Ylx/QfZ+Vi5
	 pVbOKG160w6WWUEr4WtXOMYzbDRcsjdHwFjaQadj/w886YrY8VScL2ZyJ4xzvO/nO9wWU
	 U2iYxGPzI+8DqgUPyXQ7uMzZGhg0r2TcgRvmLDTHvEtv0z17cyrZyj0tPw9VXPOo0aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Q0PJMRo9;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4734606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4734606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Q0PJMRo9
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so19531275e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793015074; x=1793619874; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCxLFVekHshLR9plLQafQMYGaOoafpn9N5VeIA++ViM=;
        b=Q0PJMRo9h0QrmozqjgO6QGrHy134VTlLMkfR2QZPdWlAmvgbFmmQPoegUcYKynMyYy
         mfD5s5wxAOeMszrCXzZuJ6mxcRGpjtL4PyAXsiJjm+CVd3oa26eQtxceHrhAlmpKvEgp
         w+/OGhntedBUiqTqTnZtHm3O/QHQz1NhEgPe4HFTMlHAYle29My84sxsn/7wDd6kZywW
         4EK9rhWAwSiR5Jypx/F0H9abr9G+lMoxUe9tFSVWXdITa7fCyhM6IMSDhnwONv3e+bvA
         Adhwzhb7XCmAmYda/CKkRkHVpgjShvC27bOMxzdbp22W4JFj5tvSnt2PQ6yOs1aXX9lK
         CeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015074; x=1793619874;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCxLFVekHshLR9plLQafQMYGaOoafpn9N5VeIA++ViM=;
        b=eHY5E6lYQijUZR+CiuKTNLN4L4fv11I7YUQdh9IHcWZf1ROEtW79sNxzlgx/yxF/VB
         Oxja/tEN7vkn5EnqwTAHdTJStuK3Yb/Q8M3YU58FdaDNDefVeXWEgzNwTTOcA7Uaed5K
         tgyallVP58vlwDNeR26JNPiGrYdjsG2Px75SKz+EOJo2kYQ/0scPyIAuDBGH1mfw8ggk
         U6/IQoesUqaRvV1l72VOuXIswEzHKy0Q2iO8HB/L+oAM1tYO3mvD7FlBc3GPOlgPCyxw
         6PlNXMuacoKhyJ0CDyKs3BX3dgn3tTrYQhL8MG8uRmcbZDLv+iSCYBCab3+3PCZ2snRV
         cFQw==
X-Forwarded-Encrypted: i=1; AKwUvBxZJSzuEFHZ/+UPbktV6+ytmRiCPwgiH6UXGqOqWvor9muS1B3V7xYTQqnu2Lz3ln/mLCEP79RbSMU2F08=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ93uhnRTmU1s9q3pHScs4KX9JcTLizfE7VjaA87f0Owj//IqwB
	L9EdipQgPSj6HbYWYYtRnNCqY3idirtMtleEpRQRc+cim1cwakZeINGzYXh5KRgbuh5h+0w6d0s
	KQl/B7BDewAMB1w==
X-Received: from wmix10-n2.prod.google.com ([2002:a05:600c:e54a:20b0:4a1:d741:8413])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:608c:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4a77f3f7008mr3105905e9.0.1793015072677;
 Mon, 26 Oct 2026 04:44:32 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:44:23 +0000
In-Reply-To: <20261026114429.209588-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026114429.209588-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026114429.209588-2-jpiecuch@google.com>
Subject: [PATCH v2 1/2] sched/core: Preserve WF_RQ_SELECTED across queued wakeups
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ENQUEUE_RQ_SELECTED tells a sched_class that ->select_task_rq() was
called for a task wakeup. sched_ext exposes this flag to BPF schedulers
as SCX_ENQ_CPU_SELECTED.

When a BPF scheduler sets SCX_OPS_ALLOW_QUEUED_WAKEUP, a wakeup can be
delivered through the ttwu wakelist in two ways:

 1) from the p->on_cpu path, before ->select_task_rq() is called. In this
    case WF_RQ_SELECTED is not set and SCX_ENQ_CPU_SELECTED is correctly
    clear;

 2) from ttwu_queue(), after ->select_task_rq() has been called. In this
    case WF_RQ_SELECTED is set in wake_flags, but sched_ttwu_pending()
    only carries WF_MIGRATED across the wakelist, so the flag is dropped
    and ops.enqueue() is wrongly told that ops.select_cpu() was skipped.
    This also results in undercounting SCX_EV_SELECT_CPU_FALLBACK events.

Fix case 2 by preserving WF_RQ_SELECTED across the wakelist in the same
way WF_MIGRATED is, so that ttwu_do_activate() passes
ENQUEUE_RQ_SELECTED to activate_task(). Case 1 is unaffected.

Fixes: 3539c6411a7c ("sched_ext: Implement SCX_OPS_ALLOW_QUEUED_WAKEUP")
Acked-by: Tejun Heo <tj@kernel.org>
Reviewed-by: Andrea Righi <arighi@nvidia.com>
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

