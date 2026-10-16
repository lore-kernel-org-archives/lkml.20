Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844384CDDC2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157247; cv=none; b=kynzAFzdYJn5V/5QatRJxw1ZiEzyb3mclbzuFNxj3rJLS7jvtW4BsNOS1pDWyFCOQnd6+C+ozsmLSdTj0QZSXEUjr9tS0bjOMyDK6IGqeZHYho2KWjsMQPWgC5kdWd3fkGMn2QQo+lemi6TFiiRYvHHzLqKjaJuuP8dKGymwCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157247; c=relaxed/simple;
	bh=hLVvPaADOzHjxZw4TUN3HlFoVzI8Xz1/lEUKmQN+0+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1zm6obiOwXCxYQaXrKdSzdetp9yRcKidFYvlour4Khkfz0enjeph9iio13X9zFqmmWZWX7NGjehOkM4qeHeQ8cXCxxhRe1UCPxQOE8YAXmZ/9ZLejzx6cjTGTY6cVjehhrOXdCg1Eld9+T/f3oCsBv1l0TDGdNZMZp4Z5XCZ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lw+eE3LK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lw+eE3LK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so39009815e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157244; x=1792762044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABUldiMgqEkToVfvm0gRz1JDqAgP1R8x5uZIM0eMbNU=;
        b=Lw+eE3LKJnCYEanZImuVydnNlqzWnDx/Fs+zQ72huOmxHRoCPG46EKzgbhCBtfjXEL
         JF6NgWu/hVeNgk+ARY4zm0vkVKX8iYDrrUBcxCl98W+2+keT0o+7MXrScpf0KIAOyqKC
         p3Uo1BBkSxzqbwckBBGYc7V3Hej0WErd+pkptn48o+asFQnozYnN1jSdzH+dwK8gaVJd
         T/qkNSGR7yQotFzMy7DyRDoK0BtI2kuZ+UmhLsWTCKFFOUuFQKcI7WaNY4o2LuRbbYnQ
         b0UDGQ4fcafcbLkjbPhdM4CSMP5VupZwdKbhrNdSkgsaMioy83S9KiAo66xeExdgpXp3
         ZKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157244; x=1792762044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABUldiMgqEkToVfvm0gRz1JDqAgP1R8x5uZIM0eMbNU=;
        b=ZbL1CtYTMra2Jl4ctuE1x9PbjE9I4lK7e9ydPySuucQX843CI9JlcuFWlIE5aimVNB
         ciaQUdfuKfHoBavh3fP21AMKb6eBy6cPA4fAlf2aeAHWBHKguNOcAAb8q58xV9TgFfD6
         Ip3+NzYy6EM0FrISep/BErvrf4cdqo0WWJYXquwwYDRGikqN5Er7cZSZPo6zkGYIgqea
         LqXcepwe7uENh8tQKeymM4ysU+eKrCExwoOhV7sHg5VfQKaGH2qQbsIaE8xAMdoBcdsG
         8y4oDsodyJPyL7xK48tT7MyBDA99X5NiZR+1yGtvO4UBCMkn2+YjQU0lbQtA5i1Dsf2B
         QtjQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9rEH6pBgbn+h5Zp8MvCgI9V6273rkqpIEp9IXeGpJ6hSChB6/gsabbXZzWjc6GxYhH6ys2P50KsazxxA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn7aR/bGAoHnM3ptYGtEDm+Oy6yizG1pRAxYeNrOiS4N8fhRkk
	EXo1K9VkWEjfr71ua2GESL5igXly/o5jBjLmFMGXyIiq0AT0gux/ZmGy
