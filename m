Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035005;
	b=B+s0e2SS7MVIepnsPfrZ2xmN2GKcca0zcqubYf+jqtplx0xswN+hakic7LyN/3GBlTfR
	 LLA9+k25dX+Y2HqefQPsU8dAccfpfaLHpEmQ4LehNMvQSihnDUbLu5CNFpA9MYl0Sbfeu
	 ZBCjB6wITIpEPc8WKEGtiOkC+WHo7KA+UP7UVYnl5dFiVhaEFj6FYQlTnPIesLgkNqj/K
	 tq302AbAbZZ0yPtv0YPclPICGUua4pgGelcLA0kA0lOi3nTJcWh7MeUEc9z2nMBGb65kr
	 XkS1W0xhha/3jQOw1JAZlbF/UWnnkOwKCHEWAFw4tqCUu77HnPeJxuQ7Buky7ugijlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Baqew0KNyzgBR3FnUq20SDqiNfAUJfjKlTUH2vm2UXw=;
	b=QNSuyWnfZ8T4dmAphz2JrPMwEbsyHQWqjybXP2dnL/RKBeSx48cWsCSEqSBsE0Ufhw8r
	 L5XJPf5Jmey91FDO2Be/x+bbqbz1g1L1sd5h5nTsATnc0iULJTc7vnXUuaKH3Egi/EYx6
	 PIkLZNzUctxAIXNYYWEU+PV643C7nhSdhUywlPEconXc/I+HKfQDMi49eAKQodhdoRc8A
	 pfBt5uG5VxPFOZOpdh9T7izXyFK2Tszw7QXkJGTv8NImj0Hn1wDDkq1KZEoj1viLTJCQ3
	 W2neCUrDstOsWriHEUEmL28DgBLrqPTz+ZFuJHrJmjB9eIAzOL8Hs//XC0ULvRmA0pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npiFAhEI;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC3606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAC3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npiFAhEI
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1796487eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794035004; x=1794639804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Baqew0KNyzgBR3FnUq20SDqiNfAUJfjKlTUH2vm2UXw=;
        b=npiFAhEIAbNe+iqhoScdUI4ypKHQgHMeUMgY+1/v5jna8muAetGdtn+vTWuZT0+FpE
         HN1RjZCpyb8QZKzOTmoXpdXwEhB/Uv9HIFeGr7AlxdI/MVZWG5vAzv5L3YDpTVcgFoPn
         jpGCfPEGkjmmQEHz9LGK2plRmHu7P8uSRPCswDP5fRtzE0FcbJakAOD/AxIp65fEfxHA
         YS4Hcxeyvc/Fn6cEB+xAdoNz4Y5XLwEJvQ3mqjGykcl/D3dcUzBWMus4EosJAmXL+zVG
         y+ZFF8BXynb23fgUcfigKomrCs4ZRE+G62CbWWJaDd0AbkzW7Va6rV3GdpTwPfOdpLGA
         KI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794035004; x=1794639804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Baqew0KNyzgBR3FnUq20SDqiNfAUJfjKlTUH2vm2UXw=;
        b=hwNqewydMVaG4jlbslfD4IGC6Ts55NZRZeZjExQB1eARJNZ1wIb5j4esMnWG+wwVE4
         E6OKpIDPvn60rSBGuc9UIU2aQeAzsHUlB1vFn8PPW08zHwtn36R8PAVfezhHUUoPnGbw
         WN05OeEz4+iPuZf5SJ/isrRRKfzy6wlr4oLih3CPep3yOqzQ2rw4U3oeRXg4SGF5BrEB
         SUODfv7KQZUFYS44M58nDfkGPRwrIYA1KqMqRJfnfFXFuIz93BSeG+7NktPbP0ANjz0T
         zATunvceffKfITzFvEi5UApMbvjrtLE9/WJjmRiEu9c2S9HUitnpHrbPBrK/QVMefFfe
         /qxA==
X-Forwarded-Encrypted: i=1; AL+hErFa4UuGnahP2miO0iJCP/o0T2aXbCo/rOnEFozUVr8abMO7ep0vNa/yX3JE/15J/IYe9N9JXp2KM/G+auw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AFiGJhdN8uYi9Ieh/WC69sw8OEwVMOeShdpyeFf1yZILV1Nm5
	HrdKD+WkKNs0do3KpSZrtvL2gLvVAoBDR2e4mJRgAb3qY/WZIlFEyFwS
