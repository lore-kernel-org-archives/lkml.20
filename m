Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C7F50AC13
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540368; cv=none; b=AFRu9Ywo0TDujgooVbOSso1lFWJrC0vs6ngntCOETFzH4VKRG74Mh+F2KRHxoTRWEJBR1QmlRjEsinkreBTXNT6UJ7QLY6ngd34JneJZq2KjJj1LB+bb77VFp4WZ6NjMGkX7f+/ugMTgB5AOFPHhphNnUL4wvv5MmDYZR+6x8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540368; c=relaxed/simple;
	bh=VRBd8/5u6qam2J74W/52l/OrMYxeWttc1j+DyloMVFw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=P3LUfhCsYYuTZ6oufPQv92LTYKp2k+wYb6wmNpsn/oRrHp+yposwKdgkgdioPA4sXYSOoDTeMsiQER4FjPeW+WCbRwWfukvUCsmuxXbbaaHwnFa20bcfmb4RSoUtShg2LYXx0KVdV4Ksb8PI9GZr6c8w801O2bxIFJBXxXykdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o/ePvIwq; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o/ePvIwq"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49b7c1dcc82so7777885e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788540359; x=1789145159; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1XnB44YT/A94BnJMf7d18OALktL/nCWlm8hGcVlsjM=;
        b=o/ePvIwqfaoej3zHn7xwPFOsNkJuYwtvUkG1/GvUfDsa3nj0J76/TpbVDtQeKcDRkM
         lzK77jeNYjIydirr00YwzVUq+MOz5reA9ZikEhuMp7nTvwXwKUzuNUBfpot2w2nauwRv
         WMnoNU0K91KaGuzuIkXxEL8/pE35O9V9QFZ/pBGWk7sD/RDAEsfvsCsRiMNbQpBxXxSR
         5A3mHfn/i7HnEqI1+OoqskE7vLG4G+o9A+vy9uW/isErPPVa1AzL1fk70DXeefbpiOM0
         iDxJGHkQ0UoXZ6ELCfD3XpQCt2tGR0dIIqEDpBp0RW5KcIR/J3I9q5/6r7kAyppVHd1I
         q9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540359; x=1789145159;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1XnB44YT/A94BnJMf7d18OALktL/nCWlm8hGcVlsjM=;
        b=gKW/CttvqOtZ/wK4sq6EEH7UX4IxZPkTORb892oEc5n3P0L+3Lf5jU7Am87qEqkVxb
         7WgnvM4cJP53Lo2+pzecIxy8mJyWVH6fPs8TZLxPtTvuP7VXD9eOcRlTPtsuOWzgNpe6
         KcWwpKgVZCwEyBogX+1/qmyK96YKgOdA0jjYbgwgcxMlgOeyU4fUsytxVJMGJXf3EAhR
         1fuQ38pY/RpRQXq8iFErc5fkOcT+Ju/8wrloNLECzubepgFqs+JglE4BfRKvgIoTP3Ee
         96Z+4HsdNXn/ArgXDHuQha/IWsHJ9451nHHVAnSHa9cXVJTM6IIOZyA0sfz4Sx+cLy8w
         Uc7w==
X-Forwarded-Encrypted: i=1; AKwUvBxfyj6+zEr5+X4zeYdNCn8loY4v+7uRc+0Ezcg6FIGwPdIRpSts/sZ2oq7iwfbK2mMMFaI+frpg5DKh8do=@vger.kernel.org
X-Gm-Message-State: AFuF++ksHCgnEPezAM4rQC+DxMh7QKdUaEfU778y2SsPcYx7JIjshipQ
	NdzOMfgJHxgyTTTB27s0zNk+cGWzDD3c59gIm1jG9qOChg9DzHO6WrtVkui9zX0qia6DbRKOOZi
	5fAqRIh+740ocY8+flYd68w==
X-Received: from wmdd20.prod.google.com ([2002:a05:600c:a214:b0:492:1eeb:6111])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49cfc6ea77dmr39813465e9.32.1788540359218;
 Fri, 04 Sep 2026 09:45:59 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:44:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904164450.1345852-1-vdonnefort@google.com>
Subject: [PATCH v10 0/4] ring-buffer: Fixes for subbuf resizing and persistent buffers
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

This series addresses multiple issues discovered with the dynamic ring
buffer resizing.

I have managed to reproduce a ring_buffer_read_page() race with

 $ trace-cmd record -e sched &
 $ while true; do for i in 8 16 32; do echo $i > /sys/kernel/tracing/buffer_subbuf_size_kb; sleep 0.1; done; done

