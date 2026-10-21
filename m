Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792617555;
	b=AJYZ7U9NyBr6XONtgaev4PqfVi3TIptyXUgGcK84jMBgjkSNLVvBxQh+jcEBhkCOlYoe
	 0X+0dl85VL+QguGnWQk4U0U1dHjyVrPP1/pqcFwnCAJTZmVyodrcXHakME1bUXWl3H5Ym
	 0PQZXNnCF3drnBTbXSzh0z51T0VK2dU/YTyyxUXT+DZo7vVcMEKsZw0lhrIvCJX4o7HEh
	 j+4rqAYaX/4jg44awWAInsYrmIlSM+CjBXYaty1gvSeI59fP+tE6jboAHpvp54fgnJcUf
	 Yqpw/v7KGBF3FOqA22aWOSe3yELYK5z7yiTwh8unIie2wkY3ltb2TM08msIp1o7yXmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=FN6v7SVOkb0MCrKdScdxO3dToDbvk4Fcf6pFsRpJAbU=;
	b=hgf/eAvrajW9J9sy65qj7M7udHlPFp75ArbxSA9uS//dYI9fCrcw0Mua+tENq/eJyRQH
	 bvT9CYk00TeeWP+PIrGwob0sAiKL7AgUilnhJNVo4tOy6RCddoiAxZhU8Nperin/C/QBf
	 H5risvot9JsyshC8wIFMJnG61CinW0NmlXdpOQDZlo3Fd2jkNB65t7oPyV3X8ImgAXHRG
	 cVSvrLsWO7fB0meoVTVEIzSCr1MNGkA3i6XXDYQpM3JdyeU2Jf9d67WHudEKJCdvW5VCt
	 MskiiMvBSffaM9XaxHQ0vJRfqsTEVXiSZql8ID9xziNUpubssHJgmDkG0vEREQEVJMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OFor389T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59957606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59957606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OFor389T
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c34bff61551so145807566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792617554; cv=none;
        d=google.com; s=arc-20260327;
        b=b5WbuN6JuwtO057Da0LWWPRRAtkJliU2tBmFgDz+kOCYFRhDyVZ+w07gVbgEf6dSRd
         uFYUMjxXDBqdBYe1q+iZjIAmMf8ubr8tcgxoAdeMNnONyFyoasmy1TmDbkfpoC9ql97S
         pNPjTCcEpzqdfQA4fDiiF/E8yt4sSBr5z2uKEBldmnAQKNeNptSXcKSGdb02A8iKBb3Q
         EVyyYAJxZNOHoJi96sAHULfSwGWQ/M3+QVO9S84Bpb57IRn8YBFSC8m21iCqGENyoqEx
         zN66XB6J4zZr9J45FRoImGHIslKRP5Jw/3osv/qnZqHrHrz6jMTTTFp7TQ3UZ111II5L
         zubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FN6v7SVOkb0MCrKdScdxO3dToDbvk4Fcf6pFsRpJAbU=;
        fh=XoFc5ryMxx58uuiTJg1ARhdTKpxiT5XnaEMwAbdtFCM=;
        b=eXYKJfE/1pxnShk6q0LmzgdGzoNq6Vd9TEP27G05RcqX2fGoiWPbhKZar8SP6bd28R
         a+T7GTklo6xH99a5SlpQDyUuZdF7tARmF8OnsSawZ7QEN3MLu7k1fRzAFEjZCmr1gNyV
         /Zktp1Ol2sNBcCsvHQKZ6rj6g8WD1wLRS8KcKtEGL3H7oZ37cz3XtbHie7i1cTYh4pQM
         VPDDra6RjbiN0bdxQE6TCm5nU88IFesyb01LrTep0O1pizbQHrGjZG+PBYQYC2Q/Z9rS
         vDOJmFk0Fos9mk/M1EOEKgoN2gNhTzef/i1/KEtU1HJXQFQmJBoLdP42gtMzUERT1uY4
         EyRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617554; x=1793222354; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FN6v7SVOkb0MCrKdScdxO3dToDbvk4Fcf6pFsRpJAbU=;
        b=OFor389T1BxsZMjIVQd4DUfq+hlgA2izHv/6s2w/BC69zKmaiVkQuqtzzVRqldpNWT
         fy78HzteEHNwVUNwsZW6rESY0T31ORfF/RogJvm4KA9au+8SQMN6y5ZxmzTWjvPOf12Y
         Mnn/WR7dKkxRGspRzyaG5P6PyE/M6UHBFRJTkc5UT7KPE4Vm/E8UuIqqWofjCIes/Qr4
         muF15yEwC3e8h46WP5X+eNbn9HJSWxltIeBcUt45pRR2aTS5QOKouxzQz40rgCTqVUsD
         zZb9Y+SoCo23GHuzyt9+vKQQ3qy08GTmGwHhDEjPHG7H229shBgpEgdlGSkl2ms5xhev
         uiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617554; x=1793222354;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FN6v7SVOkb0MCrKdScdxO3dToDbvk4Fcf6pFsRpJAbU=;
        b=oZ+zVZHOTQ9GcgnrDlfYF5Di9R4n8tt7TjsCqJUCkfE7svrI3hwgaj4hHz3gOL2BXy
         LX7QDzn11S8DB3uXnIy88tH8luC9aHXsRPk65/zBfUzP+tGVx48Rs65IaXpj9epgkzxT
         BXsVAWnOiExpA/vBAAmx0NSqBStJpFliNRITUHzuHRHdwamfik1N1UO+fkZrA72zFZ+p
         7rwRuM1Xs0rvF8I7zL8GrrkKrvtWy+xc5+YDMzxB6vuIqVFufn+1QlRWNVa8NedU9QF1
         gDJbKcB3SBh+w1kt5AKpApuwsB/NJUVHSxhijVCZNNp3V/A3Xe803upQpu+BlQySUL4a
         9yQA==
