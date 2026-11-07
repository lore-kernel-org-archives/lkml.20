Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030722;
	b=FhBlK86Y6vnp89l1yMkMkmict1klek0hvvDc8PeVjBrGTWhbJin8PaVbYJimTYC5gA6P
	 VSWTABvrJUxoBt4ztLa3UpYoNpio/6pm2feByZyowsWqDYAxs5vEwyZE8atwHpQbRKgZP
	 GJRLHZifrjVfIo+yJRPBzanY1HRfSUMGOodpJKS1kaBnNGaLa+tZKK9x2rttwUzVlqHQW
	 GTyivmvnVAnwYcIQdQz7Knm9SZr1W1JhZm3S4ajI+PLuOAujHFbtYuY5tMYCtzwIM+L8y
	 yJHOR+h53Lu3+DiyYyPelgKdIQ5PqAfb2UKfhKACDFfwNvuIQPYUE7+U5qlaQ7baEkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f1q8yO+8GMVmTzC1heTr/Eo/Q8ClMZxyxUFejV2vlPw=;
	b=RFe1zj4fiecezGJ2CpJtosm8bpXmV/Kq6JR11H20Ph5+0OBcUZY60XP+7OuZP+51hpAk
	 aUjScPq0vKoBwHjRHX1zC7UELexVeOznv9aAz2W8lronkUWz+XzAywuuS/HcNn48tax55
	 0nWYg+7mWtU+cN95vZE70aihNZ2Jn3G5pOERKqPb9eP8kTszwsePJCDjQZSBO6cteldRs
	 cctXMTk615tmBeydsY9PYO/7en1S04fwHAph2/dt2bFCXRoUqEowmsjWfqbTGDB5cRtRB
	 GYxzp84kJ1J6hRwrRW4dkJDVE4v3rlolfQ3e0LNH5J65PY6Qn8N4Z1dJI7iNH2m+uEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s5hYsOQh;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39D606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA39D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s5hYsOQh
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed11653a91so5878175ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030721; x=1794635521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1q8yO+8GMVmTzC1heTr/Eo/Q8ClMZxyxUFejV2vlPw=;
        b=s5hYsOQhxHaMhTNkwjfVRY07OmKyRz62JjlE7IO7uwtC02LOsxa9rTqL53QbhREszz
         qfKObgWZ/gF6NKnof2kqye1ggNhqqOP0pd/dh8Ulb35za2OnRR9V+rI0JhfoioOcaSXj
         kC9sarVzL4Vd5hzILBfFnBS5/zFEoLCXo9mSFErGZdvvsv+/MoR2ZBFwx88mj6fv/ix3
         2ZvPphSQ8SzSGJM9cXL2DhAYxqk5mV5MASX9aKzi8MuopwXa0FpZD7AXhGazo24EP87s
         w6Y7QVaRVQM53A087ZSPSOqOePbkVXhNcSsb9Cy8lUgua2lQ/bkL1PFfRRcb72Pc6282
         +FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030721; x=1794635521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1q8yO+8GMVmTzC1heTr/Eo/Q8ClMZxyxUFejV2vlPw=;
        b=xs6D7orAzf9unXCiKvQfpFVz4MmFFYh5K5AKPHN1FdH4Jw5WPAX34OLWUizbK7sjZI
         0Gcs+I5Jgcbk8/t86GMhRgYxQtOoIj+ANb92IWLl9uZrW0PdEw9xED1MocJY4h7fxkSr
         85ugqKVX8XB9afgGZA5jyFqZ4adV7XvprP58JEbxaSX+dh2LzTQv80Fa4+nLmhHhz+rR
         Z03ACnZZw2/KvJy0cbeTASYN35edaceiKdeFKAaPXNSHsa5+FNCNrN0JvuEr98HMMzPO
         HuI+1bo+zR9+7JXjl6Gej+ijgGgfFaRrMiJH9eKchepbHB08PRQ94zQxAfVfrBKUhfdY
         reEQ==
X-Forwarded-Encrypted: i=1; AL+hErGjWlJldkX4zS4XgI5q4NH+lzzzuZhmGfHxDJsfbn7vaGYvq1RvadB1Ylv2KreBE+7LB9bBYOEwcROlJ+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HU3atUxwJybXTpMjhUMIOGxHQsb5HglIFV69BVWxqfh9k+kv8
	QXWR8z8bowmBY6Wf2W3eu33R+1L/x9TYtdUTsF9i4cMg+dMjrUulkoy6
