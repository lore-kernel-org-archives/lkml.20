Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02C73A8758
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788143985; cv=none; b=sBT10U+XMFWc5L1xigTDmZpmKTGBQLvArefJX4FXEBFXsALfpFlENUi4VNFG8VaCrC4ZTwmE61PsoSfpz7m12kL5WNp3W+ImJdHq2CLiJYx6djtU1YU9fr9MSj5ezOtgE30rgI1+enCndNa6I+etU+fyotd3aGAxWesi6p9kziI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788143985; c=relaxed/simple;
	bh=1grrlwcRBy84+GLBwRBpEOuz8za0LcuTiB1B2/8fi30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGIgMBn21vsnO0g3qtrM7bMVbo9JibGXrDa9iVrPex+zJFL6MaMXHbHQneIs2Z4B02UMUteKZ5y9GgEA9XDbhFUdxzJoR8UlsjrPC9fsskth21VMvBb5RZSSWY2bt+PMW1FmJqFgmGWl6eYjxFSZYk6vMOALPADEnU5ZkGVTmxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kI1AfrUs; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kI1AfrUs"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-851cbd64814so1163807b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788143980; x=1788748780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkgfPcc4FkgnUjsg4kBVmpwxumGDPin8A5RuwTcf5oI=;
        b=kI1AfrUsIYkiVa42m0sc9Z4oaKcXBiKtAvCJBtMmD9DRd0gohNMB4dDuCoVT5pPXQw
         UVnizRx0aLwVdJT7R32LcrVYIFQWoj7VORuGYqRuPG0BS8THk4LP2KmB3BtG0N4QljcK
         2WOLoN85lCsGYzlAuo+R/goKXkbjmTzPg/SmGVMBJ9J41btxQXQChrx+nnScFCvd6XQg
         kiBEKEB+NaTqs5MVjDsNzOTymI1QpvrVzu0D/AB2QAXZxutUA+O22Xccx2wU7tZSMS+x
         Fe2RoKAvDjB9CvuefJ/KJsdfWhIoiIDqy0TF9T2YKikdaZKTtkJFJ0KtqMcUhGPEnMm0
         PLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788143980; x=1788748780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkgfPcc4FkgnUjsg4kBVmpwxumGDPin8A5RuwTcf5oI=;
        b=QVoHvyHRXBvwqy3Frcm1q/sp2+IjSBikYl++0PkCszqK6m/ravtHqYObvpES99yehF
         VNu2rOKC5Hhrd9qixRuRcIH7A8KAbljNcWB4lju+sRUPuTOP8Xw8oUzTJfiqSl8K4gsQ
         Na9Lri6uE08hl/WXRzc4plYe3Sf77cqh0aE0V2OORPWW5OIKXqQVSW43O6UPwdjuQBk8
         up2gxN+xDVmsjSD07ah0U4Fx9xOqYxwPgg4PP2nNPg99RK0OTfQ4BWCimTQMfswFJIFU
         j129H3KiExJCskoC+RWHE4DWC0X4r0iRT+G57nSYVIB0Q5hJ89+rqlbkR4RNuuVsRV/Q
         HNEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbEx/JZZXxPGYSn5jBRPxPfqGLC0yb015EE7y/OiTxxSTyxCJVgw+9ebnXfNNddH+cftGEeAr6llBh6jA=@vger.kernel.org
X-Gm-Message-State: AFuF++kwTOs7YAK35X6LIodUIL94kfr8NtWr0L5F9dZfL1QDrM+O0SsQ
	NCQPIu8cs/bq16MfmrIQtiwrn9kpoTlGClxLgY+PTv7cKVn8/Ru+qrpB
