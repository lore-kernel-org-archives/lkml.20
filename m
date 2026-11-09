Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243291;
	b=aIQz8x9uqeHLlP7tZsYwgwYrbELU4C4FWSQj7zNYGNWwIMjsIEMmpj+FX9F+nKZU9pqx
	 P/zGtnYntzTEm/DQYSgRe7HqMDJfEvsM529SNqtT34tpirKdP+05+yQsGIGYjiJa2YXqp
	 8l/LG7RfjMM3C4b0cygMtHQgfb8ITWV3O4Y4mVbuGoFvG2B2puoZxprWizgdZBL9JrVA5
	 Gq5QyC3z44Cwt1bEoJob/FPjiWT/0i3gDFQE4uHTzp/N/5yF7b/vCJjOBkonsTtsixkh7
	 gE20wyLw3W4ZdLqJ0kJPsgDAduafkVhcw74dxhwj9MnIbLwI/PsZi+1zSKf2tK3cUBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HNNUOPHHRYuxX8ALTNMCrNB0wz+vFOtJtbEqpRjOoKE=;
	b=JYjkwlTMJdHl7YDfTK0HEZVBLa501y7CClruWCos6hXluWi/AV2GoZAHzbSyb+mTkm4i
	 24akOCAuUwGcfEInMcUKgMpwjbzCCwFhCaAGc3iVCStSf1KKc3J8/S0JT+UxBMPW779BV
	 ItCVapXHKIX2RxUDwFeJsodQRd3DuGBKTKBBQrOoHFA9YnmAZmrrkTQB9fGVW0YBZNYU0
	 5IdYdJ9wK0+WXtLZvRDPbyQyLS6pUABVPSTUOABicrGEEMshc/jbwv0fDcebQrAIi0KFv
	 1deT82R9DFwgsEn2Gh5gcLJ/rmuLj7qiVgdicjp6aN9ct1V/qnJDytaQKp6zL/lWhCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpMZYCA0;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191D760A5BD5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 191D760A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpMZYCA0
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so800095f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243290; x=1794848090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNNUOPHHRYuxX8ALTNMCrNB0wz+vFOtJtbEqpRjOoKE=;
        b=TpMZYCA0jRX7+3Kjt/x+6ZV2t/J4meTi20r/VR1EOrXmezI+HHwT6PdELR0uwB8Dmt
         TW/aBGCpdgFF/CSbW9UzqazYGWnJ6B5lNtWgw6vhLXQj9W9y7s7hgr4TlaZNW9a7Q9Re
         30uIwwZpV2SRc2wQTHzHezE9i2JdDTSmN96mgPekth3DIRI0MSJmyO3HMou9gVDvQ+03
         qzV1IjSiFz7qURXH9q1t3KHU5IhVg0safEsWILKap+y6PnzQFkzNSs46uKpcg9jpmnSZ
         0z9HTHgt6Wy0RWm/N7PlCX4906hoMkuFJnY2LHn14vm9EjYzUDewtLeSk/2vz1l6yabD
         coSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243290; x=1794848090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HNNUOPHHRYuxX8ALTNMCrNB0wz+vFOtJtbEqpRjOoKE=;
        b=1tGm+MUZ7NOEbDdJVi+cXlnw6evp8hF0xkQyUJ/CNtibaxZKoD+tDdk1owQWFkBGaj
         QqIJTV/cGGfJ8awkwOQ5pZbzoHkpobcmAxdG8kPGP9x0vfrbi7dJEkG0540EO7JrAa7i
         o0EGRhZWbgxmwE+6GXkKuKKNY7Kx1OvZPzQ/OhSdMg4fi87M8T6dJiQtazvDv6uX88rR
         j9pYnlBoU8a1PfrB+Ku43GUz4SPi++nKsvuX8qGaFTkv5p3GcLmk803s3ZNkp+XIK4Hl
         GXvFs4L/mDqLPfce+0UhMMIPHQZPPjyeycCF7j0bjzkk55GFjDQHwQ0RdIt9gp0iuGUT
         n/Eg==
X-Forwarded-Encrypted: i=1; AL+hErEPY7G2E9Cd39I2l9AEDguVZVW4d5WBcY6Fj5PeJfwGtYMuvIWPzM+58LsA5vu8ZRk+5yl+yOegb4Rce9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C5glCnhCI/c0pdt1XdJhAICYpglzu6auka7p/ooKTH/OrrwjO
	iTCXTVTl4Yw7VKtzVTyRs1wV6RUQakPNEAZn2WcBGBwtQm92RhSXITwA
X-Gm-Gg: AYBFou3XHCzPOxJto9P1JEKWq/agzyNQZcmckJY0bTrkK3UHAatZRV/+YqzYg+oirE4
	JUJcQ5U765TYhxDPt6E+yA1SlB88HU8mBFMIVr8elkL3zCfx+EnamnkGj+C09AyY4aLE+MWj/Xg
	4rjUQJnDFnXRdoA8DnmW3DeapDvMXyqGNHgPUew5ci/zAP68NZyvf8bX7YgRR4xFKbUXzmZI2TD
	GV0SWuI7Wqdi3XvO7fw7Nhi91O/WAShBXIj2RK67pkpoB99oLEE3tZ1uBrYnQoX46QhJKOqK4mg
	XFLhyKp0R6lf4aK1o+QtxslMYMWIwonxvVAKizq0SE+OJSc1o9+6x07KgAXxSxGg5bwzs95l+NI
	BKhsRu0XqQimt1H+XR42S9DJ6GSyxjGTcop7QrRN1n48jG3O0FZFTzqbYUZ/l+/t6tJET4JSgNE
	w3wkySzMNIxizlf/pOJj2D9wkKn8DYQwysRKHOFZWd39knD1i6eAfDtjjtQDqrLGYUATp2rOkq+
	ZmlFFalIY514LuTWbWo6LSc0Bn7xdceFOqXHtO97iUD/qEbMjnx5ydF+0Yzb8GkzzUCtyo+2wNi
	GbW5ESggJWGSLbmdBhyHlxOYbZymDYMg8WutBgi/KbCINuY=
X-Received: by 2002:a5d:5d0e:0:b0:492:905a:8b22 with SMTP id ffacd0b85a97d-4982c799164mr104721f8f.2.1794243289514;
        Mon, 09 Nov 2026 08:54:49 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:48 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 06/18] selftests/bpf: Test fmod_ret BTF decl tags and attach permission
Date: Mon,  9 Nov 2026 17:05:26 +0000
Message-ID: <20261109170550.141443-7-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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

