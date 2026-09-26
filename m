Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347E037EFE5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451618; cv=none; b=TEj5Xksx7awd3pawjLM9I13dM8Zi13KSypgkkAr/6JqF8OyAEKHdISn9Rd/lZlJRJ+lt1NebPJXGEqrHul6bmXgem23Tdj4rlgRyCTuC2q25Xkc+Gdlrzx0Gxa9vlsVdq5nEehQVIfV3Y4CFOqf0tPvafD8clyEMrvheY4Za6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451618; c=relaxed/simple;
	bh=OSINSMyFOeedO6ZrqROTPkBKxmtb5CoHcUyLQkCdwJM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b0MMtOQKuXuh1jMoaHejAu1FrwLRZiOwze4HCIPNVWGE4wVW6skvhvCB7AE4WGBU45yI1SQxq8pLZm0MysvXPkFWm3V98UvjV/KD4ClVoD+3UkZx1gf8QZC+xF0KpnMJGG+GpdNSYIJP2B27My/oeCtHbwE65FH5dPZPKarm708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kH9+40YD; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kH9+40YD"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6d7a52c9d62so165782eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790451616; x=1791056416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CAdE4jpwNTj11WAhE2pjyq7b0zOjoxgSwK0L+TfYZpE=;
        b=kH9+40YDiCpwUfH0VMZuR/gWefOpy6hW61y7F7Tk/pSnZWY9fhAf6a7GiNpmj/kawb
         ZhM3DNfwW6TfjaXkecSpdWnxdUY9ab5Yv3X8azCIpsl9F9axvTEGrWx6WKE7hSHIiSdB
         uI6cBk3Kd+i7gIm7Uuw/p9bJTr9AEjiOveNRPg7tRZ/OM/bck0cImurZlyGe0IQYrMHF
         xLwbveuJwvbQHusyAFkjjNvy0ftlH2JVUJCJoQBtxmQH+JDwISj/fU9d1Sjo+J/vsB/r
         tUWLYwXq9WD80nRWYe6HrhAneE075jDfY64RVImISMPr6leOzPx2aPNAkVdDrlxYqT+L
         LKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451616; x=1791056416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CAdE4jpwNTj11WAhE2pjyq7b0zOjoxgSwK0L+TfYZpE=;
        b=2tzaBWOilKCRlXxTCrLiqz01YD3tOaPTDQt9ZbCjiGAXZdcI0L8IfUbi8h+3kiWr1x
         X+jZXNPLOexnFyf7jrsxbbN7Mztwc9Iy0Y46E14LYf3mPm/b2f/heQ4OpBbsCpAZICM5
         DXAOO8LCCI5D8QgW7UdJwWSMfjeTyThjLE/SO3KMquVxnX2cllgVljXVC/fdeZFE/mPT
         nQ3D1sny7uwqmhEkleF1L/h7iCAIZFKEilb4IRb9g5CfcV28x8bVzSLEaG7fA/yxXkUP
         x7M2l8n/iVYmIYpNNRfPRRpaRBYQ0kVbbizJp21PJSuyyfBqYMIleWRphc780SE1w00+
         D3rA==
X-Forwarded-Encrypted: i=1; AKwUvBz23yTOGajc2Vljmzpi7Duw7O9dbgDdE88yeVvliOYg8CPzpTU0R4t1sLq9eUpTG6c0976zo/OA2PPmL0U=@vger.kernel.org
X-Gm-Message-State: AFuF++krktyjlmrUK6cAqGQQJRZo/bAIFO3y8RK+ZsRoveYGnFCEzZvh
	bMJ6OMpUYtvexz1/JttlSivbgLo2Il0UjDgBI+Zay/YcmU79dsMRBhWD
X-Gm-Gg: AYBFou0ampSIOakBM/l675F9ZEhyLvK5sfbl2feOD/MveJuJlps3GbZwgK/S3SQfbEf
	U+fzHTlwcVtGrEBWfkSNVJFOJxQiyWyRVaC5Gi/+cFc15eQRH0kWHu6vSmAzh1j/bTjikTXZdFh
	wBkhHLdM+Bs1ddz6fiHTvSUmxyI3C1+Fr5r9deITEr/WhWy8RiU4gkQIxYKSXmSqyuTGSh/eHaP
	wVXcXEf9hYdGDn5u7nwYlnbKkH5ibVaQg17ALYekQOdgijNega1bUbJ33JBV6affG5BDEiW+Xre
	VkwLNYP2dCkB9VG6+U3/aMztuzyNAyr/wOG3KtEg5YNKrtWxrT4O116FX5cBvSsJomqVT0uTU3o
	1EHyI53bsaq4fJgQ2nw6XZlKEWy3PsN9UB5Npc4Vvq3wBIXo3/cfwbFvTLXEFIXS8qHDo4TLCk4
	K1EM9pGsLLfbz4n2XepRno/1ApUFBcpsEmcQm6IxYHZAC6czWQkzyxd34Z+bA34inWsjRQIKlg6
	ZsGzmYBXdYTYhX2h/YCLW8lZVvuplW3EG3DSEEFHwNbkGazgvzuWHxYriK1eFPORpVQcOth5NrT
	GqFX3T0xVF2r0A4HW7YA/xdgCwwcvQ==
