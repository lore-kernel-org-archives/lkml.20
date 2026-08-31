Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B51370AC8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187703; cv=none; b=NWS/6KuQlCYnJVZfyBVpl47/OFuk7cnVNlHfK0+wa8fbvsQNqlAJkfh+3ChOq7qxl2hGMP9nJk7BgMyK5vP+KQnjGxrenFLgiz1DmgGNRq1Toau1Cd5qiv9VkZTC+jx3u2Jz+X6PYnHwNaMUZWYgRe1hGrW+FgnB72dVXd+HGc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187703; c=relaxed/simple;
	bh=79tKLagZL4/zQ9MvWhNJPMy5XQ0bzE9Y6V/g8GFOjbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tMIIesyf27GF2ewUz0Kt8ePQcewP3sb508+neNTDzgWBMJlioOBNPPfrR5cWSSIsZJoZ4ntWji+MPys+bOMEFRGmjVFqBQ3GaURJv2EPEJlaVtEKflM9UQeOrErzvXLcBKkfuM120xS7aIw2LTWFsuHL9aZ7TfYqNKDY5Bj2UvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt0kFf0L; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt0kFf0L"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so2986544a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187701; x=1788792501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLBFaOw5rBPEXGIynLprIaDxxGVdejZOMUhGd6mXZSU=;
        b=Nt0kFf0LxyxxFA/qBM71TgTafYDMZRFEC0m6uSW6yVxWpeoEK7Yj0Dk7osnP5Xw8sI
         FBEThmGSx9cUIqs+IFB+ILTSpR2v+203Y96LlOPTxEnOc7dm8y0qAqJ5PsSXvZHrDlT7
         r9oOqgQL+KM8pA3VsyRLPdSQvPmgKPdqz4W/+MUJLWWfmmNxMfFkcEJS74eE2Twv9OcK
         /jnEzzu9yuTs15jN0KuCVemx11f/sE8tDgpvQilbPFEQ6mACq5nalMUwY5OLlThnCllY
         Tu1DOaVOfA17iqcLIsZoQvlCov2OFc94kuzHEnxfFz7EB96o6m7rhD91L/1AmmYHhZvi
         IWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187701; x=1788792501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLBFaOw5rBPEXGIynLprIaDxxGVdejZOMUhGd6mXZSU=;
        b=jLu+9hcv29zhl9BMVuaUIZNTYbcTPHju5VvhMg+IWGVxltouey1duh7+JU+5sf+TVh
         Him9qRI4gfDs6eTF+BWdR3hDAVeH7K1U6aLVCkqyu8PGFC7zf1jAqtevvRxk+s5+3SlG
         XwVhnRu/RtzUPwHUgM+O1Z1t6Ddv6+1vXIvkBenE0GVRSMEn6iGPfwpdLcG71DFBhh80
         Js52531+9bVubleQHft3yKVrKdrG5OONj2On3wh+UXVavWPOaUjw+l2YbmHo3qSPMgGR
         hAKClMTQiEd3v1+tQqdWiErVVk6/rRcFQD53X+ey4Smk6fGf6kSXtj4vIDLsYH/4sFkR
         gyfQ==
X-Forwarded-Encrypted: i=1; AKwUvBx85qoB+e8xaF61T3ldJRGIOEfxiiKgB760Keyvok5SPuaeTfeftV+Pt2bUY/DSps8Mtchetp89HsR0qaA=@vger.kernel.org
X-Gm-Message-State: AFuF++mapq68vzBQsGAScpcKGBLTe38jI4mpGdjO2qfnC1CQQSo2+p0M
	5w0lFV9hP7zRPG3N1aKTxxO38noO38zuBJQ0e1o2m48gFG4TziaDzzx0
X-Gm-Gg: AYBFou3iTAMBxGG0U4o3Av8uc2GNrdgIJIK89uJPM4p+WBnbfCuVlwev8pugCw5h2q7
	TIUXRCgoy4ZZWE6oeXDlcB0SHyhwVbYO4u8YOqAsnyCEBpBiqwv+cSl9ofLqVt0HzRCURFy/Cur
	YU3uVPXq6YyLU1Xc9aWe4DerV4a6DFz53g6xAzsHBslKEHsFtj7NldpMpXB/vtmX/5/XPkoDJ0j
	upsjvsWHs7s5a1j5f6gG2YLYHe7sK+7kbA2gKVpKsmMfCTRfY95dvXVwEdySX5Lxrb+a7ocjqYr
	U927Ov6BGSm1zbd2gEcneB1br6gczanCWev2PDLyJmg6Lj6RIbkqWR1KL7ZrgQANNhSBvZNuM7a
	30x1lyJdqj2HjQ8RbKKW1zqVO8ghFXsY+x+FXbIN7MWqqhTmapJ/JsWI2JEsatG8ahVDhfuZnMg
	6eD1YkxRo7Umrb2AbFPUP0qAsJrqwI1Giu6wmZ4O/K8QSZSY/k5FkQLVTMpA/aVYZyrdE3qIQ=
