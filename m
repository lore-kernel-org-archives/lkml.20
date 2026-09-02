Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873433E92AC;
	Wed,  2 Sep 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335703; cv=none; b=QdVR+nOzHGWyEcvYAf6kZiYApfHmAYNdyr1pLdVYKK4kdE+a7YqxeDhoLO9cyQ4Ywh330jomIeEPImS04h94XMGo4wsyhvN/HGa8LYCx/oKCfTNQytGmA8sYSajTPw87bnOIPOvYZha4o4xJT2lbL3BV0O/wu1rFi/wGC5HFwME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335703; c=relaxed/simple;
	bh=o6UysYKfPpR2m1rKcgT4T7MM01mDk56UagFU6ay+qzI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=H2anpTxdj0CD9BgA6UvEX/r1TrJoLH/SHgtUB92qgYh8FTbxPTjY6QNhbW2RaiwQQyCChvHVf8ekNl//KStw3YbTLxNR/Jn3iQKXp6QYs+1HBpxdKd/zSVuIQSjY/CeE06HwB9AtthSdEy77nieBUCXILULevSeSBYGEpX5D0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1ZvFTnb0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xLnIZ6UO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1ZvFTnb0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xLnIZ6UO"
Date: Wed, 02 Sep 2026 07:54:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335699;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aOg3+MBax8ALClKKHdP9zOASN7RtGbHFiIq9+iuI2s=;
	b=1ZvFTnb0p+mf7kabcwW15u7+TJvQQrLixkoalcVQJkvgD+kTMmuX25X+BipT27VOqjNmns
	g7zkLaD1CwhHe0gKOgKuU5ZLBOGRnZIxbe0T2eg7/LoKhHIEQobMHFcAIUM5BM4yqVHH1/
	7oKYYwQjw7xWLCh8irKDR8PU64pH62CkuT1wLsk/MMsilNAnyhugS2ophYbwB4nYW7RFoq
	qbFKGjO6O3d8Vc+GSxibws3mQY3qE0mZWAGeXe4xDbICq4qMRforebAhZedOng8K/486MK
	1yfNh9pv1+/vLMY4IGAJa4HBD5o78dJ2L3kINxx8W0te8mdtZcJ59oi0qpjjrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335699;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aOg3+MBax8ALClKKHdP9zOASN7RtGbHFiIq9+iuI2s=;
	b=xLnIZ6UOujtxO3gFtlw0crPYlqBbL7ujGCesF+RWpLtLIe3MigfSFcnKCKViGtBo6iBlhT
	2HADPwrZ7zRwRnCQ==
From: "tip-bot2 for John Stultz" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched: Break out core of attach_tasks() helper into sched.h
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, John Stultz <jstultz@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807035232.1881495-7-jstultz@google.com>
References: <20260807035232.1881495-7-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833569740.3717435.16645757599051004026.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     6b73a09e943fe84778672362bfbd1cbb3fca9a8a
Gitweb:        https://git.kernel.org/tip/6b73a09e943fe84778672362bfbd1cbb3fc=
a9a8a
Author:        John Stultz <jstultz@google.com>
AuthorDate:    Fri, 07 Aug 2026 03:52:12=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:21 +02:00

sched: Break out core of attach_tasks() helper into sched.h

Pull the core of attach_tasks() out into sched.h so
it can be used more generically.

Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260807035232.1881495-7-jstultz@google.com
---
 kernel/sched/fair.c  | 16 +---------------
 kernel/sched/sched.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ade1ece..b8bd308 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11194,21 +11194,7 @@ next:
  */
 static void attach_tasks(struct lb_env *env)
 {
-	struct list_head *tasks =3D &env->tasks;
-	struct task_struct *p;
-	struct rq_flags rf;
-
-	rq_lock(env->dst_rq, &rf);
-	update_rq_clock(env->dst_rq);
-
-	while (!list_empty(tasks)) {
-		p =3D list_first_entry(tasks, struct task_struct, se.group_node);
-		list_del_init(&p->se.group_node);
-
-		attach_task(env->dst_rq, p);
-	}
-
-	rq_unlock(env->dst_rq, &rf);
+	__attach_tasks(env->dst_rq, &env->tasks);
 }
=20
 #ifdef CONFIG_NO_HZ_COMMON
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c70..81f17e6 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3139,6 +3139,25 @@ static inline void attach_one_task(struct rq *rq, stru=
ct task_struct *p)
 	attach_task(rq, p);
 }
=20
+/*
+ * __attach_tasks() - attaches a list of tasks (using se.group_node) to
+ * the new rq
+ */
+static inline void __attach_tasks(struct rq *rq, struct list_head *tasks)
+{
+	guard(rq_lock)(rq);
+	update_rq_clock(rq);
+
+	while (!list_empty(tasks)) {
+		struct task_struct *p;
+
+		p =3D list_first_entry(tasks, struct task_struct, se.group_node);
+		list_del_init(&p->se.group_node);
+
+		attach_task(rq, p);
+	}
+}
+
 #ifdef CONFIG_PREEMPT_RT
 # define SCHED_NR_MIGRATE_BREAK 8
 #else
