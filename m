Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4E2DC79B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392198; cv=none; b=PSry4zl0CQ37hOWQQobItyKvrF4KdofmzuFNWSU7ogOBeTiKhS15DM9bT9qDeOPI1dx4dh/cdtO7oWzdCq3HrwS+Rrxrk6y3I7bzpmIdXK6vwHeET3vR1kVVidcQsIyDIYEQDw7iz2Mg6nKaOZ94CDNzUE0w5i5JyeCyLL9CSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392198; c=relaxed/simple;
	bh=Jyv26P4i3B+p2N8OOcNVI7BI6tJbf0FNV4OMJgTFHJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=disyTofo2v1JxqxI80q9W3evGnXbc8IjK4Inm96vFTQXQm0ccA9zgS2vphJ4q0uH7/qKOtoeI2lzap52YIKldI4IS4/B2nEJWoAnuVTzFzE4jySKT+Mj6y+eSNgUxkLqtgpzNyXpK25Y/ovb8EjvG4s6g6XgO3KpIeCRk5kC0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHCgcapA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHCgcapA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so1161293a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792392197; x=1792996997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKAdquM1bwNLsWoLZwLO17OYT9kkSEaiRwexFyrn8po=;
        b=rHCgcapAAlj42YTUDh7kbi7Gu3sAY2bJcSeHTuwTeBLSt+lOVK/LGe1J8vNAcBdGTt
         7HRNUKbu+Nanv5HpTmgO1aBjUzP0uRreIS8ohX8RKlyw1weYq8sOi29XsFPh68MTRcgC
         QsuNvFt0TcsiWY8DE6knec5xDlmc7ZqOSbasyxk8b3fBtTQZwuh+40EfHDQUxc1Ux49Z
         5Es1CzFEHBluuUcbcJel0pua/ZIPVv2pTswX6YOU0/xgf6WUW1pLdaoTfwATnUqFLKbH
         ePlQtT+NmQjo4NYV8/T7PbZhl6y5OwmIfcGcnNaU9E9jFOR5RIGQKsoL9RrJh7vhkBtc
         UeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392197; x=1792996997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QKAdquM1bwNLsWoLZwLO17OYT9kkSEaiRwexFyrn8po=;
        b=tIHuHbiBx7X/DwIZcVlnqPL+cd+Ly/pvFy4Upn0D077bC8jVXffFS4J6Rdr6NXd3TQ
         5c/e2p2JUu4kRr1Q4etf12qQtGUbWS8VSsTXw5lgHzX+zk80mZ/yl7MKYhKVtm0MzFX1
         ZUX/Dmqa7uQKS1kfk6wo2zUj8RoiNVT+62L2kVko6EVEGQ3/6/ou9b1scEF4e6JQdyEG
         MbjATRhhP6PBQXUtICF565s7LDJ94G9QwXfW3SVdPeNPe2iPhqZs8TT6oq6Lg1UQ46bv
         T0yS6AliDAEW3ifnSkKFLF8Bgdmw/o6f2Q3+WA/wGyBYN3ewiBpikyFBA/1VQhA9wZdV
         GwUA==
X-Forwarded-Encrypted: i=1; AKwUvBx5gR6nY60ncC8AkWMRMHtwVc4QgPxLEVmN3i4O4rC1r0Mzxgb9LqXBqWz3SXk9+4nB689WHD0x6BxRnmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1XdG8dyKTnhSlrO0Tdu4vO63DfxTn0eWitKejBPMYfosT6H00
	EhP2UPeoh+8YfQMa2tbCgMscvrkekPmQInYMPjhae+0MdVS8Cr1t+c3n
