Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871CD36897F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803124; cv=none; b=h65s0I9NksBRlxbzCPFcBVyqDxsJXHiEh/ZeDFt6K8k/GIUazVRQgmg76tiUrrQKz0IYwcLnx94yEA6G7M/FcBWoojLCXsdq+WZXDekIiBodjg9kSO2iCGGbl4+m3aMdc8GTDtbsgjluiZv5i1IMVmRoghFyaY6LdOJSl3NLIRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803124; c=relaxed/simple;
	bh=WBqoSJ078Ipt132g05hyxfLhIJ0n83c7RK8+glXV/VM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bH48qSQpNxCLe50nbZd5YOVKYYTWZpEUFrB6ixM++hbKyIMsu9JuYYGW0shjMp9JE0BjknEn9VWnvH5/ytLgRk0Xp06NfZ/C3gfQiwAAvg9qm+SFTce2U4TUIfWogcge+nvCzROi37oEqtQOLgQ9BpYaazcGvv+iuEmyQ9fxpo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLA+0v/z; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLA+0v/z"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-451a49abd8aso1821380fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803121; x=1788407921; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hk8xlYcQ992v4GPZklrqwELZ/QuZUmphMpwq4ovXMVs=;
        b=MLA+0v/zu6o90/gIZlz+73hKTt7pDzG2z2nb0UU9doxDKvHEM/Q75KjO5f+rrdjhsF
         NoA1ZczIMI53ASfk4QkwLjVyJ8JDYG6PvK5SDnJfYyMkGHIngLxXvS9E8/FViILcYDKp
         EP41BH9AGpgNE+ExSXd0+cFKdeUjou76RcavmdfQaf+8MtVH59d8QeaQ4FgBRShaFsgZ
         lCChxtwNiBlHAyqigMYu6Jf12I/CegNyDsbqE410n7V6FgCcIfBn+TEYcqTs3DsTXzyz
         sdFYqT48mx3HrqoEDwGM2qSL8PFv3ETg+Aa49uSq6g3jcAJ3vGHYg/oIkJj56rWdYG6o
         eoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803121; x=1788407921;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hk8xlYcQ992v4GPZklrqwELZ/QuZUmphMpwq4ovXMVs=;
        b=rQ1jPLmOS6efwtj8E2qtlL8toWltlpIYLSbWQRO2nk00Y9RwXHGceyL2tn/J4VR24f
         2icNIK1jlv7Uq/gR6wn+IyQ2SVS3RjdJ3un/aAOuU5HEUAF4o2Ut/FOibXS6DOhCnDZn
         Rk/8/0xt9k9YtRL1+Zw1BliqywYC6JUQgEGYlUZ8kcKON41FtqvgW0yXJs96q24B7/ii
         6Ep7zo4XLzJbiA0wlnFvSynthbyt2gioC4UmtVNM3dCb/YyI6cqy2IHRAs+DI6oHONYR
         2JWnUhPAc+k446KdNDwFC9FIzPNOZ5lqDmwgW1sia/nthF/CNtME8IkcZ/SqNWAT+DDW
         jfhQ==
X-Gm-Message-State: AFuF++k3MnwaCDK0TuOU87yFWBk+7vJNwtZ/6V58znGyhynvsRGCpnPp
	tbWS0O/35e855MFIfJhKN2ZyW5bW7EOUde13zBdar7kuLXH6uiDbQpn/
X-Gm-Gg: AR+sD11P8u7Z4fsyYOggUam8S4Kg2J4bAf1EZF+JSVkN65EEIGqzbO5G7k29tP06yDu
	/h30v1bJ/l+hLlfBy/S3LUEtBS+dvKHABA3y65bjMXft1zrcLKf6PCih+SW0FrkXdW835cqefhJ
	Y/J7wYDbMfgjGs6Y0tp0S90H7fAfUX4m3sIOIYtPaRo0elTmP5hPFaib3Ra2F7xS3VM+YBvLu9c
	b7IlQJ8tFYMtM1OFJzXaiRQWIpUd/YPnDjRIHESJ67Hov0bubfAdjqaLLguZjErCiOjYeIXtuLt
	YEr6VcNs7jbcvOlJwStoCu01fzkbBNQeTraBmNVMxTGuVzHPr7ZLWiOXRjCpFfdjBG5aRf/UZ7x
	xzT4r+6mEBgfFLzDxIoJuZOlbxE7d+FmvIUwGU9tRT/aMC0bhfTa2rwRFzuCzI7m3QiIfZOtEcV
	wxcBCFvoAGSfkE7KXsAth64PV2uwadUMIrJstghgnmRvf1MNEdpOWMp4CeBoov3sLrU3Z3N6J5O
	2DPZuuuwY5ct5ugnAEmYt85l+gjBJoR4ct4fu6UQ5yekULKGxK7RD6OW3FIvlyQstGOxfl09q1y
	I2Ut3TsQ
