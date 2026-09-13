Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119F21D00A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320916; cv=none; b=triHvX7KM9+B4beLL6FDnX0zXe1+eg3bTohc84Bmw+c0/6Sk5MYA9OcD8FgKDO1f2j+D3FyxNHaIa/tjqdojP/oQ4pIw5LKCDtXmItsS0btngw/jR6cPcGssKsrtC3hQPa1SpZBZ9JcvH11MycKfshhIY4zrIQWEeUgKMfgzhe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320916; c=relaxed/simple;
	bh=jtBMi277bxDsywJKq/9+Rtli/1ZjyYcHogrcyRVbsyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lTvL+WG1kV+sBjMeMjJgCXVVNeAzoL+dtUhUhuWedv1aUykpEYPEDfR7inNvQ1r7GNlvx+8agh3+Z0EdPhdKW3igyYJ637SyL9wPpTJMJ870RWhs+EpS/SSrvBQrlWEronyFh7SYtfmKazdC8nvazJtNm5s2Ydx513QK5hMDdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=3i/RB6CU; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="3i/RB6CU"
Received: from omf02.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id E32E51A0960;
	Sun, 13 Sep 2026 17:35:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 99C0180012;
	Sun, 13 Sep 2026 17:35:07 +0000 (UTC)
Date: Sun, 13 Sep 2026 13:35:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ali Ahmet =?UTF-8?B?TWVtacWf?=
 <aliamemis@disroot.org>, David Carlier <devnexen@gmail.com>, Donggeun Yoo
 <donggeunyoo.kernel@gmail.com>, Hemanth Selam <hemanth.selam@gmail.com>,
 Henry Martin <bsdhenrymartin@gmail.com>, =?UTF-8?B?SsOpcsOpbXk=?= Jean
 <Jeremy.Jean@oss.cyber.gouv.fr>, Karl Mehltretter <kmehltretter@gmail.com>,
 Leon Hwang <leon.hwang@linux.dev>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, Vincent Donnefort
 <vdonnefort@google.com>
Subject: [GIT PULL] tracing: Fixes for v7.3
Message-ID: <20260913133506.601e5bd9@robin>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 99C0180012
X-Stat-Signature: e5j5x75m7puka6dqubyy97stx3qapn59
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18pmOyShsexATY1668CJ5qdJRpx3sn20Vc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=4m4YajMVGqzNID+RsGyE0IKWGv97vgXfu6SgyyDvVfw=; b=3i/RB6CUlFxF3zbyNbZKPAN4XgV9fZwK0XG97IkzkOeytx8M+MghN82EPbEQn9p5XAjun+lug2wJx/34Dwlskh+qRd9ODGDvmf4/DdCpeSIazT26YIPjF/fMXEF5iHd4HQA6aQ0XzPAAB8xnSQmzLTcGNHSY830I7+XNRGN9sY8=
X-HE-Tag: 1789320907-242810
X-HE-Meta: U2FsdGVkX1941DPv4H4PoyHXcmu0tlHlSTwO8fmkPXLG2UXsF9P0KnonOtdpIlRkEQDiMiUhbLDN/kPDWeMJpuJmY6KbnUNNEbW/kEtPyv9c4gm/EOQAHjK9ExxDH9O/ZITmqbWehYnF1Oglhn6DlpyQ2gcRDDrAz+Aaoj1hLAHgSxFvgSGbW84/ZWVXpa4PxmbNMKmOKhbPIK3C9E3nG1SNcwef0dG+WKu7ALEfIEubhRQk9nuigJRRuF+IzgvFQ0DfdbHjPA1XottwQb8ZuNc3JuEdhHGWmYM+7fXLhA4UojNQ/wG4k+cwbUwwSj4BAIPUVFIHKXoTPWOOWk4UByMwQHdxUK9k


Linus,

tracing fixes for 7.3:

- Don't destroy user event fields when removal fails

  User event fields are destroyed before the event is removed from
  visibility. But that can fail leaving the still visible event with no
  fields. Move the destroying of the fields to after the event is
  successfully removed from visibility.

- Initialize function graph state is fork before calling copy_exec_state()

  For non-CLONE_VM forks, copy_exec_state() allocates a new task_exec_state.
  If that allocation fails, ftrace_graph_exit_task() will free the tasks
  ret_stack pointer. Since that pointer is still using the parent's
  ret_stack, it mistakenly frees the parent's pointer too.

  Call ftrace_graph_init() on the task first which will NULL out the new
  tasks's ret_stack and if the copy fails, it will not free anything.

- Remove FGRAPH_MAX_INDEX

  The macro FGRAPH_MAX_INDEX was added but never used. Remove it.

- Save ent_size in function graph printing of nested functions

  The function graph tracer needs to look at the next event to see if the
  next event is the return of the current function entry. If it is, it
  prints a single line:

    ktime_get();

  Otherwise it prints it like a nested function:

    tick_nohz_irq_exit() {
      ktime_get();
      kcpustat_irq_exit();
    }

  In order to look at the next event, it must save the current event so that
  it has the information to print from it. It saves the event in the
  iterator descriptor called "ent". What it doesn't save is the ent_size of
  the event which is now used to know if the function graph arguments are to
  be printed. The peek doesn't save the size so the size used happens to be
  that of the size of the last event that was seen.

  Save the entry event size in the iterator descriptor so that the correct
  size is used.

