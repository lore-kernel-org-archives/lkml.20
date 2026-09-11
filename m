Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C716B3749FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141319; cv=none; b=AFZGlzB2aM+m/qOG062fziSO3l2DLWWP72/aYLG1YqnaH152YjXoIBU8/2bAwA+mnttwNikFt2FjWqnRWq/UPR0Lfg4nr0+TKj7JghC3CaAcNqSeQnpNy1gO82s4KwWpWa+E/Cs35mDeU3WjuOEQ0USQL7U31SMqiqx39Y8I6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141319; c=relaxed/simple;
	bh=uaVH8WHf6pGI4EW7/EP7kFEYeCKlPTMWnIYbtCvgrIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTepU76Bywe3GCPW6PE12MDu5+ENUeOd8dK5tXP4s2K9xf+4rfn1HKTozH+AO/cID/dJS9EYvTJaPivXoC+KwdHsHxNOEs8Pse4ugGce6SH9vuNYfe3MFid/ke1KbgNnUcnyHXZznAx4GbYGKB4DdBjyN/Fhz7wgA88GVRv8aEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Fd2nripH; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Fd2nripH"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f4e729368fso1190383a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141315; x=1789746115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrJjCdIc8RoNMEPBe6DHEkTVlEk5SUMXdKcZmlJO1zk=;
        b=Fd2nripHeN9LttLoa5kesvb3JCxC3QYmzHLRZJditvgf15K9zEoFSCmiFTs88q2ihd
         B740179t4XXO1GFrxz7YhQSYjNQcOrN14lO9E3IELrszNB/e4GlpXlqfNv1n0LZ6GzKC
         KhZlDJQrdbj6uWkw4mrpqfOWhFimgilVMs05fwijAGZGhBe4u1uklZ0Cfj6epAmZe/6e
         tuEMhrI0KrTXK4Td9MixdHEkswL98daBfqSV23SRnD0HtsaLGdSpdImRS1QGNE87sAHg
         cnZeRNBpMZUoJwF8jLL4NGMdw3oZ2oMvOE7Ii5w4lVGG/f+71tiz7jRmEZRRmjJw08t2
         80Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141315; x=1789746115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrJjCdIc8RoNMEPBe6DHEkTVlEk5SUMXdKcZmlJO1zk=;
        b=b8KqvFmhgEQhuqFYrA17CTDazETVjzR2M24+ryDLYZK2uwIDzj95j1PpgRV5Q3YVmo
         QAhIYrdSyhmyBd1cJWIvKUxVcp6N7ekzI6Y0uF5x0zo5UO8sXgxA2eJQoULnGPVtw7YA
         ha7+q31+GqGF96Qi/N/C4XyOjQ7DWDyoSMzFJ1wMBcHm5aLyABr57EQvpHBXy1K3FpgZ
         ZesnY1g+kAsNrZkOAxc49XdmHreu7aEES76QEKYBGi+UzcRM+i8mdVKpCv0X/u4EJMW1
         Bt/g88NG2XTOCMhU91QmwNhQjciOASTlCWZ20ajnV55s2HHWYHpGR77b+rFi8fNLcWcU
         m3hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC6OxHPmksPdRucG34Jpkiauubpa0fshqrHkklfm+wo+wjKZLFi/eu3qxVe8nxsY6ot2Y5HyaxxLo1U0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kE7BeOwmtCKRSnNviBrMOkWRq60lUtntqFYnEZGgkf/gF+6UrL
	2FqCXNek/Xd8nzVGiUHuJNefckj61GpG7lMBzVCqn0gRj9ffOt0HlMyeI94+YxU3imU=
