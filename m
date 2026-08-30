Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24E2D73A6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788052537; cv=none; b=uRh8Mxr2rrStvG23135sqRrt08cc4gftQQ99YUCrrex2nntx07yYTChoFRbd+D0fItzBT7N5WQ2qj0h/7WM/ZZGdb5E0dP/cgZrV+DtgJqlKVSfpa4CsDCROtSrP5prmzUplmCiD32FxdoE41J1tuMI0x6CQkpzxLT55fLs/ZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788052537; c=relaxed/simple;
	bh=CXUUUKzt9AftGV0FSwrp/T2lePlU30fGrJiTua1qMag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VjdXcKKf8vkOmkMav7h1TXP0827U5M+enbTfQRvf6BJPN2ebZHaTeRkRWAeE/YMwIyoJJcnEdsyaxR13YUq1Nz0aVKZVsntTfEceHeaun6ZZzAkN5sv6a2a6ceSq+KVbShHa5SsJU1/EkOGs4NPchzCoD59RGRUVQNnU185kkjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=0xPGNXEa; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="0xPGNXEa"
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id A6FB940222;
	Sun, 30 Aug 2026 01:15:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 8E0ED20027;
	Sun, 30 Aug 2026 01:15:23 +0000 (UTC)
Date: Sat, 29 Aug 2026 21:15:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Deepanshu Kartikey <kartikey406@gmail.com>, Haotian Zhang
 <vulab@iscas.ac.cn>, Hui Su <sh_def@163.com>, Ivan Immanuel Shaji
 <ivanimmanuel1234@gmail.com>, =?UTF-8?B?SsOpcsOpbXk=?= Jean
 <Jeremy.Jean@oss.cyber.gouv.fr>, Vincent Donnefort <vdonnefort@google.com>
Subject: [GIT PULL] tracing: Fixes for 7.3
Message-ID: <20260829211522.6623ee83@robin>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: 79euemrydt9jpwayy77or18jahutem87
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 8E0ED20027
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18GRdRZZfsccBUHBnq8vhWFvRNSVNKQOfw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=RM+NyLK1sUT0LkA9AYYZttgrLOoJ4zKFpQNLJXepKMc=; b=0xPGNXEavIZ8b5U0CuCDPVpWPLWoU8pyUc7A2r3AKKfvMBANvirxswOivWCGAt+jSiNTeEVOKmLnLJ8BgZw8MUCUR67JxIjUtQtKUXu3e+kCB3+0Wn+Z27I7b0V4XxQePRn+7SogzYt3n/tTBYn6x4GE24V8uy9UphQ/QCGQRjI=
X-HE-Tag: 1788052523-500647
X-HE-Meta: U2FsdGVkX1/+ECHhh/NSbS6ajgTdWNH90bvrzNQvpPI0k5n+eqoTL5RguFrqdfVyAen/wMr6f+CoRBW7KEII3KUj/1uu1KMuWAEIz83/KE7m6X+UhE/NHRYlWrFfA9G1V10m1O8fK8EMbos606UtIBqr8KAci9/5v9wdxUQ7RXWDZW/apa4jQ1nuA4V9fmfkUMgHJbYASkG9FQo/3nsjWbHjt8hR0o0IQuXliz0t9kxvLGLPtKJM0nuRzKjP7M7vbdPUJvg2bFluNvPbsa26j6wj3myPDlOsLJLFoIFmJl5LDw4zBIRHjE9X5tv9v1Gy0cLHS0lrpETYSwvRBoh42xW5wQ1r6qN+


Linus,

tracing fixes for v7.3:

- Fix error output of boot instance creation failure

  Currently if a boot instance creation fails, instead of printing out the
  name of the instance that failed, it prints "(null)". That is because it
  prints "cur_str" that had already been processed by strsep(). Print the
  saved name instead.

  While at it, print the error code of the failure.

