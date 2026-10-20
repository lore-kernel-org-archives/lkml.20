Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455103;
	b=DIt5q46R9PZ35+POCR7tV4+wTE1mRHMwX48ckwAcc9AzebDSjpN7jYQV6nTPyOgGHxua
	 78nXx58kFE0jsiu5Q1/VVZKr78V/J/ekf5Ypq9C/tMOMMTh3IORm++AUVKICCdx1+68cJ
	 vZ5fDxMf0p7B13rlxFvzXlYksiZX6Fn1j6wHZewez+F0F27n9hWnZaItHEFPnoHlqkCrM
	 hoB5dr9H5thpAZLi1yAtcDmDGdlychHr0BfroQVkVpLkuBxt3s7TPEWRPygyhBUwK45RO
	 tpznTn1i37pXrL0U5ozmzQ1ZW7oE4Hmn2zZtzpvHgeEOUyfdJN71QboLJkgxoPBnskQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TX/AmFkks3H0g4CWvqpLNWfwUl8ryEPz0ZAPB2HjWpA=;
	b=bh0AJhDhEyqbWdKfbLdCw75cg1du1cfBUNea7NjixCv9/D8T8LTwAFzGlJimT170tSx8
	 r6ohbupYdRtuvEZeqZ2mvHbzIaQs+6Z66zJPrfH56hsdMqP7PFgKDVcgDFDL6xn31Bg5Y
	 ahyqfoxulLkkR8loOBT0Jm4s71KN+0+MQrXmW1kT6bikQSRDfGgH4zG+QCKLWMWTgjm2f
	 Fywl7oljh0faoufM0nw7juovFFs1fkHiLGjjjeFsAtNW5cnN65QmBunkmm/0fIeqWXvaG
	 4dkfIfA5DDSJftuVztDkLioM7gSrJULVDKgEy1WHtKGkP5A2wTGEKPIHYuWLZHg21mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=grUgxhXZ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35562606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35562606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=grUgxhXZ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35d0be18c71so214041eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455102; x=1793059902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TX/AmFkks3H0g4CWvqpLNWfwUl8ryEPz0ZAPB2HjWpA=;
        b=grUgxhXZ6+29LGrcUVVVsZE8b1rw2f59+9Mfc/ZULw1SzNi/RUcB0Xdr9donMLMglg
         MFUpfyd8QxxoRN60c2isq+X07nq0LZaMnzs93I6J4z9JgZ41e7lJ9IeAKC/CEl3g9vB7
         dhvGEJcN1OfN2FRgq2C1B/JkEYubFJ0gUmS2YwVUW+VjCJItm4fpl0sWo3lKILBttlBY
         Pew8XlHbIHzHMSFIsVKOmKFfKKt59GhU1EBCkAUA2FxRk3rzbS/v6zgOjEaBvBuUWNZI
         xIea4hjYcTPFF0fGzN8F3bqdolHf6tPKkf7c1Stkpj54NLHMu667HA45LsQ5xjKenmHZ
         uokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455102; x=1793059902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TX/AmFkks3H0g4CWvqpLNWfwUl8ryEPz0ZAPB2HjWpA=;
        b=pif10sLl5eP+lPhaMrTB3hNtGG3F9+zLG0o96zO1joFv+pqnbE9yOLLywolYES2nbN
         4EEs6/SLClZ0fpKRcapbydXDoqFHwhSN/8TyICNJj8+bQqC1QIO1EZYGjOC9ciT2cAIK
         nQpoBbEZfFWoPDkbiUYReK5BgZCjqsIikjUII8KtT0NJyA1NU4S0bZRDD2FS59U4zrFn
         OgaUfcbvtBYCJz4S2od5My0DBnaYaVFZ0MTP7/4TGCWTpawlCdqYnysSeKi13q/VgTR8
         bEzTDaGvpcXBwjJ+j6E5NaMUmo/BBmhYSrirpVLIiWQTd7SVAAZ7n/VlQwKEKubMYChG
         HCRg==
X-Gm-Message-State: AFq9FYLtgY/5zz5TyXwB2bg6uvAbTVVAl8IkdnsFzCdT/DXNycFbcb5G
	N6F+McCV30b2LlIrb6Wsslxqrf6xFPkDqV8lkohQjfjdff1ty/Si1wp4a0/VAg==
