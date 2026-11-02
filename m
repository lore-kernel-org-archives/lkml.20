Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641450;
	b=PQZKevs+u7ERUsLRxUVsDrcvzpgHtBYbHgopeSR12SlayYdhUCLoS84oYq2WAi4G7cHF
	 UZTnR8+kag51Gcj8/gilHwH3vLnHuLZji+yyQ0XELm1+/ksqbQJbA8WLZLpToZCJoS28T
	 MA08F47xNgMIUvGwSmYsWsgBqps4tTAkUX8OxKGvHtwjOI8fTPcAS4DE5a7gkdNOBbktA
	 ZkLqVo2c28hVPXsbSEHE7ytQQaauiIdo8kNLUtmuVh5dtGPJdmnX6nhnFrA3XDZuncTy3
	 nH3SkhR/zobnSgVGKsOKRmARlJz7kzE2i+rfNHqCvAXZstJgipcWgoXab/w3EJcaZVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6kh38ixGlcMYvSMO0Cs+3boaaPdMbwOiDcXF3MCXi/8=;
	b=B+wV3ilVn0DOpgcRNMiJqWtA1Tz0sxylhTVEbwuOU+uo7PQJ5Oevh426+l6rIPqvcsLi
	 WtLHiNFDe+P70zDfjUJgjMUlYJHx8xkBWNeZQv6DDhO2LaUgbcKNgkQ/hqaWFxDYu6KWk
	 cRBTUqHmaZQk79kqsEa4U7Ghpwtss10CAUsQh45MgmqtEQuu6hcyz51Md5P+iuD23a6mu
	 WoDZamY/HkFLwY0OjArw8WgDBlcW7XmX+l/x05+OIwawzTbOi4IE1vY7oTEqA3DKTW4OE
	 crxdXCkQKGUVVRO01UlBlasUO8iOasPrD7zFgzRKKXsDkVeY3Ut0qAhL9zCY2zoHJlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKQ6Kvd0;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1BA606CED6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1BA606CED6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKQ6Kvd0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso26111355e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641448; x=1794246248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kh38ixGlcMYvSMO0Cs+3boaaPdMbwOiDcXF3MCXi/8=;
        b=hKQ6Kvd0L7OxCsZY0/Ws0yM2FBzcw9msSniKUmEiNafz20roJsUjZmZQnB+h+WNkZV
         Cj/5MJJgF5L9qSJxf8iUw3k2LIFBc2yqfBX+mU0/QJ5ACigyPXMGvMBFLtCMmg2IHaDe
         tdb7nncBLGSAfmn/jvQ5xhZ0007r9LZ0AoTjJQ0OUi9epEkNavOlQ5mWmBTniRCO5DbO
         Fn0+VyPSftAm31sQnO1UWG38o4WlwApsaQysdJYruxSFsn+YNJ6Dn64d+zHUK5grFL51
         +Zjsqf79P1n9+RHbXJFUcMoHqaQVhlcC+U4gkzAsyJNOf8KcuwsD+mYyTCrTOm5xDotr
         S+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641448; x=1794246248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kh38ixGlcMYvSMO0Cs+3boaaPdMbwOiDcXF3MCXi/8=;
        b=vh4Vw271oUcYYOggeInPxUZHQixOnSGybWmpZyaBmexf2WC7s+xR/9QKNrz9aG3nKu
         VEPftdiL4tm+yplbP3QSO7KbuuTd6eIdkpuOr98bOPnKFy4sO8nHF3fUzRNylbf7+O/l
         Q/g+m4sS0FHC1SSXQhK+SYX3N/ukfJR4LeKXX8ZjArpFCGTnk1NOPxFUi+LK2Vjx7MCy
         VRWSHZv58zrmqofdmw1z+YT2J6SWoDddQ5xaXfb60wH2ARV6Q91P/pOVFj6HnALdTJUD
         F9N3ugKkaBuumiqVO9mcsugQMLSCvr8iwvpRAt15iSnQDN+tAP7wJSbaSkvRJhoYepIM
         0Ipw==
X-Forwarded-Encrypted: i=1; AKwUvBzjO4GANpbQe91M2Q5mD4SCsjV5VTq9n0XxD20+1XvNsmcB/RrwHS+Cn7HUrgMFkbD+W0RO4ywQZNyE+hQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9lFJTEiCMpFPhdMjK2wPuZI1/5Z9X2T3IERK8lM6LRoBpwLpf
	2gDxdgm3KQ4G3o9O/UuP+zXOQkQcw6KbnypqqHRnFXKXB7S+uQoCJZF1
