Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9876D4A4853
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159844; cv=none; b=f41DS1SLPNwo0jX/+akJWCeB0x/LCk8bG0IJ76APB58E0FaaNAIjvpiGrYOkhO5mD+rr7NRR0FhizxJaseHqfTpqktWmjigtZeKtw4ixtaZWbkNmiGy+XbzU1dcGaQg08Aj4u7Czwlx8etHU7H+aJQCfeKcYjWhpK6qoqylUzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159844; c=relaxed/simple;
	bh=0r1Uwi6idlZ2zf+uybpxnfDOSZLahjPS3X6Oc7bXTkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qv25R+FgX7dhGSU4JIkc5YjnEjWfjyO7KVJtbyW70pIP+XfgB1PGHSwSdxLt7riB/et1XzqoqeLQa0FQ1PVeHb0c40Be29/2o9bEx6n9JiOg63faXbqhw58YDH2fO0VrsTW+LlxpEP9NEefkOa0pTE4bpzhS1w5kIyvy/IHbjsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=LDu+rnCm; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="LDu+rnCm"
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 8DAC5160241;
	Fri, 16 Oct 2026 14:10:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 90A0F1B;
	Fri, 16 Oct 2026 14:10:24 +0000 (UTC)
Date: Fri, 16 Oct 2026 10:10:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, Christian Brauner
 <brauner@kernel.org>, David Carlier <devnexen@gmail.com>, Dmitry Kandybka
 <d.kandybka@gmail.com>, Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Hao Ge
 <hao.ge@linux.dev>, Krystian Kaniewski <krystianmkaniewski@gmail.com>, Lee
 Jones <lee@kernel.org>, Taeyang Lee <0wn@theori.io>, Tengda Wu
 <wutengda@huaweicloud.com>, Vincent Donnefort <vdonnefort@google.com>
Subject: [GIT PULL] tracing: Final fixes for 7.3
Message-ID: <20261016101022.7db98574@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Stat-Signature: ur6xr35ibsgwnz9h4sy4a4b76gy5akb6
X-Rspamd-Queue-Id: 90A0F1B
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18ZutGA8oNBgWxd0ZBDsQnOuywUHqXCZ2A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Wm8Yu6AH217wHb2hIYKEXfLYPfIDSNwZywWVMuPeAQM=; b=LDu+rnCmxWYwklfXZwCEbE/EUFIxL6RpzhK3Zy4DO2dHCvnXICpf1Wz+VeZKf2SVdqCDytDoQhxbX+mqO+4vgJINh3uPvE/2uXc9YZ+mxkBFvkB7hAU4ANS7QALMDMgZsUcLF2DV1mN1hOb35vYIlhpqPz0jWcTYx6M/hKHFYiM=
X-HE-Tag: 1792159824-677087
X-HE-Meta: U2FsdGVkX19pH4T2NyMQNRwm1895VnxYk+sFQW9Mnyr3cxM53QozCanQ/qZWQS5HUbyP4epK2YpzOgUXhZo0C0uoVsWU4At0ZYZv1MwaZnSxsHZxZtoN3cqEkZzL2z74Wgh2RsoGeoqvwViygAJml9EdWHufRqZOXMemNBmSIF7emA8UpYox4+rC5PvL8ZAhm77dkwl/+QQu29WIPr1pNYWHRssNmMcG4L/uIM9sAG1x548Ij79ZsTbYICC2PccTHcCMiNONDXBJAgxdAFMP+4o5BqN80bdz5noJklFazFEN8bVW6E1HOiuxSE6GA/3VCYbkMqXcVK75Uz4vwhCKW6SoHI7A5iIN


Linus,

tracing fixes for v7.3:

- Fix NULL dereference when copying histogram field variable

  If event_hist_trigger_parse() creates an action that uses one of pseudo
  fields for its keys, the hist_data field element will have a NULL for its
  field member. When looking to match that key, the lookup uses
  key_field->field->name which will dereference a NULL pointer.
  Instead use the helper function that handles such cases: expr_field_str().

