Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA03B19A3;
	Thu, 17 Sep 2026 21:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681014; cv=none; b=VKMt52TITcm/eZCtVSgjl2kS7QbFrbNKoGYkmTf4T1Ee3YkgK5a7jZ4kdo6G4a36qbo5r2YMhnKyvv0A3Wgw4C3CbOd2ZVI3L/PkiWJHv7JPZ2WjO4BT5fSoBg7VMtyzwsIUPsi1tcw6MGZy1NLzK7yMgYesuZU4TKnHHB6p0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681014; c=relaxed/simple;
	bh=wNrHsjDKVfWS8zXNLUqwBHM5EXAhWqtMXDjFXL6wzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBakDdxXRgt4IyzWPLtVeiZg5sT52ZfftuYRONnTllDqU4Afwfna1pBuvMWuW6L0HTsVCr5owVBERzLmCEjCSyQXdNQe0HzaMB2aFZbJA6W5bxVNw/osWNITdcL9gNfzF7Je8nwbLdprSetpwRx0TByTggOAV9dSZlcjUjBtKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=CM0SLvpk; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="CM0SLvpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1789677807;
	bh=wNrHsjDKVfWS8zXNLUqwBHM5EXAhWqtMXDjFXL6wzKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CM0SLvpkmXSePx9Tojt0+WyfIF7ZNk4P7SVDVgG+C5iyjzUbinJuHNglKXaUdgW3t
	 Z4FBepHBhVJbRLIlCiqY0lQAR/6UO9bgj0z9lZDm3dlURxauhX6+5fQoQi7fy0uhrE
	 KOZaq/g2I9x5vXqRTPddzpyMCI/axpKZPBEe/C84=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 0E00640834;
	Thu, 17 Sep 2026 13:43:27 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Thu, 17 Sep 2026 13:43:25 -0700
Subject: [RFC PATCH v2 2/2] sched/wait: Clarify WF_SYNC wakeup semantics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-sched-wf-sync-doc-v2-2-6d1f107c0596@gentwo.org>
References: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org>
In-Reply-To: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
 Christopher Lameter <clameter@amperecomputing.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789677805; l=3313;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=wNrHsjDKVfWS8zXNLUqwBHM5EXAhWqtMXDjFXL6wzKI=;
 b=oT5B6U5CH9K2QzLrVe1eoPzmq4znP02JcICOLXbXwCGvHXqBnrWUJuXG6M1L2UWNz0o9ceWWA
 ZPW+KXrVXhjBbLc+WmgmoNFBZQ86VkmghYaebIEklDWV40C5VM3o6RC
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

The synchronous waitqueue wakeup comments state that the wakee will not
be migrated to another CPU. This is not guaranteed by the current
scheduler wakeup path.

The synchronous helpers pass WF_SYNC to waitqueue wake functions. The
default wake function forwards it to the scheduler, where fair-class
tasks can use it as a wakeup-placement and preemption hint.

Correct the API comments to describe this behavior and remove the
incorrect no-migration guarantee.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
 kernel/sched/wait.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index d033f600f48c6fc3a0a088ea5d9f6ed95ec4c86e..ac1d260a6a37fc35b934079706819b79e20df4ba 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -174,15 +174,16 @@ EXPORT_SYMBOL_GPL(__wake_up_locked_key);
  * @mode: which threads
  * @key: opaque value to be passed to wakeup targets
  *
- * The sync wakeup differs that the waker knows that it will schedule
- * away soon, so while the target thread will be woken up, it will not
- * be migrated to another CPU - ie. the two threads are 'synchronized'
- * with each other. This can prevent needless bouncing between CPUs.
+ * The caller expects the waker to schedule away soon. This helper passes
+ * WF_SYNC to waitqueue wake functions. The default wake function forwards
+ * it to the scheduler.
  *
- * On UP it can prevent extra preemption.
+ * For fair-class tasks, WF_SYNC is a wakeup-placement and preemption
+ * hint. It does not guarantee that the wakee will run on the waker CPU
+ * or avoid migration. On UP, this may avoid an unnecessary preemption.
  *
- * If this function wakes up a task, it executes a full memory barrier before
- * accessing the task state.
+ * If this function wakes up a task, it executes a full memory barrier
+ * before accessing the task state.
  */
 void __wake_up_sync_key(struct wait_queue_head *wq_head, unsigned int mode,
 			void *key)
@@ -200,15 +201,16 @@ EXPORT_SYMBOL_GPL(__wake_up_sync_key);
  * @mode: which threads
  * @key: opaque value to be passed to wakeup targets
  *
- * The sync wakeup differs in that the waker knows that it will schedule
- * away soon, so while the target thread will be woken up, it will not
- * be migrated to another CPU - ie. the two threads are 'synchronized'
- * with each other. This can prevent needless bouncing between CPUs.
+ * The caller expects the waker to schedule away soon. This helper passes
+ * WF_SYNC to waitqueue wake functions. The default wake function forwards
+ * it to the scheduler
  *
- * On UP it can prevent extra preemption.
+ * For fair-class tasks, WF_SYNC is a wakeup-placement and preemption
+ * hint. It does not guarantee that the wakee will run on the waker CPU
+ * or avoid migration. On UP, this may avoid an unnecessary preemption.
  *
- * If this function wakes up a task, it executes a full memory barrier before
- * accessing the task state.
+ * If this function wakes up a task, it executes a full memory barrier
+ * before accessing the task state.
  */
 void __wake_up_locked_sync_key(struct wait_queue_head *wq_head,
 			       unsigned int mode, void *key)

-- 
2.52.0

