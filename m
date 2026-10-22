Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634289;
	b=GZg5mb2JiPEe3s8YBxMNMYbIFrNS5HonfpwdTZm78Iz8dtNDbzPpOznbA5M+IXi/x0ZT
	 IWkg0Yb/0AqqWPxmVbZCNJ4wvFdWjIHWyrXFeIAGhAknbrlqtMjgatLnPm7fMU9kgJuqd
	 ia/9WUoorM1s7nMb998xdYqCEyMCpavlXLLnns142uUuQ8B7FrhkjOPAibivQ9CgDEFGZ
	 sJnDpaG3PifNDxZo7nfaveWyuOd9zasvlsUNEHbWj9ZxzGdn1Awcfiw3ozLYfDYKaguZV
	 nyWVzjcIumfyAr5WQ+YHoV43i/7jLk2DiDazYw8s1UPL/bsXECbDv3mcLIenbtp9dUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mq98Rc54j/apXLpD8jeCAQO2NMmsGpxAwTZHZJ6mXaI=;
	b=q1wmkjSpo0le0FNRLpr9J9/ywGV32l54ziGS6l7jgDDWCWePeUuV1eklho2Ainej7P7c
	 EiVkWKbCS0bgOMUBkVPh8YHLhn6Gok5ajXrBGLsXuJpfraiy/cerWmKlf5+udHl0VwQ62
	 IGSKh4EApDG8g1GRZMZh/H27nGslvrb5EOWQCw2tpLXBqgJwMdWAM50qMl372ggbRMSVh
	 bthSe6D9QJM5hyOxfchd4A6LQOY6FGq2KYtJ+GwOwUT3tCso21WAnLQmZzOCBFDfyYCCn
	 5Ba0H1h1dk4TpCB/ZO+LPIj/7d0KjB+pG4VqGZ678bH5UEs8/2VvbB6FRPTBCyH4cQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LnJbrZXq;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663F7606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663F7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LnJbrZXq
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so231711a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634289; x=1793239089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq98Rc54j/apXLpD8jeCAQO2NMmsGpxAwTZHZJ6mXaI=;
        b=LnJbrZXqH4ZJDIqX5PgmFmAXXvnib6E6ODKFXOuc6OWS5lYlPsOtnxl1Lub4pjY2Fj
         40dsu2efY4QIKh+o6oeROA1K4bH7NmxWw1VGktPXKZTAN8FW4GtpZIXcWV/ResOIO2gX
         VzH5HlJklSOKn4zugThz3DP5Fy5qdPv/1WJyLFVLdCKKXLOSq/L07vaHzLR09SrMU6iz
         ICz6Av6VGXJzhvSsjIgF7LzLDWaJ3JIV5r2NggzsoFfiHNKhw6qEx+bSC1yA8A4FhcZL
         FS6Ack3OyrFXi3u4Lpqm3UrDs5RwsHfjbqyJaaN05Lkq0zxKtVn5zBTgFT8Noi7q0HWF
         T+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634289; x=1793239089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mq98Rc54j/apXLpD8jeCAQO2NMmsGpxAwTZHZJ6mXaI=;
        b=cWaB1qyg1Ofw3dOPgFk68BfTOy7Sa6UBz5tbS9enzhjaYMj/bT5VVeFi39fZleEkjD
         aZtfOyxIdJUKvDFfh0IWKfcxS4syzMZYM8fcG/TkiS2QoUfw9Wp1WCGqNBvRYE1ybmVi
         qYnjjnlZB/hxZvNdA9aSNpB1KCx8qTEOtUyTwEle/AfFXku2t3/xVNGnCCsmMbZl9tUs
         SwpvD9YxzoRZ5Gd9qxFQ8uJJtD3zNMc9xMIDsm8QrufpvPUpGQpFh7nJOcneflQM5r/v
         /kAH+i99/DDLKenyxtRe3jzEuPMudGJDLJFAgH9sY5TGK4KUZZdvQNIX0iiKnq7ijYkg
         EdIg==
X-Forwarded-Encrypted: i=1; AKwUvByiHzEkZh2E9BfYPXuSW7kYlATMPbsn58HGkRFJu9BwFETdk1/p7X5P858n8pUmfsCsNz5wWRLzkwDccwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCU43WoeZsbmaXk2ZcmbnNC3GBR9FNrrkq/oQNUH+oXnBKtQkn
	KghHlOfEbObSpMHRQ0vmnCkta6WZv41q8jX+ar8ad9V9jeIjt+ZZMFD0