X-Gm-Gg: AYBFou2qLf82vo+SLCcEMmPt6V0I2hYHMGnYacmsDnip6uF2hXvAehFOZSeK3NaOeuK
	3WXWQl3keiAVjXFG0Sc5a4NzhC/BoTWOpY03krCtA6dNz1was97BYnkcMPaDW9R31NWeYKZ8rcv
	0IsUSddLppN0JaGgYQ7Itwqr4hKfAWbOI8qdwyk0dPjBgAdtBYSPF1UAWmdf5nSQRZjkp59Zaj0
	IAd/bOFwc4ygSfmdzuHepYOgCl8U2F5bMcccY6oTw0mylJKT6iM9qm2AGZlDYVzHUD/1jOlqOQm
	pKKqEvtZgVNymrqLo1wp+fOggJe6zhTIADqvhOeSeTNJ+qJcu/brLVYg/IY+Bd+M9sELiJnXfPu
	Z/FIT2KE8AeYN8z4VHLHW6AFIdNam2tgzDrdAAF3cUJZ1kYRyzjXNLXBEUl5gP3mEsKvaBeAG5a
	9dXx6yJmpH3RFIOJ4UWWaANDRfszl4V0xipXP91K+CF79/OJKOVXRUNLhLLdXSck4D20dMa1B9c
	flZtDCEiOB1BS21PlSTPOUoKCgiXa42loWHJi5FtLCaESWldXNHz5Q=
X-Received: by 2002:a05:7022:eb44:10b0:183:e184:86b with SMTP id a92af1059eb24-18dbe2af4cbmr810057c88.5.1792455102036;
        Mon, 19 Oct 2026 17:11:42 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:41 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 8/9] selftests/seccomp: test held fork results
Date: Mon, 19 Oct 2026 17:11:23 -0700
Message-ID: <20261020001124.974063-9-xiyou.wangcong@gmail.com>
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

Cover SECCOMP_USER_NOTIF_FLAG_HOLD: a held child does not run until the
held notification is continued, the held notification refuses anything
but a plain CONTINUE as well as ADDFD, a failed fork is held too and
keeps the parent from returning, killing the parent turns the held
notification into a one-way record and releases the child, and closing
the listener releases the child too.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index d5dd5bc22faa..80faa3a35cf4 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -5353,6 +5353,196 @@ TEST(user_notification_fork_result_einval)
 	close(listener);
 }
 