X-Gm-Gg: AYBFou2EilfSQERd4JHZ6I+xIUE6ZSbXWpvzvWP+VmSqzKZ2S0iKm7uPschSiJH4J/K
	+aNEIoj2Ccis0C+i5awj2OmeU7+mIu0eq8JByufsohYI25GE3KNNU/D8cZfCJemDkllFlvLTQdw
	vG5+eqFs0v8rfqQTanDXtc0DgCJPo2+2LbhlDm0WbqAJ0zBJhRamiIS6ehsOZJWmm2nbzSzS9KF
	L+QhUqoZKuBSwkfwtZaAEvqPUB3UIz5qvf4UBawpGYSX2xEr//ArZoLG/qXqq60RG5/NaGXRyjs
	TpH/90CjdOr3dC+ebY3prgy+hOe/X+XX814y+ZPb3iv92PqZ8r02AOFNlCAAqVg/my7/+cbzXnC
	124RcbzMDAOyk1snlYpYQencCUOmeDDL9C10FHJllZyV/Hk3+qqjk31wXihaO3v+rkBsKX7ixQM
	0pkMWpwmIU5sPPfbqG5Aq2x0Y5GmOIe9RFHYZU6h46fmyLhjonGTQ++eg1QhMq7YddxwD9VDQcM
	6bpU6gJ8zn9LrN6E9sOscrDG7uTTOaEPXuvrjAcXWQ=
X-Received: by 2002:a05:6820:5709:10b0:6b1:bdd9:453 with SMTP id 006d021491bc7-6c0b9958c88mr2386446eaf.12.1789141315549;
        Fri, 11 Sep 2026 08:41:55 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:54 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org
Subject: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking inline issue
Date: Fri, 11 Sep 2026 09:40:50 -0600
Message-ID: <20260911154148.644489-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

io_uring issues requests inline with IO_URING_F_NONBLOCK and punts to
io-wq when that isn't possible. For a range of opcodes it isn't possible
at all, as there's no nonblocking path in the kernel for them: fsync,
statx, openat, the *at family, xattr, fadvise, splice, etc. Those are
punted unconditionally, and the punt costs a thread wakeup, a context
switch and a task_work completion round trip per request. io_uring HAS
to be cautious to prevent accidental blocking in the kernel, even if the
operations predominantly never block. Sad story. Examples of that are
things like an fdatasync that doesn't block, statx that hits dcache,
openat for O_TMPFILE, etc. All of those would've completed inline just
fine, but io_uring just cannot rely on that.

This series issues those requests inline in blocking mode instead, and
only pays for the offload if the request actually blocks. But by the
time it blocks, the submitter is deep in the kernel with the request on
its stack, so the work can't be moved to another thread. What we can
move is the identity. If the submitting task blocks, an idle io-wq
worker takes over its user visible identity (tid, signal state,
credentials, scheduling attributes, cgroup, user register state),
finishes the io_uring_enter() call and returns to userspace as the
submitter. The original task finishes the request as an
io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
the same tid came back from the syscall, it's just on a different
task_struct. Folks that have been around a while may remember earlier
attempts at this about 20 years ago.

We catch the blocking through a scheduler hook. A task in a blocking
inline issue carries PF_IO_HANDOFF, and sched_submit_work() calls into
io_uring for it, next to the existing io-wq and workqueue hooks. This is
where the identity is handed off, with the uring_lock still held by the
blocking task and released for the promoted worker on its behalf.

Structure of the series:

  1     kernel: the thread identity handoff itself, in
        kernel/thread_handoff.c. Independent of io_uring.
  2     sched: the PF_IO_HANDOFF hook.
  3-4   arm64 and x86 support. The arch hooks sync live register state
        before the source blocks and load it on the destination.
  5-9   io_uring prep: helper cleanups, a tctx node list, tracking of
        uring_lock sections in the issue path so the hook knows when
        the lock may be dropped, splitting io_uring_enter() so it can
        be resumed by another task, and keeping the block plug on the
        submitter's stack.
  10    io-wq: claiming an idle worker for a handoff, and keeping a
        couple of idle spares around as targets.
  11-12 io_uring: the handoff itself, and deferring the identity
        migration to the end of the submission so a batch of blocking
        SQEs costs one migration rather than one per SQE.
  13    io_uring: issue blockable requests inline in blocking mode.
        This is where behavior changes.
  14    tracepoints.
  15    treat IOSQE_ASYNC the same way. Separate as it's a userspace
        visible policy change, and I'm not sure yet it should be done.

Some things are refused for handoff up front: traced tasks, per-task
perf contexts, PI futexes, audit contexts, armed per-thread CPU timers,
core scheduling cookies, vfork parents. Per-thread accounting moves with
the handoff, so the counters userspace sees for a tid stay monotonic.
Known gaps are LSM state kept in the task rather than the cred, and
PR_SET_IO_FLUSHER. Neither moves, and not moving them can only ever
restrict.

