Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766925;
	b=1K96M4ILYUPAII8ighXZjfbFuCFR+juf+apnFtdBJmdlnpcyOz/OPyHstyF0KhtDyLBq
	 jYKqSyIyNagF+ImlLNytwiMVbQrLn8Yl/MJUGsr8GEWJFe05Oi+VMdcHYGfF0GIeRYBXH
	 G1DvgV0tVxvsRVdygH6viFwzJjpZ4VdgSnA9ZBmMXjkUglHN4Ynu7fWanqvGsqsH2cEg1
	 WTX/v6XorGRfPSjRDekmy1r7GIZ9D0neRV37p3+Xlm/ArF2mc8fBPlsynIUl4Gx1or5Gg
	 EoEP6sFcwbVCMLEp5zxOuK3OUdfeS+I9WFI6VlmmhYzFd9yC3Lg2uE+wNtrnJG2oTVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Z8L5doemJ2L26qD9NOMnRM9g/MDpa5Z25nsKzS/8s8k=;
	b=AvOZZX98dU5CDB+Dx4OTt9QsWxvfjpBkXY5admRAECgJpe81ce+Se45pWcmXqMoY1viE
	 W+X3cWr+oV0vRsS6WISfjaKJ88FprLGmo+u9Hvqo685gzVEkp/dshJuQRhMRbE6zIr6aD
	 Hs257rVNhwn4BsoP9YpRLsog1UQiBkSkFQF0PhU2FiDjgWfNYWlVG+gOh8zP5F/cKS+I2
	 oLJvHi5fOcIaZTATNP2xMRgFLoS+5il494K6nOc6X5RqYiN9VJAE6YNuL0ZnYEzhurB+s
	 jeelKe563V3uDMIusDLdraBRxfAYxr3dQELwvT6qDlH5aJVQePxCVtXZ2Y/EOWLPsOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NnWE+DZZ;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26234606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26234606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NnWE+DZZ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so166335e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792766922; x=1793371722; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8L5doemJ2L26qD9NOMnRM9g/MDpa5Z25nsKzS/8s8k=;
        b=NnWE+DZZqdFDbrWu6zFkpnjtrItX6e3TWWjbL80C01CUZwbJoIbJn917TPcvFsSNZC
         tNsbdb1/VVcA5tHo4D2DyC4Dm65Nz+r+R8SmuQ8pC6o1ki2jrbKL4h87aDsGqHEQaRK8
         uCDMesyl945E4RohE5ql2eBISOKrL+Hg3yb9+f2DZf193RLzm0C0dqEBrSc4mwcplpWb
         qXbb0QYAt4nFN5BnX+ZNTsATmdHjuC7WGrwWA1DkDzg4Z8If+vOjWrvEfmCfXGRRfyng
         8/EZ56gnj2GM96GJJ5QQv2zKY9JR65UJ8bJCjOXbMcmst7dt0Iw1pbCpuqx9241+f3jY
         L2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766922; x=1793371722;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8L5doemJ2L26qD9NOMnRM9g/MDpa5Z25nsKzS/8s8k=;
        b=PF9KMxX7TOEub4PJlQ9UgLWf/h9K9zyiQ0Zn3vN04AuewCmdps6tsDt5wP9IdNDVJy
         guaEDRbenkZGq0KXDJ+4rECSdW8sCiFmHWnlcYsLwEMn5cOVfgru9ztrLUhXDDcLI6pJ
         fLM4Whgu002oIiZFVL64KpNimR1XoZoawgbRGGi5YLDnaD3T44x6MDDNDKlNTNRTAtsT
         zdXpEGTL5O2H9mlyvL4DaM8nn3FP6Tm4KYHs0NSD1gDZECw7utNE34NZ6e0cssz7l80B
         wdaj927zxlt4AfyMOXUd1icQXy1kEnjkMpamsJG2lYv87aOP+3a2rufTO/mOLFUIYGso
         bf/A==
