Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B04AD4B4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150575; cv=none; b=m0MFEo7oHTkUfWhr87Mp4CBRVAWsmoEtHha3GL6GcibMI/j4TZoIusJNvMwIAoJyCpu8EdxA+K/Oic5vtMBdlWMxFzDp0FfGq8IBSjs5fjrH4fPxDKz04rLGXKOwOlSKZtkIaYZGz4WTQeV+Cv/3xmZTvhXlqk/UlSAlBDxUufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150575; c=relaxed/simple;
	bh=LCD7gdzajKWCVUwRqfFHLD8+ICLj+ABHSdLQNBqnH7A=;
	h=Message-ID:Date:From:To:Cc:Subject; b=rEDEBL85hRqJ91+UpakCXw7T3H+zBevi8Bl3p+CCfp/CojA4XmCo7dIglCstMz+bXw51hQdD6IdGgWo7JP98kzDH697czK5lHgKUvAAFVyPvOlM0HjwaQFQ5YOucAaFZF6t1TtWhi3aTsWb4JDVPl2UDJBoekhyM2mqJFXT/vic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juFnpxqb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juFnpxqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D431F000FF;
	Fri, 11 Sep 2026 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150566;
	bh=JXeW2edCff2ijWr4nvHd/xF/nRaVI5Pr4juDx1yNCBk=;
	h=Date:From:To:Cc:Subject;
	b=juFnpxqbmXjEfi/5nwC0Yx7lwUxz9PKPPyyRzoC2d6M4VupsnhaWwIZZP3fI3cwoe
	 UEap99flxnGPQ1uCVi5NNgjYdoqMofYlrX1VB1cOm+sgO0TGUPJ3MppjiAnsJbE+/F
	 VQ7flnx61+kRb6bawLqUUzTCMkboBVszydgn/btJ9TajH0MaSLljeSnrcJUNFccIK3
	 zY1LUaKn0rvkVpPzk3TMK8yq90BfuPu4zQk4yUydOoUb47M23+f9Kpp6MfrC+UDMdM
	 wSp8Kh7NQywu+ZWNmU34gRMILeTZucl3u33Yj95kiE2NCnp+SBbQrnKfk6pQEIZon5
	 099KZtW+pWijA==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x55oW-000000094uQ-1BEt;
	Fri, 11 Sep 2026 14:17:28 -0400
Message-ID: <20260911181636.485043797@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 11 Sep 2026 14:16:36 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Henry Martin <bsdhenrymartin@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>,
 Karl Mehltretter <kmehltretter@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [for-linus][PATCH 00/20] tracing: Fixes for v7.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


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
  a "clock=" string. The histogram is set up first before the clock is
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


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 815e07c8fe885a87751c2496a30ae0dcd4118210


Donggeun Yoo (12):
      fgraph: Remove unused FGRAPH_MAX_INDEX
      function_graph: Use the saved entry's size when reprinting it
      tracing: Free histogram var refs regardless of how often they are referenced
      tracing: Free histogram the var ref when its initialization fails
      tracing: Free histogram the field rejected for a bad modifier
      tracing: Keep the entry count when the histogram stats allocation fails
      tracing: Let histogram values keep the percent and graph modifiers
      tracing: Set the trace clock before registering the histogram trigger
      tracing: Take the reference before publishing the named histogram trigger
      tracing: Undo the registration when enabling the histogram trigger fails
      tracing: Fix memory corruption from the histogram stacktrace modifier
      tracing: Fix memory corruption from a "STACKTRACE" histogram key

Hemanth Selam (2):
      tracing: Fix typo "availabe" in comment
      tracing: Fix typo "preceeded" in comment

Henry Martin (1):
      tracing/user_events: Don't destroy fields when event removal fails

Jérémy Jean (1):
      ftrace: fork: Initialize function graph state before copy_exec_state()

Karl Mehltretter (1):
      tracing: Fix ring_buffer_read_page_size() kernel-doc

Sebastian Andrzej Siewior (1):
      ring-buffer: Acquire the lock with irqsave in rb_wake_up_waiters()

Steven Rostedt (1):
      tracing: Take trace_array reference when opening a tracer options file

Thomas Weißschuh (1):
      tracing: Restore :mod: trailer after parsing in ftrace_set_clr_event()

----
 include/trace/events/timer.h         |  2 +-
 kernel/fork.c                        |  7 ++-
 kernel/trace/fgraph.c                |  3 --
 kernel/trace/rethook.c               |  2 +-
 kernel/trace/ring_buffer.c           | 15 +++----
 kernel/trace/trace.c                 | 46 ++++++++++++++++++-
 kernel/trace/trace.h                 |  1 +
 kernel/trace/trace_events.c          |  2 +
 kernel/trace/trace_events_hist.c     | 86 +++++++++++++++++++-----------------
 kernel/trace/trace_events_user.c     | 26 ++++++++---
 kernel/trace/trace_functions_graph.c |  3 ++
 11 files changed, 130 insertions(+), 63 deletions(-)
