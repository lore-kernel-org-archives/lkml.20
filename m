Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634236;
	b=skFSatmxxKic9d6oyktqjXTI7B+7EOZuPfQJagraYkd0aNEpRCcs1yojkBUw0L0ShbTa
	 ALZziDC6Wucy6gO5XE3uyCAfvudhJeJr5tq1PSMN310hVG13lamXQsUYEyCGeTkTHWJ4U
	 QoQUydZoDTryJR41XhHDOod8U7dLBPrrGkTfIVJPWsPza9dwh0AIBn5N/PJLSEGLX8z6i
	 l8hYIb1yvbb9hueQ76dLYyWJVG7R1qml56Ph4oOhZwv6Wbbb+Lp3gNMCy5jZb8fF5eTuj
	 3T2Afhuz2f5abRomfQ82/v9M8PPhTdC9yEvIWz4O+tr4Q8CDx+4QUfxXZUbilgXnAzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jDvqirGSK7roV0OwhESQvxR+V4XuKQKeS3pYEmaAuqs=;
	b=dsICKmZXdVw9kSrEqPCZ2DcwQXqIrOcRWTatDGwCGLQUzWyQkUFvnX8RqzX1/vY97NxE
	 orFCCii6CEhl+vDTE+Pgj5QMAlreQUsuwnHoiXBqgPCtZiPUlwbVmrIkB8eXmujSsPNam
	 1MMONHugG+UezR8UvJB+yhrIgINvPyYOfNdE1StWnd9Qs0SAfB3HrSm9dM5haJKuzrvLR
	 C0T6mm3ySVdB2nk0R/7kk/oWQ5zhLrL/ICZyl2R53mbHBFsicSH1ci3TgCW98ryCM2esW
	 5sFE4bhTl14ovEel3PQ9anp0RGpXm8XhV2mmd7WKzSH6Suu7RZURq40uUaaG4rZ9Vbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G+1LWwBp;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80FE606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G+1LWwBp
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06c60065fso871860b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634235; x=1793239035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDvqirGSK7roV0OwhESQvxR+V4XuKQKeS3pYEmaAuqs=;
        b=G+1LWwBpOgMOZ8HbZpfC7grGyIlYmSp+qoBv3SfE1ODmH3HHtPJL4bo6AgKogLa49b
         qW724hfjp5QlrGBmXDjLEVsFzhoOa3kpfvAhWfTc2BLc3l9apiERkdackT2/FBLPP7xc
         FITW0WpnqlsZbRjzjvyVjPJQqnSwiRkWfLqECt4QOwraGHDjXjnQwwcZ4bs1CNF8RdGo
         hFDRAznOHctS3esTtUtpsCsinXZ59akUq6QKrEBbUZ45W4hFXIn/0jGCyIwRQ6N9cIgo
         3a3tVL8IypEwcVjCkcaYPLg3NhJz7ayAbLhdeT6bJE+GCRAQCf9MmhqgLzm0hZbK4Y6s
         Qc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634235; x=1793239035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDvqirGSK7roV0OwhESQvxR+V4XuKQKeS3pYEmaAuqs=;
        b=VK7ObH1/bL42+27804DsMbCH8EKpQ4irm3K/qEw+j4EnTzVIjF8CJOLXq7+oi6pWlj
         FGbafg6c6eh9S/yIke/wLWj6u2rPT6rBKElz5o+dK/MWh9WcBPL3iZELWVlXJTjlDSqt
         U4ogR9hoC9m6D/xGzi7uaVUPB4GUKaeD9zIholGJQLg2TtKIosjn6sOgFoXebrC1mThq
         XIdre+VsSYcmVZE7lihlDxxDk7v18HOm6YF2Iu8zopAhyWJqtAXrJmyHCVYp9x3x05ki
         RIOJqXVfbT+JH60lvIwEz1ZZ3sXhKGjfIO/tmgOP33imIChRtW1W9Ehpyo6AOBMmCsiH
         gLDg==
X-Forwarded-Encrypted: i=1; AKwUvBwy6MXZrslRM+huYMsXbcXET2jN+4FaXSt4JWWY3p28uwg2U3tWUQurLEWSImnATNnWIuym4CJycoQMPak=@vger.kernel.org
X-Gm-Message-State: AFq9FYINm5INhB0f4a6HXH2b7UKvqxNJsdaZ43YhOpnSrGR8Myljanj4
	iBjozuJZZVGX9SRzv0dOlm8m93bU86YA0TZLMY/KHAp4k6AltWxWAj7W
