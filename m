Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE0955C32A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873239; cv=none; b=QwYI6pdHuejeMBtG75uz5m0cLleNJ402Kpp7A7FC8i+bWmB/iLcnzgdKGD0l3mxfFypJhHHfaufaelKUSgSatvdYJdZPmgaCd3kJslMao4oQgPZUZNk7KY9R+KzJW4wAprauhSbrqDIbp+k+p1DscE8A3apsyKfQxzOAPdf646s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873239; c=relaxed/simple;
	bh=QXcYtdrKDq+pmTlAwtQA/BCNNqUsRUy+3OBDwBhdFig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dr0eJSWekuW3eCqkI5Flgibnu3HmRlzdvcp1HGBennd8hvSlJSMJRB4xfPIktcsXXbqeOkiJTDAtb+TMRhjyKwxeCYiNZZhnX0tYsYvgyWjx+dHuHscZmv9UEhEQAqdarg6OLRcdDTzH9v4oao+ztTdKtc1JgFcfCdQ+VNEmHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHYRUfB/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHYRUfB/"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15e592da74so555003666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873232; x=1789478032; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vo8u28j4GyXE0RpSvRuCGjIeNosarp7/Ns5KHxaIM7w=;
        b=AHYRUfB/OZ38yPwFw/zrPfeVTaadJLXbPRphbGl1UDZzDZKCxdjREAe0f42Mf0yXhp
         0v0+vNWTn6p2feq9bMAcqVov8u8OCtTGzoyNJeeLy+GWG4MHSZBwk/I5iroO4aVw/amM
         PBZhJrO78bhtFnjefuVuqYAKCQ+EEjLS2lICGMCba0/ZKPmU+/DHGafsmm0JfqvYm/aL
         nmoXXKCqGdyjeotTV2eAvCfxsGUyJ1Jp5USpACvUBR8a6D54CkPn7mqx1+iIKIQ7JsfM
         y5tdPyPBDrU2t2QScNy+Na39WsGqI+pHsmvABbrQSjYzsVtEEz6B9KYaIrOviRAl8fbw
         PeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873232; x=1789478032;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vo8u28j4GyXE0RpSvRuCGjIeNosarp7/Ns5KHxaIM7w=;
        b=gbSwRn9xfBTPC2aGdZ6Mg4C0K/8ULesHKH3Vhv4Tk+aZ9JHrOhRcN8A5FsQHwaWye3
         b0VZz7sByFBl5auEC7BwaEr2DulAk41tazCFQLBXvbdWH/ZTyjPt2gc5Ja1EeMoBduXv
         K61WqJTjLpRVHMGsAQSAEmWHKuFzrOE0Ce/R/dBgQsB4ButJ8tuWMATOa8HbMJXsoery
         E3PicCHW6qTM7jsgX23f2ghrvbsqSquoo/LpT/rQAmCGd1bBpbdhGtsVcocxJu81ORc+
         2HQRJN5ndjswTqWQHDWwHMleGgDmearezqnf7QqLrhGj45RNKwik9+y5pQF7CsBUrij/
         +oKg==
X-Forwarded-Encrypted: i=1; AKwUvBxtBnBS02JDUolss6wqfCnQ7hk9FeyjPtESkSDskFVlg3xseTQKgczGND8S0/mki7oJd+gXC2rAVKED7tY=@vger.kernel.org
X-Gm-Message-State: AFuF++n9k7L+FAxG4+lADIXhiNuBNf90E3wR0MOzB3Yer0bIJrZrucPo
	2/Tkd4Kv9W8uoZKEB9VvS77qNnRQXxq54QJRooaiwdcab7EWr868+Hh9
