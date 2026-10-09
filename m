Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415A2EBBAF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514180; cv=none; b=mNANn2OeNMx73/W/9bfs8ajQHsqSRWh46WRbHYlFSoL7znogs7Z3wxF/sHZWNWqVp25dQ+/qUpTfyUo3eCb7daz4iZyYeG8fFxmWYkAIXFlIfMDNxtP/Rkxc6PsESHHL02aPKFgfcDn2kPkADtvibse2hRmi5JuBMYSCEt7nxlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514180; c=relaxed/simple;
	bh=pZ2LQ1mcW19e9zbv6dn1tCsFTO3+3e1BnDlqHRe3oWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjVtMg+rAmSe701b4bKU85pyoyi1LsURrw2C8bYVUcMc+Xzge2gwpPJHqEvR1unOtCseC4+CrI9EYhsdR6QYrJyAkOT8UElkY9uPyYztpMvE9/t2G66NMoYnTiKOQ8noss0pOvyKjGTgd80nF9aHGhY1h18qs2MC4zNsgIxR8rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hnruczoa; arc=none smtp.client-ip=74.125.231.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hnruczoa"
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47bb3ddaaf6so2395918fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791514178; x=1792118978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFsPZQMGn5BAWFrELIi38nxVy/jbhNPk/JM7FZWSKto=;
        b=Hnruczoa0FaTx6HtFxZcYIM0nuZFmKPCC/0EiFsctTPe9VJwvMs/LhLmybm9X6UO2A
         jE+ZkE/YhOYolDlyZH4O7GgoH6dKQOejanejMxHN2gZxcSwDMNX35ytHLCJSadQdM6KV
         RGYLbGGthnbp44HBibG7+zYvGRXYqOtP0n2FF1A1qT8lV/vW7wgsWvgx319S8pf7Eszd
         eQHDdQXhDUQXXNkZzL247X4ANw6XfTS5AxQED8sHsGacXhu8/PyCgM7cAnFaXhQ/53HX
         41+FC9n7YYTpvUe4zP+E0lpYRFlkFi5iPFdFiigy3EiL3uOchpEh+q7nwa/3hk3Rq0f4
         OAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514178; x=1792118978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFsPZQMGn5BAWFrELIi38nxVy/jbhNPk/JM7FZWSKto=;
        b=anhaoOrbMnXSDnjMRO/7n9B8X7vYMO2mDmEp/a9zvaxNHAQUa1uH1MRjcWisemx6XF
         cSQTCQEkE/vdcQ3yIa8HBJbaW1SmS8Z1Lnt9g4ObjQMAVv6L8aKIgf9nPxvNPXkt/mFU
         8M0xC/4oSfYIq28Me0OJ1jYsO5pUVAa3y/pWXukwnnWcFl8guLy2v0xWKj4XUnZxPdtr
         BF3OFuce2UE3KaRiEQ1GXgfuWZ2qZs9ySwu6QF11lpWXznpU8N+STSkk1cIWsS8eFDw/
         uifiBoHypq7bPhc4e2JZqgY5gizrS46HnlwtrrUGDfgbvOeAUNEKEF0ARlnekzNR+9Kt
         f3qg==
X-Forwarded-Encrypted: i=1; AKwUvBwYX1rWMpklN3c3+IUyA9ZEI9vpZZNjqX4abG8cn/m/8S1Y2VTy91LTve+BF7TDNRItV+3wI5aPREtNtG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr8bYLgR5VTB+t0FcUVbx8YZENl+G42b1YyNMCnnhHOlNrwu24
	KpkNJ9wGqHvk+6wBgQ6esEYUpQzl7sqjI23phraGJk7zzzczCRQ+CXue