X-Gm-Gg: AR+sD132AR5NiYMLRK/98t0qUt524pnNWLxJwrGao2KRijbHdz2gUBXOy/rttm+Wk8V
	6/j1ZixGStG5dfmcRQtiZw00jrOncUIcDxXtIbNnK4OA/C8gRrIf9UzQatDbxcz8B6wqaNoUtpc
	mpufZ4o1yuK6MymIf+QmhvIPUEgA72vn+lcYaG0IDVRGRekrn2bynBxk2XMbvRf93+FhFAIcUzu
	h3PjlE1dXKFR4yYXaygwXq22u+eoJKcVDwmsMjTfqdkD7tPFzhQ28fIkA9ktZxlOTbgS4tVfwCk
	5TBQ3BkLTRXajdcr+Plcu7RfJEwG67Wd2Cqq8NUXEEkkwKjI+59f8NF511lJ8qebZo+YzJdKJh9
	eiZScUaCT0yJnd6ESwE9q4ccBWESBudZKhSjgqtLvYeabXgwBU5DqigdCjNcP2f+59Y1whq7bTr
	zoJYAassptgq9sTM0fBIB+sQIX5DOruZgA+Xxx56WNS5tHcuUOQiqxN0ScRzYhxUVKjSUUYOwmk
	Mv5zNokmlsI7EXXv+8lo7Im0A6/dx43C08HYqB3KfRIMdP7h2c=
X-Received: by 2002:a05:6a00:1c8a:b0:851:8394:1696 with SMTP id d2e1a72fcca58-8562b49995emr39641326b3a.12.1788143979757;
        Sun, 30 Aug 2026 19:39:39 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a397deb5sm2881106b3a.52.2026.08.30.19.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:39:39 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pu Lehui <pulehui@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v4 2/2] selftests/bpf: Cover attach type checks in link update
Date: Mon, 31 Aug 2026 11:39:12 +0900
Message-ID: <20260831023918.1857658-2-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260831023918.1857658-1-sanghyun.park.cnu@gmail.com>
References: <20260831023918.1857658-1-sanghyun.park.cnu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add regression coverage for link update compatibility. Verify that a UDP6
sock_addr program cannot replace a UDP4 program and that an LSM_MAC
program cannot replace an LSM_CGROUP program.

Also verify that CGROUP_SKB attachment still requires CAP_NET_ADMIN, while
an existing link can be updated after dropping CAP_NET_ADMIN and
CAP_SYS_ADMIN.

Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
---
 .../selftests/bpf/prog_tests/cgroup_link.c    | 51 +++++++++++++++++++
 .../selftests/bpf/prog_tests/lsm_cgroup.c     | 10 ++++
 .../testing/selftests/bpf/progs/lsm_cgroup.c  |  6 +++
 .../selftests/bpf/progs/test_cgroup_link.c    | 14 ++++-
 4 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_link.c b/tools/testing/selftests/bpf/prog_tests/cgroup_link.c
index 15093a69510e..b3219314596e 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_link.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_link.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <test_progs.h>
+#include "cap_helpers.h"
 #include "cgroup_helpers.h"
 #include "testing_helpers.h"
 #include "test_cgroup_link.skel.h"
@@ -24,6 +25,55 @@ int ping_and_check(int exp_calls, int exp_alt_calls)
 	return 0;
 }
 