X-Gm-Gg: AYBFou2s9aix+fojaV7ukLlf8aEM/TL0EkXUnM6o3RXfqWr66JOXZiCgUDVAjWa9Wy9
	KEWvMFLLAAcYdYYkdgUSLLDpNe2idr83SGGQFzXgJAS3Yz5RxVsZ9ZBeIveMuaVyuMQZuYZum2q
	j3gdOzJD9GWrwUCdd8R81uDhDNGAPZNbLSzI/klE9L2STb8l0jvjpsEF0X1dxe5ksegBCkrSKYQ
	2kBpCOCQmcA1smGkiyOvfsM7SgipHUvNJogqitoZgUUaqA0uUM111HHOTcG+9UmhB8CtdCEtaxp
	IA+VtwTRrfbDsbukdC6OPccEG2fevVW5Y9BaKQKJq/pQGPPOdpIn1UeLXpLxdH3FqA5SDJLabSw
	pM4tPKElywYfqO7B+70drU3S9gk3OyU6tWPaOSbXBCDRPRY2qWpiI8W1rv7iSgQGDn7JDZliCMK
	FdaajuQ8etC25on1iOMPnxU+DHFDHHvuq0oR+KUCUzHVft2+Mzs/2n4u+1dAFL
X-Received: by 2002:a17:907:934c:b0:c25:c954:faf2 with SMTP id a640c23a62f3a-c260ca20979mr1124208466b.21.1788873231550;
        Tue, 08 Sep 2026 06:13:51 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:51 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Subject: [PATCH RFC v2 00/11] stackdepot: reduce memory use for persistent
 stack records with a trie
Date: Tue, 08 Sep 2026 14:13:33 +0100
Message-Id: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBREf4XctTVtDQ9dmZj4AW4Ni3J7kSpS0
 haiIfy7BZYuZzJnzgSenCEPp2QCR6PxxnYxyF0C2KjuQczomEFymfGC58wHhS9NvQ0sRJJJTSJ
 VUmN9zCFSvaPafNbHO9yuFyi30g/VkzAsX8usMT5Y9129o1jHm0L8K0bBOEsPRc5RiSwV1RlbO
 +i6VY72aN9QzvP8A3s9S5/KAAAA
X-Change-ID: 20260807-stackdepot-trie-2de15a2dcf97
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, 
 kernel-team@cloudflare.com
X-Mailer: b4 0.16.0

Hi,

This series reduces the memory used by persistent stack depot records by
sharing common frame prefixes in a path-compressed trie.

Cloudflare runs KASAN on pre-production servers so allocation and free
stack traces are available when diagnosing memory-safety bugs. On some of
these servers, stack depot exhausted its pool budget even after we raised
stack_depot_max_pools from 8,192 to 32,768. Once the depot is full, a new
persistent trace returns no handle and a later KASAN report can lose the
history needed to explain the bug.

With 4 KiB pages, 32,768 order-2 pools allow 512 MiB of stack storage.
Doubling the limit again would allow 1 GiB, but it would not change the
linear growth: the hash backend shares identical complete traces, while
two traces that differ by one frame are still stored independently.

The trie is opt-in and disabled by default.

Backend behavior
================

When the trie is enabled, a persistent save uses it unless the caller sets
STACK_DEPOT_FLAG_GET or STACK_DEPOT_FLAG_COUNTABLE. GET records can be
released. COUNTABLE records remain hash-backed because page_owner needs a
stable struct stack_record and its count field.

RFC v1 only looked up existing trie records when a save was not
permitted to allocate. RFC v2 also makes one best-effort insertion
outside NMI using pool and side-table memory that stack depot already has.
It does not allocate, sleep, retry, wait for RCU, or fall back to the
hash backend. If the trace cannot be recorded, the save returns 0.

An NMI save remains lookup-only. It can return an existing trie handle, but
a new trace returns 0. The hash backend can sometimes insert from NMI when
it already has enough pool space.

Both backends share stack_pools and the stack_depot_max_pools limit. A pool
used by the trie is unavailable to hash-backed GET and COUNTABLE records.

Design and API
==============

Each trie node stores a run of frames and branches only where traces
diverge. On arm64 and x86-64, a frame uses a compressed 32-bit payload
only when it can be decoded back to the exact original address. arm64
stores a signed offset from _text. x86-64 stores the low 32 bits when the
upper 32 bits are all set. Other frames remain full-width.