X-Forwarded-Encrypted: i=1; AKwUvBz8P/Culdyw/hSFc04QVuGou/Py96HqULkXmLLgeRRxjoRku7Paf0nGzE4Gv1gFwCU2x68ZI1yVtLZYCv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzp+IVM0UO6JiTGplIfSoKLcRM84oNTtUQ5Z6CHHMzjOLPKHXU
	ZU9U/PvwfGks2bUZHqCVYpyZH6L3mmdahupjAJf+n88iqke3MklqdmTh2BUnzlGwnRliD3xGoEq
	lpxtL8YO+f6T45g==
X-Received: from wmpg19.prod.google.com ([2002:a05:600c:4c93:b0:4a2:9a2:d9ad])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4513:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a211c65b12mr39795165e9.8.1792766922262;
 Fri, 23 Oct 2026 07:48:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:48:05 +0000
In-Reply-To: <20261023144811.2230393-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023144811.2230393-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023144811.2230393-3-jpiecuch@google.com>
Subject: [PATCH 2/2] selftests/sched_ext: Test SCX_ENQ_CPU_SELECTED with
 queued wakeups
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a test that checks that SCX_ENQ_CPU_SELECTED on a wakeup
ops.enqueue() is set if and only if ops.select_cpu() ran for that wakeup.
The scheduler sets SCX_OPS_ALLOW_QUEUED_WAKEUP so that queued wakeups
are covered too.

ops.select_cpu() records in task storage that it ran and on which CPU.
ops.enqueue() checks that record against SCX_ENQ_CPU_SELECTED. Pairs of
tasks ping-pong over pipes to generate the wakeups. An enqueue on a CPU
other than the one that ran ops.select_cpu() is counted as a queued
wakeup. The test is skipped if none are seen.

This test was written with the help of an AI coding assistant.

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../sched_ext/enq_cpu_selected.bpf.c          | 107 +++++++++++++
 .../selftests/sched_ext/enq_cpu_selected.c    | 149 ++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 tools/testing/selftests/sched_ext/enq_cpu_selected.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/enq_cpu_selected.c

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index c5d3a2eaea7d..2e21e28426e2 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -175,6 +175,7 @@ auto-test-targets :=			\
 	ddsp_vtimelocal_fail		\
 	dsp_local_on			\
 	enable_cmask			\
+	enq_cpu_selected		\
 	enq_select_cpu			\
 	exit				\
 	hotplug				\
