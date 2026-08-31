Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8A83F3262
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168244; cv=none; b=OdbS+rUEAhCZkeSseOf9ypqDA+UPEcLaQAuN3691ieR/QFGcOtV7C+D/SqpYAGO/LcgyjFA9NdUvkBj4Fw3LL6Yi0U3IXXVtT+hslVPX2/rU5au0Q+u1BoUNmljm51+x3hXCBY5Le6TMw8yxRkWPj2318WQaGtd5yUUv9wjJdnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168244; c=relaxed/simple;
	bh=dVds8F/uQaGiVVtA9skFGZdEhgcSv5XJRG8BjPr93wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faNNAG2gEwJ9u0qVQJRJuyagWZseJx1+zHj774OY9R4Kb3wd0rF5DSrZ0QNEA4u87TnAB0T50cRHf3P3W1CX5lbnDkaxyLgTxRLTeGfXR+mbmjRvVZ5BNot94Vl1/ePQRLd7qX63yto0y9xRf1ydQD43TLPZcSWFwwbQO19RDN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDgaR5G9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDgaR5G9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48436216a98so648185f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168240; x=1788773040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8u8KeUtgM4fV7u/x1/LAbjzMrbujtoGelddq2lUEz0=;
        b=tDgaR5G9WZXTcbo61RNvKggE11LFan3nuf58fmJlsRFgtXNsWZZSRs9RVO/rYU4XlP
         15PL41Q7amCiPWgVIASXyXK2NXX0aWO8ZzJemDmaGp57LmKactVqncgvzKq7d+Num2EB
         nD/BIOg2GNL9VvA6wkP9eQHX5S31v6Z6DXyH3EiQ4zFuPpd/89ag5p1tPq+wzrrKeklW
         dvU/zSmOaWm4LX3GsyNCIArCICJ46cAIlE2ABc7nklCaiPUXza+4BCcZHIocuytRfgXD
         DuqE0nLwRiZE2j2QB8fMwsc80ijLxoFoygpR84ImoGs4L2GpuAtdZaxyPhobaErlcEfC
         7RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168240; x=1788773040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8u8KeUtgM4fV7u/x1/LAbjzMrbujtoGelddq2lUEz0=;
        b=RiP/0o3ejJqxOP7Amwhs/jByW+COzKUpPz7rUg3Apk/CjzngFiftFBoCzvC4X7Y+2S
         /LY3zG/NWadlaDwbGBKnWugeLa8h/n+cLO63OWP5ksLalN6cz87Bb4k763nH3usAarmp
         JbXVPqaSvmy1xdIgEJExEmv+4Rmjk7XBL6mRVkG+a63hHhiaUhP+ZyWqUMd84twG/O+T
         5ujfjS4qY3A8YXk9Sq8P1zJIWMVLZ7e/nWZPPGf1hRD1NMsOqqstVxP4xEyFLRlL43mF
         zXbtj8kAqA8XWzYtdwQgV68i/p7zjn8bx2S1/rwSdX4WLKzKlbdHsQxo/jiTb0BTfRoR
         Kw7Q==
X-Gm-Message-State: AFuF++nZNjiwwH3mWCrHNRBz2g6aeaBxX895k9tmsFUKQVs4mURgnCEg
	t4zdLctJ2NjFJIUczUH/us+EuJEgCu5lBHmjQTqjPdnI30BSIx/c0p93
X-Gm-Gg: AR+sD11bZOMeS4htoL0FPtAm2Vv8zwbxcmSl3HITfuPfTAT6T8/Inxl8PSdw8xsFvi1
	xZaS6uqUmGFWn44ooMmdjtDDAToCYFe++krSoeamfMOXvtz1p47Ey8RZ2FDWxJPnC+5BDWXClOE
	xSg+HySmjBiMgCXNKKcXztG4UXnKohEPeAeHYg/SryvU+pe0tURVQTa7/imonHu+LpXanknVZvo
	qUWgHBWmm1vkWOliwEAQOlwLUBhk8I2xA7vAIlqKOYOB1ALEej89DlZX5s1efGPQz0vQ1pDLQZX
	tMw86HUZKeb596ifn+n97C0MnB0ITAltSmPsAZ28ypEqNYYVUBcvyUep1IFHnXKiamVhjoa5nzn
	ciBAzhL2rcuojcKThUQpjxJTOhmrAARC4QciKG5KnnItgRHbISpJijuphb7u5SGBBNwu1bsHRAR
	z1e4Njl4tvXIVc4399K3O87nTsfRJWcQK7RD2XWuPq5Jwp/DIy8XJwcL7mi1clH9qyDPKYX61mi
	g==
