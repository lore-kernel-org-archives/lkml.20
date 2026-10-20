Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455099;
	b=W4hZMRVBxX2FZlUjIDEJrvjswFS246NgGtnvL9ZACkP1pb2885UWqIDteCj+2zGDamPu
	 YMvs06GTLNpNZnKLOTlOjhPEteMyyoXhgkNoAi5DHj2oGww40FOIzOR9p/ao1mJVtV2/A
	 ZBWquAPPa7T5ftWoZEsbl8FzEP3CojcOFH+K9HcU73PdD+sBo+fB3IjwkRb/8GCXAna4s
	 XY6s9XBbMaFBS0pv8XBRhOTK5FJojI/nRv7MGtuD/290/5tIcv9zVYgU9neqj0hSuybB/
	 6n4Ef5gEaabhzFMwh5ZIlJpjQGCZL7BdfbpbV6l8sq0VFDay5TQUTYpKrObaz5xunyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gibRNRfeLbIooGE1VWkka/id6BsYGjISbYJjiPwAPhQ=;
	b=UwMXEq9UT6wb8kFLQ6T7MVMxXBwNDen4NYzZsrC7+6ktf/uS9hQlnJ9KV4rqHgBV4Uc3
	 kfAGzE+ZSxM7zNcobUAhqWoCvg8e56v9BlF1HnXgqxo0PRpnQikwvQr7GZNeseglijbIx
	 +O4CcI4feYjPKPhUN+ClPM3TVPLm6AGU9Y/VDKV3mmP47UMwoKU+EruxqtCe2v4dBbe9b
	 +FYRIcKdjcf2WkRvo7z8QBJ29+BIbNEf5GlNsalX0w6Vxrir1xvJTsxTnfhdCbcKfJJjz
	 KHdGk6ly0V6N0Ugk9cEU2XWCQeOj7ThF/gP+XeZXLJSVMkYNoMROjqQ1zMYwJx8c9eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RFlbnHmV;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61171606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61171606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RFlbnHmV
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so7001824eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455098; x=1793059898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gibRNRfeLbIooGE1VWkka/id6BsYGjISbYJjiPwAPhQ=;
        b=RFlbnHmVUcqxkQMwqGY27VH3ZSvN9HLPwJc1Lq2IR3f1JGVSAab+ekpjwiZuTVRNnr
         xQEv86s/tNNNbMJV5Tw8rc7bUyBhAjm8UWMvJtCFGcUVnUMqUIhFYi3FlXNFpceqEqIe
         d4bWMYcm5nk4gjPnwKfbasGpQaKkgCChlgLbqy7ulk3IluFaKnDWDQtWWe2QsnjNwDdy
         zXzeTMOloTY1AD5d1P7+Z32qMd9VoP4gmg1IxC8lmXqErLMRd+nDUO/PMQaqa3tDDwU2
         ZpPXbDgfPGaSAPqJpk5rPLvhbjHfGT9B6VQrbn7J/JeRbKUKABiVLwrwjmsgcHphlQm9
         dEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455098; x=1793059898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gibRNRfeLbIooGE1VWkka/id6BsYGjISbYJjiPwAPhQ=;
        b=aJvDHjucUZAOxz7XX+w8Xx+nIEcMs8TrMYZYPBaGXefGI70nnvT0VTSLEF0KFwiKpO
         ZljdrXrG9PbbCL6Ef1JuxwQQQ8epHBTGEhMZ+ZRVYoDIV0FdHHLYGWbAPR9Xylx8p1d3
         LynnodMvhF3TqAr9GIfI6o/86SJQpifAiiIHG3oWm9rn0OA+ceqci/Hx8CZc8CT+Tuvw
         WIrhdvZA9KmQriL/k3ooT2TgnGcpt9533rnqPLjHZN3lYd64kdgYeieB4ixs8Pb3q1Oy
         abQX4Hw9EjlltQF+VdkGPL471tPnQTfQlShk/AjzvroJGZ35ngYX7DzbsVmcsHfXGlYd
         g5Fw==
X-Gm-Message-State: AFq9FYLcsukBn2FFno+2InqDajO+08Td2fQ5kDg6nGVAnQpSCteN1gu0
	HF1OpgB6NcRMtcuYwikzLoWEXLMPpaDjYMqpMPl/WIcrvUfQyon7LcAar58OgA==