Trie handles contain dense stack IDs. A sparse table maps each ID to the
node where its trace ends. Fetch reconstructs the trace by following parent
links.

Insertion is serialized, while lookup and fetch run under RCU. A new stack
is published only after every required reservation succeeds. Replaced
nodes and child arrays are reused only after their RCU grace period.

Trie records are not contiguous, so stack_depot_fetch() remains hash-only.
The series adds stack_depot_fetch_into() for caller-owned storage and makes
stack_depot_print() and stack_depot_snprint() work with either backend.
Kmemleak, KMSAN, SLUB, and DRM use these interfaces. page_owner remains on
COUNTABLE hash records, and the GDB helper rejects trie handles.

Patch 1 fixes final-pool preallocation. Patches 2 through 9 prepare the
API, consumers, tooling, and architecture hooks. Patch 10 enables
trie-backed handles and adds a boot parameter that is disabled by
default. Patch 11 adds trie KUnit coverage. Trie handles do not become
reachable until all API and consumer changes are in place.

CPU cost
========

The benchmark was pinned to one CPU and inserted 32,768 distinct 32-frame
stacks on KASAN-enabled Linux 6.18.48. Within each group of 64 stacks, 75%
of the frames were shared and all frames were compressible. The insertion
order was shuffled, and the warm save-hit and fetch phases replayed the
stacks 32 times.

                         arm64 CPU ns/op         x86-64 CPU ns/op
                         hash       trie        hash         trie
Insertion                 777      9,417         792       11,269
Warm save hit             945      1,287         623        1,012
Fetch                     251        511         123          476

The main cost is first insertion, which was about 12 times slower on arm64
and 14 times slower on x86-64. A warm save hit was 1.4 to 1.6 times slower,
and fetch was 2 to 4 times slower.

Memory use
==========

I collected stack depot state from four live KASAN servers using the same
kernel revision, 4 KiB pages, and an 8,192-pool limit. The servers remained
active, so the values below are rounded.

                              arm64                 x86-64
                        trie off trie on      trie off trie on
Run time (hours)              61      64            65      67
Stored records              162k     87k          498k    217k
Registered pools           2,630     925         8,192   1,940
Pool budget used             32%     11%          100%     24%

The trie-enabled x86-64 machine used less than a quarter of the pool budget
while the trie-disabled machine reached the limit.

The machines ran different workloads and stored different stacks, so this
is not a controlled comparison. Exact memory savings depend on the
workload.

Stack use and limits
====================

Before this series, the KMSAN report path that prints an origin used 768
bytes of stack on x86-64 with Clang 19. RFC v1 increased it to 1,264
bytes. RFC v2 reuses KMSAN's existing scratch array and uses 752 bytes,
slightly less than the tree before this series.

RFC v1 also materialized as many as 256 frames on the stack. At that depth,
stack_depot_print() and stack_depot_snprint() used 2,072 and 2,104 bytes.
RFC v2 processes 16 frames at a time, reducing them to 184 and 200 bytes.
Kmemleak and the converted SLUB callers each add one fixed 16-frame array,
or 128 bytes on 64-bit systems. DRM uses the bounded snprint path without
adding a trace array.

A node's child array must fit in one pool. Each child represents a
different next frame after a shared prefix. For example, allocator stacks
can share the same initial frames and then diverge at many different call
sites. On a 4 KiB, 64-bit system, one node can hold 1,024 children. The
largest observed node had about 835 children. An insertion that would
add a 1,025th child fails; existing records remain valid.

Trie IDs use handle values left unused by the configured pool limit. With
64 KiB pages, the default stack_depot_max_pools value leaves no such handle
space. The limit must currently be lowered to enable the trie; otherwise
trie initialization fails and the hash backend remains available.

Testing
=======