- Take the trace_types_lock when dropping the buffer_meta reference

  The tracing_buffer_meta_open() error return drops the trace_array
  reference with __trace_array_put() instead of trace_array_put() where the
  former doesn't take the lock and the latter does.

- Fix NULL pointer dereference when reading per_cpu/cpuN/buffer_meta

  These files are created for every possible CPU. But it only contains data
  for CPUs that have come online. If one is read for a CPU that hasn't come
  online yet, it triggers a NULL pointer dereference.

  Have reading of CPUs that have not come on line yet return -ENODEV.

- Fix an out-of-bounds shift in the log2 histogram modifier

  Histograms can take a log2 modifier to have the buckets defined by log2
  increments. If a shift is greater than ULONG_MAX or above 2^63, the key
  falls into a lower order bucket.

  Use order_base_2() instead of "ilog2(n - 1) + 1" to have all overflowed
  keys go into the top bucket.

- Fix the persistent ring buffer rb_meta_subbuf_idx() accounting

  The algorithm for finding the index of a sub-buffer in a persistent ring
  buffer buffer did not take into account the meta data at the beginning of
  the buffer causing the wrong index to be returned.

  As rb_subbufs_from_meta() does the proper accounting to find the first
  sub-buffer, use that function instead of repeating the logic (incorrectly)
  and make the calculations based off of that.

- Fix the symbol name checks for the remote buffer code

  The remote ring buffer has a build time check to make sure its not using
  any code that will not be in the hypervisor. For various architectures,
  there has been false positive reports from this checker.

  Fix them.

- Fix false warning in ring_buffer_map_get_reader()

  There is a WARN_ON() after rb_get_reader_page() if no reader is returned.
  But there are legitimate cases where this can happen. Remove the WARN_ON()
  and also a check that covers one of the legitimate cases that tries to
  exit out early. There's no need for the check if it just simply allows the
  return of NULL from rb_get_reader_page().

- Fix the ignored return value from resize_buffer_duplicate_size()

  Some clean up of the code in tracing_snapshot_write() removed checking the
  return value of resize_buffer_duplicate_size() and if that failed it would
  not be detected.

- Fix the histogram timestamps for buffered events

  The histogram timestamps are taken from the events that are recorded.
  It currently reads ring_buffer_event_time_stamp() but if the event is
  buffered it does not read it properly. Use tracing_event_time_stamp()
  which handles both buffered and normal events.

- Do not initialize tracefs if tracing is disabled at boot

  If tracing fails to allocate or some other error is detected,
  tracing_disabled is set. Do not initialize tracefs in this case as it may
  expect data to be initialized but is not.

- Free eventfs inode after an RCU grace period

  Currently eventfs_inodes are freed after a SRCU grace period as the
  iterations in the code use SRCU. There are locations that the inode may
  still be accessed from the VFS that uses RCU which does not have the same
  synchronization as SRCU. Add an RCU wait before free eventfs inodes.

- Do not fail persistent and remote buffers under memory pressure

  As persistent and remote buffers have their own pre-allocated memory,
  there's no reason to check how much memory is available before created
  them. By checking the memory pressure, these buffers may fail to be
  created even though their memory is already present.

- Account for subbuffer size when checking how much memory is available

  Before allocating a ring buffer, the size is checked against the current
  memory pressure of the system. But it assumes every sub-buffer is of page
  size. This is no longer the case. Use the actual sub-buffer size when
  calculating how much memory will be used.

- Reject non-stack fields for synthetic stacktrace fields

  Stack traces are special fields and the checks currently do not do enough
  to make sure that the fields being processed as stack traces are indeed
  stack traces. Update the logic to properly detect what is or is not a
  stack trace.

- Fix a crash in print_graph_function_event()

  When a tracer does not define static or default flags the
  tr->current_trace_flags is set to NULL. If the ring buffer is
  not cleared when switching tracers, the previous tracers events
  could be read. The function_graph entries will dereference the
  tr->current_trace_flags and cause a crash.

  Set the tr->current_trace_flags to a empty set of flags to prevent
  it from being NULL.