diff --git a/tools/testing/selftests/sched_ext/enq_cpu_selected.bpf.c b/tools/testing/selftests/sched_ext/enq_cpu_selected.bpf.c
new file mode 100644
index 000000000000..80e40592332a
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/enq_cpu_selected.bpf.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify that SCX_ENQ_CPU_SELECTED is set on a wakeup ops.enqueue() if and
+ * only if ops.select_cpu() was called for that wakeup. The scheduler sets
+ * SCX_OPS_ALLOW_QUEUED_WAKEUP so that the wakeups which are delivered through
+ * the ttwu wakelist (and thus enqueued on a CPU other than the one that ran
+ * ops.select_cpu()) are covered too.
+ */
+
+#include <scx/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+UEI_DEFINE(uei);
+
+struct task_ctx {
+	bool	select_cpu_called;
+	s32	select_cpu_on;
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_TASK_STORAGE);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__type(key, int);
+	__type(value, struct task_ctx);
+} task_ctx_stor SEC(".maps");
+
+/*
+ * nr_selected: wakeup enqueues preceded by ops.select_cpu()
+ * nr_queued:   of those, enqueues on a CPU other than the one which ran
+ *		ops.select_cpu(), i.e. delivered through the wakelist
+ * nr_missing:  ops.select_cpu() was called, SCX_ENQ_CPU_SELECTED is clear
+ * nr_spurious: ops.select_cpu() wasn't called, SCX_ENQ_CPU_SELECTED is set
+ */
+u64 nr_selected, nr_queued, nr_missing, nr_spurious;
+
+s32 BPF_STRUCT_OPS(enq_cpu_selected_select_cpu, struct task_struct *p,
+		   s32 prev_cpu, u64 wake_flags)
+{
+	struct task_ctx *tctx;
+
+	/* fork enqueues don't carry SCX_ENQ_WAKEUP, only track ttwu */
+	if (!(wake_flags & SCX_WAKE_TTWU))
+		return prev_cpu;
+
+	tctx = bpf_task_storage_get(&task_ctx_stor, p, 0, 0);
+	if (tctx) {
+		tctx->select_cpu_called = true;
+		tctx->select_cpu_on = bpf_get_smp_processor_id();
+	}
+
+	return prev_cpu;
+}
+
+void BPF_STRUCT_OPS(enq_cpu_selected_enqueue, struct task_struct *p,
+		    u64 enq_flags)
+{
+	struct task_ctx *tctx;
+
+	tctx = bpf_task_storage_get(&task_ctx_stor, p, 0, 0);
+	if (tctx) {
+		bool called = tctx->select_cpu_called;
+		bool flagged = enq_flags & SCX_ENQ_CPU_SELECTED;
+
+		tctx->select_cpu_called = false;
+
+		if (enq_flags & SCX_ENQ_WAKEUP) {
+			if (called) {
+				__sync_fetch_and_add(&nr_selected, 1);
+				if (bpf_get_smp_processor_id() != tctx->select_cpu_on)
+					__sync_fetch_and_add(&nr_queued, 1);
+			}
+			if (called && !flagged)
+				__sync_fetch_and_add(&nr_missing, 1);
+			if (!called && flagged)
+				__sync_fetch_and_add(&nr_spurious, 1);
+		}
+	}
+
+	scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL, SCX_SLICE_DFL, enq_flags);
+}
+
+s32 BPF_STRUCT_OPS(enq_cpu_selected_init_task, struct task_struct *p,
+		   struct scx_init_task_args *args)
+{
+	if (!bpf_task_storage_get(&task_ctx_stor, p, 0,
+				  BPF_LOCAL_STORAGE_GET_F_CREATE))
+		return -ENOMEM;
+
+	return 0;
+}
+
+void BPF_STRUCT_OPS(enq_cpu_selected_exit, struct scx_exit_info *ei)
+{
+	UEI_RECORD(uei, ei);
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops enq_cpu_selected_ops = {
+	.select_cpu		= (void *)enq_cpu_selected_select_cpu,
+	.enqueue		= (void *)enq_cpu_selected_enqueue,
+	.init_task		= (void *)enq_cpu_selected_init_task,
+	.exit			= (void *)enq_cpu_selected_exit,
+	.flags			= SCX_OPS_ALLOW_QUEUED_WAKEUP,
+	.name			= "enq_cpu_selected",
+	.timeout_ms		= 1000U,
+};
diff --git a/tools/testing/selftests/sched_ext/enq_cpu_selected.c b/tools/testing/selftests/sched_ext/enq_cpu_selected.c
new file mode 100644
index 000000000000..efcec91ce0d4
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/enq_cpu_selected.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify that SCX_ENQ_CPU_SELECTED reliably tells ops.enqueue() whether
+ * ops.select_cpu() was called, including for queued (wakelist) wakeups.
+ */
+#include <bpf/bpf.h>
+#include <scx/common.h>
+#include <signal.h>
+#include <stdio.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include "enq_cpu_selected.bpf.skel.h"
+#include "scx_test.h"
+
+#define NR_PAIRS	4
+#define WARMUP_MS	200
+#define RUN_MS		2000
+
+static enum scx_test_status setup(void **ctx)
+{
+	struct enq_cpu_selected *skel;
+
+	skel = enq_cpu_selected__open();
+	SCX_FAIL_IF(!skel, "Failed to open");
+	SCX_ENUM_INIT(skel);
+	SCX_FAIL_IF(enq_cpu_selected__load(skel), "Failed to load skel");
+
+	*ctx = skel;
+
+	return SCX_TEST_PASS;
+}
+
+/* Bounce a byte back and forth between two tasks to generate wakeups. */
+static void pingpong(int rfd, int wfd, bool initiator)
+{
+	char c = 0;
+
+	if (initiator && write(wfd, &c, 1) != 1)
+		exit(1);
+
+	while (true) {
+		if (read(rfd, &c, 1) != 1)
+			exit(1);
+		if (write(wfd, &c, 1) != 1)
+			exit(1);
+	}
+}
+
+static int spawn_pair(pid_t *pids)
+{
+	int a2b[2], b2a[2];
+
+	if (pipe(a2b) || pipe(b2a))
+		return -errno;
+
+	pids[0] = fork();
+	if (pids[0] < 0)
+		return -errno;
+	if (!pids[0])
+		pingpong(b2a[0], a2b[1], true);
+
+	pids[1] = fork();
+	if (pids[1] < 0)
+		return -errno;
+	if (!pids[1])
+		pingpong(a2b[0], b2a[1], false);
+
+	close(a2b[0]);
+	close(a2b[1]);
+	close(b2a[0]);
+	close(b2a[1]);
+
+	return 0;
+}
+
+static enum scx_test_status run(void *ctx)
+{
+	struct enq_cpu_selected *skel = ctx;
+	pid_t pids[NR_PAIRS * 2] = {};
+	enum scx_test_status ret = SCX_TEST_PASS;
+	struct bpf_link *link;
+	int i;
+
+	link = bpf_map__attach_struct_ops(skel->maps.enq_cpu_selected_ops);
+	SCX_FAIL_IF(!link, "Failed to attach scheduler");
+
+	for (i = 0; i < NR_PAIRS; i++) {
+		if (spawn_pair(&pids[i * 2])) {
+			SCX_ERR("Failed to spawn workers");
+			ret = SCX_TEST_FAIL;
+			goto out;
+		}
+	}
+
+	/* skip the wakeups racing the scheduler enable */
+	usleep(WARMUP_MS * 1000);
+	skel->bss->nr_selected = 0;
+	skel->bss->nr_queued = 0;
+	skel->bss->nr_missing = 0;
+	skel->bss->nr_spurious = 0;
+
+	usleep(RUN_MS * 1000);
+
+	fprintf(stderr, "selected=%llu queued=%llu missing=%llu spurious=%llu\n",
+		(unsigned long long)skel->bss->nr_selected,
+		(unsigned long long)skel->bss->nr_queued,
+		(unsigned long long)skel->bss->nr_missing,
+		(unsigned long long)skel->bss->nr_spurious);
+
+	if (skel->bss->nr_missing || skel->bss->nr_spurious) {
+		SCX_ERR("SCX_ENQ_CPU_SELECTED doesn't match ops.select_cpu() calls");
+		ret = SCX_TEST_FAIL;
+	} else if (!skel->bss->nr_queued) {
+		fprintf(stderr, "No queued wakeups observed, skipping\n");
+		ret = SCX_TEST_SKIP;
+	}
+
+	if (skel->data->uei.kind != EXIT_KIND(SCX_EXIT_NONE)) {
+		SCX_ERR("Scheduler exited unexpectedly (kind=%llu)",
+			(unsigned long long)skel->data->uei.kind);
+		ret = SCX_TEST_FAIL;
+	}
+out:
+	for (i = 0; i < NR_PAIRS * 2; i++) {
+		if (pids[i] > 0) {
+			kill(pids[i], SIGKILL);
+			waitpid(pids[i], NULL, 0);
+		}
+	}
+	bpf_link__destroy(link);
+
+	return ret;
+}
+
+static void cleanup(void *ctx)
+{
+	struct enq_cpu_selected *skel = ctx;
+
+	enq_cpu_selected__destroy(skel);
+}
+
+struct scx_test enq_cpu_selected = {
+	.name = "enq_cpu_selected",
+	.description = "Verify SCX_ENQ_CPU_SELECTED on queued wakeups",
+	.setup = setup,
+	.run = run,
+	.cleanup = cleanup,
+};
+REGISTER_SCX_TEST(&enq_cpu_selected)
-- 
2.56.0.257.gf7497c7d27-goog

