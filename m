Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C94EC66E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079040; cv=none; b=rqb6l4X0eYgPOLkDaYT/xM7tJj/thcOn7ANDECx7IZfNElSWeD9eurKvQOp1zkVuLas0Rw+QBAgwVqEp6MgaBdKinnF2bIkLsZ1LiF3GTynzJiG3E645WWuNz2Ue+dIlnIV/I3X7m7zlIOQ/2LeE3m9URyT6dNzkFt1f0cceIhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079040; c=relaxed/simple;
	bh=cjliimpdVuKniQW64DNaS43E2VHJ8S1ZygL4W+E5f/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvBcGgU9KZJ6ixehzh/3nJp0AShm0O2zkllRoom3y9tMCiJVnCPALodiRlrXSBNpfKEqmqZZGV68T9uSlsOBQWOpU0zsdlT4q6NqVgkG0HyqrjfThPML/q2wh83/qSSEzSqGANvTtVPtX6Xw2zqE6Ix+f+ZnZILcw8esKslsME8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkWxiP7M; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkWxiP7M"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a061a13884so45731505e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792079023; x=1792683823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J5a55Pg+YpfFRUGFYyLBsKQw7Ye+GLO4/t3xMgXcbc=;
        b=CkWxiP7Mpk9fhu/Mu3Niws5Z5yVCJoICnABrUNgzwnKjnInJahWcjhX8uNn24Q8NIh
         DweEFXUK5pBhsVuiNazJvteBf/rmxo3jHCG5fNKSHDbF98WRIV90wPlN+w9U9mo9nMkl
         2R9QZhjDU2jQx0st2wnmUDlvl2o7+CteJk42UTQwyf8KuArbVHYuoxTOwlAXTs9NDwcb
         NCDKoSROGI7IQhMH8KYvBiM/v/wo9tbmaP6tOne1Arj+o1/bz4sQWiHlbkqd2o5nurGQ
         HM6nbPR6POx+FQKO73K5xML/OGKBpATEpS+JlbxBmbhWhvzS/wKC+mfxfMCd7LEpTSUq
         W2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079023; x=1792683823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5J5a55Pg+YpfFRUGFYyLBsKQw7Ye+GLO4/t3xMgXcbc=;
        b=C0hPcjWNop1UGi4HmLmB6hmPfebVmpispN8FLYWGYL0Bf2Lta6umfjOBv+p3zm6Iku
         s65wBA5e+BOtv+gJWKRAu5xIuyOWtB3hhEgTHSq4xCq8EbQCGk2jFHBMwMSodDfpn6yE
         p/alY7pJijwiQ7eAIglohoAU9rVHNgeMinEM5bN17lmYi5rw1QhTFi8J+A0Zp+HwBXGg
         Aw4Rg6V0uqggcV+YPdsev4YjBRJ5m3LnRySZ085WHKzX3BqAxIznVsRxPIds1yAKPcBX
         i/iju4hTwV0s1DD72TUwwCQGlL/Z1NwQ6qYUzXZV1NO+mseighM8moGmjIFg08VralbN
         JfJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzCqxdxGMwYM6A/nsStKepwAGkZp1b2WYeb26ClZtcqwgu8HMqfwHBSFrLHFimMtEBp8t9RhBpr6SX6q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWLd7XaDtHBqFyNsRCIUL91R1mMJF6xSrGMQVdcFSDPeWLFtmX
	RICFG+N9sOzEwnKgt1BCH0iEkFK+MVQMuFzQBJmOl/fB1KFyZr3nPosM
X-Gm-Gg: AYBFou2rZ91psE8X7/7VQa0X1X7wQzEXtMUaEdXC9e15qAj76lt6LUVMB0MPM+WajfS
	dvJarejgHCKl8QFuUsyCc2bY2WSyYohA0NnwvzyewHson8NDyCmK0R1aIzEYxXtPD/Z7QUYWtfJ
	O4zsr5Edpc0xuablITDim3eY3JnYqPmlof8BK7jhfme+tvBA0b4C4lmBvrotEKcEiavCAV2dxFM
	iU2p5v9Au1RBeGowWkgJttWvp5rc/SV6IAATzsA/hDwLBi3xwleLqneWl6F+JcLLhaI1Vn4p2iW
	kfjFwvbfnhLf817gZZDI7yUWDn4RQbaEDLj+/gEQLKhQJbKLZNLzHDTqNK8o2VLuH4N3RVzMQaU
	z+OSHa3GKGp8gOtP1luKDL+UFGhyhkoqxzJaEHAFa6t5rDrs7eDhXyQsMb4+NDe2Z+g8YwULE3b
	a+VyQ5eqI1KTnUxFlHLvzEh1CNOjl58VY3bewDS7/jAxSbJYsw6NAh3UgROC0DSRTHWHMpUikSF
	R1ncxdGkmN7TMK0hzFxrcwbsOB00GPNKOlFlF9FqrLBmUyeA0nYuirbq7E=
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr365881315e9.26.1792079023060;
        Thu, 15 Oct 2026 08:43:43 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd640be0sm61940825e9.1.2026.10.15.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:43:41 -0700 (PDT)
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
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net-next v2 2/2] vsock/test: cover SO_INQ
Date: Thu, 15 Oct 2026 16:43:34 +0100
Message-ID: <20261015154334.3217358-3-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015154334.3217358-1-devnexen@gmail.com>
References: <20261015154334.3217358-1-devnexen@gmail.com>
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

