Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998328;
	b=MezQR/6Rcr9ejn0B6Q9Xmr9+FHRSBODzUaioNVooD3qH+HFvsUj81yT7BO/hMQ8lkeSy
	 joLpF2f7qWJWpPz/KRaHG5/UCWLgNgT8ErUk4LTr2KnIyAEygtcDek9Qi/+AJlh+sxmvt
	 GWTCZuhY7QNlU9Q1Q+kAdfeF8LO9HwEAIKvZ1KwEeuH6cLdUzbnQLQWyaFDnysB4L8KGk
	 hYBBhbJLqTwj/ofUTrYBimiaWUD+o/uftl60Fumoxb6ewVP+sKLFRB8NcUo+IpIBFBVI4
	 GrZGcGPan1w02uAs+x1Mj2lqR3R7QBGtlsyiDWZyz6BclHoWZ5yXbpbEZM/kTXGcCxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HNNUOPHHRYuxX8ALTNMCrNB0wz+vFOtJtbEqpRjOoKE=;
	b=ZH7i3oDepTHY4cK9T+tkRwPTmwkxtgOmHe2O/LzifPURZQNJeSGEvVwuPkmqwSrlonoQ
	 dQLdNuI3odNeoCB91ccFeHj9Ud0B4xBDaZ0AFvgyFRKFhk7oXWyXznOZCQpg4pMYbAVyl
	 xbgmnojqAu/RjQ3XaereMQFVXh37EZNQN1bJTzm8N1zCXf2f6h44ulBiHWJIydQkJEYFM
	 bNb0ofjfSj5xDT7CTpMz+bb+w8z/5EJOb296SQpy65DuGhoqw18Tjr3q60ihH5kAWdxfs
	 Qv+2K3VBCEFhkZfrHjPSPutQBsM5kQmIjTiD0pV6oq5FEuvkGlX/8/gfDR9ZG/b16gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJ7WAfN;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E6F606D80A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E6F606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJ7WAfN
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10849905e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998326; x=1794603126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNNUOPHHRYuxX8ALTNMCrNB0wz+vFOtJtbEqpRjOoKE=;
        b=yYJ7WAfNTO5tjRImOOntLjaogzJzpPVq15mqX+gfJaSPOl3HCTXgz/opq27jeW7nlT
         +75Gi70VA4fJMV5Qg/WB7KMP0VbHxWehdp0p+o0vK5IWrStn83wqqInGIlym3EeFtUaU
         xDLG429chQ2U1yn38q+053HC6lTBwbYhuOneDFz6FnBpDsXvAnexdCvuO2cfte3aH9j+
         SEZLwEoF9EL+4ps7ova8DSGX5g6Ab1SxFNG4kvt00T1vqXwkVvBkELx0AGO1Kr5p9qAS
         CoCF2yQ0Jdk50wZ698CzGG2kISwZV/cDhAgUGstGlTaPqjmJUimixEMkZlydGmKppH8+
         v0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998326; x=1794603126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HNNUOPHHRYuxX8ALTNMCrNB0wz+vFOtJtbEqpRjOoKE=;
        b=1jdNdfIaL48ciLArLS2/4ohpX1ddrhX8QtIwVUpx9LDkED80i+gmvexo+PBFjY90sh
         PRC7bdLKUWQa9mFAF3s9N3DOhZnfvIJICaJaaeGRk9n/VozAn9A8lLCYMQx8pAbDF0nU
         5BBA5JWNGKodBxFQ1PN97Z6Me7/wdAB9ik8ocpqshQ4mjsNMt6JddFJT3P+N1s1ml5Ol
         t8W5oP8XmiyUO5gduMrQKESbllPzJF4EC5RyroWXQbcNkCACFS0/NKOj3oSQoDJpLqeU
         eB/V0+xj5MBdHeYlOvqRD15YlMJmQgVZBdWWX47Gv+dSRWDkQCZFziz3fa3hyc5t0l4k
         jQKA==
X-Forwarded-Encrypted: i=1; AKwUvBz9x+k/42iL/CWtU5XMwvR72oJiGmTmAuhZNi5byJJHHef73gzp39+CfyDSdCnvYaJZrf8vptzrSSk+hSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a0ATyI4FQp6wcYG4kfTFkwKpzynyT3dMF3YTsEzOhklPH+Piw
	AW1SgLwU4tyWnCcd5PqXcn4veb0WGYwDyYzg9O+z2F3Vh0LUGm8a9NIM
