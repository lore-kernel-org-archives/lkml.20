Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6A02D9EE7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864040; cv=none; b=O7l6KChWzML0HWQDNkijf7WpVL7apnaER31vVe1xaKhecaMrlikGEG2E6PzYhvEYw76O3om78nNn9KF7m0E4wILvM+YW1kuXxxN0OAtPtcLH1cs6OGR4AzMybQJETY8JXJdcGYENV7ChfNMb6XKJT8r84jy15tB14CsRnll1b24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864040; c=relaxed/simple;
	bh=IKY5xnhVKvMNQH23/mMn9H4jKWqCMgT6kz9PFnV2MqM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ShvUrC8TZaWEwjCEPdevEVNirveC3hv9YnJN9r8eowC/DXASBjELjgs2SiJ3NtICSagpsPfUYLy8hvZ+fYJ5oFV+Pe2fSjrOuwMHeQzJ/cnJn4hKG/npcBCZXSzScqJVzJYF6lW5Rlz2Y2Qc+lfcwIWo8BifcC8h1nhrS2HU+kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rohitner.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hL/tRn/p; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rohitner.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hL/tRn/p"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac16335199so954573a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791864037; x=1792468837; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVY4B9rehNRPw7ZQqZE00yhPApXSrH1ROghvzVoFxEc=;
        b=hL/tRn/psKwXXgcJ8iIbWletGI686dDUj7zIHiRQmc43APzG+hRgIolIUJpZsXxVRi
         pnQaJtpZrDmkhzWlDNNTRj8m7hCFKv3NFvoXjSdWU366AunRYCjcVK9Hxk4QZmkOKudQ
         /3Fbx/HIM523oEQ/8QCQX9hY/I64VmMWxFc7KOtDfsxofRq3TlJIqcpit2ERCioyQRYb
         5mmnV3CEUL/TlBd9tdQxaG2sSWC/Ow//gZPZZ7K0vTcg7TnvN2l7oIJXjKUX5SzIdbx+
         E6mzrsV/aI3+LypBp7jjfDQdoLDhsKsI1k5QsMvYmUjwLQ20hUH1JbyiCcpFMGE6dZG9
         mo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791864037; x=1792468837;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVY4B9rehNRPw7ZQqZE00yhPApXSrH1ROghvzVoFxEc=;
        b=GynYzpeY3A/+llWskbeM9AhfZw+pqwZigsEotqV5mF+OcTB7tre74LyrwtybBH3YT0
         must1qHEDlrjtqXYwIP10XGkKrWRG2EToREQfgvVwQrUNxW7Atwwz6Z0vWAUXtOYggrY
         XrF1UdcZDEvZUHJM7KccMtiprnxBK7gxUvSTVoPOleDRVylF5smvk56gLDVS2eODvZ3m
         KsgM9X0nvpsZhzjNSTTHfI4TygcHxAvyCJ6lyL92hzEc95fZ4s3hBcNAFsB1M5/ufUcp
         YBfIkfL+NU7lN/O+lwpV3C5CN/pSlkVFoEPKZpkpT5yIFj92kMYskiMlwts203B9bKeu
         KQUA==
X-Forwarded-Encrypted: i=1; AKwUvBzPf/M2XEFjf//nMPQeo7yUEKTfKm4aO/LfUgAS7zfSqeYI6RUqh2/GHZCH7QRxL+6FqrCN43QKG3DeKkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkjIbZNa2iNijBnrph9BtCdLbuIP2xzYz2mxVN/L6iy/CmNUAd
	OLk3dmAE8Wxvmj1w6Tbo33rRYOX7KIuAlRQn6nVQUokUl9H3mUPhsTrfqK3eFtZJqLwJBINbPOo
	m1UoxiXD0/Bqhkw==
