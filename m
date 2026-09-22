Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BF43BE627
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102773; cv=none; b=XJ+wSVwy5GXVuWySc516px13ACZop7u2+v2eFU7teGvkz5e/ZCiuVfzXxJAOLJ1yhm4r/11kt+ECyHziHrHnhOVMT8EsrqBdoXpamonsvqZNDVbRR3VgT8l7XMVn3Tnx0KVysOFd4XjhCOVZCSEDyIrNSbsJ3zwf2IbyfBC8884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102773; c=relaxed/simple;
	bh=oAENUtHNZGzOjoVpDfIN16vMYj0LR5VAUfLomF6ACKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kmoeKtMMEb7427N/i/2dnSwfvZs2fXhi3y72ihfgPBu+TBv0s6KF9wYStjCg7dL+mYO/gDpwQx2yt1xMYoe8ox4qgk+/OYIv6y+JfqrL6e1Ls2jlIpX8evVEhDmI6W3bMAeFmsvlfctjtbGj+HKr/dCumTMiBNQ3TauKmQCaN1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdQx9Jmt; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdQx9Jmt"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37dcfe9b2so114300b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790102763; x=1790707563; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gB5tOgoEaFDK8N9Ks2VO0xH4kl9YCg+Zqnb1wxNdK4o=;
        b=MdQx9Jmt6IN3CMBqSdoSxdlZWxuyZqSbMSC7x33fdBCxb8QzzS++u8jOpr+IV926IS
         0l3QIAy9JH7HFhRk1Ksz0q4BpLSf1ASL4wwocAhZQx10u83H1Qr4l6waIGTARglyMfHB
         WZlqmv8XaoPhnuuJ2V2SjXzf2Xqvj+W1u/p23QrlcXCh8Ea83Z7LBNRxgH+9dAUXpCeU
         RWkoy62Gr6io8Az9Hi9obgeS6T4AJDyzwBCYKWbQ89XKoKeoH69kQC02oMaTm2eXKYJm
         rwmA4lX9p/ekog/D0SVsbr233GZ6YYKIXxiB2I0zCfufO5+eaxJ3PScjnvSSUd/rXhIM
         mFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102763; x=1790707563;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gB5tOgoEaFDK8N9Ks2VO0xH4kl9YCg+Zqnb1wxNdK4o=;
        b=RfO5UDzxMCXWKUc/7ddp2wUo3ZE0566By+REVnuNu8ltuJ3o2eENJ95sU1Rkh0qKC7
         UCyZqb4JWNmCLcM0O/loXs8f8DBhPhwUp+fiX8xUrzBii6+A4MgCQpQeUtEz9hB+gOpC
         81/tM1S77W4cpdvqzulR2hR/ndqYpfu6hgIU9DO6hsRs0T4YyUMX5fK60fBWr0OYF+wt
         /42gUu4NAZpB2Pu/A+tkPMWtQV2Jm88IFyIYaRJQaLyCON0S4fbKxZlx3xyIWfavVkbQ
         qY252SxggLcoFpR8/UYy3uafJhn5JRVls2nAcW28m1ZD5vRsgWezqYsNVgWkxw+vu5BO
         cxrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzczJzHQXxUNhXsDiAmKEneHI+Dhe9MGydGgPt31I2MbFZAf4d9BI+bLiZFytX4LyCT9FhHg4Ez0SjrsP4=@vger.kernel.org
X-Gm-Message-State: AFuF++np1mVAJaXtJfMVhIQkirpi4tXCrjm4oIS0vVqL0psmlgYa1uwj
	v4OgJ1lvwcbaTiUEGnMCB1/z08uuZAAlFQw2cGt6ZmsmgFZrTRbvh1VS
X-Gm-Gg: AYBFou1YWbAXpJCfeSlT92bTs7pY0h44TMjYEyYn467Q2remPqwTLsVvtNob4DzYBcA
	S0E5XfI9VOroNHnCZRbsl3MA5cnw5etUB9vcPYBKho4eryMLdnJ37B+hr+n4xFfDL+0rAp6vk01
	od1cNVIHp4J1KZuBF9DMS60FldPdSCuNT5XNf8QxcKuWBOSCVQZYve0+DJEU4bRLXOG6Jn/JDm1
	04ip8/20fdvFodJwNhRsJmbC0wmTcJhH8LtO98Yni8S+QOckerSkn4JWR56M78oAgLeT2ZfHB24
	7b/6LTTbf+jcQR5ztV55YUW+MIUhB2Hoccx9C9pjsgO7C6gg/FMSAlmtgpsrKBfEhcG9h4AnBA3
	uoGQiCuiBCY5LYJLyB0oNcjggyZ7nvkyJB37NC////wKLVZ2ZNLoe3fuOZpqqN1YGksat7eNCBo
	tLHbUHPMMM+Gb0clR8jC/U1tThheFesbph610IYj+vO12OMbRCJO2AbzT0sponz4sfbZRYUkNmz
	fomWZlgFHqW5vs3O03vVJaWiLRynjGB9SwgqeAmEWLjzvcgzPiAia56QqPTA/plGxJ7jZ7olBoy
	Cw1nCfG8R5/cWfpoLKxPePHjQn9xlA==