X-Received: by 2002:a05:6820:625:b0:6d8:5491:3752 with SMTP id 006d021491bc7-6d854913f2bmr298494eaf.46.1790451615962;
        Sat, 26 Sep 2026 12:40:15 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-49335011458sm5955595fac.4.2026.09.26.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:40:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 0/3] kallsyms: Accelerate symbol name lookups by ~7x
Date: Sat, 26 Sep 2026 13:40:11 -0600
Message-Id: <20260926-ksyms-tune-v6-0-236620c65e98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNwU7DMAzG8VeZciYotpO24cR7IA4m8bYI2qJmV
 ExT3x1vp65ix8/S7++LqTIVqeZldzGTzKWWcdDRPO1MOvJwEFuyboMOGxch2s967qs9/QxiBZE
 95o4J2Cj4nmRffm+xt3fdx1JP43S+tWe4Xv/NzGCdzV1Isc0MTPh66Ll8PaexN9fMjCuKeEdRK
 RORCIFwareUHlNS2nT6zwu7kOOW+sfUK43ISbjzHxFgS8OahjsalMK+DZxdIoS0psuy/AF0BsG
 HkAEAAA==
X-Change-ID: 20260919-ksyms-tune-e22a42d8a31a
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790451613; l=7906;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=OSINSMyFOeedO6ZrqROTPkBKxmtb5CoHcUyLQkCdwJM=;
 b=80JfYp39IgvK2tSs0oLXyMGtssDmLgEUSDKDIpWZ4X4SB1y5aaBbeB9n+QU5l4we0EtLgnaO9
 WaV/h3wcKwjCbKWjvg9NX0q8mSmyB8DI7Rs7PenTCF/uJ3wOGZiF7QV
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

As measured by kernel/kallsyms_selftest across ~184k symbols,
kallsyms_lookup_names() binary search takes ~6.1 us per lookup due to
two inner-loop costs:

0. Candidate symbols are fully decompressed into a 512-byte stack buffer
   before calling strcmp(), even though non-matching steps could choose on the
   first differing character (0..N-1).

1. Probes scan sequentially from 256:1 markers in kallsyms_names[],
   decoding an average of 127.5 symbols per probe (~2,170 hops across a
   17-step search).

This 3-patch series addresses both:

0. Patch 1 introduces kallsyms_strcmp_symbol() to compare ASCII queries
   against compressed tokens on the fly, bailing out on first mismatch.
   Drops the 512-byte stack buffer and saves ~530 ns.

1. Patch 2 increases marker density from 256:1 to 16:1, cutting average
   scan distance from 127.5 to 7.5 hops and dropping lookup latency from
   6,102 ns to 866 ns for +42.2 KiB of .rodata.

2. Patch 3 inlines and unrolls get_symbol_seq() 24-bit reconstruction.

Results (kernel/kallsyms_selftest across ~184k symbols):
- Baseline (256:1):  6,102 ns
- Patch 1 (strcmp):  5,572 ns (-530 ns)
- Patch 2 (16:1):      866 ns (7.0x faster)
- Memory: +42.2 KiB .rodata, 0 bytes dynamic RAM

What's Unchanged:
- Symbol table layout in address order remains identical.
- Streaming decompression for /proc/kallsyms and sprint_symbol() is
  untouched.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v6:
- In patch 1, clarify token matching mechanics and early exit on char
  0..N-1; cite CONFIG_KALLSYMS_SELFTEST across all ~184k symbols for the
  ~530 ns measurement (addresses BPF CI review).
- In patch 1, drop 0-2 list and fix repeated word typo ("the the").
- In patch 2, recast commit body around kallsyms storage trade-offs and
  drop hunk-by-hunk numbered list (addresses BPF CI review).
- In patch 2, drop 0.002% percentage claim and state absolute .rodata
  cost (+42 KiB for ~184k symbols).
- In patch 2, drop ephemeral benchmark comment from
  kernel/kallsyms_internal.h (addresses BPF CI review).
- Link to v5: https://lore.kernel.org/r/20260925-ksyms-tune-v5-0-1f75ad0c321c@gmail.com

Changes in v5:
- Dismiss dynamic 1:1 batch table as unnecessary:
  In v2-v4, a dynamic u32 lookup index allocated in transient RAM was
  explored.  While dynamic 1:1 breaks even against baseline 256:1 after
  ~1,200 queries, comparing dynamic 1:1 against static 16:1 markers
  dismisses the dynamic approach entirely:
  * Static 16:1 markers achieve 866 ns, capturing 97.4% of the maximum
    latency savings of a 1:1 table (an 85.8% reduction from baseline).
  * Dynamic 1:1 gains only an incremental 138 ns (the remaining 2.6%),
    while paying ~6,419 us in allocation setup and synchronize_rcu()
    teardown.
  * Amortizing 6,419 us at 138 ns saved requires 46,514 queries just to
    break even against 16:1 markers.  For any workload under 46k
    queries, dynamic allocation is slower overall.
  * Drop kallsyms_lookup_batch_start/end APIs, mutexes, refcounts,
    transient kvmalloc RAM allocations, and RCU synchronization.
