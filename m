Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455095;
	b=g/+vf4gM5bEpqQFuuGiEFbfTbglVGF2/63yyv5NSeDU9qILj1lpqis06iIwjNoxyFYXD
	 kIAmsGdIRsERe0yaoosLcOxVmuQsrk0lOnORMRJDMx+a+QBGvhvYbrEwAl5VUX3Qj2r0T
	 z9hvnC538PX4MTNC8dNCETajgQFwH/CBf/FVkLweuCpfJO9EgEjTa9hZWSIg5s2eeMF7O
	 vlboBXi8EfC4mbRE0FZqiQT1/x5EMPznjAPJPmSK1f3wxNoBdRi+gpDoTAdZCQDs/z3nU
	 4K6jPKI5kQu9aKILz8+UsX2i3W4/qIyBKGI+sL3e6hFJOO2xDnE53UgAA4+/qvKrQgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=POiWnRNwlJ0iefLIqc4+AJ/Zx6t3h/WiB88H0Pwfcp8=;
	b=n55CkozDcVd0dG4PHBgOAWYKn6MTdZombUUN+Z1Y/PzELW9M/Oh35M/q3do+DgsFdR1Z
	 JotoFSfLA9GaSO+XhRUhn8OAYxE8MVvdONq8jRfErISqi0oe8VGdedmjcDGZszE/NOnIJ
	 2QCGJLCpwa7XGJV7NaZ8BgwPMmC2g+Zv5IwrmEEqRvKuuNu0FuStNOGZO4YJ8TeaRtilQ
	 8a2x5JSh6KVSU4O7Ja/4bm47CcR4QC+dwIiax5J1z48xDkk7O/CAMH2o/8S4iT2hjV3N8
	 s4ns0GW00Hz7NnV4fhQRzvGk/yJpC9snHqXrpUwUf7G2Z69KzH8+lVWWSyb5uYEPzFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JjZVeWmw;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DCE606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DCE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JjZVeWmw
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f1f76ea84so4878280eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455094; x=1793059894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POiWnRNwlJ0iefLIqc4+AJ/Zx6t3h/WiB88H0Pwfcp8=;
        b=JjZVeWmwtj49xLx1BMVJD8CdBl/wwTkj9jC3S8ZhcK0XzBwaLjEa9DejPs7D5mDfEz
         WNaaEmHi7Nh75vGVrHiy/vzVaq1DQnJY230e3K0cuhn6xkRduUe9WSM/XYUuihtNjbyK
         MllPhMBp7ytqRKWaTpgvCEadEMSiYP4nciEJVwJnPWC4+j4XjWrLBRa0DFnskp1Ix7hr
         Rnx3zmRvswBjPFAnoTATbDz/pkW3TOJHbNOKLV2dalAebweWbTo1x5ggT9OIxhBePFkb
         MkPnb2PJiNuMELuZ/feS8y4uF38AAhEschhfGmpyHQ/CMuApUw21dc5CmqRfAl4pqWMq
         MS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455094; x=1793059894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=POiWnRNwlJ0iefLIqc4+AJ/Zx6t3h/WiB88H0Pwfcp8=;
        b=gmVaQk0dy8GoqHtZ1uRKIptH91U+b1Zxo9uA1YR45dvC68UCfs1KgMMdX7rwAazK9Z
         lHGvoPWXOWnRGOzkMkMGOs9sSwHT/damdyOfARTOXrGQIcAzVx8ueF2QP+vNsRHjeDSv
         dK6fr8SYcsjeQInFVepQtscYsMrjUY2M2d4NHzINZRP81ScFxO6M2pARj056yXXm6fZQ
         qdjvyqNjFsrbhcweZ/hPd6CIOC3afH6mRMrufBL4AI8dIRhjM9Z3Phe4EXj5qSSfM5Tf
         FgTeeIf3QJEZ1AtDi2lB7b4hiG1JpOZD3MP2SSkHSNdf95j7A6ZS27+LYy44gHhP97Nw
         GIuA==
X-Gm-Message-State: AFq9FYKuu6CulWDXeVjHCaPjgqcd9HQyhAFB2RjXakZuCfbXx3qEAZPq
	lc3vhfnBV1wEPlotQQ1EEe7FoNhNbUa8nmsMAOWKKef2dgJUiqLdRIrZ06ymBw==
