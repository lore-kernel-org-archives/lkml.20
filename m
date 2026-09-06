Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F2130CD9E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659151; cv=none; b=jlecRNitI3+8yZsx7JMnuESfqiEIhFMSqkBRXBn8Qm8ruGqkeqR4WQt5f7amWxtINnquLmYy8tVqwOL/1vggD7CIzhhL8wTCwq9A/W1tqg90+FxgB9ZzjhVF5EdVnmlD1hrAs6R+xXsi2siv/WZyRErWgpjowQ/bGbe/YpKirEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659151; c=relaxed/simple;
	bh=Tx9HWJDh1ax+15AZf69fXTJ4CgpI+cCNz3+8cOKiNlw=;
	h=Message-ID:Date:From:To:Cc:Subject; b=nLq9OIokQe6IBkX2w++2d/FxsuLXJ5FosGVk+I7COA6/a3pvmYsHZnY/ESF2RNJdQFCM9WTEF0rE1Cm8wisaw/lD0Yi774gDWIwJooomNAUKelNBVqyMYe8mTUqyY8KrBIQauVU4nzf3YvmRE3PJl+wEd0SpCaoPRx9o8cQpHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpBGbaUI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpBGbaUI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489F01F00A3A;
	Sun,  6 Sep 2026 01:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659146;
	bh=q355NddGrxSsu7lNXmguPR9HC2cKLhY9TfqnLp7G0e0=;
	h=Date:From:To:Cc:Subject;
	b=cpBGbaUIMbuAmgCpf5JQPSdHZoZjBlGEJDjmRscIysbJlXszsDeues5nBvJj9Xo0R
	 PQnzmbMRS1xYHZvRwSDWAVAnhQZ6XjldIbiq8ajeJUza6BpQLClCgnX4xYxvIed2C+
	 5SbPCoJOqvq5gFRB5wWR8kTZcngg3PQT6FzSkZxjFt4LwmsLGd7qClturFKbMnN7p1
	 z3I8q+TNTdhgUksfSIC3Aui8UJqHP2PJSdtkEiT4UAsAv0SRnL7wKnZeBZQ7z1VPP3
	 UbRD4LM1agc6loRvcLXOvU8P2nktxy/HuKo/uBIBPIwUsQ7xQKHiwq8p9ItywVYypg
	 /GjvSVmuInNGg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x31yB-00000006PNB-0oZJ;
	Sat, 05 Sep 2026 21:46:55 -0400
Message-ID: <20260906014531.720267751@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 21:45:31 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 00/12] tracing: Fixes for v7.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tracing fixes for v7.3:

- Fix several tracefs files that did not take the trace_array reference

  A trace instance can be created and destroyed in the tracefs "instances"
  directory via mkdir and rmdir respectively. The instance is represented by
  a trace_array descriptor. Most tracefs files pass the trace_array as the
  private data of the inode to the open/read/write functions. Since there is
  no locking between the time a task opens a file and the deletion of the
  instance (and the freeing of the trace_array), each open needs to get a
  reference to the trace_array and each close must remove it. A instance
  can't be removed if there's any reference taken on its trace_array. The
  open function uses trace_array_get() that takes a lock (preventing removal
  of instances) and iterates the list of all existing trace_arrays and if it
  finds a match, it takes the reference and releases the lock. If it doesn't
  find a match, it causes the open to return -ENODEV.

  There were some added files that did not take the trace_array reference
  on open that needed to be fixed. Sashiko also correctly pointed out that
  there were some files that took a reference to an field or element of the
  trace_array which had a pointer back to the trace_array to take its
  reference on open. But this leaves a slight race between referencing this
  element to get the trace_array as the element itself could be freed. To
  solve this, some helper functions were created to look for trace_arrays
  with this field or element in the search so that the element did not have
  to be dereferenced before the trace_array's reference was taken.

- Add a lock around ftrace_ops initialization

  When a ftrace_ops is first used by ftrace, some internal initialization is
  performed on the ops. But if multiple tasks were calling functions that
  did this initialization, it could race and perform doing the
  initialization more than once, corrupting the internal data. Add a lock in
  the initialization code to prevent this from happening.

- Fix splice reads on mmapped buffers

  The logic in the ring buffer splice code for mmapped buffers is supposed
  to do a copy of the memory as the mapped buffers can't be given to splice.
  But there was an if statement within the copy code that would return a -1
  if a request for a full page was done and it wasn't a partial read. This
  is because this logic was written before mmapped buffers existed and this
  case didn't make sense at the time. For mmapped buffers it makes perfect
  sense and by returning early can drop a lot of pages unnecessarily.

- Have the persistent ring buffer validation check nr_subbufs

  Sashiko reported that the validation code was relying on the saved
  nr_subbufs to match the calculated nr_pages + 1 and if they were off, that
  the code could cause corruption. Sashiko is correct, and the saved
  nr_subbufs should be validated before assuming it is correct.

- Do not allow more than one instance with the same name on cmdline

  If an admin were to add more than one trace instances with the same name
  they all would be created, but only the first one would be accessible via
  tracefs. This used to not be allowed but some restructuring of code has
  since made it possible.

- Fix the race between subbuf resize and trace_pipe_raw readers

  If a task was reading trace_pipe_raw while another task was changing the
  ring buffer subbuf size, it could crash the reader. The trace_pipe_raw
  readers do get their own copy of the page from the buffer, but the code
  needs some restructuring to not have the resize of the subbuffers cause
  issues.

- Cap the size of the mapped (static) ring buffer nr_pages

  The meta data used for ring buffer mapped buffers is 32 bit in size. A
  normal ring buffer could (in theory) have more than 4 billion pages.
  But this is not allowed by mapped buffers, so enforce it.


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: d80e12156f1fd490adf29a8d28489725a3ac817a


Masami Hiramatsu (Google) (1):
      tracing: Fix to avoid creating trace instances with duplicate names

Steven Rostedt (7):
      tracing: Have show_event_filters/triggers files take trace array ref
      ftrace: Take trace_array reference before accessing its ftrace_ops
      ftrace: Synchronize the initialization of ftrace_ops
      tracing: Take trace_array reference when opening options file
      ring-buffer: Add checking nr_subbufs to persistent ring buffer validation
      tracing: Fix comment in tracing_buffers_splice_read()
      ring-buffer: Use a macro for static buffer bits

Vincent Donnefort (4):
      ring-buffer: Allow splice reads on static buffers
      tracing: Fix subbuf resize races with trace_pipe_raw readers
      ring-buffer: Cap static ring buffer nr_pages
      ring-buffer: Prevent truncation of nr_pages / nr_subbufs

----
 include/linux/ftrace.h               |   5 +-
 include/linux/ring_buffer.h          |   5 +-
 kernel/trace/ftrace.c                |  70 ++++++----
 kernel/trace/ring_buffer.c           | 239 +++++++++++++++++++++++------------
 kernel/trace/ring_buffer_benchmark.c |   6 +-
 kernel/trace/trace.c                 | 171 ++++++++++++++++---------
 kernel/trace/trace.h                 |  14 +-
 kernel/trace/trace_events.c          |  28 +++-
 kernel/trace/trace_functions.c       |   2 +-
 kernel/trace/trace_stack.c           |   2 +-
 10 files changed, 357 insertions(+), 185 deletions(-)