X-Received: by 2002:a05:600c:c4ac:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49b91c20e36mr367057785e9.6.1788168240083;
        Mon, 31 Aug 2026 02:24:00 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm318248155e9.9.2026.08.31.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:23:59 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	song@kernel.org,
	utilityemal77@gmail.com,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v3 7/7] selftests/bpf: Test mm_struct user memory kfuncs with linux_binprm
Date: Mon, 31 Aug 2026 12:23:05 +0300
Message-ID: <20260831092305.42062-8-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831092305.42062-1-tasos.papagiannnis@gmail.com>
References: <20260831092305.42062-1-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a sleepable BPF LSM program attached to bprm_check_security to test
bpf_copy_from_user_mm() and bpf_copy_from_user_mm_str() on CONFIG_MMU
kernels.

Starting at bprm->p, verify that bpf_copy_from_user_mm() can copy the
contiguous NUL-separated argument and environment data. Then use
bpf_copy_from_user_mm_str() to read each argument and environment string
separately, advancing the offset by the length returned from each call.

Skip the test on !CONFIG_MMU. In that configuration, exec argument and
environment strings remain in bprm->page[] until the binary loader
transfers them to the new process stack, so they are not accessible
through bprm->mm at the bprm_check_security hook.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 .../bpf/prog_tests/copy_from_user_bprm.c      |  72 ++++++++++
 .../selftests/bpf/progs/copy_from_user_bprm.c | 123 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/copy_from_user_bprm.c
 create mode 100644 tools/testing/selftests/bpf/progs/copy_from_user_bprm.c