+static int hold_pipe[2];
+
+static int fork_hold_fork(void)
+{
+	int status;
+	pid_t pid;
+
+	pid = fork();
+	if (pid < 0)
+		return 1;
+	if (pid == 0)
+		_exit(write(hold_pipe[1], "x", 1) != 1);
+	if (waitpid(pid, &status, 0) != pid)
+		return 2;
+	return !WIFEXITED(status) || WEXITSTATUS(status);
+}
+
+static int fork_hold_fail(void)
+{
+	struct __clone_args args = {};
+	bool failed = sys_clone3(&args, 1) == -1 && errno == EINVAL;
+
+	return write(hold_pipe[1], "x", 1) != 1 || !failed;
+}
+
+/* Start a sandboxed fork, continue it with HOLD and wait until it is held. */
+static pid_t fork_hold_start(struct __test_metadata *_metadata,
+			     int (*fn)(void), int *listener,
+			     struct seccomp_notif *entry)
+{
+	struct seccomp_notif_resp resp = {};
+	struct pollfd pollfd;
+	pid_t pid;
+
+	ASSERT_EQ(pipe(hold_pipe), 0);
+	pid = fork_result_child(_metadata, fn, listener);
+	close(hold_pipe[1]);
+
+	memset(entry, 0, sizeof(*entry));
+	ASSERT_EQ(ioctl(*listener, SECCOMP_IOCTL_NOTIF_RECV, entry), 0);
+	ASSERT_TRUE(is_fork_nr(entry->data.nr));
+
+	resp.id = entry->id;
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_HOLD;
+	EXPECT_EQ(ioctl(*listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), -1);
+	EXPECT_EQ(errno, EINVAL);
+
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE |
+		     SECCOMP_USER_NOTIF_FLAG_RESULT |
+		     SECCOMP_USER_NOTIF_FLAG_HOLD;
+	ASSERT_EQ(ioctl(*listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0) {
+		if (errno == EINVAL)
+			SKIP(return pid, "Kernel does not support SECCOMP_USER_NOTIF_FLAG_HOLD");
+	}
+
+	pollfd.fd = *listener;
+	pollfd.events = POLLIN;
+	EXPECT_EQ(poll(&pollfd, 1, -1), 1);
+	return pid;
+}
+
+/* Has the held task run past the hold? */
+static bool hold_released(int timeout_ms)
+{
+	struct pollfd pollfd = { .fd = hold_pipe[0], .events = POLLIN };
+	char c;
+
+	return poll(&pollfd, 1, timeout_ms) == 1 &&
+	       read(hold_pipe[0], &c, 1) == 1 && c == 'x';
+}
+
+TEST(user_notification_fork_hold)
+{
+	struct seccomp_notif_addfd addfd = {};
+	struct seccomp_notif_resp resp = {};
+	struct seccomp_notif entry, rec;
+	int status, listener;
+	pid_t pid;
+
+	pid = fork_hold_start(_metadata, fork_hold_fork, &listener, &entry);
+
+	recv_result(_metadata, listener, &entry, &rec);
+	EXPECT_EQ(rec.flags, SECCOMP_NOTIF_FLAG_RESULT | SECCOMP_NOTIF_FLAG_HELD);
+	ASSERT_GT(rec.result.val, 0);
+	EXPECT_EQ(rec.result.child_pid, rec.result.val);
+	EXPECT_NE(rec.result.child_ino, 0);
+
+	EXPECT_EQ(hold_released(200), false);
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_ID_VALID, &rec.id), 0);
+
+	/* A held fork can only be continued. */
+	resp.id = rec.id;
+	resp.error = -EPERM;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), -1);
+	EXPECT_EQ(errno, EINVAL);
+	resp.error = 0;
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE |
+		     SECCOMP_USER_NOTIF_FLAG_RESULT;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), -1);
+	EXPECT_EQ(errno, EINVAL);
+
+	addfd.id = rec.id;
+	addfd.srcfd = listener;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd), -1);
+	EXPECT_EQ(errno, EINVAL);
+
+	EXPECT_EQ(hold_released(0), false);
+
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+	EXPECT_EQ(hold_released(-1), true);
+
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+	close(hold_pipe[0]);
+	close(listener);
+}
+
+/* A held result need not be a new task: the parent does not return yet. */
+TEST(user_notification_fork_hold_fail)
+{
+	struct seccomp_notif_resp resp = {};
+	struct seccomp_notif entry, rec;
+	int status, listener;
+	pid_t pid;
+
+	pid = fork_hold_start(_metadata, fork_hold_fail, &listener, &entry);
+
+	recv_result(_metadata, listener, &entry, &rec);
+	EXPECT_EQ(rec.flags, SECCOMP_NOTIF_FLAG_RESULT | SECCOMP_NOTIF_FLAG_HELD);
+	EXPECT_EQ(rec.result.val, -EINVAL);
+	EXPECT_EQ(rec.result.child_pid, 0);
+	EXPECT_EQ(rec.result.child_ino, 0);
+
+	EXPECT_EQ(hold_released(200), false);
+	resp.id = rec.id;
+	resp.flags = SECCOMP_USER_NOTIF_FLAG_CONTINUE;
+	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+	EXPECT_EQ(hold_released(-1), true);
+
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+	close(hold_pipe[0]);
+	close(listener);
+}
+
+TEST(user_notification_fork_hold_killed)
+{
+	struct seccomp_notif entry, rec;
+	int status, listener;
+	pid_t pid;
+
+	pid = fork_hold_start(_metadata, fork_hold_fork, &listener, &entry);
+
+	/* Kill the parent before the held fork was received. */
+	EXPECT_EQ(kill(pid, SIGKILL), 0);
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFSIGNALED(status));
+	EXPECT_EQ(SIGKILL, WTERMSIG(status));
+
+	/* The child is still reported, no longer held, and runs. */
+	recv_result(_metadata, listener, &entry, &rec);
+	EXPECT_EQ(rec.flags, SECCOMP_NOTIF_FLAG_RESULT);
+	EXPECT_GT(rec.result.val, 0);
+	EXPECT_NE(rec.result.child_ino, 0);
+	EXPECT_EQ(hold_released(-1), true);
+	close(hold_pipe[0]);
+	close(listener);
+}
+
+TEST(user_notification_fork_hold_closed)
+{
+	struct seccomp_notif entry;
+	int status, listener;
+	pid_t pid;
+
+	pid = fork_hold_start(_metadata, fork_hold_fork, &listener, &entry);
+
+	/* Losing the listener releases a held fork. */
+	close(listener);
+	EXPECT_EQ(hold_released(-1), true);
+
+	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_EQ(true, WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+	close(hold_pipe[0]);
+}
+
 struct tsync_vs_thread_leader_args {
 	pthread_t leader;
 };
-- 
2.43.0