X-Received: by 2002:a17:90b:4b05:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-396d0fe2140mr40318589a91.10.1788187701005;
        Mon, 31 Aug 2026 07:48:21 -0700 (PDT)
Received: from thefless.. ([2405:4802:f7aa:a4d0:1ef4:f6f7:1076:de13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d29af238sm5319976a91.1.2026.08.31.07.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:48:20 -0700 (PDT)
From: Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	shuah@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
Subject: [PATCH] signalfd: wake shared signalfd waiters after mask updates
Date: Mon, 31 Aug 2026 21:44:52 +0700
Message-ID: <20260831144452.116915-1-khoavna.tin.2225@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

signalfd stores its mask in the shared signalfd_ctx attached to the
open file description, but do_signalfd4() only wakes the caller's
signalfd_wqh after updating that shared mask.

If a signalfd file description is shared across fork(), another task
can block in read() or poll() with an old mask while a signal that does
not match that old mask is already pending. When the parent later
reconfigures the shared signalfd to a new mask that does match the
pending signal, the child can remain asleep indefinitely because the
reconfiguration never wakes the child's waitqueue.

At the same time, ctx->sigmask is shared file state, but it is read and
written under per-task sighand locks, which does not serialize
cross-process access to the shared file description.

Restore file-scoped synchronization for file-scoped state by adding a
lock and waitqueue to signalfd_ctx. Make readers and pollers wait on the
file-local waitqueue for mask updates while continuing to use the local
signalfd_wqh for signal delivery. Protect ctx->sigmask with the
file-local lock and wake the file-local waitqueue after reconfiguration.

Add a selftest which reproduces the missed wakeup with a shared
signalfd inherited across fork().

Fixes: b8fceee17a31 ("signalfd simplification")
Assisted-by: LLM (Codex, GPT-5)
Signed-off-by: Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
---
 fs/signalfd.c                                 |  45 ++-
 tools/testing/selftests/signal/.gitignore     |   1 +
 tools/testing/selftests/signal/Makefile       |   2 +-
 .../selftests/signal/signalfd_mask_wake.c     | 266 ++++++++++++++++++
 4 files changed, 302 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/signal/signalfd_mask_wake.c

diff --git a/fs/signalfd.c b/fs/signalfd.c
index dff53745e352..523c3a6dc565 100644
--- a/fs/signalfd.c
+++ b/fs/signalfd.c
@@ -27,6 +27,7 @@
 #include <linux/kernel.h>
 #include <linux/signal.h>
 #include <linux/list.h>
+#include <linux/rcupdate.h>
 #include <linux/anon_inodes.h>
 #include <linux/signalfd.h>
 #include <linux/syscalls.h>
@@ -39,12 +40,19 @@ void signalfd_cleanup(struct sighand_struct *sighand)
 }
 
 struct signalfd_ctx {
+	/* Serializes shared mask updates with file-local waiter wakeups. */
+	spinlock_t lock;
+	wait_queue_head_t wqh;
+	struct rcu_head rcu;
 	sigset_t sigmask;
 };
 
 static int signalfd_release(struct inode *inode, struct file *file)
 {
-	kfree(file->private_data);
+	struct signalfd_ctx *ctx = file->private_data;
+
+	wake_up_pollfree(&ctx->wqh);
+	kfree_rcu(ctx, rcu);
 	return 0;
 }
 
@@ -53,14 +61,17 @@ static __poll_t signalfd_poll(struct file *file, poll_table *wait)
 	struct signalfd_ctx *ctx = file->private_data;
 	__poll_t events = 0;
 
+	poll_wait(file, &ctx->wqh, wait);
 	poll_wait(file, &current->sighand->signalfd_wqh, wait);
 
-	spin_lock_irq(&current->sighand->siglock);
+	spin_lock_irq(&ctx->lock);
+	spin_lock(&current->sighand->siglock);
 	if (next_signal(&current->pending, &ctx->sigmask) ||
 	    next_signal(&current->signal->shared_pending,
 			&ctx->sigmask))
 		events |= EPOLLIN;
-	spin_unlock_irq(&current->sighand->siglock);
+	spin_unlock(&current->sighand->siglock);
+	spin_unlock_irq(&ctx->lock);
 
 	return events;
 }