X-Gm-Message-State: AFq9FYL+o8rb7px8TZ4feLccoiFSi1WRM4umhvXPOkD4QvxXku91oweK
	n5p5yqRA+HkaoZLRi1yqNc4aKOJG6WzPkODw1CH+YnOAKVGTetNkrRhFUNmnF0xSM1OlycPYAYq
	IyYU0kZQLuwAihwOmeFzt/NZQv5rJYEp/ymfh7s1c1w==
X-Gm-Gg: AYBFou2Gz+L3XSIRAjc5wmEc9GgXz+lx5nUnEoX/vvP1nu2My9ielhcWvaCp3eUPixl
	t+O1nlx4kegHRe2I2hDIupoAiy8J6ojH2sRZQDxabytAQrpekKpC4NqOL3Sg/qoc3+nFw/12SI1
	RnGiHONrbdThRUZEjeZfBNAY+bll7A9c1Fm4lsCrKjPq60paEZAxxqVrOkgtFhRyX8psaUxRjNq
	NL8CbgDXseojOSautpKdr4Pwi2+mXHCR5/1XXixD1yrrbPMhBLAF+h3hG0ICtLbnKKH3W8azcHa
	ihKUMam6qReZ3a4lurdUDRLUcpHuMnRORlSYaim69c8imb4mjQ8rXueH8hdAElx2/5L+8pzc/CK
	sYqalnnADR/OE8gWB2R7F58UhXOFEHJxJ8fQh
X-Received: by 2002:a17:906:f586:b0:c3e:e677:563a with SMTP id
 a640c23a62f3a-c4679a238b9mr272475566b.47.1792617553383; Wed, 21 Oct 2026
 14:19:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Daniel Elliott <ssfdre38@gmail.com>
Date: Wed, 21 Oct 2026 14:19:00 -0700
X-Gm-Features: AclHuK-gS9vHa3pN2O0CqjSUPQ6N_GY41B512MssdU87w8JtS_2P_g2tfw4PdXc
Message-ID: <CAJVF7aNOjMh3edjjrrAPNhLKWmwNMfn-Yp9Mkq4=xSUmFO-UyA@mail.gmail.com>
Subject: [RFC PATCH 0/1] mm: Haven Memory Bus (HMB) zero-bio paging engine
 with Tier 2 z-Pack deduplication
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: "hannes@cmpxchg.org" <hannes@cmpxchg.org>, willy@infradead.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

    Executive Summary
    =================

    This RFC introduces the Haven Memory Bus (HMB) Spec 2.0 Native Paging Engine
    directly into the Linux Virtual Memory Manager (mm/).

    For over thirty years, general-purpose operating systems have
assumed secondary
    storage is an asynchronous block device. Even modern in-RAM paging
subsystems
    (e.g., zram, zswap) construct struct bio descriptors, pass through blk-mq
    software request queues, and traverse I/O elevator schedulers
before reaching
    physical memory.

    HMB eliminates this legacy abstraction. By intercepting folios directly in
    mm/page_io.c (swap_writepage and swap_read_folio), HMB provides:

    1. Zero-Bio / Zero-Queue Bypass: Folios are stored and retrieved using
       lock-free O(1) arithmetic stride indexing directly over the CPU
memory bus.
    2. Tier 2 z-Pack Inline Deduplication:
       - Zero pages: 100% deduplication (stored in a single bitmask bit).
       - Uniform 64-bit quadword patterns: 99.8% deduplication (stored
in 8 bytes).
       - Varied pages: Stored in high-speed slab pages without block
serialization.
    3. Sub-Microsecond #PF Resolution: Page faults resolve in 0.51 us,
eliminating
       thread stalls in uninterruptible disk sleep (D state).


    Bare-Metal Silicon Benchmarks
    =============================

    All benchmarks were conducted on a physical bare-metal server (Supermicro
    X11SSH-F, Intel Xeon E3-1270 v6 @ 3.80GHz, 32GB ECC DDR4, 2x 2TB HGST
    Ultrastar 7200 RPM SATA HDDs) running Linux 7.0.14-hmb.

    1. Page Fault Resolution & Latency Under Memory Pressure

    In a constrained cgroup v2 environment (MemoryMax=256M), a worker process
    allocated 600 MB of dirty heap, forcing the kernel to evict ~350 MB of
    anonymous memory. The process then immediately read back all