- Drop lib/test_kallsyms_perf benchmark module and
  CONFIG_TEST_KALLSYMS_PERF; existing in-tree CONFIG_KALLSYMS_SELFTEST
  already benchmarks standard kallsyms_lookup_name() without adding
  unmaintained test files in lib/.
- In patch 2, increase marker density to 16:1 via
  KALLSYMS_MARKER_SHIFT 4 shared between scripts/kallsyms.c and
  kernel/kallsyms_internal.h, and drop all references to dynamic tables
  from the patch body.
- Link to v4: https://lore.kernel.org/r/20260922-ksyms-tune-v4-0-92acea84b911@gmail.com

Changes in v4:
- In patch 1, ignore early boot invocations in param_set_trigger() when
  system_state < SYSTEM_RUNNING to prevent NULL pointer dereference in
  ktime_get_ns() prior to timekeeping_init() (addresses Sashiko review).
- In patch 1, prevent sysfs TOCTOU divide-by-zero panic: reject
  num_iters == 0 in param setter, snapshot iters locally via READ_ONCE,
  and serialize runs with bench_lock mutex (addresses Sashiko review).
- In patch 1, eliminate multi-second boot stall: add run_on_boot
  parameter (default false) so late_initcall only runs benchmark when
  explicitly requested (addresses Sashiko review).
- In patch 1, chunk lookup loops in 4096-iter batches with
  cond_resched() outside the timing bracket to prevent preemption sleep
  time from inflating reported latency (addresses Sashiko review).
- In patch 3, annotate dyn_kallsyms_offsets declaration with __rcu to
  satisfy sparse type checking and prevent address-space warnings across
  rcu_assign_pointer() and rcu_dereference() (addresses Sashiko review).
- In patch 3, use rcu_replace_pointer() with lockdep_is_held() during
  batch teardown to atomically read and clear the pointer while
  satisfying sparse address-space constraints (addresses Sashiko
  review).
- Link to v3: https://lore.kernel.org/r/20260922-ksyms-tune-v3-0-681a34ea05d9@gmail.com

Changes in v3:
- Reorder series: place on-the-fly token matching ahead of marker
  density optimization, establishing an active proof of incremental
  performance deltas across all steps (addresses David Laight review).
- Add inlined and unrolled get_symbol_seq() 24-bit sequence index
  reconstruction into direct byte shifts (addresses David Laight
  review).
- In test_kallsyms_perf, configure as a built-in test (bool) rather
  than a module (tristate) and drop kallsyms iterator EXPORT_SYMBOL_GPL
  exports to avoid exposing internal kernel symbol data (addresses
  Sashiko review).
- In patch 1, optimize kallsyms_strcmp_symbol() by dropping
  skipped_first tracking and checking len at the bottom of the token
  loop (addresses David Laight review).
- Drop 'default m' from lib/Kconfig.debug.
- Fix soft lockup risks by adding cond_resched() every 16k iterations in
  test_kallsyms_perf loops.
- Replace direct 64-bit integer divisions with div_u64() to fix 32-bit
  builds.
- Guard against divide-by-zero when num_iters=0.
- Replace tcp_v4_rcv with panic in hit_symbols to prevent failures wo
  CONFIG_INET.
- Move David Laight to series-wide Cc on cover letter, dropping trailer
  from patch 3.
- Link to v2: https://lore.kernel.org/r/20260922-ksyms-tune-v2-0-a333ee31eac7@gmail.com

Changes in v2:
- Replaced static build-time 3-byte offset table with a dynamic u32
  index bracketed by kallsyms_lookup_batch_start() and
  kallsyms_lookup_batch_end().
- Dropped .rodata image footprint addition from +573 KiB to 0 KiB,
  addressing Kees Cook's memory footprint objection.
- Native u32 loads in transient RAM eliminate 24-bit big-endian shifts
  and unaligned loads, addressing David Laight's endianness critique.
- Direct O(1) table indexing provides 0 hops for all symbol lookups
  without remainder logic or odd/even branching.
- Restored scripts/kallsyms.c and kernel/kallsyms_internal.h to pristine
  state, leaving legacy kallsyms_markers[] as safety fallback.
- Rebased out Lorenzo Stoakes' kbuild series; this series is now
  completely decoupled and applies cleanly directly onto mainline.
- Link to v1: https://lore.kernel.org/r/20260919-ksyms-tune-v1-0-d85c97da1a32@gmail.com

---
Jim Cromie (3):
      kallsyms: Match compressed tokens on the fly during binary search
      kallsyms: Increase marker density to 16:1 to accelerate lookups
      kallsyms: Unroll 24-bit sequence reconstruction in get_symbol_seq()

 kernel/kallsyms.c          | 111 +++++++++++++++++++++++++++------------------
 kernel/kallsyms_internal.h |  11 +++++
 scripts/kallsyms.c         |  14 ++++--
 3 files changed, 86 insertions(+), 50 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260919-ksyms-tune-e22a42d8a31a

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>

