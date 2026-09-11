Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D95374A16
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135829; cv=none; b=gm9pF1q7/Jwyo8dhROkdUNHp6m36Uoa+dJGZfLQkP7Dfa7+d1fxfxGUYjFA3dwmVUjl6Nruicf7G4VzIgjUob/eEoJVXnFN+4fntydvd7aWn2YPrbrbOQNc7RLgWK0jNPyRCstl+SIB6Jw+4NyHQ7psfFXcAoWTOaIA7t7PlDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135829; c=relaxed/simple;
	bh=CHfEJf4XyY3zn8RyomjOM2Uc3mVFT7MUycrwjg2RabY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SN1EwEhlpeeMBBv7C0Vx3c2lc0mQp5seUMkwlClEFX9kNAXhzGJhSkMhVHWrhr/oFXPjxgouJjGPeU5B+dkIAS0tWh38jN0XdY4hAvUlxjIduZTensWeuzhaLj0I7Bwo0M7ZjhvmJ/+J7Y8oXAXiFlpAd8t0smk8qFJ+cNFNAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=mt4DmxKM; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="mt4DmxKM"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafd7so84824385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135826; x=1789740626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDcwMwF0CqD/SLUwt7lLP/Zeny+NN6n073A4kvHv5Ng=;
        b=mt4DmxKMFOa54vKaT7P7rC0nknUec5SG40ykFBll3pCY7tJxqt/x+SOCkXo3KNe18M
         yedzxk53shlT7hl4bnCF93vW8Y8pISo2hDuG8GRWZ/63qMENZom+pJ0aLDwuU3F8URLY
         sw2cIbuAA0M8+dqVCdaDdIwG5iib83Y3t4wTDLLWgp+XYVAQr1orQF86xBjSQEUfDkuI
         m1WVGkAxwPOHg/lTHRo1qpU7itzlq3ZKGLp28y4/aiV/Z3+87tG6AJ4lwxpq8U8eYIam
         2Zoa7ytfUf8k+ZLC8eMWbTFPq7Fa+oTvHEHxNMUgVKDtXmGQ6Pl0liwZ2dOx/DYlFOQP
         Q1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135826; x=1789740626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDcwMwF0CqD/SLUwt7lLP/Zeny+NN6n073A4kvHv5Ng=;
        b=VPuOuZGAQz8fjo++Obw7pwG6FG5z0qoL8zlxiw4KH0DQ3VZwDinHiNpG3PyTJvmvHB
         YbzhNk9MbMgipThIrlYDnJkenga4ae9+Ub3VzQtuU1GBmVfvAz9CqR3isJmhFgFgVQfi
         uAt1Bx1Ct7N6qx9WM7jmnuWEToTRughG9f5ujZILHO+X8JBgKc5q5GPoDknUr74+G++4
         klhEbqmAj7LNZ0/NqVDRjZLlG3ZehljGR2R0yccBRU3OFfaNuxwYNQfmRQFUyPQpZHuA
         D9iEW9dzw1ZaffHhkJrzRA6k4OYYZlLiHfY/qIh9EjPqQs5vfv1nWXW9SEFLyvTvRWak
         I67g==
X-Forwarded-Encrypted: i=1; AKwUvBybVD4yQd43IQF3ElOmkZo41g2xXKLolBmhCSi/5o/5M+m9zSmJgJNl+pvcP4TVfTHrARPBRni4j5BttkU=@vger.kernel.org
X-Gm-Message-State: AFuF++l9+FjJjXuLTh/fizF68+XD12x5mSDqDMmJOaX6n6rHMmWNeZFK
	rnP1vkuOHfHDaoEpELkn9xmnLWyScFqnNhJWoOWHG3wO0hsOyiqrshvXhv3iz/N5uXs=
X-Gm-Gg: AYBFou3e4tHQBIgP3Vpi8KRIrpKVBO8agheFKhgaurD85lSaelCBPdWWuRKwBL0R0QL
	nUkt3Pp9AsWU+B9uAWLnJHnyVFJXDDo3ONvC0I2cZEegBQ8CekpSjZb196jTgiyqzG0Bv3Jl5q5
	vFZ+XHzw0lOYB6LdL5HIt/O1DNn9pJU5SBiuv5CsQeloDm/Lnqcg2Wh53N0i9G9pW+zWbVPVWAH
	D1ijTWQ1oOfXLz/gltpn5dG0tDYD1uu4/PWyDw96Bf3WhWOnWhWg4GZKpAY//VoLgbpZXyttVae
	YUveslOru2oYNeLIa2XqPqStp4eizDN3LffHFwdvQzjSEubYsZfFbPzhaynTxs6436MN42xx21M
	p5dZkudSH1soREFsVebn7hNZeOa1GN4MMUG8TJxSBb3Vczf3PrcvXoTJbLAxLvKAWMUtByZVutP
	ZghSK4TELfIBb3nAZuK7ThQ4T1yTumERSa9zNXvNpwWwsmBPzpnhHYAvh4M/irJKWZkKGkqxHwe
	ZqEWzHpANxLc67s6N/NvZ4TyyBkoQT58M4bSjanacnzNUDMqNjoqC9U