X-Received: by 2002:a05:6808:3503:b0:4cb:f21b:6f88 with SMTP id 5614622812f47-4d5b8abd1e2mr295561b6e.27.1790102763080;
        Tue, 22 Sep 2026 11:46:03 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4d5c43a24bbsm147545b6e.7.2026.09.22.11.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:46:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 0/4] kallsyms: Accelerate symbol name lookups by ~19x
Date: Tue, 22 Sep 2026 12:45:54 -0600
Message-Id: <20260922-ksyms-tune-v3-0-681a34ea05d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQ6CMBCF4auQWVtDpyrgynsYF5N2hIkCpsVGQ
 ri7hRUmLt9Lvn+CwF44wDmbwHOUIH2XhtllYBvqalbi0gbM8ZRXulKPMLZBDe+OFSPSAV1JRhM
 k8PJ8l88au97SbiQMvR/XdtTL+zcTtcqVK4+2KhxpMnipW5Ln3vYtLJmIG4r4QzFRMsYwG81ki
 y2d5/kL3lDdG98AAAA=
X-Change-ID: 20260919-ksyms-tune-e22a42d8a31a
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790102761; l=8592;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=oAENUtHNZGzOjoVpDfIN16vMYj0LR5VAUfLomF6ACKo=;
 b=555/26vJQV0yHRiU1ZShyhlhooWSumRIT1vA0/yV9IKqp8/9Z4TH7YvoTNSb82vZ4vVeyZOBN
 EO6/WVaR3NqCfLNWXCwX6gI7T2AroXUwA9tow/HEVyP+PMZBHW4oIZO
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

kallsyms_lookup_names() resolves symbol names to addresses using a
17-step binary search over kallsyms_names[] (~184k symbols on x86_64).
At each step of the search, two bottlenecks compound to create
substantial lookup latency:

0. Redundant string expansion: kallsyms_expand_symbol() decompresses
   the entire candidate symbol into a 512-byte stack buffer (namebuf)
   before calling strcmp(), even though ~94% of binary search probes
   mismatch on the first 1-2 characters (~580 ns per lookup).

1. Marker scanning: get_symbol_offset() scans sequentially from the
   nearest 256-symbol marker in kallsyms_names[], decoding an average
   of ~128 ULEB128 record headers per probe (~2,176 header decodes,
   consuming ~3,230 ns per lookup).

Together, these bottlenecks impose a ~3.8 us latency penalty per hit and
~3.6 us per miss.

This 4-patch series eliminates both overheads in a structured
progression while keeping the symbol table strictly in sequential
address order and adding 0 bytes to .rodata:

0. Patch 1 adds lib/test_kallsyms_perf, a microbenchmark module built
   directly into vmlinux (CONFIG_TEST_KALLSYMS_PERF=bool) to benchmark
   unindexed vs dynamic indexed name searches, address resolution, and
   table iteration latency without exporting internal kallsyms iterators
   to loadable modules.

1. Patch 2 introduces kallsyms_strcmp_symbol() to compare ASCII queries
   against compressed tokens on the fly, bailing out on the first
   mismatched character without expanding subsequent tokens.  This drops
   the 512-byte namebuf buffer from the kernel stack and saves ~530 ns
   per lookup on unmodified marker infrastructure.

2. Patch 3 introduces a dynamic u32 lookup index bracketed by
   kallsyms_lookup_batch_start() and kallsyms_lookup_batch_end().
   It allocates ~736 KiB in transient RAM via kvmalloc_array() only
   while bulk workloads (BPF attach, module loading) run, resolves
   each probe in O(1) with 0 hops, and leaves .rodata bloat at exactly
   0 bytes while retaining kallsyms_markers[] as fallback.  Both
   test_kallsyms_perf and kallsyms_selftest are updated to benchmark
   batch resolution side-by-side.

3. Patch 4 inlines and unrolls get_symbol_seq() 24-bit sequence index
   reconstruction into direct byte shifts, eliminating loop overhead
   on inner binary search probes.

Live Microbenchmark Progression (via test_kallsyms_perf, 100k iters):