Reads and writes on files with FMODE_NOWAIT are excluded.
They have a working nonblocking path and poll retry, and a handoff per
op would be worse than that. The handoff covers requests that previously
would always have been handed to io-wq upfront. uring_cmd is excluded
too, as drivers like ublk bind state to the submitting task.

Some test results:

Measured in a virtme-ng guest, 8 vcpu, non-debug x86 config, same
kernel with a sysctl toggle for turning the feature on and off. CPU
is the usage of the whole process including io-wq workers, as a
percentage of one CPU. Mean of two runs.

                                          ops/s    cpu
 =====================================================
 fsync, tmpfs, qd 1
   baseline                               28.2k    96%
   handoff                                 221k   100%
   change                                 +681%    +5%
 fsync, tmpfs, qd 8
   baseline                                195k   141%
   handoff                                 526k   100%
   change                                 +170%   -29%
 fsync, tmpfs, qd 32
   baseline                                357k   219%
   handoff                                 611k   100%
   change                                  +71%   -54%

 fsync, ext4 (flushes, always blocks), qd 1
   baseline                                9.6k    66%
   handoff                                 7.1k    91%
   change                                  -26%   +37%
 fsync, ext4 (flushes, always blocks), qd 8
   baseline                               29.8k   212%
   handoff                                14.7k   146%
   change                                  -51%   -31%
 fsync, ext4 (flushes, always blocks), qd 32
   baseline                               42.2k   270%
   handoff                                14.6k   144%
   change                                  -65%   -47%

 statx, ext4, qd 1
   baseline                               23.6k    96%
   handoff                                 121k   100%
   change                                 +414%    +5%
 statx, ext4, qd 8
   baseline                                129k   234%
   handoff                                 179k   100%
   change                                  +38%   -57%
 statx, ext4, qd 32
   baseline                                197k   276%
   handoff                                 140k   100%
   change                                  -29%   -64%

 statx, tmpfs, qd 1
   baseline                               24.4k    96%
   handoff                                 117k   100%
   change                                 +378%    +4%
 statx, tmpfs, qd 8
   baseline                                131k   232%
   handoff                                 180k   100%
   change                                  +37%   -57%
 statx, tmpfs, qd 32
   baseline                                219k   295%
   handoff                                 190k   100%
   change                                  -13%   -66%

 fadvise DONTNEED, ext4, qd 1
   baseline                               26.1k    95%
   handoff                                 150k   100%
   change                                 +478%    +5%
 fadvise DONTNEED, ext4, qd 8
   baseline                                127k   170%
   handoff                                 252k   100%
   change                                  +99%   -41%
 fadvise DONTNEED, ext4, qd 32
   baseline                                270k   234%
   handoff                                 273k   100%
   change                                   +1%   -57%

 renameat, ext4, qd 1
   baseline                                7.4k    98%
   handoff                                13.4k   100%
   change                                  +81%    +2%
 renameat, ext4, qd 8
   baseline                               12.0k   544%
   handoff                                14.6k   100%
   change                                  +21%   -82%
 renameat, ext4, qd 32
   baseline                               11.2k   500%
   handoff                                14.3k   100%
   change                                  +28%   -80%

 renameat, tmpfs, qd 1
   baseline                               15.0k    97%
   handoff                                48.5k    99%
   change                                 +223%    +2%
 renameat, tmpfs, qd 8
   baseline                               65.6k   514%
   handoff                                55.4k    98%
   change                                  -15%   -81%
 renameat, tmpfs, qd 32
   baseline                               39.4k   462%
   handoff                                38.9k    98%
   change                                   -1%   -79%

 openat O_TMPFILE, ext4, qd 1
   baseline                                6.3k   100%
   handoff                                11.3k   100%
   change                                  +81%    +1%
 openat O_TMPFILE, ext4, qd 8
   baseline                               23.0k   258%
   handoff                                12.9k    99%
   change                                  -44%   -62%
 openat O_TMPFILE, ext4, qd 32
   baseline                               26.2k   248%
   handoff                                13.4k    99%
   change                                  -49%   -60%

 openat O_TMPFILE, tmpfs, qd 1
   baseline                               13.4k    95%
   handoff                                43.0k    98%
   change                                 +222%    +3%
 openat O_TMPFILE, tmpfs, qd 8
   baseline                               57.8k   220%
   handoff                                51.7k    96%
   change                                  -11%   -56%
 openat O_TMPFILE, tmpfs, qd 32
   baseline                               69.3k   218%
   handoff                                56.8k    96%
   change                                  -18%   -56%

 splice to pipe, ext4, qd 1
   baseline                               19.4k    96%
   handoff                                21.1k    98%
   change                                   +8%    +2%
 splice to pipe, ext4, qd 8
   baseline                               48.2k   176%
   handoff                                48.4k   176%
   change                                   +0%    +0%
 splice to pipe, ext4, qd 32
   baseline                               53.3k   188%
   handoff                                48.1k   182%
   change                                  -10%    -3%