- Fix use-after-free for same named historgrams

  Histograms can be named so that they can be used in multiple events. But
  if the named histogram has a variable attached, the second event that uses
  the named histogram which duplicates it and needs to free the original
  after duplication leaves the old variable in place and still visible. If
  another histogram uses than variable, it will use the stale one which will
  try to reference the freed duplicate histogram and crash the kernel.

  Free the duplicate variables along with the duplicated histogram data.

- Check return value of kthread_run() in event self test

  The events self tests uses a kthread for testing but does not check if it
  succeeded in creating a kthread. If the kthread creation were to fail, the
  code will still try to call kthread_stop() on the error returned.

- Fix race between reading trace_pipe and updating subbuffer size

  If a user is reading the trace_pipe file at the same time they update the
  ring buffer sub-buffer size, can cause the trace_pipe read to read stale
  data. Add trace_access_lock() around updating the ring buffer sub-buffer
  size.

- Fix eventfs_inode on failure path in creation of the events directory

  In the creation of the "events" directory, if after allocating the
  eventfs_inode a failure is detected, it calls cleanup_ei() which calls
  free_ei(). The free_ei() will test if eventfs_inode being freed has no
  children. It is a bug if it does. But on the failure case of the creation
  of the "events" directory, the children lists have not yet been
  initialized and the free will trigger a warning because list_empty() on an
  uninitialized list returns false.

  Move the initialization into init_ei() where it makes more sense and makes
  sure that a created eventfs_inode has its lists initialized upon creation.

- Check return value of kthread_run() in ftrace direct sample code

  The sample code that shows how to use the ftrace direct calls does not
  test the return of kthread_run() to see if it succeeds. Return a failure
  if the kthread_run() doesn't succeed.

- Clear user events state on fork in case of alloc failure

  On fork, the child gets a pointer to the parent's user events state. It
  makes a copy of it then updates the child's pointer to it. But if the
  allocation fails, the duplication function leaves the child with a pointer
  to its parent's descriptor. When the child cleans up its data, it will fr=
ee
  the parent's descriptor while the parent is still using it.

  In the duplication function, set the child's user_event_mm to NULL before
  testing if the allocation succeeded, and when it exits it will not free
  the parent's descriptor.

- Fix retry exhaustion in simple ring buffer reader swap

  simple_ring_buffer_swap_reader_page() starts with retry set to 8 and
  post-decrements it only after a failed link replacement. On the final
  attempt, a successful replacement leaves retry at zero, while a failed
  replacement leaves it at -1.

  But the check for success expects the retry value to be non-zero and exits
  with an error on zero. This is the opposite result. Fix it.

- Fail nicely when the remote swap_reader_page() returns an error

  Currently, if the swap_reader_page() of a remote buffer fails, it triggers
  a WARN_ON_ONCE() and continues normally. Instead, have it exit with an
  error and a pr_warn() print instead of a full WARNING.


Please pull the latest trace-v7.3-2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v7.3-2

Tag SHA1: dc1be90a7091efc5769819e7f333d2f1fe08a1a1
Head SHA1: 5eab74874d11160725c42ab676ba97a797a362eb


Deepanshu Kartikey (2):
      tracing: Fix use-after-free in trace_pipe read on sub-buffer order ch=
ange
      eventfs: Initialize ei->children and ei->list in init_ei()

Haotian Zhang (2):
      samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-modify
      samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-multi-=
modify

Hui Su (2):
      tracing: Fix use-after-free with same-name named triggers
      tracing: Fix crash passing ERR_PTR to kthread_stop()

Ivan Immanuel Shaji (2):
      tracing: Fix retry exhaustion in simple ring buffer reader swap
      ring-buffer: Stop remote reader update when page swap fails

J=C3=A9r=C3=A9my Jean (1):
      tracing/user_events: Clear copied tracing state before fork duplicati=
on

Vincent Donnefort (1):
      tracing: Fix logged instance name on creation failure