X-Gm-Gg: AYBFou1oiUHjgHee8C6fTnVJWA996BVnF11hBI3+iHn8U74K6Qt56rkd21ISRZdtLmj
	U4JOeXWFWUKmta9s1A627t5WUs/P+l2NigQGG3LgqduJJMAPDVYF1XhvNbS6pp7gWVa6JXo+zT/
	wVblirAtJMJc9TDeJFkFGVTNPePaVvXhyr64S+3YXOWB+1yEsCqdg8+D5SXhJvbI6Y4+6puf/IZ
	gJgft1MbDKOViLbfLcKo47O072iJG+1r/SbAxgLeMb5t8MXSMuPdIgvXOjBbiWI//Z2CvDT7KDA
	SQlN3jmXA9Wk08pdBsgSG3TynKzAk9j4QKdk5PLm53cNrt7THJeF09F08UNA3HrtqdM6JhNr2G/
	2VkFfyGsdJVJ6xNUC3GuEQ67Ck4AH0sOFW03/xHqBsToQADhvD+bYMxwNMCcgg1TjkP/EEpAJ4v
	KAq7LOsk4rfz/RS9nYenXkV8KcjlzQdpf7DVsKAaQ5Mxxl1HP2q3pnCNEwxdOVhI62R1aJcxd+U
	nHw7YYiPUax6g3yK00f1TwlUniAMhnFNhayCHuUlWAwqmIw/BTeKVMS1QQ=
X-Received: by 2002:a05:600c:3b02:b0:4a1:cdd1:5144 with SMTP id 5b1f17b1804b1-4a1cdd15182mr34872015e9.21.1792157243530;
        Fri, 16 Oct 2026 06:27:23 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm58114275e9.14.2026.10.16.06.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:27:23 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: [PATCH net-next v3 3/3] vsock/test: cover SO_INQ
Date: Fri, 16 Oct 2026 14:27:16 +0100
Message-ID: <20261016132716.272018-4-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016132716.272018-1-devnexen@gmail.com>
References: <20261016132716.272018-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the SCM_INQ value after a partial receive, after draining the
queue and at EOF, that no cmsg is sent while the option is off, that
accepted sockets inherit it from the listener, and that out of range
values and SOCK_SEQPACKET are rejected.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Bobby Eshleman <bobbyeshleman@meta.com>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 tools/testing/vsock/vsock_test.c | 279 +++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index b4ff9f946565..10b9074fb87f 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -2429,6 +2429,271 @@ static void test_stream_collapse_server(const struct test_opts *opts)
 	close(fd);
 }
 