X-Gm-Gg: AYBFou0tMuPXlzdIxV3r3OXAfu1AaKlXsAtunvHPmSFrQ3JaxlNds/Hh7kujQm4cb+h
	RQBgZe6Ki8gQkPGOh5AB6YX8jsB2S5/niDhtTgkRsHLWiQGJr2f/jTgNG5gpypma8j10kIy3CNT
	lXlSgpcFG5mUakB5v5z0o59oAJSc/cbiXWGWztpQ6XijWl9z0EkHsWHKoZSm2guoX0J2a3JA68a
	+1VM2yVwIQi+W98tMBrw6oZUFRYeZdI98cxXFfskBAJQI2NnXQhfxBqyTD64kAwvlNVRyD2FoGP
	sESmeL0LWrX2/2wwu3ajiGs/tFloHAafwiTDHicEWgYHfBC6CMfN/zkqCc0hddY1/lLEwfgL662
	d9BFZuCo4Vg7BUC7TbGdyH3aN2b+ZfPqjHyCusbDQQr6zt765DSKMnV4UCxs7SzQUlxljfWT90V
	7Cy9XmtB5dbKitkp7c8YfXwRXewhzbZD3aWJ9ou6vy/gZP+qTK7BcMuwIRPd6xOodwCr/xTwGrf
	s0+8ZLytO0zC0rloJVf+oOZYbOa24SijigF3SqW8CWeHSoNgyVADJ23NGbCZK7/Vgoe/vRwkVdr
	2PPbJil9cK9wE1ICeKc/cKlB1akOK8pmN3WX2R8HwhEd
X-Received: by 2002:a05:693c:66cf:20b0:36c:da71:37e0 with SMTP id 5a478bee46e88-36f72cc851fmr6877224eec.2.1794035003650;
        Fri, 06 Nov 2026 23:03:23 -0800 (PST)