X-Gm-Gg: AYBFou0LPpbxeiKMpejopq3FuNSUugtisaNejzoXIuqAGD7RtCwEADKzuFPkJJ78DQD
	PshOtENI3XGTd8Qq+d6Imh/GTW/deun5b9b4sukm6rmWaADmN4qx7Qejv2OARmXKn9MuFdTlcXt
	ASbzFSSQqbZ7sr3KACUIfi1r7/ZQVdLq2o2OvsOfi7XZdcPinD9DCiAZStOmU5wED59E7kc/+TH
	yW3JR7xe5UDZAgtEA19nb2ZdHszRfXsaOqD5ZJRM1wEFu5+AlJWuKMAfjHIstMRr2kKsPlqwJk3
	DzyGOFTaH1hubiKP1Z9G3c1Dqt0c/dcGPxA5OUIOAx0U6mjHUhSJTV6DwTkVfL5cIJkWacr0gOo
	S7/u25LThLXoMxG0jtQ2P7Q6FW+fe0lVRvK5+v2RyA96TAo1uMbxkU+xHhhg37jMLlbQP1tYhhp
	tPNLE1ZA5+PvaLWg3oIQF1W1YRfx+omQoao9L8guIRyYrATPDHYzQb74kV46qIr62VqF8N2tYiM
	CVVRmBIk3WlWy1t/QvltPW7LiNuhf2WH7gEk+WHYeQWkvGAXwkZr3xLBc6lLgH898Jw++BwZhXm
	Qe/1tQ==
X-Received: by 2002:a05:6871:a844:b0:48f:e107:318b with SMTP id 586e51a60fabf-4a2a88f81f3mr595845fac.43.1791514178445;
        Thu, 08 Oct 2026 19:49:38 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:71::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a86317a5sm750913fac.17.2026.10.08.19.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:49:37 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Puranjay Mohan <puranjay@kernel.org>,
	kkd@meta.com,
	kernel-team@meta.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 3/3] selftests/bpf: Test PROBE_MEM loads from invalid addresses
Date: Fri,  9 Oct 2026 04:49:23 +0200
Message-ID: <20261009024925.3169077-4-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009024925.3169077-1-memxor@gmail.com>
References: <20261009024925.3169077-1-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4672; h=from:subject; bh=pZ2LQ1mcW19e9zbv6dn1tCsFTO3+3e1BnDlqHRe3oWk=; b=owGbwMvMwCXmrmtenRyi38x4Wi2JIetEmEjVzIzTX/7WZh5dXXPf6vCiL4od10UfNjSamwdxvlfJ uSLXUcrCIMbFICumyFLyfx+T8YnK34G2y7hh5rAygQxh4OIUgIl86GZk6Dp6cYvSMjbjtY8Y4gUW+9 XterBX1in7k2nOLiPZLV93mjEyLO3O+fnwz2vvsn0bg8oENl6sYvf/LjAhtjdEyOvZwiQhbgA=
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=B34BD741DE8494B76E2F717880EF20021D46C59B
Content-Transfer-Encoding: 8bit

Add a test that performs PROBE_MEM loads of three sizes through a
bpf_core_cast() pointer whose value is chosen by userspace: NULL, a low
user address, the last user page, a non-canonical address and, on x86-64,
the vsyscall page and an offset into it. Each load must read zero and the
kernel must survive. A load through the current task pointer checks that
the same loads read real values when the address is valid.

The test passes on kernels that reject the addresses with the JIT's range
check and on kernels that rely on the fault handler; with only the JIT
change of the previous patch applied, the first subtest oopses, which is
what the fault handler change prevents.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 .../bpf/prog_tests/probe_mem_fault.c          | 69 +++++++++++++++++++
 .../selftests/bpf/progs/probe_mem_fault.c     | 41 +++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/probe_mem_fault.c
 create mode 100644 tools/testing/selftests/bpf/progs/probe_mem_fault.c