X-Gm-Gg: AYBFou01Hkiuum2hU9agigmPjrBJE9n6eYBgU1HS/OU0OaTN8foeyLyLoFqSwHQCM50
	F7BcjdOz8ZHXgMtQ0g6HSGdMC0h8fgBikeNzVOlcctyS4Cg9dcsDLqOUHttTaHEOVdigDFA2NLl
	zw6xIrkdOvVRDE6T5FusdcjFmigxM4wZwluzU7+zfrmeHp9gULnKzo2evLl1odY8wdx0WXZ1/bM
	GYJPfX2T31ciBcV53L7lLp6yR/jixtxDNJj8TJmHZQJ+aSsM+G7A0PqsI09ZKbS+tZjPssgq98E
	EsoxdBva01/k37nJeGn8XzpNG2Sr1GB00s2PbGQqaQ1aypv1hJhG3mXH6wUA1ohs0emLyNrvXW/
	dr1gAq2T2tprmziZz7Qf8iAzNdPGmJrEwx+dWGQGmq3pDEJVH4XqRiLnZ4mEXyd0I1IX/ca2Hwo
	0fSNWCVKFA3vctP7P/LLUCvggxLDc3ghCHcqzc9cUxZHnankH1JVr+0LTEKNXjPFu01fx2GAqNL
	GCSSdubED8kon8osdlnikvx4N4SSSxXCjOv317FxADFa/6gCDT0h7o=
X-Received: by 2002:a05:7022:1201:b0:143:271a:308 with SMTP id a92af1059eb24-18515e40940mr11566652c88.46.1792455093958;
        Mon, 19 Oct 2026 17:11:33 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:33 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 3/9] seccomp: report the result of a continued system call
Date: Mon, 19 Oct 2026 17:11:18 -0700
Message-ID: <20261020001124.974063-4-xiyou.wangcong@gmail.com>
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

A supervisor that continues a system call with
SECCOMP_USER_NOTIF_FLAG_CONTINUE never learns how the call turned out.
Add SECCOMP_USER_NOTIF_FLAG_RESULT: given together with CONTINUE, it
asks the kernel to queue a result record for the call on the listener,
carrying the call's return value.

The record is reported from task work, run as the task returns to user
space. That is one place for every system call: nothing has to be added
to the system calls themselves, and it works on every architecture.
The value is read from the task's registers after any ptrace syscall
exit stop, so it is what the task sees. The work is queued with
TWA_RESUME, so that the system call does not see a pending signal;
get_signal() still runs task work before it delivers a signal or
restarts the call.

Every reply that asked for a record gets exactly one. If a signal
interrupts the notification after the reply was sent, the record
reports the error the call fails with. If the task exits before
returning to user space, which happens after seccomp has released its
filters, the record is reported at release with -ESRCH. If the listener
is gone by then, the record is dropped.

SEND allocates the record, so that a failed allocation fails the ioctl,
which can be retried, and the system call never allocates.

The interface does not depend on the system call, but which calls are
supported is decided per call, and so far none is. Unsupported calls
are refused with EINVAL, which is also what older kernels return, so
the flag is easy to probe and can be extended without a new flag. The
next patch adds the fork family.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 include/linux/seccomp_types.h |   6 ++
 include/uapi/linux/seccomp.h  |  10 +++
 kernel/seccomp.c              | 133 +++++++++++++++++++++++++++++++---
 3 files changed, 140 insertions(+), 9 deletions(-)

diff --git a/include/linux/seccomp_types.h b/include/linux/seccomp_types.h
index cf0a0355024f..158bac728344 100644
--- a/include/linux/seccomp_types.h
+++ b/include/linux/seccomp_types.h
@@ -7,6 +7,7 @@
 #ifdef CONFIG_SECCOMP
 
 struct seccomp_filter;
+struct seccomp_kresult;
 /**
  * struct seccomp - the state of a seccomp'ed process
  *
@@ -18,11 +19,16 @@ struct seccomp_filter;
  *
  *          @filter must only be accessed from the context of current as there
  *          is no read locking.
+ * @result: a result record requested by a listener for the system call in
+ *          progress, owned by current until it is reported.
+ * @result_work: reports @result when current returns to user space.
  */
 struct seccomp {
 	int mode;
 	atomic_t filter_count;
 	struct seccomp_filter *filter;
+	struct seccomp_kresult *result;
+	struct callback_head result_work;
 };
 
 #else
