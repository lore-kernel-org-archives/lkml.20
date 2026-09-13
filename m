Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96823876A7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789319848; cv=none; b=KUYxu/Ap9LCgWLN4EtISagUpB0lQeBxdIZNPjUiPVJKPyLUR8eDdS0wanJ87ZGJor/qT5ulSQlgU8SyCDRBhnWHgri/WPEbhZZrzQ5zIyoLu7H4QyAreE/hD3Ol3LZRmHKM0kJi4dKKeyLck5E6kaVx1S6+ZgQE2vVHdQWF87lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789319848; c=relaxed/simple;
	bh=ofcVbNziQWryhWSo5Bf/eOboU2ohkmbfI5Z8Yr2rCXI=;
	h=Message-ID:Date:From:To:Cc:Subject; b=HPdOd1FU1A4yKfMDZ5rBNi7YopOwgX/WbYscACKBhsW3s+BLkiLAncyQbe/4JEgvZ5Fk56TDaBnk0Y51OmwEqP44RXUyfIHhWm/l60UqAykTdBL/90p6Hm08J2x/vgpPggcmJmQeh0Oil4cqeOsLYHKxmz58fgKvyJIOpSY92bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEyso7Hn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEyso7Hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CBA1F000FF;
	Sun, 13 Sep 2026 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789319843;
	bh=9d1ljaJIJMsTtWpbhkz8a1gea3J5JZi8zQua3ZvoRDg=;
	h=Date:From:To:Cc:Subject;
	b=AEyso7Hn2oEGQUXXTBdSRglAzvgZCZoLiiQ3PqqKxZEpZgAv4I03k4I2Y7iJUAfIX
	 EYSwA0mFns+kY5Hn9dldL3oJyRZzYzxEPDHyqZc48jTeG6Tsfco9BYDvEjBXTjNDKu
	 SZdGb+jh4cv0CmZU248uDCi09xh+D40CYUVECZhZ456gZ9Rdefc9Xr9EpggTruWr0f
	 ahbo159HkANVPInzf8eh50qJUVs4ZZJusSUWMqAONLg2ZIn2qGHhFT5JgSj9cN5VMH
	 rmU1Dw8ZBnpVxnLhM8CRl2lfPJV50LE82oktTSucEipfsNLu6GHSkHirP491AzWHBL
	 pWsuVRzWlN/Mw==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x5nqr-0000000AQYS-1k8R;
	Sun, 13 Sep 2026 13:18:49 -0400
Message-ID: <20260913171759.469375546@kernel.org>
User-Agent: quilt/0.69
Date: Sun, 13 Sep 2026 13:17:59 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>,
 David Carlier <devnexen@gmail.com>,
 Leon Hwang <leon.hwang@linux.dev>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 0/5] tracing: More fixes for v7.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing fixes for 7.3:

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


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: d860c67c051685abb0460b593b193f0f45f4fa92


Ali Ahmet Memiş (1):
      tracing: Don't dereference trace_event_file in deferred trigger free

David Carlier (1):
      ring-buffer: Check resize_disabled before publishing the new subbuf order

Leon Hwang (1):
      ftrace: Use rcu_assign_pointer() for tmp_ops filter hash

Vincent Donnefort (2):
      tracing/remotes: Account for ring buffer page header in size calculation
      tracing/remotes: Catch nr_page_va overflow in ring_buffer_desc sizing

----
 include/linux/ring_buffer.h         | 19 +++++++++++++++++--
 kernel/trace/ftrace.c               |  2 +-
 kernel/trace/ring_buffer.c          |  8 ++++++++
 kernel/trace/trace.h                |  1 +
 kernel/trace/trace_events_trigger.c |  4 +++-
 kernel/trace/trace_remote.c         |  6 +++++-
 6 files changed, 35 insertions(+), 5 deletions(-)