X-Gm-Gg: AYBFou2Nwi8Q/wjDZLUnOJdarY8X5a7p7xQ3PXD8nOGK+1wfJcTFwa2QjdNSXb4bLFq
	adQ96bzmyCfUldrrlOEi1E1lSbXClxHMcApV992GKdNdLeXgfS5FHBKYMb90EIOZ+/U+tlHH+Iu
	urn1Y7M2wXlDdbLnbruqwwnUXHFsq18IghzfpLkNAnspcyhqgG6BDACREyxfws4TAKO2c76CBFT
	hvvoCGjSv/2UUmy/rWslAB3YHtSGboErqGI8ztJGq7OkHhP0l1WK/AFr/YEtafGoQyg706NlCBl
	KOoW35GqeBV/zvNesjlqKEg6uJkyxUVqDlX4Qd3Yj8I/h64BI9DXLkQ24uHP3wq5FzVinO0Dg09
	QTswo49Wt9vamiAKkq3buSbKTnmCVn6KFe8vSBn6ZkW3G0g601im12OKwtrYe7Sr+gHfLqbyqxt
	Tc2J68QYv810S22y15DSWm/XJyaBSnSP6YzPd/G8sGCdOH81EIcNIoFvpbG+iMZr4h+nFAdodaH
	ey6mi/PA2mpc+WHBp5u1RbahqyyNyvYqlY/exK0QIYuKsLhIlBUoKZP560HNWOP9ZEDpw==
X-Received: by 2002:a17:90b:3146:b0:3a4:9416:a2f8 with SMTP id 98e67ed59e1d1-3acbb879edcmr6758743a91.9.1792392196871;
        Sun, 18 Oct 2026 23:43:16 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2100:3fed:6938:3f14:63eb:c479])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a3a592sm3688960a12.30.2026.10.18.23.43.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 23:43:16 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shakeel.butt@linux.dev,
	roman.gushchin@linux.dev,
	yu.c.chen@intel.com,
	zhao1.liu@intel.com,
	tim.c.chen@linux.intel.com,
	lizhe.67@bytedance.com
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [RFC PATCH v3 bpf-next 5/5] selftests/bpf: add tests for the numab kfuncs
Date: Mon, 19 Oct 2026 14:41:57 +0800
Message-ID: <20261019064157.29885-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261019064157.29885-1-laoar.shao@gmail.com>
References: <20261019064157.29885-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the bpf_numab_set_mode() and bpf_numab_get_mode() kfuncs
through BPF_PROG_TYPE_SYSCALL programs: the set/get roundtrip, the
mode domain (NUMAB_FOLLOW_SYSTEM and the NUMA_BALANCING_* bitmasks
accepted, anything else rejected with -EINVAL), unknown cgroup ids
rejected with -ENOENT, and the hierarchy combination the ancestor walk
produces (inheritance, OR-ing, and an opt-out winning over every
request in the chain).

