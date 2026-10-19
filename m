Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424270;
	b=BZVWoD/ZuN5MK/7c+ShogFlYHJSlhL7GANmM1pPEwnlqqVyeoGUaEJXgUOOIz5Zt+W/R
	 +PaE/wJbfNzYmWgiBBHEmZqj28ZLI657UyKtsWhycrmDpW418ergTds6oT8mvakg2+zcJ
	 oANpgHVfCgNpS349fe24fPr1YVN5s80O+DPkDiDhNzM61lU9eqo43bgJ6mIJZoBPWtVhi
	 8gxmK91NyReROHo7/7NJJHxqsyMt/B5gB9moMCfkFS+j0TzsV6Jb7bhcBsk11txM614r7
	 2twP0efUBGhWQ7ZU/N4sB6MuirXEdb8i2fSU3DyuoyqLo0TWUFls20nXhUVsT0lurBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424270;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9GDFV35RrSVf5yP47jS+7rs1H7n+XBgiZq3zykV+XtQ=;
	b=zm8DSVGzaitMX0RjMmqIClieI8NaaLcoFSxOrgfh6Zchz7O/21rgiFT9oSe0h4AUYFOC
	 gNXDp4j/Xz4CNuuO/2Br9qtTHLY4SFivNbLHgXwL23WNpusUr51mdo6DgHJ1T0s9OCM3r
	 B05f0k8H/G0mrUqaD5MuDc+aGpcJ3utO5W3zDjcOtjUNyG9DTQfR6CaYlwIU6mgqBdfLb
	 saFFbYBNUwkmiyyX5+jJtq8qDT2eL6z26i4pI7BdPSHOaML+ZhZjMdGwJA7dhPpbI2uL3
	 tzDQW2E+zmwtyQctB8mkUUoBQrZjG863jh6Zau9bMr/zUH5in40+4UCc4aFvwlnIbMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=abJudIif;
	arc=none smtp.remote-ip=95.215.58.117
Received: from mta1.migadu.com (out-117.mta1.migadu.com [95.215.58.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E9D60774E8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E9D60774E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=abJudIif
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qDoOdKi6oKQdzWjw9ttiqe9bR4kfbpGeSoHF507AHt0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792424267; v=1; x=1793029067;
 b=abJudIifdqiqorxkeCIJGPWF9qW+47bZo8UjVm19X+kdltm2ERiOdbyqJJkmHL3XGS+UZJ4P
 Yv9WOL6WBvtu7aHiLM+a1o0sVwMXxNrJS5gruurlyOd4cr3ozjtmkFA88sV7QZWI3irFQvCcJcH
 2/cCAj57uOASLTx7sM6w52yM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6d9efb940e6379e3;
	Mon, 19 Oct 2026 15:37:47 +0000
X-Mizu-Trace-ID: 6d9efb940e6379e3
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Masashi Honma <masashi.honma@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>
Subject: [PATCH bpf-next v2 6/6] selftests/bpf: Add tests to verify link_create logs
Date: Mon, 19 Oct 2026 23:36:28 +0800
Message-ID: <20261019153628.15912-7-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019153628.15912-1-leon.hwang@linux.dev>
References: <20261019153628.15912-1-leon.hwang@linux.dev>
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

Add tests to verify the new logs in link_create and xdp link_create,
including a log reported via extack when fail to create an xdp link.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 .../selftests/bpf/prog_tests/xdp_link.c       | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_link.c b/tools/testing/selftests/bpf/prog_tests/xdp_link.c
index e7e9f3c22edf..18c1f1039d4e 100644
--- a/tools/testing/selftests/bpf/prog_tests/xdp_link.c
+++ b/tools/testing/selftests/bpf/prog_tests/xdp_link.c
@@ -150,3 +150,104 @@ void serial_test_xdp_link(void)
 	test_xdp_link__destroy(skel1);
 	test_xdp_link__destroy(skel2);
 }
+
+static void test_link_create(int prog_fd, int ifindex, enum bpf_attach_type attach_type,
+			     struct bpf_link_create_opts *opts, int exp_err, const char *msg)
+{
+	char log_buf[128] = {};
+	int fd;
+	LIBBPF_OPTS(bpf_log_opts, log_opts,
+		    .buf = log_buf,
+		    .size = sizeof(log_buf),
+		    .level = 1,
+	);
+
+	fd = bpf_link_create_log(prog_fd, ifindex, attach_type, opts, &log_opts);
+	if (!ASSERT_LT(fd, 0, "bpf_link_create_log")) {
+		close(fd);
+		return;
+	}
+
+	ASSERT_EQ(fd, exp_err, "fd");
+	ASSERT_STREQ(log_buf, msg, "log_buf");
+	ASSERT_EQ(log_opts.true_size, strlen(msg) + 1, "log_size");
+}
+
+static void test_link_create_invalid_prog_fd(void)
+{
+	const char *msg = "Invalid prog_fd.\n";
+
+	test_link_create(-1, IFINDEX_LO, BPF_XDP, NULL, -EBADF, msg);
+}
+
+static void test_link_create_invalid_prog_type(void)
+{
+	const struct bpf_insn insns[] = {
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+	const char *msg = "Invalid prog type.\n";
+	int prog_fd;
+
+	prog_fd = bpf_prog_load(BPF_PROG_TYPE_LIRC_MODE2, NULL, "GPL", insns,
+				ARRAY_SIZE(insns), NULL);
+	if (!ASSERT_GE(prog_fd, 0, "bpf_prog_load"))
+		return;
+
+	test_link_create(prog_fd, 0, BPF_LIRC_MODE2, NULL, -EINVAL, msg);
+
+	close(prog_fd);
+}
+
+static void test_link_create_attach(int ifindex, enum bpf_attach_type attach_type,
+				    struct bpf_link_create_opts *opts, const char *msg)
+{
+	struct test_xdp_link *skel;
+
+	skel = test_xdp_link__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "test_xdp_link__open_and_load"))
+		return;
+
+	test_link_create(bpf_program__fd(skel->progs.xdp_handler), ifindex, attach_type, opts,
+			 -EINVAL, msg);
+
+	test_xdp_link__destroy(skel);
+}
+
+static void test_link_create_invalid_attach_type(void)
+{
+	const char *msg = "Invalid attach_type.\n";
+
+	test_link_create_attach(IFINDEX_LO, BPF_CGROUP_INET_INGRESS, NULL, msg);
+}
+
+static void test_link_create_xdp_invalid_target_ifindex(void)
+{
+	const char *msg = "Invalid target_ifindex.\n";
+
+	test_link_create_attach(0, BPF_XDP, NULL, msg);
+}
+
+static void test_link_create_xdp_extack(void)
+{
+	const char *msg = "Invalid XDP flags for BPF link attachment\n";
+	LIBBPF_OPTS(bpf_link_create_opts, opts,
+		    .flags = XDP_FLAGS_REPLACE,
+	);
+
+	test_link_create_attach(IFINDEX_LO, BPF_XDP, &opts, msg);
+}
+
+void test_link_create_log(void)
+{
+	if (test__start_subtest("invalid_prog_fd"))
+		test_link_create_invalid_prog_fd();
+	if (test__start_subtest("invalid_prog_type"))
+		test_link_create_invalid_prog_type();
+	if (test__start_subtest("invalid_attach_type"))
+		test_link_create_invalid_attach_type();
+	if (test__start_subtest("xdp/invalid_target_ifindex"))
+		test_link_create_xdp_invalid_target_ifindex();
+	if (test__start_subtest("xdp/extack"))
+		test_link_create_xdp_extack();
+}
-- 
2.55.0