X-Gm-Gg: AYBFou0FJIP6I4wb1iUPpvaDFbVOEuUxxImnVAqqqpJ1h09EV4yD9I0QCVMoZrnZOWi
	dsGvhLxO6xw9n4Q+aQIHSv5p4BqC5d++X7ovFckuGyijdZZscxLgGm9ho1Vyb8Tc3hjEqIV+4rJ
	rXi/guyRNQ2Ekzd4D4kxjr97JtknOrkHNU4LFzP1CjsLTJWbLULHJmrQPtYjMnWBL1PLjH8PcsQ
	HKUm1VHQGYU736yusqboVY4Tu1f9IKxkdbwW1Q4tYFjK4y1zUJ4Ga3CnOXyNNojNMbFLls2UbKi
	vJ71XIAxB/qcoDAFaUk/FEjapipxuRLYmMCE6mbu6gy4ZpvjB83YhEBFgJAFceleQL5Ue8s5FwD
	WigJsXUTAaqSLldGeVTqNm+r7gAfTtw9jeglBH6cSQyCxJB8RRf4kiFYqNh9bP8zdXquGGoSXrU
	Fhiyi0/+figkwmvIMDtNWQ01lCUDYL6Q274vMWazFQeRxtxAVlvM+wy0I99aE9U4jP+e033IyCM
	G9/XMUKBmhJAYA8oEK8yqzOiA806BpqpmS+tfOd3AZ918U0/kcQt+GqPvHe983hQQ==
X-Received: by 2002:a05:7022:4185:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-189d6bf8203mr9833670c88.16.1792455098258;
        Mon, 19 Oct 2026 17:11:38 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:37 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 6/9] seccomp: add SECCOMP_USER_NOTIF_FLAG_HOLD
Date: Mon, 19 Oct 2026 17:11:21 -0700
Message-ID: <20261020001124.974063-7-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
References: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
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

From: Cong Wang <cwang@multikernel.io>

A result record is one-way: the task does not wait for the supervisor to
read it. That is enough for accounting, but not when the supervisor must
act on a result before the task builds on it. For a fork, the new task
may already be running by the time the supervisor reads the record, and
where tasks share memory one could rewrite another's arguments without
making a system call; today such a supervisor needs ptrace fork events.

With SECCOMP_USER_NOTIF_FLAG_HOLD added to CONTINUE | RESULT, the result
is reported as an ordinary notification instead, with
SECCOMP_NOTIF_FLAG_RESULT | SECCOMP_NOTIF_FLAG_HELD, and the task waits
at the point where the record would be queued until the supervisor
answers it with CONTINUE. That point is the same for every system call,
the task work on the way back to user space, so HOLD needs nothing of
its own and is supported wherever RESULT is. For a successful fork it
is just before wake_up_new_task(), so the new task has provably not run
when the supervisor learns of it either. For vfork the parent then
wakes the child and waits for it as usual.

The held notification reuses the user notification machinery: it has
the id of the call's notification, ID_VALID works on it, and a dying
listener releases it. It accepts only a plain CONTINUE and no ADDFD,
since the call has completed and there is nothing to decide.

The task sleeps killable, because the call has completed and cannot be
restarted, and freezable, because the supervisor may be frozen before it
answers. A held fork child is in TASK_NEW and cannot be frozen, so a
held fork still holds off the freezer until it is answered. If the task
is killed before the supervisor received the held notification, the
result is queued as a one-way record instead, so the supervisor still
learns of it. A result reported because the task is exiting is never
held.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 include/uapi/linux/seccomp.h | 13 ++++++
 kernel/seccomp.c             | 86 +++++++++++++++++++++++++++++++++---
 2 files changed, 92 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/seccomp.h b/include/uapi/linux/seccomp.h
