Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455102;
	b=Q5xMVyYlVWUcoUwCYgiBok9wGaDt8WoYMKbcdMAdthI40s1MG7vmGY525KViLkPItV/g
	 0zSJjeK8aG4rBnJzeizcq3xGTlL36WJ+kg9txIIQ6yIAj1JRqFyGrWx3x+Sw28NFkKnlp
	 cK+HNOG/ungMQnIRjy2IXcQ3HL4xdoqhisqaFTmGoUTqFIjyuLWHJZSyYOr01N6/sbcl4
	 kTHPB5tukMR/lCr9feqpaMrMh4L/qMfpAOvCnrilEu4jBL6D9YnKtEFBr+vO22N6Gp4Ng
	 HQXlWEVzUg+Ln44uMNPY7bR0ENIfPQJFLZ+qtJEGGR+rBcfY/FP7xtNXs4aYaXza54A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qva+Wuvhvi5xYBylvYmDKoiHnTRmRzjjr8+Z9U75ogY=;
	b=W6gTh+mGCakyBUXyzg3hjJYxNF14scWjdDvN6FtzYOOTht5BUU7BlUSlT/uTuU269qlL
	 WBMLH3YSxUj2QDbO+OSjtV1zmHn0LeeOLgtSlSAHT7UBJ90Bu8hP8CYxneRfWgUVNDB8J
	 Llml21vIJ+taDAdhuRrLuenlh5jSRh57g8C3HfGsO3VBEiGcElG8C4vjIf8RSv0+/Wv8Y
	 Yzou9itg2/VE8prtu/WEOWiXBKgpcAQ0kM+7NrovX7TiIBwFhiSiMG3FAnC85CmXVXEt+
	 ynzl22GSiIngueU4KfB0XA4Yf+veAA/Czc5GYPQ+UJ7xAFs/iNbuuMZGnrZVEBrizZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=snhsCe5W;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DEF606A331
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9DEF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=snhsCe5W
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so1709706c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455101; x=1793059901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qva+Wuvhvi5xYBylvYmDKoiHnTRmRzjjr8+Z9U75ogY=;
        b=snhsCe5WoJHBjxyCaH0+C3cwsJX2JM5gtm6Jbbrm+1fNUGxLhZoqXyte1WQZsU+DJn
         Eoq3IbfoZQLhAvhviiEFhQYdrdCGpuSyetkrSpr0XTAOfhnfSP4Rwv/ciVlf8unDBkLt
         t2lfBLgLgAX3ztMnOJqTiaiJz+7aulxpE0cYHvDRE0vLOXNAq0aHBwG8k++kGnambvzX
         opsNnLw+1z/SoLV3T0cWy7f6bjEFr4R3bLj3djCxqjdA8J7XuulYdXQzxSGyysBJBFKW
         HRgDREcNBPAJ+kceMQ8PblFt/Dhq4nVED7FySLdVTLnS1G8/EyDYodMS35GbeGLmkw8D
         bQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455101; x=1793059901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qva+Wuvhvi5xYBylvYmDKoiHnTRmRzjjr8+Z9U75ogY=;
        b=anpYfki41c/H51MsfL7uWUyBHRYGvSivbb+0VLM9NODgn0t84b6l0UFC0skvjPUWxG
         t5TT4GkagBKUTNoDjKcbBTqUMOO5GJ5PLjfdiNE48eJYVr8iJdEN4NLNbR8kjR4ERBml
         9leh8Wl4bQmYfbhlY53fq97+v7sLiXF7Piw5/XgJoMvwigtHyVbQqj4SFx3Bf8WE2JJT
         sanxOGhwBDzq5idvxmzGNmViolaG9YC2jypIk7XvPAesiV5rb0qH7qrP+GOLTpy2JUoA
         jf2bCt+KprEl+GgF1oZHNMNYQ7tqgqZuNc/fhq94Xtqe1uxBxVTPnmWcOE1AH8frXgqs
         AtfA==
X-Gm-Message-State: AFq9FYL5Ps+DOGUdT4gbOGVCcJ/vDf8/qfrNZFY7vXTdX7xUkmiPOSZe
	z/HQ0i0arq0diWy6CDL4QZvG4PlifIWpDNe+Xv9EwPGlkIDmKTesmWjFpRgEdA==
