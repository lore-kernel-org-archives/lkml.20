Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A334DD3B9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413723; cv=none; b=YtbEhwYf5Fb72v9l5jk0XbzAiNHTx/jgPDMzoNK+tee14xRXoiIFD3u9qamaupAkOeRsFZij9w/mj4Y/jqPmDwTuSZhvqP9DoSOg8n0lMBjL0+moySZQFzWZIgRZW+vk9RZTKxpGSyhzDcwlWBMz5NDj2bsH3Cb11yGWA1xG8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413723; c=relaxed/simple;
	bh=FlBQwdip4g4HHV/g4pwDPD+JRcfp+uQYehDQvnDw7uY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W7w5TDujyUE1+neS3oLkA9bzn3tHeTOak+Ip0SIN+R12NwSYTd906pBLFDVNVYLtqk8Vz9EgObAeayiN4sxx78C6DkF1N/Itw4JlUCQGgV7Ve3Iv3yhhBlscnWSrZCF/D4Jp/tUclLZd7R58qqxLN7hYNcvOhoWtOmt7j9qmSbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OTgnloRi; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTgnloRi"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29c391bd2fso161936566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792413714; x=1793018514; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LoRGSkasm8ghLjUGPktte7l/3lMtd3+HJlK+733NI4=;
        b=OTgnloRinqYgv0F8i05sXj+7GJXN/UEUxXRg4L58ojRA6uXsoNWmEV4sLKLed3j4Po
         ObFjw40/FbBRdPhDZR+zLraU6AGble/58uVs7V7TWr9kxwJAsr7uJ3fY4F2wsqSYHrOU
         PkKTCwtT+Y9YpZJxH3pSIl4DbXOxNs8hOe0PGlDMGEWnUie8U6xw1L/9bZMFt4bKpGZb
         kwitH9+W+MpazdoCW5I7o0GIbC0M4wm1oxC56C+jY3QQ3yf4ZPjEHGIr5RZfx54cq4cw
         0a7gTnMSJXTpcq0eNJTy5DEcmqgL/LFlqQuRvRvmeZLfA1RcAQ8nRsuE78pUjH3tmXp7
         HFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413714; x=1793018514;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LoRGSkasm8ghLjUGPktte7l/3lMtd3+HJlK+733NI4=;
        b=ZRq7rCocJPT8EhTMaYOaO/fAQb4WcQWgm8JhwMdyg9t7eqMfljGE8I7szRmi3S6Nqu
         Ptu7wXbLk2OsalILSyBGXn3wCo7wnTU3rle7AugZBhhemvxjmD0lV7s7e92Y+0TaYj1K
         7vIIW9a9hDJ2OmBRnA7JpJo3gcQWvuUOyjh6XDFf0AUClyqtUU9gAl5CTfUV3L7/+b3p
         tVgqT8KvY8RMd712hEVm/G4BH6thQvHN1UMdO/sChhxUdZ9DTNEonjlMco2Xdi2IaB85
         vDeGRxM4h+/0lbiKVHZFE5NtYv5BKYvXBNKfGPS2HPdq7+A8F5u84FDDjHcAxNtYQunG
         3nZA==
X-Forwarded-Encrypted: i=1; AKwUvBwz8nD4T1VanUGKANa8xgyd7JrSdydBdCdxKtpkS6SUrQSExVOn7TBSjzIQ+fVBwUFh9Zi+q1jBEzwF8Uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtG5vw8XblxEpcDCw5/fn9l5FzDbHM1UlXIwqCFDW08b7Wzbim
	AGwtvZXTxuGiBOBaU7Im7bLcw7mYGIGnUvEmFrOw61HAq+iaDuJPq83FaQODnWV7bC2JZKQUk9p
	cS3XesQZPCb1R8Udmqg==
X-Received: from ejgi17.prod.google.com ([2002:a17:906:3c51:b0:c3f:bf12:31eb])
 (user=michalblk job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d08d:b0:c41:8736:8c38 with SMTP id a640c23a62f3a-c419f703a50mr462018766b.30.1792413713899;
 Mon, 19 Oct 2026 05:41:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:41:45 +0000
In-Reply-To: <20261019124146.3582127-1-michalblk@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261019124146.3582127-1-michalblk@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261019124146.3582127-2-michalblk@google.com>
Subject: [PATCH 1/2] sched_ext: Reset runnable_at when a task leaves its scheduler
From: Michal Blaszczyk <michalblk@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuba Piecuch <jpiecuch@google.com>, 
	Michal Blaszczyk <michalblk@google.com>
Content-Type: text/plain; charset="UTF-8"

The watchdog measures how long a task has been waiting from
p->scx.runnable_at, which set_task_runnable() resets when the task becomes
runnable after it last ran. ops_dequeue() never asks for a reset, as the
dequeue of a waiting task is temporary, e.g. for a migration or an
attribute change.

Leaving the scheduler isn't temporary. A task which is switched out of
SCHED_EXT while it's waiting keeps its runnable_at. When it's switched back
and becomes runnable, its wait appears to have started before it left, and
the time it spent in another class counts towards the timeout. If the
watchdog checks before the task runs, it aborts the scheduler:

  sched_ext: class_switch_stall: runner[418] failed to run for 3.010s

Here, the task waited for a few milliseconds before it was switched to
SCHED_OTHER, slept outside of SCHED_EXT for three seconds, and was charged
for all of it as soon as it woke up on SCHED_EXT again.

The same happens when scx_sub_enable_workfn() hands a waiting task over to
a new sub-scheduler, which can then be blamed for time the task waited
under the parent. scx_rehome_task() isn't affected, as it moves the task
through SCX_TASK_INIT, which resets runnable_at. The stale runnable_at also
skews the default core-sched ordering in scx_prio_less().

Reset runnable_at in scx_disable_task(), when the task leaves the control
of its scheduler.

Fixes: 8a010b81b3a5 ("sched_ext: Implement runnable task stall watchdog")
Assisted-by: LLM
Signed-off-by: Michal Blaszczyk <michalblk@google.com>
---
 kernel/sched/ext/ext.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 07857039aee69..120df09b9e0af 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2424,7 +2424,11 @@ static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
 	struct scx_sched *sch = scx_task_sched(p);
 	unsigned long opss;
 
-	/* dequeue is always temporary, don't reset runnable_at */
+	/*
+	 * Don't reset runnable_at. If @p is waiting, the wait continues across
+	 * temporary dequeues, e.g. for a migration or an attribute change.
+	 * scx_disable_task() ends it if @p leaves its scheduler.
+	 */
 	clr_task_runnable(p, false);
 
 retry:
@@ -4517,6 +4521,14 @@ static void scx_disable_task(struct scx_sched *sch, struct task_struct *p)
 	scx_set_task_slice(p, 0);
 	p->scx.reenq_cnt = 0;
 
+	/*
+	 * If @p is runnable but not running, its wait started at runnable_at,
+	 * which ops_dequeue() didn't reset. Leaving @sch ends the wait. Reset
+	 * runnable_at the next time @p is enqueued on SCX, so that the watchdog
+	 * doesn't count the time @p spends elsewhere.
+	 */
+	p->scx.flags |= SCX_TASK_RESET_RUNNABLE_AT;
+
 	/*
 	 * Verify the task is not in BPF scheduler's custody. If flag
 	 * transitions are consistent, the flag should always be clear
-- 
2.56.0.176.g3575e65682-goog

