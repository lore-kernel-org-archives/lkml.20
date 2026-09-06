Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C62A36897F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725008; cv=none; b=WTWqfC+S91o0KxdXBBWLmVfL/u2vmrXEvXBBaXsNxijeUPMMZucgmhB4MTDDrsdm2z259mbyVo/RP7XPyKYA3aGlPI81JNeZ1/8YQPFIqQtkEuMVjA6UGZvdlSm28sQqYToGTQtne8HILv3vvzsEZO7e6Eufi4kRia7JJoWXQow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725008; c=relaxed/simple;
	bh=2z64D2KiuSqbhCo4ZIWrUQ5UBiqsRnDHsLh7eJj6YYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LeTngc6EmlxaR3kWXk1pRilgfOwjuAIDqnkEeVtLb+fdmHRf5ega3nJUYChzrTq1I3tfv4qst+4CCxYGdMaqBMmybeis2sJbzBo7f+VyDd+c0AQMj73BCocyg6pmE7Kz6r7zW9tUXQTgvRZXlvkqgKC35x5VMMjkepF4NvuOGPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=PXuUNCX7; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="PXuUNCX7"
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 43DE9A4A63;
	Sun,  6 Sep 2026 20:03:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 798B519;
	Sun,  6 Sep 2026 20:03:17 +0000 (UTC)
Date: Sun, 6 Sep 2026 16:03:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Vincent Donnefort <vdonnefort@google.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: [GIT PULL] tracing: Fixes for 7.3
Message-ID: <20260906160316.5aed43e3@robin>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 798B519
X-Stat-Signature: i4jnc5zf8gic8wfk71uiiyytnrr3ucbf
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19nOGzUn/neA/3HHR3h16XjNVhCqgYPxMs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=p1Ja/VnRhfFubaS0vKdpsbJxyzObH2G9umIA9ks4vNc=; b=PXuUNCX7vftKkB8VpB/MEFt8gU5kYUEC5XnzRWCZ7MRI++fR8kQWduIoQv5RFHvWlo3pYXt4AkUSmpd+4ITz0zgSUwq+Cc9qPD0iWHtGnGQ44o6xDRqh1rMUF1X5anvWC9S6NhVJTFUzNbyu6k4LK/4cz+hionVpD/O/gW0kKJs=
X-HE-Tag: 1788724997-24595
X-HE-Meta: U2FsdGVkX1+7H1dAtS5LTbRZCpcRdFBivXU+2dV2BXDCamQ4iiwS4PIUQP/hv//ISX5G+JPyH0rR09+Iu7BHuc0u18k19xIRaldKiF5ToOIXJ1noBnDdYKZGSupF+GZ8RzPR/abOwn/pcrjfJvjaWahTU3sU9PLSU8fCGXNamgYGbe25IyN7fFkzw3Qjp2rzvUDmCmu2IK94R8NKh2M6QjyApw9A8NQkPpkL/+INkmo9P+VJdUBEVruz/HG5XH5ojKQYSWdadQdJIy3HO6vUpwVDch1K3htZJSTkIfARpfFfWqcqlmlvlZrWSeQUoUWa9GTES+vNXPbOOJ/IwDm3ruE/hyvjNBQX


Linus,

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
  there were some files that took an address of an field or element of the
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


Please pull the latest trace-v7.3-rc1 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v7.3-rc1

Tag SHA1: d878c05d090306c6cfb75b77ed73aad53677d59e
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
---------------------------