Changelog:

v10:

  - Add READ_ONCE()/WRITE_ONCE() for buffer->subbuf_order (Steven)
  - Rework tracing_buffers_read() loop logic and handle NULL in ring_buffer_free_read_page() (Steven)
  - Drop the 31-bit ID limit bump for static buffers (Steven)
  - Prevent size underflow when allocating a persistent buffer (Sashiko)
  - unsigned long for idx in rb_range_buffer() and simplify subbuf_size casts (Steven)

v9 (https://lore.kernel.org/all/20260901155445.1475405-1-vdonnefort@google.com/):

  - Fix splice read loop when buffer size changes at the same time (Steven)
  - Allow splice for all static buffers (via memcpy)
  - Rebase on 7.3-rc1

v8 (https://lore.kernel.org/all/20260826094528.3738023-1-vdonnefort@google.com/):

  - ring_buffer_read_page() handles gracefully read_page/reader_page
    order mismatch (Steven)

v7 (https://lore.kernel.org/linux-trace-kernel/20260817101533.1558223-1-vdonnefort@google.com/):

  - Match the "static" rb limit with bpage::id bitwidth
  - Cover another 32-bit truncation in rb_range_buffer (Sashiko)
  - Fix uninitialized spare_size (Sashiko)

v6 (https://lore.kernel.org/all/20260814154823.755406-1-vdonnefort@google.com/):

  - New prototype for ring_buffer_alloc_read_page() (Steven)
  - ring_buffer_read_page() to return -EAGAIN (Steven)
  - Keep nr_pages "unsigned long" (Steven)
  - Repase on ring-buffer/next (Drop most of the patches)

v5 (https://lore.kernel.org/all/20260813131152.3589632-1-vdonnefort@google.com/):

  - Reset info->spare_read only when data is in the ring-buffer (Sashiko)
  - Use `unsigned long` for subbuf_size declaration to avoid 32-bit
    truncation. (Sashiko)
  - Make cpu_buffer::free_page a buffer_read_data_page
  - Update kerneldoc for ring_buffer_alloc_read_page()

v4 (https://lore.kernel.org/all/20260812153311.2328812-1-vdonnefort@google.com/):

  - Add rb_subbuf_start() helper (Steven)
  - kerneldoc additions
  - Fix races in trace_pipe_raw readers
  - Use rb_subbuf_capacity() in ring_buffer_subbuf_order_set()
  - use rb_page_capacity() in ring_buffer_map_get_reader (Sashiko)
  - Fix 32-bit overflow in ring_buffer_subbuf_order_set() (Sashiko)
  - Hold cpu_buffer::lock when modifying cpu_buffer->free_page in
    ring_buffer_subbuf_order_set (Sashiko)

v3 (https://lore.kernel.org/all/20260810125633.3344684-1-vdonnefort@google.com/):

  - Drop first 3 patches (Rebased on 7.2-rc7)
  - Add a patch to align "nr_pages" to unsigned int
  - Add a patch to remove useless trace_buffer::cpus
  - Add unsigned long cast for rb_subbuf_size()
  - subbuf_order fix for rb_free_cpu_buffer() (Sashiko)
  - Use __always_inline just like the other accessors for the hot-path.

v2 (https://lore.kernel.org/all/20260806211306.3704194-1-vdonnefort@google.com/):

  - Prevent resizing of the persistent ring buffer
  - Add missing bpage::order init
  - Rework subbuf_size/subbuf_order (Sashiko)
  - Remove ring_buffer_per_cpu::mapped
  - Dynamically calculate trace_buffer::max_data_size

v1 (https://lore.kernel.org/all/20260805153225.2096152-1-vdonnefort@google.com/)

Vincent Donnefort (4):
  ring-buffer: Allow splice reads on static buffers
  tracing: Fix subbuf resize races with trace_pipe_raw readers
  ring-buffer: Cap static ring buffer nr_pages
  ring-buffer: Prevent truncation of nr_pages / nr_subbufs

 include/linux/ring_buffer.h          |   5 +-
 kernel/trace/ring_buffer.c           | 229 +++++++++++++++++----------
 kernel/trace/ring_buffer_benchmark.c |   6 +-
 kernel/trace/trace.c                 |  99 +++++-------
 kernel/trace/trace.h                 |   9 +-
 5 files changed, 199 insertions(+), 149 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.979.g7e5102b832-goog

