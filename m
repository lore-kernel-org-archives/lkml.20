Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029899;
	b=iRCH+inV9axgfbEJE1aL/YTYtdqwvAyQbqgbPBcboMu9zp4i/yVAFDrsNf6tsbBHOD/f
	 +tFbnK1qModBsqUGZb2k+RPOeoN75FCrn/zKnS/c7jIpg2J4pV8Kwl9LxA3ie43U2dbwO
	 Bxal2ajwt0UabE8rvcNHusGFQs0EvXmFKoUuE7XGRIoGDZPAnX4+NKJ0fc7S87W3OuPDl
	 zpSUTBmj7qEY74aDaFTEmvw4L/0TQOT5FZ8mdCVAZw6R1/wfM2R17yWYlxP6fTeopxbvB
	 o3gml2LnnR2YWZw9E9Qma/yCvooR8oib1l5+tvNJNb3m7jLcxrHV8eCEqXkgyu+04oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029899;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0snQJAJEeIQvzghZPviPgsDMbmQk5aO0CmuvXYpWi4A=;
	b=H+qeo7nyMPQ6HZKE7cs9zEXJmifmnQlRR24/656rIWMwWyu1Ug4z139yi+U0vmOY52Kg
	 OXmwNceQ+RppnTWquB78N1u2pi5JzEs0KH8nvjlWO3D75OBefk2Sx3l9hZPr7Z54dhXc9
	 MNCuQ8jqHiODbuptkABJGpy63jDytREjy+dZWjg/UbrkUSsRy2OqZhtEpRzvN8Aq3b9QD
	 LhIPz+5s2waV/CLJzZj37SZLe2RUgxuiTjVGl6ldKHeMkqbmLSLo/zrswlYjzZBC5sQv2
	 rJ3DKtNLI08fjl/K8+meDBWnmOvt3/salOUT6xDb0mYbI3L1LsYRfrLAP/x3M4e1w6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="bk/TjMvS";
	arc=none smtp.remote-ip=95.215.58.68
Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE604606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE604606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bk/TjMvS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nEQMMNENapKXlnk+aM8jOHITclygvSpZEqoOyChWqzA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793029896; v=1; x=1793634696;
 b=bk/TjMvSLhLZL9GOaI10XFYMXI/mflMlCnbdcR9fGIwFr/6bQ3TPnqNie+s5AT9pSOLt8GUp
 0H8U+ftPDu1KRrax0Z6Y9gzINHA0LNF0R2pnqlvK+Hs+SPdwdRwC9NMVTvWd/uxq4egpIk1gtqE
 8mzn8X+TW8Fp2FYPz9kurNOs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6aa1d76db48e3061;
	Mon, 26 Oct 2026 15:51:36 +0000
X-Mizu-Trace-ID: 6aa1d76db48e3061
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
Subject: [PATCH bpf-next v5 6/6] selftests/bpf: Add tests to verify link_create logs
Date: Mon, 26 Oct 2026 23:49:47 +0800
Message-ID: <20261026154948.99408-7-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026154948.99408-1-leon.hwang@linux.dev>
References: <20261026154948.99408-1-leon.hwang@linux.dev>
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