----
 fs/tracefs/event_inode.c                    |  7 ++-----
 kernel/trace/ring_buffer.c                  |  7 +++++--
 kernel/trace/simple_ring_buffer.c           |  4 ++--
 kernel/trace/trace.c                        |  6 +++++-
 kernel/trace/trace_events.c                 |  2 ++
 kernel/trace/trace_events_hist.c            |  4 +++-
 kernel/trace/trace_events_user.c            |  3 +++
 samples/ftrace/ftrace-direct-modify.c       | 12 +++++++++---
 samples/ftrace/ftrace-direct-multi-modify.c | 12 +++++++++---
 9 files changed, 40 insertions(+), 17 deletions(-)
---------------------------
diff --git a/fs/tracefs/event_inode.c b/fs/tracefs/event_inode.c
index 604ba3e841d2..6e3513b13cfa 100644
--- a/fs/tracefs/event_inode.c
+++ b/fs/tracefs/event_inode.c
@@ -438,6 +438,8 @@ static inline struct eventfs_inode *init_ei(struct even=
tfs_inode *ei, const char
 	if (!ei->name)
 		return NULL;
 	kref_init(&ei->kref);
+	INIT_LIST_HEAD(&ei->children);
+	INIT_LIST_HEAD(&ei->list);
 	return ei;
 }