X-Gm-Gg: AYBFou3Gk0o+eqaVi8a9UPvTT68uigex3Gx3zbw2xC2FLjmYf0PLcOhSlbzfcsIX37j
	Ji5B0CvjRuONMXCWpbw+ZLKMceu11/ynD7AV8/9JCgd1/pByi/GS8VSpqEnUGIIa1soJqaYSrox
	pgWCi9qwY/eM4atUceEf77iVacpT0iYXpUZrgP2r8Yj+T5nenUpDrm54Y1r82AsI/J4z3Q2bI1j
	DQsFfSSv6XGBk1QaUdCtHyPxqwa0nPVJjSApWQn5Ow5LAFwSs2xnRzmAc2/fSW0EpWEKTAXK1ZI
	hGcb8xkWlqhGGpBKdK4o8NXbQgunBB5EgfcnJGEfPUiNVsJyAZjTX9E+MBtoQAs1yMi/nY6KBvN
	vBwKttVuyq4fFAk8E+QXnQybgqFueP8XTclhCN3ouUhCK7Z23CWmDrM53cBslF8Wdx8p4E18VXM
	4zuWJbcE7uazvXYPTGQ5/S81ww3eIdzJSeEnpALf7frcVWiaE6lzVO6nYW2cnFcjdLWc2eMG7f/
	95inpMxa0sJ4MChQ9i32Q+eADTAPQTr1uKpn4b0sOykhEqif/qKiP15p9S0LK4sXuD7jG9B5Te2
	ZHBg5i0cdzeKc1GuAFjz23oiWqrI7toS8aPBEQVgvP4YrMVMIyPSSLvrWAkh+7ceWd7pXCW2A7j
	j
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ac1548f591mr248457985e9.3.1793641447947;
        Mon, 02 Nov 2026 09:44:07 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm196311865e9.1.2026.11.02.09.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:07 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
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
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 5/5] selftests/bpf: Test gen loader attach
Date: Mon,  2 Nov 2026 17:43:50 +0000
Message-ID: <20261102174350.472592-6-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102174350.472592-1-mahe.tardy@gmail.com>
References: <20261102174350.472592-1-mahe.tardy@gmail.com>
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

Tests that nothing changes when only loading without attach, verifies
that unsupported program types return an error, and check that all
tracing program types successfully generate loader attach prog.

Then actually checks execution of the generated loader attach for two
LSM progs, verifying the links are correctly loading the appropriate
programs and that autoload=false and autoattach=false disable it.
Finally, checks that if one program out of many fails to attach, the
cleanup with detach is done correctly.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 .../bpf/prog_tests/gen_loader_attach.c        | 229 ++++++++++++++++++
 .../selftests/bpf/progs/gen_loader_attach.c   |  48 ++++
 2 files changed, 277 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c
 create mode 100644 tools/testing/selftests/bpf/progs/gen_loader_attach.c

