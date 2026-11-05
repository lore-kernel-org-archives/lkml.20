Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881029;
	b=CV3OgjOEGl2URCt1e7j/Eb1IcEsHmFkFQkWjI7MfF4OOGU8YYj4y5jKwq0YNyetIL/F6
	 gh+Wd2kCvobq501c0xaMfcUp3ANEy1oeUE46ZDoOxW8CNommWuGIqBH23RdIBrtusz9Qp
	 wfXiDT0asCqPTCToAZp9RY551UAr11XshXUMqW+qrohnzRRhe1ksgyb1HYPy9CmA92sob
	 bvMXpThHTnHQkH8EV9MT9+bVThVST7o9i5jlXT/OJ4Pl4OeVtu8MEktSAt5Yb7w9sppDu
	 CbKLD8dYXvVK82UWMfTAB4coQW5/auZOowTs8MFT2qm2OXEl1Oo+Za4xVsbYBZWY/dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=f96Pxu+FTpHnnidUC9kHsSvMST/qKtUp9MInF1FSebU=;
	b=W6AgaLXVisraaCUG7Yn33237Eu5DoWMblgwYkAdM6xMiT/Jw3BTjlCpef/EpZAEK0tsZ
	 +Wf9dGHfbFOlfPtos3DhTFCcgBHFa6kryDpDQKSTY5FXyQ1/wub+Kb/iQ0MiUs60RYlqw
	 Imx++ahhpPymCw8n1FgimM6UftQTAo3KZM1owkWpfU2lpxfTP9pi4W92RfEv/etRJq6++
	 0dJopkimP8HGH02KJ2RCxGAy//TI//cF2oqE73eiEa15rvnHTOiSHPK469YNZ72EImsII
	 0EzpQJu04JVhfanzr20sTlhBXLDz08yOMCiMST+DR0tCd36ms2TzcPZScZFDKaUPC4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PubjUOZF;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4B606EEBC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C4B606EEBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PubjUOZF
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2630654eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793881028; x=1794485828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f96Pxu+FTpHnnidUC9kHsSvMST/qKtUp9MInF1FSebU=;
        b=PubjUOZFIn6TfI8TFWd91gu5q+QFWOqi+Jh7QZAj/WHj8T1Fc4B9ftZue814hmpVB2
         oxctTwvoS51/bTaBj3/EWaP7m2u/u6UFlfuao4p0OrG8NtvD1Y93AprVwSg/28QFyb1S
         BgAoXwHkNHdiKh4po2KJOXc4m7Q1xHBfUio0wfleIEojSi0hWJpsSv/f5TgneiRzwOQO
         EppY0eds20AbNdCpYqlxBJFLuXjdTjqyIunAR7bbwGRTYuEATbNkP1RLt7nBN7hajp5W
         vZzLjuci5xFVsMslBiUpFYfhUljoERnRf8PrBNxlzdLmisrl5trDcDgWNyqszM01wzd3
         WXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881028; x=1794485828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f96Pxu+FTpHnnidUC9kHsSvMST/qKtUp9MInF1FSebU=;
        b=d96s/QSHj8OqR6hjj42moJJXO2OnjgIO0JS01tVG+Ivs5AvjgP4aCmjIErkLqDqs+n
         daBi6X0csQOHiRiT6rhk/ms9m0GEjpcHmMADbDbHiPG4uKZ3OMcYiom1t+yj1iSDhQSJ
         Guk9X/BVz2URuhtHlL0Bof0L2Tg7sDrteh9zTIuBb5I0gWDGveDP/9UsSernUoHsuABZ
         rJYqkVLL9Ntmptv002elLW+G7d6/uivtymQM1DWPSJQVhklkPoVTjsp9oBqcczq2PThN
         IpD/+NFwlzzUK77fN6olLPeBttR613OGFYnPsydICHudgLVI5g9DIDFwMsyko9gJAuw1
         n5nw==
X-Gm-Message-State: APuU4Z82N/x7y1sju/NLQKvsup9oPuZ5NdjDw/ApZ0bOCA7Qm08/+fx5
	pl724ZG6dpSf5zbYT1CIukY3R7vKdEW48xRs9Y3+pAqkaB/fBCcC+iyi
