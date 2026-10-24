Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856255;
	b=5EE+hAVBU6OoURImBJhmQpkbPKaVuCR/+mblRDG4SdnE6hZiNibHWqcXqFX1hD7yn5jZ
	 VhzZWHwdC1EoG6vLaTAfOiae14TOrppQKGvTYDBiJghIEAbYx0eK2vGNU4QkEAst82COC
	 hQbYr1sdLWd7UJ3P3ULHqGuPRJRmdnvJYdLmqFmNszGUa0ZWf6guPmUTmKGtbxfiJ5QMG
	 2dhx7GxjWnV8t5H90nmOQ/6RL9bCOVV2Fa2MSLZOLzdlIG7667OEOYB6Iql3bwuAZaI9t
	 74MRRN7j50iiswMU6wpyzXJQKHw0sBipvCR6D9d02XTMoX5haY25SzTwJzGCz/vgsAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856255;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0snQJAJEeIQvzghZPviPgsDMbmQk5aO0CmuvXYpWi4A=;
	b=1y4/H9pUcu7nIP0JQfH7Vh1AaK8js4jwx1RVnPKFJRUyljqpNF0Lws8ARcjrF1QOdwIf
	 lxCjpwYCJKksEvcAlXILoT5SwUyf4WR3CVXkRb/giqT9F7lRN2JA+Jhp7YCES/sI/IWfn
	 xdwZ75cek7McZVKOnBDpGg5oUek+Gt2fiE8S6/nro3VO0UmrUdUX3P8Akql2PidtVvcBD
	 mzzy28LXSv70+dGufdb+XUdgFkVr/RjMQ6OUJy+r+smiXVRbm2ToJofFlHNcxRhlhQZaE
	 iVz1T+hDEykZURQ6ALn9VJBIwREKLLM/LybA+nO7XEvAFshuDx7+H2999j/mnUgkBnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xw3gLBwg;
	arc=none smtp.remote-ip=91.218.175.227
Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC031606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC031606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xw3gLBwg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nEQMMNENapKXlnk+aM8jOHITclygvSpZEqoOyChWqzA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792856253; v=1; x=1793461053;
 b=xw3gLBwgyx3GGigjTt1ucX5hmJ6m43s3xV4VHU9Io3J2Y0ng58Sj26bGE5Baf/i7izqUNqvx
 yrCOukLjX2ZeT7+mQb3Y39uYLC10BrNf7LG2vVBijilkSCKWmeMsiraDLZ/wSOBVysiLWJqMpa9
 QlZHaL0XMnhhbjrPIh0fnlgw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 54e1ff86750f1880;
	Sat, 24 Oct 2026 15:37:33 +0000
X-Mizu-Trace-ID: 54e1ff86750f1880
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
Subject: [PATCH bpf-next v4 6/6] selftests/bpf: Add tests to verify link_create logs
Date: Sat, 24 Oct 2026 23:36:07 +0800
Message-ID: <20261024153608.58569-7-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024153608.58569-1-leon.hwang@linux.dev>
References: <20261024153608.58569-1-leon.hwang@linux.dev>
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
 .../selftests/bpf/prog_tests/xdp_link.c       | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_link.c b/tools/testing/selftests/bpf/prog_tests/xdp_link.c
index e7e9f3c22edf..d1bca773ca2f 100644
--- a/tools/testing/selftests/bpf/prog_tests/xdp_link.c
+++ b/tools/testing/selftests/bpf/prog_tests/xdp_link.c
@@ -150,3 +150,105 @@ void serial_test_xdp_link(void)
 	test_xdp_link__destroy(skel1);
 	test_xdp_link__destroy(skel2);
 }
+
+static void test_link_create(int prog_fd, int ifindex, enum bpf_attach_type attach_type,
+			     __u32 flags, int exp_err, const char *msg)
+{
+	char log_buf[128] = {};
+	LIBBPF_OPTS(bpf_log_opts, log_opts,
+		    .buf = log_buf,
+		    .size = sizeof(log_buf),
+		    .level = 1,
+	);
+	LIBBPF_OPTS(bpf_link_create_opts, opts,
+		    .flags = flags,
+		    .log_opts = &log_opts,
+	);
+	int fd;
+
+	fd = bpf_link_create(prog_fd, ifindex, attach_type, &opts);
+	if (!ASSERT_LT(fd, 0, "bpf_link_create")) {
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
+	test_link_create(-1, IFINDEX_LO, BPF_XDP, 0, -EBADF, msg);
+}
+
+static void test_link_create_invalid_prog_type(void)
+{
+	const char *msg = "Invalid prog type.\n";
+	const struct bpf_insn insns[] = {
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+	int prog_fd;
+
+	prog_fd = bpf_prog_load(BPF_PROG_TYPE_LIRC_MODE2, NULL, "GPL", insns,
+				ARRAY_SIZE(insns), NULL);
+	if (!ASSERT_GE(prog_fd, 0, "bpf_prog_load"))
+		return;
+
+	test_link_create(prog_fd, 0, BPF_LIRC_MODE2, 0, -EINVAL, msg);
+
+	close(prog_fd);
+}
+
+static void test_link_create_attach(int ifindex, enum bpf_attach_type attach_type, __u32 flags,
+				    const char *msg)
+{
+	struct test_xdp_link *skel;
+
+	skel = test_xdp_link__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "test_xdp_link__open_and_load"))
+		return;
+
+	test_link_create(bpf_program__fd(skel->progs.xdp_handler), ifindex, attach_type, flags,
+			 -EINVAL, msg);
+
+	test_xdp_link__destroy(skel);
+}
+
+static void test_link_create_invalid_attach_type(void)
+{
+	const char *msg = "Invalid attach_type.\n";
+
+	test_link_create_attach(IFINDEX_LO, BPF_CGROUP_INET_INGRESS, 0, msg);
+}
+
+static void test_link_create_xdp_invalid_target_ifindex(void)
+{
+	const char *msg = "Invalid target_ifindex.\n";
+
+	test_link_create_attach(0, BPF_XDP, 0, msg);
+}
+
+static void test_link_create_xdp_extack(void)
+{
+	const char *msg = "Invalid XDP flags for BPF link attachment\n";
+
+	test_link_create_attach(IFINDEX_LO, BPF_XDP, XDP_FLAGS_REPLACE, msg);
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