I ran the common KUnit cases against both backends with a 64-frame maximum.
Trie-specific cases also ran at 8 and 256 frames, including a 64 KiB arm64
configuration. The tests cover public API behavior, each insertion shape,
old handles after topology changes, and compressed and full-width frames.

I also ran the patches with PROVE_LOCKING and KCSAN, ran KMSAN tests with
both backends, built with arm64 GCC and x86-64 Clang, and booted with the
trie disabled and enabled.

Questions
=========

I would particularly appreciate feedback on:

1. Is it acceptable for an NMI save to look up an existing trie record but
   return 0 for a new trace, while a non-NMI save that is not permitted to
   allocate gets one best-effort insertion attempt?

2. Is the roughly 12 to 14 times higher first-insertion cost acceptable for
   an optional backend, given the smaller cost for warm saves and fetches?

3. Should stack depot reserve some of stack_depot_max_pools for hash-backed
   GET and COUNTABLE records, or should both backends continue to share the
   limit on a first-come basis?

4. Is the 1,024-child limit acceptable for an initial implementation, or
   should child arrays be allowed to span multiple pools?

5. On 64 KiB systems, is requiring a lower stack_depot_max_pools value
   acceptable, or should trie IDs use a different handle encoding?

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
Changes in v2:
- Expanded the motivation with KASAN systems that exhausted the
  32,768-pool limit.
- Reordered the series so APIs, consumers, tooling, and architecture hooks
  are ready before trie handles become reachable.
- Added a best-effort insertion outside NMI for saves that are not
  permitted to allocate.
- Reduced trie allocator bitmap scans and added CPU benchmarks.
- Reduced KMSAN and stack depot printing stack use.
- Documented the shared pool budget, child limit, and 64 KiB handle limit.
- Expanded KUnit coverage for public APIs, insertion shapes, trace depths,
  and frame encoding.
- Link to v1: https://patch.msgid.link/20260817-stackdepot-trie-v1-0-53870ca1651b@cloudflare.com

---
Caleb Kan (11):
      stackdepot: stop preallocating after the final pool
      stackdepot: add caller-owned stack trace fetching
      mm/page_owner: preserve accounting with countable stack depot records
      mm/kmemleak: print trie-backed stack depot traces
      kmsan: report trie-backed stack depot traces
      mm/slub: materialize trie-backed stack depot traces
      drm/locking: preserve deadlock diagnostics for trie-backed stacks
      scripts/gdb: reject trie-backed stack depot handles
      stackdepot: add architecture hooks for compact frame storage
      stackdepot: share persistent stack prefixes with trie storage
      stackdepot: add KUnit tests for trie storage

 Documentation/admin-guide/kernel-parameters.txt |    7 +
 arch/arm64/include/asm/stackdepot.h             |   42 +
 arch/um/include/asm/Kbuild                      |    1 +
 arch/x86/include/asm/stackdepot.h               |   37 +
 drivers/gpu/drm/drm_modeset_lock.c              |    5 +-
 include/asm-generic/Kbuild                      |    1 +
 include/asm-generic/stackdepot.h                |   19 +
 include/linux/stackdepot.h                      |   83 +-
 lib/Kconfig.debug                               |   17 +
 lib/stackdepot.c                                | 1650 ++++++++++++++++++++++-
 lib/tests/Makefile                              |    1 +
 lib/tests/stackdepot_kunit.c                    |  582 ++++++++
 mm/kmemleak.c                                   |    4 +-
 mm/kmsan/kmsan_test.c                           |    4 +-
 mm/kmsan/report.c                               |   28 +-
 mm/page_owner.c                                 |    6 +-
 mm/slub.c                                       |   12 +-
 scripts/gdb/linux/stackdepot.py                 |    4 +
 18 files changed, 2454 insertions(+), 49 deletions(-)
---
base-commit: d118502628f8b673be9023db8bdf878f64a7ed45
change-id: 20260807-stackdepot-trie-2de15a2dcf97

Best regards,
--  
Caleb Kan <ckan@cloudflare.com>