X-Gm-Gg: AYBFou2Clhdzwb4TqfNhrDSsNKXWuwEanTEii0xK5SNY304ubfGmQkJyXR7Dh5h/WAb
	RCS+kJTsYFRR4iXmRSNxXL7nWp6QckIRwkDb7pxwwSh3z1H+5PY/2iR3X0Fjl4AYVWwgikXUR2Z
	vckwgjrHX8qlMkk5azuhyUJhStUhrb0DvqQXMbgAae8kghIceUaxyGiVC2V7T1+z8Gm24ZhuUSx
	X73QRuKm/atJDvihEU70cILNi02wwHxssv+L7RmF+kyPjlghaRZb/jZlLcC7M+QhpWmLoW90/XI
	qxg+Rj3lHdnmb3JOnQ1ptFOcARLr7Zwx2op1MlVYongaBFErbWFRKa4o7da9yXo3fOaHhiy2xPY
	uP6nBBG/JSFXBxRtM10rXbHY3oNKhRgTKHRnuagaxC318/Mf24oS1NfRm1i1GEPEW8C5/GRqlS7
	BhsA2pvgShNz7Md6Z8RoRwM0/DL5s1BfV+eNeL5aZqVdoPhUBYgUKKCMc9B9ColYncFXmsD6yqH
	OVcbqHBvif/whYuc8awIQivaQVUnpO7rrcRLfLy5q15j9M/K0S8TcqSfrnmBpu+ftNQwGyXKITY
	vMmOVfuS4VsNiPFzDmFrM6nL6IsZz9hJ+qUM1/cBt1TeYaziXpNpRv03vYfE4/wpDWI=
X-Received: by 2002:a05:7300:ec89:b0:36e:97b4:1071 with SMTP id 5a478bee46e88-36e97b4317emr1464294eec.14.1793881027670;
        Thu, 05 Nov 2026 04:17:07 -0800 (PST)