- Separate tracing filter predicate count from allocation

  The amount allocated for the predicate program is the number of predicates
  defined plus two for adding "true" and "false" at the end. The nr_preds is
  incremented by two to accommodate the booleans but is then used as the
  limit check for number of predicates. This is incorrect as it is now two
  higher than what is expected.

  Use a separate variable for the size of the predicate array.

- Fix the filter operator stack check

  The operator stack increments the pointer and then writes the content onto
  the stack. The check for overflow compared the current pointer to see if
  it was greater than the stack size before doing so. This is an off by 2
  error as the write will be at the size - 1 and the compare is done before
  the increment. Adjust the check accordingly.


Please pull the latest trace-v7.3-rc7 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v7.3-rc7

Tag SHA1: 04b96ae996d217f62c5f91040797d432252f85cd
Head SHA1: c47a7b11bcb3d45e29723afcf6336866476b1d08


Amit Machhiwal (1):
      tracing: Do not initialize tracefs work if tracing is disabled

Christian Brauner (1):
      eventfs: Free the eventfs_inode after an rcu grace period too

David Carlier (2):
      tracing: Take trace_types_lock when dropping the buffer_meta reference
      ring-buffer: Do not show buffer_meta for CPUs without a buffer

Dmitry Kandybka (1):
      tracing: Fix ignored return value of resize_buffer_duplicate_size()

Donggeun Yoo (3):
      tracing: Fix NULL dereference when copying keys for a field variable
      tracing: Fix the shift out of bounds in the log2 histogram modifier
      ring-buffer: Fix the sub-buffer array base in rb_meta_subbuf_idx()

Hao Ge (1):
      tracing: Fix crash in print_graph_function_event()

Krystian Kaniewski (1):
      ring-buffer: Fix false warning in ring_buffer_map_get_reader()

Lee Jones (1):
      tracing/histograms: Reject non-stacktrace fields for synthetic stacktrace fields

Taeyang Lee (2):
      tracing: Keep the predicate limit separate from program capacity
      tracing: Check operator stack capacity before pushing

Tengda Wu (1):
      tracing: Fix hist trigger timestamps for buffered events

Vincent Donnefort (5):
      tracing: Fix empty symbol names in simple_ring_buffer undef check
      tracing: Fix simple_ring_buffer undef check on parisc
      tracing: Fix simple_ring_buffer undef check on sparc64
      ring-buffer: Skip si_mem_available() for persistent and remote buffers
      ring-buffer: Use subbuf_order in available memory estimation

----
 fs/tracefs/event_inode.c           | 10 ++++++-
 kernel/trace/Makefile              |  5 ++--
 kernel/trace/ring_buffer.c         | 60 ++++++++++++++++++--------------------
 kernel/trace/trace.c               | 28 ++++++++++++++++--
 kernel/trace/trace_events_filter.c |  9 +++---
 kernel/trace/trace_events_hist.c   | 21 ++++++++-----
 kernel/trace/trace_snapshot.c      |  5 +++-
 kernel/trace/undefsyms_base.c      |  5 +++-
 8 files changed, 92 insertions(+), 51 deletions(-)
---------------------------
diff --git a/fs/tracefs/event_inode.c b/fs/tracefs/event_inode.c
index 6e3513b13cfa..090aca946717 100644
--- a/fs/tracefs/event_inode.c
+++ b/fs/tracefs/event_inode.c
@@ -91,6 +91,14 @@ static void free_ei_rcu(struct rcu_head *rcu)
 	}
 }
 