diff --git a/tools/testing/selftests/bpf/prog_tests/probe_mem_fault.c b/tools/testing/selftests/bpf/prog_tests/probe_mem_fault.c
new file mode 100644
index 000000000000..57a313e35eb6
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/probe_mem_fault.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Meta Platforms, Inc. and affiliates. */
+#include <test_progs.h>
+#include "probe_mem_fault.skel.h"
+
+#if defined(__x86_64__)
+#include <asm/vsyscall.h>
+#endif
+
+/*
+ * Addresses a PROBE_MEM load has to survive. Either the JIT's address check
+ * or the fault handler must turn each load into a zero result.
+ */
+static const struct {
+	const char *name;
+	unsigned long addr;
+} bad_addrs[] = {
+	{ "null", 0 },
+	{ "low_user", 4096 },
+	{ "last_user_page", (1UL << 47) - 4096 },
+	{ "non_canonical", 1UL << 63 },
+#if defined(__x86_64__)
+	{ "vsyscall", VSYSCALL_ADDR },
+	{ "vsyscall_tail", VSYSCALL_ADDR + 0x800 },
+#endif
+};
+
+static void trigger(struct probe_mem_fault *skel, int *runs)
+{
+	skel->bss->val_dw = ~0ULL;
+	skel->bss->val_w = ~0U;
+	skel->bss->val_b = ~0;
+	usleep(1);
+	ASSERT_EQ(skel->bss->runs, ++*runs, "runs");
+}
+
+void test_probe_mem_fault(void)
+{
+	struct probe_mem_fault *skel;
+	int runs = 0, i;
+
+	skel = probe_mem_fault__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	skel->bss->target_pid = getpid();
+	if (!ASSERT_OK(probe_mem_fault__attach(skel), "attach"))
+		goto out;
+
+	/* A valid kernel address is read for real. */
+	skel->bss->use_current_task = true;
+	trigger(skel, &runs);
+	ASSERT_EQ(skel->bss->val_w, getpid(), "pid");
+	ASSERT_NEQ(skel->bss->val_dw, 0, "start_time");
+	ASSERT_NEQ(skel->bss->val_b, 0, "comm");
+
+	skel->bss->use_current_task = false;
+	for (i = 0; i < ARRAY_SIZE(bad_addrs); i++) {
+		if (!test__start_subtest(bad_addrs[i].name))
+			continue;
+		skel->bss->addr = bad_addrs[i].addr;
+		trigger(skel, &runs);
+		ASSERT_EQ(skel->bss->val_dw, 0, "start_time");
+		ASSERT_EQ(skel->bss->val_w, 0, "pid");
+		ASSERT_EQ(skel->bss->val_b, 0, "comm");
+	}
+out:
+	probe_mem_fault__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/probe_mem_fault.c b/tools/testing/selftests/bpf/progs/probe_mem_fault.c
new file mode 100644
index 000000000000..748be45418f5
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/probe_mem_fault.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Meta Platforms, Inc. and affiliates. */
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include <bpf/bpf_core_read.h>
+#include "bpf_misc.h"
+
+char _license[] SEC("license") = "GPL";
+
+int target_pid;
+bool use_current_task;
+unsigned long addr;
+int runs;
+__u64 val_dw;
+__u32 val_w;
+__u8 val_b;
+
+SEC("fentry/" SYS_PREFIX "sys_nanosleep")
+int probe_mem_fault(void *ctx)
+{
+	struct task_struct *task;
+	unsigned long p = addr;
+
+	if ((bpf_get_current_pid_tgid() >> 32) != target_pid)
+		return 0;
+
+	if (use_current_task)
+		p = (unsigned long)bpf_get_current_task_btf();
+	/*
+	 * bpf_core_cast() yields an untrusted pointer, so every load through it
+	 * is a PROBE_MEM load. Whatever the address is, the load must either
+	 * read the field or produce zero; the kernel must not oops.
+	 */
+	task = bpf_core_cast((void *)p, struct task_struct);
+	val_dw = task->start_time;
+	val_w = task->pid;
+	val_b = task->comm[0];
+	runs++;
+	return 0;
+}
-- 
2.53.0-Meta