- Fix several errors with freeing data in the histogram code

  The histogram code had a lot of leaked or or incorrect accounting when
  failures happen. Correct them.

- Fix histogram regression of .percent and .graph modifiers

  Up until 6.3 histogram values could have "percent" or "graph" modifiers
  that changed how they were printed. But a change that added restricting
  histograms values from being strings, stack traces and other modifiers
  inadvertently prevented them from using the percent and graph modifiers,
  which were legal use cases for values.

  Put back the percent and graph modifiers.

- Fix various typos in the comments

- Set the trace_clock before initializing a histogram with clock argument

  The histogram API allows the user to specific which trace clock to use via
  a "clock=3D" string. The histogram is set up first before the clock is
  checked. If the passed in clock is not valid, it exits without fully
  fixing up the histogram leaving it on the list and a use-after-free can
  trigger.

  Update the clock argument first and if it fails then exit gracefully
  before the histogram trigger is placed on any lists.

- Restore :mod: trailer after parsing in ftrace_set_clr_event

  The function ftrace_set_clr_event() modifies the parse string and needs to
  put it back to what was passed in. It searches for ":mod:" via a strsep()
  but fails to put back the first ':' in the string.

  Add back the ':' in the passed in string.

- Take trace_array reference when opening a tracer options file

  The options files are dynamically created and some tracers add their own
  options. When a tracer adds their own list of options, the trace_array
  holding them has an array to hold the list of options for each tracer.
  This array increases in size via a krealloc(), and the new entry gets a
  newly allocated array to hold the options of the new tracer being added.

  The element in each entry of the tracer's option array holds a pointer
  back to the trace_array, a pointer to the tracer it is associated to, a
  pointer to the flags of the option.

  The issue is that these arrays are freed when the trace_array is freed
  when its instance it represents is removed from the instances directory.
  There's a race that an open of one of these options files can happen when
  the instance is being removed.

  Add a new helper function to be called by the open function of the options
  file to iterate all existing trace_arrays under a lock and find the one
  that has the given option element in one of it's tracer arrays. If found,
  then update the associated trace_array's reference counter to keep it from
  being freed. If not found, have the open call return -ENODEV.

- Disable interrupts when acquiring the lock in rb_wake_up_waiters()

  The function rb_wake_up_waiters() assumes it will be called in interrupt
  context and does not disable irqs when taking cpu_buffer->reader_lock,
  which can be called in hard interrupt context. The issue is in PREEMPT_RT,
  this function is called in thread context leaving this lock open to a
  deadlock.

  Take the lock with interrupts disabled.

- Use rcu_assign_pointer() for tmp_ops filter hash

  The tmp_ops used in update_ftrace_direct_mod() assigns its filter_hash
  field directly, but that field is annotated as __rcu and sparse complains.
  Assign it with rcu_assign_pointer()

- Fix use-after-free in enable_trigger_private_data_free()

  The trace_event_call is accessed through the event_trigger_data's
  trace_event_file pointer to put the trace_event_call on freeing. The issue
  is that the trace_event_file data may have been freed already causing a
  use-after-free. Add a field to the event_trigger_data that points directly
  to the trace_event_call so that it can decrement its reference directly
  without needing to go through the trace_event_file.

- Fix accounting of buffer data remote headers

  trace_buffer_desc_size() and trace_remote_alloc_buffer() undercount the
  number of pages is needed for the asked for size as it doesn't take into
  account the meta data on each page. Add a helper function to do the
  calculation properly and use that in these functions.

- Catch nr_page_va overflow in ring_buffer_desc sizing

  The number of pages per remote ring buffer is capped by
  ring_buffer_desc::nr_page_va (32 bits). A buffer_size large enough to
  overflow that field would silently allocate a descriptor smaller than what
  was asked for.

- Do not resize the subbuf order if any per_cpu buffer is disabled

  The mmapping of ring buffers disables resizing the subbuffers, but it is
  done per-cpu whereas the subbuf size change is done for all the per_cpu
  buffers under the buffer->mutex. It could change the size of some while
  the mapping is happening on others. Have the resize of the subbuf order
  check all the per_cpu buffers under the lock to see if any of them is
  disabled before starting and causing an inconsistency between buffers that
  are being mapped.


Please pull the latest trace-v7.3-rc2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v7.3-rc2

Tag SHA1: 28d78ea955e8311d11077a6e760e840df869ee20
Head SHA1: d860c67c051685abb0460b593b193f0f45f4fa92


Ali Ahmet Memi=C5=9F (1):
      tracing: Don't dereference trace_event_file in deferred trigger free

David Carlier (1):
      ring-buffer: Check resize_disabled before publishing the new subbuf o=
rder