X-Gm-Gg: AYBFou360yH6UF41HgLp0UFX9QR4fVTHKiM6rCKXz9r8XOvQXQOfZzgK2gdb6PaINhg
	nELX1em37BOpbmVd3b6z2XG1DeFXVEsKwG7I7Yq0xI2i/Zvh903zVTZ4bGf/WQ1csYhJ54DniD5
	qizoUqOczLThW3cBMN4k+E15uxe0CEFQ71DupG8K9WLxqGZEFihxqSZWWQU8bFi0BRBbc2NiYuS
	S2bn9Pf3wB9BuPcwpPRy8CmqV2XJN9sfd4/l7xAwENL3v0FyU4dqDAuSCekmwTGhvdlJ+w6ZG6a
	CYRfQAk30NF3lM1Gp5/QQI8Va0F65Ri2X8cPi7igQpGeB1E5IZMior2LlJMHyX/Zc9Vr+zXh14b
	WbqgqCGAWVucW7kmrl2y5bK1ftAlyIvIFjY1/lHIZAA0hGWh/ETD7yucQgTpwlhV/TQO96y8sbW
	qOXRcAh5IgejZvGv8hz6gUO/p2/l63XTiWG9vUL/w8ycPEADb6cQmk+7B3WwGaFa/yxljMKYGPJ
	nmKPFIHbkdKzZzbMtgsuDJExYSud7QRAbnLlJDnQcpzy5gh0mUSw0rsPQ2sGb3lW/uSCQlzI/Jg
	nJ0iuehTqSV+bFmz/LrvJ0JF8UOIQ2iAWwS6z/k67h04ucfhEFOvfPk3k9iDPX+k/FEiqQ==
X-Received: by 2002:a17:902:cf03:b0:2e9:60fb:5e2b with SMTP id d9443c01a7336-2ed41c32d29mr55451325ad.44.1794030721054;
        Fri, 06 Nov 2026 21:52:01 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm11189465ad.62.2026.11.06.21.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:51:59 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com,
	lkp@intel.com
Subject: [PATCH v8 0/5] tracing: Add stack trace deduplication for the ring buffer
Date: Sat,  7 Nov 2026 13:51:34 +0800
Message-Id: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
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

From: Pengfei Li <lipengfei28@xiaomi.com>

Hi Steven, Masami,

With options/stackmap set, ftrace records a 64-bit cookie (map
generation << 32 | slot) instead of a full stack. A stack stored in the
map is kept once per generation and exported as text in stack_map, with
counters in stack_map_stat. A stack the map cannot store is recorded in
full as before; a stack recorded while RCU is not watching is discarded.
A cookie only resolves against stack_map records of the same generation.

Use case: long tracing on phones, e.g. slab allocations with stacks from
early boot on, where the ring buffer and the storage are small and the
buffer fills with the same stacks over and over. With
trace_options=stackmap, stacks are deduplicated from tracefs
initialization on.

Measured on QEMU arm64 (4 CPUs, buffer_size_kb=512 per CPU),
kmem_cache_alloc with options/stacktrace, the same fixed workload in
both runs (100 rounds of 500 open()/close() of /proc/self/stat):

                  events retained   retained bytes/event
  stackmap off           4,867             107.4
  stackmap on           10,552              49.8

Bytes/event is the ring buffer data kept divided by the events kept, not
the size of one event. The gain depends on how often stacks repeat. This
measures retention only, not the CPU cost of the hash lookup; I only have
QEMU here, where timing numbers would not mean much.

This series is the core, the recording path, the statistics, the
documentation and a selftest. The binary export from v7 will carry the
generation in its header, so I would like the core and the cookie format
to settle first; the binary export, its parser and the capacity boot
parameter will follow as a separate series.

I used an LLM for a lot of this, the code and tests as well as the
comments and changelogs. The design is mine, and I went over every
change and the test results myself. After your v7 review I went through
the comments and changelogs again and cut most of them.

Design notes
============

- The hash table is modeled on tracing_map, the map behind hist
  triggers. The documentation lists where it differs: the slot index is
  the cookie, an insert that meets an unpublished element records the
  stack in full instead of spinning, and the map can be reset while
  tracing runs.
- Only the top level trace array is supported. A map per instance would
  multiply the memory, and boot-mapped instances could not resolve
  cookies against the running kernel's map.
