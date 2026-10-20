Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455096;
	b=YMHbqo6WwU1/WFriGKOOaAS2h9pK+NEoM0DpKN0N1PP/uLkoJk4LQ/JbkZk6FWv/KDZq
	 1ylxf615zVZH3rKhn8AcO9OapfZ0LvcsKP1Zh24ty0SXjB/8ALGtV1zF8slgrTzAMWDY0
	 o7XnBvoeG3rmw11Vmo6jMlMOgEN6UZVwZrb+o7pNo56pijoB4O34cmN3YIObSKPjOw15C
	 ISc97Zth0rzk0KsigaD2zBXeEai7G92xrpORoejhEzRLZ7+avR8bPvORO8v2iRd1yOjwA
	 96btc79UB4Z43Cv0t3lRtAV9+xBzneSZBKbe6LqssNcoUb4Zc4uP1/9VvJXUYu3xGHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BRYatsN+BpmV06YBSuIQI5NZJIUiO6acdaNMOTPHgI4=;
	b=syb+dG9rN61liKhBlOviAd9+X6n1Nq9K5IFSpLV7Jb9nzdTFMjEeTg3J2HHsul5qPqV7
	 Dq3fkKbMXeewrtgvKzFoB/EI4IfHRSV6x+S3ywUhFwYlFkWrq3rKpxpxcBhPbvawMP6KC
	 n04vmPlzSp5O9pyjH1Djlx6HIli0Yo2dVd/1tw8CWY04L7LdbIhH8rwJrznCw0j1uPfk0
	 TlUfU9zudrhvWn5uSllunv+VB1zz9DyEasuLCJ1lJY+DDlNXmE36p7lMT/0HNQUrFTEP0
	 8dWvlthQodsNQRD2oCtbC7Bbaey26NsEW4eQH9os8qnwbgxYxpfc7bBnltLK6rrJKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VjAm52Xg;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24065606A332
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24065606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VjAm52Xg
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35829219da8so283956eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455095; x=1793059895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRYatsN+BpmV06YBSuIQI5NZJIUiO6acdaNMOTPHgI4=;
        b=VjAm52XgUfp+qw4ARt9yv10dja0est+6KhF52gI5zVjXhpH6rs7LOF3ulLNQvv6to7
         Bq90Fp5ffA9EGZ5tOU4NSzEiFa1+GWTK4x2m93Meybow/v1TpAU/M6xLzYJs+SZnR1qG
         mUlpEIwvAKeQTjZBkGaJY5iYhfSc+FBy/T1SfoKFeeaP0HYS/JMFfSHdJypBrlXbjhS3
         SK1iYUVxRJ//XLkH2KNlhryFRJiM+BWog4Miqn+1oheOp2L/MMWCTUGbdaQypmTkK7gX
         Vy2fusguRaKDqT7WYsWWL1+aDgovCrhjUReh8vGRMCv9kb47U7AE205O0Uq8APY4Fmgy
         Jsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455095; x=1793059895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRYatsN+BpmV06YBSuIQI5NZJIUiO6acdaNMOTPHgI4=;
        b=S1wEdMFPR78LBRb5H9Bf9o1ioMPRZzuA8BSItGDGYkk3TYFBtquSpoVJQYSa9Q5wte
         qwu6VZEebDqlcg5k82zRyT+wzcADYnUx92r77FY5Qb5WRdEVwTK3X09lVlxeAzwJ4tt2
         kWPf2BlRXmjCG9dW2eo+7roMLtxGP8HIOkludWqyMo8FTF1FP7KDEWig12DERS1LjvRS
         vPZy5mS4E9Q6TAQLrutMtl2S9bHG5Gt3f2nZByIqVPBZ+b9x+/vFvfXkQh0kTCYSA2kT
         56i1UTe4F3Csm+YkBOEOSVPvrbUU7qq5BvQynX6Floun6CjBpzgGRhYtO+bsrKdLHLjr
         XHog==
X-Gm-Message-State: AFq9FYL9y/sSY0FpQ8gf9F0YUVTi7DtAOGHG6TREV7KOwTxft/slq2vU
	T/Nvqf/sldC400k7wHgx813fj25zl2uHzS6Ueb8YYByx7YqOQjYDbzbaFP4kBQ==