X-Gm-Gg: AYBFou1kFH2CStSK3of/K/ldL3ZvLccbvM9P6hERu/8HiqlteICGRss0Ay/Qxc3rwI0
	DsAaO6CKfJNo4ZL5FYqqsojtu0vK2vFJDKVktxf71DJEYUUaBAv15kQIwR8su9ASvzTp1+F0lSV
	/ww99EeD7rxsNov6F833zTrlPAoMujspd8uZs2MfP4im7JwUAInKCe6yCM1cT+yFn37umy1IPN6
	aK+9XTq3a7wOEc/RQorqsYagHlXgD1KNlDD8B2pydIKKntnkda4lPKG3eL0+IoSRiD9XlDT3ODt
	xMRTZGXnzirB5zlXk77fq0umfZovSvLbbZ1RQdnKOdeByw/Cc/lHOTgCHqY2DwxLrCtUaOAMy2c
	sYQTXver2Z4fZfCoIwd4VT+Y147/5OW490Ez0WgM8GhrORaqjRbU/ZbqWGiGiWsKEIQvxtdfzc0
	Kq4GkonqQvBQDbASGR2K+4KjeQcjZK/d6p1/i88VEc7NJTHG08D7cwAs6WaAEEwmX5i3I2aBKUm
	tROtnVScFoz7kar/hoey7FQCLoXsbjqVZYYMS//FdEqWdWMKjlEicTKMMgy96yOw1LL4wbNZ3cB
	Sh4LBHfluvVxKdUUCSpq2ZsZQcsG42GmwbY/351jrztqCNWh8xdf9yw5hbHvaeRE2XSFhhsLA2M
	bSXBf1c0ioaiA55VU/Fer6M9X
X-Received: by 2002:a05:6a00:1493:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a089d7c431mr2804454b3a.59.1792634235101;
        Wed, 21 Oct 2026 18:57:15 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a089614ce0sm1426295b3a.55.2026.10.21.18.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:57:14 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	oleg@redhat.com,
	peterz@infradead.org,
	mhiramat@kernel.org,
	jolsa@kernel.org,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	surenb@google.com,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	hughd@google.com,
	kees@kernel.org,
	mingo@redhat.com,
	tglx@kernel.org,
	x86@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 0/9] uprobes: Don't stall fork() when mmap_lock is busy
Date: Thu, 22 Oct 2026 01:57:03 +0000
Message-ID: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Alexei Starovoitov <ast@kernel.org>

uprobe_register() and uprobe_unregister() stall every fork() in the system
when some process keeps its mmap_lock busy:
- register_for_each_vma() sleeps on that mmap_lock with dup_mmap_sem held
  for writing.
- fork() of that process sleeps on that mmap_lock with dup_mmap_sem held
  for reading. The next register_for_each_vma() waits for it, and other
  forks wait for the writer. The process doesn't have to map the file.

We found it the hard way by using uprobes in production. uprobes were
attached to libraries and binaries that many processes map, on a large
number of hosts. On some of them every fork() was stuck for minutes while
uprobe was being registered.

Patch 5 fixes the first one. Patch 6 fixes the second one. Patch 1 is
a helper for them and patch 9 is the selftest.

The rest fix old bugs that patches 5 and 6 make easier to hit:
- Patch 2: exit_mmap() runs under dup_mmap_sem.
- Patches 3, 4: x86. The removal of optimized uprobe that failed half-way
  is never finished, and SIGKILL triggers WARN_ON_ONCE().
- Patch 7: the child loses the breakpoint of an inherited perf event.
- Patch 8: the tracer that is killed leaves its breakpoints behind.

A process loops over mmap(4G, MAP_POPULATE) and munmap(). Another process
calls fork() in a loop. The longest fork() while uprobes are being attached
and the time to attach, in msec. 32 cpu VM, HZ=1000, no debug options,
median of 15-45 runs:

                                       fork()          attach
                                    before  after   before  after
the busy process maps the file
  uprobe_multi, 1 uprobe               201   0.25      217    232
  uprobe_multi, 4 uprobes              422   0.34     1483   1558
  perf_event, 4 uprobes                421   0.47     3150   3322
it forks and doesn't map the file
  uprobe_multi, 1 uprobe               198   0.07      212    9.6
  uprobe_multi, 4 uprobes              203   0.08      213   13.4
  perf_event, 4 uprobes                419   0.08      630   12.3
nobody keeps mmap_lock busy
  uprobe_multi, 1000 processes        1.93   1.83     4.24   4.49
  uprobe_multi, 5000 processes        8.88   8.60     8.33   9.23

I don't care which tree it goes through. It targets bpf-next only because
BPF CI will run the patches, including the new selftest.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>

Alexei Starovoitov (9):
  mm: Bring back mmap_write_trylock()
  uprobes: Don't run exit_mmap() under dup_mmap_sem
  uprobes/x86: Finish an unoptimization which failed half-way
  uprobes/x86: Don't WARN if an optimized probe can't be written
  uprobes: Don't sleep on mmap_lock under dup_mmap_sem
  uprobes: Don't sleep on mmap_lock with dup_mmap_sem held in dup_mmap()
  fork: Let the new task point to its mm before uprobes can find it
  uprobes: Don't leak the breakpoints if the unregistering task is
    killed
  selftests/bpf: Test uprobes and fork() with busy mmap_lock

 arch/x86/kernel/uprobes.c                     |  23 +-
 include/linux/mmap_lock.h                     |  12 +
 include/linux/uprobes.h                       |   5 +
 kernel/events/uprobes.c                       | 260 ++++++++--
 kernel/fork.c                                 |  13 +-
 mm/internal.h                                 |   3 +-
 mm/mmap.c                                     |  33 +-
 mm/nommu.c                                    |   3 +-
 .../selftests/bpf/prog_tests/uprobe_busy_mm.c | 447 ++++++++++++++++++
 .../selftests/bpf/progs/uprobe_busy_mm.c      |  22 +
 10 files changed, 766 insertions(+), 55 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/uprobe_busy_mm.c
 create mode 100644 tools/testing/selftests/bpf/progs/uprobe_busy_mm.c

-- 
2.55.0