Metric                    Baseline (1)   Token Match (2)   Batch Index (3)   Total Speedup
------------------------------------------------------------------------------------------
Name Search Hit           3,811 ns       3,280 ns          246 ns            15.5x
Name Search Miss          3,625 ns       3,095 ns          196 ns            18.5x
sprint_symbol               412 ns         412 ns          412 ns            parity
sprint_symbol_no_offset     300 ns         300 ns          300 ns            parity
Table Full Walk           13,626 us      13,626 us       13,626 us           parity
Kernel stack buffer        512 B            0 B             0 B              -512 B

In-Tree Selftest Verification (CONFIG_KALLSYMS_SELFTEST, 184k symbols):

In addition to test_kallsyms_perf, the existing upstream selftest in
kernel/kallsyms_selftest.c was run across all 183,990 symbols on boot,
repeating all tests inside an active batch window:

Metric                          Unindexed (markers)    Batch Index (active)   Delta
-----------------------------------------------------------------------------------
kallsyms_lookup_name() (avg)    3,926 ns               675 ns                 5.8x faster
kallsyms_lookup_name() (min)      311 ns               171 ns                 1.8x faster
on_each_match_symbol()          3,507 ns             1,142 ns                 3.1x faster
kallsyms_on_each_symbol()       14.7 ms               15.5 ms                 parity
Basic function validation       PASS                  PASS                    100% correct
Batch setup (184k entries)       N/A                 1,037 us                 ~1.0 ms
Batch teardown (sync RCU)        N/A                 3,440 us                 ~3.4 ms

Address-to-name resolution (sprint_symbol) and sequential table walks
(/proc/kallsyms) remain completely unaffected, maintaining full L1/L2
hardware prefetching.

Memory footprint: +0 KiB .rodata added to kernel image.  Transient RAM
is ~736 KiB (184k * 4 bytes) allocated only during active batch
lookup sessions.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v3:
- Reorder series: place on-the-fly token matching (patch 2) ahead of
  dynamic batch lookup index (patch 3), establishing an active proof of
  incremental performance deltas across all steps (addresses David
  Laight review).
- Add patch 4: inline and unroll get_symbol_seq() 24-bit sequence index
  reconstruction into direct byte shifts (addresses David Laight
  review).
- In patch 1, configure CONFIG_TEST_KALLSYMS_PERF as a built-in test
  (bool) rather than a module (tristate) and drop kallsyms iterator
  EXPORT_SYMBOL_GPL exports to avoid exposing internal kernel symbol
  data (addresses Sashiko AI review).
- In patch 2, optimize kallsyms_strcmp_symbol() by dropping
  skipped_first tracking and checking len at the bottom of the token
  loop (addresses David Laight review).
- In patch 3, rely on get_symbol_data() helper introduced in patch 2 to
  preserve bisectability (addresses Sashiko AI review).
- In patch 3, fix use-after-free race on dyn_kallsyms_offsets: bracket
  table dereference and array read with rcu_read_lock() and replace
  rcu_dereference_raw() with rcu_dereference() inside
  get_symbol_offset() to protect external readers (lookup_symbol_name,
  kallsyms_lookup_buildid, reset_iter) against concurrent batch
  teardown (addresses Sashiko AI review).
- In patch 3, update kallsyms_selftest to add a second lookup pass
  bracketed by batch start/end to report batch latency in the in-tree
  selftest.
- Drop 'default m' from lib/Kconfig.debug.
- Fix soft lockup risks by adding cond_resched() every 16k iterations in
  test_kallsyms_perf loops.
- Replace direct 64-bit integer divisions with div_u64() to fix 32-bit
  builds.
- Guard against divide-by-zero when num_iters=0.
- Replace tcp_v4_rcv with panic in hit_symbols to prevent failures wo
  CONFIG_INET.
- Add batch lookup setup/teardown timing and query amortization
  break-even logging to test_kallsyms_perf.
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
- Updated test_kallsyms_perf to benchmark unindexed marker scans and
  dynamic index side by side in a single run.
- Link to v1: https://lore.kernel.org/r/20260919-ksyms-tune-v1-0-d85c97da1a32@gmail.com

---
Jim Cromie (4):
      kallsyms: Add test_kallsyms_perf module to benchmark lookup latency
      kallsyms: Match compressed tokens on the fly during binary search
      kallsyms: Add dynamic lookup index for batch resolution
      kallsyms: Unroll 24-bit sequence reconstruction in get_symbol_seq()

 include/linux/kallsyms.h   |  13 +++
 kernel/kallsyms.c          | 213 ++++++++++++++++++++++++++--------
 kernel/kallsyms_selftest.c |  16 +++
 lib/Kconfig.debug          |  10 ++
 lib/Makefile               |   1 +
 lib/test_kallsyms_perf.c   | 281 +++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 488 insertions(+), 46 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260919-ksyms-tune-e22a42d8a31a

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>