+#define SO_INQ_BUF_LEN 64
+#define SO_INQ_CHUNK_LEN 16
+
+static int so_inq_set(int fd, int val)
+{
+	return setsockopt(fd, SOL_SOCKET, SO_INQ, &val, sizeof(val));
+}
+
+/* Receive @len bytes and return the SCM_INQ value, or -1 if the kernel did
+ * not attach one.
+ */
+static int so_inq_recv(int fd, size_t len, int expected_ret)
+{
+	char control[CMSG_SPACE(sizeof(int))] = { 0 };
+	unsigned char buf[SO_INQ_BUF_LEN];
+	struct iovec iov = {
+		.iov_base = buf,
+		.iov_len = len,
+	};
+	struct msghdr msg = {
+		.msg_iov = &iov,
+		.msg_iovlen = 1,
+		.msg_control = control,
+		.msg_controllen = sizeof(control),
+	};
+	struct cmsghdr *cmsg;
+	ssize_t ret;
+	int inq;
+
+	ret = recvmsg(fd, &msg, 0);
+	if (ret < 0) {
+		perror("recvmsg");
+		exit(EXIT_FAILURE);
+	}
+
+	expect_res(ret, expected_ret, "recvmsg");
+
+	if (msg.msg_flags & MSG_CTRUNC) {
+		fprintf(stderr, "SCM_INQ control message truncated\n");
+		exit(EXIT_FAILURE);
+	}
+
+	for (cmsg = CMSG_FIRSTHDR(&msg); cmsg; cmsg = CMSG_NXTHDR(&msg, cmsg)) {
+		if (cmsg->cmsg_level != SOL_SOCKET ||
+		    cmsg->cmsg_type != SCM_INQ)
+			continue;
+
+		if (cmsg->cmsg_len != CMSG_LEN(sizeof(inq))) {
+			fprintf(stderr, "unexpected SCM_INQ length %zu\n",
+				(size_t)cmsg->cmsg_len);
+			exit(EXIT_FAILURE);
+		}
+
+		memcpy(&inq, CMSG_DATA(cmsg), sizeof(inq));
+		return inq;
+	}
+
+	return -1;
+}
+
+static void test_stream_so_inq_client(const struct test_opts *opts)
+{
+	int fd;
+
+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
+	if (fd < 0) {
+		perror("connect");
+		exit(EXIT_FAILURE);
+	}
+
+	control_expectln("SENT");
+
+	/* Wait for the whole payload to be queued, so the values below do not
+	 * depend on how the transport delivers it.
+	 */
+	if (!vsock_ioctl_int(fd, SIOCINQ, SO_INQ_BUF_LEN)) {
+		fprintf(stderr, "Test skipped, SIOCINQ not supported.\n");
+		goto out;
+	}
+
+	/* No ancillary data unless the option is enabled. */
+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, SO_INQ_CHUNK_LEN), -1,
+		   "SCM_INQ with SO_INQ disabled");
+
+	if (so_inq_set(fd, 1)) {
+		if (errno != ENOPROTOOPT) {
+			perror("setsockopt(SO_INQ)");
+			exit(EXIT_FAILURE);
+		}
+
+		fprintf(stderr, "Test skipped, SO_INQ not supported.\n");
+		goto out;
+	}
+
+	/* Partial read: the rest of the payload is still queued. */
+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, SO_INQ_CHUNK_LEN),
+		   SO_INQ_BUF_LEN - 2 * SO_INQ_CHUNK_LEN,
+		   "SCM_INQ after partial receive");
+
+	/* Draining read while the peer stays connected. */
+	expect_res(so_inq_recv(fd, SO_INQ_BUF_LEN - 2 * SO_INQ_CHUNK_LEN,
+			       SO_INQ_BUF_LEN - 2 * SO_INQ_CHUNK_LEN), 0,
+		   "SCM_INQ after draining receive");
+
+	control_writeln("DRAINED");
+	vsock_wait_remote_close(fd);
+
+	/* Nothing is queued once the peer is gone, but 1 is reported so the
+	 * caller keeps reading until it observes EOF, as TCP_INQ does.
+	 */
+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, 0), 1, "SCM_INQ at EOF");
+
+	if (so_inq_set(fd, 0)) {
+		perror("setsockopt(SO_INQ)");
+		exit(EXIT_FAILURE);
+	}
+
+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, 0), -1,
+		   "SCM_INQ after disabling SO_INQ");
+
+	close(fd);
+	return;
+
+out:
+	control_writeln("DRAINED");
+	close(fd);
+}
+
+static void test_stream_so_inq_server(const struct test_opts *opts)
+{
+	unsigned char buf[SO_INQ_BUF_LEN];
+	int fd;
+
+	fd = vsock_stream_accept(VMADDR_CID_ANY, opts->peer_port, NULL);
+	if (fd < 0) {
+		perror("accept");
+		exit(EXIT_FAILURE);
+	}
+
+	memset(buf, 'A', sizeof(buf));
+	send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
+	control_writeln("SENT");
+
+	/* Keep the connection open until the peer has drained the queue: an
+	 * early close would turn its last SCM_INQ value into the EOF one.
+	 */
+	control_expectln("DRAINED");
+	close(fd);
+}
+
+static void test_stream_so_inq_inherit_client(const struct test_opts *opts)
+{
+	unsigned char buf[SO_INQ_BUF_LEN];
+	int fd;
+
+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
+	if (fd < 0) {
+		perror("connect");
+		exit(EXIT_FAILURE);
+	}
+
+	memset(buf, 'A', sizeof(buf));
+	send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
+	control_writeln("SENT");
+
+	control_expectln("DONE");
+	close(fd);
+}
+
+static void test_stream_so_inq_inherit_server(const struct test_opts *opts)
+{
+	bool supported = true;
+	int listen_fd, fd;
+
+	listen_fd = vsock_stream_listen(VMADDR_CID_ANY, opts->peer_port);
+
+	/* Enable the option on the listener only. */
+	if (so_inq_set(listen_fd, 1)) {
+		if (errno != ENOPROTOOPT) {
+			perror("setsockopt(SO_INQ)");
+			exit(EXIT_FAILURE);
+		}
+
+		fprintf(stderr, "Test skipped, SO_INQ not supported.\n");
+		supported = false;
+	}
+
+	control_writeln("LISTENING");
+
+	timeout_begin(TIMEOUT);
+	do {
+		fd = accept(listen_fd, NULL, NULL);
+		timeout_check("accept");
+	} while (fd < 0 && errno == EINTR);
+	timeout_end();
+
+	if (fd < 0) {
+		perror("accept");
+		exit(EXIT_FAILURE);
+	}
+
+	close(listen_fd);
+	control_expectln("SENT");
+
+	if (!supported)
+		goto out;
+
+	if (!vsock_ioctl_int(fd, SIOCINQ, SO_INQ_BUF_LEN)) {
+		fprintf(stderr, "Test skipped, SIOCINQ not supported.\n");
+		goto out;
+	}
+
+	/* The accepted socket reports SCM_INQ without its own setsockopt(). */
+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, SO_INQ_CHUNK_LEN),
+		   SO_INQ_BUF_LEN - SO_INQ_CHUNK_LEN,
+		   "SCM_INQ inherited from the listener");
+
+out:
+	control_writeln("DONE");
+	close(fd);
+}
+
+static void test_so_inq_validation_client(const struct test_opts *opts)
+{
+	int fd;
+
+	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
+	if (fd < 0) {
+		perror("socket");
+		exit(EXIT_FAILURE);
+	}
+
+	if (so_inq_set(fd, 1)) {
+		if (errno != ENOPROTOOPT) {
+			perror("setsockopt(SO_INQ)");
+			exit(EXIT_FAILURE);
+		}
+
+		fprintf(stderr, "Test skipped, SO_INQ not supported.\n");
+		close(fd);
+		return;
+	}
+
+	if (!so_inq_set(fd, 2) || errno != EINVAL) {
+		fprintf(stderr, "SO_INQ accepted an out of range value\n");
+		exit(EXIT_FAILURE);
+	}
+
+	close(fd);
+
+	/* SCM_INQ counts bytes, which a message based socket cannot report. */
+	fd = socket(AF_VSOCK, SOCK_SEQPACKET, 0);
+	if (fd < 0) {
+		perror("socket");
+		exit(EXIT_FAILURE);
+	}
+
+	if (!so_inq_set(fd, 1) || errno != ENOPROTOOPT) {
+		fprintf(stderr, "SO_INQ not rejected on SOCK_SEQPACKET\n");
+		exit(EXIT_FAILURE);
+	}
+
+	close(fd);
+}
+
 static struct test_case test_cases[] = {
 	{
 		.name = "SOCK_STREAM connection reset",
@@ -2633,6 +2898,20 @@ static struct test_case test_cases[] = {
 		.run_client = test_stream_collapse_client,
 		.run_server = test_stream_collapse_server,
 	},
+	{
+		.name = "SOCK_STREAM SO_INQ functionality",
+		.run_client = test_stream_so_inq_client,
+		.run_server = test_stream_so_inq_server,
+	},
+	{
+		.name = "SOCK_STREAM SO_INQ inherited by accepted socket",
+		.run_client = test_stream_so_inq_inherit_client,
+		.run_server = test_stream_so_inq_inherit_server,
+	},
+	{
+		.name = "SO_INQ option validation",
+		.run_client = test_so_inq_validation_client,
+	},
 	{},
 };
 
-- 
2.55.0