diff --git a/tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c b/tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c
new file mode 100644
index 000000000000..1277709d7ef2
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Isovalent */
+#include <test_progs.h>
+#include <dirent.h>
+#include <bpf/skel_internal.h>
+
+#define NR_PROGS 7
+
+enum execution_case {
+	ATTACH,
+	NO_AUTOLOAD,
+	NO_AUTOATTACH,
+	ROLLBACK,
+};
+
+static int link_create_attr_offset(const struct gen_loader_opts *opts, int index)
+{
+	const struct bpf_insn *insns = (const void *)opts->insns;
+	int i, count = opts->insns_sz / sizeof(*insns);
+
+	for (i = 4; i < count; i++) {
+		if (insns[i].code != (BPF_JMP | BPF_CALL) ||
+		    insns[i].imm != BPF_FUNC_sys_bpf ||
+		    insns[i - 4].code != (BPF_ALU64 | BPF_MOV | BPF_K) ||
+		    insns[i - 4].dst_reg != BPF_REG_1 ||
+		    insns[i - 4].imm != BPF_LINK_CREATE)
+			continue;
+		if (!index--)
+			return insns[i - 2].imm;
+	}
+	return -1;
+}
+
+static struct bpf_object *generate(struct gen_loader_opts *opts, enum execution_case test)
+{
+	struct bpf_program *prog;
+	struct bpf_object *obj;
+
+	obj = bpf_object__open_file("gen_loader_attach.bpf.o", NULL);
+	if (!ASSERT_OK_PTR(obj, "open"))
+		return NULL;
+	prog = bpf_object__find_program_by_name(obj, "lsm_open");
+	bpf_program__set_autoload(prog, test != NO_AUTOLOAD);
+	bpf_program__set_autoattach(prog, test != NO_AUTOATTACH);
+	if (!ASSERT_OK(bpf_object__gen_loader(obj, opts), "gen_loader") ||
+	    !ASSERT_OK(bpf_object__load(obj), "generate"))
+		goto err_out;
+	return obj;
+
+err_out:
+	bpf_object__close(obj);
+	return NULL;
+}
+
+static void check_load_only(void)
+{
+	LIBBPF_OPTS(gen_loader_opts, opts);
+	struct bpf_object *obj;
+
+	obj = generate(&opts, ATTACH);
+	if (!obj)
+		return;
+	ASSERT_EQ(link_create_attr_offset(&opts, 0), -1, "no_link_create");
+	bpf_object__close(obj);
+}
+
+static void check_unsupported(void)
+{
+	LIBBPF_OPTS(gen_loader_opts, opts, .gen_attach = true);
+	struct bpf_program *prog;
+	struct bpf_object *obj;
+
+	obj = bpf_object__open_file("gen_loader_attach.bpf.o", NULL);
+	if (!ASSERT_OK_PTR(obj, "open"))
+		return;
+	prog = bpf_object__find_program_by_name(obj, "socket");
+	bpf_program__set_autoload(prog, true);
+	if (ASSERT_OK(bpf_object__gen_loader(obj, &opts), "gen_loader"))
+		ASSERT_EQ(bpf_object__load(obj), -EOPNOTSUPP, "unsupported_attach");
+	bpf_object__close(obj);
+}
+
+static void check_tracing_generation(void)
+{
+	LIBBPF_OPTS(gen_loader_opts, opts, .gen_attach = true);
+	struct bpf_program *prog;
+	struct bpf_object *obj;
+	int index = 0;
+
+	obj = bpf_object__open_file("gen_loader_attach.bpf.o", NULL);
+	if (!ASSERT_OK_PTR(obj, "open"))
+		return;
+	bpf_object__for_each_program(prog, obj)
+		bpf_program__set_autoload(prog, bpf_program__type(prog) == BPF_PROG_TYPE_TRACING);
+	if (!ASSERT_OK(bpf_object__gen_loader(obj, &opts), "gen_loader") ||
+	    !ASSERT_OK(bpf_object__load(obj), "generate"))
+		goto out;
+	bpf_object__for_each_program(prog, obj) {
+		const union bpf_attr *attr;
+		int off;
+
+		if (!bpf_program__autoload(prog))
+			continue;
+		off = link_create_attr_offset(&opts, index++);
+		if (!ASSERT_GE(off, 0, bpf_program__name(prog)))
+			goto out;
+		attr = (const void *)(opts.data + off);
+		ASSERT_EQ(attr->link_create.attach_type,
+			  bpf_program__expected_attach_type(prog), bpf_program__name(prog));
+	}
+	ASSERT_EQ(link_create_attr_offset(&opts, index), -1, "link_count");
+out:
+	bpf_object__close(obj);
+}
+
+static int count_fds(void)
+{
+	struct dirent *entry;
+	int count = 0;
+	DIR *dir;
+
+	dir = opendir("/proc/self/fd");
+	if (!dir)
+		return -errno;
+	while ((entry = readdir(dir)))
+		if (entry->d_name[0] != '.')
+			count++;
+	closedir(dir);
+	return count;
+}
+
+static void check_execution(enum execution_case test)
+{
+	LIBBPF_OPTS(gen_loader_opts, gen, .gen_attach = true);
+	struct {
+		struct bpf_loader_ctx ctx;
+		struct bpf_prog_desc progs[NR_PROGS];
+		struct bpf_link_desc links[NR_PROGS];
+	} ctx = { .ctx.sz = sizeof(ctx) };
+	struct bpf_load_and_run_opts run = { .ctx = &ctx.ctx };
+	struct bpf_object *obj;
+	int i, off, err, before;
+
+	obj = generate(&gen, test);
+	if (!obj)
+		return;
+	run.insns = gen.insns;
+	run.insns_sz = gen.insns_sz;
+	run.data = gen.data;
+	run.data_sz = gen.data_sz;
+
+	if (test == ROLLBACK) {
+		off = link_create_attr_offset(&gen, 1);
+		if (!ASSERT_GE(off, 0, "second_link_attr"))
+			goto out;
+		/* Force the second attachment to fail after the first succeeded. */
+		((union bpf_attr *)(gen.data + off))->link_create.attach_type = BPF_TRACE_FENTRY;
+
+		before = count_fds();
+		if (!ASSERT_GE(before, 0, "count_fds"))
+			goto out;
+		ASSERT_EQ(bpf_load_and_run(&run), -EINVAL, "second_attach_failed");
+		ASSERT_EQ(count_fds(), before, "rollback_fds");
+		goto out;
+	}
+
+	err = bpf_load_and_run(&run);
+	if (!ASSERT_OK(err, "run_loader"))
+		goto out;
+
+	for (i = 0; i < NR_PROGS; i++) {
+		struct bpf_link_info link = {};
+		struct bpf_prog_info prog = {};
+		__u32 size;
+
+		/*
+		 * Only the first two programs load by default; NO_AUTOLOAD also
+		 * skips the first. NO_AUTOATTACH must still return its program FD.
+		 */
+		if (i >= 2 || (!i && test == NO_AUTOLOAD)) {
+			ASSERT_EQ(ctx.progs[i].prog_fd, 0, "skipped_program");
+		} else {
+			size = sizeof(prog);
+			if (!ASSERT_GT(ctx.progs[i].prog_fd, 0, "program_fd") ||
+			    !ASSERT_OK(bpf_prog_get_info_by_fd(ctx.progs[i].prog_fd, &prog, &size),
+				       "prog_info"))
+				continue;
+		}
+
+		/*
+		 * Unloaded programs have no link. NO_AUTOATTACH also leaves the
+		 * first program's link slot zero, even though its program is loaded.
+		 */
+		if (i >= 2 || (!i && (test == NO_AUTOLOAD || test == NO_AUTOATTACH))) {
+			ASSERT_EQ(ctx.links[i].link_fd, 0, "skipped_link");
+			continue;
+		}
+		/* Verify the link references the corresponding loaded program. */
+		size = sizeof(link);
+		if (!ASSERT_OK(bpf_link_get_info_by_fd(ctx.links[i].link_fd, &link, &size),
+			       "link_info"))
+			continue;
+		ASSERT_EQ(link.prog_id, prog.id, "attached_program");
+	}
+out:
+	for (i = 0; i < NR_PROGS; i++) {
+		skel_closenz(ctx.links[i].link_fd);
+		skel_closenz(ctx.progs[i].prog_fd);
+	}
+	bpf_object__close(obj);
+}
+
+void test_gen_loader_attach(void)
+{
+	if (test__start_subtest("load_only"))
+		check_load_only();
+	if (test__start_subtest("unsupported"))
+		check_unsupported();
+	if (test__start_subtest("tracing"))
+		check_tracing_generation();
+	if (test__start_subtest("execute"))
+		check_execution(ATTACH);
+	if (test__start_subtest("execute_no_autoload"))
+		check_execution(NO_AUTOLOAD);
+	if (test__start_subtest("execute_no_autoattach"))
+		check_execution(NO_AUTOATTACH);
+	if (test__start_subtest("rollback"))
+		check_execution(ROLLBACK);
+}
diff --git a/tools/testing/selftests/bpf/progs/gen_loader_attach.c b/tools/testing/selftests/bpf/progs/gen_loader_attach.c
new file mode 100644
index 000000000000..9a38fe4ac7bb
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/gen_loader_attach.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Isovalent */
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+
+SEC("lsm/file_open")
+int lsm_open(void *ctx)
+{
+	return 0;
+}
+
+SEC("lsm/file_permission")
+int lsm_perm(void *ctx)
+{
+	return 0;
+}
+
+SEC("?socket")
+int socket(void *ctx)
+{
+	return 0;
+}
+
+SEC("?fentry/security_inode_getattr")
+int fentry(void *ctx)
+{
+	return 0;
+}
+
+SEC("?fexit/security_inode_getattr")
+int fexit(void *ctx)
+{
+	return 0;
+}
+
+SEC("?fmod_ret/security_inode_getattr")
+int fmod_ret(void *ctx)
+{
+	return 0;
+}
+
+SEC("?tp_btf/sys_enter")
+int tp_btf(void *ctx)
+{
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
--
2.43.0