X-Gm-Gg: AYBFou1EbOagpJPHDXwOU90WJAmlVuTOmP9wLO5uqvvnJneFKZf9tbRyYpjutXXYAKd
	DZGXG75JNbLuk94XJBhS8Y4BTt3KSX/IlpT3+f9+Bwc7WHOAnlycFb1RPludjwxwo9fOOqWcu79
	dEisIm79o3klM55LH3lhqPDp2QpXzfVpI4gNKx3J1JC+R1xd66RXCMLlrCznw27RK4/XSEI30FQ
	+zsVYxSzO9+t3v4EDogM/nYzS+k6lfJON4N3WaJb6aHBL1uEVY2aa/VqakNkvGu3+W9r99anlNy
	fK8OmuyJekd/LhYMqsiuJY2h2fMoSa7TzDHhWEQOZ+NXbv/WqTyJncL1LXi4WA4+QgN6EC9wkj5
	GEd6w0mGAPn4yYtfn0oGVEJXskUZ4y5gbUHMBSw61/Dsxp7NCUVK+P+nz1YdVOkZBA9KfUmz8p3
	CHW84/XcC1lEkuF8GPGJGzsjwlQUoKvqOMpjp9vQcxBKCFOsy34tV50gV0BAlj5kAbGFOxwe+Vt
	IdXhqnEE31+B3WdSI6I1f9H+2x8OSig9DDU9AS63u7fLWSdf4GX6+Q=
X-Received: by 2002:a05:7022:140a:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-18dbb73bacemr671108c88.19.1792455095194;
        Mon, 19 Oct 2026 17:11:35 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:34 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 4/9] seccomp: report the result of a continued fork
Date: Mon, 19 Oct 2026 17:11:19 -0700
Message-ID: <20261020001124.974063-5-xiyou.wangcong@gmail.com>
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

Support SECCOMP_USER_NOTIF_FLAG_RESULT for fork, vfork, clone and
clone3. A successful fork is reported with the new task's pid in the
listener's pid namespace and its pidfs inode number, and with
SECCOMP_NOTIF_FLAG_THREAD if the new task is a thread.

With this a supervisor learns about every task created below it, even
one that is killed before it makes a single notified system call, and
it learns about forks that the kernel rejected after CONTINUE. Once it
knows the new task it can open a pidfd for it by inode number, without
privileges and without racing pid reuse, and the pidfd reports the
task's exit however it happens. Today the only complete alternative for
an unprivileged supervisor is ptrace fork events.

Reporting on the way back to user space is too late for a successful
fork: by then the child may be running, may have triggered
notifications, or may be gone with its pid reused. So kernel_clone()
reports the child just before wake_up_new_task(), holding a reference
to its struct pid. Records are delivered before notifications, so the
supervisor always hears of a new task before it can hear from it. The
forking task does not wait for the supervisor. A failed fork, wherever
it fails, is reported on exit like any other system call, so no other
fork path needs a hook. The new task does not inherit the pending
record.

The fork family is recognised through the __NR_seccomp_* aliases:
natively on every arch that defines SECCOMP_ARCH_NATIVE, and for compat
tasks where the arch provides the compat aliases, so far ia32. x32 is
refused, since its numbers carry __X32_SYSCALL_BIT and never match.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 include/linux/seccomp.h      |  4 +++
 include/uapi/linux/seccomp.h |  4 +++
 kernel/fork.c                |  3 +++
 kernel/seccomp.c             | 48 +++++++++++++++++++++++++++++++++++-
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index fcb3eb9825e5..91d6edaf5eb7 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -75,6 +75,7 @@ static inline int seccomp_mode(struct seccomp *s)
 #ifdef CONFIG_SECCOMP_FILTER
 extern void seccomp_filter_release(struct task_struct *tsk);
 extern void get_seccomp_filter(struct task_struct *tsk);