@@ -157,8 +168,10 @@ static ssize_t signalfd_dequeue(struct signalfd_ctx *ctx, kernel_siginfo_t *info
 	enum pid_type type;
 	ssize_t ret;
 	DECLARE_WAITQUEUE(wait, current);
+	DECLARE_WAITQUEUE(ctx_wait, current);
 
-	spin_lock_irq(&current->sighand->siglock);
+	spin_lock_irq(&ctx->lock);
+	spin_lock(&current->sighand->siglock);
 	ret = dequeue_signal(&ctx->sigmask, info, &type);
 	switch (ret) {
 	case 0:
@@ -167,10 +180,12 @@ static ssize_t signalfd_dequeue(struct signalfd_ctx *ctx, kernel_siginfo_t *info
 		ret = -EAGAIN;
 		fallthrough;
 	default:
-		spin_unlock_irq(&current->sighand->siglock);
+		spin_unlock(&current->sighand->siglock);
+		spin_unlock_irq(&ctx->lock);
 		return ret;
 	}
 
+	add_wait_queue(&ctx->wqh, &ctx_wait);
 	add_wait_queue(&current->sighand->signalfd_wqh, &wait);
 	for (;;) {
 		set_current_state(TASK_INTERRUPTIBLE);
@@ -181,13 +196,17 @@ static ssize_t signalfd_dequeue(struct signalfd_ctx *ctx, kernel_siginfo_t *info
 			ret = -ERESTARTSYS;
 			break;
 		}
-		spin_unlock_irq(&current->sighand->siglock);
+		spin_unlock(&current->sighand->siglock);
+		spin_unlock_irq(&ctx->lock);
 		schedule();
-		spin_lock_irq(&current->sighand->siglock);
+		spin_lock_irq(&ctx->lock);
+		spin_lock(&current->sighand->siglock);
 	}
-	spin_unlock_irq(&current->sighand->siglock);
+	spin_unlock(&current->sighand->siglock);
+	spin_unlock_irq(&ctx->lock);
 
 	remove_wait_queue(&current->sighand->signalfd_wqh, &wait);
+	remove_wait_queue(&ctx->wqh, &ctx_wait);
 	__set_current_state(TASK_RUNNING);
 
 	return ret;
@@ -232,7 +251,9 @@ static void signalfd_show_fdinfo(struct seq_file *m, struct file *f)
 	struct signalfd_ctx *ctx = f->private_data;
 	sigset_t sigmask;
 
+	spin_lock_irq(&ctx->lock);
 	sigmask = ctx->sigmask;
+	spin_unlock_irq(&ctx->lock);
 	signotset(&sigmask);
 	render_sigset_t(m, "sigmask:\t", &sigmask);
 }
@@ -268,6 +289,8 @@ static int do_signalfd4(int ufd, sigset_t *mask, int flags)
 		if (!ctx)
 			return -ENOMEM;
 
+		spin_lock_init(&ctx->lock);
+		init_waitqueue_head(&ctx->wqh);
 		ctx->sigmask = *mask;
 
 		fd = FD_ADD(flags & O_CLOEXEC,
@@ -286,11 +309,11 @@ static int do_signalfd4(int ufd, sigset_t *mask, int flags)
 		ctx = fd_file(f)->private_data;
 		if (fd_file(f)->f_op != &signalfd_fops)
 			return -EINVAL;
-		spin_lock_irq(&current->sighand->siglock);
+		spin_lock_irq(&ctx->lock);
 		ctx->sigmask = *mask;
-		spin_unlock_irq(&current->sighand->siglock);
+		spin_unlock_irq(&ctx->lock);
 
-		wake_up(&current->sighand->signalfd_wqh);
+		wake_up(&ctx->wqh);
 	}
 
 	return ufd;
diff --git a/tools/testing/selftests/signal/.gitignore b/tools/testing/selftests/signal/.gitignore
index 3f339865a3b6..5cac532d49ae 100644
--- a/tools/testing/selftests/signal/.gitignore
+++ b/tools/testing/selftests/signal/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 mangle_uc_sigmask
 sas
+signalfd_mask_wake
diff --git a/tools/testing/selftests/signal/Makefile b/tools/testing/selftests/signal/Makefile
index e0bf7058d19c..00f1e96c92c4 100644
--- a/tools/testing/selftests/signal/Makefile
+++ b/tools/testing/selftests/signal/Makefile
@@ -2,6 +2,6 @@
 CFLAGS = -Wall
 TEST_GEN_PROGS = mangle_uc_sigmask
 TEST_GEN_PROGS += sas
+TEST_GEN_PROGS += signalfd_mask_wake
 
 include ../lib.mk
-
diff --git a/tools/testing/selftests/signal/signalfd_mask_wake.c b/tools/testing/selftests/signal/signalfd_mask_wake.c
new file mode 100644
index 000000000000..3e60424b9ec9
--- /dev/null
+++ b/tools/testing/selftests/signal/signalfd_mask_wake.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <poll.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/signalfd.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+
+static int write_all(int fd, const void *buf, size_t len)
+{
+	const char *ptr = buf;
+
+	while (len) {
+		ssize_t ret = write(fd, ptr, len);
+
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			return -1;
+		}
+
+		ptr += ret;
+		len -= ret;
+	}
+
+	return 0;
+}
+
+static int read_all(int fd, void *buf, size_t len)
+{
+	char *ptr = buf;
+
+	while (len) {
+		ssize_t ret = read(fd, ptr, len);
+
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			return -1;
+		}
+		if (ret == 0)
+			return -1;
+
+		ptr += ret;
+		len -= ret;
+	}
+
+	return 0;
+}
+
+static void kill_and_reap(pid_t pid)
+{
+	int status;
+
+	if (pid <= 0)
+		return;
+
+	kill(pid, SIGKILL);
+	waitpid(pid, &status, 0);
+}
+
+static int wait_result(int fd, int timeout_ms)
+{
+	struct pollfd pfd = {
+		.fd = fd,
+		.events = POLLIN,
+	};
+	int ret;
+
+	do {
+		ret = poll(&pfd, 1, timeout_ms);
+	} while (ret < 0 && errno == EINTR);
+
+	return ret;
+}
+
+static int child_in_signalfd_read(pid_t pid, int sfd)
+{
+	char path[64];
+	char buf[256];
+	long nr;
+	unsigned long arg0;
+	FILE *fp;
+	int in_read = 0;
+
+	snprintf(path, sizeof(path), "/proc/%d/syscall", pid);
+	fp = fopen(path, "r");
+	if (!fp) {
+		if (errno == ENOENT)
+			return -1;
+		return 0;
+	}
+
+	if (fgets(buf, sizeof(buf), fp) &&
+	    sscanf(buf, "%ld %lx", &nr, &arg0) == 2 &&
+	    nr == __NR_read && arg0 == (unsigned long)sfd)
+		in_read = 1;
+
+	fclose(fp);
+	return in_read;
+}
+
+static int wait_for_child_block(pid_t pid, int sfd, int timeout_ms)
+{
+	int waited_ms = 0;
+	int ret;
+
+	while (waited_ms < timeout_ms) {
+		ret = child_in_signalfd_read(pid, sfd);
+		if (ret < 0)
+			return ret;
+		if (ret > 0) {
+			usleep(10000);
+			return 0;
+		}
+
+		usleep(1000);
+		waited_ms++;
+	}
+
+	return -1;
+}
+
+int main(void)
+{
+	struct signalfd_siginfo fdsi;
+	sigset_t blocked, initial_mask, updated_mask;
+	int ready_pipe[2], start_pipe[2], result_pipe[2];
+	int sfd, signo, status;
+	pid_t child;
+	char ready, start;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	sigemptyset(&blocked);
+	sigaddset(&blocked, SIGUSR1);
+	sigaddset(&blocked, SIGUSR2);
+	if (sigprocmask(SIG_BLOCK, &blocked, NULL))
+		ksft_exit_fail_perror("sigprocmask");
+
+	sigemptyset(&initial_mask);
+	sigaddset(&initial_mask, SIGUSR1);
+	sfd = signalfd(-1, &initial_mask, 0);
+	if (sfd < 0)
+		ksft_exit_fail_perror("signalfd");
+
+	if (pipe(ready_pipe))
+		ksft_exit_fail_perror("pipe(ready)");
+	if (pipe(start_pipe))
+		ksft_exit_fail_perror("pipe(start)");
+	if (pipe(result_pipe))
+		ksft_exit_fail_perror("pipe(result)");
+
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_perror("fork");
+
+	if (child == 0) {
+		close(ready_pipe[0]);
+		close(start_pipe[1]);
+		close(result_pipe[0]);
+
+		ready = 'R';
+		if (write_all(ready_pipe[1], &ready, sizeof(ready)))
+			_exit(EXIT_FAILURE);
+
+		if (read_all(start_pipe[0], &start, sizeof(start)))
+			_exit(EXIT_FAILURE);
+
+		memset(&fdsi, 0, sizeof(fdsi));
+		if (read_all(sfd, &fdsi, sizeof(fdsi)))
+			_exit(EXIT_FAILURE);
+
+		signo = fdsi.ssi_signo;
+		if (write_all(result_pipe[1], &signo, sizeof(signo)))
+			_exit(EXIT_FAILURE);
+
+		_exit(EXIT_SUCCESS);
+	}
+
+	close(ready_pipe[1]);
+	close(start_pipe[0]);
+	close(result_pipe[1]);
+
+	if (read_all(ready_pipe[0], &ready, sizeof(ready))) {
+		kill_and_reap(child);
+		ksft_exit_fail_msg("child did not reach blocking read\n");
+	}
+
+	if (kill(child, SIGUSR2)) {
+		kill_and_reap(child);
+		ksft_exit_fail_perror("kill(SIGUSR2)");
+	}
+
+	start = 'S';
+	if (write_all(start_pipe[1], &start, sizeof(start))) {
+		kill_and_reap(child);
+		ksft_exit_fail_msg("could not release child into signalfd read\n");
+	}
+
+	status = wait_for_child_block(child, sfd, 1000);
+	if (status < 0) {
+		kill_and_reap(child);
+		if (status == -1)
+			ksft_exit_skip("/proc/<pid>/syscall is unavailable\n");
+		ksft_exit_fail_msg("child did not block in signalfd read\n");
+	}
+
+	sigemptyset(&updated_mask);
+	sigaddset(&updated_mask, SIGUSR2);
+	if (signalfd(sfd, &updated_mask, 0) < 0) {
+		kill_and_reap(child);
+		ksft_exit_fail_perror("signalfd(reconfigure)");
+	}
+
+	if (wait_result(result_pipe[0], 1000) == 1) {
+		if (read_all(result_pipe[0], &signo, sizeof(signo))) {
+			kill_and_reap(child);
+			ksft_exit_fail_msg("child wakeup did not carry a signal\n");
+		}
+
+		if (waitpid(child, &status, 0) != child) {
+			kill_and_reap(child);
+			ksft_exit_fail_perror("waitpid");
+		}
+		ksft_test_result(signo == SIGUSR2 && WIFEXITED(status) &&
+				 WEXITSTATUS(status) == 0,
+				 "shared signalfd wakeup after mask update\n");
+		ksft_exit_pass();
+	}
+
+	/*
+	 * Buggy kernels leave the child asleep until an unrelated signal hits
+	 * the child's signalfd waitqueue. SIGUSR1 does not match the updated
+	 * signalfd mask, so a successful read of SIGUSR2 after this nudge
+	 * demonstrates the missed wakeup.
+	 */
+	if (kill(child, SIGUSR1)) {
+		kill_and_reap(child);
+		ksft_exit_fail_perror("kill(SIGUSR1)");
+	}
+
+	if (wait_result(result_pipe[0], 1000) == 1 &&
+	    !read_all(result_pipe[0], &signo, sizeof(signo)) &&
+	    waitpid(child, &status, 0) == child &&
+	    signo == SIGUSR2 && WIFEXITED(status) && WEXITSTATUS(status) == 0) {
+		ksft_test_result_fail("mask update missed a shared signalfd waiter\n");
+		ksft_print_msg("child woke only after an unrelated SIGUSR1\n");
+		ksft_exit_fail();
+	}
+
+	kill_and_reap(child);
+	ksft_exit_fail_msg("child remained blocked after signalfd reconfiguration\n");
+}
-- 
2.43.0