X-Gm-Gg: AYBFou27J+R93X7a3ibzzbfwbEPiwvRE4qpLvS7QkJ7nCpTP9Xwwfjdt3KTxedeuNqF
	chQQ8K9BKAt6OJAg1E2OkigL21A8vTmY+60oI7EjAtgKCApoJbdVdSlhT04aDNzIhPZA4PhQpHT
	K24nSsf+DKZZDWhoCNM+SSwi/tiUpEfOc1fFnFmDP4m/x1z6lqirT2799nsLlOj75RTrQJfPWyg
	ryvkpAKHdUtzj75TavgGzLJc2sjh3rlD1osqlzr5HBDg7iQP6+uv7+Z2xzlQv4VagOk964NGDrc
	62NHxawCeEmQVvdZY4wUVgOxiyqK3xZhDdgtbzYAMiqeBi96YNQJY8SotngBc2611dGcDi6l56x
	rj4zs89UfyErVpgxm4C41M5GiC5YR8dCs7gkD956zHqwHEU6LNHL58W7ZK7sfKpCe/yxXqmAZCK
	yaAVMUgJNL6lkQOIWQui4mL9HjoHBhG7G18OaaIup7CKb7qyfucp7p18Z26Uu6ugOc+R1d4c1q6
	+pVGIylbI8hwqtyqoP4HVWB3+3m9Eb2EyioX/dLCoGWDQk/hXfYESIlrQ4CFU8TbXfjPybgmIxZ
	DeZ9qo5IADqZKaJKu1UniquOLcVpiARTuhyop679VerdcZZj2L5bjQJymZdsxZ2KAbnZs/UIuM9
	JY/VoX3On8JziV1qw9xXihIBt
X-Received: by 2002:a17:90b:2791:b0:3a0:c31d:80c with SMTP id 98e67ed59e1d1-3ada6c545c8mr517003a91.9.1792634288589;
        Wed, 21 Oct 2026 18:58:08 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm1796939a91.2.2026.10.21.18.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:58:07 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	oleg@redhat.com,
	peterz@infradead.org,
	mhiramat@kernel.org,
	jolsa@kernel.org,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	surenb@google.com,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	hughd@google.com,
	kees@kernel.org,
	mingo@redhat.com,
	tglx@kernel.org,
	x86@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 8/9] uprobes: Don't leak the breakpoints if the unregistering task is killed
Date: Thu, 22 Oct 2026 01:57:11 +0000
Message-ID: <20261022015712.1297331-9-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
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

From: Alexei Starovoitov <ast@kernel.org>

__get_user_pages() returns -EINTR when current has a fatal signal pending,
and uprobe_write() begins with get_user_pages_remote(). When the task is
killed in uprobe_unregister_nosync() remove_breakpoint() fails in every mm
that register_for_each_vma() hasn't visited yet:

  uprobe: <comm>:<pid> failed to unregister, leaking uprobe

uprobe stays in uprobes_tree. The breakpoints stay in these processes and
in their children, and every hit traps into the kernel for nothing.

The same happens when the task is killed in uprobe_register(). It cannot
remove the breakpoints that it installed. Since "uprobes: Don't sleep on
mmap_lock under dup_mmap_sem" busy mms come last, so the task that is
killed while it waits for one of them leaves the breakpoint in all other
mms.

Trying again after the failure isn't enough. The signal can interrupt
the removal after ref_ctr was decremented, and the second removal
decrements it again.

kworker has no signals. Remove the breakpoints from a work item and wait
for it. A kernel thread does the walk directly, and so does everybody when
nobody maps the file.

The price:
- A round trip through the workqueue for every removal, 9 usec.
- The removal runs with the priority and cpu mask of unbound kworker.
- The caller sleeps in flush_work() for the whole walk. When the walk is
  longer than hung_task_timeout_secs the caller is reported as hung.

The tracer is killed while uprobe_multi attach waits for mmap_lock of
a busy process. 100 idle processes map the file. The number of them that
keep the breakpoint, 10 rounds:

  without this series   0 or 1
  without this patch    100
  with this patch       0