diff --git a/tools/testing/selftests/bpf/prog_tests/copy_from_user_bprm.c b/tools/testing/selftests/bpf/prog_tests/copy_from_user_bprm.c
new file mode 100644
index 000000000000..b2325b193576
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/copy_from_user_bprm.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <errno.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include <test_progs.h>
+
+#include "copy_from_user_bprm.skel.h"
+
+void test_copy_from_user_bprm(void)
+{
+	char arg0[] = "first";
+	char arg1[] = "second-argument";
+	char env0[] = "SOME_ENV=a";
+	char env1[] = "OTHER_ENV=something";
+	struct copy_from_user_bprm *skel;
+	pid_t child;
+	int status;
+
+	skel = copy_from_user_bprm__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	/*
+	 * On !CONFIG_MMU, exec strings are held in bprm->page[] rather than
+	 * being mapped in bprm->mm.
+	 */
+	if (!skel->kconfig->CONFIG_MMU) {
+		printf("%s:SKIP: test requires CONFIG_MMU\n", __func__);
+		test__skip();
+		goto out;
+	}
+
+	if (!ASSERT_OK(copy_from_user_bprm__attach(skel), "attach"))
+		goto out;
+
+	child = fork();
+	if (!ASSERT_GE(child, 0, "fork"))
+		goto out;
+
+	if (!child) {
+		char *const argv[] = { arg0, arg1, NULL };
+		char *const envp[] = { env0, env1, NULL };
+
+		skel->bss->monitored_pid = getpid();
+		execve("/bin/true", argv, envp);
+		_exit(errno);
+	}
+
+	if (!ASSERT_EQ(waitpid(child, &status, 0), child, "waitpid"))
+		goto out;
+
+	if (ASSERT_TRUE(WIFEXITED(status), "child_exited"))
+		ASSERT_EQ(WEXITSTATUS(status), EPERM, "exec_errno");
+
+	ASSERT_EQ(skel->bss->bprm_argc, 2, "bprm_argc");
+	ASSERT_EQ(skel->bss->bprm_envc, 2, "bprm_envc");
+	ASSERT_EQ(skel->bss->data_len_match, 1, "data_len_match");
+	ASSERT_EQ(skel->bss->invalid_flags_ret, -EINVAL, "invalid_flags_ret");
+	ASSERT_EQ(skel->bss->copy_ret, 0, "copy_ret");
+	ASSERT_EQ(skel->bss->str_arg0_ret, sizeof(arg0), "str_arg0_ret");
+	ASSERT_EQ(skel->bss->str_arg1_ret, sizeof(arg1), "str_arg1_ret");
+	ASSERT_EQ(skel->bss->str_env0_ret, sizeof(env0), "str_env0_ret");
+	ASSERT_EQ(skel->bss->str_env1_ret, sizeof(env1), "str_env1_ret");
+	ASSERT_EQ(skel->bss->data_match, 1, "data_match");
+	ASSERT_EQ(skel->bss->str_args_match, 1, "str_args_match");
+	ASSERT_EQ(skel->bss->str_envs_match, 1, "str_envs_match");
+
+out:
+	copy_from_user_bprm__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/copy_from_user_bprm.c b/tools/testing/selftests/bpf/progs/copy_from_user_bprm.c
new file mode 100644
index 000000000000..a0e2d1c86c2c
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/copy_from_user_bprm.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "vmlinux.h"
+
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include <errno.h>
+#include "bpf_misc.h"
+
+char _license[] SEC("license") = "GPL";
+
+static const char expected_data[] = "first\0second-argument\0"
+				    "SOME_ENV=a\0OTHER_ENV=something";
+static const char expected_arg0[] = "first";
+static const char expected_arg1[] = "second-argument";
+static const char expected_env0[] = "SOME_ENV=a";
+static const char expected_env1[] = "OTHER_ENV=something";
+
+int monitored_pid;
+int bprm_argc;
+int bprm_envc;
+int data_len_match;
+int invalid_flags_ret;
+int copy_ret;
+int str_arg0_ret;
+int str_arg1_ret;
+int str_env0_ret;
+int str_env1_ret;
+int data_match;
+int str_args_match;
+int str_envs_match;
+
+extern bool CONFIG_MMU __kconfig __weak;
+
+extern int bpf_copy_from_user_mm(void *dst, u32 dst__sz,
+				 const void *unsafe_ptr__ign,
+				 struct mm_struct *mm, u64 flags) __ksym;
+
+extern int bpf_copy_from_user_mm_str(void *dst, u32 dst__sz,
+				     const void *unsafe_ptr__ign,
+				     struct mm_struct *mm, u64 flags) __ksym;
+
+SEC("lsm.s/bprm_check_security")
+int BPF_PROG(check_exec_args, struct linux_binprm *bprm)
+{
+	u32 pid = bpf_get_current_pid_tgid() >> 32;
+	char data[sizeof(expected_data)];
+	struct mm_struct *mm;
+	char arg0[32];
+	char arg1[32];
+	char env0[32];
+	char env1[32];
+	u64 offset = 0;
+	u64 data_len;
+
+	if (!CONFIG_MMU)
+		return 0;
+
+	if (pid != monitored_pid)
+		return 0;
+
+	mm = bprm->mm;
+	if (!mm)
+		return 0;
+
+	bprm_argc = bprm->argc;
+	bprm_envc = bprm->envc;
+
+	/* this is the total size of args and envs starting from bprm->p */
+	data_len = bprm->exec - bprm->p;
+	data_len_match = data_len == sizeof(expected_data);
+
+	invalid_flags_ret = bpf_copy_from_user_mm(data,
+						  sizeof(data), (void *)bprm->p, mm, ~0ULL);
+
+	copy_ret = bpf_copy_from_user_mm(data, sizeof(data), (void *)bprm->p,
+					 mm, 0);
+	if (copy_ret)
+		return 0;
+
+	data_match =
+		!__builtin_memcmp(data, expected_data, sizeof(expected_data));
+
+	/* arg0 is at bprm->p */
+	str_arg0_ret = bpf_copy_from_user_mm_str(arg0, sizeof(arg0),
+						 (void *)(bprm->p + offset),
+						 mm, BPF_F_PAD_ZEROS);
+	if (str_arg0_ret != sizeof(expected_arg0))
+		return 0;
+	offset += str_arg0_ret;
+
+	/* arg1 is at bprm->p + sizeof(arg0) */
+	str_arg1_ret = bpf_copy_from_user_mm_str(arg1, sizeof(arg1),
+						 (void *)(bprm->p + offset),
+						 mm, BPF_F_PAD_ZEROS);
+	if (str_arg1_ret != sizeof(expected_arg1))
+		return 0;
+	offset += str_arg1_ret;
+
+	/* env0 is at bprm->p + sizeof(arg0) + sizeof(arg1) */
+	str_env0_ret = bpf_copy_from_user_mm_str(env0, sizeof(env0),
+						 (void *)(bprm->p + offset),
+						 mm, BPF_F_PAD_ZEROS);
+	if (str_env0_ret != sizeof(expected_env0))
+		return 0;
+	offset += str_env0_ret;
+
+	/* env1 is at bprm->p + sizeof(arg0) + sizeof(arg1) + sizeof(env0) */
+	str_env1_ret = bpf_copy_from_user_mm_str(env1, sizeof(env1),
+						 (void *)(bprm->p + offset),
+						 mm, BPF_F_PAD_ZEROS);
+	if (str_env1_ret != sizeof(expected_env1))
+		return 0;
+
+	str_args_match =
+		!__builtin_memcmp(arg0, expected_arg0, sizeof(expected_arg0)) &&
+		!__builtin_memcmp(arg1, expected_arg1, sizeof(expected_arg1));
+	str_envs_match =
+		!__builtin_memcmp(env0, expected_env0, sizeof(expected_env0)) &&
+		!__builtin_memcmp(env1, expected_env1, sizeof(expected_env1));
+
+	return data_match && str_args_match && str_envs_match ? -EPERM : 0;
+}
-- 
2.55.0