+extern void seccomp_report_fork(struct task_struct *child, pid_t nr);
 #else  /* CONFIG_SECCOMP_FILTER */
 static inline void seccomp_filter_release(struct task_struct *tsk)
 {
@@ -84,6 +85,9 @@ static inline void get_seccomp_filter(struct task_struct *tsk)
 {
 	return;
 }
+static inline void seccomp_report_fork(struct task_struct *child, pid_t nr)
+{
+}
 #endif /* CONFIG_SECCOMP_FILTER */
 
 #if defined(CONFIG_SECCOMP_FILTER) && defined(CONFIG_CHECKPOINT_RESTORE)
diff --git a/include/uapi/linux/seccomp.h b/include/uapi/linux/seccomp.h
index 799c93c8eed2..223577fea182 100644
--- a/include/uapi/linux/seccomp.h
+++ b/include/uapi/linux/seccomp.h
@@ -143,6 +143,10 @@ struct seccomp_notif {
  * SECCOMP_NOTIF_FLAG_RESULT set and the same id, by the time the task
  * returns to user space, and that notification is not answered. A system
  * call for which results are not supported is refused with EINVAL.
+ *
+ * So far fork, vfork, clone and clone3 are supported. For these a new task
+ * is reported before it runs, so the record reaches the listener before
+ * any notification the new task can trigger.
  */
 #define SECCOMP_USER_NOTIF_FLAG_RESULT (1UL << 1)
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 33760ece3bb3..637eec6a6cb3 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1815,6 +1815,8 @@ static void copy_seccomp(struct task_struct *p)
 	/* Ref-count the new filter user, and assign it. */
 	get_seccomp_filter(current);
 	p->seccomp = current->seccomp;
+	/* The result of this fork is reported by the parent only. */
+	p->seccomp.result = NULL;
 
 	/*
 	 * Explicitly enable no_new_privs here in case it got set
@@ -2809,6 +2811,7 @@ pid_t kernel_clone(struct kernel_clone_args *args)
 		task_unlock(p);
 	}
 
+	seccomp_report_fork(p, nr);
 	wake_up_new_task(p);
 
 	/* forking complete and child started to run, tell ptracer */
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 246205e85d58..336a7c28e1d6 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1371,6 +1371,30 @@ static int seccomp_do_user_notification(int this_syscall,
 	return -1;
 }
 
+/**
+ * seccomp_report_fork - report a new task to the listener that asked for it
+ * @child: the new task, not woken up yet
+ * @nr: its pid, the value the fork returns
+ *
+ * Exit is too late for a successful fork: the child would already run, and
+ * might be gone with its pid reused. Report it before it is woken instead.
+ * A failed fork is reported on exit, like any other system call.
+ */
+void seccomp_report_fork(struct task_struct *child, pid_t nr)
+{
+	struct seccomp_kresult *kres = current->seccomp.result;
+
+	if (likely(!kres))
+		return;
+	current->seccomp.result = NULL;
+
+	kres->val = nr;
+	kres->child = get_task_pid(child, PIDTYPE_PID);
+	if (!thread_group_leader(child))
+		kres->flags |= SECCOMP_NOTIF_FLAG_THREAD;
+	seccomp_report_result(kres);
+}
+
 static bool __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 {
 	u32 filter_ret, action;
@@ -1806,10 +1830,32 @@ static long seccomp_notify_recv(struct seccomp_filter *filter,
 	return ret;
 }
 
+static bool seccomp_is_fork_syscall(const struct seccomp_data *sd)
+{
+	/* The aliases use -1 for a syscall the arch lacks. */
+	if (sd->nr < 0)
+		return false;
+#if defined(SECCOMP_ARCH_COMPAT) && defined(__NR_seccomp_clone_32)
+	if (sd->arch == SECCOMP_ARCH_COMPAT)
+		return sd->nr == __NR_seccomp_clone_32 ||
+		       sd->nr == __NR_seccomp_clone3_32 ||
+		       sd->nr == __NR_seccomp_fork_32 ||
+		       sd->nr == __NR_seccomp_vfork_32;
+#endif
+#if defined(SECCOMP_ARCH_NATIVE) && defined(__NR_seccomp_clone)
+	if (sd->arch == SECCOMP_ARCH_NATIVE)
+		return sd->nr == __NR_seccomp_clone ||
+		       sd->nr == __NR_seccomp_clone3 ||
+		       sd->nr == __NR_seccomp_fork ||
+		       sd->nr == __NR_seccomp_vfork;
+#endif
+	return false;
+}
+
 /* Which system calls can report their result. */
 static bool seccomp_result_supported(const struct seccomp_data *sd)
 {
-	return false;
+	return seccomp_is_fork_syscall(sd);
 }
 
 static long seccomp_notify_send(struct seccomp_filter *filter,
-- 
2.43.0