uprobe_multi attach and detach in a loop, nobody is killed, 32 cpu VM,
median of 21-27 runs, msec:

                                  detach          attach
                               before  after   before  after
  4096 uprobes, 1 process        33.5   69.4     7.35   7.44
  1024 uprobes, 100 processes    95.0    102     38.1   43.4
  256 uprobes, 1000 processes     182    192      107    117

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 kernel/events/uprobes.c | 74 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 92ccb730278f..361b52c9c3bc 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1426,6 +1426,68 @@ register_for_each_vma(struct uprobe *uprobe, struct uprobe_consumer *new)
 	return walk.err;
 }
 
+struct unregister_work {
+	struct work_struct work;
+	struct uprobe *uprobe;
+	int err;
+};
+
+static void unregister_work_fn(struct work_struct *work)
+{
+	struct unregister_work *uw = container_of(work, struct unregister_work, work);
+
+	uw->err = register_for_each_vma(uw->uprobe, NULL);
+}
+
+/*
+ * Remove the breakpoints. If current is killed, get_user_pages_remote() fails
+ * with -EINTR from then on: the breakpoints which are left stay for good, and
+ * the removal which was interrupted can be left half-way, with the reference
+ * counter decremented but the breakpoint still there. So let a kworker do the
+ * job, it has no signals. It takes the locks we would take ourselves.
+ * (A fork() of an mm with busy mmap_lock can still do one removal in a task
+ * which is being killed, see register_one_mm().)
+ *
+ * A kernel thread can do it itself. So can anybody if nobody maps the file:
+ * then there is no breakpoint, and uprobe_mmap() installs none which we would
+ * have to remove.
+ */
+static int unregister_all_vmas(struct uprobe *uprobe)
+{
+	struct address_space *mapping = uprobe->inode->i_mapping;
+	struct unregister_work uw = { .uprobe = uprobe };
+	bool mapped;
+	int err;
+
+	/*
+	 * vma_prepare() takes a vma out of the tree and vma_complete() puts it
+	 * back, under i_mmap_lock_write(). Don't mistake that for an empty tree.
+	 */
+	i_mmap_lock_read(mapping);
+	mapped = mapping_mapped(mapping);
+	i_mmap_unlock_read(mapping);
+
+	if (!mapped || (current->flags & PF_KTHREAD)) {
+		err = register_for_each_vma(uprobe, NULL);
+		/*
+		 * An error with a fatal signal pending: the file was mapped
+		 * meanwhile, and get_user_pages_remote() returned -EINTR before
+		 * it could see that there is nothing to remove. Nothing was
+		 * written, so it is safe to let the kworker repeat the walk.
+		 * (Kernel threads which unregister uprobes don't allow SIGKILL.)
+		 */
+		if (likely(!err) || !fatal_signal_pending(current))
+			return err;
+	}
+
+	INIT_WORK_ONSTACK(&uw.work, unregister_work_fn);
+	queue_work(system_dfl_long_wq, &uw.work);
+	flush_work(&uw.work);
+	destroy_work_on_stack(&uw.work);
+
+	return uw.err;
+}
+
 /**
  * uprobe_unregister_nosync - unregister an already registered probe.
  * @uprobe: uprobe to remove
@@ -1437,10 +1499,13 @@ void uprobe_unregister_nosync(struct uprobe *uprobe, struct uprobe_consumer *uc)
 
 	down_write(&uprobe->register_rwsem);
 	consumer_del(uprobe, uc);
-	err = register_for_each_vma(uprobe, NULL);
+	err = unregister_all_vmas(uprobe);
 	up_write(&uprobe->register_rwsem);
 
-	/* TODO : cant unregister? schedule a worker thread */
+	/*
+	 * Can still fail, e.g. with -ENOMEM. Then the uprobe and the breakpoints
+	 * which are left are leaked.
+	 */
 	if (unlikely(err)) {
 		uprobe_warn(current, "unregister, leaking uprobe");
 		return;
@@ -1553,7 +1618,10 @@ int uprobe_apply(struct uprobe *uprobe, struct uprobe_consumer *uc, bool add)
 	rcu_read_lock_trace();
 	list_for_each_entry_rcu(con, &uprobe->consumers, cons_node, rcu_read_lock_trace_held()) {
 		if (con == uc) {
-			ret = register_for_each_vma(uprobe, add ? uc : NULL);
+			if (add)
+				ret = register_for_each_vma(uprobe, uc);
+			else
+				ret = unregister_all_vmas(uprobe);
 			break;
 		}
 	}
-- 
2.55.0