=20
@@ -729,8 +731,6 @@ struct eventfs_inode *eventfs_create_dir(const char *na=
me, struct eventfs_inode
 	ei->entries =3D entries;
 	ei->nr_entries =3D size;
 	ei->data =3D data;
-	INIT_LIST_HEAD(&ei->children);
-	INIT_LIST_HEAD(&ei->list);
=20
 	scoped_guard(mutex, &eventfs_mutex) {
 		if (!parent->is_freed)
@@ -802,9 +802,6 @@ struct eventfs_inode *eventfs_create_events_dir(const c=
har *name, struct dentry
 	ei->attr.uid =3D uid;
 	ei->attr.gid =3D gid;
=20
-	INIT_LIST_HEAD(&ei->children);
-	INIT_LIST_HEAD(&ei->list);
-
 	ti =3D get_tracefs(inode);
 	ti->flags |=3D TRACEFS_EVENT_INODE;
 	ti->private =3D ei;
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 5fc009edc1ec..b7d076b6edcf 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5805,8 +5805,11 @@ __rb_get_reader_page_from_remote(struct ring_buffer_=
per_cpu *cpu_buffer)
=20
 	prev_reader =3D cpu_buffer->subbuf_ids[cpu_buffer->meta_page->reader.id];
=20
-	WARN_ON_ONCE(cpu_buffer->remote->swap_reader_page(cpu_buffer->cpu,
-							  cpu_buffer->remote->priv));
+	if (cpu_buffer->remote->swap_reader_page(cpu_buffer->cpu,
+						 cpu_buffer->remote->priv)) {
+		pr_warn_ratelimited("Remote reader page swap failed\n");
+		return NULL;
+	}
 	/* nr_pages doesn't include the reader page */
 	if (WARN_ON_ONCE(cpu_buffer->meta_page->reader.id > cpu_buffer->nr_pages))
 		return NULL;
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_b=
uffer.c
index f4642f5adda3..49913bb0057a 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -160,8 +160,8 @@ int simple_ring_buffer_swap_reader_page(struct simple_r=
b_per_cpu *cpu_buffer)
 		overrun =3D cpu_buffer->meta->overrun;
 	} while (!simple_bpage_unset_head_link(last, reader, SIMPLE_RB_LINK_NORMA=
L) && retry--);
=20
-	if (!retry)
-		return -EINVAL;
+	if (retry < 0)
+		return -EBUSY;
=20
 	cpu_buffer->head_page =3D simple_bpage_from_link(reader->link.next);
 	cpu_buffer->head_page->link.prev =3D &reader->link;
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 89dc1c0ebb90..60c87977f1e3 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8214,6 +8214,8 @@ buffer_subbuf_size_write(struct file *filp, const cha=
r __user *ubuf,
 	/* Do not allow tracing while changing the order of the ring buffer */
 	tracing_stop_tr(tr);
=20
+	trace_access_lock(RING_BUFFER_ALL_CPUS);
+
 	old_order =3D ring_buffer_subbuf_order_get(tr->array_buffer.buffer);
 	if (old_order =3D=3D order)
 		goto out;
@@ -8253,6 +8255,7 @@ buffer_subbuf_size_write(struct file *filp, const cha=
r __user *ubuf,
 #endif
 	(*ppos)++;
  out:
+	trace_access_unlock(RING_BUFFER_ALL_CPUS);
 	if (ret)
 		cnt =3D ret;
 	tracing_start_tr(tr);
@@ -9726,7 +9729,8 @@ __init static void enable_instances(void)
=20
 		tr =3D trace_array_create_systems(name, NULL, addr, size);
 		if (IS_ERR(tr)) {
-			pr_warn("Tracing: Failed to create instance buffer %s\n", curr_str);
+			pr_warn("Tracing: Failed to create instance buffer '%s' (%ld)\n", name,
+				PTR_ERR(tr));
 			continue;
 		}
=20
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 9f8f2d02276c..1d39eaf6a0f7 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -5019,6 +5019,8 @@ static __init void event_test_stuff(void)
 	struct task_struct *test_thread;
=20
 	test_thread =3D kthread_run(event_test_thread, NULL, "test-events");
+	if (WARN_ON(IS_ERR(test_thread)))
+		return;
 	msleep(1);
 	kthread_stop(test_thread);
 }
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_h=
ist.c
index 893bd8b0e48a..963e0d6b61fd 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -6661,8 +6661,10 @@ static int hist_register_trigger(char *glob,
 		tracing_set_filter_buffering(file->tr, true);
 	}
=20
-	if (named_data)
+	if (named_data) {
+		remove_hist_vars(hist_data);
 		destroy_hist_data(hist_data);
+	}
  out:
 	return ret;
 }
diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_u=
ser.c
index 2bbc89d4a266..93cda2f6f269 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -868,6 +868,9 @@ void user_event_mm_dup(struct task_struct *t, struct us=
er_event_mm *old_mm)
 	struct user_event_mm *mm =3D user_event_mm_alloc(t);
 	struct user_event_enabler *enabler;
=20
+	/* On failure, do not free parent's copy */
+	t->user_event_mm =3D NULL;
+
 	if (!mm)
 		return;
=20
diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-=
direct-modify.c
index 1ba1927b548e..164d9dd6fd92 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -320,9 +320,15 @@ static int __init ftrace_direct_init(void)
 	ftrace_set_filter_ip(&direct, (unsigned long) my_ip, 0, 0);
 	ret =3D register_ftrace_direct(&direct, my_tramp);
=20
-	if (!ret)
-		simple_tsk =3D kthread_run(simple_thread, NULL, "event-sample-fn");
-	return ret;
+	if (ret)
+		return ret;
+	simple_tsk =3D kthread_run(simple_thread, NULL, "event-sample-fn");
+	if (IS_ERR(simple_tsk)) {
+		unregister_ftrace_direct(&direct, my_tramp, true);
+		return PTR_ERR(simple_tsk);
+	}
+
+	return 0;
 }
=20
 static void __exit ftrace_direct_exit(void)
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/f=
trace-direct-multi-modify.c
index 7a7822dfeb50..b03766c6217b 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -364,9 +364,15 @@ static int __init ftrace_direct_multi_init(void)
=20
 	ret =3D register_ftrace_direct(&direct, my_tramp);
=20
-	if (!ret)
-		simple_tsk =3D kthread_run(simple_thread, NULL, "event-sample-fn");
-	return ret;
+	if (ret)
+		return ret;
+	simple_tsk =3D kthread_run(simple_thread, NULL, "event-sample-fn");
+	if (IS_ERR(simple_tsk)) {
+		unregister_ftrace_direct(&direct, my_tramp, true);
+		return PTR_ERR(simple_tsk);
+	}
+
+	return 0;
 }
=20
 static void __exit ftrace_direct_multi_exit(void)