Assisted-by: LLM
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 .../selftests/bpf/prog_tests/bpf_numab.c      | 227 ++++++++++++++++++
 tools/testing/selftests/bpf/progs/bpf_numab.c |  32 +++
 2 files changed, 259 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpf_numab.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpf_numab.c

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_numab.c b/tools/testing/selftests/bpf/prog_tests/bpf_numab.c
new file mode 100644
index 000000000000..7ce4b8153c42
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_numab.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <test_progs.h>
+#include "cgroup_helpers.h"
+#include "bpf_numab.skel.h"
+
+#define CGROUP_PATH	"/bpf_numab"
+#define CHILD_PATH	CGROUP_PATH "/child"
+
+/* The per-cgroup request domain, mirroring the kernel constants. */
+#define NUMAB_FOLLOW_SYSTEM	(-1)
+#define NUMAB_DISABLED		0
+#define NUMAB_NORMAL		1
+#define NUMAB_TIERING		2
+#define NUMAB_NORMAL_TIERING	3
+
+static int numab_set(struct bpf_numab *skel, u64 cgid,
+		     long mode)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, opts);
+	int ret;
+
+	skel->bss->set_cgid = cgid;
+	skel->bss->set_mode = mode;
+	ret = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.numab_set),
+				     &opts);
+	if (!ASSERT_OK(ret, "set run"))
+		return -1;
+	return skel->bss->set_ret;
+}
+
+static long numab_get(struct bpf_numab *skel, u64 cgid)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, opts);
+	int ret;
+
+	skel->bss->get_cgid = cgid;
+	ret = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.numab_get),
+				     &opts);
+	if (!ASSERT_OK(ret, "get run"))
+		return -1;
+	return skel->bss->get_mode;
+}
+
+/*
+ * Roundtrip through the combined view: the test cgroup has no ancestor
+ * making a request, so the combined mode is the stored one.
+ */
+static void test_set_get(void)
+{
+	struct bpf_numab *skel;
+	int cgroup_fd;
+	u64 cgid;
+
+	cgroup_fd = test__join_cgroup(CGROUP_PATH);
+	if (!ASSERT_GE(cgroup_fd, 0, "join_cgroup"))
+		return;
+
+	skel = bpf_numab__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		goto cleanup;
+
+	cgid = get_cgroup_id(CGROUP_PATH);
+	if (!ASSERT_GT(cgid, 0, "get_cgroup_id"))
+		goto cleanup;
+
+	ASSERT_EQ(numab_set(skel, cgid, NUMAB_NORMAL), 0, "set normal");
+	ASSERT_EQ(numab_get(skel, cgid), NUMAB_NORMAL, "get normal");
+
+	ASSERT_EQ(numab_set(skel, cgid, NUMAB_TIERING), 0, "set tiering");
+	ASSERT_EQ(numab_get(skel, cgid), NUMAB_TIERING, "get tiering");
+
+	ASSERT_EQ(numab_set(skel, cgid, NUMAB_NORMAL_TIERING), 0, "set both");
+	ASSERT_EQ(numab_get(skel, cgid), NUMAB_NORMAL_TIERING, "get both");
+
+	ASSERT_EQ(numab_set(skel, cgid, NUMAB_DISABLED), 0, "set disabled");
+	ASSERT_EQ(numab_get(skel, cgid), NUMAB_DISABLED, "get disabled");
+
+	/* Back to the system setting. */
+	ASSERT_EQ(numab_set(skel, cgid, NUMAB_FOLLOW_SYSTEM), 0, "unset");
+	ASSERT_EQ(numab_get(skel, cgid), NUMAB_FOLLOW_SYSTEM, "get unset");
+
+cleanup:
+	bpf_numab__destroy(skel);
+	close(cgroup_fd);
+}
+
+/*
+ * The mode domain: NUMAB_FOLLOW_SYSTEM and the NUMA_BALANCING_* bitmasks
+ * are accepted, anything else is rejected with -EINVAL.
+ */
+static void test_invalid_mode(void)
+{
+	struct bpf_numab *skel;
+	int cgroup_fd;
+	u64 cgid;
+
+	cgroup_fd = test__join_cgroup(CGROUP_PATH);
+	if (!ASSERT_GE(cgroup_fd, 0, "join_cgroup"))
+		return;
+
+	skel = bpf_numab__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		goto cleanup;
+
+	cgid = get_cgroup_id(CGROUP_PATH);
+	if (!ASSERT_GT(cgid, 0, "get_cgroup_id"))
+		goto cleanup;
+
+	ASSERT_EQ(numab_set(skel, cgid, -2), -EINVAL, "set below domain");
+	ASSERT_EQ(numab_set(skel, cgid, 4), -EINVAL, "set above domain");
+	ASSERT_EQ(numab_set(skel, cgid, 0x1000), -EINVAL, "set far above");
+
+	/* The rejected requests must not have stuck. */
+	ASSERT_EQ(numab_get(skel, cgid), NUMAB_FOLLOW_SYSTEM, "get unchanged");
+
+cleanup:
+	bpf_numab__destroy(skel);
+	close(cgroup_fd);
+}
+
+/*
+ * An id that resolves to no cgroup is rejected with -ENOENT.
+ */
+static void test_bad_cgid(void)
+{
+	struct bpf_numab *skel;
+
+	skel = bpf_numab__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	ASSERT_EQ(numab_set(skel, 0, NUMAB_NORMAL), -ENOENT, "set cgid 0");
+	ASSERT_EQ(numab_get(skel, 0), -ENOENT, "get cgid 0");
+	ASSERT_EQ(numab_set(skel, 0xdeadbeef, NUMAB_NORMAL), -ENOENT,
+		  "set bad cgid");
+	ASSERT_EQ(numab_get(skel, 0xdeadbeef), -ENOENT, "get bad cgid");
+
+	bpf_numab__destroy(skel);
+}
+
+/*
+ * The requests of a cgroup and of every ancestor combine: an opt-out
+ * wins over every request in the chain, otherwise the requested bits OR
+ * together, and an unset cgroup inherits what its ancestors ask for.
+ */
+static void test_hierarchy(void)
+{
+	u64 parent_cgid, child_cgid;
+	int parent_fd, child_fd;
+	struct bpf_numab *skel;
+
+	parent_fd = test__join_cgroup(CGROUP_PATH);
+	if (!ASSERT_GE(parent_fd, 0, "join_parent_cgroup"))
+		return;
+
+	child_fd = create_and_get_cgroup(CHILD_PATH);
+	if (!ASSERT_GE(child_fd, 0, "create_child_cgroup"))
+		goto cleanup_parent;
+
+	skel = bpf_numab__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		goto cleanup;
+
+	parent_cgid = get_cgroup_id(CGROUP_PATH);
+	child_cgid = get_cgroup_id(CHILD_PATH);
+	if (!ASSERT_GT(parent_cgid, 0, "get_parent_cgid") ||
+	    !ASSERT_GT(child_cgid, 0, "get_child_cgid"))
+		goto cleanup;
+
+	/* The child inherits an ancestor's request untouched. */
+	ASSERT_EQ(numab_set(skel, parent_cgid, NUMAB_TIERING), 0,
+		  "set parent tiering");
+	ASSERT_EQ(numab_get(skel, child_cgid), NUMAB_TIERING,
+		  "child inherits");
+
+	/* A request ORs with the ancestor's; NORMAL does not undo TIERING. */
+	ASSERT_EQ(numab_set(skel, child_cgid, NUMAB_NORMAL), 0,
+		  "set child normal");
+	ASSERT_EQ(numab_get(skel, child_cgid), NUMAB_NORMAL_TIERING,
+		  "or both");
+
+	/* The child's own opt-out wins. */
+	ASSERT_EQ(numab_set(skel, child_cgid, NUMAB_DISABLED), 0,
+		  "set child disabled");
+	ASSERT_EQ(numab_get(skel, child_cgid), NUMAB_DISABLED,
+		  "own opt-out wins");
+
+	/* So does an ancestor's: a task is never forced into balancing. */
+	ASSERT_EQ(numab_set(skel, child_cgid, NUMAB_TIERING), 0,
+		  "set child tiering");
+	ASSERT_EQ(numab_set(skel, parent_cgid, NUMAB_DISABLED), 0,
+		  "set parent disabled");
+	ASSERT_EQ(numab_get(skel, child_cgid), NUMAB_DISABLED,
+		  "ancestor opt-out wins");
+
+	/* Unsetting the parent re-exposes the child's own request. */
+	ASSERT_EQ(numab_set(skel, parent_cgid, NUMAB_FOLLOW_SYSTEM), 0,
+		  "unset parent");
+	ASSERT_EQ(numab_get(skel, child_cgid), NUMAB_TIERING,
+		  "child request again");
+
+	/* Unsetting the child leaves the chain with no request. */
+	ASSERT_EQ(numab_set(skel, child_cgid, NUMAB_FOLLOW_SYSTEM), 0,
+		  "unset child");
+	ASSERT_EQ(numab_get(skel, child_cgid), NUMAB_FOLLOW_SYSTEM,
+		  "no request");
+
+cleanup:
+	bpf_numab__destroy(skel);
+	close(child_fd);
+	remove_cgroup(CHILD_PATH);
+cleanup_parent:
+	close(parent_fd);
+}
+
+void test_bpf_numab(void)
+{
+	if (test__start_subtest("set_get"))
+		test_set_get();
+	if (test__start_subtest("invalid_mode"))
+		test_invalid_mode();
+	if (test__start_subtest("bad_cgid"))
+		test_bad_cgid();
+	if (test__start_subtest("hierarchy"))
+		test_hierarchy();
+}
diff --git a/tools/testing/selftests/bpf/progs/bpf_numab.c b/tools/testing/selftests/bpf/progs/bpf_numab.c
new file mode 100644
index 000000000000..b386cbbc19fa
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/bpf_numab.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+
+/* Inputs, set from userspace before each run. */
+long set_cgid;
+long set_mode;
+long get_cgid;
+
+/* Results, read back after each run. */
+long set_ret;
+long get_mode;
+
+extern int bpf_numab_set_mode(u64 cgid, s64 mode) __ksym;
+extern s64 bpf_numab_get_mode(u64 cgid) __ksym;
+
+SEC("syscall")
+int numab_set(void *ctx)
+{
+	set_ret = bpf_numab_set_mode((u64)set_cgid, set_mode);
+	return 0;
+}
+
+SEC("syscall")
+int numab_get(void *ctx)
+{
+	get_mode = bpf_numab_get_mode((u64)get_cgid);
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.52.0