As you can tell, normal QD=1 type issues see big wins. Conversely, for
higher queue depth, there are losses. The losses are generally from one
of two reasons:

1) The syscall part is fairly expensive, and previously we farmed all of
this work across a bunch of io-wq workers, and the parallelization
there helps performance. For QD=1 that obviously isn't the case. The
more expensive the lower level kernel parts are, the lower the QD
required to see a perf loss. openat is the obvious worse case for this.

2) The syscall part ALWAYS blocks. For this case, io-wq is going to be
quicker, just punt the opcode upfront. fsync on ext4, as shown in the table
above, is indeed that case. Each of those block.

I've got some ideas for how to mitigate the losses for higher queue
depths, but a) I didn't think they were THAT interesting for an RFC, as
low QD is generally what people do with these kinds of ops, and b) the
main concept behind this handoff is really the interesting part right
now.

Passes the full liburing test suite, on both x86-64 and arm64. Other
archs don't support this yet.

This is obviously an RFC, in terms of what I'd love people to take a
closer look at:

- The scheduler hook and the identity move itself, kernel/thread_handoff.c.
  Is the set of refused states complete enough, and is moving
  thread group leadership this way (the leader must stay first on
  ->thread_head, like de_thread() keeps it) acceptable / kosher.
- The x86 and arm64 register state handling. x86 refuses AMX users,
  and arm64 refuses SME.
- Whether anyone relies on a task's user identity staying on one
  task_struct in ways not covered above in the series.

Patches are against 7.3-rc2. Also available at:

  git://git.kernel.dk/linux.git io_uring-thread-handoff.3

 arch/Kconfig                    |   7 +
 arch/arm64/Kconfig              |   1 +
 arch/arm64/kernel/process.c     | 109 +++++++
 arch/x86/Kconfig                |   1 +
 arch/x86/kernel/process.c       |  10 +-
 arch/x86/kernel/process_64.c    | 139 +++++++++
 include/linux/io_uring.h        |   9 +
 include/linux/io_uring_types.h  |  48 +++-
 include/linux/sched.h           |   2 +-
 include/linux/thread_handoff.h  |  76 +++++
 include/trace/events/io_uring.h | 114 ++++++++
 init/Kconfig                    |  11 +
 io_uring/Makefile               |   1 +
 io_uring/handoff.c              | 395 +++++++++++++++++++++++++
 io_uring/handoff.h              | 103 +++++++
 io_uring/io-wq.c                | 270 +++++++++++++++++-
 io_uring/io-wq.h                |  15 +
 io_uring/io_uring.c             | 310 ++++++++++++++------
 io_uring/io_uring.h             |  46 ++-
 io_uring/kbuf.c                 |   5 +-
 io_uring/msg_ring.c             |   2 +-
 io_uring/opdef.c                |  29 ++
 io_uring/opdef.h                |   2 +
 io_uring/rw.c                   |   2 +-
 io_uring/splice.c               |   6 +
 io_uring/tctx.c                 |  16 +-
 io_uring/tctx.h                 |   2 +
 io_uring/tw.c                   |  14 +-
 io_uring/uring_cmd.c            |   5 +-
 kernel/Makefile                 |   1 +
 kernel/fork.c                   |   6 +-
 kernel/sched/core.c             |  36 +++
 kernel/thread_handoff.c         | 490 ++++++++++++++++++++++++++++++++
 33 files changed, 2167 insertions(+), 116 deletions(-)

-- 
Jens Axboe