Received: from boogieman ([2409:40c0:28:cf7f:a8e0:3d30:1c1a:630f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm21534841eec.23.2026.11.05.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:17:07 -0800 (PST)
From: Abhishek Khade <abhishekkhade69@gmail.com>
To: bpf@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Abhishek Khade <abhishekkhade69@gmail.com>
Subject: [PATCH] bpf: Add network namespace boundary inspection kfuncs
Date: Thu,  5 Nov 2026 17:46:42 +0530
Message-ID: <20261105121642.38019-1-abhishekkhade69@gmail.com>
X-Mailer: git-send-email 2.53.0
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

eBPF tracing and networking programs frequently need to determine whether
an execution event originates from the initial host network namespace
(init_net) or an isolated container namespace, as well as extract the
namespace inode identifier for correlation.

Currently, dereferencing task->nsproxy->net_ns directly via BPF CO-RE
presents safety and architectural challenges:
1. nsproxy can be NULL during concurrent unshare or task exit teardown.
2. Direct comparison against &init_net exposes host kernel addresses,
   complicating verification and KASLR safety.
3. Reading deep pointer chains without RCU synchronization can trigger
   verifier rejections or race against namespace cleanup.

Introduce three BPF kfuncs to safely inspect network namespace boundaries:
- bpf_task_is_init_net(struct task_struct *task): Returns 1 if the task
  belongs to the initial host network namespace, 0 otherwise.
- bpf_task_get_netns_inum(struct task_struct *task): Returns the inode
  number of the task's network namespace, or 0 on failure.
- bpf_sock_is_init_net(struct sock *sk): Returns 1 if the socket belongs
  to init_net, 0 otherwise.

These helpers are registered under generic_btf_ids with the KF_RCU flag,
allowing safe invocation within RCU read-side critical sections across
tracing, LSM, and socket programs.

Add automated selftests under tools/testing/selftests/bpf validating host
detection and container isolation via unshare(CLONE_NEWNET).

Signed-off-by: Abhishek Khade <abhishekkhade69@gmail.com>
---
 kernel/bpf/helpers.c                          |  79 +++++++++++++
 .../selftests/bpf/prog_tests/netns_kfunc.c    | 104 ++++++++++++++++++
 .../selftests/bpf/progs/test_netns_kfunc.c    |  32 ++++++
 3 files changed, 215 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/netns_kfunc.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_netns_kfunc.c

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 6788489a2..3584703d1 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -18,6 +18,9 @@
 #include <linux/pid_namespace.h>
 #include <linux/poison.h>
 #include <linux/proc_ns.h>
+#include <linux/nsproxy.h>
+#include <net/net_namespace.h>
+#include <net/sock.h>
 #include <linux/sched/task.h>
 #include <linux/security.h>
 #include <linux/btf_ids.h>
@@ -2991,6 +2994,77 @@ __bpf_kfunc long bpf_task_under_cgroup(struct task_struct *task,
 	return ret;
 }
 
+#ifdef CONFIG_NET
+/**
+ * bpf_task_is_init_net - check whether task belongs to initial network namespace
+ * @task: the task to be tested
+ *
+ * Returns true if @task belongs to the initial network namespace (init_net),
+ * or false otherwise (or if @task or its nsproxy is NULL).
+ */
+__bpf_kfunc bool bpf_task_is_init_net(const struct task_struct *task)
+{
+	struct nsproxy *nsproxy;
+	struct net *net;
+	bool ret = false;
+
+	if (!task)
+		return false;
+
+	rcu_read_lock();
+	nsproxy = rcu_dereference(task->nsproxy);
+	if (nsproxy) {
+		net = READ_ONCE(nsproxy->net_ns);
+		ret = (net == &init_net);
+	}
+	rcu_read_unlock();
+
+	return ret;
+}
+
+/**
+ * bpf_task_get_netns_inum - get inode number of task's network namespace
+ * @task: the task to inspect
+ *
+ * Returns the inode number (inum) of @task's network namespace, or 0 if
+ * @task, its nsproxy, or net_ns is NULL.
+ */
+__bpf_kfunc u32 bpf_task_get_netns_inum(const struct task_struct *task)
+{
+	struct nsproxy *nsproxy;
+	struct net *net;
+	u32 inum = 0;
+
+	if (!task)
+		return 0;
+
+	rcu_read_lock();
+	nsproxy = rcu_dereference(task->nsproxy);
+	if (nsproxy) {
+		net = READ_ONCE(nsproxy->net_ns);
+		if (net)
+			inum = net->ns.inum;
+	}
+	rcu_read_unlock();
+
+	return inum;
+}
+
+/**
+ * bpf_sock_is_init_net - check whether socket belongs to initial network namespace
+ * @sk: the socket to be tested
+ *
+ * Returns true if @sk belongs to init_net, or false otherwise (or if @sk is NULL).
+ */
+__bpf_kfunc bool bpf_sock_is_init_net(const struct sock *sk)
+{
+	if (!sk)
+		return false;
+
+	return net_eq(sock_net(sk), &init_net);
+}
+#endif /* CONFIG_NET */
+
 BPF_CALL_2(bpf_current_task_under_cgroup, struct bpf_map *, map, u32, idx)
 {
 	struct bpf_array *array = container_of(map, struct bpf_array, map);
@@ -5151,6 +5225,11 @@ BTF_ID_FLAGS(func, bpf_cgroup_from_id, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_under_cgroup, KF_RCU)
 BTF_ID_FLAGS(func, bpf_task_get_cgroup1, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
 #endif
+#ifdef CONFIG_NET
+BTF_ID_FLAGS(func, bpf_task_is_init_net, KF_RCU)
+BTF_ID_FLAGS(func, bpf_task_get_netns_inum, KF_RCU)
+BTF_ID_FLAGS(func, bpf_sock_is_init_net, KF_RCU)
+#endif
 BTF_ID_FLAGS(func, bpf_task_from_pid, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_from_vpid, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_throw)
diff --git a/tools/testing/selftests/bpf/prog_tests/netns_kfunc.c b/tools/testing/selftests/bpf/prog_tests/netns_kfunc.c
new file mode 100644
index 000000000..3072f7ede
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/netns_kfunc.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Abhishek Khade */
+
+#define _GNU_SOURCE
+#include <sched.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <test_progs.h>
+#include "test_netns_kfunc.skel.h"
+
+void test_netns_kfunc(void)
+{
+	struct test_netns_kfunc *skel;
+	int pipefd[2];
+	pid_t pid;
+	int status = 0;
+	u32 host_inum;
+
+	skel = test_netns_kfunc__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	if (!ASSERT_OK(test_netns_kfunc__attach(skel), "attach"))
+		goto cleanup;
+
+	/* Test 1: Process running in initial network namespace */
+	if (!ASSERT_OK(pipe(pipefd), "pipe_init"))
+		goto cleanup;
+
+	pid = fork();
+	if (!ASSERT_GE(pid, 0, "fork_host")) {
+		close(pipefd[0]);
+		close(pipefd[1]);
+		goto cleanup;
+	}
+
+	if (pid == 0) {
+		close(pipefd[1]);
+		if (read(pipefd[0], &status, sizeof(status)) < 0)
+			exit(1);
+		close(pipefd[0]);
+		execlp("true", "true", NULL);
+		exit(1);
+	}
+
+	skel->bss->target_pid = pid;
+	close(pipefd[0]);
+	if (write(pipefd[1], &status, sizeof(status)) < 0) {
+		close(pipefd[1]);
+		waitpid(pid, NULL, 0);
+		goto cleanup;
+	}
+	close(pipefd[1]);
+	waitpid(pid, &status, 0);
+
+	ASSERT_EQ(skel->bss->inv_is_init_net, 1, "host_task_is_init_net");
+	ASSERT_GT(skel->bss->inv_netns_inum, 0, "host_netns_inum_valid");
+	host_inum = skel->bss->inv_netns_inum;
+
+	/* Reset state */
+	skel->bss->inv_is_init_net = -1;
+	skel->bss->inv_netns_inum = 0;
+
+	/* Test 2: Process running in a new network namespace */
+	if (!ASSERT_OK(pipe(pipefd), "pipe_netns"))
+		goto cleanup;
+
+	pid = fork();
+	if (!ASSERT_GE(pid, 0, "fork_netns")) {
+		close(pipefd[0]);
+		close(pipefd[1]);
+		goto cleanup;
+	}
+
+	if (pid == 0) {
+		close(pipefd[1]);
+		if (read(pipefd[0], &status, sizeof(status)) < 0)
+			exit(1);
+		close(pipefd[0]);
+
+		if (unshare(CLONE_NEWNET) != 0)
+			exit(1);
+
+		execlp("true", "true", NULL);
+		exit(1);
+	}
+
+	skel->bss->target_pid = pid;
+	close(pipefd[0]);
+	if (write(pipefd[1], &status, sizeof(status)) < 0) {
+		close(pipefd[1]);
+		waitpid(pid, NULL, 0);
+		goto cleanup;
+	}
+	close(pipefd[1]);
+	waitpid(pid, &status, 0);
+
+	ASSERT_EQ(skel->bss->inv_is_init_net, 0, "netns_task_not_init_net");
+	ASSERT_GT(skel->bss->inv_netns_inum, 0, "child_netns_inum_valid");
+	ASSERT_NEQ(skel->bss->inv_netns_inum, host_inum, "netns_inum_different");
+
+cleanup:
+	test_netns_kfunc__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/test_netns_kfunc.c b/tools/testing/selftests/bpf/progs/test_netns_kfunc.c
new file mode 100644
index 000000000..3ad49f8ba
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_netns_kfunc.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Abhishek Khade */
+
+#include <vmlinux.h>
+#include <bpf/bpf_tracing.h>
+#include <bpf/bpf_helpers.h>
+
+#include "bpf_misc.h"
+
+bool bpf_task_is_init_net(const struct task_struct *task) __ksym;
+u32 bpf_task_get_netns_inum(const struct task_struct *task) __ksym;
+
+pid_t target_pid;
+int inv_is_init_net = -1;
+u32 inv_netns_inum;
+
+SEC("tp_btf/sched_process_exec")
+int BPF_PROG(on_exec, struct task_struct *task, u64 old_pid,
+	     struct linux_binprm *bprm)
+{
+	pid_t pid = task->tgid;
+
+	if (pid != target_pid)
+		return 0;
+
+	inv_is_init_net = bpf_task_is_init_net(task) ? 1 : 0;
+	inv_netns_inum = bpf_task_get_netns_inum(task);
+
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.53.0