X-Gm-Gg: AYBFou2ywyoJhp3I+d0TKNPzLh34+E6/EnV1RyJvrZSNbB9Ohsi3ujupV0Obu0oWwu2
	5pUPdaev7Y4jnVkJKazGWMZuFgnAa+Y/ViROB6yuYoUa0zyBDThGRoi7iTOzPePqZ5vvfNGbmjE
	9p3pcTpydeuB80wYk0hmB7/bwRFN5Vxv9VcXdh/CSIdAGse7XM8HFyCANhpE1KhRs1bD7czpjlG
	UfRNMWr7dRq0ZTKQOlHIm5gRtbzCKJV8AYhtcun/QzjmegfazlBHKMmt+fhxGHulBx+TO/8SBGM
	1S1JWs6kcDaIkWiaEzkUCO5Sj9RDos8yc3EXGJqW7kwmIGx5AhjPNe+WG66lgXuhTPDHH7PJ+Dr
	7+E3cBwUbeQX90zQGNLhMDUZFmoEUkuLntA8OxCChiTGLSY26Nv2ZxYPy5K3CWcACCNdcP7psah
	Meo8d/OeqDoPaF2vbmwmtXi41zblSGCB0mKHOVZBMgNOW9TE6q4UrXH1NT7HUxLM4b/O8DcOwvm
	Svap/2kd3lqk9sDaTNMVmYN+i8W9S9hFf6dbFsEQXBC1KZIpcdoTNmxqb5v3KlE90g3z2UwAZ1U
	dkDYXLv5qts1QXkEeiCu6Zk3zzYJy65lUARSUz1+yjt0e4w=
X-Received: by 2002:a05:600c:4f4a:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4b6e017248dmr63509255e9.30.1793998326226;
        Fri, 06 Nov 2026 12:52:06 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:05 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v1 bpf-next 06/18] selftests/bpf: Test fmod_ret BTF decl tags and attach permission
Date: Fri,  6 Nov 2026 21:02:55 +0000
Message-ID: <20261106210314.1767267-6-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 20261106205523.1765622-1-a.s.protopopov@gmail.com
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
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

Check that resolve_btfids tags the fmod_ret targets of vmlinux and of
bpf_testmod with "bpf_fmodret", that only bpf_fentry_test1 has the
"bpf_fmodret_sleepable" tag, and that a function which is not a target
has none.

Load minimal fmod_ret programs to check that the kernel builds its
target set from the tags: a target loads, a function which is not a
target does not, and sleepable programs load only for the sleepable
target.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 .../selftests/bpf/prog_tests/fmodret_tags.c   | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/fmodret_tags.c