Donggeun Yoo (12):
      fgraph: Remove unused FGRAPH_MAX_INDEX
      function_graph: Use the saved entry's size when reprinting it
      tracing: Free histogram var refs regardless of how often they are ref=
erenced
      tracing: Free histogram the var ref when its initialization fails
      tracing: Free histogram the field rejected for a bad modifier
      tracing: Keep the entry count when the histogram stats allocation fai=
ls
      tracing: Let histogram values keep the percent and graph modifiers
      tracing: Set the trace clock before registering the histogram trigger
      tracing: Take the reference before publishing the named histogram tri=
gger
      tracing: Undo the registration when enabling the histogram trigger fa=
ils
      tracing: Fix memory corruption from the histogram stacktrace modifier
      tracing: Fix memory corruption from a "STACKTRACE" histogram key

Hemanth Selam (2):
      tracing: Fix typo "availabe" in comment
      tracing: Fix typo "preceeded" in comment

Henry Martin (1):
      tracing/user_events: Don't destroy fields when event removal fails

J=C3=A9r=C3=A9my Jean (1):
      ftrace: fork: Initialize function graph state before copy_exec_state()

Karl Mehltretter (1):
      tracing: Fix ring_buffer_read_page_size() kernel-doc

Leon Hwang (1):
      ftrace: Use rcu_assign_pointer() for tmp_ops filter hash

Sebastian Andrzej Siewior (1):
      ring-buffer: Acquire the lock with irqsave in rb_wake_up_waiters()

Steven Rostedt (1):
      tracing: Take trace_array reference when opening a tracer options file

Thomas Wei=C3=9Fschuh (1):
      tracing: Restore :mod: trailer after parsing in ftrace_set_clr_event()

Vincent Donnefort (2):
      tracing/remotes: Account for ring buffer page header in size calculat=
ion
      tracing/remotes: Catch nr_page_va overflow in ring_buffer_desc sizing

----
 include/linux/ring_buffer.h          | 19 +++++++-
 include/trace/events/timer.h         |  2 +-
 kernel/fork.c                        |  7 ++-
 kernel/trace/fgraph.c                |  3 --
 kernel/trace/ftrace.c                |  2 +-
 kernel/trace/rethook.c               |  2 +-
 kernel/trace/ring_buffer.c           | 23 ++++++----
 kernel/trace/trace.c                 | 46 ++++++++++++++++++-
 kernel/trace/trace.h                 |  2 +
 kernel/trace/trace_events.c          |  2 +
 kernel/trace/trace_events_hist.c     | 86 +++++++++++++++++++-------------=
----
 kernel/trace/trace_events_trigger.c  |  4 +-
 kernel/trace/trace_events_user.c     | 26 ++++++++---
 kernel/trace/trace_functions_graph.c |  3 ++
 kernel/trace/trace_remote.c          |  6 ++-
 15 files changed, 165 insertions(+), 68 deletions(-)
---------------------------
diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index afc7daa6ee7d..eac3e9080c3c 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -3,8 +3,9 @@
 #define _LINUX_RING_BUFFER_H
=20
 #include <linux/mm.h>
-#include <linux/seq_file.h>
 #include <linux/poll.h>
+#include <linux/ring_buffer_types.h>
+#include <linux/seq_file.h>
=20
 #include <uapi/linux/trace_mmap.h>
=20
@@ -279,11 +280,25 @@ static inline struct ring_buffer_desc *__first_ring_b=
uffer_desc(struct trace_buf
 	return (struct ring_buffer_desc *)(&desc->__data[0]);
 }
=20
+/*
+ * Returns the number of pages for a ring_buffer_desc. The caller must ens=
ure it
+ * does not overflow ring_buffer_desc::nr_page_va.
+ */
+static inline unsigned long __calc_nr_pages_ring_buffer_desc(size_t size)
+{
+	/* Takes into account the reader page */
+	return max(DIV_ROUND_UP(size, PAGE_SIZE - BUF_PAGE_HDR_SIZE), 2UL) + 1;
+}
+
 static inline size_t trace_buffer_desc_size(size_t buffer_size, unsigned i=
nt nr_cpus)
 {
-	unsigned int nr_pages =3D max(DIV_ROUND_UP(buffer_size, PAGE_SIZE), 2UL) =
+ 1;
+	unsigned long nr_pages =3D __calc_nr_pages_ring_buffer_desc(buffer_size);
 	struct ring_buffer_desc *rbdesc;
=20
+	/* Capped by ring_buffer_desc::nr_page_va */
+	if (nr_pages > UINT_MAX)
+		return SIZE_MAX;
+
 	return size_add(offsetof(struct trace_buffer_desc, __data),
 			size_mul(nr_cpus, struct_size(rbdesc, page_va, nr_pages)));
 }
