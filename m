Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC975184524
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132062; cv=none; b=t61ijPCC2RYK48lZrTf05RHIF7GoYbYio79CzmIXufZolRmp0T5eDZ0ENrMpGZ3d+qRwb2A+NJYrebxlBbFAAuQVdjyzQDFP87cBl6NY6EHQtOWDd12LIloNRCf+5L9q9t7VWMMhVAz2shh2CJJ4wJEM3U8C7TnhM+/63lkiR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132062; c=relaxed/simple;
	bh=My09vFSx6QPOyJmt+Sk9psvpO926Ke0gzcwpe9rXHmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sSeFKPrUX3p4tF36FvMkWY2p5nxwO+q0yMXJ97HiVxzADivXX5FSdEyZ6cWila5LIN/Pq0l4Hva35gc01nUWQ8NKTIUIUPfonSuyOiKI+UQ00OZIbDnXCXnHby6FplEoVr2x+zDmW3mBYSbQXQfx9OUx94tX31VfdZcvzQCe7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=D3W7w9Pm; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="D3W7w9Pm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=CR
	g+WrOxeHxca4pE7PHyRv3ivydIDmd5pdfcH5u4G+Y=; b=D3W7w9PmV1nAUsMrur
	EWJ47gvvmEiZzE+avbRdWbD5wmPEU6ks6SFpP5QPermR1R3TByG6uOJd84keVQZt
	tU2SGJaZ3CWMvInTv4n0ZEyiu1yJqy1ZYNDL7AO+4dmIDDBzm8wTF+Q7BSzjGYqG
	+r4pGBwLIlz/t2XYSrK67kk80=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3LJiVw9Fq9xyZAA--.18288S2;
	Fri, 16 Oct 2026 14:26:30 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	linux-kernel@vger.kernel.org
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	patrick.bellasi@arm.com,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/uclamp: Validate min/max pair under task_rq_lock()
Date: Fri, 16 Oct 2026 15:26:29 +0900
Message-ID: <20261016062629.2102883-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3LJiVw9Fq9xyZAA--.18288S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw4DtFWDAF1xXr4xWF4fAFb_yoWrCFy5pa
	9xXa1jyw45tFyxuFWIkws8Ca4Ygwn7uryj9ryrK3s2y3W5tr43AFy8tFW3ur43CFyUCFy7
	AF4jk3ZxWr1jvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piQJ57UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hclhGrRw5cGBwAA3y

sched_setattr() may update UCLAMP_MIN and UCLAMP_MAX independently. If two
calls validate against the same old pair before taking task_rq_lock(), both
can succeed and leave uclamp_req with min > max.

Check the task-dependent pair after task_rq_lock(), where updates are
serialized. Reject an inverted pair supplied together before
sched_uclamp_enable(). The uclamp static key remains enabled once set.
Keep scalar range checks and sched_uclamp_enable() before scheduler locks
because enabling uclamp may block.

Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utilization clamping")
Signed-off-by: Hui Su <sh_def@163.com>
---
Testing:
- PASS: x86_64 QEMU/KVM reproduced min=900/max=800 with both setters
  succeeding at iteration 20 before the fix; the candidate completed 100000
  rounds with exactly one setter returning `-EINVAL` per round, `bad_pair=0`,
  and `unexpected_errno=0`.
- PASS: x86_64 `make -j12 bzImage` with `CONFIG_UCLAMP_TASK=y`,
  `CONFIG_PROVE_LOCKING=y`, and `CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y`.
---
 kernel/sched/syscalls.c | 51 ++++++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index b215b0ead9a6..289559b0c571 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -315,27 +315,47 @@ static inline void __setscheduler_dl_pi(int newprio, int policy,
 
 #ifdef CONFIG_UCLAMP_TASK
 
-static int uclamp_validate(struct task_struct *p,
-			   const struct sched_attr *attr)
+static int uclamp_validate_pair(struct task_struct *p,
+			       const struct sched_attr *attr)
 {
-	int util_min = p->uclamp_req[UCLAMP_MIN].value;
-	int util_max = p->uclamp_req[UCLAMP_MAX].value;
+	int util_min;
+	int util_max;
 
-	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MIN) {
+	lockdep_assert_held(&p->pi_lock);
+
+	util_min = p->uclamp_req[UCLAMP_MIN].value;
+	util_max = p->uclamp_req[UCLAMP_MAX].value;
+
+	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MIN)
 		util_min = attr->sched_util_min;
+	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MAX)
+		util_max = attr->sched_util_max;
+
+	if (util_min != -1 && util_max != -1 && util_min > util_max)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int uclamp_validate(const struct sched_attr *attr)
+{
+	int util_min = attr->sched_util_min;
+	int util_max = attr->sched_util_max;
 
+	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MIN) {
 		if (util_min + 1 > SCHED_CAPACITY_SCALE + 1)
 			return -EINVAL;
 	}
 
 	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MAX) {
-		util_max = attr->sched_util_max;
-
 		if (util_max + 1 > SCHED_CAPACITY_SCALE + 1)
 			return -EINVAL;
 	}
 
-	if (util_min != -1 && util_max != -1 && util_min > util_max)
+	/* Both clamps are request-local, so validate them before enabling uclamp. */
+	if ((attr->sched_flags & SCHED_FLAG_UTIL_CLAMP) ==
+	    SCHED_FLAG_UTIL_CLAMP &&
+	    util_min != -1 && util_max != -1 && util_min > util_max)
 		return -EINVAL;
 
 	/*
@@ -418,11 +438,15 @@ static void __setscheduler_uclamp(struct task_struct *p,
 
 #else /* !CONFIG_UCLAMP_TASK: */
 
-static inline int uclamp_validate(struct task_struct *p,
-				  const struct sched_attr *attr)
+static inline int uclamp_validate(const struct sched_attr *attr)
 {
 	return -EOPNOTSUPP;
 }
+static inline int uclamp_validate_pair(struct task_struct *p,
+				       const struct sched_attr *attr)
+{
+	return 0;
+}
 static void __setscheduler_uclamp(struct task_struct *p,
 				  const struct sched_attr *attr) { }
 #endif /* !CONFIG_UCLAMP_TASK */
@@ -547,7 +571,7 @@ int __sched_setscheduler(struct task_struct *p,
 
 	/* Update task specific "requested" clamps */
 	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP) {
-		retval = uclamp_validate(p, attr);
+		retval = uclamp_validate(attr);
 		if (retval)
 			return retval;
 	}
@@ -570,6 +594,11 @@ int __sched_setscheduler(struct task_struct *p,
 	 */
 	rq = task_rq_lock(p, &rf);
 	update_rq_clock(rq);
+	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP) {
+		retval = uclamp_validate_pair(p, attr);
+		if (retval)
+			goto unlock;
+	}
 
 	/*
 	 * Changing the policy of the stop threads its a very bad idea:

base-commit: 045958acaa75205b31578cb22c4345e28dd2e4bf