X-Received: by 2002:a05:6871:e8c:b0:44c:a987:82f4 with SMTP id 586e51a60fabf-46599818af5mr13503843fac.10.1787803121206;
        Wed, 26 Aug 2026 20:58:41 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 0/8] lockdep: change 5 graph-db arrays to AofAs, fill from
 memblock pool
Date: Wed, 26 Aug 2026 21:58:32 -0600
Message-Id: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G2gjFfUr4kFrqsGVFoog/t3qb
 eYwc0NgLxygyW7wHCXIsSfReQZ27veJUcbkQIpKVZHB9bDLyCduvA0fY9SoyaqqIDLsakjl6dn
 J9V/b7nleeW76DWUAAAA=
X-Change-ID: 20260825-lockdep-memblock-v1-12c083225ef9
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=7481;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=WBqoSJ078Ipt132g05hyxfLhIJ0n83c7RK8+glXV/VM=;
 b=0AQYKqxewWYBtOLdFCl1DLEf8aFHAlcF2/AyzJUm6geUNhgoU8tc3stVgKIrCaXElvMHzZ4lT
 b7AuOyb5Ni1CeGZeD1UNYSUkxmmbOnFePCyAt0W7WfBziPkI7ayGMNR
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Lockdep cannot rely upon any other subsystem that uses locks, so since
inception, its graph-db has been stored in static arrays, pinning ~10
MB in .bss. This is a hardcoded compromise between embedded and
enterprise hardware.

However, if it acts early, lockdep can pre-allocate a pool of slabs
from memblock_alloc(), enough for its lifetime of anticipated workloads.
Then it can allocate them as needed to provide new segments/slabs to
the graph-db.

With that idea, we:

0. Add lockdep_early_init() hook in start_kernel() right before
   mm_core_init() to grab a private pool of 64 KB slabs from memblock.

1. Add DECLARE_CHUNKED_ARRAY() to build 2D chunk pointer tables.
   Indexing uses a compile-time hybrid:
   - Power-of-2 tables (lock_chains @ 2,048/slab, chain_hlocks @ 32,768/slab)
     use single-cycle bit shifts (idx >> SHIFT) and masks (idx & MASK)
     for zero-overhead cache verification.
   - Non-power-of-2 structs (lock_classes @ 409/slab, list_entries @ 1,365/slab)
     use Granlund-Montgomery reciprocal divide to achieve >99.8% slab
     packing density, avoiding 1.75 MB of internal dead padding.

2. Deploy chunked arrays across the 5 graph-db tables:
   - lock_classes: struct lock_class (160 B) -> lock_class_chunk0 (409 / slab)
   - list_entries: struct lock_list  (48 B)  -> list_entries_chunk0 (1,365 / slab)
   - lock_chains:  struct lock_chain (32 B)  -> lock_chain_chunk0 (2,048 / slab)
   - chain_hlocks: u16               (2 B)   -> chain_hlock_chunk0 (32,768 / slab)
   - stack_trace:  unsigned long     (8 B)   -> stack_trace_chunk0 (8,192 / slab)
   Each static name##_chunk0 in .bss (~320 kB total) provisions the graph-db
   with initial storage to cover early boot until memblock is up.

3. Embed struct lock_class.class_idx and struct lock_chain.chain_idx to
   replace flat pointer arithmetic (ptr - base) with O(1) index queries
   across disjoint 2D slabs.

4. Dole slabs out on demand to the 5 consumers via an index bump under
   graph_lock (zero allocator locks, zero recursion risk).

5. Auto-tune the pool size based on RAM and accept boot overrides via
   lockdep_slabs=N and lockdep_headroom=M%.

6. At late_initcall, satisfy both constraints (slabs >= N and headroom
   >= M%), and return all unused excess slabs to the buddy allocator
   via free_reserved_page().

7. Expose pool usage and remaining headroom via /proc/lockdep_stats and
   log lifetime usage via a reboot notifier.

8. On debug_locks_off() or OOM, immediately sacrifice all dynamically
   claimed slabs back to the buddy allocator.