X-Received: from plbjy7.prod.google.com ([2002:a17:903:42c7:b0:2e8:1305:c8e1])
 (user=rohitner job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d44b:b0:3a8:e1e:3390 with SMTP id 98e67ed59e1d1-3ab3afd49c9mr9663138a91.56.1791864037283;
 Mon, 12 Oct 2026 21:00:37 -0700 (PDT)
Date: Tue, 13 Oct 2026 04:00:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013040034.3919469-1-rohitner@google.com>
Subject: [PATCH] mm/memcontrol: log userspace OOM wait entry and completion
From: Rohit Ner <rohitner@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Rohit Ner <rohitner@google.com>
Content-Type: text/plain; charset="UTF-8"

When a memory cgroup hits its limit with memory.oom_control
oom_kill_disable configured, mem_cgroup_oom_synchronize() puts the
faulting task to sleep on memcg_oom_waitq and notifies userspace OOM
handlers to reclaim memory, enlarge limits, or terminate tasks. On
platforms where userspace is severely stalled under memory pressure
before a hardware or software watchdog reset, no kernel breadcrumb is
currently emitted when a memcg enters or exits this userspace OOM wait.

Log rate-limited KERN_ERR messages (pr_err_ratelimited) upon entering
and completing the userspace OOM wait in mem_cgroup_oom_synchronize(),
including the memcg path, memory usage/limit/unevictable stats, elapsed
waited_ms, and whether the task exited due to a fatal signal.

Signed-off-by: Rohit Ner <rohitner@google.com>
---
 mm/memcontrol-v1.c | 49 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index 05ef55cae..7832ce11f 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -91,6 +91,12 @@ struct mem_cgroup_event {
 #define MEMFILE_TYPE(val)	((val) >> 16 & 0xffff)
 #define MEMFILE_ATTR(val)	((val) & 0xffff)
 
+#define MEMCG_OOM_WAIT_PATH_LEN		128
+#define MEMCG_OOM_STAGE_ENTER		"enter"
+#define MEMCG_OOM_STAGE_RECOVERED	"recovered"
+#define MEMCG_OOM_STAGE_KILLED		"killed"
+#define MEMCG_OOM_UNKNOWN_PATH		"<unknown>"
+
 enum {
 	RES_USAGE,
 	RES_LIMIT,
@@ -1372,6 +1378,34 @@ void memcg1_oom_recover(struct mem_cgroup *memcg)
 		__wake_up(&memcg_oom_waitq, TASK_NORMAL, 0, memcg);
 }
 
+/**
+ * memcg1_log_oom_wait - Log memcg userspace OOM wait entry and completion
+ * @memcg: The memory cgroup experiencing the userspace OOM wait
+ * @stage: Lifecycle stage string ("enter", "recovered", or "killed")
+ * @waited_ms: Elapsed time spent waiting on memcg_oom_waitq in milliseconds
+ * @killed: Whether the waiting task woke with a fatal signal pending
+ *
+ * Emits a rate-limited KERN_ERR message so that memcg userspace OOM handler
+ * stalls are captured on serial consoles even when booted with quiet
+ * (console_loglevel=4) and preserved in dmesg.
+ */
+static void memcg1_log_oom_wait(struct mem_cgroup *memcg, const char *stage,
+				unsigned int waited_ms, bool killed)
+{
+	char cgrp_path[MEMCG_OOM_WAIT_PATH_LEN];
+	u64 usage_kb = K((u64)page_counter_read(&memcg->memory));
+	u64 limit_kb = K((u64)READ_ONCE(memcg->memory.max));
+	u64 unevictable_kb = K((u64)memcg_page_state(memcg, NR_UNEVICTABLE));
+
+	if (cgroup_path(memcg->css.cgroup, cgrp_path, sizeof(cgrp_path)) < 0)
+		strscpy(cgrp_path, MEMCG_OOM_UNKNOWN_PATH, sizeof(cgrp_path));
+
+	pr_err_ratelimited("memcg_oom_wait: stage=%s cgroup=%s comm=%s pid=%d usage_kb=%llu limit_kb=%llu unevictable_kb=%llu waited_ms=%u killed=%d\n",
+			   stage, cgrp_path, current->comm, current->pid,
+			   usage_kb, limit_kb, unevictable_kb,
+			   waited_ms, killed);
+}
+
 /**
  * mem_cgroup_oom_synchronize - complete memcg OOM handling
  * @handle: actually kill/wait or just clean up the OOM state
@@ -1393,6 +1427,7 @@ bool mem_cgroup_oom_synchronize(bool handle)
 {
 	struct mem_cgroup *memcg = current->memcg_in_oom;
 	struct oom_wait_info owait;
+	unsigned long start_jiffies = 0;
 	bool locked;
 
 	/* OOM is global, do not handle */
@@ -1413,10 +1448,22 @@ bool mem_cgroup_oom_synchronize(bool handle)
 
 	locked = mem_cgroup_oom_trylock(memcg);
 
-	if (locked)
+	if (locked) {
+		start_jiffies = jiffies;
+		memcg1_log_oom_wait(memcg, MEMCG_OOM_STAGE_ENTER, 0, false);
 		mem_cgroup_oom_notify(memcg);
+	}
 
 	schedule();
+	if (locked) {
+		bool killed = fatal_signal_pending(current);
+
+		memcg1_log_oom_wait(memcg,
+				    killed ? MEMCG_OOM_STAGE_KILLED :
+					     MEMCG_OOM_STAGE_RECOVERED,
+				    jiffies_to_msecs(jiffies - start_jiffies),
+				    killed);
+	}
 	mem_cgroup_unmark_under_oom(memcg);
 	finish_wait(&memcg_oom_waitq, &owait.wait);
 
-- 
2.56.0.385.gd3acb90ef8-goog