- The capacity is fixed at 16384 stacks; stack_map_stat shows when that
  is too small. A boot parameter for the size comes with the follow-up.
- Turning the option off keeps the map, so the trace already in the
  buffer can still be resolved; writing "free" releases it. free waits
  until the stack_map files opened on the old map are closed, so a reader
  that started before it reads a complete map.
- The trace output prints the cookie, not the stack, including in
  ftrace_dump_on_oops. Printing the stack from the map when the trace is
  read could be added later, since the map is kept after the option is
  turned off.
- Elements have a fixed size, so an insert only takes one atomic index
  increment; a variable-size pool would need an allocator usable from
  NMI.

Changes since v7
================

- Record a u64 cookie (generation, slot); the trace prints
  "<stack_id N gen G>" and stack_map records print the generation.
- Drop rcu_tasks_rude: a stack recorded while RCU is not watching is
  discarded, and reset and free only use synchronize_rcu() (Steven).
- Use a mutex instead of an rwsem for the readers (Steven).
- Move the hot path into record_stackmap() and the tracefs setup into a
  helper, with stubs instead of #ifdefs; name the init state enum (Steven).
- Trim the comments and changelogs (Steven).
- Capitalize the subjects (Steven), and use the "tracing:" prefix.
- Reset is "echo 0 > stack_map" only, and stack_map uses the " => "
  frame format of <stack trace>.
- stack_map_stat has one field per line, adds generation and capacity,
  drops table_size and success_rate, and renames drops to fallbacks,
  since those stacks are recorded in full, not lost.
- The map is allocated when the option is enabled at runtime; with
  trace_options=stackmap it is allocated during tracefs initialization.
  It stays allocated when the option is disabled, until "free" is written
  to stack_map.
- The map holds at most one copy of a stack per generation. If another
  context is inserting the same stack, that stack is recorded in full
  instead of waiting.
- Binary export, parser and capacity boot parameter split out, see above.
- RFC dropped.

v7: https://lore.kernel.org/linux-trace-kernel/20260912083753.3426176-1-lipengfei28@xiaomi.com/

Known limitations
=================

- Top level trace array only.
- Fixed capacity of 16384 stacks, about 8.6 MiB on 64-bit while allocated.
- Kernel stacks only.

Testing
=======

- Each patch builds on x86_64, and on arm32 with and without
  CONFIG_FTRACE_STACKMAP.
- QEMU arm64, with and without KASAN and lockdep: the selftest in patch
  5, boot with trace_options=stackmap,stacktrace, and a 60 s stress run
  of tracing with resets, stack_map and stack_map_stat readers, and free
  with and without an open reader. No warnings.
- Function tracer with func_stack_trace: every cookie in the trace
  resolves against stack_map. Filling all 16384 elements: fallbacks
  grow, the remaining stacks are recorded in full, every cookie still
  resolves, and a reset empties the map.

Based on 4539944e5151 ("Merge tag 'liveupdate-fixes-2026-07-22' ...").

Pengfei Li (5):
  tracing: Add lock-free stackmap for stack trace deduplication
  tracing: Use the stackmap from the ftrace stack recording path
  tracing: Add stackmap statistics interface
  Documentation: tracing: Document the ftrace stackmap
  selftests/ftrace: Add a stackmap basic functionality test

 Documentation/trace/ftrace-stackmap.rst       | 192 +++++++
 Documentation/trace/ftrace.rst                |   6 +
 Documentation/trace/index.rst                 |   1 +
 kernel/trace/Kconfig                          |  13 +
 kernel/trace/Makefile                         |   1 +
 kernel/trace/trace.c                          | 132 ++++-
 kernel/trace/trace.h                          |  15 +
 kernel/trace/trace_entries.h                  |  16 +
 kernel/trace/trace_functions_graph.c          |   1 +
 kernel/trace/trace_output.c                   |  24 +
 kernel/trace/trace_selftest.c                 |   1 +
 kernel/trace/trace_stackmap.c                 | 495 ++++++++++++++++++
 kernel/trace/trace_stackmap.h                 |  23 +
 .../ftrace/test.d/ftrace/stackmap-basic.tc    | 222 ++++++++
 14 files changed, 1139 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/trace/ftrace-stackmap.rst
 create mode 100644 kernel/trace/trace_stackmap.c
 create mode 100644 kernel/trace/trace_stackmap.h
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/stackmap-basic.tc


base-commit: 4539944e515183668109bdf4d0c3d7d228383d88
-- 
2.34.1