X-Gm-Gg: AYBFou3fGGKPiHzzj8qPGZiz1S3sL0oVMGwBC1XjcNk4vZE8eGJ6R9DGRZXIQJs8zxi
	ArL5am0aHlbzh5XGmSprP7OpAGFgJ98Xq8qSUaDF33UnH/smN09tghtBJ6MH7eTilfZSmZale86
	VnrvCs0yMHm9V8Kk8o+Jx/AJ1TCZT5F7ujxq+yfFHc1c2pavPX3yVPOspqt1DDr74cH3v2tAtdR
	AaohdwBsRXKkZfDG7xj3yDo9DUQJUQwYcNxhKQFphkj8D5/VGjN3I9Zr6ns4x5FfTdRpuIKjSfq
	Vm/09tUYFHaavTFBF/lGLNpC6vguOptLq+DaVU/vRMwcB363lZ0N0e9+Uy+d2NhRjtTkTkLPJnh
	R+GVuERQdkcHriEYKiuwt+X2wlt5HX4xqQhqwY2Hki4Ps39zJwwh2W2nLGeZNAXkICllvum5o3+
	j1Kh/490RVDrsGQ5plZ2ER+mjcbed4YsnSpNHytiFfft6F0L7NqB6UKRl7hLpICSXXpFn8NNbTM
	0PUB9TnRu5h0Iub8QuBeJtlLfXbZh8JO2XORwKRKdLKfZCCGi4vBwcwUnqs0UOzkA==
X-Received: by 2002:a05:701b:4644:b0:165:55e2:2d69 with SMTP id a92af1059eb24-18514edde6cmr11736030c88.46.1792455100675;
        Mon, 19 Oct 2026 17:11:40 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:39 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 7/9] selftests/seccomp: test fork result records
Date: Mon, 19 Oct 2026 17:11:22 -0700
Message-ID: <20261020001124.974063-8-xiyou.wangcong@gmail.com>
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

Cover SECCOMP_USER_NOTIF_FLAG_RESULT:

 - a successful fork is reported with the entry's id, the child's pid
   and pidfs inode number, the child can be opened as a pidfd by that
   inode number, and its first notification arrives only after the
   record, even when it was queued first;
 - forks rejected by kernel_clone(), copy_process() and clone3() are
   reported with their error, and an unread record is freed with the
   listener;
 - a new thread is flagged as one;
 - the flag is refused for a non-fork system call and without CONTINUE.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 389 ++++++++++++++++++
 1 file changed, 389 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 0622bc2acad4..d5dd5bc22faa 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -47,6 +47,7 @@
 #include <sys/ioctl.h>
 #include <linux/kcmp.h>
 #include <sys/resource.h>
+#include <sys/stat.h>
 #include <sys/capability.h>
 #include <linux/perf_event.h>
 
@@ -4964,6 +4965,394 @@ TEST(user_notification_wait_killable_after_reply)
 	EXPECT_EQ(0, WEXITSTATUS(status));
 }
 
