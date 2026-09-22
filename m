Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A23411A0A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790114838; cv=none; b=F8U525N0BVRmyn5c9mH1ashHiGKB6F7zCRmZsxBTYNW9GcLD/2AphwgURQj2FYvAQnkOxSAbZ2qZB5z6k/nIZrYRlZSDusY8R+vds/+1x3OBB1GVy5n1pb/mxYgECHhYQISVYgNWRdtoOgUpejnt3E4ytRWfV/beyoY+SnTbIvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790114838; c=relaxed/simple;
	bh=LvmLeQO2knT8uKaZkzMEOVAd85d4akQf14yLtxZoT+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fakcl8L/m1ww0NsVbAJ065H29CuMO9bWcRhTuzmLrxfVphqsFeZGdkIIvxlMLifnAi/sClCfnxmwJq1sDV/GgJ/kcKuI9MTuIaggMWx3gT2ZGyB6v4kpaFasrAYdAfElEkj0CysWMAcoSFpmKaPx2/34c9hHPmrDr76wzWu8QKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=Tx8MA2gi; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="Tx8MA2gi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1790114226;
	bh=LvmLeQO2knT8uKaZkzMEOVAd85d4akQf14yLtxZoT+s=;
	h=From:Date:Subject:To:Cc:From;
	b=Tx8MA2giklnEuGt22s2hDTllJMWwHQEc/+l6xL0sESFpBj4fmazMGCB/TRLraVn8N
	 /LpA26JRyrSwUhiSPJa3Wz8Z1x2UQ+aH1MH5x4UCE83xbNzRXZevAU0gXUgECv4/rG
	 YWg0FDWlFEOkfePnrHISo/kqLVX/CrxvyDPYwP6Q=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 32F3F401A2;
	Tue, 22 Sep 2026 14:57:06 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Tue, 22 Sep 2026 14:57:05 -0700
Subject: [PATCH v3] sched: Clarify WF_SYNC wakeup semantics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>
X-B4-Tracking: v=1; b=H4sIALD5smoC/23NQQ6DIBCF4asY1qUBiiJd9R5NFxVmlA00YLDGe
 PeiSdM0cfm/ZL5ZSILoIJFrtZAI2SUXfInLqSJmePoeqLOliWCiYa2QNJkBLJ2QptkbaoOhoEU
 nEXSrUJFy94qA7r2b90fpwaUxxHl/kfm2frX6QMucMoqt1mA7KRHrWw9+nMI5xJ5sXBY/QnN1R
 IhCNJYjZ8qwWjd/xLquH4iLx2b2AAAA
X-Change-ID: 20260824-sched-wf-sync-doc-e92b4fe987f7
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Christopher Lameter <clameter@amperecomputing.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790114226; l=4296;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=LvmLeQO2knT8uKaZkzMEOVAd85d4akQf14yLtxZoT+s=;
 b=tZdyF1hJLRrdXO7z5ldOBIdp0TXirW2WHvm+5HCQJ0oCCMLqeR9nS/ec1XKQ6EezTTfgZdpwt
 fkUr5SYQUhcDkYL+OdJCIylKHNjaOVKfJG14ugP8oC+ou97xgOdFfzr
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

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

---
Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Changes in v3:
  - Drop the standalone documentation in favor of a concise comment next
    to WF_SYNC.
  - Consolidate the series into one patch and remove the stale waitqueue
    wording.

Link to v2: https://lore.kernel.org/r/20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org
---
 kernel/sched/sched.h |  9 +++++++--
 kernel/sched/wait.c  | 22 +++++-----------------
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf864d1ed91d4ec3d4624850aded7e0..fe366e9f248996a293e5bb6b76c8f01485a9ea6b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2527,8 +2527,13 @@ static inline int task_on_rq_migrating(struct task_struct *p)
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
 #define WF_CURRENT_CPU		0x40 /* Prefer to move the wakee to the current CPU. */
 #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index d033f600f48c6fc3a0a088ea5d9f6ed95ec4c86e..477e4bf9c01e19a520b626c09a8b95c065616fe1 100644
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

---
base-commit: fe2ec83746e501645709761605c2464a44fd2929
change-id: 20260824-sched-wf-sync-doc-e92b4fe987f7

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

