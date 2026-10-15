Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4067F4AA56B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071244; cv=none; b=Lv+p7CHCht6NGLqTDXl3kvbOfY0FPlWo1U8lpDp1VzCJIfKSjW7p+elznmW8RtScIYVhTEVIc6iTMAtrurYrOfkXs2AuSg1It2nkaJb2KjH0uslNDB648QxifGiyvVPI9vS/6ZEqlgosWle+MPb8YQZrKXZ+p/qbROUAIjNlPY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071244; c=relaxed/simple;
	bh=4JwtdD2BAghkosfPShhx4u5EGdaP/VGJN8JTs+nEWZM=;
	h=Message-ID:Date:From:To:Cc:Subject; b=VQxQjdGMukbLZbIDEO4iawzegO2Da0GaLdJBUhnSqLrOZbAQIg9PaP0l+DxrLh4krGL84lp4O4kIopWAEiAo2l3oFa3qNdG8do85ijDrJadVQsSBhNjFNwoLqYAhW8fo1wcytkjKkeAPbzzW3dph7zuk9i/ZDyr0ZWM1c+HJeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNaDDDjK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNaDDDjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5D71F000C4;
	Thu, 15 Oct 2026 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071242;
	bh=xdD+YtJ2tqWInsDxgtfivjXFvuaqWmisDh1fIsK1qa0=;
	h=Date:From:To:Cc:Subject;
	b=WNaDDDjKBaAanSgRXoSw7ZVgj3IJKqy9d0VHyYFE51cNm+SwzoZSVN6/aoMEkEtSI
	 Z9s0F/J4fvwpoGdpGsOSSkraF6qbSVOTXvYYBlMde6FeX6yNySl0jaftH9EgeE84Ub
	 EcG/371SLTZXjhnIyRda4Y48xoQ1VR6lbESoCwHzq0r4EQHOncJ4lqHiWMoI18myQq
	 r01/p8wg3x5V0y/oUnRZNZFbKKF5C9T85Pl9d6te5tdEpQXZBc7dx3gRh2IAK29iQy
	 HAb4KzFuptjRlOuoSMZkQV/PGVoKTEo7FIlevf86mcPTZ91SaXvSKi9L6QsTWbwAkI
	 Rpm8y3xxOBQXw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHLas-00000000MZM-0Ckl;
	Thu, 15 Oct 2026 09:34:02 -0400
Message-ID: <20261015133310.731003448@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 15 Oct 2026 09:33:10 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Amit Machhiwal <amachhiw@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>,
 David Carlier <devnexen@gmail.com>,
 Dmitry Kandybka <d.kandybka@gmail.com>,
 Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
 Krystian Kaniewski <krystianmkaniewski@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Tengda Wu <wutengda@huaweicloud.com>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 00/16] tracing: Fixes for v7.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>



Fixes for v7.3:

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

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: a244c241593b5b38a08f0df2cb43c26574efbdcb


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

Krystian Kaniewski (1):
      ring-buffer: Fix false warning in ring_buffer_map_get_reader()

Lee Jones (1):
      tracing/histograms: Reject non-stacktrace fields for synthetic stacktrace fields

Tengda Wu (1):
      tracing: Fix hist trigger timestamps for buffered events

Vincent Donnefort (5):
      tracing: Fix empty symbol names in simple_ring_buffer undef check
      tracing: Fix simple_ring_buffer undef check on parisc
      tracing: Fix simple_ring_buffer undef check on sparc64
      ring-buffer: Skip si_mem_available() for persistent and remote buffers
      ring-buffer: Use subbuf_order in available memory estimation

----
 fs/tracefs/event_inode.c         | 10 ++++++-
 kernel/trace/Makefile            |  5 ++--
 kernel/trace/ring_buffer.c       | 60 +++++++++++++++++++---------------------
 kernel/trace/trace.c             |  8 +++++-
 kernel/trace/trace_events_hist.c | 21 +++++++++-----
 kernel/trace/trace_snapshot.c    |  5 +++-
 kernel/trace/undefsyms_base.c    |  5 +++-
 7 files changed, 70 insertions(+), 44 deletions(-)