diff --git a/include/uapi/linux/seccomp.h b/include/uapi/linux/seccomp.h
index 67f7b2f45ab6..799c93c8eed2 100644
--- a/include/uapi/linux/seccomp.h
+++ b/include/uapi/linux/seccomp.h
@@ -136,6 +136,16 @@ struct seccomp_notif {
  */
 #define SECCOMP_USER_NOTIF_FLAG_CONTINUE (1UL << 0)
 
+/*
+ * SECCOMP_USER_NOTIF_FLAG_RESULT, together with
+ * SECCOMP_USER_NOTIF_FLAG_CONTINUE, asks for the outcome of the continued
+ * system call. It is reported once, as a notification with
+ * SECCOMP_NOTIF_FLAG_RESULT set and the same id, by the time the task
+ * returns to user space, and that notification is not answered. A system
+ * call for which results are not supported is refused with EINVAL.
+ */
+#define SECCOMP_USER_NOTIF_FLAG_RESULT (1UL << 1)
+
 struct seccomp_notif_resp {
 	__u64 id;
 	__s64 val;
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 5641ac8b2f2e..246205e85d58 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -28,6 +28,7 @@
 #include <linux/slab.h>
 #include <linux/syscalls.h>
 #include <linux/sysctl.h>
+#include <linux/task_work.h>
 
 #include <asm/syscall.h>
 
@@ -98,6 +99,9 @@ struct seccomp_knotif {
 
 	/* outstanding addfd requests */
 	struct list_head addfd;
+
+	/* The result record the reply asked for, handed over with the reply */
+	struct seccomp_kresult *kres;
 };
 
 /**
@@ -137,6 +141,8 @@ struct seccomp_kaddfd {
  * struct seccomp_kresult - a one-way record of a continued system call's
  *			    outcome
  *
+ * @filter: The filter whose listener asked for this record. Only used while
+ *	    the record is pending in the task, which keeps its filters alive.
  * @id: The id of the notification whose reply asked for this record.
  * @task: The task that made the system call.
  * @child: The new task, for a successful call in the fork family.
@@ -147,6 +153,7 @@ struct seccomp_kaddfd {
  * @list: list_head for chaining onto notification->results.
  */
 struct seccomp_kresult {
+	struct seccomp_filter *filter;
 	u64 id;
 	struct pid *task;
 	struct pid *child;
@@ -549,6 +556,36 @@ static inline pid_t seccomp_can_sync_threads(void)
 	return 0;
 }
 
+static void seccomp_kresult_free(struct seccomp_kresult *kres)
+{
+	put_pid(kres->task);
+	put_pid(kres->child);
+	kfree(kres);
+}
+
+static void seccomp_queue_result(struct seccomp_filter *filter,
+				 struct seccomp_kresult *kres)
+{
+	lockdep_assert_held(&filter->notify_lock);
+
+	if (!filter->notif) {
+		seccomp_kresult_free(kres);
+		return;
+	}
+	list_add_tail(&kres->list, &filter->notif->results);
+	atomic_inc(&filter->notif->requests);
+	wake_up_poll(&filter->wqh, EPOLLIN | EPOLLRDNORM);
+}
+
+static void seccomp_report_result(struct seccomp_kresult *kres)
+{
+	struct seccomp_filter *filter = kres->filter;
+
+	mutex_lock(&filter->notify_lock);
+	seccomp_queue_result(filter, kres);
+	mutex_unlock(&filter->notify_lock);
+}
+
 static inline void seccomp_filter_free(struct seccomp_filter *filter)
 {
 	if (filter) {
@@ -602,6 +639,15 @@ void seccomp_filter_release(struct task_struct *tsk)
 	if (WARN_ON((tsk->flags & PF_EXITING) == 0))
 		return;
 
+	/* The filter is gone by the time task work runs; report now. */
+	if (tsk->seccomp.result) {
+		struct seccomp_kresult *kres = tsk->seccomp.result;
+
+		tsk->seccomp.result = NULL;
+		kres->val = -ESRCH;
+		seccomp_report_result(kres);
+	}
+
 	if (READ_ONCE(tsk->seccomp.filter) == NULL)
 		return;
 
@@ -1189,6 +1235,39 @@ static bool should_sleep_killable(struct seccomp_filter *match,
 	return match->wait_killable_recv && n->state >= SECCOMP_NOTIFY_SENT;
 }
 
+/* Report the system call's outcome on the way back to user space. */
+static void seccomp_result_work(struct callback_head *work)
+{
+	struct seccomp_kresult *kres = current->seccomp.result;
+	struct pt_regs *regs = current_pt_regs();
+	long err;
+
+	if (!kres)
+		return;
+	current->seccomp.result = NULL;
+
+	err = syscall_get_error(current, regs);
+	kres->val = err ? err : syscall_get_return_value(current, regs);
+	seccomp_report_result(kres);
+}
+
+static void seccomp_result_pending(struct seccomp_kresult *kres)
+{
+	current->seccomp.result = kres;
+	init_task_work(&current->seccomp.result_work, seccomp_result_work);
+	/*
+	 * TWA_RESUME rather than TWA_SIGNAL: the latter would make the system
+	 * call see a pending signal. The work still runs before a signal is
+	 * delivered or the call restarted, as get_signal() runs task work
+	 * first.
+	 */
+	if (task_work_add(current, &current->seccomp.result_work, TWA_RESUME)) {
+		current->seccomp.result = NULL;
+		kres->val = -ESRCH;
+		seccomp_report_result(kres);
+	}
+}
+
 static int seccomp_do_user_notification(int this_syscall,
 					struct seccomp_filter *match,
 					const struct seccomp_data *sd)
@@ -1276,6 +1355,13 @@ static int seccomp_do_user_notification(int this_syscall,
 out:
 	mutex_unlock(&match->notify_lock);
 
+	/*
+	 * Even if a signal beat the reply, the record is due: it then reports
+	 * the call as failed with the error set below.
+	 */
+	if (n.kres)
+		seccomp_result_pending(n.kres);
+
 	/* Userspace requests to continue the syscall. */
 	if (flags & SECCOMP_USER_NOTIF_FLAG_CONTINUE)
 		return 0;
@@ -1474,13 +1560,6 @@ static long seccomp_set_mode_strict(void)
 }
 
 #ifdef CONFIG_SECCOMP_FILTER
-static void seccomp_kresult_free(struct seccomp_kresult *kres)
-{
-	put_pid(kres->task);
-	put_pid(kres->child);
-	kfree(kres);
-}
-
 static void seccomp_notify_free(struct seccomp_filter *filter)
 {
 	struct seccomp_kresult *kres, *tmp;
@@ -1727,26 +1806,46 @@ static long seccomp_notify_recv(struct seccomp_filter *filter,
 	return ret;
 }
 
+/* Which system calls can report their result. */
+static bool seccomp_result_supported(const struct seccomp_data *sd)
+{
+	return false;
+}
+
 static long seccomp_notify_send(struct seccomp_filter *filter,
 				void __user *buf)
 {
 	struct seccomp_notif_resp resp = {};
+	struct seccomp_kresult *kres = NULL;
 	struct seccomp_knotif *knotif;
 	long ret;
 
 	if (copy_from_user(&resp, buf, sizeof(resp)))
 		return -EFAULT;
 
-	if (resp.flags & ~SECCOMP_USER_NOTIF_FLAG_CONTINUE)
+	if (resp.flags & ~(SECCOMP_USER_NOTIF_FLAG_CONTINUE |
+			   SECCOMP_USER_NOTIF_FLAG_RESULT))
 		return -EINVAL;
 
 	if ((resp.flags & SECCOMP_USER_NOTIF_FLAG_CONTINUE) &&
 	    (resp.error || resp.val))
 		return -EINVAL;
 
+	if (resp.flags & SECCOMP_USER_NOTIF_FLAG_RESULT) {
+		if (!(resp.flags & SECCOMP_USER_NOTIF_FLAG_CONTINUE))
+			return -EINVAL;
+		/*
+		 * Allocate here, where failing is harmless, so that the
+		 * system call never has to.
+		 */
+		kres = kzalloc_obj(*kres, GFP_KERNEL_ACCOUNT);
+		if (!kres)
+			return -ENOMEM;
+	}
+
 	ret = mutex_lock_interruptible(&filter->notify_lock);
 	if (ret < 0)
-		return ret;
+		goto out_free;
 
 	knotif = find_notification(filter, resp.id);
 	if (!knotif) {
@@ -1760,6 +1859,20 @@ static long seccomp_notify_send(struct seccomp_filter *filter,
 		goto out;
 	}
 
+	if (kres) {
+		if (!seccomp_result_supported(knotif->data)) {
+			ret = -EINVAL;
+			goto out;
+		}
+		kres->filter = filter;
+		kres->id = knotif->id;
+		kres->task = get_task_pid(knotif->task, PIDTYPE_PID);
+		kres->nr = knotif->data->nr;
+		kres->arch = knotif->data->arch;
+		knotif->kres = kres;
+		kres = NULL;
+	}
+
 	ret = 0;
 	knotif->state = SECCOMP_NOTIFY_REPLIED;
 	knotif->error = resp.error;
@@ -1771,6 +1884,8 @@ static long seccomp_notify_send(struct seccomp_filter *filter,
 		complete(&knotif->ready);
 out:
 	mutex_unlock(&filter->notify_lock);
+out_free:
+	kfree(kres);
 	return ret;
 }
 
-- 
2.43.0