X-Received: by 2002:a05:620a:2a01:b0:92e:6c15:24cd with SMTP id af79cd13be357-939ea096ac1mr525489385a.15.1789135826040;
        Fri, 11 Sep 2026 07:10:26 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939f19f94a1sm128350685a.42.2026.09.11.07.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:25 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:52 +0000
Subject: [PATCH RFC v2 14/15] rcu-tasks: Retire switched-out tasks with no
 trampoline nesting at scan time
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-14-eaaa61ed2da4@toxicpanda.com>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=3915;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=CHfEJf4XyY3zn8RyomjOM2Uc3mVFT7MUycrwjg2RabY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCsPahyd7Oix02uJZsqv3hNKRWBYJbR9ZWsmEzIdYJha+M3Xp7J5xDeZFd/3etSxBmrSG0gewnR
 pnh9QNzgnXwY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The previous patch lets a task report its own quiescent state when it is
preempted with rcu_tramp_nesting == 0, but a task that was preempted
before the grace period started and simply has not run since is still
listed as a holdout until it next passes through __schedule().  As Paul
pointed out, the grace-period kthread can settle that case itself.

For a task that is switched out, task_call_func() pins it and
!task_curr() tells us it left the CPU through __schedule(), whose
locking orders its last rcu_tramp_nesting and rcu_tasks_irq_ip updates
before ours; a task preempted from irq exit inside trampoline text has
the count held non-zero across the switch by irqentry_preempt().  So a
pinned, not-running task with a zero count is neither in nor called
from a trampoline, and with rcu_tasks_irq_ip_holds() also clear (the
kprobe jump window, which can open after the task was switched out) it
is quiescent now, whether or not it ever runs again.  Check that in
rcu_tasks_pertask() so such tasks never become holdouts, and in
check_holdout_task() so they are retired on the next scan.

This is the only remote reader of the count, and it only reads it for a
pinned, switched-out task, so the trampoline-side increment and
decrement stay plain on every preemption model, PREEMPT_RT included.

Only under CONFIG_RCU_TASKS_PREEMPT_QS; other architectures are
unchanged.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/tasks.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index bab08a666dc0..ba432bd922e2 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1014,10 +1014,39 @@ static bool rcu_tasks_is_holdout(struct task_struct *t)
 	return true;
 }
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+/* task_call_func() callback: is @t switched out with no trampoline in play? */
+static int rcu_tasks_switched_out_clean(struct task_struct *t, void *arg)
+{
+	/*
+	 * With @t pinned, !task_curr() means it last left the CPU through
+	 * __schedule(), so its rcu_tramp_nesting and rcu_tasks_irq_ip are
+	 * stable and ordered before the rq lock we hold.  A task preempted
+	 * from irq exit inside trampoline text has the count held non-zero
+	 * across the switch by irqentry_preempt(), so zero here means neither
+	 * in nor called from a trampoline; rcu_tasks_irq_ip_holds() covers the
+	 * one case that can become true after the task was switched out (a
+	 * kprobe jump-optimization window).  Both clear: already quiescent,
+	 * whether or not it ever runs again.
+	 */
+	return !task_curr(t) && !READ_ONCE(t->rcu_tramp_nesting) &&
+	       !rcu_tasks_irq_ip_holds(t);
+}
+
+/* Is @t, right now, switched out somewhere that is a quiescent state? */
+static bool rcu_tasks_preempted_qs(struct task_struct *t)
+{
+	return task_call_func(t, rcu_tasks_switched_out_clean, NULL);
+}
+#else
+static bool rcu_tasks_preempted_qs(struct task_struct *t) { return false; }
+#endif
+
 /* Per-task initial processing. */
 static void rcu_tasks_pertask(struct task_struct *t, struct list_head *hop)
 {
-	if (t != current && rcu_tasks_is_holdout(t)) {
+	if (t != current && rcu_tasks_is_holdout(t) &&
+	    !rcu_tasks_preempted_qs(t)) {
 		get_task_struct(t);
 		t->rcu_tasks_nvcsw = READ_ONCE(t->nvcsw);
 		WRITE_ONCE(t->rcu_tasks_holdout, true);
@@ -1181,6 +1210,7 @@ static void check_holdout_task(struct task_struct *t,
 	if (!READ_ONCE(t->rcu_tasks_holdout) ||
 	    t->rcu_tasks_nvcsw != READ_ONCE(t->nvcsw) ||
 	    !rcu_tasks_is_holdout(t) ||
+	    rcu_tasks_preempted_qs(t) ||
 	    (IS_ENABLED(CONFIG_NO_HZ_FULL) &&
 	     !is_idle_task(t) && READ_ONCE(t->rcu_tasks_idle_cpu) >= 0)) {
 		WRITE_ONCE(t->rcu_tasks_holdout, false);

-- 
2.55.0