diff --git a/include/trace/events/timer.h b/include/trace/events/timer.h
index ca82fd62dc30..3aa0608c6361 100644
--- a/include/trace/events/timer.h
+++ b/include/trace/events/timer.h
@@ -302,7 +302,7 @@ DECLARE_EVENT_CLASS(hrtimer_class,
  * hrtimer_start_expired - Invoked when a expired timer was started
  * @hrtimer:	pointer to struct hrtimer
  *
- * Preceeded by a hrtimer_start tracepoint.
+ * Preceded by a hrtimer_start tracepoint.
  */
 DEFINE_EVENT(hrtimer_class, hrtimer_start_expired,
=20
diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..a5934a317634 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2133,6 +2133,11 @@ __latent_entropy struct task_struct *copy_process(
 	p =3D dup_task_struct(current, node);
 	if (!p)
 		goto fork_out;
+	/*
+	 * Must run before the first fallible op, so error paths never
+	 * free the parent's ret_stack.
+	 */
+	ftrace_graph_init_task(p);
 	retval =3D copy_exec_state(clone_flags, p);
 	if (retval)
 		goto bad_fork_free;
@@ -2159,8 +2164,6 @@ __latent_entropy struct task_struct *copy_process(
 	 */
 	p->clear_child_tid =3D (clone_flags & CLONE_CHILD_CLEARTID) ? args->child=
_tid : NULL;
=20
-	ftrace_graph_init_task(p);
-
 	rt_mutex_init_task(p);
 	raw_spin_lock_init(&p->blocked_lock);
=20
diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 40d373d65f9b..ed455b53513b 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -143,9 +143,6 @@ enum {
 #define FGRAPH_DATA_INDEX_MASK	GENMASK(FGRAPH_DATA_INDEX_BITS - 1, 0)
 #define FGRAPH_DATA_INDEX_SHIFT	(FGRAPH_DATA_SHIFT + FGRAPH_DATA_BITS)
=20
-#define FGRAPH_MAX_INDEX	\
-	((FGRAPH_INDEX_SIZE << FGRAPH_DATA_BITS) + FGRAPH_RET_INDEX)
-
 #define FGRAPH_ARRAY_SIZE	FGRAPH_INDEX_BITS
=20
 /*
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 53d5db60bfa5..673a54fdf392 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6675,7 +6675,7 @@ int update_ftrace_direct_mod(struct ftrace_ops *ops, =
struct ftrace_hash *hash, b
=20
 	/* Enable the tmp_ops to have the same functions as the hash object. */
 	ftrace_ops_init(&tmp_ops);
-	tmp_ops.func_hash->filter_hash =3D hash;
+	rcu_assign_pointer(tmp_ops.func_hash->filter_hash, hash);
=20
 	err =3D register_ftrace_function_nolock(&tmp_ops);
 	if (err)
diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
index 5a8bdf88999a..87a27f3aa4a6 100644
--- a/kernel/trace/rethook.c
+++ b/kernel/trace/rethook.c
@@ -171,7 +171,7 @@ struct rethook_node *rethook_try_get(struct rethook *rh)
 	 * This expects the caller will set up a rethook on a function entry.
 	 * When the function returns, the rethook will eventually be reclaimed
 	 * or released in the rethook_recycle() with call_rcu().
-	 * This means the caller must be run in the RCU-availabe context.
+	 * This means the caller must be run in the RCU-available context.
 	 */
 	if (unlikely(!rcu_is_watching()))
 		return NULL;
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 9c03a555a6ba..04bb94c29f58 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -904,14 +904,13 @@ static void rb_wake_up_waiters(struct irq_work *work)
 		struct ring_buffer_per_cpu *cpu_buffer =3D
 			container_of(rbwork, struct ring_buffer_per_cpu, irq_work);
=20
-		/* Called from interrupt context */
-		raw_spin_lock(&cpu_buffer->reader_lock);
-		rbwork->wakeup_full =3D false;
-		rbwork->full_waiters_pending =3D false;
+		scoped_guard(raw_spinlock_irqsave, &cpu_buffer->reader_lock) {
+			rbwork->wakeup_full =3D false;
+			rbwork->full_waiters_pending =3D false;
=20
-		/* Waking up all waiters, they will reset the shortest full */
-		cpu_buffer->shortest_full =3D 0;
-		raw_spin_unlock(&cpu_buffer->reader_lock);
+			/* Waking up all waiters, they will reset the shortest full */
+			cpu_buffer->shortest_full =3D 0;
+		}
=20
 		wake_up_all(&rbwork->full_waiters);
 	}
@@ -7384,7 +7383,7 @@ EXPORT_SYMBOL_GPL(ring_buffer_read_page_data);
=20
 /**
  * ring_buffer_read_page_size - get size of the read page.
- * @page:  the page to get the size from
+ * @rpage:  the page to get the size from
  *
  * Returns size of the page in bytes.
  */
@@ -7474,6 +7473,14 @@ int ring_buffer_subbuf_order_set(struct trace_buffer=
 *buffer, int order)
=20
 	old_capacity =3D rb_subbuf_capacity(buffer);
=20
+	/* The mmap fast path reads subbuf_order without buffer->mutex. */
+	for_each_buffer_cpu(buffer, cpu) {
+		if (!cpumask_test_cpu(cpu, buffer->cpumask))
+			continue;
+		if (atomic_read(&buffer->buffers[cpu]->resize_disabled))
+			return -EBUSY;
+	}
+
 	atomic_inc(&buffer->record_disabled);
=20
 	/* Make sure all commits have finished */
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 8658cad53cb5..e4a490d3d08c 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -7717,12 +7717,55 @@ trace_options_write(struct file *filp, const char _=
_user *ubuf, size_t cnt,
 	return cnt;
 }
=20
+static bool tr_option_match(struct trace_array *tr, void *topt)
+{
+	for (int i =3D 0; i < tr->nr_topts; i++) {
+		struct trace_options *tr_topts =3D &tr->topts[i];
+
+		if (topt >=3D (void *)&tr_topts->topts[0] &&
+		    topt < (void *)&tr_topts->topts[tr_topts->nr_topts])
+			return true;
+	}
+	return false;
+}
+
+/*
+ * The topt is the address of a trace_array->topts[] element that holds the
+ * the tracer options descriptor. But since the trace_array reference has =
not
+ * been taken yet, it cannot be dereferenced as it could have been freed by
+ * a rmdir of the instance the trace_array represents.
+ *
+ * Search the list of trace_arrays and compare the topt to the address of
+ * the entire trace_array topts array for each trace_array in the list.
+ * If one is matched, then take the reference and return it. If not, the
+ * trace_array no longer exits.
+ */
+static int trace_array_tracer_options_get(void *topt)
+{
+	struct trace_array *tr;
+	int ret;
+
+	ret =3D security_locked_down(LOCKDOWN_TRACEFS);
+	if (ret)
+		return ret;
+
+	if (tracing_disabled)
+		return -ENODEV;
+
+	guard(mutex)(&trace_types_lock);
+	list_for_each_entry(tr, &ftrace_trace_arrays, list) {
+		if (tr_option_match(tr, topt))
+			return __trace_array_get(tr);
+	}
+	return -ENODEV;
+}
+
 static int tracing_open_options(struct inode *inode, struct file *filp)
 {
 	struct trace_option_dentry *topt =3D inode->i_private;
 	int ret;
=20
-	ret =3D tracing_check_open_get_tr(topt->tr);
+	ret =3D trace_array_tracer_options_get(topt);
 	if (ret)
 		return ret;
=20
@@ -7984,6 +8027,7 @@ create_trace_option_files(struct trace_array *tr, str=
uct tracer *tracer,
 	tr->topts =3D tr_topts;
 	tr->topts[tr->nr_topts].tracer =3D tracer;
 	tr->topts[tr->nr_topts].topts =3D topts;
+	tr->topts[tr->nr_topts].nr_topts =3D cnt;
 	tr->nr_topts++;
=20
 	for (cnt =3D 0; opts[cnt].name; cnt++) {
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 5e76f94e7a80..3749485a7d85 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -227,6 +227,7 @@ struct array_buffer {
 struct trace_options {
 	struct tracer			*tracer;
 	struct trace_option_dentry	*topts;
+	int				nr_topts;
 };
=20
 struct trace_pid_list *trace_pid_list_alloc(void);
@@ -1952,6 +1953,7 @@ struct event_trigger_data {
=20
 struct enable_trigger_data {
 	struct trace_event_file		*file;
+	struct trace_event_call		*call;
 	bool				enable;
 	bool				hist;
 };
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 9dbc2441763b..30c0ddf90887 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -1489,6 +1489,8 @@ int ftrace_set_clr_event(struct trace_array *tr, char=
 *buf, int set)
 	/* Put back the colon to allow this to be called again */
 	if (buf)
 		*(buf - 1) =3D ':';
+	if (mod)
+		*(mod - 5) =3D ':';
=20
 	return ret;
 }
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_h=
ist.c
index 963e0d6b61fd..8af97fd4ee2d 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -169,7 +169,6 @@ struct hist_field {
 	struct hist_field		*operands[HIST_FIELD_OPERANDS_MAX];
 	struct hist_trigger_data	*hist_data;
 	enum hist_field_fn		fn_num;
-	unsigned int			ref;
 	unsigned int			size;
 	unsigned int			offset;
 	unsigned int                    is_signed;
@@ -1913,16 +1912,8 @@ static int contains_operator(char *str, char **sep)
 	return field_op;
 }
=20
-static void get_hist_field(struct hist_field *hist_field)
-{
-	hist_field->ref++;
-}
-
 static void __destroy_hist_field(struct hist_field *hist_field)
 {
-	if (--hist_field->ref > 1)
-		return;
-
 	kfree(hist_field->var.name);
 	kfree(hist_field->name);
=20
@@ -1969,8 +1960,6 @@ static struct hist_field *create_hist_field(struct hi=
st_trigger_data *hist_data,
 	if (!hist_field)
 		return NULL;
=20
-	hist_field->ref =3D 1;
-
 	hist_field->hist_data =3D hist_data;
=20
 	if (flags & HIST_FIELD_FL_EXPR || flags & HIST_FIELD_FL_ALIAS)
@@ -2223,10 +2212,8 @@ static struct hist_field *create_var_ref(struct hist=
_trigger_data *hist_data,
 	for (i =3D 0; i < hist_data->n_var_refs; i++) {
 		ref_field =3D hist_data->var_refs[i];
 		if (ref_field->var.idx =3D=3D var_field->var.idx &&
-		    ref_field->var.hist_data =3D=3D var_field->hist_data) {
-			get_hist_field(ref_field);
+		    ref_field->var.hist_data =3D=3D var_field->hist_data)
 			return ref_field;
-		}
 	}
 	/* Sanity check to avoid out-of-bound write on 'hist_data->var_refs' */
 	if (hist_data->n_var_refs >=3D TRACING_MAP_VARS_MAX)
@@ -2234,7 +2221,7 @@ static struct hist_field *create_var_ref(struct hist_=
trigger_data *hist_data,
 	ref_field =3D create_hist_field(var_field->hist_data, NULL, flags, NULL);
 	if (ref_field) {
 		if (init_var_ref(ref_field, var_field, system, event_name)) {
-			destroy_hist_field(ref_field, 0);
+			__destroy_hist_field(ref_field);
 			return NULL;
 		}
=20
@@ -2330,6 +2317,7 @@ parse_field(struct hist_trigger_data *hist_data, stru=
ct trace_event_file *file,
 	struct ftrace_event_field *field =3D NULL;
 	char *field_name, *modifier, *str;
 	struct trace_array *tr =3D file->tr;
+	bool stack_modifier =3D false;
=20
 	modifier =3D str =3D kstrdup(field_str, GFP_KERNEL);
 	if (!modifier)
@@ -2352,9 +2340,10 @@ parse_field(struct hist_trigger_data *hist_data, str=
uct trace_event_file *file,
 			*flags |=3D HIST_FIELD_FL_EXECNAME;
 		else if (strcmp(modifier, "syscall") =3D=3D 0)
 			*flags |=3D HIST_FIELD_FL_SYSCALL;
-		else if (strcmp(modifier, "stacktrace") =3D=3D 0)
+		else if (strcmp(modifier, "stacktrace") =3D=3D 0) {
 			*flags |=3D HIST_FIELD_FL_STACKTRACE;
-		else if (strcmp(modifier, "log2") =3D=3D 0)
+			stack_modifier =3D true;
+		} else if (strcmp(modifier, "log2") =3D=3D 0)
 			*flags |=3D HIST_FIELD_FL_LOG2;
 		else if (strcmp(modifier, "usecs") =3D=3D 0)
 			*flags |=3D HIST_FIELD_FL_TIMESTAMP_USECS;
@@ -2415,6 +2404,7 @@ parse_field(struct hist_trigger_data *hist_data, stru=
ct trace_event_file *file,
 				*flags |=3D HIST_FIELD_FL_CPU;
 			} else if (field && field->filter_type =3D=3D FILTER_STACKTRACE) {
 				*flags |=3D HIST_FIELD_FL_STACKTRACE;
+				field =3D NULL;
 			} else if (field && field->filter_type =3D=3D FILTER_COMM) {
 				*flags |=3D HIST_FIELD_FL_COMM | HIST_FIELD_FL_STRING;
 			} else {
@@ -2425,6 +2415,12 @@ parse_field(struct hist_trigger_data *hist_data, str=
uct trace_event_file *file,
 			}
 		}
 	}
+
+	if (stack_modifier &&
+	    (!field || field->filter_type !=3D FILTER_STACKTRACE)) {
+		hist_err(tr, HIST_ERR_BAD_FIELD_MODIFIER, errpos(field_str));
+		field =3D ERR_PTR(-EINVAL);
+	}
  out:
 	kfree(str);
=20
@@ -3276,7 +3272,6 @@ static struct hist_field *create_var(struct hist_trig=
ger_data *hist_data,
 		goto out;
 	}
=20
-	var->ref =3D 1;
 	var->flags =3D HIST_FIELD_FL_VAR;
 	var->var.idx =3D idx;
 	var->var.hist_data =3D var->hist_data =3D hist_data;
@@ -4313,8 +4308,7 @@ static int __create_val_field(struct hist_trigger_dat=
a *hist_data,
 			goto err;
 	} else {
 		/* Value */
-		if (hist_field->flags & (HIST_FIELD_FL_GRAPH | HIST_FIELD_FL_PERCENT |
-					 HIST_FIELD_FL_BUCKET | HIST_FIELD_FL_LOG2 |
+		if (hist_field->flags & (HIST_FIELD_FL_BUCKET | HIST_FIELD_FL_LOG2 |
 					 HIST_FIELD_FL_SYM | HIST_FIELD_FL_SYM_OFFSET |
 					 HIST_FIELD_FL_SYSCALL | HIST_FIELD_FL_STACKTRACE))
 			goto err;
@@ -4331,6 +4325,7 @@ static int __create_val_field(struct hist_trigger_dat=
a *hist_data,
 	return ret;
  err:
 	hist_err(file->tr, HIST_ERR_BAD_FIELD_MODIFIER, errpos(field_str));
+	destroy_hist_field(hist_field, 0);
 	return -EINVAL;
 }
=20
@@ -5690,7 +5685,7 @@ static int print_entries(struct seq_file *m,
 {
 	struct tracing_map_sort_entry **sort_entries =3D NULL;
 	struct tracing_map *map =3D hist_data->map;
-	int i, j, n_entries;
+	int i, j, n_entries, ret;
 	struct hist_val_stat *stats =3D NULL;
 	u64 val;
=20
@@ -5700,6 +5695,8 @@ static int print_entries(struct seq_file *m,
 	if (n_entries < 0)
 		return n_entries;
=20
+	ret =3D n_entries;
+
 	/* Calculate the max and the total for each field if needed. */
 	for (j =3D 0; j < hist_data->n_vals; j++) {
 		if (!(hist_data->fields[j]->flags &
@@ -5708,7 +5705,7 @@ static int print_entries(struct seq_file *m,
 		if (!stats) {
 			stats =3D kzalloc_objs(*stats, hist_data->n_vals);
 			if (!stats) {
-				n_entries =3D -ENOMEM;
+				ret =3D -ENOMEM;
 				goto out;
 			}
 		}
@@ -5729,7 +5726,7 @@ static int print_entries(struct seq_file *m,
 out:
 	tracing_map_destroy_sort_entries(sort_entries, n_entries);
=20
-	return n_entries;
+	return ret;
 }
=20
 static void hist_trigger_show(struct seq_file *m,
@@ -6383,17 +6380,18 @@ static int event_hist_trigger_named_init(struct eve=
nt_trigger_data *data)
 {
 	int ret;
=20
-	data->ref++;
-
-	save_named_trigger(data->named_data->name, data);
-
 	ret =3D event_hist_trigger_init(data->named_data);
 	if (ret < 0) {
 		kfree(data->cmd_ops);
 		data->cmd_ops =3D &trigger_hist_cmd;
+		return ret;
 	}
=20
-	return ret;
+	data->ref++;
+
+	save_named_trigger(data->named_data->name, data);
+
+	return 0;
 }
=20
 static void event_hist_trigger_named_free(struct event_trigger_data *data)
@@ -6643,12 +6641,6 @@ static int hist_register_trigger(char *glob,
 		data->cmd_ops =3D cmd_ops;
 	}
=20
-	if (data->cmd_ops->init) {
-		ret =3D data->cmd_ops->init(data);
-		if (ret < 0)
-			goto out;
-	}
-
 	if (hist_data->enable_timestamps) {
 		char *clock =3D hist_data->attrs->clock;
=20
@@ -6661,6 +6653,15 @@ static int hist_register_trigger(char *glob,
 		tracing_set_filter_buffering(file->tr, true);
 	}
=20
+	if (data->cmd_ops->init) {
+		ret =3D data->cmd_ops->init(data);
+		if (ret < 0) {
+			if (hist_data->enable_timestamps)
+				tracing_set_filter_buffering(file->tr, false);
+			goto out;
+		}
+	}
+
 	if (named_data) {
 		remove_hist_vars(hist_data);
 		destroy_hist_data(hist_data);
@@ -6678,11 +6679,12 @@ static int hist_trigger_enable(struct event_trigger=
_data *data,
=20
 	update_cond_flag(file);
=20
-	if (trace_event_trigger_enable_disable(file, 1) < 0) {
-		list_del_rcu(&data->list);
-		update_cond_flag(file);
+	/*
+	 * On failure the caller undoes the registration, and
+	 * hist_unregister_trigger() can only find the trigger here.
+	 */
+	if (trace_event_trigger_enable_disable(file, 1) < 0)
 		ret--;
-	}
=20
 	return ret;
 }
@@ -6760,13 +6762,13 @@ static void hist_unregister_trigger(char *glob,
 		}
 	}
=20
-	if (test && test->cmd_ops->free)
-		test->cmd_ops->free(test);
-
 	if (hist_data->enable_timestamps) {
 		if (!hist_data->remove || test)
 			tracing_set_filter_buffering(file->tr, false);
 	}
+
+	if (test && test->cmd_ops->free)
+		test->cmd_ops->free(test);
 }
=20
 static bool hist_file_check_refs(struct trace_event_file *file)
@@ -6971,6 +6973,8 @@ static int event_hist_trigger_parse(struct event_comm=
and *cmd_ops,
 	return ret;
  out_unreg:
 	event_trigger_unregister(cmd_ops, file, glob+1, trigger_data);
+	/* The unregister frees trigger_data, skip out_free */
+	goto out;
  out_free:
 	remove_hist_vars(hist_data);
=20
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_event=
s_trigger.c
index 149300cc5e8a..4d2fde996c0f 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -1728,7 +1728,8 @@ static void enable_trigger_private_data_free(struct e=
vent_trigger_data *data)
 {
 	struct enable_trigger_data *enable_data =3D data->private_data;
=20
-	trace_event_put_ref(enable_data->file->event_call);
+	/* The file may already be freed here, only the call is kept alive */
+	trace_event_put_ref(enable_data->call);
 	kfree(enable_data);
 }
=20
@@ -1801,6 +1802,7 @@ int event_enable_trigger_parse(struct event_command *=
cmd_ops,
 	enable_data->hist =3D hist;
 	enable_data->enable =3D enable;
 	enable_data->file =3D event_enable_file;
+	enable_data->call =3D event_enable_file->event_call;
=20
 	trigger_data =3D trigger_data_alloc(cmd_ops, cmd, param, enable_data);
 	if (!trigger_data)
diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_u=
ser.c
index 93cda2f6f269..f658c3a77aa7 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -1122,10 +1122,9 @@ static void user_event_destroy_validators(struct use=
r_event *user)
 	}
 }
=20
-static void user_event_destroy_fields(struct user_event *user)
+static void user_event_destroy_fields(struct list_head *head)
 {
 	struct ftrace_event_field *field, *next;
-	struct list_head *head =3D &user->fields;
=20
 	list_for_each_entry_safe(field, next, head, link) {
 		list_del(&field->link);
@@ -1502,17 +1501,32 @@ static int user_event_set_call_visible(struct user_=
event *user, bool visible)
=20
 static int destroy_user_event(struct user_event *user)
 {
+	LIST_HEAD(fields);
 	int ret =3D 0;
=20
 	lockdep_assert_held(&event_mutex);
=20
-	/* Must destroy fields before call removal */
-	user_event_destroy_fields(user);
+	/*
+	 * Detach the fields before removing the call. Removing the event
+	 * frees the field list memory (trace_destroy_fields() is run on
+	 * successful removal and kmem_cache_free()s the fields), but the
+	 * fields here are allocated and owned by user_events. Destroy
+	 * them separately once removal has succeeded.
+	 */
+	list_splice_init(&user->fields, &fields);
=20
 	ret =3D user_event_set_call_visible(user, false);
=20
-	if (ret)
+	if (ret) {
+		/*
+		 * Removal failed and the event stays registered, recover
+		 * the fields so it is left in a consistent state.
+		 */
+		list_splice(&fields, &user->fields);
 		return ret;
+	}
+
+	user_event_destroy_fields(&fields);
=20
 	dyn_event_remove(&user->devent);
 	hash_del(&user->node);
@@ -2212,7 +2226,7 @@ static int user_event_parse(struct user_event_group *=
group, char *name,
 put_user_lock:
 	mutex_unlock(&event_mutex);
 put_user:
-	user_event_destroy_fields(user);
+	user_event_destroy_fields(&user->fields);
 	user_event_destroy_validators(user);
 	kfree(user->call.print_fmt);
=20
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_func=
tions_graph.c
index ff7cb1a76b95..c5befd0c5b9a 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -52,6 +52,7 @@ struct fgraph_data {
 	};
 	struct ftrace_graph_ret_entry	ret;
 	int				failed;
+	int				ent_size;
 	int				cpu;
 };
=20
@@ -1274,6 +1275,7 @@ print_graph_entry(struct ftrace_graph_ent_entry *fiel=
d, struct trace_seq *s,
 		if (s->full) {
 			data->failed =3D 1;
 			data->cpu =3D cpu;
+			data->ent_size =3D iter->ent_size;
 		} else
 			data->failed =3D 0;
 	}
@@ -1457,6 +1459,7 @@ print_graph_function_flags(struct trace_iterator *ite=
r, u32 flags)
 	if (data && data->failed) {
 		field =3D &data->ent.ent;
 		iter->cpu =3D data->cpu;
+		iter->ent_size =3D data->ent_size;
 		ret =3D print_graph_entry(field, s, iter, flags);
 		if (ret =3D=3D TRACE_TYPE_HANDLED && iter->cpu !=3D cpu) {
 			per_cpu_ptr(data->cpu_data, iter->cpu)->ignore =3D 1;
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 75fa1ffc4c96..2d5bc423efca 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -980,9 +980,12 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc=
 *desc, size_t desc_size,
 			      const struct cpumask *cpumask)
 {
 	size_t min_desc_size =3D trace_buffer_desc_size(buffer_size, cpumask_weig=
ht(cpumask));
-	unsigned int nr_pages =3D max(DIV_ROUND_UP(buffer_size, PAGE_SIZE), 2UL) =
+ 1;
 	struct ring_buffer_desc *rb_desc;
 	int cpu, ret =3D -ENOMEM;
+	unsigned int nr_pages;
+
+	if (min_desc_size =3D=3D SIZE_MAX)
+		return -E2BIG;
=20
 	if (desc_size < min_desc_size)
 		return -EINVAL;
@@ -991,6 +994,7 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc =
*desc, size_t desc_size,
 	desc->struct_len =3D min_desc_size;
=20
 	rb_desc =3D __first_ring_buffer_desc(desc);
+	nr_pages =3D __calc_nr_pages_ring_buffer_desc(buffer_size);
=20
 	for_each_cpu(cpu, cpumask) {
 		unsigned int id;