index 223577fea182..aa3902be9e72 100644
--- a/include/uapi/linux/seccomp.h
+++ b/include/uapi/linux/seccomp.h
@@ -96,6 +96,7 @@ struct seccomp_notif_result {
 /* Valid flags for struct seccomp_notif */
 #define SECCOMP_NOTIF_FLAG_RESULT	(1UL << 0) /* @result is valid, not @data */
 #define SECCOMP_NOTIF_FLAG_THREAD	(1UL << 1) /* the new task is a thread */
+#define SECCOMP_NOTIF_FLAG_HELD		(1UL << 2) /* answer to release the task */
 
 struct seccomp_notif {
 	__u64 id;
@@ -150,6 +151,18 @@ struct seccomp_notif {
  */
 #define SECCOMP_USER_NOTIF_FLAG_RESULT (1UL << 1)
 
+/*
+ * SECCOMP_USER_NOTIF_FLAG_HOLD, together with SECCOMP_USER_NOTIF_FLAG_RESULT,
+ * also keeps the task from returning to user space until the listener has
+ * seen the result. The result is then reported with SECCOMP_NOTIF_FLAG_HELD
+ * set, and the task waits until that notification is answered with
+ * SECCOMP_USER_NOTIF_FLAG_CONTINUE (and nothing else). For the fork family,
+ * a new task does not run until then either. If the task is killed before
+ * the listener received the notification, it is reported without
+ * SECCOMP_NOTIF_FLAG_HELD instead. HOLD is supported wherever RESULT is.
+ */
+#define SECCOMP_USER_NOTIF_FLAG_HOLD (1UL << 2)
+
 struct seccomp_notif_resp {
 	__u64 id;
 	__s64 val;
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 793efcf0e626..1f33449ce571 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -102,6 +102,9 @@ struct seccomp_knotif {
 
 	/* The result record the reply asked for, handed over with the reply */
 	struct seccomp_kresult *kres;
+
+	/* The result this notification reports, holding the task until answered */
+	struct seccomp_kresult *held;
 };
 
 /**
@@ -150,6 +153,7 @@ struct seccomp_kaddfd {
  * @arch: The system call convention.
  * @val: The system call's return value.
  * @flags: SECCOMP_NOTIF_FLAG_* flags to report.
+ * @hold: Whether the listener asked to hold the task until it answers.
  * @list: list_head for chaining onto notification->results.
  */
 struct seccomp_kresult {
@@ -161,6 +165,7 @@ struct seccomp_kresult {
 	u32 arch;
 	long val;
 	u32 flags;
+	bool hold;
 	struct list_head list;
 };
 
@@ -1232,6 +1237,9 @@ static void seccomp_handle_addfd(struct seccomp_kaddfd *addfd, struct seccomp_kn
 static bool should_sleep_killable(struct seccomp_filter *match,
 				  struct seccomp_knotif *n)
 {
+	/* A held call has completed and cannot be restarted. */
+	if (n->held)
+		return true;
 	return match->wait_killable_recv && n->state >= SECCOMP_NOTIFY_SENT;
 }
 
@@ -1265,7 +1273,11 @@ static int seccomp_notify_wait(struct seccomp_filter *match,
 		bool wait_killable = should_sleep_killable(match, n);
 
 		mutex_unlock(&match->notify_lock);
-		if (wait_killable)
+		/* The supervisor may be frozen before it can answer. */
+		if (n->held)
+			err = wait_for_completion_state(&n->ready,
+							TASK_KILLABLE | TASK_FREEZABLE);
+		else if (wait_killable)
 			err = wait_for_completion_killable(&n->ready);
 		else
 			err = wait_for_completion_interruptible(&n->ready);
@@ -1320,6 +1332,40 @@ static void seccomp_notify_dequeue(struct seccomp_filter *match,
 		list_del(&n->list);
 }
 
+static void seccomp_hold_result(struct seccomp_filter *filter,
+				struct seccomp_kresult *kres)
+{
+	struct seccomp_knotif n = {};
+
+	n.task = current;
+	n.id = kres->id;
+	n.held = kres;
+	seccomp_notify_queue(filter, &n);
+
+	if (seccomp_notify_wait(filter, &n) &&
+	    n.state == SECCOMP_NOTIFY_INIT) {
+		/* Killed unseen: the listener must still learn the result. */
+		seccomp_queue_result(filter, kres);
+		kres = NULL;
+	}
+
+	seccomp_notify_dequeue(filter, &n);
+	if (kres)
+		seccomp_kresult_free(kres);
+}
+
+static void seccomp_deliver_result(struct seccomp_kresult *kres)
+{
+	struct seccomp_filter *filter = kres->filter;
+
+	mutex_lock(&filter->notify_lock);
+	if (kres->hold && filter->notif)
+		seccomp_hold_result(filter, kres);
+	else
+		seccomp_queue_result(filter, kres);
+	mutex_unlock(&filter->notify_lock);
+}
+
 /* Report the system call's outcome on the way back to user space. */
 static void seccomp_result_work(struct callback_head *work)
 {
@@ -1333,7 +1379,7 @@ static void seccomp_result_work(struct callback_head *work)
 
 	err = syscall_get_error(current, regs);
 	kres->val = err ? err : syscall_get_return_value(current, regs);
-	seccomp_report_result(kres);
+	seccomp_deliver_result(kres);
 }
 
 static void seccomp_result_pending(struct seccomp_kresult *kres)
@@ -1423,7 +1469,7 @@ void seccomp_report_fork(struct task_struct *child, pid_t nr)
 	kres->child = get_task_pid(child, PIDTYPE_PID);
 	if (!thread_group_leader(child))
 		kres->flags |= SECCOMP_NOTIF_FLAG_THREAD;
-	seccomp_report_result(kres);
+	seccomp_deliver_result(kres);
 }
 
 static bool __seccomp_filter(int this_syscall, const bool recheck_after_trace)
@@ -1823,9 +1869,18 @@ static long seccomp_notify_recv(struct seccomp_filter *filter,
 		goto out;
 	}
 
-	unotif.id = knotif->id;
-	unotif.pid = task_pid_vnr(knotif->task);
-	unotif.data = *(knotif->data);
+	if (knotif->held) {
+		ret = seccomp_fill_result(&unotif, knotif->held);
+		if (ret < 0) {
+			atomic_inc(&filter->notif->requests);
+			goto out;
+		}
+		unotif.flags |= SECCOMP_NOTIF_FLAG_HELD;
+	} else {
+		unotif.id = knotif->id;
+		unotif.pid = task_pid_vnr(knotif->task);
+		unotif.data = *(knotif->data);
+	}
 
 	knotif->state = SECCOMP_NOTIFY_SENT;
 	wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
@@ -1901,7 +1956,12 @@ static long seccomp_notify_send(struct seccomp_filter *filter,
 		return -EFAULT;
 
 	if (resp.flags & ~(SECCOMP_USER_NOTIF_FLAG_CONTINUE |
-			   SECCOMP_USER_NOTIF_FLAG_RESULT))
+			   SECCOMP_USER_NOTIF_FLAG_RESULT |
+			   SECCOMP_USER_NOTIF_FLAG_HOLD))
+		return -EINVAL;
+
+	if ((resp.flags & SECCOMP_USER_NOTIF_FLAG_HOLD) &&
+	    !(resp.flags & SECCOMP_USER_NOTIF_FLAG_RESULT))
 		return -EINVAL;
 
 	if ((resp.flags & SECCOMP_USER_NOTIF_FLAG_CONTINUE) &&
@@ -1936,6 +1996,11 @@ static long seccomp_notify_send(struct seccomp_filter *filter,
 		goto out;
 	}
 
+	if (knotif->held && resp.flags != SECCOMP_USER_NOTIF_FLAG_CONTINUE) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (kres) {
 		if (!seccomp_result_supported(knotif->data)) {
 			ret = -EINVAL;
@@ -1946,6 +2011,7 @@ static long seccomp_notify_send(struct seccomp_filter *filter,
 		kres->task = get_task_pid(knotif->task, PIDTYPE_PID);
 		kres->nr = knotif->data->nr;
 		kres->arch = knotif->data->arch;
+		kres->hold = resp.flags & SECCOMP_USER_NOTIF_FLAG_HOLD;
 		knotif->kres = kres;
 		kres = NULL;
 	}
@@ -2064,6 +2130,12 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 		goto out_unlock;
 	}
 
+	/* A held call has completed; there is nothing to add to. */
+	if (knotif->held) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND) {
 		/*
 		 * Disallow queuing an atomic addfd + send reply while there are
-- 
2.43.0