diff --git a/tools/testing/selftests/bpf/prog_tests/fmodret_tags.c b/tools/testing/selftests/bpf/prog_tests/fmodret_tags.c
new file mode 100644
index 000000000000..62efe11af826
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/fmodret_tags.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <test_progs.h>
+#include <linux/filter.h>
+#include <bpf/btf.h>
+
+#define TAG_FMODRET		"bpf_fmodret"
+#define TAG_FMODRET_SLEEPABLE	"bpf_fmodret_sleepable"
+
+static bool func_has_tag(const struct btf *btf, const char *func, const char *tag)
+{
+	int func_id, id, nr_types;
+
+	func_id = btf__find_by_name_kind(btf, func, BTF_KIND_FUNC);
+	if (func_id < 0)
+		return false;
+
+	nr_types = btf__type_cnt(btf);
+	for (id = 1; id < nr_types; id++) {
+		const struct btf_type *t = btf__type_by_id(btf, id);
+
+		if (!btf_is_decl_tag(t) || t->type != func_id ||
+		    btf_decl_tag(t)->component_idx != -1)
+			continue;
+		if (!strcmp(btf__name_by_offset(btf, t->name_off), tag))
+			return true;
+	}
+
+	return false;
+}
+
+static void test_vmlinux_tags(void)
+{
+	struct btf *btf;
+
+	btf = btf__load_vmlinux_btf();
+	if (!ASSERT_OK_PTR(btf, "btf__load_vmlinux_btf"))
+		return;
+
+	ASSERT_TRUE(func_has_tag(btf, "bpf_modify_return_test", TAG_FMODRET), "modify_return_test");
+	ASSERT_TRUE(func_has_tag(btf, "bpf_modify_return_test2", TAG_FMODRET),
+		    "modify_return_test2");
+	ASSERT_TRUE(func_has_tag(btf, "bpf_modify_return_test_tp", TAG_FMODRET),
+		    "modify_return_test_tp");
+	ASSERT_TRUE(func_has_tag(btf, "bpf_fentry_test1", TAG_FMODRET), "fentry_test1");
+	ASSERT_TRUE(func_has_tag(btf, "update_socket_protocol", TAG_FMODRET),
+		    "update_socket_protocol");
+
+	/* Only bpf_fentry_test1 is a sleepable target */
+	ASSERT_TRUE(func_has_tag(btf, "bpf_fentry_test1", TAG_FMODRET_SLEEPABLE),
+		    "fentry_test1_sleepable");
+	ASSERT_FALSE(func_has_tag(btf, "bpf_modify_return_test", TAG_FMODRET_SLEEPABLE),
+		     "modify_return_test_sleepable");
+	ASSERT_FALSE(func_has_tag(btf, "bpf_modify_return_test2", TAG_FMODRET_SLEEPABLE),
+		     "modify_return_test2_sleepable");
+	ASSERT_FALSE(func_has_tag(btf, "bpf_modify_return_test_tp", TAG_FMODRET_SLEEPABLE),
+		     "modify_return_test_tp_sleepable");
+	ASSERT_FALSE(func_has_tag(btf, "update_socket_protocol", TAG_FMODRET_SLEEPABLE),
+		     "update_socket_protocol_sleepable");
+
+	/* A function which is not a target has no tag */
+	ASSERT_GT(btf__find_by_name_kind(btf, "bpf_fentry_test2", BTF_KIND_FUNC), 0,
+		  "fentry_test2_exists");
+	ASSERT_FALSE(func_has_tag(btf, "bpf_fentry_test2", TAG_FMODRET), "fentry_test2");
+	ASSERT_FALSE(func_has_tag(btf, "bpf_fentry_test2", TAG_FMODRET_SLEEPABLE),
+		     "fentry_test2_sleepable");
+
+	btf__free(btf);
+}
+
+static void test_module_tags(void)
+{
+	struct btf *vmlinux_btf, *module_btf;
+
+	if (!env.has_testmod) {
+		test__skip();
+		return;
+	}
+
+	vmlinux_btf = btf__load_vmlinux_btf();
+	if (!ASSERT_OK_PTR(vmlinux_btf, "btf__load_vmlinux_btf"))
+		return;
+	module_btf = btf__load_module_btf("bpf_testmod", vmlinux_btf);
+	if (!module_btf && errno == ENOENT) {
+		printf("%s:SKIP:bpf_testmod has no BTF\n", __func__);
+		test__skip();
+		goto out;
+	}
+	if (!ASSERT_OK_PTR(module_btf, "btf__load_module_btf"))
+		goto out;
+
+	ASSERT_TRUE(func_has_tag(module_btf, "bpf_testmod_trampoline_count_test", TAG_FMODRET),
+		    "trampoline_count_test");
+	ASSERT_FALSE(func_has_tag(module_btf, "bpf_testmod_trampoline_count_test",
+				  TAG_FMODRET_SLEEPABLE), "trampoline_count_test_sleepable");
+	ASSERT_FALSE(func_has_tag(module_btf, "bpf_testmod_fentry_test1", TAG_FMODRET),
+		     "testmod_fentry_test1");
+
+	btf__free(module_btf);
+out:
+	btf__free(vmlinux_btf);
+}
+
+/* Load a minimal fmod_ret program which attaches to function BTF_ID */
+static int load_fmod_ret(int btf_id, __u32 prog_flags)
+{
+	struct bpf_insn insns[] = {
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+	LIBBPF_OPTS(bpf_prog_load_opts, opts,
+		.expected_attach_type = BPF_MODIFY_RETURN,
+		.prog_flags = prog_flags,
+		.attach_btf_id = btf_id,
+	);
+
+	return bpf_prog_load(BPF_PROG_TYPE_TRACING, NULL, "GPL", insns, ARRAY_SIZE(insns), &opts);
+}
+
+static void check_load(const char *func, __u32 prog_flags, bool allowed, const char *name)
+{
+	int btf_id, fd;
+
+	btf_id = libbpf_find_vmlinux_btf_id(func, BPF_MODIFY_RETURN);
+	if (!ASSERT_GT(btf_id, 0, func))
+		return;
+	fd = load_fmod_ret(btf_id, prog_flags);
+	if (allowed)
+		ASSERT_GE(fd, 0, name);
+	else
+		ASSERT_LT(fd, 0, name);
+	if (fd >= 0)
+		close(fd);
+}
+
+static void test_attach_permission(void)
+{
+	check_load("bpf_modify_return_test", 0, true, "target");
+	check_load("bpf_fentry_test1", 0, true, "sleepable_target");
+	check_load("bpf_fentry_test2", 0, false, "not_a_target");
+
+	check_load("bpf_fentry_test1", BPF_F_SLEEPABLE, true, "sleepable_prog_sleepable_target");
+	check_load("bpf_modify_return_test", BPF_F_SLEEPABLE, false,
+		   "sleepable_prog_nonsleepable_target");
+}
+
+void test_fmodret_tags(void)
+{
+	if (test__start_subtest("vmlinux"))
+		test_vmlinux_tags();
+	if (test__start_subtest("module"))
+		test_module_tags();
+	if (test__start_subtest("attach_permission"))
+		test_attach_permission();
+}
-- 
2.43.0