+/* read under eventfs_srcu and, by tracefs_d_revalidate(), in rcu pathwalk */
+static void free_ei_srcu(struct rcu_head *rcu)
+{
+	struct eventfs_inode *ei = container_of(rcu, struct eventfs_inode, rcu);
+
+	call_rcu(&ei->rcu, free_ei_rcu);
+}
+
 /*
  * eventfs_inode reference count management.
  *
@@ -112,7 +120,7 @@ static void release_ei(struct kref *ref)
 			entry->release(entry->name, ei->data);
 	}
 
-	call_srcu(&eventfs_srcu, &ei->rcu, free_ei_rcu);
+	call_srcu(&eventfs_srcu, &ei->rcu, free_ei_srcu);
 }
 
 static inline void put_ei(struct eventfs_inode *ei)
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index f934ff586bd4..3860bc53a4be 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -146,11 +146,12 @@ KASAN_SANITIZE_undefsyms_base.o := y
 
 UNDEFINED_ALLOWLIST = __asan __gcov __kasan __kcsan __hwasan __sancov __sanitizer __tsan __ubsan __msan \
 		      __aeabi_unwind_cpp __s390_indirect_jump __x86_indirect_thunk simple_ring_buffer \
-		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '{print $$2}')
+		      current_thread_info_reg \
+		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '$$2 {print $$2}')
 
 quiet_cmd_check_undefined = NM      $<
       cmd_check_undefined = \
-          undefsyms=$$($(NM) -u $< | grep -v $(addprefix -e , $(UNDEFINED_ALLOWLIST)) || true); \
+          undefsyms=$$($(NM) -u $< | awk '$$2 {print $$2}' | grep -v $(addprefix -e , $(UNDEFINED_ALLOWLIST)) || true); \
           if [ -n "$$undefsyms" ]; then \
               echo "Unexpected symbols in $<:" >&2; \
               echo "$$undefsyms" >&2; \
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 04bb94c29f58..9c4e40847e43 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2380,6 +2380,9 @@ int ring_buffer_meta_seq_init(struct file *file, struct trace_buffer *buffer, in
 	struct seq_file *m;
 	int ret;
 
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
+		return -ENODEV;
+
 	ret = seq_open(file, &rb_meta_seq_ops);
 	if (ret)
 		return ret;
@@ -2440,22 +2443,33 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 			       unsigned long nr_pages, struct list_head *pages)
 {
 	struct trace_buffer *buffer = cpu_buffer->buffer;
+	unsigned int subbuf_order = buffer->subbuf_order;
 	struct ring_buffer_cpu_meta *meta = NULL;
 	struct buffer_page *bpage, *tmp;
-	bool user_thread = current->mm != NULL;
 	struct ring_buffer_desc *desc = NULL;
+	bool user_thread = false;
 	long i;
 
-	/*
-	 * Check if the available memory is there first.
-	 * Note, si_mem_available() only gives us a rough estimate of available
-	 * memory. It may not be accurate. But we don't care, we just want
-	 * to prevent doing any allocation when it is obvious that it is
-	 * not going to succeed.
-	 */
-	i = si_mem_available();
-	if (i < nr_pages)
-		return -ENOMEM;
+	if (buffer->range_addr_start) {
+		meta = rb_range_meta(buffer, nr_pages, cpu_buffer->cpu);
+	} else if (buffer->remote) {
+		desc = ring_buffer_desc(buffer->remote->desc, cpu_buffer->cpu);
+		if (!desc || WARN_ON(desc->nr_page_va != (nr_pages + 1)))
+			return -EINVAL;
+	} else {
+		/*
+		 * Check if the available memory is there first.
+		 * Note, si_mem_available() only gives us a rough estimate of available
+		 * memory. It may not be accurate. But we don't care, we just want
+		 * to prevent doing any allocation when it is obvious that it is
+		 * not going to succeed.
+		 */
+		i = si_mem_available();
+		if (i < (nr_pages << subbuf_order))
+			return -ENOMEM;
+
+		user_thread = current->mm != NULL;
+	}
 
 	/*
 	 * If a user thread allocates too much, and si_mem_available()
@@ -2469,15 +2483,6 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 	if (user_thread)
 		set_current_oom_origin();
 
-	if (buffer->range_addr_start)
-		meta = rb_range_meta(buffer, nr_pages, cpu_buffer->cpu);
-
-	if (buffer->remote) {
-		desc = ring_buffer_desc(buffer->remote->desc, cpu_buffer->cpu);
-		if (!desc || WARN_ON(desc->nr_page_va != (nr_pages + 1)))
-			return -EINVAL;
-	}
-
 	for (i = 0; i < nr_pages; i++) {
 
 		bpage = alloc_cpu_page(cpu_buffer->cpu);
@@ -2513,12 +2518,11 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 			bpage->id = i + 1;
 			cpu_buffer->subbuf_ids[i + 1] = bpage;
 		} else {
-			bpage->page = alloc_cpu_data(cpu_buffer->cpu,
-						     cpu_buffer->buffer->subbuf_order);
+			bpage->page = alloc_cpu_data(cpu_buffer->cpu, subbuf_order);
 			if (!bpage->page)
 				goto free_pages;
 		}
-		bpage->order = cpu_buffer->buffer->subbuf_order;
+		bpage->order = subbuf_order;
 
 		if (user_thread && fatal_signal_pending(current))
 			goto free_pages;
@@ -3627,10 +3631,8 @@ static void rb_inc_iter(struct ring_buffer_iter *iter)
 /* Return the index into the sub-buffers for a given sub-buffer */
 static int rb_meta_subbuf_idx(struct ring_buffer_cpu_meta *meta, void *subbuf)
 {
-	void *subbuf_array;
+	void *subbuf_array = rb_subbufs_from_meta(meta);
 
-	subbuf_array = (void *)meta + sizeof(int) * meta->nr_subbufs;
-	subbuf_array = (void *)ALIGN((unsigned long)subbuf_array, meta->subbuf_size);
 	return (subbuf - subbuf_array) / meta->subbuf_size;
 }
 
