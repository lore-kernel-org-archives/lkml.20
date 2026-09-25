Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F53E51DE;
	Fri, 25 Sep 2026 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333646; cv=none; b=dV96dlFZIUNUCBunhfAwFjrfROrkHjncaNMzTLMvHVdTVepsln7nUrno1kLguO5Z/yf4oc9fkqYD/OlxxkxMpl+X/L65rHcpug7jDdc0EDLVW8/X1iNW7oEjZ3LKIpNuIjonnzJC796m0JO6bklDtTBaYC6wnj+AgKW+sgvoBu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333646; c=relaxed/simple;
	bh=slMH0vrJliTuHoAsziMwFJ9wp+OGs1UtB8aYmW8TLZE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ObCXTI+14GEUq7KV1j1rJgO0dl1xbH07rHyaYhFV+4fxagNep6MYxCN7tO3Gq70WuyQyjsKJu9EgQQsPdMFfAu8AlPYBT+CcNMzzWULVRznSeH2IwML/AkGKKWadVq7RbyApSm0wAgNKShg5gl9uQZXOmZ4/O46YFqyD5tOQNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T08GlUFl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Fqc0/86H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T08GlUFl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Fqc0/86H"
Date: Fri, 25 Sep 2026 10:54:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333643;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crSJBR3ZQiAOcdKYKpAEj6hhUQ85Qb+JN8nwFHNRYNQ=;
	b=T08GlUFl65GwGaJvC+FoWooRD6yOnJISoVpRr8hZ+DnshjpHBwqRagrQh3hWbNckc599ii
	VohNJrR3edWonX31Cf/oBJQ9SJ1xcB+hC6UmBbac2yYlqXgWPN/D1/CJmBG5pwiaIWXf7b
	Ct65XXyzLJ2KRo3QYu4Mmnb9WCbcEES+05OJ/ky/lRo9ZO6FWrJW6XThJ613UtJphB9eMe
	rsAQU54Z6N0xBjelLOVETL3IMpv5YSgGQtlYe4p1tNq8HrHaEhgW0jQxGkKmBnbHd8+F7J
	GDPHzrbX2GAw57Y12q6uiEO/u2/fxJOCRT5OHIMirF5svEI9CwZ1JpWwuyQM4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333643;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crSJBR3ZQiAOcdKYKpAEj6hhUQ85Qb+JN8nwFHNRYNQ=;
	b=Fqc0/86HFlCHwbgMQt15gqqc7Yyk6HdUbI6LpwgTzqp4b7U4zVyOsFIL2ivHMUvehChlwy
	5OJw9rEeErZlJ5Cg==
From: "tip-bot2 for Shubhang Kaushik (Ampere)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Clarify WF_SYNC wakeup semantics
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>
References: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033364193.2819794.10008973300214008226.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     e4c353c3933968fe8efecb269fdbe3baa1d1ddd0
Gitweb:        https://git.kernel.org/tip/e4c353c3933968fe8efecb269fdbe3baa1d=
1ddd0
Author:        Shubhang Kaushik (Ampere) <sh@gentwo.org>
AuthorDate:    Tue, 22 Sep 2026 14:57:05 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:59 +02:00

sched: Clarify WF_SYNC wakeup semantics

The synchronous waitqueue wakeup comments currently state that a
synchronous wakee will not be migrated to another CPU. This is not
guaranteed by the scheduler wakeup path.

WF_SYNC is an advisory hint that the caller expects the waker to
schedule away soon. Scheduler classes may use it for placement or
preemption, but callers must not rely on it to prevent migration,
preserve CPU locality, or make the wakee run next.

Keep this contract next to the flag definition, remove the stale
waitqueue wording, and make the locked helper refer to the unlocked
variant.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@g=
entwo.org
---
 kernel/sched/sched.h |  9 +++++++--
 kernel/sched/wait.c  | 22 +++++-----------------
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index f7d0b64..b98084e 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2535,8 +2535,13 @@ static inline int task_on_rq_migrating(struct task_str=
uct *p)
 #define WF_EXEC			0x02 /* Wakeup after exec; maps to SD_BALANCE_EXEC */
 #define WF_FORK			0x04 /* Wakeup after fork; maps to SD_BALANCE_FORK */
 #define WF_TTWU			0x08 /* Wakeup;            maps to SD_BALANCE_WAKE */
-
-#define WF_SYNC			0x10 /* Waker goes to sleep after wakeup */
+/*
+ * Hint that the caller expects the waker to sleep soon.
+ * Scheduler classes may use it for placement or preemption.
+ * Callers must not rely on it to prevent migration,
+ * preserve CPU locality or make the wakee run next.
+ */
+#define WF_SYNC			0x10
 #define WF_MIGRATED		0x20 /* Internal use, task got migrated */
 #define WF_CURRENT_CPU		0x40 /* Prefer to move the wakee to the current CPU.=
 */
 #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index d033f60..477e4bf 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -174,15 +174,11 @@ EXPORT_SYMBOL_GPL(__wake_up_locked_key);
  * @mode: which threads
  * @key: opaque value to be passed to wakeup targets
  *
- * The sync wakeup differs that the waker knows that it will schedule
- * away soon, so while the target thread will be woken up, it will not
- * be migrated to another CPU - ie. the two threads are 'synchronized'
- * with each other. This can prevent needless bouncing between CPUs.
+ * Passes WF_SYNC to waitqueue wake functions. The default wake function
+ * forwards it to the scheduler; see WF_SYNC for the hint's semantics.
  *
- * On UP it can prevent extra preemption.
- *
- * If this function wakes up a task, it executes a full memory barrier before
- * accessing the task state.
+ * If this function wakes up a task, it executes a full memory barrier
+ * before accessing the task state.
  */
 void __wake_up_sync_key(struct wait_queue_head *wq_head, unsigned int mode,
 			void *key)
@@ -200,15 +196,7 @@ EXPORT_SYMBOL_GPL(__wake_up_sync_key);
  * @mode: which threads
  * @key: opaque value to be passed to wakeup targets
  *
- * The sync wakeup differs in that the waker knows that it will schedule
- * away soon, so while the target thread will be woken up, it will not
- * be migrated to another CPU - ie. the two threads are 'synchronized'
- * with each other. This can prevent needless bouncing between CPUs.
- *
- * On UP it can prevent extra preemption.
- *
- * If this function wakes up a task, it executes a full memory barrier before
- * accessing the task state.
+ * Same as __wake_up_sync_key(), but called with @wq_head->lock held.
  */
 void __wake_up_locked_sync_key(struct wait_queue_head *wq_head,
 			       unsigned int mode, void *key)