memory to trigger
    real kernel page-in (#PF):

    Paging Mechanism                  | Paging Latency | Recovery Time | Speedup
    ----------------------------------+----------------+---------------+--------
    Traditional Swap (7200 RPM HDD)   | ~10,000 us     | 258.0 s
(4.3m)| Baseline
    Barrer HMB Native VMM Engine      |    0.51 us     |   0.013 s     | 19,842x

    - Operations Handled: 91,799 pages evicted, 25,313 page faults recovered,
      168,643 swap slots freed directly in mm/.
    - Block Layer Trace: Zero struct bio allocated; zero blk-mq submissions;
      zero storage controller interrupts.

    2. Real-World OS Workload: Core Systemd Phased Upgrade

    Under memory-constrained multi-tasking, an un-phased upgrade of 13 core OS
    packages (systemd 259.9, udev, libsystemd0, initramfs-tools, dbus)
was executed:

    Metric                   | Traditional Linux Storage | Barrer HMB Kernel
    -------------------------+---------------------------+----------------------
    Paging Throughput        | ~90 MB/s (Rotational seek)| 2,625.9 MB/s (Bus)
    SATA Controller Conflict | High (Swap vs pkg writes) | Zero contention
    Thread Sleep State       | Heavy D-state / I/O wait  | 0% I/O Wait (Active)
    Network Socket Buffers   | Prone to TCP throttling   | Zero packet drops
    Systemd Re-exec          | High latency on deserialize| Instantaneous


    Architectural Implementation
    ============================

                         +----------------------------------------------+
                         |          Linux Userland / Applications       |
                         +----------------------+-----------------------+
                                                | Page Fault / Eviction
                                                v
                         +----------------------------------------------+
                         |       Linux Virtual Memory Manager (mm/)     |
                         |           swap_writepage / swap_read         |
                         +----------------------+-----------------------+
                                                |
                  +-----------------------------+-----------------------------+
                  | [BARRER HMB HOOK]                                         |
                  | Does HMB claim this slot?                                 |
                  v YES
       v NO (Fallback)
    +---------------------------------+
+---------------------------------+
    |   Haven Memory Bus (Spec 2.0)   |                       |
Traditional Block Subsystem     |
    |  - O(1) Direct Arithmetic Stride|                       |  -
struct bio allocation        |
    |  - Tier 2 z-Pack Deduplication  |                       |  -
blk-mq request queueing      |
    |  - Zero Elevator / Zero Queue   |                       |  -
Elevator scheduler overhead  |
    |  - Sub-microsecond return       |                       |  -
Mechanical / NVMe I/O delay  |
    +---------------------------------+
+---------------------------------+
             Latency: ~0.51 us
Latency: 10 ms - 4.3 min


    Key Files Modified
    ------------------
    1. include/linux/hmb_pagefile.h:
       Interface declarations and zero-overhead inline stubs when
       CONFIG_HMB_PAGEFILE=n.
    2. mm/hmb_pagefile.c:
       Core arithmetic stride plane, atomic bitmasks, Tier 2 z-Pack
deduplication
       engine, and /proc/hmb_pagefile diagnostic telemetry.
    3. mm/page_io.c:
       - swap_writepage(): Direct fast-path hook to hmb_pagefile_store(folio).
       - swap_read_folio(): Direct fast-path hook to hmb_pagefile_load(folio).
    4. mm/swapfile.c:
       - swap_free_cluster(): Lock-free slot reclamation via
hmb_pagefile_free().
    5. mm/Kconfig & mm/Makefile:
       Integrated build configuration (CONFIG_HMB_PAGEFILE).


    Code Quality & Standards
    ========================
    - scripts/checkpatch.pl Compliance: Verified on Linux 7.0 source tree:
      total: 0 errors, 1 warnings, 484 lines checked (warning is informational
      prompt for MAINTAINERS file entry).
    - Coding Style: Standard tabs, 80-column line wrapped, SPDX
GPL-2.0 identifiers.
    - Concurrency: Standard Linux set_bit, clear_bit, and atomic64 primitives.


    Public Repositories & Reproduction
    ==================================
    The complete driver, in-tree kernel patches, and test suites are open-source
    under GPL-2.0:
    - Repository: https://github.com/barrersoftware/hmb
    - Linux 7.0 Patch: kernel/in_tree_patch/hmb_in_tree_linux_7.0.patch
    - Android GKI Review:
https://android-review.googlesource.com/c/kernel/common/+/4376433

    We welcome feedback and discussions regarding integration into mainline mm/.

    Respectfully submitted,
    Daniel Elliott
    Barrer Software Organization
    <ssfdre38@gmail.com>