+static void test_cgroup_link_update(int cg_fd)
+{
+	const __u64 caps = (1ULL << CAP_NET_ADMIN) | (1ULL << CAP_SYS_ADMIN);
+	struct bpf_link *link = NULL;
+	__u64 saved_caps = 0;
+	int err;
+
+	link = bpf_program__attach_cgroup(skel->progs.sendmsg4, cg_fd);
+	if (!ASSERT_OK_PTR(link, "attach_sendmsg4"))
+		goto cleanup;
+
+	err = bpf_link__update_program(link, skel->progs.sendmsg6);
+	ASSERT_EQ(err, -EINVAL, "reject_sendmsg6_update");
+	bpf_link__destroy(link);
+	link = NULL;
+
+	err = cap_disable_effective(caps, &saved_caps);
+	if (!ASSERT_OK(err, "drop_caps_for_attach"))
+		goto cleanup;
+
+	link = bpf_program__attach_cgroup(skel->progs.egress, cg_fd);
+	if (!ASSERT_ERR_PTR(link, "attach_without_net_admin"))
+		goto cleanup;
+	err = libbpf_get_error(link);
+	link = NULL;
+	if (!ASSERT_EQ(err, -EPERM, "attach_err"))
+		goto cleanup;
+
+	err = cap_enable_effective(saved_caps & caps, NULL);
+	if (!ASSERT_OK(err, "restore_caps_for_attach"))
+		goto cleanup;
+
+	link = bpf_program__attach_cgroup(skel->progs.egress, cg_fd);
+	if (!ASSERT_OK_PTR(link, "attach_egress"))
+		goto cleanup;
+
+	err = cap_disable_effective(caps, &saved_caps);
+	if (!ASSERT_OK(err, "drop_caps"))
+		goto cleanup;
+
+	err = bpf_link__update_program(link, skel->progs.egress_alt);
+	ASSERT_OK(err, "update_without_net_admin");
+
+cleanup:
+	err = cap_enable_effective(saved_caps & caps, NULL);
+	ASSERT_OK(err, "restore_caps");
+	bpf_link__destroy(link);
+}
+
 void serial_test_cgroup_link(void)
 {
 	struct {
@@ -61,6 +111,7 @@ void serial_test_cgroup_link(void)
 	err = join_cgroup(cgs[last_cg].path);
 	if (CHECK(err, "cg_join", "fail: %d\n", err))
 		goto cleanup;
+	test_cgroup_link_update(cgs[last_cg].fd);
 
 	for (i = 0; i < cg_nr; i++) {
 		links[i] = bpf_program__attach_cgroup(skel->progs.egress,
diff --git a/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c b/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c
index 41e867467f6c..85b0af4f486a 100644
--- a/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c
+++ b/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c
@@ -74,6 +74,7 @@ static void test_lsm_cgroup_functional(void)
 	int bind_prog_fd = -1;
 	int bind_link_fd = -1;
 	int clone_prog_fd = -1;
+	int mac_prog_fd;
 	int err, fd, prio;
 	socklen_t socklen;
 
@@ -156,6 +157,15 @@ static void test_lsm_cgroup_functional(void)
 	ASSERT_EQ(query_prog_cnt(cgroup_fd, "bpf_lsm_socket_bind"), 1, "prog count");
 	ASSERT_EQ(query_prog_cnt(cgroup_fd, NULL), 4, "total prog count");
 
+	fd = bpf_link_create(bpf_program__fd(skel->progs.socket_first),
+			     cgroup_fd, BPF_LSM_CGROUP, NULL);
+	if (!ASSERT_GE(fd, 0, "link create socket_first"))
+		goto detach_cgroup;
+	mac_prog_fd = bpf_program__fd(skel->progs.socket_create_lsm);
+	err = bpf_link_update(fd, mac_prog_fd, NULL);
+	ASSERT_EQ(err, -EINVAL, "reject lsm_mac link update");
+	close(fd);
+
 	/* Attach another instance of bind program to another cgroup.
 	 * This should trigger the reuse of the trampoline shim (two
 	 * programs attaching to the same btf_id).
diff --git a/tools/testing/selftests/bpf/progs/lsm_cgroup.c b/tools/testing/selftests/bpf/progs/lsm_cgroup.c
index 3bfa479104be..30727945cecc 100644
--- a/tools/testing/selftests/bpf/progs/lsm_cgroup.c
+++ b/tools/testing/selftests/bpf/progs/lsm_cgroup.c
@@ -213,6 +213,12 @@ int BPF_PROG(socket_first, int family, int type, int protocol, int kern)
 	return 0;
 }
 
+SEC("lsm/socket_create")
+int BPF_PROG(socket_create_lsm, int family, int type, int protocol, int kern)
+{
+	return 0;
+}
+
 SEC("lsm_cgroup/socket_create")
 int BPF_PROG(socket_second, int family, int type, int protocol, int kern)
 {
diff --git a/tools/testing/selftests/bpf/progs/test_cgroup_link.c b/tools/testing/selftests/bpf/progs/test_cgroup_link.c
index 4faba88e45a5..a987744d129c 100644
--- a/tools/testing/selftests/bpf/progs/test_cgroup_link.c
+++ b/tools/testing/selftests/bpf/progs/test_cgroup_link.c
@@ -20,5 +20,17 @@ int egress_alt(struct __sk_buff *skb)
 	return 1;
 }
 
-char _license[] SEC("license") = "GPL";
+SEC("cgroup/sendmsg4")
+int sendmsg4(struct bpf_sock_addr *ctx)
+{
+	return 1;
+}
 
+SEC("cgroup/sendmsg6")
+int sendmsg6(struct bpf_sock_addr *ctx)
+{
+	ctx->msg_src_ip6[2] = 0;
+	return 1;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.48.1