Received: from asahi.tail4da9e3.ts.net ([223.38.80.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm12684195eec.26.2026.11.06.23.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:03:23 -0800 (PST)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] taskstats: account exiting threads once in TGID reports
Date: Sat,  7 Nov 2026 16:03:19 +0900
Message-ID: <20261107070319.953869-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031052451.78846-1-pocj8ur4in@gmail.com>
References: <20261031052451.78846-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A TGID query can count an exiting thread twice after its contribution
reaches the cache, or miss a zombie thread whose contribution has not
been cached. The final TGID exit notification can also be sent before
other exiting threads finish cache accounting.

Track whether each exiting thread has contributed to the cache, and
use that state when collecting TGID statistics. Defer the final exit
notification until all exiting threads finish cache accounting. This
keeps TGID queries and the final notification consistent across thread
exit races.

In an arm64 QEMU/KVM guest, forced exit races confirmed that TGID
queries count a thread once and the final notification includes both
exiting threads. The existing taskstats selftest passed.

Fixes: ad4ecbcba728 ("[PATCH] delay accounting taskstats interface send tgid once")
Link: https://lore.kernel.org/all/asaKCo5lwB3nzWNM@redhat.com/
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Changes in v2:
- Remove the fork-time reset: a task cannot fork after taskstats_exit().
- Drop the exit_state check: an unaccounted zombie still belongs in the
  TGID query, including for a single-threaded process.
- Defer the final PID/AGROUP and TGID notification until every exiting
  thread has finished cache accounting; keep both records in one message.
- Use task_struct::atomic_flags rather than adding a new task_struct member.
- Mark failed cache allocation as finished so a deferred notification
  is not left pending.

v1: https://lists.openwall.net/linux-kernel/2026/10/31/267

 include/linux/sched.h        |   9 ++++
 include/linux/sched/signal.h |   5 +++
 kernel/taskstats.c           | 104 +++++++++++++++++++++++++++++++++----------
 3 files changed, 95 insertions(+), 23 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f7..257e6028c88c1 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1875,6 +1875,8 @@ static __always_inline bool is_user_task(struct task_struct *task)
 #define PFA_SPEC_IB_DISABLE		5	/* Indirect branch speculation restricted */
 #define PFA_SPEC_IB_FORCE_DISABLE	6	/* Indirect branch speculation permanently restricted */
 #define PFA_SPEC_SSB_NOEXEC		7	/* Speculative Store Bypass clear on execve() */
+#define PFA_TASKSTATS_TGID_ACCOUNTED	8	/* Included in signal->stats */
+#define PFA_TASKSTATS_TGID_SKIPPED	9	/* No TGID cache at taskstats_exit */
 
 #define TASK_PFA_TEST(name, func)					\
 	static inline bool task_##func(struct task_struct *p)		\
@@ -1913,6 +1915,13 @@ TASK_PFA_CLEAR(SPEC_IB_DISABLE, spec_ib_disable)
 TASK_PFA_TEST(SPEC_IB_FORCE_DISABLE, spec_ib_force_disable)
 TASK_PFA_SET(SPEC_IB_FORCE_DISABLE, spec_ib_force_disable)
 
+#ifdef CONFIG_TASKSTATS
+TASK_PFA_TEST(TASKSTATS_TGID_ACCOUNTED, tgid_stats_accounted)
+TASK_PFA_SET(TASKSTATS_TGID_ACCOUNTED, tgid_stats_accounted)
+TASK_PFA_TEST(TASKSTATS_TGID_SKIPPED, tgid_stats_skipped)
+TASK_PFA_SET(TASKSTATS_TGID_SKIPPED, tgid_stats_skipped)
+#endif
+
 static inline void
 current_restore_flags(unsigned long orig_flags, unsigned long flags)
 {
diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index efa1e2d6c7a6b..b6f4e24e1552e 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -14,6 +14,9 @@
 #include <linux/mm_types.h>
 #include <asm/ptrace.h>
 
+struct listener_list;
+struct sk_buff;
+
 /*
  * Types defining task->signal and task->sighand and APIs using them:
  */
@@ -221,6 +224,8 @@ struct signal_struct {
 #endif
 #ifdef CONFIG_TASKSTATS
 	struct taskstats *stats;
+	struct sk_buff *taskstats_pending_skb;
+	struct listener_list *taskstats_pending_listeners;
 #endif
 #ifdef CONFIG_AUDIT
 	unsigned audit_tty;
diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index f31df72f0e9df..3e1f5a44ee62f 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -245,8 +245,8 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
 	u64 now_ns;
 
 	/*
-	 * Add additional stats from live tasks except zombie thread group
-	 * leaders who are already counted with the dead tasks
+	 * Add stats from tasks not yet included in the dead-task cache.
+	 * Accounting can finish before exit_state is set.
 	 */
 	rcu_read_lock();
 	first = find_task_by_vpid(tgid);
@@ -261,7 +261,7 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
 
 	now_ns = ktime_get_ns();
 	for_each_thread(first, tsk) {
-		if (tsk->exit_state)
+		if (task_tgid_stats_accounted(tsk))
 			continue;
 
 		tgid_stats_add_task(stats, tsk, now_ns);
@@ -280,20 +280,48 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
 	return rc;
 }
 
-static void fill_tgid_exit(struct task_struct *tsk)
+static bool tgid_stats_complete(struct task_struct *tsk)
 {
+	struct task_struct *thread;
+	bool complete = true;
+
+	if (atomic_read(&tsk->signal->live))
+		return false;
+
+	rcu_read_lock();
+	for_each_thread(tsk, thread) {
+		if (!task_tgid_stats_accounted(thread) &&
+		    !task_tgid_stats_skipped(thread)) {
+			complete = false;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return complete;
+}
+
+static struct sk_buff *finish_tgid_exit(struct task_struct *tsk, bool account,
+					struct listener_list **pending_listeners)
+{
+	struct sk_buff *pending = NULL;
 	unsigned long flags;
-	u64 now_ns;
 
 	spin_lock_irqsave(&tsk->sighand->siglock, flags);
-	if (!tsk->signal->stats)
-		goto ret;
-
-	now_ns = ktime_get_ns();
-	tgid_stats_add_task(tsk->signal->stats, tsk, now_ns);
-ret:
+	if (account) {
+		tgid_stats_add_task(tsk->signal->stats, tsk, ktime_get_ns());
+		task_set_tgid_stats_accounted(tsk);
+	} else {
+		task_set_tgid_stats_skipped(tsk);
+	}
+	if (tgid_stats_complete(tsk)) {
+		pending = tsk->signal->taskstats_pending_skb;
+		*pending_listeners = tsk->signal->taskstats_pending_listeners;
+		tsk->signal->taskstats_pending_skb = NULL;
+		tsk->signal->taskstats_pending_listeners = NULL;
+	}
 	spin_unlock_irqrestore(&tsk->sighand->siglock, flags);
-	return;
+	return pending;
 }
 
 static int add_del_listener(pid_t pid, const struct cpumask *mask, int isadd)
@@ -581,13 +609,34 @@ static struct taskstats *taskstats_tgid_alloc(struct task_struct *tsk)
 	return stats;
 }
 
+static void send_tgid_notification(struct sk_buff *skb,
+				   struct task_struct *tsk,
+				   struct listener_list *listeners)
+{
+	struct taskstats *stats;
+
+	stats = mk_reply(skb, TASKSTATS_TYPE_TGID,
+			 task_tgid_nr_ns(tsk, &init_pid_ns));
+	if (!stats) {
+		nlmsg_free(skb);
+		return;
+	}
+
+	memcpy(stats, tsk->signal->stats, sizeof(*stats));
+	stats->version = TASKSTATS_VERSION;
+	send_cpu_listeners(skb, listeners);
+}
+
 /* Send pid data out on exit */
 void taskstats_exit(struct task_struct *tsk, int group_dead)
 {
 	int rc;
 	struct listener_list *listeners;
 	struct taskstats *stats;
-	struct sk_buff *rep_skb;
+	struct sk_buff *rep_skb, *pending = NULL;
+	struct listener_list *pending_listeners = NULL;
+	unsigned long flags;
+	bool complete;
 	size_t size;
 	int is_thread_group;
 
@@ -603,17 +652,17 @@ void taskstats_exit(struct task_struct *tsk, int group_dead)
 	if (is_thread_group) {
 		/* PID + STATS + TGID + STATS */
 		size = 2 * size;
-		/* fill the tsk->signal->stats structure */
-		fill_tgid_exit(tsk);
 	}
+	/* A failed cache allocation must not hold a pending TGID reply forever. */
+	pending = finish_tgid_exit(tsk, is_thread_group, &pending_listeners);
 
 	listeners = raw_cpu_ptr(&listener_array);
 	if (list_empty(&listeners->list))
-		return;
+		goto out_pending;
 
 	rc = prepare_reply(NULL, TASKSTATS_CMD_NEW, &rep_skb, size);
 	if (rc < 0)
-		return;
+		goto out_pending;
 
 	stats = mk_reply(rep_skb, TASKSTATS_TYPE_PID,
 			 task_pid_nr_ns(tsk, &init_pid_ns));
@@ -630,19 +679,28 @@ void taskstats_exit(struct task_struct *tsk, int group_dead)
 	if (!is_thread_group || !group_dead)
 		goto send;
 
-	stats = mk_reply(rep_skb, TASKSTATS_TYPE_TGID,
-			 task_tgid_nr_ns(tsk, &init_pid_ns));
-	if (!stats)
-		goto err;
+	spin_lock_irqsave(&tsk->sighand->siglock, flags);
+	complete = tgid_stats_complete(tsk);
+	if (!complete) {
+		tsk->signal->taskstats_pending_skb = rep_skb;
+		tsk->signal->taskstats_pending_listeners = listeners;
+	}
+	spin_unlock_irqrestore(&tsk->sighand->siglock, flags);
+	if (!complete)
+		goto out_pending;
 
-	memcpy(stats, tsk->signal->stats, sizeof(*stats));
-	stats->version = TASKSTATS_VERSION;
+	send_tgid_notification(rep_skb, tsk, listeners);
+	goto out_pending;
 
 send:
 	send_cpu_listeners(rep_skb, listeners);
+out_pending:
+	if (pending)
+		send_tgid_notification(pending, tsk, pending_listeners);
 	return;
 err:
 	nlmsg_free(rep_skb);
+	goto out_pending;
 }
 
 static const struct genl_ops taskstats_ops[] = {
-- 
2.55.0