+#ifndef FD_PIDFS_ROOT
+#define FD_PIDFS_ROOT -10002
+#endif
+
+#ifndef FILEID_KERNFS
+#define FILEID_KERNFS 0xfe
+#endif
+
+static int user_notif_fork_filter(void)
+{
+	struct sock_filter filter[] = {
+		BPF_STMT(BPF_LD|BPF_W|BPF_ABS,
+			offsetof(struct seccomp_data, nr)),
+		BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, __NR_clone, 2, 0),
+		BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, __NR_clone3, 1, 0),
+		BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, __NR_getppid, 0, 1),
+		BPF_STMT(BPF_RET|BPF_K, SECCOMP_RET_USER_NOTIF),
+		BPF_STMT(BPF_RET|BPF_K, SECCOMP_RET_ALLOW),
+	};
+	struct sock_fprog prog = {
+		.len = (unsigned short)ARRAY_SIZE(filter),
+		.filter = filter,
+	};
+
+	return seccomp(SECCOMP_SET_MODE_FILTER,
+		       SECCOMP_FILTER_FLAG_NEW_LISTENER, &prog);
+}
+
+static int send_fd(int sock, int fd)
+{
+	char cbuf[CMSG_SPACE(sizeof(int))] = {};
+	char c = 0;
+	struct iovec iov = { .iov_base = &c, .iov_len = 1 };
+	struct msghdr msg = {
+		.msg_iov = &iov,
+		.msg_iovlen = 1,
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
+	};
+	struct cmsghdr *cmsg = CMSG_FIRSTHDR(&msg);
+
+	cmsg->cmsg_level = SOL_SOCKET;
+	cmsg->cmsg_type = SCM_RIGHTS;
+	cmsg->cmsg_len = CMSG_LEN(sizeof(int));
+	memcpy(CMSG_DATA(cmsg), &fd, sizeof(int));
+
+	return sendmsg(sock, &msg, 0) == 1 ? 0 : -1;
+}
+
+static int recv_fd(int sock)
+{
+	char cbuf[CMSG_SPACE(sizeof(int))] = {};
+	char c;
+	struct iovec iov = { .iov_base = &c, .iov_len = 1 };
+	struct msghdr msg = {
+		.msg_iov = &iov,
+		.msg_iovlen = 1,
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
+	};
+	struct cmsghdr *cmsg;
+	int fd;
+
+	if (recvmsg(sock, &msg, 0) != 1)
+		return -1;
+	cmsg = CMSG_FIRSTHDR(&msg);
+	if (!cmsg || cmsg->cmsg_type != SCM_RIGHTS)
+		return -1;
+	memcpy(&fd, CMSG_DATA(cmsg), sizeof(int));
+	return fd;
+}
+
+/*
+ * Fork a child that notifies clone, clone3 and getppid to a listener,
+ * hands the listener to us and then exits with what @fn returns.
+ */
+static pid_t fork_result_child(struct __test_metadata *_metadata,
+			       int (*fn)(void), int *listener)
+{
+	int sk[2];
+	pid_t pid;
+
+	ASSERT_EQ(socketpair(AF_UNIX, SOCK_SEQPACKET, 0, sk), 0);
+
+	pid = fork();
+	ASSERT_GE(pid, 0);
+
+	if (pid == 0) {
+		int fd;
+
+		close(sk[0]);
+		if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0))
+			_exit(100);
+		fd = user_notif_fork_filter();
+		if (fd < 0 || send_fd(sk[1], fd))
+			_exit(101);
+		close(fd);
+		close(sk[1]);
+		_exit(fn());
+	}
+
+	close(sk[1]);
+	*listener = recv_fd(sk[0]);
+	close(sk[0]);
+	ASSERT_GE(*listener, 0);
+	return pid;
+}
+
+static bool is_fork_nr(int nr)
+{
+	return nr == __NR_clone || nr == __NR_clone3;
+}
+
+/* Receive a fork family notification and continue it, asking for a record. */
+static void continue_with_result(struct __test_metadata *_metadata,
+				 int listener, pid_t pid,
+				 struct seccomp_notif *req)
+{
+	struct seccomp_notif_resp resp = {};
+
+	memset(req, 0, sizeof(*req));
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, req), 0);
+	ASSERT_EQ(req->flags, 0);
+	ASSERT_EQ(req->pid, pid);
+	ASSERT_TRUE(is_fork_nr(req->data.nr));
+
+	resp.id = req->id;
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE |
+		     SECCOMP_USER_NOTIF_FLAG_RESULT;
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0) {
+		if (errno == EINVAL)
+			SKIP(return, "Kernel does not support SECCOMP_USER_NOTIF_FLAG_RESULT");
+	}
+}
+
+static void recv_result(struct __test_metadata *_metadata, int listener,
+			const struct seccomp_notif *entry,
+			struct seccomp_notif *rec)
+{
+	memset(rec, 0, sizeof(*rec));
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, rec), 0);
+	ASSERT_NE(rec->flags & SECCOMP_NOTIF_FLAG_RESULT, 0);
+	EXPECT_EQ(rec->id, entry->id);
+	EXPECT_EQ(rec->pid, entry->pid);
+	EXPECT_EQ(rec->result.nr, entry->data.nr);
+	EXPECT_EQ(rec->result.arch, entry->data.arch);
+	EXPECT_EQ(rec->result.__reserved, 0);
+}
+
+static int pidfd_open_by_ino(__u64 ino, int flags)
+{
+	/* struct file_handle with room for a pidfs handle */
+	struct {
+		unsigned int handle_bytes;
+		int handle_type;
+		__u64 ino;
+	} fh = {
+		.handle_bytes = sizeof(ino),
+		.handle_type = FILEID_KERNFS,
+		.ino = ino,
+	};
+
+	return open_by_handle_at(FD_PIDFS_ROOT, (struct file_handle *)&fh,
+				 flags);
+}
+
+static int fork_result_fork(void)
+{
+	int status;
+	pid_t pid;
+
+	pid = fork();
+	if (pid < 0)
+		return 1;
+	if (pid == 0)
+		_exit(syscall(__NR_getppid) != USER_NOTIF_MAGIC);
+	if (waitpid(pid, &status, 0) != pid)
+		return 2;
+	return !WIFEXITED(status) || WEXITSTATUS(status);
+}
+
+TEST(user_notification_fork_result)
+{
+	struct seccomp_notif entry, rec, req = {};
+	struct seccomp_notif_resp resp = {};
+	struct pollfd pollfd;
+	int status, listener, pidfd;
+	struct stat st;
+	pid_t pid;
+
+	pid = fork_result_child(_metadata, fork_result_fork, &listener);
+	continue_with_result(_metadata, listener, pid, &entry);
+
+	/* Let the new child queue its getppid() notification first. */
+	usleep(100000);
+
+	recv_result(_metadata, listener, &entry, &rec);
+	EXPECT_EQ(rec.flags, SECCOMP_NOTIF_FLAG_RESULT);
+	ASSERT_GT(rec.result.val, 0);
+	EXPECT_EQ(rec.result.child_pid, rec.result.val);
+	ASSERT_NE(rec.result.child_ino, 0);
+
+	/* The record names the child race free, without privileges. */
+	pidfd = pidfd_open_by_ino(rec.result.child_ino, 0);
+	ASSERT_GE(pidfd, 0);
+	ASSERT_EQ(fstat(pidfd, &st), 0);
+	EXPECT_EQ(st.st_ino, rec.result.child_ino);
+
+	/* The child is only heard from after its record. */
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+	EXPECT_EQ(req.flags, 0);
+	EXPECT_EQ(req.pid, rec.result.child_pid);
+	EXPECT_EQ(req.data.nr, __NR_getppid);
+
+	resp.id = req.id;
+	resp.val = USER_NOTIF_MAGIC;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+
+	pollfd.fd = pidfd;
+	pollfd.events = POLLIN;
+	EXPECT_EQ(poll(&pollfd, 1, -1), 1);
+	close(pidfd);
+
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+	close(listener);
+}
+
+static int fork_result_fail(void)
+{
+	struct __clone_args args = {};
+	int fd = -1;
+
+	/* Rejected by kernel_clone() before copy_process(). */
+	args.flags = CLONE_PIDFD | CLONE_PARENT_SETTID;
+	args.pidfd = (unsigned long)&fd;
+	args.parent_tid = (unsigned long)&fd;
+	args.exit_signal = SIGCHLD;
+	if (sys_clone3(&args, sizeof(args)) != -1 || errno != EINVAL)
+		return 1;
+
+	/* Rejected by copy_process(). */
+	memset(&args, 0, sizeof(args));
+	args.flags = CLONE_SIGHAND;
+	args.exit_signal = SIGCHLD;
+	if (sys_clone3(&args, sizeof(args)) != -1 || errno != EINVAL)
+		return 2;
+
+	/* Rejected by clone3() itself. */
+	if (sys_clone3(&args, 1) != -1 || errno != EINVAL)
+		return 3;
+
+	return 0;
+}
+
+TEST(user_notification_fork_result_fail)
+{
+	struct seccomp_notif entry, rec;
+	struct pollfd pollfd;
+	int i, status, listener;
+	pid_t pid;
+
+	pid = fork_result_child(_metadata, fork_result_fail, &listener);
+
+	for (i = 0; i < 3; i++) {
+		continue_with_result(_metadata, listener, pid, &entry);
+		EXPECT_EQ(entry.data.nr, __NR_clone3);
+		if (i == 2)
+			break;
+		recv_result(_metadata, listener, &entry, &rec);
+		EXPECT_EQ(rec.flags, SECCOMP_NOTIF_FLAG_RESULT);
+		EXPECT_EQ(rec.result.val, -EINVAL);
+		EXPECT_EQ(rec.result.child_pid, 0);
+		EXPECT_EQ(rec.result.child_ino, 0);
+	}
+
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+
+	/* The last record outlives its task, and closing frees it unread. */
+	pollfd.fd = listener;
+	pollfd.events = POLLIN;
+	EXPECT_EQ(poll(&pollfd, 1, 0), 1);
+	EXPECT_NE(pollfd.revents & POLLIN, 0);
+	close(listener);
+}
+
+static void *fork_result_noop(void *arg)
+{
+	return arg;
+}
+
+static int fork_result_thread(void)
+{
+	pthread_t thread;
+
+	if (pthread_create(&thread, NULL, fork_result_noop, NULL))
+		return 1;
+	return pthread_join(thread, NULL) != 0;
+}
+
+TEST(user_notification_fork_result_thread)
+{
+	struct seccomp_notif entry, rec;
+	int status, listener;
+	pid_t pid;
+
+	pid = fork_result_child(_metadata, fork_result_thread, &listener);
+	continue_with_result(_metadata, listener, pid, &entry);
+
+	recv_result(_metadata, listener, &entry, &rec);
+	EXPECT_EQ(rec.flags,
+		  SECCOMP_NOTIF_FLAG_RESULT | SECCOMP_NOTIF_FLAG_THREAD);
+	ASSERT_GT(rec.result.val, 0);
+	EXPECT_EQ(rec.result.child_pid, rec.result.val);
+	EXPECT_NE(rec.result.child_ino, 0);
+
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+	close(listener);
+}
+
+static int fork_result_einval(void)
+{
+	if (syscall(__NR_getppid) != USER_NOTIF_MAGIC)
+		return 1;
+	return fork_result_fork();
+}
+
+TEST(user_notification_fork_result_einval)
+{
+	struct seccomp_notif_resp resp = {};
+	struct seccomp_notif req = {};
+	struct pollfd pollfd;
+	int status, listener;
+	pid_t pid;
+
+	pid = fork_result_child(_metadata, fork_result_einval, &listener);
+
+	/* Not a fork. */
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+	EXPECT_EQ(req.data.nr, __NR_getppid);
+	resp.id = req.id;
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE |
+		     SECCOMP_USER_NOTIF_FLAG_RESULT;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), -1);
+	EXPECT_EQ(errno, EINVAL);
+	resp.flags = 0;
+	resp.val = USER_NOTIF_MAGIC;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+
+	/* A fork, but RESULT needs CONTINUE. */
+	memset(&req, 0, sizeof(req));
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+	EXPECT_TRUE(is_fork_nr(req.data.nr));
+	resp.id = req.id;
+	resp.val = 0;
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_RESULT;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), -1);
+	EXPECT_EQ(errno, EINVAL);
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+
+	/* The grandchild's getppid(). */
+	memset(&req, 0, sizeof(req));
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+	EXPECT_EQ(req.flags, 0);
+	EXPECT_EQ(req.data.nr, __NR_getppid);
+	resp.id = req.id;
+	resp.flags = 0;
+	resp.val = USER_NOTIF_MAGIC;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+
+	/* No record without RESULT. */
+	pollfd.fd = listener;
+	pollfd.events = POLLIN;
+	EXPECT_EQ(poll(&pollfd, 1, 0), 1);
+	EXPECT_EQ(pollfd.revents & POLLIN, 0);
+	close(listener);
+}
+
 struct tsync_vs_thread_leader_args {
 	pthread_t leader;
 };
-- 
2.43.0