Static .bss Memory Savings (vmlinux x86_64 defconfig):

    Kernel                 .bss Section Size       Notes
    ----------------------------------------------------------------------
    Upstream (Static)      12.46 MB (13061164 B)   Fixed max-sized arrays
    Patched (Memblock)      2.30 MB ( 2410988 B)   5 * 64 kB Chunk 0s in .bss
    ----------------------------------------------------------------------
    Net Savings            -10.16 MB (81.5% reduction in .bss)

Memblock-Pool Elasticity & Buddy Return:

  [ 0.850318] lockdep: boot complete : 9/64 slabs used, 41 kept (355% headroom), 23 returned to buddy (1472 kB freed)

  That VM boot consumed 9 slabs (576 kB), keeps 41 slabs (2624 kB,
  355% headroom) for runtime growth, and returns 23 slabs (1472 kB) to
  buddy at late_initcall:

  The boot-args let user specify the reserved-slab-pool size:
    lockdep_slabs=N		# min ct of 64kb slabs kept
    lockdep_headroom=N%		# added % to boot-complete numbers, default is 100%

Workload Stress Performance & CPU Overheads (perf stat, 4 vCPUs):

    Benchmark     Metric          Upstream (Base)     Patched (Memblock)  Delta
    ---------------------------------------------------------------------------
    hackbench     Runtime             8.482 s             8.278 s        -2.40%
    hackbench     Cycles          52899510936         52033166458        -1.64%
    hackbench     Instructions    29008189069         31698626928        +9.27%
    netns         Runtime             9.704 s            13.321 s       +37.28%
    netns         Cycles           3941156282          5077381493       +28.83%
    netns         Instructions     2758079004          3008859260        +9.09%
    vfs           Runtime            10.544 s            10.608 s        +0.60%
    vfs           Cycles          48150692681         48840696114        +1.43%
    vfs           Instructions    32621052088         35448537908        +8.67%
    modstorm      Runtime             0.611 s             0.585 s        -4.17%
    modstorm      Cycles            512425082           514784953        +0.46%
    modstorm      Instructions      349890783           383054584        +9.48%

    Under heavy lock contention (hackbench), the power-of-2 fast-path on
    chain_hlocks and lock_chains brings total cycle consumption to parity
    with or slightly faster than upstream baseline (-1.64% cycles).

Workload specifics (virtme-ng, 4 vCPUs, 4 GB RAM):
- hackbench: hackbench -p -g 8 -l 1000
- netns:     40 netns add/del cycles with paired veth interfaces
- vfs:       8 parallel workers creating 200 dirs, files, symlinks + rm -rf
- modstorm:  10 sequential rounds of batch modprobe/rmmod (dummy loop null_blk brd tun)

What's Unchanged:
- All lockdep validation invariants, BFS graph algorithms, and deadlock
  detection logic are completely unmodified.
- RCU iteration semantics across lock classes and chains remain intact.
- /proc/lockdep and /proc/lockdep_stats formatting is fully preserved.

Series Structure:
- Patch 1: Optimize zap_class() to traverse adjacency lists directly
  rather than scanning the global bitmap.
- Patch 2: Add chunked array infrastructure and embedded indices.
- Patch 3: Pre-reserve early memblock slab pool for dynamic tables.
- Patch 4: Convert 5 graph arrays to chunked tables backed by slab pool.
- Patch 5: Fast-path power-of-2 tables with shift/mask indexing.
- Patch 6: Free unused reservation slabs to buddy allocator at late boot.
- Patch 7: Expose slab pool telemetry in /proc/lockdep_stats and initcalls.
- Patch 8: On debug_locks_off or OOM, recycle all slabs to buddy.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Jim Cromie (8):
      lockdep: Traverse adjacency lists directly in zap_class()
      lockdep: Add chunked array infrastructure and embedded indices
      lockdep: Pre-reserve early memblock slab pool for dynamic tables
      lockdep: Convert 5 graph arrays to chunked tables backed by slab pool
      lockdep: Fast-path power-of-2 tables with shift/mask indexing
      lockdep: Free unused reservation slabs to buddy allocator at late boot
      lockdep: Expose slab pool telemetry in /proc/lockdep_stats and initcalls
      lockdep: on debug_locks_off or OOM, recycle all slabs to buddy

 include/linux/lockdep.h            |   4 +-
 include/linux/lockdep_types.h      |   1 +
 init/main.c                        |   1 +
 kernel/locking/lockdep.c           | 951 ++++++++++++++++++++++++++++---------
 kernel/locking/lockdep_internals.h |  95 +++-
 kernel/locking/lockdep_proc.c      |  63 ++-
 6 files changed, 875 insertions(+), 240 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260825-lockdep-memblock-v1-12c083225ef9

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>