@@ -7997,12 +7999,8 @@ int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
 		goto out;
 	}
 
-	/* Did the reader catch up with the writer? */
-	if (cpu_buffer->reader_page == cpu_buffer->commit_page)
-		goto out;
-
 	reader = rb_get_reader_page(cpu_buffer);
-	if (WARN_ON(!reader))
+	if (!reader)
 		goto out;
 
 	/* Check if any events were dropped */
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e4a490d3d08c..97a058623f94 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -99,6 +99,12 @@ struct tracers {
 	struct tracer_flags	*flags;
 };
 
+/*
+ * Tracers that do not define their own flags use these empty flags,
+ * as tr->current_trace_flags must never be NULL.
+ */
+static struct tracer_flags no_tracer_flags;
+
 /*
  * To prevent the comm cache from being overwritten when no
  * tracing is active, only save the comm when a trace event
@@ -1318,7 +1324,12 @@ static int run_tracer_selftest(struct tracer *type)
 	tracing_reset_online_cpus(&tr->array_buffer);
 
 	tr->current_trace = type;
-	tr->current_trace_flags = type->flags ? : type->default_flags;
+	if (type->flags)
+		tr->current_trace_flags = type->flags;
+	else if (type->default_flags)
+		tr->current_trace_flags = type->default_flags;
+	else
+		tr->current_trace_flags = &no_tracer_flags;
 
 #ifdef CONFIG_TRACER_MAX_TRACE
 	if (tracer_uses_snapshot(type)) {
@@ -5089,7 +5100,12 @@ int tracing_set_tracer(struct trace_array *tr, const char *buf)
 			return ret;
 	}
 
-	tr->current_trace_flags = t->flags ? : t->tracer->flags;
+	if (t->flags)
+		tr->current_trace_flags = t->flags;
+	else if (t->tracer->flags)
+		tr->current_trace_flags = t->tracer->flags;
+	else
+		tr->current_trace_flags = &no_tracer_flags;
 
 	if (trace->init) {
 		ret = tracer_init(trace, tr);
@@ -5881,7 +5897,7 @@ static int tracing_buffer_meta_open(struct inode *inode, struct file *filp)
 
 	ret = ring_buffer_meta_seq_init(filp, tr->array_buffer.buffer, cpu);
 	if (ret < 0)
-		__trace_array_put(tr);
+		trace_array_put(tr);
 	return ret;
 }
 
@@ -9287,6 +9303,12 @@ static struct notifier_block trace_module_nb = {
 
 static __init void tracer_init_tracefs_work_func(struct work_struct *work)
 {
+	/*
+	 * Do not attempt to initialize tracefs if tracing was disabled or
+	 * failed to allocate
+	 */
+	if (tracing_disabled)
+		return;
 
 	event_trace_init();
 
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 2b46ca536045..127880ebe83f 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -482,18 +482,17 @@ predicate_parse(const char *str, int nr_parens, int nr_preds,
 	int len;
 	int N = 0;
 	int i;
-
-	nr_preds += 2; /* For TRUE and FALSE */
+	int nr_preds_alloc = nr_preds + 2; /* For TRUE and FALSE */
 
 	op_stack = kmalloc_objs(*op_stack, nr_parens);
 	if (!op_stack)
 		return ERR_PTR(-ENOMEM);
-	prog_stack = kzalloc_objs(*prog_stack, nr_preds);
+	prog_stack = kzalloc_objs(*prog_stack, nr_preds_alloc);
 	if (!prog_stack) {
 		parse_error(pe, -ENOMEM, 0);
 		goto out_free;
 	}
-	inverts = kmalloc_array(nr_preds, sizeof(*inverts), GFP_KERNEL);
+	inverts = kmalloc_array(nr_preds_alloc, sizeof(*inverts), GFP_KERNEL);
 	if (!inverts) {
 		parse_error(pe, -ENOMEM, 0);
 		goto out_free;
@@ -512,7 +511,7 @@ predicate_parse(const char *str, int nr_parens, int nr_preds,
 
 		switch (*next) {
 		case '(':					/* #2 */
-			if (top - op_stack > nr_parens) {
+			if (top - op_stack >= nr_parens - 1) {
 				ret = -EINVAL;
 				goto out_free;
 			}
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..dcb5d7321095 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -289,7 +289,7 @@ static u64 hist_field_log2(struct hist_field *hist_field,
 
 	u64 val = hist_fn_call(operand, elt, buffer, rbe, event);
 
-	return (u64) ilog2(roundup_pow_of_two(val));
+	return order_base_2(val);
 }
 
 static u64 hist_field_bucket(struct hist_field *hist_field,
@@ -873,7 +873,7 @@ static u64 hist_field_timestamp(struct hist_field *hist_field,
 	struct hist_trigger_data *hist_data = hist_field->hist_data;
 	struct trace_array *tr = hist_data->event_file->tr;
 
-	u64 ts = ring_buffer_event_time_stamp(buffer, rbe);
+	u64 ts = tracing_event_time_stamp(buffer, rbe);
 
 	if (hist_data->attrs->ts_in_usecs && trace_clock_in_ns(tr))
 		ts = ns2usecs(ts);
@@ -2121,7 +2121,8 @@ static int init_var_ref(struct hist_field *ref_field,
 	ref_field->size = var_field->size;
 	ref_field->is_signed = var_field->is_signed;
 	ref_field->flags |= var_field->flags &
-		(HIST_FIELD_FL_TIMESTAMP | HIST_FIELD_FL_TIMESTAMP_USECS);
+		(HIST_FIELD_FL_TIMESTAMP | HIST_FIELD_FL_TIMESTAMP_USECS |
+		 HIST_FIELD_FL_STACKTRACE);
 
 	if (system) {
 		ref_field->system = kstrdup(system, GFP_KERNEL);
@@ -3090,7 +3091,7 @@ create_field_var_hist(struct hist_trigger_data *target_hist_data,
 		key_field = hist_data->fields[i];
 		if (!first)
 			seq_buf_putc(&s, ',');
-		seq_buf_puts(&s, key_field->field->name);
+		expr_field_str(key_field, &s);
 		first = false;
 	}
 
@@ -3318,6 +3319,7 @@ static struct field_var *create_field_var(struct hist_trigger_data *hist_data,
 		ret = PTR_ERR(var);
 		goto err;
 	}
+	var->flags |= val->flags & HIST_FIELD_FL_STACKTRACE;
 
 	field_var = kzalloc_obj(struct field_var);
 	if (!field_var) {
@@ -3946,7 +3948,10 @@ static int check_synth_field(struct synth_event *event,
 	    && field->is_dynamic)
 		return 0;
 
-	if (strstr(hist_field->type, "long[") && field->is_stack)
+	if (!!(hist_field->flags & HIST_FIELD_FL_STACKTRACE) != field->is_stack)
+		return -EINVAL;
+
+	if (field->is_stack)
 		return 0;
 
 	if (strcmp(field->type, hist_field->type) != 0) {
@@ -4487,7 +4492,8 @@ static int create_var_field(struct hist_trigger_data *hist_data,
 	if (!ret && hist_data->fields[val_idx]->flags & HIST_FIELD_FL_EXECNAME)
 		update_var_execname(hist_data->fields[val_idx]);
 
-	if (!ret && hist_data->fields[val_idx]->flags &
+	if (!ret && !(hist_data->fields[val_idx]->flags & HIST_FIELD_FL_ALIAS) &&
+	    hist_data->fields[val_idx]->flags &
 	    (HIST_FIELD_FL_STRING | HIST_FIELD_FL_STACKTRACE))
 		hist_data->fields[val_idx]->var_str_idx = hist_data->n_var_str++;
 
@@ -5228,7 +5234,8 @@ static void hist_trigger_elt_update(struct hist_trigger_data *hist_data,
 		if (hist_field->flags & HIST_FIELD_FL_VAR) {
 			var_idx = hist_field->var.idx;
 
-			if (hist_field->flags &
+			if (!(hist_field->flags & HIST_FIELD_FL_ALIAS) &&
+			    hist_field->flags &
 			    (HIST_FIELD_FL_STRING | HIST_FIELD_FL_STACKTRACE)) {
 				unsigned int str_start, var_str_idx, idx;
 				char *str, *val_str;
diff --git a/kernel/trace/trace_snapshot.c b/kernel/trace/trace_snapshot.c
index 07b43c9863a2..4731ef7325a5 100644
--- a/kernel/trace/trace_snapshot.c
+++ b/kernel/trace/trace_snapshot.c
@@ -675,9 +675,12 @@ tracing_snapshot_write(struct file *filp, const char __user *ubuf, size_t cnt,
 		if (iter->cpu_file != RING_BUFFER_ALL_CPUS)
 			return -EINVAL;
 #endif
-		if (tr->allocated_snapshot)
+		if (tr->allocated_snapshot) {
 			ret = resize_buffer_duplicate_size(&tr->snapshot_buffer,
 					&tr->array_buffer, iter->cpu_file);
+			if (ret < 0)
+				return ret;
+		}
 
 		ret = tracing_arm_snapshot_locked(tr);
 		if (ret)
diff --git a/kernel/trace/undefsyms_base.c b/kernel/trace/undefsyms_base.c
index e65baf58e6ff..37310baf706b 100644
--- a/kernel/trace/undefsyms_base.c
+++ b/kernel/trace/undefsyms_base.c
@@ -9,6 +9,7 @@
 
 #include <linux/atomic.h>
 #include <linux/string.h>
+#include <asm/local.h>
 #include <asm/page.h>
 
 void undefsyms_base(void *p, int n);
@@ -18,11 +19,13 @@ static char page[PAGE_SIZE] __aligned(PAGE_SIZE);
 void undefsyms_base(void *p, int n)
 {
 	char buffer[256] = { 0 };
-
 	u32 u = 0;
+
 	memset((char * volatile)page, 8, PAGE_SIZE);
 	memset((char * volatile)buffer, 8, sizeof(buffer));
 	memcpy((void * volatile)p, buffer, sizeof(buffer));
 	cmpxchg((u32 * volatile)&u, 0, 8);
+	cmpxchg((unsigned long *)p, 0, 8);
+	local_set((local_t *)p, 8);
 	WARN_ON(n == 0xdeadbeef);
 }
